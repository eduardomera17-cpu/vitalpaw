import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

// Función auxiliar para validar si el que llama tiene permisos
async function checkAdmin(context: functions.https.CallableContext) {
    if (!context.auth) {
        throw new functions.https.HttpsError('unauthenticated', 'El usuario debe estar autenticado.');
    }
    const uid = context.auth.uid;
    const userDoc = await admin.firestore().collection('users').doc(uid).get();
    if (!userDoc.exists) {
        throw new functions.https.HttpsError('permission-denied', 'Usuario no encontrado en BD.');
    }
    const role = userDoc.data()?.role;
    if (role !== 'admin' && role !== 'staff') {
        throw new functions.https.HttpsError('permission-denied', 'Sólo administradores o staff pueden realizar esta acción.');
    }
}

export const adminCreateUser = functions.https.onCall(async (data, context) => {
    await checkAdmin(context);

    const { email, password, displayName, role } = data;
    if (!email || !password || !displayName || !role) {
        throw new functions.https.HttpsError('invalid-argument', 'Faltan parámetros (email, password, displayName, role).');
    }

    try {
        // 1. Crear usuario en Firebase Auth
        const userRecord = await admin.auth().createUser({
            email,
            password,
            displayName,
        });

        // 2. Guardar datos en Firestore
        const payload = {
            id: userRecord.uid,
            firebaseUid: userRecord.uid,
            email: email,
            displayName: displayName,
            role: role,
            isEmailVerified: false,
            createdAt: admin.firestore.FieldValue.serverTimestamp(),
            isActive: true
        };

        await admin.firestore().collection('users').doc(userRecord.uid).set(payload);
        return { success: true, uid: userRecord.uid };
    } catch (error: any) {
        throw new functions.https.HttpsError('internal', error.message || 'Error al crear usuario.');
    }
});

export const adminUpdateUser = functions.https.onCall(async (data, context) => {
    await checkAdmin(context);

    const { uid, email, password, displayName, role } = data;
    if (!uid) throw new functions.https.HttpsError('invalid-argument', 'Falta el UID del usuario.');

    try {
        // Actualizar Firebase Auth
        const authPayload: any = {};
        if (displayName) authPayload.displayName = displayName;
        if (password) authPayload.password = password;
        if (email) authPayload.email = email;
        
        if (Object.keys(authPayload).length > 0) {
            await admin.auth().updateUser(uid, authPayload);
        }

        // Actualizar Firestore
        const dbPayload: any = {};
        if (displayName) dbPayload.displayName = displayName;
        if (role) dbPayload.role = role;
        if (email) dbPayload.email = email;

        if (Object.keys(dbPayload).length > 0) {
            await admin.firestore().collection('users').doc(uid).update(dbPayload);
        }

        return { success: true };
    } catch (error: any) {
        throw new functions.https.HttpsError('internal', error.message || 'Error al actualizar usuario.');
    }
});

export const adminDisableUser = functions.https.onCall(async (data, context) => {
    await checkAdmin(context);

    const { uid } = data;
    if (!uid) throw new functions.https.HttpsError('invalid-argument', 'Falta el UID del usuario.');

    // Evitar que el admin se borre a sí mismo
    if (uid === context.auth?.uid) {
        throw new functions.https.HttpsError('invalid-argument', 'No puedes deshabilitar tu propia cuenta.');
    }

    try {
        // Soft Delete: Deshabilitar en Auth
        await admin.auth().updateUser(uid, { disabled: true });

        // Marcar como inactivo en Firestore
        await admin.firestore().collection('users').doc(uid).update({ isActive: false });

        return { success: true };
    } catch (error: any) {
        throw new functions.https.HttpsError('internal', error.message || 'Error al deshabilitar usuario.');
    }
});

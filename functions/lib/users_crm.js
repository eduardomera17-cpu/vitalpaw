"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.adminDisableUser = exports.adminUpdateUser = exports.adminCreateUser = void 0;
const functions = require("firebase-functions");
const admin = require("firebase-admin");
// Función auxiliar para validar si el que llama tiene permisos
async function checkAdmin(context) {
    var _a;
    if (!context.auth) {
        throw new functions.https.HttpsError('unauthenticated', 'El usuario debe estar autenticado.');
    }
    const uid = context.auth.uid;
    const userDoc = await admin.firestore().collection('users').doc(uid).get();
    if (!userDoc.exists) {
        throw new functions.https.HttpsError('permission-denied', 'Usuario no encontrado en BD.');
    }
    const role = (_a = userDoc.data()) === null || _a === void 0 ? void 0 : _a.role;
    if (role !== 'admin' && role !== 'staff') {
        throw new functions.https.HttpsError('permission-denied', 'Sólo administradores o staff pueden realizar esta acción.');
    }
}
exports.adminCreateUser = functions.https.onCall(async (data, context) => {
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
    }
    catch (error) {
        throw new functions.https.HttpsError('internal', error.message || 'Error al crear usuario.');
    }
});
exports.adminUpdateUser = functions.https.onCall(async (data, context) => {
    await checkAdmin(context);
    const { uid, email, password, displayName, role } = data;
    if (!uid)
        throw new functions.https.HttpsError('invalid-argument', 'Falta el UID del usuario.');
    try {
        // Actualizar Firebase Auth
        const authPayload = {};
        if (displayName)
            authPayload.displayName = displayName;
        if (password)
            authPayload.password = password;
        if (email)
            authPayload.email = email;
        if (Object.keys(authPayload).length > 0) {
            await admin.auth().updateUser(uid, authPayload);
        }
        // Actualizar Firestore
        const dbPayload = {};
        if (displayName)
            dbPayload.displayName = displayName;
        if (role)
            dbPayload.role = role;
        if (email)
            dbPayload.email = email;
        if (Object.keys(dbPayload).length > 0) {
            await admin.firestore().collection('users').doc(uid).update(dbPayload);
        }
        return { success: true };
    }
    catch (error) {
        throw new functions.https.HttpsError('internal', error.message || 'Error al actualizar usuario.');
    }
});
exports.adminDisableUser = functions.https.onCall(async (data, context) => {
    var _a;
    await checkAdmin(context);
    const { uid } = data;
    if (!uid)
        throw new functions.https.HttpsError('invalid-argument', 'Falta el UID del usuario.');
    // Evitar que el admin se borre a sí mismo
    if (uid === ((_a = context.auth) === null || _a === void 0 ? void 0 : _a.uid)) {
        throw new functions.https.HttpsError('invalid-argument', 'No puedes deshabilitar tu propia cuenta.');
    }
    try {
        // Soft Delete: Deshabilitar en Auth
        await admin.auth().updateUser(uid, { disabled: true });
        // Marcar como inactivo en Firestore
        await admin.firestore().collection('users').doc(uid).update({ isActive: false });
        return { success: true };
    }
    catch (error) {
        throw new functions.https.HttpsError('internal', error.message || 'Error al deshabilitar usuario.');
    }
});
//# sourceMappingURL=users_crm.js.map
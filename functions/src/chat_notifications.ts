import * as admin from 'firebase-admin';
import * as functions from 'firebase-functions';

export const onNewChatMessage = functions.firestore
  .document('chats/{roomId}/messages/{messageId}')
  .onCreate(async (snap, context) => {
    const message = snap.data();
    const roomId = context.params.roomId;

    // Si el remitente es el cliente, notificar al Staff. 
    // Si el remitente es el Staff, notificar al cliente (roomId = clientId).
    const isFromClient = message.senderRole === 'client';
    const topic = isFromClient ? 'staff_alerts' : `client_${roomId}`;

    let bodyText = 'Nuevo mensaje';
    if (message.type === 'text') {
      bodyText = message.content;
    } else if (message.type === 'image') {
      bodyText = '📷 Archivo adjunto';
    } else if (message.type === 'product_card') {
      bodyText = '🛍️ Ficha de producto enviada';
    } else if (message.type === 'animal_card') {
      bodyText = '🐾 Ficha de mascota enviada';
    }

    const payload = {
      notification: {
        title: isFromClient ? 'Nuevo mensaje de cliente' : 'Respuesta de Pet Shop',
        body: bodyText,
      },
      data: {
        click_action: 'FLUTTER_NOTIFICATION_CLICK',
        roomId: roomId,
        type: 'chat_message'
      }
    };

    try {
      await admin.messaging().sendToTopic(topic, payload);
      console.log(`Notification sent to topic: ${topic}`);
    } catch (error) {
      console.error('Error sending notification:', error);
    }
  });

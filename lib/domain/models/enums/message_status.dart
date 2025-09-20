enum MessageStatus {
  sent,      // Enviada pelo app, mas não confirmada pelo servidor
  delivered, // Confirmada pelo servidor e entregue ao destinatário
  read,      // Lida pelo destinatário
}
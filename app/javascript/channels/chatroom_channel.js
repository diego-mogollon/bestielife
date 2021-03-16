import consumer from "./consumer"

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    window.scrollTo(0,document.body.scrollHeight);
    const id = messagesContainer.dataset.chatroomId;
    console.log("test console log");
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data.sender_id); // called when data is broadcast in the cable
        console.log(messagesContainer.dataset.currentUserId)
        if (data.sender_id !== messagesContainer.dataset.currentUserId ) {
        messagesContainer.insertAdjacentHTML('beforeend', data.partial)
        const messageContent = document.getElementById('message_content');
        messageContent.value = "";
        window.scrollTo(0,document.body.scrollHeight);
        }
        else {
          location.reload(true);
        }

      },
    });
  }
}
export { initChatroomCable };

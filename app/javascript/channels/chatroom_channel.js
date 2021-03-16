import consumer from "./consumer"

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data)
        const messageContent = document.getElementById('message_content');
        messageContent.value = "";
        window.scrollTo(0,document.body.scrollHeight);
        location.reload ();
      },
    });
  }
}
export { initChatroomCable };

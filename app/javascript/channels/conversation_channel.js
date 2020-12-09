import consumer from "./consumer";
import { anchor } from "../plugins/anchor"

const initConversationCable = () => {
  const messagesContainer = document.getElementById('conversation-content');
  if (messagesContainer) {
    const id = messagesContainer.dataset.conversationId;

    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {
      received(data) {
        const currentUserId = messagesContainer.dataset.userId
        messagesContainer.insertAdjacentHTML('beforeend', data);
        const messages = document.querySelectorAll('.message');
        let lastMessage = messages[messages.length - 1];
        const senderId = lastMessage.dataset.senderId;
        if (lastMessage.classList.contains("author") === false ) {
          if (senderId === currentUserId) {
            lastMessage.classList.add("author");
            lastMessage.classList.remove("d-none");
            messagesContainer.scrollTop = 10000000000;
          } else {
            lastMessage.classList.add("receiver");
            lastMessage.classList.remove("d-none");
            messagesContainer.scrollTop = 10000000000;
          };
        };
      },
    });
  };
}

export { initConversationCable };

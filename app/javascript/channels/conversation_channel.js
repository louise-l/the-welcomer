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
        const lastMessage = messages[messages.length - 1];
        console.log(lastMessage);
        const senderId = lastMessage.dataset.senderId;
        if (senderId === currentUserId) {
          lastMessage.classList.add("author");
          lastMessage.classList.remove("d-none");
        } else {
          lastMessage.classList.add("receiver");
          lastMessage.classList.remove("d-none");
        }
      },
    });
  };
}

export { initConversationCable };

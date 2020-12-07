const anchor = () => {
  const conversationContent = document.getElementById("conversation-content");
  if (conversationContent) {
    const message = document.querySelectorAll(".message");
    location.hash = `#message-${message.length}`
  };
}

export { anchor };
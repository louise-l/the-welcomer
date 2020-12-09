const showUsers = () => {
	const conversationButton = document.querySelector(".fa-comment");
	const grid = document.getElementById('grid');
	const yieldPage = document.getElementById('yield-page')
	const usersList = document.getElementById("users-list");

	if (conversationButton) {
		conversationButton.addEventListener('click', () => {
			if (usersList.classList.contains('d-none')) {
				grid.classList.add("row");
				yieldPage.classList.add("col-10");
				usersList.classList.remove('d-none')
			} else {
				grid.classList.remove("row");
				yieldPage.classList.remove("col-10");
				conversationButton.classList.remove("d-none");
				usersList.classList.add("d-none");
			}
		});
	}
};

const arrayConversationsOpened = ["0", "1", "2"]

const closeConversation = (index) => {
	const closeSymbol = document.getElementById(`remove-conversation-${index}`)
	const conversationDiv = document.querySelector(`.conversation-js-${index}`)
	closeSymbol.addEventListener('click', () => {
		if (arrayConversationsOpened.includes("0") === false && arrayConversationsOpened.includes("1") === true && arrayConversationsOpened.includes("2") === true) {
			conversationDiv.remove();
			arrayConversationsOpened[0] = "0";
		} else if (arrayConversationsOpened.includes("0") === false && arrayConversationsOpened.includes("1") === false && arrayConversationsOpened.includes("2") === true) {
			conversationDiv.remove();
			if (index === "1") {
				arrayConversationsOpened[0] = "0";
			} else {
				arrayConversationsOpened[1] = "1";
			}
		} else if (arrayConversationsOpened.includes("0") === false && arrayConversationsOpened.includes("1") === false && arrayConversationsOpened.includes("2") === false) {
			conversationDiv.remove();
			if (index === "1") {
				arrayConversationsOpened[0] = "0";
			} else if ( index === "2") {
				arrayConversationsOpened[1] = "1";
			} else {
				arrayConversationsOpened[2] = "2";
			}
		} else if (arrayConversationsOpened.includes("0") === true && arrayConversationsOpened.includes("1") === false && arrayConversationsOpened.includes("2") === false) {
			conversationDiv.remove();
			if (index === "2") {
				arrayConversationsOpened[1] = "1";
			} else {
				arrayConversationsOpened[2] = "2";
			}
		} else if (arrayConversationsOpened.includes("0") === true && arrayConversationsOpened.includes("1") === true && arrayConversationsOpened.includes("2") === false) {
			conversationDiv.remove();
			arrayConversationsOpened[2] = "2";
		} else if (arrayConversationsOpened.includes("0") === false && arrayConversationsOpened.includes("1") === true && arrayConversationsOpened.includes("2") === false) {
			conversationDiv.remove();
			if (index === "1") {
				arrayConversationsOpened[0] = "0";
			} else {
				arrayConversationsOpened[2] = "2";
			}
		} else if (arrayConversationsOpened.includes("0") === true && arrayConversationsOpened.includes("1") === false && arrayConversationsOpened.includes("2") === true ) {
			conversationDiv.remove();
			arrayConversationsOpened[1] = "1";
		}
	});
};

const reduceConversation = (index, className) => {
	const conversation = document.querySelector(`.conversation-js-${index}`);
	const page = document.getElementById(`${className}`);
	const elementReduce = document.getElementById(`collapse-conversation-${index}`);
	elementReduce.addEventListener('click', () => {
		if (conversation.classList.contains('reduce')) {
			conversation.classList.remove('reduce');
			elementReduce.classList.remove('fa-plus');
			elementReduce.classList.add('fa-minus');
			page.classList.remove('d-none');
		} else {
			page.classList.add('d-none');
			conversation.classList.add('reduce');
			elementReduce.classList.remove('fa-minus');
			elementReduce.classList.add('fa-plus');
		}
	});
};

const addConversation = () => {
	const user = document.querySelectorAll(".conversations-menu-user");
	
	user.forEach((user) => {
		user.addEventListener("click", () => {
			const name = user.dataset.conversationName;
			if (arrayConversationsOpened.includes(user.innerHTML) === false && arrayConversationsOpened[0] === "0") {
			arrayConversationsOpened[0] = user.innerHTML;
			const body = document.body
			body.insertAdjacentHTML("beforeend", `
			<div class="conversation-js-1">
				<div class="conversation-js-title">
					${user.innerHTML}
					<div>
						<i class="fas fa-minus" id="collapse-conversation-1"></i>
						<i class="fas fa-times" id="remove-conversation-1"></i>
					</div>
				</div>
				<div class="mt-2 mx-3" style="height: 90%;" id="${name}">
				</div>
			</div>`)
			function load_home() {
				document.getElementById(`${name}`).innerHTML=`<object type="text/html" data="/companies/The-Welcomer/conversations/window/${name}" width="100%" height="100%" ></object>`;
			};
			 load_home();
			 closeConversation("1");
			 reduceConversation("1", user.innerHTML);
			} else if (arrayConversationsOpened.includes(user.innerHTML) === false && arrayConversationsOpened[1] === "1") {
				arrayConversationsOpened[1] = user.innerHTML;
				const body = document.body
				body.insertAdjacentHTML("beforeend", `
				<div class="conversation-js-2">
					<div class="conversation-js-title">
						${user.innerHTML}
						<div>
							<i class="fas fa-minus" id="collapse-conversation-2"></i>
							<i class="fas fa-times" id="remove-conversation-2"></i>
						</div>
					</div>
					<div class="mt-2 mx-3" style="height: 90%;" id="${name}">
					</div>
				</div>`)
				function load_home() {
					document.getElementById(`${name}`).innerHTML=`<object type="text/html" data="/companies/The-Welcomer/conversations/window/${name}" width="100%" height="100%" ></object>`;
				};
				 load_home();
				 closeConversation("2");
				 reduceConversation("2", user.innerHTML);
			} else if (arrayConversationsOpened.includes(user.innerHTML) === false && arrayConversationsOpened[2] === "2") {
				arrayConversationsOpened[2] = user.innerHTML;
				const body = document.body
				body.insertAdjacentHTML("beforeend", `
				<div class="conversation-js-3">
					<div class="conversation-js-title">
						${user.innerHTML}
						<div>
							<i class="fas fa-minus" id="collapse-conversation-3"></i>
							<i class="fas fa-times" id="remove-conversation-3"></i>
						</div>
					</div>
					<div class="mt-2 mx-3" style="height: 90%;" id="${name}">
					</div>
				</div>`)
				function load_home() {
					document.getElementById(`${name}`).innerHTML=`<object type="text/html" data="/companies/The-Welcomer/conversations/window/${name}" width="100%" height="100%" ></object>`;
				};
				 load_home();
				 closeConversation("3");
				 reduceConversation("3", user.innerHTML);
			} else if (arrayConversationsOpened.includes(user.innerHTML) === false && arrayConversationsOpened.length === 3) {
				const conversation = document.querySelector(".conversation-js-1");
				conversation.remove();
				arrayConversationsOpened[0] = user.innerHTML;
				const body = document.body
				body.insertAdjacentHTML("beforeend", `
				<div class="conversation-js-1">
					<div class="conversation-js-title">
						${user.innerHTML}
						<div>
							<i class="fas fa-minus" id="collapse-conversation-1"></i>
							<i class="fas fa-times" id="remove-conversation-1"></i>
						</div>
					</div>
					<div class="mt-2 mx-3" style="height: 90%;" id="${name}">
					</div>
				</div>`)
				function load_home() {
					document.getElementById(`${name}`).innerHTML=`<object type="text/html" data="/companies/The-Welcomer/conversations/window/${name}" width="100%" height="100%" ></object>`;
				};
				 load_home();
				 closeConversation("1");
				 reduceConversation("1", user.innerHTML);
			}
		});
	});
};

export { showUsers };
export { addConversation };

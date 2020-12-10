const activeTab = () => {
  const navBarTabs = document.querySelectorAll(".navbar-tabs");
  if (navBarTabs){
    navBarTabs.forEach((navBarTab)=> {
      navBarTab.addEventListener("click", (event)=>{
        const currentActive = document.querySelector(".active")
        currentActive.classList.remove("active");
        navBarTab.classList.add("active")
      })

    })
  }
}

export {activeTab};

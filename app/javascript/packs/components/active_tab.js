const activeTab = () => {
  const navBarTabs = document.querySelectorAll(".navbar-tabs");
  if (navBarTabs){
    navBarTabs.forEach((navBarTab)=> {
      navBarTab.addEventListener("click", (event)=>{
        const currentActive = document.querySelector(".active")
        currentActive.classList.remove("active");
        console.log(navBarTab)
        navBarTab.classList.add("active")
      })

    })
  }
}

export {activeTab};

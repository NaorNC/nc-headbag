window.addEventListener("message", (event) => {
    let data = event.data;
    if (data["action"] == "open") {
        $(".container").css({"display": "block"});
    } else if (data["action"] == "remove") { 
        $(".container").css({"display": "none"});
    }
})
// initialize your global object will all your model names
var C80_PUSH = {

};

jQuery(document).ready(function ($) {
    // get the page action
    var action, model, b = $("body");
    if (b.hasClass("edit")) {
        action = "edit";
    } else if (b.hasClass("view")) {
        action = "view";
    } else if (b.hasClass("index")) {
        action = "index"
    } else if (b.hasClass("new")) {
        action = "new"
    }

    // run the code specific to a model and an action
    for (var m in C80_PUSH) {
        if (b.hasClass("admin_" + m)) {
            if (C80_PUSH[m][action] && typeof C80_PUSH[m][action] == "function") {
                C80_PUSH[m][action]();
                break;
            }
        }
    }
});
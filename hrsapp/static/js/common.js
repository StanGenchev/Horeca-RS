function triggerNav() {
    panel = document.querySelector('.sidePanel');
    const pStyle = getComputedStyle(panel);
    if (pStyle.display === 'none') {
        panel.style.display = 'block';
    } else {
        panel.style.display = 'none';
    }
}

function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) == (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

function appendToCookie(cname,cvalue,exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  var expires = "expires=" + d.toGMTString();
  var oldVals = getCookie("ratedItems");
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function clear_session() {
    document.cookie = "ratedItems=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
    current_url = window.location.href.replace(window.location.origin, "");
    if (current_url.includes("grid")) {
        location.href='/requests?reset=1' + '&url=/wines';
    }
    else if (current_url.includes("recommend")) {
        location.href='/requests?reset=1' + '&url=/recommend/';
    }
    else if (current_url.includes("detail")) {
        alert("Cannot clear session from detail page!");
    }
    else {
        location.href='/requests?reset=1' + '&url=/';
    }
}

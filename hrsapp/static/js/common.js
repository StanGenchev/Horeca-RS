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

function clear_session() {
    current_url = window.location.href.replace(window.location.origin, "");
    if (current_url.includes("grid")) {
        location.href='/requests?reset=1' + '&url=/grid';
    }
    else if (current_url.includes("recommend")) {
        location.href='/requests?reset=1' + '&url=/recommend-menu';
    }
    else if (current_url.includes("detail")) {
        alert("Cannot clear session from detail page!");
    }
    else {
        location.href='/requests?reset=1' + '&url=/start';
    }
}

function remove_rated(rid) {
    current_url = window.location.href.replace(window.location.origin, "")
    location.href='/requests?rmrate=' + rid + '&url=' + current_url;
}

function set_rating(id, name, vendor, photo, rate) {
    var elem = document.getElementsByClassName(id);
    for (i = 0; i < rate; i++) {
       elem[i].style.backgroundImage = "url({% static 'images/star-checked.svg' %})";
    }
    for (i = rate; i < 5; i++) {
       elem[i].style.backgroundImage = "url({% static 'images/star.svg' %})";
    }
    location.href="?rated=" + id + "<hrs>" + name + "<hrs>" + vendor + "<hrs>" + photo + "<hrs>" + rate;
}

function hrs_open() {
    document.getElementById("mySidebar").style.display = "block";
}
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
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

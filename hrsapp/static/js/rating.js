function removeRated(item_id) {
    $(".r" + item_id).remove();
    var stars = document.getElementsByClassName(String(item_id));
    if (stars[0]) {
        for (i = 0; i < 5; i++) {
            stars[i].classList.remove("activated");
        }
    }
    var newRated = {};
    var oldRated = getCookie("ratedItems");
    newRated = JSON.parse(oldRated);
    delete newRated[item_id];
    appendToCookie("ratedItems", JSON.stringify(newRated), 1);
}

function addToRated(item_id, item_name, item_vendor, item_photo, rate) {
    if (document.getElementsByClassName("r" + String(item_id))[0]) {
        var stars = document.getElementsByClassName("r" + String(item_id));
        for (i = rate + 1; i <= 5; i++) {
            stars[i].classList.remove("activated");
        }
        for (i = 1; i < rate + 1; i++) {
            stars[i].classList.add("activated");
        }
    } else {
        var ratedTemplate = document.getElementById('ratedTemplate').innerHTML;
        ratedTemplate = ratedTemplate.replace("/wines/wine/", "/wines/wine/" + String(item_id));
        ratedTemplate = ratedTemplate.replace("ratedItem", "ratedItem r" + String(item_id));
        ratedTemplate = ratedTemplate.replace("<!-- img -->", '<img src="/static/images/' + item_photo + '"' + ' alt="Wine Picture"/>');
        ratedTemplate = ratedTemplate.replace("name", item_name);
        ratedTemplate = ratedTemplate.replace("vendor", item_vendor);
        ratedTemplate = ratedTemplate.replace('class="xCloseRemove"', 'class="xCloseRemove" onclick="this.remove();removeRated(' + String(item_id) + ')"');
        for (i = 0; i < rate; i++) {
            ratedTemplate = ratedTemplate.replace("disabled", "r" + String(item_id) + " rateStar activated");
        }
        for (i = rate; i < 5; i++) {
            ratedTemplate = ratedTemplate.replace("disabled", "r" + String(item_id) + " rateStar");
        }
    }

    var stars = document.getElementsByClassName(String(item_id));
    for (i = 0; i < rate; i++) {
        stars[i].classList.add("activated");
    }
    for (i = rate; i < 5; i++) {
        stars[i].classList.remove("activated");
    }

    var newRated = {};
    var oldRated = getCookie("ratedItems");

    if (oldRated != null) {
        newRated = JSON.parse(oldRated);
        newRated[item_id] = [item_photo, item_name, item_vendor, rate];
    } else {
        newRated[item_id] = [item_photo, item_name, item_vendor, rate];
    }

    appendToCookie("ratedItems", JSON.stringify(newRated), 1);
    $(".spacer").append(ratedTemplate);
}

function fillRated() {
    var rated = getCookie("ratedItems");
    rated = JSON.parse(rated);
    var ratedTemplate = document.getElementById('ratedTemplate').innerHTML;

    for (var index in rated) {
        rateHTML = ratedTemplate.replace("/wines/wine/", "/wines/wine/" + String(index));
        rateHTML = rateHTML.replace("ratedItem", "ratedItem r" + String(index));
        rateHTML = rateHTML.replace("<!-- img -->", '<img src="/static/images/' + rated[index][0] + '"' + ' alt="Wine Picture"/>');
        rateHTML = rateHTML.replace("name", rated[index][1]);
        rateHTML = rateHTML.replace("vendor", rated[index][2]);
        rateHTML = rateHTML.replace('class="xCloseRemove"', 'class="xCloseRemove" onclick="this.remove();removeRated(' + String(index) + ')"');

        for (i = 0; i < rated[index][3]; i++) {
            rateHTML = rateHTML.replace("disabled", "r" + String(index) + " rateStar activated");
        }
        for (i = rated[index][3]; i < 5; i++) {
            rateHTML = rateHTML.replace("disabled", "r" + String(index) + " rateStar");
        }
        $(".spacer").append(rateHTML);

        var stars = document.getElementsByClassName(String(index));
        if (stars[0]) {
            for (i = 0; i < rated[index][3]; i++) {
                stars[i].classList.add("activated");
            }
            for (i = rated[index][3]; i < 5; i++) {
                stars[i].classList.remove("activated");
            }
        }
    }
}

jQuery(function($) {
    $.fn.hScroll = function(amount) {
        amount = amount || 120;
        $(this).bind("DOMMouseScroll mousewheel", function(event) {
            var oEvent = event.originalEvent,
                direction = oEvent.detail ? oEvent.detail * -amount : oEvent.wheelDelta,
                position = $(this).scrollLeft();
            position += direction > 0 ? -amount : amount;

            $(this).scrollLeft(position);
            event.preventDefault();
        })
    };
});

$(document).ready(function() {
    $('.spacer').hScroll(60); // scrolling amount
});

$(window).bind("load", function() {
    fillRated();
});

var touchStartX;

function touchStart(e) {
    touchStartX = e.touches[0].clientX;
};

function touchMove(e) {
    var touchMoveX = e.changedTouches[0].clientX;
    var position = $(".spacer").scrollLeft();
    var delta = touchStartX - touchMoveX;
    position += delta < 0 ? -10 : 10;
    $(".spacer").scrollLeft(position);
};

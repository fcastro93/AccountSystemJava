/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    function close_accordion_section() {
        $('.accordion .accordion-section-title').removeClass('active');
        $('.accordion .accordion-section-content').slideUp(300).removeClass('open');
    }

    $('.accordion-section-title').click(function(e) {
        // Grab current anchor value
        var currentAttrValue = $(this).attr('href');

        if ($(e.target).is('.active')) {
            close_accordion_section();
        } else {
            close_accordion_section();

            // Add active class to section title
            $(this).addClass('active');
            // Open up the hidden content panel
            $('.accordion ' + currentAttrValue).slideDown(300).addClass('open');
        }

        e.preventDefault();
    });
});


$(document).ready(function() {
    $('ul.sf-menu').sooperfish();
    $('.top').click(function() {
        $('html, body').animate({scrollTop: 0}, 'fast');
        return false;
    });
});


jQuery(document).ready(function($)
{
    $('#thetable').tableScroll({height: 200});
    $('#thetable').tableScroll({height: 200});
    $('#thetable').tableScroll({width: 400});
    $('#thetable').tableScroll({containerClass: 'myCustomClass'});
});

jQuery(document).ready(function($) {
    $('#thetable').tableScroll({height: 150});
});

function borrarFila(btndel) {
    //no clue what to put here?
    if (typeof (btndel) == "object") {
        //$(btndel).closest("tr").remove();
        window.alert($(btndel).closest('tr').find('td:nth-child(3)').text());

    } else {
        return false;
    }
}

function modificarFlujo(btndel) {
    //no clue what to put here?
    if (typeof (btndel) == "object") {
        //$(btndel).closest("tr").remove();
        window.alert($(btndel).closest('tr').find('td:first').text());
        document.getElementById("invisibleIngreso").click();

    } else {
        return false;
    }
}

function modificarFila(URL) {
    window.alert(URL);
    day = new Date();
    id = day.getTime();
    variable = URL.toString();
    variable += "?id=" + $(btndel).closest('tr').find('td:first').text();
    window.alert(URL);
    eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=500,height=500,left = 100,top = 100');");
}

function popUp(URL) {
    day = new Date();
    id = day.getTime();
    eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=500,height=500,left = 100,top = 100');");

}



function sumTable(tableId) {
    $('#' + tableId + ' tbody').append('<tr>' + $('#' + tableId + ' tr:last').html() + '</tr>');
    $('#' + tableId + ' tr:last td, #' + tableId + ' tr:last th').text('');
    $('#' + tableId + ' tr:last td').css('background-color', '#FAFAFA').css('font-weight', 'bold');
    $('#' + tableId + ' tr:last td, #' + tableId + ' tr:last th').each(function (idx) {
        var total = 0;
        $('#' + tableId + ' tbody tr td:nth-child(' + (parseInt(idx) + 1) + ')').each(function () {
            var temp = parseFloat($(this).text());
            total += isNaN(temp) ? 0 : temp;
        });
        if (total != 0) {
            $(this).text(total);
        }
    });
}
(function ($) {
    $.fn.visualize = function (options, container) {
        return $(this).each(function () {
            //configuration
            var o = $.extend({
                type: 'bar', //also available: area, pie, line
                width: $(this).width(), //height of canvas - defaults to table height
                height: $(this).height(), //height of canvas - defaults to table height
                appendTitle: true, //table caption text is added to chart
                title: null, //grabs from table caption if null
                appendKey: true, //color key is added to chart
                colors: ['#008000', '#0000FF', '#800080', '#FF00FF', '#008080', '#FFFF00', '#808080', '#00FFFF', '#000080', '#800000', '#FF3939', '#7F7F00', '#C0C0C0', '#FF6347', '#FFE4B5', '#E6E6FA', '#FFF0F5', '#FFDAB9', '#FFFACD', '#FFE4E1', '#F0FFF0', '#F0F8FF', '#F5F5F5', '#FAEBD7', '#E0FFFF', '#87CEEB', '#32CD32', '#BA55D3', '#F08080', '#4682B4', '#9ACD32', '#40E0D0', '#FF69B4', '#F0E68C', '#D2B48C', '#8FBC8B', '#6495ED', '#DDA0DD', '#5F9EA0', '#FFDAB9', '#FFA07A'],
                textColors: [], //corresponds with colors array. null/undefined items will fall back to CSS
                parseDirection: 'x', //which direction to parse the table data
                pieMargin: 20, //pie charts only - spacing around pie
                pieLabelPos: 'inside',
                lineWeight: 4, //for line and area - stroke weight
                barGroupMargin: 10,
                barMargin: 1, //space around bars in bar chart (added to both sides of bar)
                yLabelInterval: 30 //distance between y labels
            }, options);
            //reset width, height to numbers
            o.width = parseFloat(o.width);
            o.height = parseFloat(o.height);
            var self = $(this);
            //function to scrape data from html table
            function scrapeTable() {
                var colors = o.colors;
                var textColors = o.textColors;
                var tableData = {
                    dataGroups: function () {
                        var dataGroups = [];
                        if (o.parseDirection == 'x') {
                            self.find('tr:gt(0)').each(function (i) {
                                dataGroups[i] = {};
                                dataGroups[i].points = [];
                                dataGroups[i].color = colors[i];
                                if (textColors[i]) { dataGroups[i].textColor = textColors[i]; }
                                $(this).find('td').each(function () {
                                    dataGroups[i].points.push(parseFloat($(this).text()));
                                });
                            });
                        }
                        else {
                            var cols = self.find('tr:eq(1) td').size();
                            for (var i = 0; i < cols; i++) {
                                dataGroups[i] = {};
                                dataGroups[i].points = [];
                                dataGroups[i].color = colors[i];
                                if (textColors[i]) { dataGroups[i].textColor = textColors[i]; }
                                self.find('tr:gt(0)').each(function () {
                                    dataGroups[i].points.push($(this).find('td').eq(i).text() * 1);
                                });
                            };
                        }
                        return dataGroups;
                    },
                    allData: function () {
                        var allData = [];
                        $(this.dataGroups()).each(function () {
                            allData.push(this.points);
                        });
                        return allData;
                    },
                    dataSum: function () {
                        var dataSum = 0;
                        var allData = this.allData().join(',').split(',');
                        $(allData).each(function () {
                            dataSum += parseFloat(this);
                        });
                        return dataSum
                    },
                    topValue: function () {
                        var topValue = 0;
                        var allData = this.allData().join(',').split(',');
                        $(allData).each(function () {
                            if (parseFloat(this, 10) > topValue) topValue = parseFloat(this);
                        });
                        return topValue;
                    },
                    bottomValue: function () {
                        var bottomValue = 0;
                        var allData = this.allData().join(',').split(',');
                        $(allData).each(function () {
                            if (this < bottomValue) bottomValue = parseFloat(this);
                        });
                        return bottomValue;
                    },
                    memberTotals: function () {
                        var memberTotals = [];
                        var dataGroups = this.dataGroups();
                        $(dataGroups).each(function (l) {
                            var count = 0;
                            $(dataGroups[l].points).each(function (m) {
                                count += dataGroups[l].points[m];
                            });
                            memberTotals.push(count);
                        });
                        return memberTotals;
                    },
                    yTotals: function () {
                        var yTotals = [];
                        var dataGroups = this.dataGroups();
                        var loopLength = this.xLabels().length;
                        for (var i = 0; i < loopLength; i++) {
                            yTotals[i] = [];
                            var thisTotal = 0;
                            $(dataGroups).each(function (l) {
                                yTotals[i].push(this.points[i]);
                            });
                            yTotals[i].join(',').split(',');
                            $(yTotals[i]).each(function () {
                                thisTotal += parseFloat(this);
                            });
                            yTotals[i] = thisTotal;
                        }
                        return yTotals;
                    },
                    topYtotal: function () {
                        var topYtotal = 0;
                        var yTotals = this.yTotals().join(',').split(',');
                        $(yTotals).each(function () {
                            if (parseFloat(this, 10) > topYtotal) topYtotal = parseFloat(this);
                        });
                        return topYtotal;
                    },
                    totalYRange: function () {
                        return this.topValue() - this.bottomValue();
                    },
                    xLabels: function () {
                        var xLabels = [];
                        if (o.parseDirection == 'x') {
                            self.find('tr:eq(0) th').each(function () {
                                xLabels.push($(this).html());
                            });
                        }
                        else {
                            self.find('tr:gt(0) th').each(function () {
                                xLabels.push($(this).html());
                            });
                        }
                        return xLabels;
                    },
                    yLabels: function () {
                        var yLabels = [];
                        yLabels.push(bottomValue);
                        var numLabels = Math.round(o.height / o.yLabelInterval);
                        var loopInterval = Math.ceil(totalYRange / numLabels) || 1;
                        while (yLabels[yLabels.length - 1] < topValue - loopInterval) {
                            yLabels.push(yLabels[yLabels.length - 1] + loopInterval);
                        }
                        yLabels.push(topValue);
                        return yLabels;
                    }
                };
                return tableData;
            };
            //function to create a chart
            var createChart = {
                pie: function () {
                    canvasContain.addClass('visualize-pie');
                    if (o.pieLabelPos == 'outside') { canvasContain.addClass('visualize-pie-outside'); }
                    var centerx = Math.round(canvas.width() / 2);
                    var centery = Math.round(canvas.height() / 2);
                    var radius = centery - o.pieMargin;
                    var counter = 0.0;
                    var toRad = function (integer) { return (Math.PI / 180) * integer; };
                    var labels = $('<ul class="visualize-labels"></ul>')
                    .insertAfter(canvas);
                    //draw the pie pieces
                    $.each(memberTotals, function (i) {
                        var fraction = (this <= 0 || isNaN(this)) ? 0 : this / dataSum;
                        ctx.beginPath();
                        ctx.moveTo(centerx, centery);
                        ctx.arc(centerx, centery, radius,
                        counter * Math.PI * 2 - Math.PI * 0.5,
                        (counter + fraction) * Math.PI * 2 - Math.PI * 0.5,
                        false);
                        ctx.lineTo(centerx, centery);
                        ctx.closePath();
                        ctx.fillStyle = dataGroups[i].color;
                        ctx.fill();
                        // draw labels
                        var sliceMiddle = (counter + fraction / 2);
                        var distance = o.pieLabelPos == 'inside' ? radius / 1.5 : radius + radius / 5;
                        var labelx = Math.round(centerx + Math.sin(sliceMiddle * Math.PI * 2) * (distance));
                        var labely = Math.round(centery - Math.cos(sliceMiddle * Math.PI * 2) * (distance));
                        var leftRight = (labelx > centerx) ? 'right' : 'left';
                        var topBottom = (labely > centery) ? 'bottom' : 'top';
                        var labeltext = $('<span class="visualize-label">' + Math.round(fraction * 100) + '%</span>')
                        .css(leftRight, 0)
                        .css(topBottom, 0);
                        var label = $('<li class="visualize-label-pos"></li>')
                        .appendTo(labels)
                        .css({ left: labelx, top: labely })
                        .append(labeltext);
                        labeltext
                        .css('font-size', radius / 8)
                        .css('margin-' + leftRight, -labeltext.width() / 2)
                        .css('margin-' + topBottom, -labeltext.outerHeight() / 2);
                        if (dataGroups[i].textColor) { labeltext.css('color', dataGroups[i].textColor); }
                        counter += fraction;
                    });
                },
                line: function (area) {
                    if (area) { canvasContain.addClass('visualize-area'); }
                    else { canvasContain.addClass('visualize-line'); }
                    //write X labels
                    var xInterval = canvas.width() / (xLabels.length - 1);
                    var xlabelsUL = $('<ul class="visualize-labels-x"></ul>')
                    .width(canvas.width())
                    .height(canvas.height())
                    .insertBefore(canvas);
                    $.each(xLabels, function (i) {
                        var thisLi = $('<li><span>' + this + '</span></li>')
                        .prepend('<span class="line" />')
                        .css('left', xInterval * i)
                        .appendTo(xlabelsUL);
                        var label = thisLi.find('span:not(.line)');
                        var leftOffset = label.width() / -2;
                        if (i == 0) { leftOffset = 0; }
                        else if (i == xLabels.length - 1) { leftOffset = -label.width(); }
                        label
                        .css('margin-left', leftOffset)
                        .addClass('label');
                    });
                    //write Y labels
                    var yScale = canvas.height() / totalYRange;
                    var liBottom = canvas.height() / (yLabels.length - 1);
                    var ylabelsUL = $('<ul class="visualize-labels-y"></ul>')
                    .width(canvas.width())
                    .height(canvas.height())
                    .insertBefore(canvas);
                    $.each(yLabels, function (i) {
                        var thisLi = $('<li><span>' + this + '</span></li>')
                        .prepend('<span class="line" />')
                        .css('bottom', liBottom * i)
                        .prependTo(ylabelsUL);
                        var label = thisLi.find('span:not(.line)');
                        var topOffset = label.height() / -2;
                        if (i == 0) { topOffset = -label.height(); }
                        else if (i == yLabels.length - 1) { topOffset = 0; }
                        label
                        .css('margin-top', topOffset)
                        .addClass('label');
                    });
                    //start from the bottom left
                    ctx.translate(0, zeroLoc);
                    //iterate and draw
                    $.each(dataGroups, function (h) {
                        ctx.beginPath();
                        ctx.lineWidth = o.lineWeight;
                        ctx.lineJoin = 'round';
                        var points = this.points;
                        var integer = 0;
                        ctx.moveTo(0, -(points[0] * yScale));
                        $.each(points, function () {
                            ctx.lineTo(integer, -(this * yScale));
                            integer += xInterval;
                        });
                        ctx.strokeStyle = this.color;
                        ctx.stroke();
                        if (area) {
                            ctx.lineTo(integer, 0);
                            ctx.lineTo(0, 0);
                            ctx.closePath();
                            ctx.fillStyle = this.color;
                            ctx.globalAlpha = .3;
                            ctx.fill();
                            ctx.globalAlpha = 1.0;
                        }
                        else { ctx.closePath(); }
                    });
                },
                area: function () {
                    createChart.line(true);
                },
                bar: function () {
                    canvasContain.addClass('visualize-bar');
                    //write X labels
                    var xInterval = canvas.width() / (xLabels.length);
                    var xlabelsUL = $('<ul class="visualize-labels-x"></ul>')
                    .width(canvas.width())
                    .height(canvas.height())
                    .insertBefore(canvas);
                    $.each(xLabels, function (i) {
                        var thisLi = $('<li><span class="label">' + this + '</span></li>')
                        .prepend('<span class="line" />')
                        .css('left', xInterval * i)
                        .width(xInterval)
                        .appendTo(xlabelsUL);
                        var label = thisLi.find('span.label');
                        label.addClass('label');
                    });
                    //write Y labels
                    var yScale = canvas.height() / totalYRange;
                    var liBottom = canvas.height() / (yLabels.length - 1);
                    var ylabelsUL = $('<ul class="visualize-labels-y"></ul>')
                    .width(canvas.width())
                    .height(canvas.height())
                    .insertBefore(canvas);
                    $.each(yLabels, function (i) {
                        var thisLi = $('<li><span>' + this + '</span></li>')
                        .prepend('<span class="line" />')
                        .css('bottom', liBottom * i)
                        .prependTo(ylabelsUL);
                        var label = thisLi.find('span:not(.line)');
                        var topOffset = label.height() / -2;
                        if (i == 0) { topOffset = -label.height(); }
                        else if (i == yLabels.length - 1) { topOffset = 0; }
                        label
                        .css('margin-top', topOffset)
                        .addClass('label');
                    });
                    //start from the bottom left
                    ctx.translate(0, zeroLoc);
                    //iterate and draw
                    for (var h = 0; h < dataGroups.length; h++) {
                        ctx.beginPath();
                        var linewidth = (xInterval - o.barGroupMargin * 2) / dataGroups.length; //removed +1
                        var strokeWidth = linewidth - (o.barMargin * 2);
                        ctx.lineWidth = strokeWidth;
                        var points = dataGroups[h].points;
                        var integer = 0;
                        for (var i = 0; i < points.length; i++) {
                            var xVal = (integer - o.barGroupMargin) + (h * linewidth) + linewidth / 2;
                            xVal += o.barGroupMargin * 2;
                            ctx.moveTo(xVal, 0);
                            ctx.lineTo(xVal, Math.round(-points[i] * yScale));
                            integer += xInterval;
                        }
                        ctx.strokeStyle = dataGroups[h].color;
                        ctx.stroke();
                        ctx.closePath();
                    }
                }
            };
            //create new canvas, set w&h attrs (not inline styles)
            var canvasNode = document.createElement("canvas");
            canvasNode.setAttribute('height', o.height);
            canvasNode.setAttribute('width', o.width);
            var canvas = $(canvasNode);
            //get title for chart
            var title = o.title || self.find('caption').text();
            //create canvas wrapper div, set inline w&h, append
            var canvasContain = (container || $('<div class="visualize" role="img" aria-label="Chart representing data from the table: ' + title + '" />'))
            .height(o.height)
            .width(o.width)
            .append(canvas);
            //scrape table (this should be cleaned up into an obj)
            var tableData = scrapeTable();
            var dataGroups = tableData.dataGroups();
            var allData = tableData.allData();
            var dataSum = tableData.dataSum();
            var topValue = tableData.topValue();
            var bottomValue = tableData.bottomValue();
            var memberTotals = tableData.memberTotals();
            var totalYRange = tableData.totalYRange();
            var zeroLoc = o.height * (topValue / totalYRange);
            var xLabels = tableData.xLabels();
            var yLabels = tableData.yLabels();
            //title/key container
            if (o.appendTitle || o.appendKey) {
                var infoContain = $('<div class="visualize-info"></div>')
                .appendTo(canvasContain);
            }
            //append title
            if (o.appendTitle) {
                $('<div class="visualize-title">' + title + '</div>').appendTo(infoContain);
            }
            //append key
            if (o.appendKey) {
                var newKey = $('<ul class="visualize-key"></ul>');
                var selector = (o.parseDirection == 'x') ? 'tr:gt(0) th' : 'tr:eq(0) th';
                self.find(selector).each(function (i) {
                    $('<li><span class="visualize-key-color" style="background: ' + dataGroups[i].color + '"></span><span class="visualize-key-label">' + $(this).text() + '</span></li>')
                    .appendTo(newKey);
                });
                newKey.appendTo(infoContain);
            };
            //append new canvas to page
            if (!container) { canvasContain.insertAfter(this); }
            if (typeof (G_vmlCanvasManager) != 'undefined') { G_vmlCanvasManager.initElement(canvas[0]); }
            //set up the drawing board
            var ctx = canvas[0].getContext('2d');
            //create chart
            createChart[o.type]();
            //clean up some doubled lines that sit on top of canvas borders (done via JS due to IE)
            $('.visualize-line li:first-child span.line, .visualize-line li:last-child span.line, .visualize-area li:first-child span.line, .visualize-area li:last-child span.line, .visualize-bar li:first-child span.line,.visualize-bar .visualize-labels-y li:last-child span.line').css('border', 'none');
            if (!container) {
                //add event for updating
                canvasContain.bind('visualizeRefresh', function () {
                    self.visualize(o, $(this).empty());
                });
            }
        }).next(); //returns canvas(es)
    };
})(jQuery);
jQuery.fn.fixedtableheader = function (options) { var settings = jQuery.extend({ headerrowsize: 1, highlightrow: false, highlightclass: "highlight" }, options); this.each(function (i) { var $tbl = $(this); var $tblhfixed = $tbl.find("tr:lt(" + settings.headerrowsize + ")"); var headerelement = "th"; if ($tblhfixed.find(headerelement).length == 0) headerelement = "td"; if ($tblhfixed.find(headerelement).length > 0) { $tblhfixed.find(headerelement).each(function () { $(this).css("width", $(this).width()); }); var $clonedTable = $tbl.clone().empty(); var tblwidth = GetTblWidth($tbl); $clonedTable.attr("id", "fixedtableheader" + i).css({ "position": "fixed", "top": "0", "left": $tbl.offset().left }).append($tblhfixed.clone()).width(tblwidth).hide().appendTo($("body")); if (settings.highlightrow) $("tr:gt(" + (settings.headerrowsize - 1) + ")", $tbl).hover(function () { $(this).addClass(settings.highlightclass); }, function () { $(this).removeClass(settings.highlightclass); }); $(window).scroll(function () { if (jQuery.browser.msie && jQuery.browser.version == "6.0") $clonedTable.css({ "position": "absolute", "top": $(window).scrollTop(), "left": $tbl.offset().left }); else $clonedTable.css({ "position": "fixed", "top": "0", "left": $tbl.offset().left - $(window).scrollLeft() }); var sctop = $(window).scrollTop(); var elmtop = $tblhfixed.offset().top; if (sctop > elmtop && sctop <= (elmtop + $tbl.height() - $tblhfixed.height())) $clonedTable.show(); else $clonedTable.hide(); }); $(window).resize(function () { if ($clonedTable.outerWidth() != $tbl.outerWidth()) { $tblhfixed.find(headerelement).each(function (index) { var w = $(this).width(); $(this).css("width", w); $clonedTable.find(headerelement).eq(index).css("width", w); }); $clonedTable.width($tbl.outerWidth()); } $clonedTable.css("left", $tbl.offset().left); }); } }); function GetTblWidth($tbl) { var tblwidth = $tbl.outerWidth(); return tblwidth; } };
//numric js
(function ($) {
    /*
    * Allows only valid characters to be entered into input boxes.
    * Note: fixes value when pasting via Ctrl+V, but not when using the mouse to paste
    * side-effect: Ctrl+A does not work, though you can still use the mouse to select (or double-click to select all)
    *
    * @name numeric
    * @param config { decimal : "." , negative : true }
    * @param callback A function that runs if the number is not valid (fires onblur)
    * @author Sam Collett (http://www.texotela.co.uk)
    * @example $(".numeric").numeric();
    * @example $(".numeric").numeric(","); // use , as separator
    * @example $(".numeric").numeric({ decimal : "," }); // use , as separator
    * @example $(".numeric").numeric({ negative : false }); // do not allow negative values
    * @example $(".numeric").numeric(null, callback); // use default values, pass on the 'callback' function
    *
    */
    $.fn.numeric = function (config, callback) {
        if (typeof config === 'boolean') {
            config = { decimal: config };
        }
        config = config || {};
        // if config.negative undefined, set to true (default is to allow negative numbers)
        if (typeof config.negative == "undefined") { config.negative = true; }
        // set decimal point
        var decimal = (config.decimal === false) ? "" : config.decimal || ".";
        // allow negatives
        var negative = (config.negative === true) ? true : false;
        // callback function
        callback = (typeof (callback) == "function" ? callback : function () { });
        // set data and methods
        return this.data("numeric.decimal", decimal).data("numeric.negative", negative).data("numeric.callback", callback).keypress($.fn.numeric.keypress).keyup($.fn.numeric.keyup).blur($.fn.numeric.blur);
    };
    $.fn.numeric.keypress = function (e) {
        // get decimal character and determine if negatives are allowed
        var decimal = $.data(this, "numeric.decimal");
        var negative = $.data(this, "numeric.negative");
        // get the key that was pressed
        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
        // allow enter/return key (only when in an input box)
        if (key == 13 && this.nodeName.toLowerCase() == "input") {
            return true;
        }
        else if (key == 13) {
            return false;
        }
        var allow = false;
        // allow Ctrl+A
        if ((e.ctrlKey && key == 97 /* firefox */) || (e.ctrlKey && key == 65) /* opera */) { return true; }
        // allow Ctrl+X (cut)
        if ((e.ctrlKey && key == 120 /* firefox */) || (e.ctrlKey && key == 88) /* opera */) { return true; }
        // allow Ctrl+C (copy)
        if ((e.ctrlKey && key == 99 /* firefox */) || (e.ctrlKey && key == 67) /* opera */) { return true; }
        // allow Ctrl+Z (undo)
        if ((e.ctrlKey && key == 122 /* firefox */) || (e.ctrlKey && key == 90) /* opera */) { return true; }
        // allow or deny Ctrl+V (paste), Shift+Ins
        if ((e.ctrlKey && key == 118 /* firefox */) || (e.ctrlKey && key == 86) /* opera */ ||
        (e.shiftKey && key == 45)) { return true; }
        // if a number was not pressed
        if (key < 48 || key > 57) {
            var value = $(this).val();
            /* '-' only allowed at start and if negative numbers allowed */
            if (value.indexOf("-") !== 0 && negative && key == 45 && (value.length === 0 || parseInt($.fn.getSelectionStart(this), 10) === 0)) { return true; }
            /* only one decimal separator allowed */
            if (decimal && key == decimal.charCodeAt(0) && value.indexOf(decimal) != -1) {
                allow = false;
            }
            // check for other keys that have special purposes
            if (
            key != 8 /* backspace */ &&
            key != 9 /* tab */ &&
            key != 13 /* enter */ &&
            key != 35 /* end */ &&
            key != 36 /* home */ &&
            key != 37 /* left */ &&
            key != 39 /* right */ &&
            key != 46 /* del */
            ) {
                allow = false;
            }
            else {
                // for detecting special keys (listed above)
                // IE does not support 'charCode' and ignores them in keypress anyway
                if (typeof e.charCode != "undefined") {
                    // special keys have 'keyCode' and 'which' the same (e.g. backspace)
                    if (e.keyCode == e.which && e.which !== 0) {
                        allow = true;
                        // . and delete share the same code, don't allow . (will be set to true later if it is the decimal point)
                        if (e.which == 46) { allow = false; }
                    }
                        // or keyCode != 0 and 'charCode'/'which' = 0
                    else if (e.keyCode !== 0 && e.charCode === 0 && e.which === 0) {
                        allow = true;
                    }
                }
            }
            // if key pressed is the decimal and it is not already in the field
            if (decimal && key == decimal.charCodeAt(0)) {
                if (value.indexOf(decimal) == -1) {
                    allow = true;
                }
                else {
                    allow = false;
                }
            }
        }
        else {
            allow = true;
        }
        return allow;
    };
    $.fn.numeric.keyup = function (e) {
        var val = $(this).val();
        if (val && val.length > 0) {
            // get carat (cursor) position
            var carat = $.fn.getSelectionStart(this);
            // get decimal character and determine if negatives are allowed
            var decimal = $.data(this, "numeric.decimal");
            var negative = $.data(this, "numeric.negative");
            // prepend a 0 if necessary
            if (decimal !== "" && decimal !== null) {
                // find decimal point
                var dot = val.indexOf(decimal);
                // if dot at start, add 0 before
                if (dot === 0) {
                    this.value = "0" + val;
                }
                // if dot at position 1, check if there is a - symbol before it
                if (dot == 1 && val.charAt(0) == "-") {
                    this.value = "-0" + val.substring(1);
                }
                val = this.value;
            }
            // if pasted in, only allow the following characters
            var validChars = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, '-', decimal];
            // get length of the value (to loop through)
            var length = val.length;
            // loop backwards (to prevent going out of bounds)
            for (var i = length - 1; i >= 0; i--) {
                var ch = val.charAt(i);
                // remove '-' if it is in the wrong place
                if (i !== 0 && ch == "-") {
                    val = val.substring(0, i) + val.substring(i + 1);
                }
                    // remove character if it is at the start, a '-' and negatives aren't allowed
                else if (i === 0 && !negative && ch == "-") {
                    val = val.substring(1);
                }
                var validChar = false;
                // loop through validChars
                for (var j = 0; j < validChars.length; j++) {
                    // if it is valid, break out the loop
                    if (ch == validChars[j]) {
                        validChar = true;
                        break;
                    }
                }
                // if not a valid character, or a space, remove
                if (!validChar || ch == " ") {
                    val = val.substring(0, i) + val.substring(i + 1);
                }
            }
            // remove extra decimal characters
            var firstDecimal = val.indexOf(decimal);
            if (firstDecimal > 0) {
                for (var k = length - 1; k > firstDecimal; k--) {
                    var chch = val.charAt(k);
                    // remove decimal character
                    if (chch == decimal) {
                        val = val.substring(0, k) + val.substring(k + 1);
                    }
                }
            }
            // set the value and prevent the cursor moving to the end
            this.value = val;
            $.fn.setSelection(this, carat);
        }
    };
    $.fn.numeric.blur = function () {
        var decimal = $.data(this, "numeric.decimal");
        var callback = $.data(this, "numeric.callback");
        var val = this.value;
        if (val !== "") {
            var re = new RegExp("^\\d+$|^\\d*" + decimal + "\\d+$");
            if (!re.exec(val)) {
                callback.apply(this);
            }
        }
    };
    $.fn.removeNumeric = function () {
        return this.data("numeric.decimal", null).data("numeric.negative", null).data("numeric.callback", null).unbind("keypress", $.fn.numeric.keypress).unbind("blur", $.fn.numeric.blur);
    };
    // Based on code from http://javascript.nwbox.com/cursor_position/ (Diego Perini <dperini@nwbox.com>)
    $.fn.getSelectionStart = function (o) {
        if (o.createTextRange) {
            var r = document.selection.createRange().duplicate();
            r.moveEnd('character', o.value.length);
            if (r.text === '') { return o.value.length; }
            return o.value.lastIndexOf(r.text);
        } else { return o.selectionStart; }
    };
    // set the selection, o is the object (input), p is the position ([start, end] or just start)
    $.fn.setSelection = function (o, p) {
        // if p is number, start and end are the same
        if (typeof p == "number") { p = [p, p]; }
        // only set if p is an array of length 2
        if (p && p.constructor == Array && p.length == 2) {
            if (o.createTextRange) {
                var r = o.createTextRange();
                r.collapse(true);
                r.moveStart('character', p[0]);
                r.moveEnd('character', p[1]);
                r.select();
            }
            else if (o.setSelectionRange) {
                o.focus();
                o.setSelectionRange(p[0], p[1]);
            }
        }
    };
})(jQuery);
(function (f) {
    function p(d, c) { if (this.createTextRange) { var b = this.createTextRange(); b.collapse(true); b.moveStart("character", d); b.moveEnd("character", c); b.select() } else if (this.setSelectionRange) { this.focus(); this.setSelectionRange(d, c) } } function q(d) {
        var c = f(this).val(), b; b = this.value.length; d = d.toLowerCase() == "start" ? "Start" : "End"; if (this.createTextRange) { b = document.selection.createRange().duplicate(); b["move" + d]("character", -c.length); b = c.lastIndexOf(b.text) } else if (typeof this["selection" + d] !=
        "undefined") b = this["selection" + d]; return b
    } f.fn.number = function (d, c, b, k) {
        k = typeof k === "undefined" ? "," : k; b = typeof b === "undefined" ? "." : b; var h = "\\u" + ("0000" + b.charCodeAt(0).toString(16)).substr(-4), m = RegExp("[^" + h + "0-9]", "g"), n = RegExp(h, "g"); if (d === true) return this.is("input:text") ? this.on({
            "keydown.format": function (a) {
                var g = f(this), e = g.data("numFormat"), i = a.keyCode ? a.keyCode : a.which, l = unescape(a.originalEvent.keyIdentifier.replace("U+", "%u")), j = q.apply(this, ["start"]), o = q.apply(this, ["end"]), r = "";
                setPos = false; if (!(i !== 8 && l != b && (i < 48 || i > 57) && (i < 96 || i > 105))) {
                    if ((j == 0 && o == this.value.length || g.val() == 0) && !a.metaKey && !a.ctrlKey && !a.altKey && l.length === 1 && l != 0) { j = o = 1; this.value = ""; e.init = -1; e.c = -(c + 1); p.apply(this, [0, 0]) } else e.c = o - this.value.length; if (j == this.value.length - c - 1 && l == b) { e.c++; e.init = Math.max(0, e.init); a.preventDefault(); setPos = this.value.length + e.c } else if (l == b) { e.init = Math.max(0, e.init); a.preventDefault() } else if (i == 8 && j == this.value.length - c) {
                        a.preventDefault(); e.c--; setPos = this.value.length +
                        e.c
                    } else if (i == 8 && j > this.value.length - c) { if (this.value === "") return; if (this.value.substr(j - 1, 1) != "0") { r = this.value.substr(0, j - 1) + "0" + this.value.substr(j); g.val(r.replace(m, "").replace(n, b)) } a.preventDefault(); e.c--; setPos = this.value.length + e.c } else if (i == 8 && this.value.substr(j - 1, 1) == k) { a.preventDefault(); e.c--; setPos = this.value.length + e.c } else if (j == o && this.value.length > c + 1 && j > this.value.length - c - 1 && isFinite(+l) && !a.metaKey && !a.ctrlKey && !a.altKey && l.length === 1) {
                        this.value = r = o === this.value.length ? this.value.substr(0,
                        j - 1) : this.value.substr(0, j) + this.value.substr(j + 1); setPos = j
                    } setPos !== false && p.apply(this, [setPos, setPos]); g.data("numFormat", e)
                }
            }, "keyup.format": function (a) {
                var g = f(this), e = g.data("numFormat"); a = a.keyCode ? a.keyCode : a.which; var i = q.apply(this, ["start"]); if (!(this.value === "" || (a < 48 || a > 57) && (a < 96 || a > 105) && a !== 8)) {
                    g.val(g.val()); if (e.init < 1) { i = this.value.length - c - (e.init < 0 ? 1 : 0); e.c = i - this.value.length; e.init = 1; g.data("numFormat", e) } else if (i > this.value.length - c && a != 8) { e.c++; g.data("numFormat", e) } g = this.value.length +
                    e.c; p.apply(this, [g, g])
                }
            }, "paste.format": function (a) { var g = f(this), e = a.originalEvent, i = null; if (window.clipboardData && window.clipboardData.getData) i = window.clipboardData.getData("Text"); else if (e.clipboardData && e.clipboardData.getData) i = e.clipboardData.getData("text/plain"); g.val(i); a.preventDefault(); return false }
        }).each(function () { var a = f(this).data("numFormat", { c: -(c + 1), decimals: c, thousands_sep: k, dec_point: b, regex_dec_num: m, regex_dec: n, init: false }); this.value !== "" && a.val(a.val()) }) : this.each(function () {
            var a =
            f(this), g = +a.text().replace(m, "").replace(n, "."); a.number(!isFinite(g) ? 0 : +g, c, b, k)
        }); return this.text(f.number.apply(window, arguments))
    }; var s = null, t = null; if (f.valHooks.text) { s = f.valHooks.text.get; t = f.valHooks.text.set } else f.valHooks.text = {}; f.valHooks.text.get = function (d) { var c = f(d).data("numFormat"); if (c) { if (d.value === "") return ""; d = +d.value.replace(c.regex_dec_num, "").replace(c.regex_dec, c.dec_point); return "" + (isFinite(d) ? d : 0) } else if (f.isFunction(s)) return s(d) }; f.valHooks.text.set = function (d,
    c) { var b = f(d).data("numFormat"); if (b) return d.value = f.number(c, b.decimals, b.dec_point, b.thousands_sep); else if (f.isFunction(t)) return t(d, c) }; f.number = function (d, c, b, k) {
        k = typeof k === "undefined" ? "," : k; b = typeof b === "undefined" ? "." : b; c = !isFinite(+c) ? 0 : Math.abs(c); var h = "\\u" + ("0000" + b.charCodeAt(0).toString(16)).substr(-4); d = (d + "").replace(RegExp(h, "g"), ".").replace(RegExp("[^0-9+-Ee.]", "g"), ""); d = !isFinite(+d) ? 0 : +d; h = ""; h = function (m, n) { var a = Math.pow(10, n); return "" + Math.round(m * a) / a }; h = (c ? h(d, c) : "" +
        Math.round(d)).split("."); if (h[0].length > 3) h[0] = h[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, k); if ((h[1] || "").length < c) { h[1] = h[1] || ""; h[1] += Array(c - h[1].length + 1).join("0") } return h.join(b)
    }
})(jQuery);

function confirm(n) {
    var ans = false;
    $("<div title='FRDP - (MIS)'><div class='msgbox'>" + n + "<\/div><\/div>").dialog({
        modal: !0,
        show: {
            effect: "drop",
            duration: 500,
            direction: "up"
        },
        hide: {
            effect: "drop",
            duration: 500,
            direction: "up"
        },
        buttons: {
            Ok: function () {
                $(this).dialog("close");
                ans = true;
            },
            Cancel: function () {
                $(this).dialog("close");
                ans = false;
            }
        }
    });
    return ans;
}

function confirmY(n) {
    var ans;
    $("<div title='FRDP - (MIS)'><div class='msgbox'>" + n + "<\/div><\/div>").dialog({
        modal: !0,
        show: {
            effect: "drop",
            duration: 500,
            direction: "up"
        },
        hide: {
            effect: "drop",
            duration: 500,
            direction: "up"
        },
        buttons: {
            Ok: function () {
                $(this).dialog("close");
                ans = true;
            },
            Cancel: function () {
                $(this).dialog("close");
                ans = false;
            }
        }
    });
    return ans;
}
//confirm("Do you want to delete ?")


function alert(n) {
    $('<div class="modal hide fade"  style="display:none;"><div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span class="icon12 minia-icon-close"></span></button><h3>FRDP - (MIS)</h3></div><div class="modal-body"><div class="paddingT15 paddingB15">' + n + '</div></div><div class="modal-footer"><a href="#" class="btn" data-dismiss="modal">Close</a></div></div>').modal('toggle');
}

function busyStart() {
    $("html").addClass("loadstate");
}
function busyEnd() {
    $("html").removeClass("loadstate");
}

function alertR(n) {

    $.pnotify({
        type: 'error',
        title: 'FRDP - (MIS)',
        text: n,
        icon: 'picon icon16 brocco-icon-info white',
        opacity: 0.95,
        history: false,
        sticker: false
    });
}

function alertG(n) {
    $.pnotify({
        type: 'success',
        title: 'FRDP - (MIS)',
        text: n,
        icon: 'picon icon16 brocco-icon-info white',
        opacity: 0.95,
        history: false,
        sticker: false
    });
}

function alertB(n) {
    $.pnotify({
        type: 'info',
        title: 'FRDP - (MIS)',
        text: n,
        icon: 'picon icon16 brocco-icon-info white',
        opacity: 0.95,
        history: false,
        sticker: false
    });
}







function remove_style(list) {
    'use strict';

    // Presentational attributes.
    var attr = [
      'align',
      'background',
      'bgcolor',
      'border',
      'cellpadding',
      'cellspacing',
      'color',
      'face',
      'height',
      'hspace',
      'marginheight',
      'marginwidth',
      'noshade',
      'nowrap',
      'valign',
      'vspace',
      'width',
      'vlink',
      'alink',
      'text',
      'link',
      'frame',
      'frameborder',
      'clear',
      'scrolling',
      'style'
    ];

    // Used later.
    var attr_len = attr.length;
    var i = list.length;

    // Defined in loop.
    var j;
    var is_hidden;

    // Loop through node list.
    while (i--) {
        is_hidden = list[i].style.display === 'none';

        // Decrement `j` in next loop.
        j = attr_len;

        // Loop through attribute list.
        while (j--) {
            list[i].removeAttribute(attr[j]);
        }

        /*
          Re-hide display:none elements,
          so they can be toggled via JS.
        */
        if (is_hidden) {
            list[i].style.display = 'none';
        }
    }
}

$.ajaxSetup({
    beforeSend: function () {
        // show image here
        $("#busy").show();
    },
    complete: function () {
        // hide image here
        $("#busy").hide();
    }
});
//window resize events
$(window).resize(function () {
    //get the window size
    var wsize = $(window).width();
    if (wsize > 980) {
        $('.shortcuts.hided').removeClass('hided').attr("style", "");
        $('.sidenav.hided').removeClass('hided').attr("style", "");
    }

    var size = "Window size is:" + $(window).width();
    //console.log(size);
});

$(window).load(function () {
    var wheight = $(window).height();
    $('#sidebar.scrolled').css('height', wheight - 63 + 'px');
});

// document ready function
$(document).ready(function () {

    !function (a) { jQuery.sessionTimeout = function (b) { function c(b) { switch (b) { case "start": e = setTimeout(function () { a("#sessionTimeout-dialog").dialog("open"), d("start") }, h.warnAfter); break; case "stop": clearTimeout(e) } } function d(a) { switch (a) { case "start": f = setTimeout(function () { window.location = h.redirUrl }, h.redirAfter - h.warnAfter); break; case "stop": clearTimeout(f) } } var e, f, g = { message: "Your session is about to expire.", keepAliveUrl: "./#", redirUrl: "./logout.aspx", logoutUrl: "./logout.aspx", warnAfter: 9e5, redirAfter: 12e5 }, h = g; b && (h = a.extend(g, b)), a("body").append('<div title="Session Timeout" id="sessionTimeout-dialog">' + h.message + "</div>"), a("#sessionTimeout-dialog").dialog({ autoOpen: !1, width: 400, modal: !0, closeOnEscape: !1, open: function () { a(".ui-dialog-titlebar-close").hide() }, buttons: { "Log Out Now": function () { window.location = h.logoutUrl }, "Stay Connected": function () { a(this).dialog("close"), a.ajax({ type: "POST", url: h.keepAliveUrl }), d("stop"), c("start") } } }), c("start") } }(jQuery);

    $.sessionTimeout({
        warnAfter: 2600000,
        redirAfter: 2900000
    });


    //if ((window.location.pathname).toString().toLowerCase().split('/')[1] === (("f".split('¼', 200)).join('')).toLowerCase()) {
    if ((window.location.href).toString().toLowerCase().indexOf((("f¼r¼d¼p".split('¼', 200)).join('')).toLowerCase()) >= 0 || (window.location.href).toString().toLowerCase().indexOf((("l¼o¼c¼a¼l¼h¼o¼s¼t¼".split('¼', 200)).join('')).toLowerCase()) >= 0) {


        $(".tab1").live('click', function (e) { $(this).parent().next().slideToggle('slow'); });
        //------------- Tool tip -------------//
        $(function () {
            // Default tooltip settings
            var offsetX = 15;
            var offsetY = 25;
            var TooltipOpacity = 0.9;

            // Select all tags having a title attribute
            $('[title]').live('mouseenter', function (e) {

                // Get the value of the title attribute
                var Tooltip = $(this).attr('title');
                if (Tooltip !== '' || Tooltip !== undefined) {
                    // Tooltip exists. Assign it to a custom attribute
                    $(this).attr('customTooltip', Tooltip);

                    // Empty title attribute (to ensure that native browser tooltip is not shown)
                    $(this).attr('title', '');
                }

                // Assign customTooltip to variable
                var customTooltip = $(this).attr('customTooltip');

                // Tooltip exists?
                if (customTooltip !== '' || customTooltip !== undefined) {
                    // Append tooltip element to body
                    $("body").append('<div id="tooltip">' + customTooltip + '</div>');

                    // Set X and Y coordinates for Tooltip
                    $('#tooltip').css('left', e.pageX + offsetX);
                    $('#tooltip').css('top', e.pageY + offsetY);

                    // FadeIn effect for Tooltip
                    $('#tooltip').fadeIn('500');
                    $('#tooltip').fadeTo('10', TooltipOpacity);
                }

            }).live('mousemove', function (e) {
                var X = e.pageX;
                var Y = e.pageY;
                var tipToBottom, tipToRight;

                // Distance to the right
                tipToRight = $(window).width() - (X + offsetX + $('#tooltip').outerWidth() + 5);

                // Tooltip too close to the right?
                if (tipToRight < offsetX) {
                    X = e.pageX + tipToRight;
                }

                // Distance to the bottom
                tipToBottom = $(window).height() - (Y + offsetY + $('#tooltip').outerHeight() + 5);

                // Tooltip too close to the bottom?
                if (tipToBottom < offsetY) {
                    Y = e.pageY + tipToBottom;
                }

                // Assign tooltip position
                $('#tooltip').css('left', X + offsetX);
                $('#tooltip').css('top', Y + offsetY);

            }).live('mouseleave', function () {
                // Remove tooltip element
                $(this).attr('title', $(this).attr('customTooltip'));
                $("body").children('div#tooltip').remove();
            });
        });


        //------------- Switcher code ( Remove it in production site ) -------------//
        (function () {
            supr_switcher = {
                create: function () {
                    //create switcher and inject into html
                    $('body').append('<a href="#" id="switchBtn"><span class="icon24 icomoon-icon-cogs"></span></a>');
                    $('body').append('<div id="switcher"><h4>Header patterns</h4><div class="header-patterns"><ul><li><a href="#" class="hpat1"><img src="images/patterns/header/1.png"></a></li><li><a href="#" class="hpat2"><img src="images/patterns/header/2.png"></a></li><li><a href="#" class="hpat3"><img src="images/patterns/header/3.png"></a></li><li><a href="#" class="hpat4"><img src="images/patterns/header/4.png"></a></li></ul></div><h4>Sidebar patterns</h4><div class="sidebar-patterns"><ul><li><a href="#" class="spat1"><img src="images/patterns/sidebar/1.png"></a></li><li><a href="#" class="spat2"><img src="images/patterns/sidebar/2.png"></a></li><li><a href="#" class="spat3"><img src="images/patterns/sidebar/3.png"></a></li><li><a href="#" class="spat4"><img src="images/patterns/sidebar/4.png"></a></li></ul></div><h4>Body patterns</h4><div class="body-patterns"><ul><li><a href="#" class="bpat1"><img src="images/patterns/body/1.png"></a></li><li><a href="#" class="bpat2"><img src="images/patterns/body/2.png"></a></li><li><a href="#" class="bpat3"><img src="images/patterns/body/3.png"></a></li><li><a href="#" class="bpat4"><img src="images/patterns/body/4.png"></a></li></ul></div></div>');
                },
                init: function () {
                    supr_switcher.create();
                    $('#switcher a').click(function () {
                        if ($(this).hasClass('hpat1')) { $('#header').css('background', 'url(images/patterns/header/bedge_grunge.png)'); }
                        if ($(this).hasClass('hpat2')) { $('#header').css('background', 'url(images/patterns/header/grid.png)'); }
                        if ($(this).hasClass('hpat3')) { $('#header').css('background', 'url(images/patterns/header/nasty_fabric.png)'); }
                        if ($(this).hasClass('hpat4')) { $('#header').css('background', 'url(images/patterns/header/natural_paper.png)'); }
                        if ($(this).hasClass('spat1')) { $('#sidebarbg').css('background', 'url(images/patterns/sidebar/az_subtle.png)'); }
                        if ($(this).hasClass('spat2')) { $('#sidebarbg').css('background', 'url(images/patterns/sidebar/billie_holiday.png)'); }
                        if ($(this).hasClass('spat3')) { $('#sidebarbg').css('background', 'url(images/patterns/sidebar/grey.png)'); }
                        if ($(this).hasClass('spat4')) { $('#sidebarbg').css('background', 'url(images/patterns/sidebar/noise_lines.png)'); }
                        if ($(this).hasClass('bpat1')) { $('#content').css('background', 'url(images/patterns/body/cream_dust.png)'); }
                        if ($(this).hasClass('bpat2')) { $('#content').css('background', 'url(images/patterns/body/dust.png)'); }
                        if ($(this).hasClass('bpat3')) { $('#content').css('background', 'url(images/patterns/body/grey.png)'); }
                        if ($(this).hasClass('bpat4')) { $('#content').css('background', 'url(images/patterns/body/subtle_dots.png)'); }
                    });

                    $('#switchBtn').click(function () {
                        if ($(this).hasClass('toggle')) {
                            //hide switcher
                            $(this).removeClass('toggle').css('right', '-1px');
                            $('#switcher').css('display', 'none');

                        } else {
                            //expand switcher
                            $(this).animate({
                                right: '135'
                            }, 200, function () {
                                // Animation complete.
                                $('#switcher').css('display', 'block');
                                $(this).addClass('toggle');
                            });
                        }
                    });
                }
            }

            supr_switcher.init();

        })();

        //prevent font flickering in some browsers 
        (function () {
            //if firefox 3.5+, hide content till load (or 3 seconds) to prevent FOUT
            var d = document, e = d.documentElement, s = d.createElement('style');
            if (e.style.MozTransform === '') { // gecko 1.9.1 inference
                s.textContent = 'body{visibility:hidden}';
                e.firstChild.appendChild(s);
                function f() { s.parentNode && s.parentNode.removeChild(s); }
                addEventListener('load', f, false);
                setTimeout(f, 3000);
            }
        })();

        //Disable certain links
        $('a[href^=#]').click(function (e) {
            e.preventDefault()
        })

        $('.search-btn').addClass('nostyle');//tell uniform to not style this element


        //------------- Navigation -------------//
        $('#wrapper').css('min-height', $(window).height());///////ADJUST HEIGHT OF LEFT MENU
        $('#content').css('min-height', $(window).height());///////ADJUST HEIGHT OF LEFT MENU
        mainNav = $('.mainnav>ul>li');
        mainNav.find('ul').siblings().addClass('hasUl').append('<span class="hasDrop icon16 icomoon-icon-arrow-right-2" style="float:right;" ></span>');
        mainNavLink = mainNav.find('a').not('.sub a');
        mainNavLinkAll = mainNav.find('a');
        mainNavSubLink = mainNav.find('.sub a').not('.sub li .sub a');
        mainNavCurrent = mainNav.find('a.current');

        //remove current class if have
        mainNavCurrent.removeClass('current');
        //set the seleceted menu element
        if ($.cookie("newCurrentMenu")) {
            mainNavLinkAll.each(function (index) {
                if ($(this).attr('href') == $.cookie("newCurrentMenu")) {
                    //set new current class
                    $(this).addClass('current');

                    ulElem = $(this).closest('ul');
                    if (ulElem.hasClass('sub')) {
                        //its a part of sub menu need to expand this menu
                        aElem = ulElem.prev('a.hasUl').addClass('drop');
                        ulElem.addClass('expand');
                    }
                    //create new cookie
                    $.cookie("currentPage", $(this).attr('href'));
                }
            });
        }

        //hover magic add blue color to icons when hover - remove or change the class if not you like.
        mainNavLinkAll.hover(
          function () {
              $(this).css('color', 'rgb(232, 32, 36)');
              $(this).find('span.icon16').addClass('red').removeClass('icomoon-icon-arrow-right-2').addClass('icomoon-icon-arrow-down-2');
          },
          function () {
              $(this).css('color', 'black');
              $(this).find('span.icon16').removeClass('red').removeClass('icomoon-icon-arrow-down-2').addClass('icomoon-icon-arrow-right-2');
          }
        );

        //click magic
        mainNavLink.click(function (event) {
            $this = $(this);

            if ($this.hasClass('hasUl')) {
                event.preventDefault();


                $.cookie("newCurrentTitle", $this.html(), { expires: null });
                $.cookie("moduleid", $this.attr('tag'), { expires: null });
                $.cookie("newCurrentMenu", null);
                //var cc = 
                window.location.href = 'centre.aspx';
                if ($this.hasClass('drop')) {
                    $(this).siblings('ul.sub').slideUp(500, 'jswing').siblings().removeClass('drop');
                } else {
                    $(this).siblings('ul.sub').slideDown(500, 'jswing').siblings().addClass('drop');
                }
            } else {
                //has no ul so store a cookie for change class.
                $.cookie("newCurrentMenu", $this.attr('href'), { expires: null });
                $.cookie("newCurrentTitle", $this.html(), { expires: null });
            }
        });
        mainNavSubLink.click(function (event) {
            $this = $(this);


            if ($this.hasClass('hasUl')) {
                event.preventDefault();
                if ($this.hasClass('drop')) {
                    $(this).siblings('ul.sub').slideUp(500).siblings().removeClass('drop');
                } else {
                    $(this).siblings('ul.sub').slideDown(250).siblings().addClass('drop');
                }
            } else {
                //has no ul so store a cookie for change class.
                $.cookie("newCurrentMenu", $this.attr('href'), { expires: null });
                $.cookie("newCurrentTitle", $this.html(), { expires: null });
            }
        });

        $('.heading h3').html($.cookie("newCurrentTitle"));
        //responsive buttons
        $('.resBtn>a').click(function (event) {
            $this = $(this);
            if ($this.hasClass('drop')) {
                $('#sidebar>.shortcuts').slideUp(500).addClass('hided');
                $('#sidebar>.sidenav').slideUp(500).addClass('hided');
                $('#sidebar-right>.shortcuts').slideUp(500).addClass('hided');
                $('#sidebar-right>.sidenav').slideUp(500).addClass('hided');
                $this.removeClass('drop');
            } else {
                if ($('#sidebar').length) {
                    $('#sidebar').css('display', 'block');
                    if ($('#sidebar-right').length) {
                        $('#sidebar-right').css({ 'display': 'block', 'margin-top': '0' });
                    }
                }
                if ($('#sidebar-right').length) {
                    $('#sidebar-right').css('display', 'block');
                }
                $('#sidebar>.shortcuts').slideDown(250);
                $('#sidebar>.sidenav').slideDown(250);
                $('#sidebar-right>.shortcuts').slideDown(250);
                $('#sidebar-right>.sidenav').slideDown(250);
                $this.addClass('drop');
            }
        });
        $('.resBtnSearch>a').click(function (event) {
            $this = $(this);
            if ($this.hasClass('drop')) {
                $('.search').slideUp(500);
                $this.removeClass('drop');
            } else {
                $('.search').slideDown(250);
                $this.addClass('drop');
            }
        });

        //Hide and show sidebar btn


        $(function () {
            //var pages = ['grid.html','charts.html'];
            var pages = [];

            for (var i = 0, j = pages.length; i < j; i++) {

                if ($.cookie("currentPage") == pages[i]) {
                    var cBtn = $('.collapseBtn.leftbar');
                    cBtn.children('a').attr('title', 'Show Left Sidebar');
                    cBtn.addClass('shadow hide');
                    cBtn.css({ 'top': '20px', 'left': '200px' });
                    $('#sidebarbg').css('margin-left', '-299' + 'px');
                    $('#sidebar').css('margin-left', '-299' + 'px');
                    if ($('#content').length) {
                        $('#content').css('margin-left', '0');
                    }
                    if ($('#content-two').length) {
                        $('#content-two').css('margin-left', '0');
                    }
                }

            }

        });

        $('.collapseBtn').bind('click', function () {
            $this = $(this);

            //left sidbar clicked
            if ($this.hasClass('leftbar')) {

                if ($(this).hasClass('hide')) {
                    //show sidebar
                    $('#sidebarbg').css('margin-left', '0');
                    $('#content').css('margin-left', '213' + 'px');
                    $('#content-two').css('margin-left', '213' + 'px');
                    $('#sidebar').css({ 'left': '0', 'margin-left': '0' });

                    $this.removeClass('hide');
                    $('.collapseBtn.leftbar').css('top', '120' + 'px').css('left', '170' + 'px').removeClass('shadow');
                    $this.children('a').attr('title', 'Hide Left Sidebar');

                } else {
                    //hide sidebar
                    $('#sidebarbg').css('margin-left', '-299' + 'px');
                    $('#sidebar').css('margin-left', '-299' + 'px');
                    $('.collapseBtn.leftbar').animate({ //use .hide() if you experience heavy animation :)
                        left: '220px',
                        top: '15.5'
                    }, 500, 'easeInExpo', function () {
                        // Animation complete.

                    }).addClass('shadow');
                    //expand content
                    $this.addClass('hide');
                    $this.children('a').attr('title', 'Show Left Sidebar');
                    if ($('#content').length) {
                        $('#content').css('margin-left', '0');
                    }
                    if ($('#content-two').length) {
                        $('#content-two').css('margin-left', '0');
                    }

                }

            }

            //right sidebar clicked
            if ($this.hasClass('rightbar')) {

                if ($(this).hasClass('hide')) {
                    //show sidebar
                    $('#sidebarbg-right').css('margin-right', '0');
                    $('#sidebar-right').css({ 'right': '0', 'margin-right': '0' });
                    if ($('#content').length) {
                        $('#content').css('margin-left', '213' + 'px');
                    }
                    if ($('#content-one').length) {
                        $('#content-one').css('margin-right', '212' + 'px');
                    }
                    if ($('#content-two').length) {
                        $('#content-two').css({ 'margin-right': '212' + 'px' });
                    }
                    /*if($('#sidebar').length) {
                        $('#sidebar').css({'left' : '0', 'margin-left' : '0'});
                    }*/
                    $this.removeClass('hide');
                    $('.collapseBtn.rightbar').css('top', '120' + 'px').css('right', '18' + 'px').removeClass('shadow');
                    $this.children('a').attr('title', 'Hide Right Sidebar');

                } else {
                    //hide sidebar
                    $('#sidebarbg-right').css('margin-right', '-299' + 'px');
                    $('#sidebar-right').css('margin-right', '-299' + 'px');
                    if ($('#content').length) {
                        $('#content').css('margin-right', '0');
                    }
                    if ($('#content-one').length) {
                        $('#content-one').css({ 'margin-left': '0', 'margin-right': '0' });
                    }
                    if ($('#content-two').length) {
                        $('#content-two').css({ 'margin-right': '0' });
                    }
                    $('.collapseBtn.rightbar').animate({ //use .hide() if you experience heavy animation :)
                        right: '10',
                        top: '78'
                    }, 500, 'easeInExpo', function () {
                        // Animation complete.

                    }).addClass('shadow');
                    //expand content
                    $this.addClass('hide');
                    $this.children('a').attr('title', 'Show Right Sidebar')
                }

            }
        });
        //First Run Settings
        //////var bIsFirstRun = $.cookie('FirstRun');
        //////if (bIsFirstRun == "1") {
        //////    alert("First Run TRUE");
        //////    $.cookie("FirstRun", "0");
        //////}
        //////else {
        //////    alert("First Run False");
        //////}
        //------------- widget box magic -------------//

        var widget = $('div.box');
        var widgetOpen = $('div.box').not('div.box.closed');
        var widgetClose = $('div.box.closed');
        //close all widgets with class "closed"
        widgetClose.find('div.content').hide();
        widgetClose.find('.title>.minimize').removeClass('minimize').addClass('maximize');

        widget.find('.title>a').click(function (event) {
            event.preventDefault();
            var $this = $(this);
            if ($this.hasClass('minimize')) {
                //minimize content
                $this.removeClass('minimize').addClass('maximize');
                $this.parent('div').addClass('min');
                cont = $this.parent('div').next('div.content')
                cont.slideUp(1000, 'easeOutExpo'); //change effect if you want :)

            } else
                if ($this.hasClass('maximize')) {
                    //minimize content
                    $this.removeClass('maximize').addClass('minimize');
                    $this.parent('div').removeClass('min');
                    cont = $this.parent('div').next('div.content');
                    cont.slideDown(1000, 'easeInExpo'); //change effect if you want :)
                }

        })

        //show minimize and maximize icons
        widget.hover(function () {
            $(this).find('.title>a').show(50);
        }
            , function () {
                $(this).find('.title>a').hide();
            });

        //add shadow if hover box
        widget.hover(function () {
            $(this).addClass('hover');
        }
            , function () {
                $(this).removeClass('hover');
            });

        //------------- placeholder fallback  -------------//
        $('input[placeholder], textarea[placeholder]').placeholder();

        //------------- Search forms  submit handler  -------------//
        $('#search-form').submit(function () {
            return false;
        });

        //make custom redirect for search form in .heading
        $('#searchform').submit(function () {
            var sText = $('.top-search').val();
            var sAction = $(this).attr('action');
            var sUrl = sAction + '?q=' + sText;
            $(location).attr('href', sUrl);
            return false;
        });

        //------------- To top plugin  -------------//
        $().UItoTop({
            //containerID: 'toTop', // fading element id
            //containerHoverID: 'toTopHover', // fading element hover id
            //scrollSpeed: 1200,
            easingType: 'easeOutQuart'
        });

        //------------- Tooltips -------------//

        //top tooltip
        $('.tip').qtip({
            content: false,
            position: {
                my: 'bottom center',
                at: 'top center',
                viewport: $(window)
            },
            style: {
                classes: 'ui-tooltip-tipsy'
            }
        });

        //tooltip in right
        $('.tipR').qtip({
            content: false,
            position: {
                my: 'left center',
                at: 'right center',
                viewport: $(window)
            },
            style: {
                classes: 'ui-tooltip-tipsy'
            }
        });

        //tooltip in bottom
        $('.tipB').qtip({
            content: false,
            position: {
                my: 'top center',
                at: 'bottom center',
                viewport: $(window)
            },
            style: {
                classes: 'ui-tooltip-tipsy'
            }
        });

        //tooltip in left
        $('.tipL').qtip({
            content: false,
            position: {
                my: 'right center',
                at: 'left center',
                viewport: $(window)
            },
            style: {
                classes: 'ui-tooltip-tipsy'
            }
        });

        //------------- Search forms  submit handler  -------------//
        $('#search-form').submit(function () {
            return false;
        });

        //make custom redirect for search form in .heading
        $('#searchform').submit(function () {
            var sText = $('.top-search').val();
            var sAction = $(this).attr('action');
            var sUrl = sAction + '?q=' + sText;
            $(location).attr('href', sUrl);
            return false;
        });

        //------------- Uniform  -------------//
        //add class .nostyle if not want uniform to style field
        //$("input, textarea, select").not('.nostyle').uniform();//COMMENT BY HASSUE

        //remove loadstate class from body and show the page
        setTimeout('$("html").removeClass("loadstate")', 500);



        //--------------- Accordion ------------------//
        var acc = $('.accordion'); //get all accordions
        var accHeading = acc.find('.accordion-heading');
        var accBody = acc.find('.accordion-body');

        //function to put icons
        accPutIcon = function () {
            acc.each(function (index) {
                accExp = $(this).find('.accordion-body.in');
                accExp.prev().find('a.accordion-toggle').prepend($('<span class="icon12 entypo-icon-minus-2 gray"></span>'));
                //$('<span class="icon12 entypo-icon-minus-2 gray"></span>').appendTo(accExp.prev().find('a.accordion-toggle'));
                accNor = $(this).find('.accordion-body').not('.accordion-body.in');
                accNor.prev().find('a.accordion-toggle').prepend($('<span class="icon12 entypo-icon-plus-2 gray"></span>'));
                // $('<span class="icon12 entypo-icon-plus-2 gray"></span>').appendTo(accNor.prev().find('a.accordion-toggle'));

            });
        }

        //function to update icons
        accUpdIcon = function () {
            acc.each(function (index) {
                accExp = $(this).find('.accordion-body.in');
                accExp.prev().find('span').remove();
                accExp.prev().find('a.accordion-toggle').prepend($('<span class="icon12 entypo-icon-minus-2 gray"></span>'));
                //$('<span class="icon12 entypo-icon-minus-2 gray"></span>').appendTo(accExp.prev().find('a.accordion-toggle'));
                accNor = $(this).find('.accordion-body').not('.accordion-body.in');
                accNor.prev().find('span').remove();
                accNor.prev().find('a.accordion-toggle').prepend($('<span class="icon12 entypo-icon-plus-2 gray"></span>'));
                //$('<span class="icon12 entypo-icon-plus-2 gray"></span>').appendTo(accNor.prev().find('a.accordion-toggle'));


            });
        }

        accPutIcon();

        $('.accordion').on('shown', function () {
            accUpdIcon();
        }).on('hidden', function () {
            accUpdIcon();
        })

        $('.Integer').live('keydown', function (event) {
            // Allow special chars + arrows 
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9
                || event.keyCode == 27 || event.keyCode == 13
                || (event.keyCode == 65 && event.ctrlKey === true)
                || (event.keyCode >= 35 && event.keyCode <= 39)) {
                return;
            } else {
                // If it's not a number stop the keypress
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                    event.preventDefault();
                }
            }
        });

        $('.Alpha').live('keyup blur', function () {
            var node = $(this);
            node.val(node.val().replace(/[^.a-z A-Z]/g, ''));
        });



        function commaSeparateNumber(val) {
            while (/(\d+)(\d{3})/.test(val.toString())) {
                val = val.toString().replace(/(\d+)(\d{3})/, '$1' + ',' + '$2');
            }
            return val;
        }


        //circular progrress bar
        $(function () {

            $(".greenCircle").knob({
                'min': 0,
                'max': 100,
                'readOnly': true,
                'width': 80,
                'height': 80,
                'fgColor': '#9FC569',
                'dynamicDraw': true,
                'thickness': 0.2,
                'tickColorizeValues': true
            })
            $(".redCircle").knob({
                'min': 0,
                'max': 100,
                'readOnly': true,
                'width': 80,
                'height': 80,
                'fgColor': '#ED7A53',
                'dynamicDraw': true,
                'thickness': 0.2,
                'tickColorizeValues': true
            })
            $(".blueCircle").knob({
                'min': 0,
                'max': 100,
                'readOnly': true,
                'width': 80,
                'height': 80,
                'fgColor': '#88BBC8',
                'dynamicDraw': true,
                'thickness': 0.2,
                'tickColorizeValues': true
            })

        });
    }
});// End OF READY
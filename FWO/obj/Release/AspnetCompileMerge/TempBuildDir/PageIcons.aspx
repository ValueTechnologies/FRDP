<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="PageIcons.aspx.cs" Inherits="FRDP.PageIcons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .icon-select{
    width:0px;
 }

 .icon-select .selected-box {

     position: relative;
     margin: 0px;
     padding: 0px;
     width: 70px; /* sil */
     height: 60px; /* sil */
     border: 1px solid #999999;

     -webkit-border-radius: 3px;
     -moz-border-radius: 3px;
     border-radius: 3px;

 }

 .icon-select .selected-box:hover {

     position: relative;
     margin: 0px;
     padding: 0px;
     width: 70px; /* sil */
     height: 60px; /* sil */
     border: 1px solid #000000;
     background-color: #FFFFFF;

     -webkit-border-radius: 3px;
     -moz-border-radius: 3px;
     border-radius: 3px;

 }

 .icon-select .selected-icon {

     position: absolute;
     margin: 0px;
     padding: 0px;
     top:5px;
     left:5px;
     width: 48px; /* sil */
     height: 48px; /* sil */

     -webkit-border-radius: 3px;
     -moz-border-radius: 3px;
     border-radius: 3px;

 }

 .icon-select .component-icon{
     position: absolute;
     bottom:5px;
     right:4px;
 }

 .icon-select .box {

     position: absolute;
     top:0px;
     left:71px;
     margin: 0px;
     padding: 0px;
     width: 630px; /* sil */
     height: 170px; /* sil */
     border: 1px solid #EEEEEE;
     background-color: #EEEEEE;

     -webkit-border-radius: 3px;
     -moz-border-radius: 3px;
     border-radius: 3px;
     
     
     overflow:auto;
     /*
     -webkit-overflow-scrolling: touch;
     */

 }

 .icon-select .icon {
     position: relative;
     margin: 5px 0px 0px 5px;
     padding: 0px;
     width: 48px; /* sil */
     height: 48px; /* sil */
     border: 1px solid #CCCCCC;
     background-color: #FFFFFF;

     -webkit-border-radius: 3px;
     -moz-border-radius: 3px;
     border-radius: 3px;

     overflow:hidden;
     float: left;
 }

 .icon-select .icon:hover {
     border: 1px solid #000000;
 }

 .icon-select .icon.selected {
     position: relative;
     margin: 5px 0px 0px 5px;
     padding: 0px;
     width: 48px; /* sil */
     height: 48px; /* sil */
     border: 1px solid #EEEEEE;
     background-color: #EEEEEE;

     -webkit-border-radius: 3px;
     -moz-border-radius: 3px;
     border-radius: 3px;

     overflow:hidden;
     float: left;
 }
    </style>
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Icon Selection</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <table style="width: 96.4%; margin-left: 20px; margin-right: 20px;">
                        <tbody>
                            <tr>
                                <td style="width: 100px;">Module Name :</td>
                                <td style="text-align: left; width: 500px;">
                                    <select id="ddlModuleName" style="width: 93.5%;">
                                    </select></td>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                    <br />

                    <table id="faqs" class="responsive table table-striped table-bordered table-condensed" style="width: 96%; margin-left: 20px; margin-right: 20px; border-right: 1px solid #c4c4c4;">
                        <thead>
                            <tr>
                                <th style="width: 60px;">Priority</th>
                                <th style="width: 200px;">Page Name</th>
                                <th>Icon</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                    <br />
                    <br />

                    
                </div>

            </div>

        </div>
    </div>

    <script type="text/javascript">
        IconSelect.DEFAULT = {};
        IconSelect.DEFAULT.SELECTED_ICON_WIDTH = 48;
        IconSelect.DEFAULT.SELECTED_ICON_HEIGHT = 48;
        IconSelect.DEFAULT.SELECTED_BOX_PADDING = 1;
        IconSelect.DEFAULT.SELECTED_BOX_PADDING_RIGHT = 12;
        IconSelect.DEFAULT.ICONS_WIDTH = 32;
        IconSelect.DEFAULT.ICONS_HEIGHT = 32;
        IconSelect.DEFAULT.BOX_ICON_SPACE = 1;
        IconSelect.DEFAULT.HORIZONTAL_ICON_NUMBER = 3;
        IconSelect.DEFAULT.VECTORAL_ICON_NUMBER = 3;

        IconSelect.COMPONENT_ICON_FILE_PATH = "images/arrow.png";

        function IconSelect($$elementID, $$parameters) {

            var _icons = [];
            var _selectedIndex = -1;
            var _boxScroll;

            var _default = IconSelect.DEFAULT;

            function _init() {

                //parametreler boş gelirse
                if (!$$parameters) $$parameters = {};
                //En üst elementi seç
                if (_View.setIconSelectElement($$elementID)) {

                    //set parameters
                    $$parameters = _Model.checkParameters($$parameters);
                    //create UI
                    var ui = _View.createUI($$parameters, $$elementID);
                    //basıldığında göster/gizle
                    _View.iconSelectElement.onclick = function () {
                        _View.showBox();
                    };

                    //Başlangıçta gizle
                    _View.showBox(false);

                    //Nesneye basıldığında gizlemeyi iptal et.
                    _View.iconSelectElement.addEventListener('click', function ($event) {
                        $event.stopPropagation();
                    });

                    //dışarı basıldığında gizle.
                    window.addEventListener('click', function () {
                        _View.showBox(false);
                    });

                } else {
                    alertR("Element not found.");
                }

            }

            //Tüm iconları yeniden yükle.
            this.refresh = function ($icons) {

                _icons = [];

                var setSelectedIndex = this.setSelectedIndex;

                for (var i = 0; i < $icons.length; i++) {
                    $icons[i].element = _View.createIcon($icons[i].iconFilePath, $icons[i].iconValue, i, $$parameters);
                    $icons[i].element.onclick = function () {
                        setSelectedIndex(this.childNodes[0].getAttribute('icon-index'));

                    };
                    _icons.push($icons[i]);

                }

                var horizontalIconNumber = Math.round(($icons.length) / $$parameters.vectoralIconNumber);

                _View.boxElement.style.height = (($$parameters.iconsHeight + 2) * horizontalIconNumber) +
                        ((horizontalIconNumber + 1) * $$parameters.boxIconSpace);
                this.setSelectedIndex(0);


            };

            //icon listesini al.
            this.getIcons = function () { return _icons; };

            //iconu seçili hale gelir.
            this.setSelectedIndex = function ($index) {
                var icon;

                if (_icons.length > $index)
                    icon = _icons[$index];

                if (icon) {
                    //eski icondan seçilme özelliğini kaldır.
                    if (_selectedIndex != -1) _icons[_selectedIndex].element.setAttribute('class', 'icon');
                    _selectedIndex = $index;
                    _View.selectedIconImgElement.setAttribute('src', icon.iconFilePath);

                    //var indexes = $.map(_icons, function (obj, index) {
                    //    if (obj.iconValue == $index) {
                    //        return index;
                    //    }
                    //})
                    //$index = indexes[0];

                    //_View.iconSelectElement.setAttribute('vl', _icons[$index].iconValue);
                    _View.iconSelectElement.setAttribute('vl', icon.iconValue);
                    if (_selectedIndex != -1) _icons[_selectedIndex].element.setAttribute('class', 'icon selected');
                }

                _View.iconSelectElement.dispatchEvent(new Event('changed'));

                //_View.showBox(false);

            };
            this.setSelectedIndexByID = function ($index) {

                var indexes = $.map(_icons, function (obj, index) {
                    if (obj.iconValue == $index) {
                        return index;
                    }
                })
                $index = indexes[0];
                var icon;

                if (_icons.length > $index)
                    icon = _icons[$index];

                if (icon) {
                    //eski icondan seçilme özelliğini kaldır.
                    if (_selectedIndex != -1) _icons[_selectedIndex].element.setAttribute('class', 'icon');
                    _selectedIndex = $index;
                    _View.selectedIconImgElement.setAttribute('src', icon.iconFilePath);
                    _View.iconSelectElement.setAttribute('vl', icon.iconValue);
                    if (_selectedIndex != -1) _icons[_selectedIndex].element.setAttribute('class', 'icon selected');
                }

                _View.iconSelectElement.dispatchEvent(new Event('changed'));

                //_View.showBox(false);

            };
            this.getSelectedIndex = function () { return _selectedIndex; };
            this.getSelectedValue = function () { return _icons[_selectedIndex].iconValue };
            this.getSelectedFilePath = function () { return _icons[_selectedIndex].iconFilePath };



            //### VIEW CLASS ###

            function _View() { }

            _View.iconSelectElement;
            _View.boxElement;
            _View.boxScrollElement;
            _View.selectedIconImgElement;
            _View.selectedIconElement;

            _View.showBox = function ($isShown) {

                if ($isShown == null) {
                    $isShown = (_View.boxElement.style.display == "none") ? true : false;
                }

                if ($isShown) {
                    _View.boxElement.style.display = "block";
                    _View.boxScrollElement.style.display = "block";
                    //_boxScroll = (_boxScroll) ? _boxScroll : new iScroll($$elementID + "-box-scroll");
                } else {
                    _View.boxElement.style.display = "none";
                    _View.boxScrollElement.style.display = "none";
                }

                _View.boxElement.style.display = ($isShown) ? "block" : "none";



            };

            _View.setIconSelectElement = function ($elementID) {
                _View.iconSelectElement = document.getElementById($elementID);

                return _View.iconSelectElement;
            };

            _View.clearUI = function () {
                _View.iconSelectElement.innerHTML = "";
            };

            _View.clearIcons = function () {
                _View.boxElement.innerHTML = "";
            };

            _View.createUI = function ($parameters) {

                /* HTML MODEL
                
                <div id="my-icon-select" class="icon-select">
                    <div class="selected-box">
                        <div class="selected-icon"><img src="images/icons/i2.png"></div>
                        <div class="component-icon"><img src="images/arrow.png"></div>
                        <div class="box">
                            <div class="icon"><img src="images/icons/i1.png"></div>
                            <div class="icon selected"><img src="images/icons/i2.png"></div>
                            <div class="icon"><img src="images/icons/i3.png"></div>
                            <div class="icon"><img src="images/icons/i4.png"></div>
                            <div class="icon"><img src="images/icons/i3.png"></div>
                            <div class="icon"><img src="images/icons/i4.png"></div>
                            <div class="icon"><img src="images/icons/i5.png"></div>
                            <div class="icon"><img src="images/icons/i6.png"></div>
                            <div class="icon"><img src="images/icons/i7.png"></div>
                            <div class="icon"><img src="images/icons/i8.png"></div>
                        </div>
                    </div>
                </div>
                
                */

                _View.clearUI();

                _View.iconSelectElement.setAttribute('class', 'icon-select');

                var selectedBoxElement = document.createElement('div');
                selectedBoxElement.setAttribute('class', 'selected-box');

                var selectedIconElement = document.createElement('div');
                selectedIconElement.setAttribute('class', 'selected-icon');

                _View.selectedIconImgElement = document.createElement('img');
                _View.selectedIconImgElement.setAttribute('src', '');
                selectedIconElement.appendChild(_View.selectedIconImgElement);

                var componentIconElement = document.createElement('div');
                componentIconElement.setAttribute('class', 'component-icon');

                var componentIconImgElement = document.createElement('img');
                componentIconImgElement.setAttribute('src', IconSelect.COMPONENT_ICON_FILE_PATH);

                componentIconElement.appendChild(componentIconImgElement);

                _View.boxScrollElement = document.createElement('div');
                _View.boxScrollElement.setAttribute('id', $$elementID + "-box-scroll");
                _View.boxScrollElement.setAttribute('class', 'box');

                _View.boxElement = document.createElement('div');

                //_View.boxElement.setAttribute('class', 'box');
                _View.boxScrollElement.appendChild(_View.boxElement);

                _View.selectedIconImgElement.setAttribute('width', $parameters.selectedIconWidth);
                _View.selectedIconImgElement.setAttribute('height', $parameters.selectedIconHeight);
                selectedIconElement.style.width = $parameters.selectedIconWidth;
                selectedIconElement.style.height = $parameters.selectedIconHeight;
                selectedBoxElement.style.width = $parameters.selectedIconWidth + $parameters.selectedBoxPadding + $parameters.selectedBoxPaddingRight;
                selectedBoxElement.style.height = $parameters.selectedIconHeight + ($parameters.selectedBoxPadding * 2);
                selectedIconElement.style.top = $parameters.selectedBoxPadding;
                selectedIconElement.style.left = $parameters.selectedBoxPadding;
                componentIconElement.style.bottom = 4 + $parameters.selectedBoxPadding;

                _View.boxScrollElement.style.left = parseInt(selectedBoxElement.style.width) + 1;

                _View.boxScrollElement.style.width = (($parameters.iconsWidth + 2) * $parameters.vectoralIconNumber) +
                        (($parameters.vectoralIconNumber + 1) * $parameters.boxIconSpace);
                _View.boxScrollElement.style.height = (($parameters.iconsHeight + 2) * $parameters.horizontalIconNumber) +
                        (($parameters.horizontalIconNumber + 1) * $parameters.boxIconSpace);

                _View.boxElement.style.left = _View.boxScrollElement.style.left;
                _View.boxElement.style.width = _View.boxScrollElement.style.width;

                _View.iconSelectElement.appendChild(selectedBoxElement);
                selectedBoxElement.appendChild(selectedIconElement);
                selectedBoxElement.appendChild(componentIconElement);
                selectedBoxElement.appendChild(_View.boxScrollElement);


                var results = {};
                results['iconSelectElement'] = _View.iconSelectElement;
                results['selectedBoxElement'] = selectedBoxElement;
                results['selectedIconElement'] = selectedIconElement;
                results['selectedIconImgElement'] = _View.selectedIconImgElement;
                results['componentIconElement'] = componentIconElement;
                results['componentIconImgElement'] = componentIconImgElement;

                return results;


                //trigger: created ( run setValues )

            };

            _View.createIcon = function ($iconFilePath, $iconValue, $index, $parameters) {

                /* HTML MODEL 
                 
                 <div class="icon"><img src="images/icons/i1.png"></div>
                 
                 */

                var iconElement = document.createElement('div');
                iconElement.setAttribute('class', 'icon');
                iconElement.style.width = $parameters.iconsWidth;
                iconElement.style.height = $parameters.iconsHeight;
                iconElement.style.marginLeft = $parameters.boxIconSpace;
                iconElement.style.marginTop = $parameters.boxIconSpace;

                var iconImgElement = document.createElement('img');
                iconImgElement.setAttribute('class', 'lazy');
                iconImgElement.setAttribute('data-original', $iconFilePath);
                iconImgElement.setAttribute('src', $iconFilePath);
                iconImgElement.setAttribute('icon-value', $iconValue);
                iconImgElement.setAttribute('icon-index', $index);
                iconImgElement.setAttribute('width', $parameters.iconsWidth);
                iconImgElement.setAttribute('height', $parameters.iconsHeight);

                iconElement.appendChild(iconImgElement);
                _View.boxElement.appendChild(iconElement);

                return iconElement;

            };

            //### MODEL CLASS ###

            function _Model() { }

            //TODO: params değişkenini kaldır yeni oluştursun.
            _Model.checkParameters = function ($parameters) {

                $parameters.selectedIconWidth = ($parameters.selectedIconWidth) ? $parameters.selectedIconWidth : _default.SELECTED_ICON_WIDTH;
                $parameters.selectedIconHeight = ($parameters.selectedIconHeight) ? $parameters.selectedIconHeight : _default.SELECTED_ICON_HEIGHT;
                $parameters.selectedBoxPadding = ($parameters.selectedBoxPadding) ? $parameters.selectedBoxPadding : _default.SELECTED_BOX_PADDING;
                $parameters.selectedBoxPaddingRight = ($parameters.selectedBoxPaddingRight) ? $parameters.selectedBoxPaddingRight : _default.SELECTED_BOX_PADDING_RIGHT;
                $parameters.iconsWidth = ($parameters.iconsWidth) ? $parameters.iconsWidth : _default.ICONS_WIDTH;
                $parameters.iconsHeight = ($parameters.iconsHeight) ? $parameters.iconsHeight : _default.ICONS_HEIGHT;
                $parameters.boxIconSpace = ($parameters.boxIconSpace) ? $parameters.boxIconSpace : _default.BOX_ICON_SPACE;
                $parameters.vectoralIconNumber = ($parameters.vectoralIconNumber) ? $parameters.vectoralIconNumber : _default.VECTORAL_ICON_NUMBER;
                $parameters.horizontalIconNumber = ($parameters.horizontalIconNumber) ? $parameters.horizontalIconNumber : _default.HORIZONTAL_ICON_NUMBER;

                return $parameters;

            };

            _init();

        }
        $(document).ready(function () {
           var _$_598d = ["POST", "exeData.ashx/?ID=1000\u01c1", "parseJSON", "length", "log", "ajax", "exeData.ashx/?ID=1001\u01c1", "", "<option value=\"", "Module_Id", "\">", "Module_Name", "</option>", "each", "html", "#ddlModuleName", "change", "live", "exeData.ashx/?ID=1002\u01c1", "val", "<tr style=\"height: 72px;\">\r                                <td>", "Priority", "</td>\r                                <td>", "Page_Name", "</td>\r                                <td style=\"text-align: left;\"><div id=\"ThisIcon", "Page_ID", "\" page_id=\"", "\" icon_id=\"", "tblPageIconID", "\"  class=\"dvSelectedIcon\"></div></td>\r                            </tr>", "#faqs tbody", "#", "icon_id", "attr", "vl", "exeData.ashx/?ID=1003\u01c1", "\u01c1", "page_id", "Icon Changed", "id", "refresh", "setSelectedIndexByID", "changed", "addEventListener", "getElementById", ".dvSelectedIcon", "click", "fadeIn", "lazyload", "show", "img.lazy", ".selected-icon"];
            var icons = [];
            var iconSelect;
            $(function () {
                $[_$_598d[5]]({
                    type: _$_598d[0],
                    url: _$_598d[1],
                    success: function (a) {
                        icons = $[_$_598d[2]](a);
                        console[_$_598d[4]](icons[_$_598d[3]]);
                        BidnModules();
                    }
                })
            });

            function BidnModules() {
                $[_$_598d[5]]({
                    type: _$_598d[0],
                    url: _$_598d[6],
                    success: function (a) {
                        var b = $[_$_598d[2]](a),
                            c = _$_598d[7];
                        $[_$_598d[13]](b, function (d, e) {
                            c += _$_598d[8] + e[_$_598d[9]] + _$_598d[10] + e[_$_598d[11]] + _$_598d[12]
                        });
                        $(_$_598d[15])[_$_598d[14]](c);
                        BidnModulePages();
                    }
                })
            }
            $(_$_598d[15])[_$_598d[17]](_$_598d[16], BidnModulePages);

            function BidnModulePages() {
                $[_$_598d[5]]({
                    type: _$_598d[0],
                    url: _$_598d[18] + $(_$_598d[15])[_$_598d[19]](),
                    success: function (a) {
                        var b = $[_$_598d[2]](a),
                            c = _$_598d[7];
                        $[_$_598d[13]](b, function (d, e) {
                            c += _$_598d[20] + e[_$_598d[21]] + _$_598d[22] + e[_$_598d[23]] + _$_598d[24] + e[_$_598d[25]] + _$_598d[26] + e[_$_598d[25]] + _$_598d[27] + e[_$_598d[28]] + _$_598d[29]
                        });
                        $(_$_598d[30])[_$_598d[14]](c);
                        BindIcons();
                    }
                })
            }

            function UpdateIt(k) {
                var f = $(_$_598d[31] + k);
                if (f[_$_598d[33]](_$_598d[32]) != f[_$_598d[33]](_$_598d[34])) {
                    $[_$_598d[5]]({
                        type: _$_598d[0],
                        url: _$_598d[35] + f[_$_598d[33]](_$_598d[34]) + _$_598d[36] + f[_$_598d[33]](_$_598d[37]),
                        success: function (a) {
                            f[_$_598d[33]](_$_598d[32], f[_$_598d[33]](_$_598d[34]));
                            alertG(_$_598d[38]);
                        }
                    })
                };
            }

            function BindIcons() {
                $(_$_598d[45])[_$_598d[13]](function (h, g) {
                    var f = $(this);
                    iconSelect = new IconSelect(f[_$_598d[33]](_$_598d[39]), {
                        "selectedIconWidth": 32,
                        "selectedIconHeight": 32,
                        "selectedBoxPadding": 1,
                        "iconsWidth": 23,
                        "iconsHeight": 23,
                        "boxIconSpace": 1
                    });
                    iconSelect[_$_598d[40]](icons);
                    iconSelect[_$_598d[41]](parseInt(f[_$_598d[33]](_$_598d[32])));
                    document[_$_598d[44]](f[_$_598d[33]](_$_598d[39]))[_$_598d[43]](_$_598d[42], function (j) {
                        UpdateIt(f[_$_598d[33]](_$_598d[39]))
                    });
                })
            }
            $(_$_598d[51])[_$_598d[17]](_$_598d[46], function () {
                $(_$_598d[50])[_$_598d[49]]()[_$_598d[48]]({
                    effect: _$_598d[47]
                })
            });

        });//End of Doc Ready
    </script>
</asp:Content>

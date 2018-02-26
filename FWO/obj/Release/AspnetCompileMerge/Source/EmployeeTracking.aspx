<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="EmployeeTracking.aspx.cs" Inherits="FRDP.EmployeeTracking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    <link rel="stylesheet" href="screen.css" />
    <link rel="stylesheet" href="../dist/MarkerCluster.css" />
    <link rel="stylesheet" href="../dist/MarkerCluster.Default.css" />
    <script src="../dist/leaflet.markercluster-src.js"></script>--%>
        <link href="plugins/Leaflet/screen.css" rel="stylesheet" />
    <link href="plugins/Leaflet/MarkerCluster.css" rel="stylesheet" />
    <link href="plugins/Leaflet/MarkerCluster.Default.css" rel="stylesheet" />
    <script type="text/javascript" src="plugins/Leaflet/leaflet.markercluster-src.js"></script>
    <div class="form-row row-fluid">
    


               <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Service Areas</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<div id="map" style="width: 99.8%; height:700px;"></div>
</div>

                            </div>

                        </div>
    </div>
   


    <script type="text/javascript">

        $(document).ready(function () {

            Vehicle();

            
            $('.heading h3').html('Service Areas');
        });

        function Vehicle() {

            var LeafIcon = L.Icon.extend({
                options: {
                    
                    iconSize: [32, 32],

                }
            });

            var greenIcon = new LeafIcon({ iconUrl: 'images/mm.png' });

            L.icon = function (options) {
                return new L.Icon(options);
            };




            var addressPoints = [

                [33.320474, 72.783737, "Location : <strong> Chakri Service Area</strong>"],
                [32.781485, 72.717159, "Location : <strong> Kallar Kahar Service Area </strong>"],
                [32.454615, 72.886879, "Location : <strong> Behra Service Area </strong>"],
                [31.971354, 73.113773, "Location : <strong> Sial Service Area </strong>"],
                [31.908356, 73.568715, "Location : <strong> Sukhekhi Service Area </strong>"]
            ];


            var tiles = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
                maxZoom: 18,
                attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors, Points &copy 2012 LINZ'
            }),
                latlng = L.latLng(32.8215231, 72.7451901);

            var map = L.map('map', { center: latlng, zoom: 9, layers: [tiles] });

            var markers = L.markerClusterGroup({ spiderfyOnMaxZoom: false, showCoverageOnHover: false, zoomToBoundsOnClick: false });

            for (var i = 0; i < addressPoints.length; i++) {
                var a = addressPoints[i];
                var title = a[2];
                var marker = L.marker(new L.LatLng(a[0], a[1]), { icon: greenIcon }, { title: title });
                marker.bindPopup(title);
                markers.addLayer(marker);
            }

            markers.on('clusterclick', function (a) {
                a.layer.spiderfy();
            });


            map.addLayer(markers);

        }

    </script>



</asp:Content>

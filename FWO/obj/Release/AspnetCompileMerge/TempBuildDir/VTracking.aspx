<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="VTracking.aspx.cs" Inherits="FRDP.VTracking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <%-- <link rel="stylesheet" href="screen.css" />--%>
<%--    <link rel="stylesheet" href="../dist/MarkerCluster.css" />--%>
    <%--<link rel="stylesheet" href="../dist/MarkerCluster.Default.css" />--%>
    <%--<script src="../dist/leaflet.markercluster-src.js"></script>--%>

    <link href="plugins/Leaflet/screen.css" rel="stylesheet" />
    <link href="plugins/Leaflet/MarkerCluster.css" rel="stylesheet" />
    <link href="plugins/Leaflet/MarkerCluster.Default.css" rel="stylesheet" />
    <script type="text/javascript" src="plugins/Leaflet/leaflet.markercluster-src.js"></script>
          <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Vehicle Tracking</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<div id="map" style="width: 99.8%;"></div>
</div>

                            </div>

                        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function () {

            var LeafIcon = L.Icon.extend({
                options: {
                    shadowUrl: 'Images/leaf-green.png',
                    iconSize: [64, 64],

                }
            });
           
            //var greenIcon = new LeafIcon({ iconUrl: 'leaf-green.png' }),
            var greenIcon = new LeafIcon({ iconUrl: 'Images/leaf-green.png' }),
            redIcon = new LeafIcon({ iconUrl: 'Images/leaf-green.png' }),
             orangeIcon = new LeafIcon({ iconUrl: 'Images/leaf-green.png' });

            L.icon = function (options) {
                return new L.Icon(options);
            };




            var addressPoints = [
                [32.455862, 72.887651, "Location : Heaven <br> <strong>Spotted: </strong> 3 seconds ago <br><br> <img src='Images/cars/hevan.jpg' alt='Visitor' style='width:304px;height:228px'>"],
                [32.453626, 72.886042, "Location : North <br> <strong>Spotted: </strong> 3 seconds ago <br><br> <img src='Images/cars/parking.jpg' alt='Rule of Law' style='width:304px;height:228px'>"],
                [32.455353, 72.887743, "Location : Soth <br> <strong>Spotted: </strong> 3 seconds ago <br><br> <img src='Images/cars/prado.jpg' alt='Rule of Law' style='width:304px;height:228px'>"]
            ];


            var tiles = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
                maxZoom: 18,
                attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors, Points &copy 2012 LINZ'
            }),
                latlng = L.latLng(32.4544475, 72.8870613);

            var map = L.map('map', { center: latlng, zoom: 17, layers: [tiles] });

           // var markers = L.markerClusterGroup({ spiderfyOnMaxZoom: false, showCoverageOnHover: false, zoomToBoundsOnClick: false });
            var markers = L.markerClusterGroup({ chunkedLoading: true });
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


        });




    </script>



</asp:Content>

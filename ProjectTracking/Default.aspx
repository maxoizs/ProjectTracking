<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="ProjectTracking._Default" %>
 
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type='text/javascript' src='http://www.google.com/jsapi'></script>
    <script src='http://maps.google.com/maps?file=api&v=2&key=ABCDEFG' type='text/javascript'></script>
    <script type='text/javascript'>
        google.load('visualization', '1', { 'packages': ['geomap'] });
        google.setOnLoadCallback(OnLoad);
        function OnLoad() {
            $.ajax({
                type: "POST",
                url: "Default.aspx/LoadProjectsMap",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: DrawProjectsMap
            });
        }
        var countryCode;
        function DrawProjectsMap(response) {

            var data = new google.visualization.DataTable();
            data.addRows(response.d.length);
            data.addColumn('string', 'Country');
            data.addColumn('number', 'Popularity');
            for (var i = 0; i < response.d.length; i++) {
                data.setValue(i, 0, response.d[i].Country);
                data.setValue(i, 1, response.d[i].Popularity);
            }
            var options = {};
            options['dataMode'] = 'regions';

            var container = document.getElementById('map_canvas');
            var geomap = new google.visualization.GeoMap(container);
            geomap.draw(data, options);

            google.visualization.events.addListener(
            geomap, 'regionClick', function (e) {
                countryCode = e['region'];
                //console.log('drillDown')
                //GoTo(countryCode);
                //DrillDown();
                LoadProjectsByCountry(countryCode);
            });

        }

        function LoadProjectsByCountry(countryCode) {
            $.ajax({
                type: "POST",
                url: "Default.aspx/LoadProjectsByCountry",
                data: '{CountryCode: "' + countryCode + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            });
        }

        function GoTo(country) {
            console.log(country);
            //$("<a href='/Project.aspx?country=" + country + "'></a>").click();
            location.href = "/Default.aspx?Country=" + country;
            return false;
        }

        function DrillDown() {

            $.ajax({
                type: "POST",
                url: "CS.aspx/GetCities",
                data: '{CountryCode: "' + countryCode + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: CreateCountryMap
            });
        }

        function CreateCountryMap(response) {
            console.log(countryCode);
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'City');
            data.addColumn('number', 'Popularity');
            data.addRows(response.d.length);
            for (var i = 0; i < response.d.length; i++) {
                data.setValue(i, 0, response.d[i].City);
                data.setValue(i, 1, response.d[i].Popularity);
            }
            var options = {};
            options['region'] = countryCode;
            options['colors'] = [0xFF8747, 0xFFB581, 0xc06000]; //orange colors
            options['dataMode'] = 'markers';
            //options['showZoomOut'] = true;

            var container = document.getElementById('map_canvas2');
            var geomap = new google.visualization.GeoMap(container);
            geomap.draw(data, options);
            //google.visualization.events.addListener(
            //geomap, 'zoomOut', function(e) {
            //OnLoad();
            //});
        }
 
    </script>
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="false" Skin="MetroTouch" />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="ProjectsRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ProjectsRadGrid"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div id="demo" class="demo-container no-bg">
        <p><br /></p>
        <fieldset class="rdfFieldset rdfBorders">
             <legend class="rdfLegend">Active Projects</legend>
             <div id='map_canvas'></div>
        </fieldset>
        <br />
        <fieldset class="rdfFieldset rdfBorders">
             <legend class="rdfLegend">Active Projects in <asp:Label ID="lblCountry" runat="server"></asp:Label></legend>
            <telerik:RadGrid RenderMode="Lightweight" runat="server" ID="ProjectsRadGrid" AllowPaging="True" AllowSorting="true"
                OnSortCommand="ProjectsRadGrid_SortCommand" OnPageIndexChanged="ProjectsRadGrid_PageIndexChanged" OnPageSizeChanged="ProjectsRadGrid_PageSizeChanged">
            </telerik:RadGrid> 
        </fieldset>              
    </div>
</asp:Content>
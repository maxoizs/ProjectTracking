<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Indicators.aspx.cs" Inherits="ProjectTracking.Indicators" %>
 
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns='http://www.w3.org/1999/xhtml'>
<head id="Head1" runat="server">
    <title>OnTrack</title>
    <link id="Link1" href="Styles/Site.css" rel="stylesheet" type="text/css" runat="server" />
    <!--<link href="Skins/Silk/Grid.Silk.css" rel="stylesheet" type="text/css" runat="server" />
    <link href="Skins/Silk/Menu.Silk.css" rel="stylesheet" type="text/css" runat="server" />
    <link href="Skins/MetroTouch/Grid.MetroTouch.css" rel="stylesheet" type="text/css" runat="server" />
    <link href="Skins/MetroTouch/Menu.MetroTouch.css" rel="stylesheet" type="text/css" runat="server" />-->
</head>
<body>
    <form id="form2" runat="server">
    <div class="header" id="header">
        <h1 class="title">OnTrack</h1>
    </div>
    <div class="content">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="ImpactRadGrid">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="ImpactRadGrid"></telerik:AjaxUpdatedControl>
                        <telerik:AjaxUpdatedControl ControlID="OutcomeIndicatorsRadGrid"></telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="false" Skin="MetroTouch" />
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecorationZoneID="demo" DecoratedControls="All" EnableRoundedCorners="false"/>
        <div id="demo" class="demo-container no-bg">
            <fieldset>
            <legend>Impact Indicators</legend>
            <telerik:RadGrid RenderMode="Lightweight" ID="ImpactRadGrid" DataSourceID="ImpactIndicatorsDataSource" runat="server"
                AutoGenerateColumns="False" PageSize="5" AllowSorting="True" AllowMultiRowSelection="False"
                AllowPaging="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True"
                AllowAutomaticUpdates="True" OnItemUpdated="ImpactRadGrid_ItemUpdated" OnItemDeleted="ImpactRadGrid_ItemDeleted"
                OnItemInserted="ImpactRadGrid_ItemInserted" OnItemDataBound="ImpactRadGrid_ItemDataBound">
                <PagerStyle Mode="NumericPages"></PagerStyle>
                <MasterTableView DataSourceID="ImpactDataSource" DataKeyNames="ID" AllowMultiColumnSorting="True"
                    Width="100%" CommandItemDisplay="Top" Name="ImpactIndicator">
                    <CommandItemSettings ShowRefreshButton="false"/> 
                    <DetailTables>
                        <telerik:GridTableView DataSourceID="ImpactIndicatorsDataSource" DataKeyNames="ID" 
                            Width="100%" CommandItemDisplay="Top" Name="Indicators">
                            <CommandItemSettings AddNewRecordText="Add Indicator" ShowRefreshButton="false"/> 
                            <ParentTableRelation>
                                <telerik:GridRelationFields DetailKeyField="RefID" MasterKeyField="ID"></telerik:GridRelationFields>
                            </ParentTableRelation>
                            <Columns>
                                <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    <ItemStyle CssClass="MyImageButton"></ItemStyle>
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn SortExpression="RefID" HeaderText="Ref ID" HeaderButtonType="TextButton"
                                    DataField="RefID" UniqueName="RefID" ReadOnly="true" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="ID" HeaderText="Indicator ID" HeaderButtonType="TextButton"
                                    DataField="ID" UniqueName="ID" ReadOnly="true" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="Indicator" ItemStyle-Width="240px">
                                <ItemTemplate>
                                    <%#DataBinder.Eval(Container.DataItem, "Type")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Type"  DataTextField="Type"
                                        DataValueField="IndicatorID" DataSourceID="ImpactIndicatorDataSource" SelectedValue='<%#Bind("IndicatorID") %>'>
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn SortExpression="TargetValue" HeaderText="Target" HeaderButtonType="TextButton"
                                    DataField="TargetValue" UniqueName="TargetValue">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="BaselineValue" HeaderText="Baseline" HeaderButtonType="TextButton"
                                    DataField="BaselineValue" UniqueName="BaselineValue">
                                </telerik:GridBoundColumn>
                                <telerik:GridButtonColumn ConfirmText="Delete this indicator?"
                                    CommandName="Delete" Text="Delete" UniqueName="DeleteColumn">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton"></ItemStyle>
                                </telerik:GridButtonColumn>
                            </Columns>
                            <SortExpressions>
                                <telerik:GridSortExpression FieldName="ID" SortOrder="Ascending"></telerik:GridSortExpression>
                            </SortExpressions>
                        </telerik:GridTableView>
                    </DetailTables>
                      <Columns>
                            <telerik:GridBoundColumn HeaderText="Impact ID" HeaderButtonType="TextButton"
                                DataField="ID" UniqueName="ID" ReadOnly="true" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="" HeaderStyle-Width="90%" 
                                UniqueName="Statement" DataField="Statement"  ItemStyle-Wrap="true">
                                <HeaderStyle HorizontalAlign="Left" Width="99%" />
                                <ItemStyle HorizontalAlign="Left" Width="99%"/>
                                <ItemTemplate>
                                    <%#DataBinder.Eval(Container.DataItem, "Statement")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                 </MasterTableView>
            </telerik:RadGrid>
            </fieldset>
            <br />
            <fieldset>
            <legend>Outcome indicators</legend>
            <telerik:RadGrid RenderMode="Lightweight" ID="OutcomeIndicatorsRadGrid" DataSourceID="OutcomeIndicatorsDataSource" runat="server"
                AutoGenerateColumns="False" PageSize="5" AllowSorting="True" AllowMultiRowSelection="False"
                AllowPaging="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True"
                AllowAutomaticUpdates="True" OnItemUpdated="ImpactRadGrid_ItemUpdated" OnItemDeleted="ImpactRadGrid_ItemDeleted"
                OnItemInserted="ImpactRadGrid_ItemInserted" OnItemDataBound="ImpactRadGrid_ItemDataBound">
                <PagerStyle Mode="NumericPages"></PagerStyle>
                <MasterTableView DataSourceID="OutcomeDataSource" DataKeyNames="ID" AllowMultiColumnSorting="True"
                    Width="100%" CommandItemDisplay="Top" Name="OutcomeIndicator">
                    <CommandItemSettings ShowRefreshButton="false"/> 
                    <DetailTables>
                        <telerik:GridTableView DataSourceID="OutcomeIndicatorsDataSource" DataKeyNames="ID" 
                            Width="100%" CommandItemDisplay="Top" Name="Indicators">
                            <CommandItemSettings AddNewRecordText="Add Indicator" ShowRefreshButton="false"/> 
                            <ParentTableRelation>
                                <telerik:GridRelationFields DetailKeyField="RefID" MasterKeyField="ID"></telerik:GridRelationFields>
                            </ParentTableRelation>
                            <Columns>
                                <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    <ItemStyle CssClass="MyImageButton"></ItemStyle>
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn SortExpression="RefID" HeaderText="Ref ID" HeaderButtonType="TextButton"
                                    DataField="RefID" UniqueName="RefID" ReadOnly="true" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="ID" HeaderText="Indicator ID" HeaderButtonType="TextButton"
                                    DataField="ID" UniqueName="ID" ReadOnly="true" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="Indicator" ItemStyle-Width="240px">
                                <ItemTemplate>
                                    <%#DataBinder.Eval(Container.DataItem, "Type")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Type"  DataTextField="Type"
                                        DataValueField="IndicatorID" DataSourceID="OutcomeIndicatorDataSource" SelectedValue='<%#Bind("IndicatorID") %>'>
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn SortExpression="TargetValue" HeaderText="Target" HeaderButtonType="TextButton"
                                    DataField="TargetValue" UniqueName="TargetValue">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="BaselineValue" HeaderText="Baseline" HeaderButtonType="TextButton"
                                    DataField="BaselineValue" UniqueName="BaselineValue">
                                </telerik:GridBoundColumn>
                                <telerik:GridButtonColumn ConfirmText="Delete this indicator?"
                                    CommandName="Delete" Text="Delete" UniqueName="DeleteColumn">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton"></ItemStyle>
                                </telerik:GridButtonColumn>
                            </Columns>
                            <SortExpressions>
                                <telerik:GridSortExpression FieldName="ID" SortOrder="Ascending"></telerik:GridSortExpression>
                            </SortExpressions>
                        </telerik:GridTableView>
                    </DetailTables>
                      <Columns>
                            <telerik:GridBoundColumn SortExpression="ID" HeaderText="Outcome ID" HeaderButtonType="TextButton"
                                DataField="ID" UniqueName="ID" ReadOnly="true" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="Description" HeaderText=""  HeaderButtonType="TextButton"
                                DataField="Description" UniqueName="Description">
                            </telerik:GridBoundColumn>
                        </Columns>
                 </MasterTableView>
            </telerik:RadGrid>
            </fieldset>
            <asp:SqlDataSource ID="ImpactDataSource" runat="server"
                ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                SelectCommand="SELECT i.[ID], [ProjectID], [Statement] FROM [Impact] i INNER JOIN Project p ON i.ProjectID = p.ID WHERE [ProjectID] =@ProjectID">
                <SelectParameters>
                    <asp:Parameter Name="ProjectID" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ImpactIndicatorsDataSource" runat="server"
                ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                DeleteCommand="DELETE FROM [Indicators] WHERE [ID] = @ID"
                InsertCommand="INSERT INTO [Indicators] ([RefID],[IndicatorID],[TargetValue],[BaselineValue]) VALUES (@RefID, @IndicatorID, @TargetValue, @BaselineValue)"
                SelectCommand="SELECT i.[ID], [RefID], [IndicatorID], [TargetValue],[BaselineValue], (id.Description + ' - ' + it.Name) AS [Type] FROM [Indicators] i  
                                INNER JOIN [Indicator] id ON i.IndicatorID = id.ID
                                INNER JOIN [IndicatorType] it ON id.TypeID = it.ID
                                INNER JOIN [IndicatorCategory] ic ON id.CategoryID = ic.ID AND ic.Name LIKE 'Impact'
                                WHERE [RefID] = @RefID"
                UpdateCommand="UPDATE [Indicators] SET [IndicatorID] = @IndicatorID,[TargetValue] = @TargetValue,[BaselineValue] = @BaselineValue WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="RefID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="IndicatorID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="TargetValue" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="BaselineValue" Type="Int32"></asp:Parameter>
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="RefID" Type="Int32"></asp:Parameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="IndicatorID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="TargetValue" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="BaselineValue" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="OutcomeDataSource" runat="server"
                ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                SelectCommand="SELECT o.[ID], o.[Description] FROM [Outcome] o 
                                INNER JOIN [Impact] i ON o.ImpactID = i.ID 
                                INNER JOIN [Project] p ON i.ProjectID = p.ID
                                WHERE [ProjectID] = @ProjectID">
                <SelectParameters>
                    <asp:Parameter Name="ProjectID" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="OutcomeIndicatorsDataSource" runat="server"
                ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                DeleteCommand="DELETE FROM [Indicators] WHERE [ID] = @ID"
                InsertCommand="INSERT INTO [Indicators] ([RefID],[IndicatorID],[TargetValue],[BaselineValue]) VALUES (@RefID, @IndicatorID, @TargetValue, @BaselineValue)"
                SelectCommand="SELECT i.[ID], [RefID], [IndicatorID], [TargetValue],[BaselineValue], (id.Description + ' - ' + it.Name) AS [Type] FROM [Indicators] i  
                                INNER JOIN [Indicator] id ON i.IndicatorID = id.ID
                                INNER JOIN [IndicatorType] it ON id.TypeID = it.ID
                                INNER JOIN [IndicatorCategory] ic ON id.CategoryID = ic.ID AND ic.Name LIKE 'Outcome'
                                WHERE [RefID] = @RefID"
                UpdateCommand="UPDATE [Indicators] SET [IndicatorID] = @IndicatorID,[TargetValue] = @TargetValue,[BaselineValue] = @BaselineValue WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="RefID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="IndicatorID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="TargetValue" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="BaselineValue" Type="Int32"></asp:Parameter>
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="RefID" Type="Int32"></asp:Parameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="IndicatorID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="TargetValue" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="BaselineValue" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ImpactIndicatorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                SelectCommand="SELECT id.[ID] AS IndicatorID, (id.Description + ' - ' + it.Name) AS [Type] FROM [Indicator] id
                                INNER JOIN [IndicatorCategory] ic ON id.CategoryID = ic.ID AND ic.Name LIKE 'Impact'
                                INNER JOIN [IndicatorType] it ON id.TypeID = it.ID">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="OutcomeIndicatorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                SelectCommand="SELECT id.[ID] AS IndicatorID, (id.Description + ' - ' + it.Name) AS [Type] FROM [Indicator] id
                                INNER JOIN [IndicatorCategory] ic ON id.CategoryID = ic.ID AND ic.Name LIKE 'Outcome'
                                INNER JOIN [IndicatorType] it ON id.TypeID = it.ID">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="RAGDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                SelectCommand="SELECT [ID] AS RAGID, [Name] AS RAGName FROM [RAG]">
            </asp:SqlDataSource>

        </div>

        

        <div style="display: none;">
            <telerik:RadCalendar RenderMode="Lightweight" ID="sharedCalendar" runat="server" EnableMultiSelect="false">
            </telerik:RadCalendar>
        </div>
        <br />
    </div>
    </form>
</body>
</html>


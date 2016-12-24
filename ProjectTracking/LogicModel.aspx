<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogicModel.aspx.cs" Inherits="ProjectTracking.LogicModel" %>
 
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns='http://www.w3.org/1999/xhtml'>
<head id="Head1" runat="server">
    <title></title>
    <!--<link href="Skins/Silk/Grid.Silk.css" rel="stylesheet" type="text/css" runat="server" />
    <link href="Skins/Silk/Menu.Silk.css" rel="stylesheet" type="text/css" runat="server" />
    <link href="Skins/MetroTouch/Grid.MetroTouch.css" rel="stylesheet" type="text/css" runat="server" />
    <link href="Skins/MetroTouch/Menu.MetroTouch.css" rel="stylesheet" type="text/css" runat="server" />-->
</head>
<body>
    <form id="form2" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="false" Skin="Silk" />
    <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecorationZoneID="demo" DecoratedControls="All" EnableRoundedCorners="false"/>
    <div id="demo" class="demo-container no-bg">
        <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" DataSourceID="SqlDataSource1" runat="server" ShowStatusBar="true" EnableEmbeddedSkins="false"
            AutoGenerateColumns="False" PageSize="5" AllowSorting="True" AllowMultiRowSelection="False"
            AllowPaging="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True"
            AllowAutomaticUpdates="True" OnItemUpdated="RadGrid1_ItemUpdated" OnItemDeleted="RadGrid1_ItemDeleted"
            OnItemInserted="RadGrid1_ItemInserted" OnInsertCommand="RadGrid1_InsertCommand"
            OnItemCreated="RadGrid1_ItemCreated" OnItemDataBound="RadGrid1_ItemDataBound">
            <PagerStyle Mode="NumericPages"></PagerStyle>
            <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID" AllowMultiColumnSorting="True"
                Width="100%" CommandItemDisplay="Top" Name="Outcome">
                <CommandItemSettings AddNewRecordText="Add new Outcome" ShowRefreshButton="false"/> 
                <HeaderStyle BackColor="#B2A1C7"/>
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="ID" DataSourceID="SqlDataSource2" Width="100%"
                        runat="server" CommandItemDisplay="Top" Name="Output">
                        <CommandItemSettings AddNewRecordText="Add new Output" ShowRefreshButton="false"/> 
                        <HeaderStyle BackColor="#C2D69A"/>
                        <ParentTableRelation>
                            <telerik:GridRelationFields DetailKeyField="OutcomeID" MasterKeyField="ID"></telerik:GridRelationFields>
                        </ParentTableRelation>
                        <DetailTables>
                            <telerik:GridTableView DataKeyNames="ID" DataSourceID="SqlDataSource3"
                                Width="100%" runat="server" CommandItemDisplay="Top" Name="Activity">
                                <CommandItemSettings AddNewRecordText="Add new Activity" ShowRefreshButton="false"/>
                                <HeaderStyle BackColor="#FBABAD"/>
                                <ParentTableRelation>
                                    <telerik:GridRelationFields DetailKeyField="OutputID" MasterKeyField="ID"></telerik:GridRelationFields>
                                </ParentTableRelation>
                                <Columns>
                                    <telerik:GridEditCommandColumn UniqueName="EditCommandColumn1">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                        <ItemStyle CssClass="MyImageButton"></ItemStyle>
                                    </telerik:GridEditCommandColumn>
                                    <telerik:GridBoundColumn SortExpression="ID" HeaderText="Activity ID" HeaderButtonType="TextButton"
                                        DataField="ID" UniqueName="ID" ReadOnly="true" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn SortExpression="OutputID" HeaderText="OutputID" HeaderButtonType="TextButton"
                                        DataField="OutputID" UniqueName="OutputID" ReadOnly="true" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn SortExpression="Description" HeaderText="Description" HeaderButtonType="TextButton"
                                        DataField="Description" UniqueName="Description">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="Start Date" UniqueName="TemplateColumn2">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="StartDate" Text='<%# Eval("StartDate", "{0:dd/MM/yyyy}") %>'>
                                            </asp:Label>
                                            &nbsp;
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDatePicker RenderMode="Lightweight" ID="picker2" MinDate="2006/1/1" runat="server" DbSelectedDate='<%# Bind("StartDate") %>'>
                                            </telerik:RadDatePicker>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="End Date" UniqueName="TemplateColumn3">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="EndDate" Text='<%# Eval("EndDate", "{0:dd/MM/yyyy}") %>'>
                                            </asp:Label>
                                            &nbsp;
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDatePicker RenderMode="Lightweight" ID="picker3" MinDate="2006/1/1" runat="server" DbSelectedDate='<%# Bind("EndDate") %>'>
                                            </telerik:RadDatePicker>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridButtonColumn ConfirmText="Delete this activity?"
                                        CommandName="Delete" Text="Delete" UniqueName="DeleteColumn1">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton"></ItemStyle>
                                    </telerik:GridButtonColumn>
                                </Columns>
                                <SortExpressions>
                                    <telerik:GridSortExpression FieldName="ID" SortOrder="Descending"></telerik:GridSortExpression>
                                </SortExpressions>
                            </telerik:GridTableView>
                        </DetailTables>
                        <Columns>
                            <telerik:GridEditCommandColumn UniqueName="EditCommandColumn2">
                                <HeaderStyle Width="20px"></HeaderStyle>
                                <ItemStyle CssClass="MyImageButton"></ItemStyle>
                            </telerik:GridEditCommandColumn>
                            <telerik:GridBoundColumn SortExpression="ID" HeaderText="Output ID" HeaderButtonType="TextButton"
                                DataField="ID" UniqueName="ID" ReadOnly="true" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="OutcomeID" HeaderText="OutcomeID" HeaderButtonType="TextButton"
                                DataField="OutcomeID" UniqueName="OutcomeID" ReadOnly="true" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="Description" HeaderText="Description" HeaderButtonType="TextButton"
                                DataField="Description" UniqueName="Description">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="Category" ItemStyle-Width="240px">
                                <ItemTemplate>
                                    <%#DataBinder.Eval(Container.DataItem, "CategoryName")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="RadDdlCategory"  DataTextField="CategoryName"
                                        DataValueField="CategoryID" DataSourceID="OutputCategoryDataSource" SelectedValue='<%#Bind("CategoryID") %>'>
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn SortExpression="TargetQty" HeaderText="Target Qty"
                                HeaderButtonType="TextButton" DataField="TargetQty" UniqueName="TargetQty">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="Delivery Date" UniqueName="TemplateColumn1">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="date" Text='<%# Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>'>
                                    </asp:Label>
                                    &nbsp;
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDatePicker RenderMode="Lightweight" ID="picker1" MinDate="2006/1/1" runat="server" DbSelectedDate='<%# Bind("DeliveryDate") %>'>
                                    </telerik:RadDatePicker>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridButtonColumn ConfirmText="Delete this output?" 
                                CommandName="Delete" Text="Delete" UniqueName="DeleteColumn2">
                                <HeaderStyle Width="20px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton"></ItemStyle>
                            </telerik:GridButtonColumn>
                        </Columns>
                        <SortExpressions>
                            <telerik:GridSortExpression FieldName="ID" SortOrder="Descending"></telerik:GridSortExpression>
                        </SortExpressions>
                    </telerik:GridTableView>
                </DetailTables>
                <Columns>
                    <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                        <HeaderStyle Width="20px"></HeaderStyle>
                        <ItemStyle CssClass="MyImageButton"></ItemStyle>
                    </telerik:GridEditCommandColumn>
                    <telerik:GridBoundColumn SortExpression="ImpactID" HeaderText="Impact ID" HeaderButtonType="TextButton"
                        DataField="ImpactID" UniqueName="ImpactID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="ID" HeaderText="Outcome ID" HeaderButtonType="TextButton"
                        DataField="ID" UniqueName="ID" ReadOnly="true" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="Description" HeaderText="Description" HeaderButtonType="TextButton"
                        DataField="Description" UniqueName="Description">
                    </telerik:GridBoundColumn>
                    <telerik:GridButtonColumn ConfirmText="Delete this outcome?"
                        CommandName="Delete" Text="Delete" UniqueName="DeleteColumn">
                        <HeaderStyle Width="20px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton"></ItemStyle>
                    </telerik:GridButtonColumn>
                </Columns>
                <SortExpressions>
                    <telerik:GridSortExpression FieldName="ID" SortOrder="Descending"></telerik:GridSortExpression>
                </SortExpressions>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:OnTrack %>"
        DeleteCommand="DELETE FROM [Outcome] WHERE [ID] = @ID"
        InsertCommand="INSERT INTO [Outcome] ([ImpactID], [Description]) VALUES (@ImpactID, @Description)"
        SelectCommand="SELECT o.[ID], [ImpactID], [Description] FROM [Outcome] o INNER JOIN Impact i ON o.ImpactID = i.ID WHERE [ImpactID] =@ImpactID"
        UpdateCommand="UPDATE [Outcome] SET [Description] = @Description WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ImpactID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Description" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="ImpactID" Type="Int32"></asp:Parameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
        ConnectionString="<%$ ConnectionStrings:OnTrack %>"
        DeleteCommand="DELETE FROM [Output] WHERE [ID] = @ID"
        InsertCommand="INSERT INTO [Output] ([OutcomeID],[Description],[CategoryID],[TargetQty],[DeliveryDate]) VALUES (@OutcomeID,@Description,@CategoryID,@TargetQty,@DeliveryDate)"
        SelectCommand="SELECT o.[ID],[OutcomeID],o.[Description],[CategoryID],c.[Name] AS [CategoryName],[TargetQty],[ProgressQty],[DeliveryDate],[RAGID],r.[Name] AS [RAGName],[RAGCommentary],[DonorNarrative] FROM [Output] o INNER JOIN OutputCategory c ON [CategoryID]=c.[ID] LEFT JOIN RAG r ON [RAGID]=r.[ID] WHERE [OutcomeID] = @OutcomeID"
        UpdateCommand="UPDATE [Output] SET [Description]=@Description,[CategoryID]=@CategoryID,[TargetQty]=@TargetQty,[DeliveryDate]=@DeliveryDate WHERE [ID] = @ID">
        <SelectParameters>
            <asp:Parameter Name="OutcomeID" Type="Int32"></asp:Parameter>
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OutcomeID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Description" Type="String"></asp:Parameter>
            <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="TargetQty" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="DeliveryDate" Type="DateTime"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String"></asp:Parameter>
            <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="TargetQty" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="DeliveryDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
        ConnectionString="<%$ ConnectionStrings:OnTrack %>"
        DeleteCommand="DELETE FROM [Activity] WHERE [ID] = @ID"
        InsertCommand="INSERT INTO [Activity] ([OutputID],[Description],[StartDate],[EndDate]) VALUES (@OutputID,@Description,@StartDate,@EndDate)"
        SelectCommand="SELECT [ID],[OutputID],[Description],[StartDate],[EndDate],[Progress] FROM [Activity] WHERE [OutputID] = @OutputID"
        UpdateCommand="UPDATE [Activity] SET [Description]=@Description,[StartDate]=@StartDate,[EndDate]=@EndDate WHERE [ID] = @ID">
        <SelectParameters>
            <asp:Parameter Name="OutputID" Type="Int32"></asp:Parameter>
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OutputID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Description" Type="String"></asp:Parameter>
            <asp:Parameter Name="StartDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="EndDate" Type="DateTime"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String"></asp:Parameter>
            <asp:Parameter Name="StartDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="EndDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="OutputCategoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OnTrack %>"
        SelectCommand="SELECT [ID] AS CategoryID, [Name] AS CategoryName FROM [OutputCategory]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="RAGDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OnTrack %>"
        SelectCommand="SELECT [ID] AS RAGID, [Name] AS RAGName FROM [RAG]">
    </asp:SqlDataSource>
    <div style="display: none;">
        <telerik:RadCalendar RenderMode="Lightweight" ID="sharedCalendar" runat="server" EnableMultiSelect="false">
        </telerik:RadCalendar>
    </div>
    <br />
    </form>
</body>
</html>


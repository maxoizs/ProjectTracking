<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ProjectTracking.Profile" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="false" Skin="MetroTouch" />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="SectorsRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="SectorsRadGrid"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="SDGsRadGrid"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="DirectBeneficiariesRadGrid"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="IndirectBeneficiariesRadGrid"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="LogicModelRadGrid"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="ImpactRadGrid"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="OutcomeIndicatorsRadGrid"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div class="demo-container">
        <div class="wizardHeader"></div>
        <telerik:RadWizard RenderMode="Lightweight" ID="RadWizard1" runat="server" OnClientLoad="OnClientLoad" OnClientButtonClicking="OnClientButtonClicking">
            <WizardSteps>
                <telerik:RadWizardStep ID="RadWizardStep1" Title="Project Profile" runat="server" StepType="Start" ValidationGroup="accountInfo" CausesValidation="true" SpriteCssClass="accountInfo">
                    <div class="RadDataForm RadDataForm_MetroTouch rdfRightAligned rdfNoFieldHint rdfNoFieldHint">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                        <telerik:RadDataForm RenderMode="Lightweight" runat="server" ID="ProjectProfileRadDataForm"
                            DataKeyNames="ID"
                            OnNeedDataSource="ProjectProfileRadDataForm_NeedDataSource"
                            OnItemUpdating="ProjectProfileRadDataForm_ItemUpdating"
                            OnPreRender="ProjectProfileRadDataForm_PreRender"
                            Skin="MetroTouch">
                            <ItemTemplate>
                                <fieldset class="rdfFieldset rdfBorders">
                                    <legend class="rdfLegend">General Profile</legend>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblProjectName2" runat="server" CssClass="rdfLabel" Text="Name:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="lblProjectName" runat="server" CssClass="rdfFieldValue" Text='<%# Bind("Name") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblPIN2" runat="server" CssClass="rdfLabel" Text="PIN (FO project):"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="lblPIN" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PIN") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblRegion2" runat="server" CssClass="rdfLabel" Text="Region:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="lblRegion" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Region") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblProposalID2" runat="server" CssClass="rdfLabel" Text="Proposal ID:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="lblProposalID" runat="server" CssClass="rdfFieldValue" Text='<%# Bind("ProposalID") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="DescriptionLabel2" runat="server" CssClass="rdfLabel" Text="Description:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="DescriptionLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Bind("Description") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblCountry2" runat="server" CssClass="rdfLabel" Text="Country of implementaion:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="lblCountry" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Country") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblLocation2" runat="server" CssClass="rdfLabel" Text="Location of implementaion:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="lblLocation" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Location") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblStatus" runat="server" CssClass="rdfLabel" Text="Project Status:"></asp:Label>
                                        <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="ddlStatus"  DataTextField="StatusName"
                                                DataValueField="StatusID" DataSourceID="ProjectStatusDataSource" SelectedValue='<%# Bind("StatusID") %>' Enabled="false">
                                        </telerik:RadDropDownList>
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblIsJointFunded" runat="server" AssociatedControlID="cbxIsJointFunded" CssClass="rdfLabel" Text="Joint or Fully Funded:"></asp:Label>
                                        <asp:CheckBox ID="cbxIsJointFunded" runat="server" Checked='<%# Eval("IsJointFunded") == DBNull.Value ? false : Eval("IsJointFunded") %>' Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblType" runat="server" CssClass="rdfLabel" Text="Project Type:"></asp:Label>
                                        <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="ddlType"  DataTextField="TypeName"
                                                DataValueField="TypeID" DataSourceID="ProjectTypeDataSource" SelectedValue='<%# Bind("TypeID") %>' Enabled="false">
                                        </telerik:RadDropDownList>
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblIsLocallyFunded" runat="server" AssociatedControlID="cbxIsLocallyFunded" CssClass="rdfLabel" Text="Locally funded:"></asp:Label>
                                        <asp:CheckBox ID="cbxIsLocallyFunded" runat="server" Checked='<%# Eval("IsLocallyFunded") == DBNull.Value ? false : Eval("IsLocallyFunded") %>' Enabled="false" />
                                    </div>
                                </fieldset>
                                <fieldset class="rdfFieldset rdfBorders">
                                    <legend class="rdfLegend">Schedule Summary</legend>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblStartDate2" runat="server" CssClass="rdfLabel" Text="Start Date:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="lblStartDate" runat="server"  Text='<%# Eval("StartDate", "{0:dd/MM/yyyy}") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblEndDate2" runat="server" CssClass="rdfLabel" Text="End Date:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="lblEndDate" runat="server"  Text='<%# Eval("EndDate", "{0:dd/MM/yyyy}") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                </fieldset>
                                <fieldset class="rdfFieldset rdfBorders">
                                    <legend class="rdfLegend">Budget Summary</legend>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblTotalLC2" runat="server" CssClass="rdfLabel" Text="Total LC:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="lblTotalLC" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("CashValueLC") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblTotalRC2" runat="server" CssClass="rdfLabel" Text="Total RC:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="lblTotalRC" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("CashValueRC") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblTotalGBP2" runat="server" CssClass="rdfLabel" Text="Total GBP:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="lblTotalGBP" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("CashValueGBP") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                </fieldset>
                                <fieldset class="rdfFieldset rdfBorders">
                                     <telerik:RadButton RenderMode="Lightweight" ID="EditButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Edit" Text="Edit" ToolTip="Edit" /> 
                                </fieldset>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <fieldset class="rdfFieldset rdfBorders">
                                    <legend class="rdfLegend">General Profile</legend>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblProjectName" runat="server" AssociatedControlID="tbxProjectName" CssClass="rdfLabel" Text="Name:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="tbxProjectName" runat="server" Text='<%# Bind("Name") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblPIN" runat="server" AssociatedControlID="tbxPIN" CssClass="rdfLabel" Text="PIN (FO Project):"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="tbxPIN" runat="server" Text='<%# Bind("PIN") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblRegion" runat="server" AssociatedControlID="tbxRegion" CssClass="rdfLabel" Text="Region:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="tbxRegion" runat="server" Text='<%# Bind("Region") %>' WrapperCssClass="rdfInput" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblProposalID" runat="server" AssociatedControlID="tbxProposalID" CssClass="rdfLabel" Text="Proposal ID:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="tbxProposalID" runat="server" Text='<%# Bind("ProposalID") %>' WrapperCssClass="rdfInput" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblDescription" runat="server" AssociatedControlID="tbxDescription" CssClass="rdfLabel" Text="Description:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="tbxDescription" runat="server" Text='<%# Bind("Description") %>' WrapperCssClass="rdfInput" Width="200px" EmptyMessage="Enter description" TextMode="MultiLine" Height="100px" Resize="None" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblCountry" runat="server" AssociatedControlID="tbxCountry" CssClass="rdfLabel" Text="Country of implementation:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="tbxCountry" runat="server" Text='<%# Bind("Country") %>' WrapperCssClass="rdfInput" Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblLocation" runat="server" AssociatedControlID="tbxLocation" CssClass="rdfLabel" Text="Location of implementation:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="tbxLocation" runat="server" Text='<%# Bind("Location") %>' WrapperCssClass="rdfInput" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblStatus" runat="server" AssociatedControlID="ddlStatus" CssClass="rdfLabel" Text="Project Status:"></asp:Label>
                                        <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="ddlStatus"  DataTextField="StatusName"
                                                DataValueField="StatusID" DataSourceID="ProjectStatusDataSource" SelectedValue='<%# Bind("StatusID") %>'>
                                        </telerik:RadDropDownList>
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblIsJointFunded" runat="server" AssociatedControlID="cbxIsJointFunded" CssClass="rdfLabel" Text="Joint funded:"></asp:Label>
                                        <asp:CheckBox ID="cbxIsJointFunded" runat="server" Checked='<%#  Eval("IsJointFunded") == DBNull.Value ? false : Eval("IsJointFunded") %>' />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblType" runat="server" AssociatedControlID="ddlType" CssClass="rdfLabel" Text="Project Type:"></asp:Label>
                                        <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="ddlType"  DataTextField="TypeName"
                                                DataValueField="TypeID" DataSourceID="ProjectTypeDataSource" SelectedValue='<%# Bind("TypeID") %>'>
                                        </telerik:RadDropDownList>
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblIsLocallyFunded" runat="server" AssociatedControlID="cbxIsLocallyFunded" CssClass="rdfLabel" Text="Locally funded:"></asp:Label>
                                        <asp:CheckBox ID="cbxIsLocallyFunded" runat="server" Checked='<%#  Eval("IsLocallyFunded") == DBNull.Value ? false : Eval("IsLocallyFunded") %>' />
                                    </div>
                                </fieldset>
                                <fieldset class="rdfFieldset rdfBorders">
                                    <legend class="rdfLegend">Schedule Summary</legend>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblStartDate" runat="server" AssociatedControlID="tbxStartDate" CssClass="rdfLabel" Text="Start Date:"></asp:Label>
                                        <telerik:RadDatePicker RenderMode="Lightweight" ID="tbxStartDate" MinDate="2006/1/1" runat="server" DbSelectedDate='<%# Bind("StartDate") %>'>
                                        </telerik:RadDatePicker>
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblEndDate" runat="server" AssociatedControlID="tbxEndDate" CssClass="rdfLabel" Text="End Date:"></asp:Label>
                                        <telerik:RadDatePicker RenderMode="Lightweight" ID="tbxEndDate" MinDate="2006/1/1" runat="server" DbSelectedDate='<%# Bind("EndDate") %>'>
                                        </telerik:RadDatePicker>
                                    </div>
                                </fieldset>
                                <fieldset class="rdfFieldset rdfBorders">
                                    <legend class="rdfLegend">Budget Summary</legend>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblTotalLC" runat="server" AssociatedControlID="tbxTotalLC" CssClass="rdfLabel" Text="Total LC:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="tbxTotalLC" runat="server" Text='<%# Bind("CashValueLC") %>' WrapperCssClass="rdfInput"/>
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblTotalRC" runat="server" AssociatedControlID="tbxTotalRC" CssClass="rdfLabel" Text="Total RC:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="tbxTotalRC" runat="server" Text='<%# Bind("CashValueRC") %>' WrapperCssClass="rdfInput"/>
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="lblTotalGBP" runat="server" AssociatedControlID="tbxTotalGBP" CssClass="rdfLabel" Text="Total GBP:"></asp:Label>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="tbxTotalGBP" runat="server" Text='<%# Bind("CashValueGBP") %>' WrapperCssClass="rdfInput"/>
                                    </div>
                                </fieldset>
                                <fieldset class="rdfFieldset rdfBorders">
                                        <telerik:RadButton RenderMode="Lightweight" ID="UpdateButton" runat="server" ButtonType="SkinnedButton" CommandName="Update" Text="Update" ToolTip="Update" />
                                        <telerik:RadButton RenderMode="Lightweight" ID="CancelButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Cancel" Text="Cancel" ToolTip="Cancel" />
                                </fieldset>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <div class="RadDataForm RadDataForm_<%# Container.Skin %>">
                                    <div class="rdfEmpty">
                                        There are no items to be displayed.
                                    </div>
                                </div>
                            </EmptyDataTemplate>
                        </telerik:RadDataForm>
                        <asp:SqlDataSource ID="ProjectStatusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                            SelectCommand="SELECT [ID] AS StatusID, [Name] AS StatusName FROM [ProjectStatus]">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="ProjectTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                            SelectCommand="SELECT [ID] AS TypeID, [Name] AS TypeName FROM [ProjectType]">
                        </asp:SqlDataSource>
                        <h3>THEMATIC IMPACT TARGETS</h3>
                        <fieldset class="rdfFieldset rdfBorders">
                            <legend class="rdfLegend">Target Sectors (By Estimated Impact)</legend>
                            <telerik:RadGrid RenderMode="Lightweight" ID="SectorsRadGrid" runat="server" DataSourceID="SectorsDataSource"
                                AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                                AllowAutomaticDeletes="true" AllowSorting="false" OnItemUpdated="RadGrid_ItemUpdated"
                                OnItemInserted="RadGrid_ItemInserted" OnItemDeleted="RadGrid_ItemDeleted"
                                OnInsertCommand="RadGrid_InsertCommand">
                                <PagerStyle Mode="NextPrevAndNumeric" />
                                <MasterTableView DataSourceID="SectorsDataSource" AutoGenerateColumns="False" Name="Sector"
                                    DataKeyNames="ID" CommandItemDisplay="Top">
                                    <CommandItemSettings AddNewRecordText="Add new Sector" ShowRefreshButton="false" />
                                    <Columns>
                                        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                                        </telerik:GridEditCommandColumn>
                                        <telerik:GridBoundColumn DataField="ID" HeaderText="Sectors ID" SortExpression="ID"
                                            UniqueName="ID" Visible="false" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn HeaderText="Sector" ItemStyle-Width="80%">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container.DataItem, "SectorName")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Sector"  DataTextField="SectorName"
                                                    DataValueField="SectorID" DataSourceID="SectorDataSource" SelectedValue='<%#Bind("SectorID") %>'>
                                                </telerik:RadDropDownList>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="PercentSplit" HeaderText="Sector % Split"
                                            UniqueName="PercentSplit" ItemStyle-Width="10%">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridButtonColumn Text="Delete" CommandName="Delete" />
                                    </Columns>
                                    <SortExpressions>
                                        <telerik:GridSortExpression FieldName="ID" SortOrder="Ascending"></telerik:GridSortExpression>
                                    </SortExpressions>    
                                </MasterTableView>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="SectorsDataSource" runat="server"
                                ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                                SelectCommand="SELECT s.[ID], s.[SectorID], s.[PercentSplit], st.[Name] AS [SectorName] FROM [Sectors] s 
                                                INNER JOIN [Sector] st ON s.SectorID = st.ID 
                                                WHERE [ProjectID] = @ProjectID"
                                DeleteCommand="DELETE FROM [Sectors] WHERE [ID] = @ID"
                                InsertCommand="INSERT INTO [Sectors] ([ProjectID],[SectorID],[PercentSplit]) VALUES (@ProjectID, @SectorID, @PercentSplit)"
                                UpdateCommand="UPDATE [Sectors] SET [SectorID] = @SectorID,[PercentSplit] = @PercentSplit WHERE [ID] = @ID">
                                <SelectParameters>
                                    <asp:Parameter Name="ProjectID" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ProjectID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="SectorID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="PercentSplit" Type="Int32"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="SectorID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="PercentSplit" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SectorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                                SelectCommand="SELECT s.[ID] AS [SectorID], s.[Name] AS [SectorName] FROM [Sector] s
                                                WHERE ParentID IS NOT NULL">
                            </asp:SqlDataSource>
                        </fieldset>
                        <fieldset class="rdfFieldset rdfBorders">
                            <legend class="rdfLegend">SDG Targets (By Estimated Impact)</legend>
                            <telerik:RadGrid RenderMode="Lightweight" ID="SDGsRadGrid" runat="server" DataSourceID="SDGsDataSource"
                                AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                                AllowAutomaticDeletes="true" AllowSorting="false" OnItemUpdated="RadGrid_ItemUpdated"
                                OnItemInserted="RadGrid_ItemInserted" OnItemDeleted="RadGrid_ItemDeleted"
                                OnInsertCommand="RadGrid_InsertCommand">
                                <PagerStyle Mode="NextPrevAndNumeric" />
                                <MasterTableView DataSourceID="SDGsDataSource" AutoGenerateColumns="False" Name="SDG"
                                    DataKeyNames="ID" CommandItemDisplay="Top">
                                    <CommandItemSettings AddNewRecordText="Add new SDG" ShowRefreshButton="false" />
                                    <Columns>
                                        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                                        </telerik:GridEditCommandColumn>
                                        <telerik:GridBoundColumn DataField="ID" HeaderText="SDGs ID" SortExpression="ID"
                                            UniqueName="ID" Visible="false" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn HeaderText="SDG" ItemStyle-Width="80%">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container.DataItem, "SDGName")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="SDG"  DataTextField="SDGName"
                                                    DataValueField="SDGID" DataSourceID="SDGDataSource" SelectedValue='<%#Bind("SDGID") %>'>
                                                </telerik:RadDropDownList>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="PercentSplit" HeaderText="Sector % Split"
                                            UniqueName="PercentSplit" ItemStyle-Width="10%">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridButtonColumn Text="Delete" CommandName="Delete" />
                                    </Columns>
                                    <SortExpressions>
                                        <telerik:GridSortExpression FieldName="ID" SortOrder="Ascending"></telerik:GridSortExpression>
                                    </SortExpressions>    
                                </MasterTableView>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="SDGsDataSource" runat="server"
                                ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                                SelectCommand="SELECT s.[ID], s.[SDGID], s.[PercentSplit], sd.[Name] AS [SDGName] FROM [SDGs] s 
                                                INNER JOIN [SDG] sd ON s.SDGID = sd.ID 
                                                WHERE [ProjectID] = @ProjectID"
                                DeleteCommand="DELETE FROM [SDGs] WHERE [ID] = @ID"
                                InsertCommand="INSERT INTO [SDGs] ([ProjectID],[SDGID],[PercentSplit]) VALUES (@ProjectID, @SDGID, @PercentSplit)"
                                UpdateCommand="UPDATE [SDGs] SET [SDGID] = @SDGID,[PercentSplit] = @PercentSplit WHERE [ID] = @ID">
                                <SelectParameters>
                                    <asp:Parameter Name="ProjectID" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ProjectID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="SDGID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="PercentSplit" Type="Int32"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="SDGID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="PercentSplit" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SDGDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                                SelectCommand="SELECT [ID] AS [SDGID], [Name] AS [SDGName] FROM [SDG]">
                            </asp:SqlDataSource>
                        </fieldset>
                        <h3>BENEFICIARIES</h3>
                        <fieldset class="rdfFieldset rdfBorders">
                            <legend class="rdfLegend">Direct Beneficiaries</legend>
                            <telerik:RadGrid RenderMode="Lightweight" ID="DirectBeneficiariesRadGrid" runat="server" DataSourceID="DirectBeneficiariesDataSource"
                                AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                                AllowAutomaticDeletes="true" AllowSorting="false" OnItemUpdated="RadGrid_ItemUpdated"
                                OnItemInserted="RadGrid_ItemInserted" OnItemDeleted="RadGrid_ItemDeleted" 
                                OnInsertCommand="RadGrid_InsertCommand" OnItemDataBound="RadGrid_ItemDataBound">
                                <PagerStyle Mode="NextPrevAndNumeric" />
                                <MasterTableView DataSourceID="DirectBeneficiariesDataSource" AutoGenerateColumns="False" Name="DirectBeneficiaries"
                                    DataKeyNames="ID" CommandItemDisplay="Top">
                                    <CommandItemSettings AddNewRecordText="Add new Beneficiary" ShowRefreshButton="false" />
                                    <ColumnGroups>
                                        <telerik:GridColumnGroup HeaderText="Male Individuals" Name="Male" HeaderStyle-HorizontalAlign="Center">
                                        </telerik:GridColumnGroup>
                                        <telerik:GridColumnGroup HeaderText="Female Individuals" Name="Female" HeaderStyle-HorizontalAlign="Center">
                                        </telerik:GridColumnGroup>
                                    </ColumnGroups>
                                    <Columns>
                                        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                                        </telerik:GridEditCommandColumn>
                                        <telerik:GridBoundColumn DataField="ID" HeaderText="BeneficiaryID" SortExpression="ID"
                                            UniqueName="ID" Visible="false" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn HeaderText="Vulnerability Group" ItemStyle-Width="240px">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container.DataItem, "VulnerabilityGroupName")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="VulnerabilityGroup"  DataTextField="VulnerabilityGroupName"
                                                    DataValueField="VulnerabilityGroupID" DataSourceID="VulnerabilityGroupDataSource" SelectedValue='<%#Bind("VulnerabilityGroupID") %>'>
                                                </telerik:RadDropDownList>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn SortExpression="Description" HeaderText="Description" HeaderButtonType="TextButton" DataField="Description" UniqueName="Description" />
                                        <telerik:GridBoundColumn SortExpression="Under5Male" HeaderText="Under5Male" HeaderButtonType="TextButton" DataField="Under5Male" UniqueName="Under5Male" ColumnGroupName="Male" />
                                        <telerik:GridBoundColumn SortExpression="5to18Male" HeaderText="5to18Male" HeaderButtonType="TextButton" DataField="5to18Male" UniqueName="5to18Male" ColumnGroupName="Male" />
                                        <telerik:GridBoundColumn SortExpression="19to50Male" HeaderText="19to50Male" HeaderButtonType="TextButton" DataField="19to50Male" UniqueName="19to50Male" ColumnGroupName="Male" />
                                        <telerik:GridBoundColumn SortExpression="Over50Male" HeaderText="Over50Male" HeaderButtonType="TextButton" DataField="Over50Male" UniqueName="Over50Male" ColumnGroupName="Male" />
                                        <telerik:GridBoundColumn SortExpression="Under5Female" HeaderText="Under5Female" HeaderButtonType="TextButton" DataField="Under5Female" UniqueName="Under5Female" ColumnGroupName="Female" />
                                        <telerik:GridBoundColumn SortExpression="5to18Female" HeaderText="5to18Female" HeaderButtonType="TextButton" DataField="5to18Female" UniqueName="5to18Female"  ColumnGroupName="Female" />
                                        <telerik:GridBoundColumn SortExpression="19to55Female" HeaderText="19to55Female" HeaderButtonType="TextButton" DataField="19to55Female" UniqueName="19to55Female" ColumnGroupName="Female" />
                                        <telerik:GridBoundColumn SortExpression="Over50Female" HeaderText="Over50Female" HeaderButtonType="TextButton" DataField="Over50Female" UniqueName="Over50Female" ColumnGroupName="Female" />
                                        <telerik:GridBoundColumn SortExpression="MaleDirect" HeaderText="Males" HeaderButtonType="TextButton" DataField="MaleDirect" UniqueName="MaleDirect" Display="false" />
                                        <telerik:GridBoundColumn SortExpression="FemaleDirect" HeaderText="Females" HeaderButtonType="TextButton" DataField="FemaleDirect" UniqueName="FemaleDirect"  Display="false"/>
                                        <telerik:GridButtonColumn Text="Delete" CommandName="Delete" />
                                    </Columns>
                                    <SortExpressions>
                                        <telerik:GridSortExpression FieldName="ID" SortOrder="Ascending"></telerik:GridSortExpression>
                                    </SortExpressions>    
                                </MasterTableView>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="DirectBeneficiariesDataSource" runat="server"
                                ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                                SelectCommand="SELECT b.*, v.[Name] AS [VulnerabilityGroupName] FROM [BeneficiaryGroup] b 
                                                INNER JOIN [VulnerabilityGroup] v ON b.VulnerabilityGroupID = v.ID 
                                                WHERE v.[Name] NOT LIKE 'Estimated Indirect Beneficiaries' 
                                                AND [ProjectID] = @ProjectID"
                                DeleteCommand="DELETE FROM [BeneficiaryGroup] WHERE [ID] = @ID"
                                InsertCommand="INSERT INTO [BeneficiaryGroup] ([ProjectID],[VulnerabilityGroupID],[Description],[Under5Male],
                                               [Under5Female],[5to18Male],[5to18Female],[19to50Male],[19to55Female],[Over50Male],
                                               [Over50Female],[MaleDirect],[FemaleDirect],[IsLarge]) 
                                               VALUES (@ProjectID, @VulnerabilityGroupID,@Description,@Under5Male,@Under5Female,
                                               @5to18Male,@5to18Female,@19to50Male,@19to55Female,@Over50Male,@Over50Female,
                                               @MaleDirect,@FemaleDirect,@IsLarge)"
                                UpdateCommand="UPDATE [BeneficiaryGroup] SET [VulnerabilityGroupID]=@VulnerabilityGroupID,[Description]=@Description,
                                               [Under5Male]=@Under5Male,[Under5Female]=@Under5Female,[5to18Male]=@5to18Male,[5to18Female]=@5to18Female,
                                               [19to50Male]=@19to50Male,[19to55Female]=@19to55Female,[Over50Male]=@Over50Male,[Over50Female]=@Over50Female,
                                               [MaleDirect]=@MaleDirect,[FemaleDirect]=@FemaleDirect,
                                               [IsLarge]=@IsLarge WHERE [ID] = @ID">
                                <SelectParameters>
                                    <asp:Parameter Name="ProjectID" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ProjectID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="VulnerabilityGroupID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="Under5Male" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Under5Female" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="5to18Male" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="5to18Female" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="19to50Male" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="19to55Female" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Over50Male" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Over50Female" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="MaleDirect" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="FemaleDirect" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="IsLarge" Type="Boolean"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="VulnerabilityGroupID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="Under5Male" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Under5Female" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="5to18Male" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="5to18Female" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="19to50Male" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="19to55Female" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Over50Male" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Over50Female" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="MaleDirect" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="FemaleDirect" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="IsLarge" Type="Boolean"></asp:Parameter>
                                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="VulnerabilityGroupDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                                SelectCommand="SELECT [ID] AS [VulnerabilityGroupID], [Name] AS [VulnerabilityGroupName] FROM [VulnerabilityGroup]
                                               WHERE [Name] NOT LIKE 'Estimated Indirect Beneficiaries'">
                            </asp:SqlDataSource>
                        </fieldset>
                        <fieldset class="rdfFieldset rdfBorders">
                            <legend class="rdfLegend">Indirect Beneficiaries</legend>
                            <telerik:RadGrid RenderMode="Lightweight" ID="IndirectBeneficiariesRadGrid" runat="server" DataSourceID="IndirectBeneficiariesDataSource"
                                AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                                AllowAutomaticDeletes="true" AllowSorting="false" OnItemUpdated="RadGrid_ItemUpdated"
                                OnItemInserted="RadGrid_ItemInserted" OnItemDeleted="RadGrid_ItemDeleted" 
                                OnInsertCommand="RadGrid_InsertCommand" OnItemDataBound="RadGrid_ItemDataBound">
                                <PagerStyle Mode="NextPrevAndNumeric" />
                                <MasterTableView DataSourceID="IndirectBeneficiariesDataSource" AutoGenerateColumns="False" Name="IndirectBeneficiaries"
                                    DataKeyNames="ID" CommandItemDisplay="Top">
                                    <CommandItemSettings AddNewRecordText="Add new Beneficiary" ShowRefreshButton="false" />
                                    <Columns>
                                        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                                        </telerik:GridEditCommandColumn>
                                        <telerik:GridBoundColumn DataField="ID" HeaderText="BeneficiaryID" SortExpression="ID"
                                            UniqueName="ID" Visible="false" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn HeaderText="Vulnerability Group" ItemStyle-Width="240px">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container.DataItem, "VulnerabilityGroupName")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="VulnerabilityGroup"  DataTextField="VulnerabilityGroupName"  
                                                    DataValueField="VulnerabilityGroupID" DataSourceID="IndirectVulnerabilityGroupDataSource" SelectedValue='<%#Bind("VulnerabilityGroupID") %>'>
                                                </telerik:RadDropDownList>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn SortExpression="Description" HeaderText="Description" HeaderButtonType="TextButton" DataField="Description" UniqueName="Description" />
                                        <telerik:GridBoundColumn SortExpression="MaleIndirect" HeaderText="Males" HeaderButtonType="TextButton" DataField="MaleIndirect" UniqueName="MaleIndirect" />
                                        <telerik:GridBoundColumn SortExpression="FemaleIndirect" HeaderText="Females" HeaderButtonType="TextButton" DataField="FemaleIndirect" UniqueName="FemaleIndirect" />
                                        <telerik:GridButtonColumn Text="Delete" CommandName="Delete" />
                                    </Columns>
                                    <SortExpressions>
                                        <telerik:GridSortExpression FieldName="ID" SortOrder="Ascending"></telerik:GridSortExpression>
                                    </SortExpressions>    
                                </MasterTableView>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="IndirectBeneficiariesDataSource" runat="server"
                                ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                                SelectCommand="SELECT b.*, v.[Name] AS [VulnerabilityGroupName] FROM [BeneficiaryGroup] b 
                                                INNER JOIN [VulnerabilityGroup] v ON b.VulnerabilityGroupID = v.ID 
                                                WHERE v.[Name] LIKE 'Estimated Indirect Beneficiaries' 
                                                AND [ProjectID] = @ProjectID"
                                DeleteCommand="DELETE FROM [BeneficiaryGroup] WHERE [ID] = @ID"
                                InsertCommand="INSERT INTO [BeneficiaryGroup] ([ProjectID],[VulnerabilityGroupID],[Description],
                                               [MaleIndirect],[FemaleIndirect],[IsLarge]) 
                                               VALUES (@ProjectID, @VulnerabilityGroupID,@Description,
                                               @MaleIndirect,@FemaleIndirect,@IsLarge)"
                                UpdateCommand="UPDATE [BeneficiaryGroup] SET [VulnerabilityGroupID]=@VulnerabilityGroupID,[Description]=@Description,
                                               [MaleIndirect]=@MaleIndirect,[FemaleIndirect]=@FemaleIndirect,
                                               [IsLarge]=@IsLarge WHERE [ID] = @ID">
                                <SelectParameters>
                                    <asp:Parameter Name="ProjectID" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ProjectID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="VulnerabilityGroupID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="MaleIndirect" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="FemaleIndirect" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="IsLarge" Type="Boolean"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="VulnerabilityGroupID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="MaleIndirect" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="FemaleIndirect" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="IsLarge" Type="Boolean"></asp:Parameter>
                                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="IndirectVulnerabilityGroupDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                                SelectCommand="SELECT [ID] AS [VulnerabilityGroupID], [Name] AS [VulnerabilityGroupName] FROM [VulnerabilityGroup]
                                               WHERE [Name] LIKE 'Estimated Indirect Beneficiaries'">
                            </asp:SqlDataSource>
                        </fieldset>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1"></telerik:RadAjaxLoadingPanel>
                    </div>
                </telerik:RadWizardStep>
 
                <telerik:RadWizardStep ID="RadWizardStep2" Title="Logic Model" runat="server" StepType="Step" ValidationGroup="personalInfo" SpriteCssClass="personalInfo">
                    <telerik:RadGrid RenderMode="Lightweight" ID="LogicModelRadGrid" DataSourceID="LogicModelOutcomeDataSource" runat="server" ShowStatusBar="true" EnableEmbeddedSkins="false"
                        AutoGenerateColumns="False" PageSize="5" AllowSorting="True" AllowMultiRowSelection="False"
                        AllowPaging="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True"
                        AllowAutomaticUpdates="True" OnItemUpdated="RadGrid_ItemUpdated" OnItemDeleted="RadGrid_ItemDeleted"
                        OnItemInserted="RadGrid_ItemInserted" OnInsertCommand="LogicModelRadGrid_InsertCommand"
                        OnItemDataBound="LogicModelRadGrid_ItemDataBound">
                        <PagerStyle Mode="NumericPages"></PagerStyle>
                        <MasterTableView DataSourceID="LogicModelImpactDataSource" DataKeyNames="ID" AllowMultiColumnSorting="True"
                            Width="100%" CommandItemDisplay="Top" Name="Impact">
                            <CommandItemSettings AddNewRecordText="Add new Impact" ShowRefreshButton="false"/> 
                            <HeaderStyle BackColor="#FAC090"/>
                            <DetailTables>
                                <telerik:GridTableView DataSourceID="LogicModelOutcomeDataSource" DataKeyNames="ID" 
                                    Width="100%" CommandItemDisplay="Top" Name="Outcome">
                                    <CommandItemSettings AddNewRecordText="Add new Outcome" ShowRefreshButton="false"/> 
                                    <HeaderStyle BackColor="#B2A1C7"/>
                                    <ParentTableRelation>
                                        <telerik:GridRelationFields DetailKeyField="ImpactID" MasterKeyField="ID"></telerik:GridRelationFields>
                                    </ParentTableRelation>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <DetailTables>
                                    <telerik:GridTableView DataKeyNames="ID" DataSourceID="LogicModelOutputDataSource" Width="100%"
                                        runat="server" CommandItemDisplay="Top" Name="Output">
                                        <CommandItemSettings AddNewRecordText="Add new Output" ShowRefreshButton="false"/> 
                                        <HeaderStyle BackColor="#C2D69A"/>
                                        <ParentTableRelation>
                                            <telerik:GridRelationFields DetailKeyField="OutcomeID" MasterKeyField="ID"></telerik:GridRelationFields>
                                        </ParentTableRelation>
                                        <DetailTables>
                                            <telerik:GridTableView DataKeyNames="ID" DataSourceID="LogicModelActivityDataSource"
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
                                            DataField="ImpactID" UniqueName="ImpactID" ReadOnly="true" Visible="false">
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
                                </telerik:GridTableView>
                            </DetailTables>
                              <Columns>
                                    <telerik:GridEditCommandColumn UniqueName="EditCommandColumn0">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                        <ItemStyle CssClass="MyImageButton"></ItemStyle>
                                    </telerik:GridEditCommandColumn>
                                    <telerik:GridBoundColumn HeaderText="Project ID" HeaderButtonType="TextButton"
                                        DataField="ProjectID" UniqueName="ProjectID" ReadOnly="true" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Impact ID" HeaderButtonType="TextButton"
                                        DataField="ID" UniqueName="ID" ReadOnly="true" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="Impact Statement" HeaderStyle-Width="900px" 
                                        UniqueName="Statement" DataField="Statement"  ItemStyle-Wrap="true" ItemStyle-Height ="80px" >
                                        <HeaderStyle HorizontalAlign="Left" Width="900px" />
                                        <ItemStyle HorizontalAlign="Left" Width="900px" Height="80px"/>
                                        <ItemTemplate>
                                            <%#DataBinder.Eval(Container.DataItem, "Statement")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="Statement"  DataTextField="Statement" Width="900" Height="80"
                                                TextMode="MultiLine" Text='<%#Bind("Statement") %>'>
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                         </MasterTableView>
                    </telerik:RadGrid>
                    <asp:SqlDataSource ID="LogicModelImpactDataSource" runat="server"
                        ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                        InsertCommand="INSERT INTO [Impact] ([ProjectID], [Statement]) VALUES (@ProjectID, @Statement)"
                        SelectCommand="SELECT i.[ID], [ProjectID], [Statement] FROM [Impact] i INNER JOIN Project p ON i.ProjectID = p.ID WHERE [ProjectID] =@ProjectID"
                        UpdateCommand="UPDATE [Impact] SET [Statement] = @Statement WHERE [ID] = @ID">
                        <InsertParameters>
                            <asp:Parameter Name="ProjectID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Statement" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter Name="ProjectID" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Statement" Type="String"></asp:Parameter>
                            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="LogicModelOutcomeDataSource" runat="server"
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
                    <asp:SqlDataSource ID="LogicModelOutputDataSource" runat="server"
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
                    <asp:SqlDataSource ID="LogicModelActivityDataSource" runat="server"
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
                </telerik:RadWizardStep>
 
                <telerik:RadWizardStep ID="RadWizardStep3" Title="Indicators" runat="server" StepType="Step" ValidationGroup="ContactDetails" SpriteCssClass="contactDetails">
                    <fieldset>
                        <legend>Impact Indicators</legend>
                        <telerik:RadGrid RenderMode="Lightweight" ID="ImpactRadGrid" DataSourceID="ImpactIndicatorsDataSource" runat="server"
                            AutoGenerateColumns="False" PageSize="5" AllowSorting="True" AllowMultiRowSelection="False"
                            AllowPaging="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True"
                            AllowAutomaticUpdates="True" OnItemUpdated="RadGrid_ItemUpdated" OnItemDeleted="RadGrid_ItemDeleted"
                            OnItemInserted="RadGrid_ItemInserted" OnItemDataBound="ImpactRadGrid_ItemDataBound">
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
                            AllowAutomaticUpdates="True" OnItemUpdated="RadGrid_ItemUpdated" OnItemDeleted="RadGrid_ItemDeleted"
                            OnItemInserted="RadGrid_ItemInserted" OnItemDataBound="ImpactRadGrid_ItemDataBound">
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnTrack %>"
                        SelectCommand="SELECT [ID] AS RAGID, [Name] AS RAGName FROM [RAG]">
                    </asp:SqlDataSource>
                </telerik:RadWizardStep>
 
                <telerik:RadWizardStep StepType="Finish" Title="Confirmation" ValidationGroup="Confirmation" SpriteCssClass="confirmation">
                    <p>Please review the data on this form before clicking the Submit button.</p>
                    <p class="anti-spam-policy">
                        <asp:CheckBox ID="AcceptTermsCheckBox" runat="server" Text="I confirm that the data I've entered is correct to the best of my ability." CausesValidation="true" ValidationGroup="Confirmation" />
                        <asp:CustomValidator ID="AcceptTermsCheckBoxCustomValidator" runat="server"
                            EnableClientScript="true" ClientValidationFunction="AcceptTermsCheckBoxValidation" ValidationGroup="Confirmation"
                            ErrorMessage="You must tick this box in order to proceed" Display="Dynamic"
                            CssClass="checkbox-validator" ForeColor="Red" />
                    </p>
                </telerik:RadWizardStep>
 
                <telerik:RadWizardStep ID="RadWizardStep5" runat="server" StepType="Complete" CssClass="complete">
                    <p>Project has been succesfully setup.</p>
                    <telerik:RadButton RenderMode="Lightweight" ID="NewRegistrationButton" runat="server"  OnClick="NewRegistrationButton_Click" Text="Create a new registration"></telerik:RadButton>
                </telerik:RadWizardStep>
 
            </WizardSteps>
        </telerik:RadWizard>

    </div>
 
</asp:Content>
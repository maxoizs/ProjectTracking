using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using Telerik.Web.UI;
using System.Collections;
using ProjectTracking.Extensions;

namespace ProjectTracking
{
    public partial class Profile : System.Web.UI.Page
    {
        public string ConnectionString = ConfigurationManager.ConnectionStrings["OnTrack"].ConnectionString;

        private string ProjectID
        {
            get { return "1"; }
        }

        public string SelectedSkin
        {
            get
            {
                return "MetroTouch";
            }
        }

        private void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Setting Selected index prior to binding RadGrid:
                //If the index is in detail table, parent items will be expanded
                //automatically 
                LogicModelRadGrid.SelectedIndexes.Add(0, 0);
                ImpactRadGrid.SelectedIndexes.Add(0, 0);
                //Index of 1, 0, 1, 0, 0 means:
                //1 - item with index 1 in the MasterTabelView
                //0 - detail table with index 0
                //1 - item with index 1 (the second item) in the first detail table
                //0 - 0 the third-level detail table
                //0 - the item with index 0 in the third-level table
                

                SectorsDataSource.SelectParameters["ProjectID"].DefaultValue = ProjectID;
                SDGsDataSource.SelectParameters["ProjectID"].DefaultValue = ProjectID;
                DirectBeneficiariesDataSource.SelectParameters["ProjectID"].DefaultValue = ProjectID;
                IndirectBeneficiariesDataSource.SelectParameters["ProjectID"].DefaultValue = ProjectID;
                LogicModelImpactDataSource.SelectParameters["ProjectID"].DefaultValue = ProjectID;
                ImpactDataSource.SelectParameters["ProjectID"].DefaultValue = ProjectID;
                OutcomeDataSource.SelectParameters["ProjectID"].DefaultValue = ProjectID;
            }
        }

        protected void NewRegistrationButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");

        }

        
        

        #region Generic

        protected void RadGrid_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
        {
            string item = e.Item.OwnerTableView.Name;
            RadGrid grid = source as RadGrid;
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                DisplayMessage(grid, item + " cannot be updated. Reason: " + e.Exception.Message);
            }
            else
            {
                DisplayMessage(grid, item + " updated");
            }
        }

        protected void RadGrid_ItemInserted(object source, GridInsertedEventArgs e)
        {
            string item = e.Item.OwnerTableView.Name;
            RadGrid grid = source as RadGrid;
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                DisplayMessage(grid, item + " cannot be inserted. Reason: " + e.Exception.Message);
            }
            else
            {
                DisplayMessage(grid, item + " inserted");
            }
        }

        protected void RadGrid_ItemDeleted(object source, GridDeletedEventArgs e)
        {
            string item = e.Item.OwnerTableView.Name;
            RadGrid grid = source as RadGrid;
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                DisplayMessage(grid, item + " cannot be deleted. Reason: " + e.Exception.Message);
            }
            else
            {
                DisplayMessage(grid, item + " deleted");
            }
        }

        #endregion

        #region Project Profile

        protected void ProjectProfileRadDataForm_NeedDataSource(object sender, RadDataFormNeedDataSourceEventArgs e)
        {
            var radDataForm = (sender as RadDataForm);
            radDataForm.DataSource = SourceDataTable;

        }

        protected void ProjectProfileRadDataForm_ItemUpdating(object sender, RadDataFormCommandEventArgs e)
        {
            RadDataFormEditableItem editedItem = e.DataFormItem as RadDataFormEditableItem;
            Hashtable newValues = new Hashtable();
            editedItem.ExtractValues(newValues);

            DataTable ProjectsTable = SourceDataTable;
            //Locate the changed row in the DataSource
            DataRow[] changedRows = ProjectsTable.Select("ID = " + editedItem.GetDataKeyValue("ID"));
            if (changedRows.Length != 1)
            {
                e.Canceled = true;
                return;
            }

            //Update new values          
            changedRows[0].BeginEdit();
            try
            {
                foreach (DictionaryEntry entry in newValues)
                {
                    changedRows[0][(string)entry.Key] = entry.Value;
                }
                changedRows[0].EndEdit();

                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
                    adapter.SelectCommand = new SqlCommand(string.Format("SELECT * FROM [Project] WHERE ID = {0}", ProjectID), connection);
                    adapter.Update(SourceDataTable);
                }

            }
            catch (Exception ex)
            {
                changedRows[0].CancelEdit();
                e.Canceled = true;
            }
        }

        private DataTable SourceDataTable
        {
            get
            {
                Object obj = null;// ViewState["SourceDataTable"];
                if (obj != null)
                {
                    return (DataTable)obj;
                }
                else
                {
                    DataTable sourceDataTable;
                    using (SqlConnection sqlConnection1 = new SqlConnection(ConnectionString))
                    {
                        sourceDataTable = new DataTable();
                        string selectQuery = string.Format("SELECT p.*, ps.Name AS StatusName, pt.Name AS TypeName FROM [Project] p LEFT JOIN [ProjectStatus] ps ON p.StatusID = ps.ID LEFT JOIN ProjectType pt ON p.TypeID = pt.ID WHERE p.ID = {0}", ProjectID);
                        using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter())
                        {
                            sqlDataAdapter.SelectCommand = new SqlCommand(selectQuery, sqlConnection1);
                            sqlDataAdapter.Fill(sourceDataTable);
                        }
                    }
                    ViewState["SourceDataTable"] = sourceDataTable;
                    return sourceDataTable;
                }
            }
        }

        protected void ProjectProfileRadDataForm_PreRender(object sender, EventArgs e)
        {
            if (ProjectProfileRadDataForm.Skin != SelectedSkin)
            {
                ProjectProfileRadDataForm.Skin = SelectedSkin;
                ProjectProfileRadDataForm.Rebind();
            }
        }

        protected void RadGrid_InsertCommand(object source, GridCommandEventArgs e)
        {
            switch (e.Item.OwnerTableView.Name)
            {
                case "Sector":
                    {
                        SectorsDataSource.InsertParameters["ProjectID"].DefaultValue = ProjectID;
                    }
                    break;
                case "SDG":
                    {
                        SDGsDataSource.InsertParameters["ProjectID"].DefaultValue = ProjectID;
                    }
                    break;
                case "DirectBeneficiaries":
                    {
                        DirectBeneficiariesDataSource.InsertParameters["ProjectID"].DefaultValue = ProjectID;
                        DirectBeneficiariesDataSource.InsertParameters["IsLarge"].DefaultValue = IsLargeProject.ToString();
                    }
                    break;
                case "IndirectBeneficiaries":
                    {
                        IndirectBeneficiariesDataSource.InsertParameters["ProjectID"].DefaultValue = ProjectID;
                        IndirectBeneficiariesDataSource.InsertParameters["IsLarge"].DefaultValue = IsLargeProject.ToString();
                    }
                    break;
            }

        }

        protected void RadGrid_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridCommandItem && e.Item.OwnerTableView.Name.Equals("DirectBeneficiaries"))
            {
                GridCommandItem grid = e.Item as GridCommandItem;
                grid.OwnerTableView.Columns.FindByUniqueName("Under5Male").Display = 
                grid.OwnerTableView.Columns.FindByUniqueName("5to18Male").Display = 
                grid.OwnerTableView.Columns.FindByUniqueName("19to50Male").Display = 
                grid.OwnerTableView.Columns.FindByUniqueName("Over50Male").Display = 
                grid.OwnerTableView.Columns.FindByUniqueName("Under5Female").Display = 
                grid.OwnerTableView.Columns.FindByUniqueName("5to18Female").Display = 
                grid.OwnerTableView.Columns.FindByUniqueName("19to55Female").Display = 
                grid.OwnerTableView.Columns.FindByUniqueName("Over50Female").Display = IsLargeProject;
                grid.OwnerTableView.Columns.FindByUniqueName("MaleDirect").Display =
                grid.OwnerTableView.Columns.FindByUniqueName("FemaleDirect").Display = !IsLargeProject;
                
            }
            
            if (e.Item is GridEditFormItem && (e.Item is IGridInsertItem) && e.Item.IsInEditMode)
            {
                GridEditFormItem item = e.Item as GridEditFormItem;
                switch (item.OwnerTableView.Name)
                {
                    case "DirectBeneficiaries":
                        item["Under5Male"].Controls[0].Parent.Parent.Visible =
                        item["5to18Male"].Controls[0].Parent.Parent.Visible =
                        item["19to50Male"].Controls[0].Parent.Parent.Visible =
                        item["Over50Male"].Controls[0].Parent.Parent.Visible =
                        item["Under5Female"].Controls[0].Parent.Parent.Visible =
                        item["Under5Male"].Controls[0].Parent.Parent.Visible =
                        item["5to18Female"].Controls[0].Parent.Parent.Visible =
                        item["19to55Female"].Controls[0].Parent.Parent.Visible =
                        item["Over50Female"].Controls[0].Parent.Parent.Visible = IsLargeProject;
                        item["MaleDirect"].Controls[0].Parent.Parent.Visible =
                        item["FemaleDirect"].Controls[0].Parent.Parent.Visible = !IsLargeProject;
                        break;
                }
            }
        }

        public bool IsLargeProject
        {
            get
            {
                DataRow[] changedRows = SourceDataTable.Select("ID = " + ProjectID);
                if (changedRows.Length != 1)
                {
                    return false;
                }
                double value = double.TryParse(changedRows[0]["CashValueGBP"].ToString(), out value) ? value : 0;
                return value >= 50000;
            }
        }

        private void DisplayMessage(RadGrid grid, string text)
        {
            grid.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
        }

        #endregion

        #region Logic Model

        protected void LogicModelRadGrid_InsertCommand(object source, GridCommandEventArgs e)
        {
            switch (e.Item.OwnerTableView.Name)
            {
                case "Impact":
                    {
                        //GridDataItem parentItem = (GridDataItem)e.Item.OwnerTableView.ParentItem;
                        LogicModelImpactDataSource.InsertParameters["ProjectID"].DefaultValue = ProjectID;
                    }
                    break;
                case "Outcome":
                    {
                        GridDataItem parentItem = (GridDataItem)e.Item.OwnerTableView.ParentItem;
                        LogicModelOutcomeDataSource.InsertParameters["ImpactID"].DefaultValue = parentItem.OwnerTableView.DataKeyValues[parentItem.ItemIndex]["ID"].ToString();
                    }
                    break;
                case "Output":
                    {
                        GridDataItem parentItem = (GridDataItem)e.Item.OwnerTableView.ParentItem;
                        LogicModelOutputDataSource.InsertParameters["OutcomeID"].DefaultValue = parentItem.OwnerTableView.DataKeyValues[parentItem.ItemIndex]["ID"].ToString();
                    }
                    break;
                case "Activity":
                    {
                        GridDataItem parentItem = (GridDataItem)e.Item.OwnerTableView.ParentItem;
                        LogicModelActivityDataSource.InsertParameters["OutputID"].DefaultValue = parentItem.OwnerTableView.DataKeyValues[parentItem.ItemIndex]["ID"].ToString();
                    }
                    break;
            }

        }

        protected void LogicModelRadGrid_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridPagerItem && e.Item.OwnerTableView.Name.Equals("Impact"))
            {
                GridPagerItem pagerItem = e.Item as GridPagerItem;
                int itemsCount = pagerItem.Paging.DataSourceCount;
                var ctr = e.Item.Parent.FindControlRecursive("AddNewRecordButton");
                if (ctr != null)
                    ((Button)ctr).Parent.Parent.Visible = !(itemsCount > 0);
            }

            //if (e.Item is GridDataItem && e.Item.OwnerTableView.DataSourceID == "AccessDataSource1")
            //{
            //    Label lbl = e.Item.FindControl("numberLabel") as Label;
            //    lbl.Text = (e.Item.ItemIndex + 1).ToString();
            //}
        }

        #endregion

        #region Indicators

        protected void ImpactRadGrid_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridPagerItem && (e.Item.OwnerTableView.Name.Equals("ImpactIndicator") || e.Item.OwnerTableView.Name.Equals("OutcomeIndicator")))
            {
                GridPagerItem pagerItem = e.Item as GridPagerItem;
                var ctr = e.Item.Parent.FindControlRecursive("AddNewRecordButton");
                if (ctr != null)
                    ((Button)ctr).Parent.Parent.Visible = false;
            }
        }

        #endregion
    }
}
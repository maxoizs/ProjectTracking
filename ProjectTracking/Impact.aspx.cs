using System;
using System.Web.UI;
using Telerik.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using ProjectTracking.Extensions;
 
 
namespace ProjectTracking
{
    public partial class Impact : System.Web.UI.Page
    {
        private string ProjectID
        {
            get { return "2"; }
        }

        private void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Setting Selected index prior to binding RadGrid:
                //If the index is in detail table, parent items will be expanded
                //automatically 
                LogicModelRadGrid.SelectedIndexes.Add(0,0);
                //Index of 1, 0, 1, 0, 0 means:
                //1 - item with index 1 in the MasterTabelView
                //0 - detail table with index 0
                //1 - item with index 1 (the second item) in the first detail table
                //0 - 0 the third-level detail table
                //0 - the item with index 0 in the third-level table
                LogicModelImpactDataSource.SelectParameters["ProjectID"].DefaultValue = ProjectID;
            }
        }
 
        protected void RadGrid_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
        {
            string item = e.Item.OwnerTableView.Name;
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                DisplayMessage(item + " cannot be updated. Reason: " + e.Exception.Message);
            }
            else
            {
                DisplayMessage(item + " updated");
            }
        }
 
        protected void RadGrid_ItemInserted(object source, GridInsertedEventArgs e)
        {
            string item = e.Item.OwnerTableView.Name;
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                DisplayMessage(item + " cannot be inserted. Reason: " + e.Exception.Message);
            }
            else
            {
                DisplayMessage(item + " inserted");
            }
        }
 
        protected void RadGrid_ItemDeleted(object source, GridDeletedEventArgs e)
        {
            string item = e.Item.OwnerTableView.Name;
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                DisplayMessage(item + " cannot be deleted. Reason: " + e.Exception.Message);
            }
            else
            {
                DisplayMessage(item + " deleted");
            }
        }
 
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
 
        private void DisplayMessage(string text)
        {
            LogicModelRadGrid.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
        }
    }
}

using System;
using System.Web.UI;
using Telerik.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using ProjectTracking.Extensions;
 
 
namespace ProjectTracking
{
    public partial class Indicators : System.Web.UI.Page
    {
        private string ProjectID
        {
            get { return "1"; }
        }

        private void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Setting Selected index prior to binding RadGrid:
                //If the index is in detail table, parent items will be expanded
                //automatically 
                ImpactRadGrid.SelectedIndexes.Add(0,0);
                //Index of 1, 0, 1, 0, 0 means:
                //1 - item with index 1 in the MasterTabelView
                //0 - detail table with index 0
                //1 - item with index 1 (the second item) in the first detail table
                //0 - 0 the third-level detail table
                //0 - the item with index 0 in the third-level table
                ImpactDataSource.SelectParameters["ProjectID"].DefaultValue = ProjectID;
                OutcomeDataSource.SelectParameters["ProjectID"].DefaultValue = ProjectID;
            }
        }
 
        protected void ImpactRadGrid_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
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
 
        protected void ImpactRadGrid_ItemInserted(object source, GridInsertedEventArgs e)
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
 
        protected void ImpactRadGrid_ItemDeleted(object source, GridDeletedEventArgs e)
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

 
        private void DisplayMessage(string text)
        {
            ImpactRadGrid.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
        }
    }
}

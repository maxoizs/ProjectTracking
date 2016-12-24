using System;
using System.Web.UI;
using Telerik.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
 
 
namespace ProjectTracking
{
    public partial class LogicModel : System.Web.UI.Page
    {
        private string ImpactID
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
                //RadGrid1.SelectedIndexes.Add(1, 0, 1, 0, 0);
                //Index of 1, 0, 1, 0, 0 means:
                //1 - item with index 1 in the MasterTabelView
                //0 - detail table with index 0
                //1 - item with index 1 (the second item) in the first detail table
                //0 - 0 the third-level detail table
                //0 - the item with index 0 in the third-level table
                SqlDataSource1.SelectParameters["ImpactID"].DefaultValue = ImpactID;
            }
        }
 
        protected void RadGrid1_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
        {
            string item = getItemName(e.Item.OwnerTableView.Name);
            string field = getFieldName(e.Item.OwnerTableView.Name);
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                DisplayMessage(item + " " + e.Item[field].Text + " cannot be updated. Reason: " + e.Exception.Message);
            }
            else
            {
                DisplayMessage(item + " " + e.Item[field].Text + " updated");
            }
        }
 
        protected void RadGrid1_ItemInserted(object source, GridInsertedEventArgs e)
        {
            string item = getItemName(e.Item.OwnerTableView.Name);
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
 
        protected void RadGrid1_ItemDeleted(object source, GridDeletedEventArgs e)
        {
            string item = getItemName(e.Item.OwnerTableView.Name);
            string field = getFieldName(e.Item.OwnerTableView.Name);
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                DisplayMessage(item + " " + e.Item[field].Text + " cannot be deleted. Reason: " + e.Exception.Message);
            }
            else
            {
                DisplayMessage(item + " " + e.Item[field].Text + " deleted");
            }
        }
 
        protected void RadGrid1_InsertCommand(object source, GridCommandEventArgs e)
        {
            switch (e.Item.OwnerTableView.Name)
            {
               case "Output":
                    {
                        GridDataItem parentItem = (GridDataItem)e.Item.OwnerTableView.ParentItem;
                        SqlDataSource2.InsertParameters["OutcomeID"].DefaultValue = parentItem.OwnerTableView.DataKeyValues[parentItem.ItemIndex]["ID"].ToString();
                    }
                    break;
                case "Activity":
                    {
                        GridDataItem parentItem = (GridDataItem)e.Item.OwnerTableView.ParentItem;
                        SqlDataSource3.InsertParameters["OutputID"].DefaultValue = parentItem.OwnerTableView.DataKeyValues[parentItem.ItemIndex]["ID"].ToString();
                    }
                    break;
            }
 
        }
 
        protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridEditFormItem && !(e.Item is IGridInsertItem) && e.Item.IsInEditMode)
            {
                GridEditFormItem item = e.Item as GridEditFormItem;
                switch (item.OwnerTableView.Name)
                {
                    case "Outcome":
                        TextBox impactIDBox = item["ImpactID"].Controls[0] as TextBox;
                        impactIDBox.Enabled = false;
                        break;
                    case "Activity":
                        //TextBox outputIDBox = item["OutputID"].Controls[0] as TextBox;
                        //outputIDBox.Enabled = false;
                        break;
                }
            }
        }

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem && e.Item.OwnerTableView.DataSourceID == "AccessDataSource1")
            {
                Label lbl = e.Item.FindControl("numberLabel") as Label;
                lbl.Text = (e.Item.ItemIndex + 1).ToString();
            }

            if (e.Item is GridEditFormItem && (e.Item is IGridInsertItem) && e.Item.IsInEditMode)
            {
                GridEditFormItem item = e.Item as GridEditFormItem;
                switch (item.OwnerTableView.Name)
                {
                    case "Outcome":
                        TextBox impactIDBox = item["ImpactID"].Controls[0] as TextBox;
                        impactIDBox.Text = ImpactID;
                        impactIDBox.Enabled = impactIDBox.Visible = false;
                        break;
                    case "Output":
                        //RadDatePicker picker1 = (RadDatePicker)item.FindControl("picker1");
                        //picker1.SharedCalendar = sharedCalendar;
                        break;
                    case "Activity":
                        //RadDatePicker picker2 = (RadDatePicker)item.FindControl("picker2");
                        //picker2.SharedCalendar = sharedCalendar;
                        //RadDatePicker picker3 = (RadDatePicker)item.FindControl("picker3");
                        //picker3.SharedCalendar = sharedCalendar;
                        break;
                }
            }
        }
 
        private String getItemName(string tableName)
        {
            switch (tableName)
            {
                case ("Outcome"):
                    {
                        return "Outcome";
                    }
                case ("Output"):
                    {
                        return "Output";
                    }
                case ("Activity"):
                    {
                        return "Activity";
                    }
                default: return "";
            }
        }
 
        private String getFieldName(string tableName)
        {
            switch (tableName)
            {
                case ("Outcome"):
                    {
                        return "ID";
                    }
                case ("Output"):
                    {
                        return "ID";
                    }
                case ("Activity"):
                    {
                        return "ID";
                    }
                default: return "";
            }
        }
 
        private void DisplayMessage(string text)
        {
            RadGrid1.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
        }
    }
}

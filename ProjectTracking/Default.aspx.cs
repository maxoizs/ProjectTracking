using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Web.Script.Services;
using System.Web.Services;
 
 
namespace ProjectTracking
{
    public partial class _Default : System.Web.UI.Page
    {
        public string ConnectionString = ConfigurationManager.ConnectionStrings["OnTrack"].ConnectionString;

        private string selectedCountry;
        public string SelectedCountry
        {
            set {selectedCountry = value; }
            get { return selectedCountry; }
        }

        public void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                SelectedCountry = Request["Country"]?? "";
                lblCountry.Text = SelectedCountry;
                LoadDataForProjectsRadGrid();
            }
        }

        protected void ProjectsRadGrid_PageSizeChanged(object sender, GridPageSizeChangedEventArgs e)
        {
            LoadDataForProjectsRadGrid();
        }

        protected void ProjectsRadGrid_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            LoadDataForProjectsRadGrid();
        }

        protected void ProjectsRadGrid_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            LoadDataForProjectsRadGrid();
        }

        private void LoadDataForProjectsRadGrid()
        {
            ProjectsRadGrid.DataSource = GetProjects();
        }

        protected void RadGrid2_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            (sender as RadGrid).DataSource = GetProjects();
        }

        public DataTable GetProjects()
        {
            string query = "SELECT ID, Name, PIN, Country FROM Project WHERE Country = 'IN'";

            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(query, conn);

            DataTable myDataTable = new DataTable();

            conn.Open();
            try
            {
                adapter.Fill(myDataTable);
            }
            finally
            {
                conn.Close();
            }

            return myDataTable;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<Countries> LoadProjectsMap()
        {
            List<Countries> countries = new List<Countries>();

            countries.Add(new Countries());
            countries[0].Country = "India";
            countries[0].Popularity = 3000;

            countries.Add(new Countries());
            countries[1].Country = "United States";
            countries[1].Popularity = 2500;

            countries.Add(new Countries());
            countries[2].Country = "Russia";
            countries[2].Popularity = 2100;

            countries.Add(new Countries());
            countries[3].Country = "Canada";
            countries[3].Popularity = 1700;

            countries.Add(new Countries());
            countries[4].Country = "United Kingdom";
            countries[4].Popularity = 1600;

            countries.Add(new Countries());
            countries[5].Country = "France";
            countries[5].Popularity = 1200;

            countries.Add(new Countries());
            countries[6].Country = "China";
            countries[6].Popularity = 3000;

            countries[6].Country = "Morocco";
            countries[6].Popularity = 3500;
            return countries;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<Cities> LoadProjectsByCities(string CountryCode)
        {
            List<Cities> cities = new List<Cities>();

            cities.Add(new Cities());
            cities[0].City = "Mumbai";
            cities[0].Popularity = 900;

            cities.Add(new Cities());
            cities[1].City = "Hyderbad";
            cities[1].Popularity = 800;

            cities.Add(new Cities());
            cities[2].City = "Kolkata";
            cities[2].Popularity = 750;

            cities.Add(new Cities());
            cities[3].City = "Chennai";
            cities[3].Popularity = 700;

            return cities;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static void LoadProjectsByCountry(string CountryCode)
        {
            
        }

        public class Cities
        {
            public string City { get; set; }
            public int Popularity { get; set; }
        }

        public class Countries
        {
            public string Country { get; set; }
            public int Popularity { get; set; }
        }
    }
}
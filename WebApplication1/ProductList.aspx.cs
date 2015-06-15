using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow row = gridProducts.Rows[e.NewEditIndex];

            int rowId = Convert.ToInt32(row.Cells[1].Text);

            Response.Redirect("~/ManagementProduct.aspx?id=" + rowId);
        }
    }
}
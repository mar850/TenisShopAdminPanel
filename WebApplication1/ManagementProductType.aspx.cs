using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1.Management
{
    public partial class ManagementProductType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            add_type_button.ServerClick += new EventHandler(add_type_button_Click);
        }

        protected void add_type_button_Click(object sender, EventArgs e)
        {
            ProductTypeModel model = new ProductTypeModel();
            ProductType pt = CreateProductTypes();
            model.InsertProductType(pt);
            info_label.InnerText = model.InsertProductType(pt);
        }

        private ProductType CreateProductTypes()
        {
            string name;
            name = product_name_lineEdit.Value;
            ProductType p = new ProductType();
            p.Name = name;

            return p;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class add_product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            add_product_button.ServerClick += new EventHandler(add_product_button_Click);
        }
        protected void add_product_button_Click(object sender, EventArgs e)
        {
            ProductModel productModel = new ProductModel();
            Product product = CreateProduct();

            info_label_product.InnerHtml = productModel.InsertProduct(product);

                
        }
        
        private Product CreateProduct()
        {
            Product product = new Product();

            product.Name = product_name.Value;
            product.Price = Convert.ToInt32(price.Value);
            product.TypeId = Convert.ToInt32(DropDownCategoryList.SelectedValue);
            product.Description = comment.Value;
            product.Image = images_files.Value;

            return product;
        }

        

    }
}
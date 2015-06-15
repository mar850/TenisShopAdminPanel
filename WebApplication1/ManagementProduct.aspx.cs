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
            if (!IsPostBack)
            {
                GetImages();
                //sprawdzamy czy link url zawiera parametr id
                if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    FillPage(id);


                }

            }
            add_product_button.ServerClick += new EventHandler(add_product_button_Click);
        }

        private void FillPage(int id)
        {
            //Pobranie produktow z bazy danych

            ProductModel productModel = new ProductModel();
            Product product = productModel.GetProduct(id);

            product_name.Value = product.Name;
            price.Value = Convert.ToString(product.Price);
            comment.Value = product.Description;

            DropDownCategoryList.SelectedValue = product.TypeId.ToString();
            DropDownImagesList.SelectedValue = product.Image;            

        }

        protected void add_product_button_Click(object sender, EventArgs e)
        {
            ProductModel productModel = new ProductModel();
            Product product = CreateProduct();

            if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                info_label_product.InnerHtml = productModel.UpdateProduct(id, product); 
            }
            else
            {
                info_label_product.InnerHtml = productModel.InsertProduct(product);
            }
            
        }

        private void GetImages()
        {
            try
            {
                string [] images  = Directory.GetFiles(Server.MapPath("~/Images/Product/"));
                ArrayList imageList = new ArrayList();
                foreach (string image in images)
                {
                    string imageName = image.Substring(image.LastIndexOf(@"\",StringComparison.Ordinal) + 1);
                    imageList.Add(imageName);

                }
                DropDownImagesList.DataSource = imageList;
                DropDownImagesList.AppendDataBoundItems = true;
                DropDownImagesList.DataBind();
                
            }
            catch (Exception e)
            {
                error_image_Label.Text = e.ToString();

            }


        }
        
        private Product CreateProduct()
        {
            Product product = new Product();

            product.Name = product_name.Value;
            product.Price = Convert.ToInt32(price.Value);
            product.TypeId = Convert.ToInt32(DropDownCategoryList.SelectedValue);
            product.Description = comment.Value;
            product.Image = DropDownImagesList.SelectedValue;

            return product;
        }

        

    }
}
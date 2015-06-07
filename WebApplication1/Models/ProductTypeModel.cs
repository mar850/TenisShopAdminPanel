using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class ProductTypeModel
    {
        public string InsertProductType(ProductType productType)
        {
            try
            {
                TenisDbEntities db = new TenisDbEntities();
                db.ProductTypes.Add(productType);
                db.SaveChanges();
                return "kategoria " + productType.Name + " została dodana do bazy danych ";
            }
            catch (Exception e)
            {
                return "Error:" + e;

            }


        }

        public string UpdateProductType(int id, ProductType productType)
        {
            try
            {
                TenisDbEntities db = new TenisDbEntities();
                ProductType p = db.ProductTypes.Find(id);

                p.Name = productType.Name;

                db.SaveChanges();
                return productType.Name + "został zaktualizowany";

            }
            catch (Exception e)
            {
                return "Error:" + e;

            }


        }

        public string DeleteProduct(int id)
        {
            try
            {
                TenisDbEntities db = new TenisDbEntities();
                ProductType product = db.ProductTypes.Find(id);
                db.ProductTypes.Attach(product);
                db.ProductTypes.Remove(product);

                db.SaveChanges();
                return "kategoria " + product.Name + "została usunięta";

            }
            catch (Exception e)
            {
                return "Error:" + e;

            }

        }
    }
}
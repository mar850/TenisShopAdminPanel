using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class ProductModel
    {
        public string InsertProduct(Product product)
        {
            try
            {
                TenisDbEntities db = new TenisDbEntities();
                db.Products.Add(product);
                db.SaveChanges();
                return "produkt " + product.Name + " został dodany do bazy danych ";
            }
            catch (Exception e)
            {
                return "Error:" + e;

            }


        }

        public string UpdateProduct(int id, Product product)
        {
            try
            {
                TenisDbEntities db = new TenisDbEntities();
                Product p = db.Products.Find(id);

                p.Name = product.Name;
                p.Price = product.Price;
                p.TypeId = product.TypeId;
                p.Description = product.Description;
                p.Image = product.Image;

                db.SaveChanges();
                return product.Name + "został zaktualizowany";

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
                Product product = db.Products.Find(id);
                db.Products.Attach(product);
                db.Products.Remove(product);

                db.SaveChanges();
                return product.Name + "prozostał usunięty";

            }
            catch (Exception e)
            {
                return "Error:" + e;

            }

        }

        public Product GetProduct(int id)
        {
            try
            {
                using (TenisDbEntities db = new TenisDbEntities())
                {
                    Product product = db.Products.Find(id);
                    return product;

                }
            }
            catch (Exception)
            {
                return null;

            }
        }

        public List<Product> GetAllProduct()
        {
            try
            {
                using (TenisDbEntities db = new TenisDbEntities())
                {
                    List<Product> products = (from x in db.Products select x).ToList();
                    return products;

                }

            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<Product> GetAllProducts(int typeId)
        {
            try
            {
                using (TenisDbEntities db = new TenisDbEntities())
                {
                    List<Product> products = (from x in db.Products
                                              where x.TypeId == typeId
                                              select x).ToList();
                    return products;


                }
            }
            catch (Exception)
            {

                return null;

            }

        }
    }
}
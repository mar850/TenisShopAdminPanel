using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class CartModel
    {
        public string InsertCart(Cart cart)
        {
            try
            {
                TenisShopDbEntities db = new TenisShopDbEntities();
                db.Carts.Add(cart);
                db.SaveChanges();
                return cart.DatePurchased + "został doday do koszyka ";
            }
            catch (Exception e)
            {
                return "Error:" + e;
                    
            }


        }

        public string UpdateProduct(int id, Cart cart)
        {
            try
            {
                TenisShopDbEntities db = new TenisShopDbEntities();
                Cart p = db.Carts.Find(id);

                p.DatePurchased = cart.DatePurchased;
                p.ClientID = cart.ClientID;
                p.Amount = cart.Amount;
                p.IsInCart = cart.IsInCart;
                p.ProducentID = cart.ProducentID;

                db.SaveChanges();
                return cart.DatePurchased + "został zaktualizowany";

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
                TenisShopDbEntities db = new TenisShopDbEntities();
                Cart cart = db.Carts.Find(id);

                db.Carts.Attach(cart);
                db.Carts.Remove(cart);

                db.SaveChanges();
                return cart.DatePurchased + "prozostał usunięty";
    
            }
            catch (Exception e)
            {
                return "Error:" + e;
                    
            }

        }

    }
    
}
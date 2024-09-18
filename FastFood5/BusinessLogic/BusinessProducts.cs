using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using DataAccess;

namespace BusinessLogic
{
    public class BusinessProducts
    {

        private Connection data;

        public BusinessProducts()
        {
            this.data = new Connection();
        }

        public List<Product> ListWithSP()
        {
            List<Product> listProducts = new List<Product>();

            try
            {
                data.storedProcedureConsult("storedListProducts");
                data.executeRead();
                while (data.Read.Read())
                {
                    Product auxProduct = new Product();

                    auxProduct.ProductId = (int)data.Read["ProductId"];
                    if (!(data.Read["Name"] is DBNull))
                        auxProduct.Name = (string)data.Read["Name"];
                    if (!(data.Read["Description"] is DBNull))
                        auxProduct.Description = (string)data.Read["Description"];
                    if (!(data.Read["Price"] is DBNull))
                        auxProduct.Price = (decimal)data.Read["Price"];
                    if (!(data.Read["Quantity"] is DBNull))
                        auxProduct.Quantity = (int)data.Read["Quantity"];

                    if (!(data.Read["ImageUrl"] is DBNull))
                        auxProduct.ImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["IsActive"] is DBNull))
                        auxProduct.IsActive = bool.Parse(data.Read["IsActive"].ToString());
                    if (!(data.Read["CreatedDate"] is DBNull))
                        auxProduct.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());

                    if (!(data.Read["Category"] is DBNull))
                    {
                        auxProduct.Category = new CategoryD();
                        auxProduct.Category.Name = (string)data.Read["Category"];
                    }



                    listProducts.Add(auxProduct);
                }


                return listProducts;

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }

        }

        public Product ShowProduct(Product selectedProduct)
        {
            try
            {
                data.storedProcedureConsult("storedShowProduct");
                data.SetParameter("@ProductId", selectedProduct.ProductId);
                data.executeRead();

                while (data.Read.Read())
                {

                    selectedProduct.ProductId = (int)data.Read["ProductId"];
                    if (!(data.Read["Name"] is DBNull))
                        selectedProduct.Name = (string)data.Read["Name"];
                    if (!(data.Read["Description"] is DBNull))
                        selectedProduct.Description = (string)data.Read["Description"];
                    if (!(data.Read["Price"] is DBNull))
                        selectedProduct.Price = (decimal)data.Read["Price"];
                    if (!(data.Read["Quantity"] is DBNull))
                        selectedProduct.Quantity = (int)data.Read["Quantity"];

                    if (!(data.Read["ImageUrl"] is DBNull))
                        selectedProduct.ImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["IsActive"] is DBNull))
                        selectedProduct.IsActive = bool.Parse(data.Read["IsActive"].ToString());
                    if (!(data.Read["CreatedDate"] is DBNull))
                        selectedProduct.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());

                    if (!(data.Read["CategoryId"] is DBNull))
                    {
                        selectedProduct.Category = new CategoryD();
                        selectedProduct.Category.CategoryId = int.Parse(data.Read["CategoryId"].ToString());
                    }

                }

                return selectedProduct;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }
        }
        public Product ShowProductName(Product selectedProduct)
        {
            try
            {
                data.storedProcedureConsult("storedShowProductName");
                data.SetParameter("@Name", selectedProduct.Name);
                data.executeRead();

                while (data.Read.Read())
                {

                    selectedProduct.ProductId = (int)data.Read["ProductId"];
                    if (!(data.Read["Name"] is DBNull))
                        selectedProduct.Name = (string)data.Read["Name"];
                    if (!(data.Read["CreatedDate"] is DBNull))
                        selectedProduct.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());

                }

                return selectedProduct;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }
        }


        public Product ShowProductDetail(Product selectedProduct)
        {
            try
            {
                data.storedProcedureConsult("storedListProducts");
                data.SetParameter("@ProductId", selectedProduct.ProductId);
                data.executeRead();

                while (data.Read.Read())
                {

                    selectedProduct.ProductId = (int)data.Read["ProductId"];
                    if (!(data.Read["Name"] is DBNull))
                        selectedProduct.Name = (string)data.Read["Name"];
                    if (!(data.Read["Description"] is DBNull))
                        selectedProduct.Description = (string)data.Read["Description"];
                    if (!(data.Read["Price"] is DBNull))
                        selectedProduct.Price = (decimal)data.Read["Price"];
                    if (!(data.Read["Quantity"] is DBNull))
                        selectedProduct.Quantity = (int)data.Read["Quantity"];

                    if (!(data.Read["ImageUrl"] is DBNull))
                        selectedProduct.ImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["IsActive"] is DBNull))
                        selectedProduct.IsActive = bool.Parse(data.Read["IsActive"].ToString());
                    if (!(data.Read["CreatedDate"] is DBNull))
                        selectedProduct.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());

                    if (!(data.Read["Category"] is DBNull))
                    {
                        selectedProduct.Category = new CategoryD();
                        selectedProduct.Category.Name = (string)data.Read["Category"];
                    }

                }

                return selectedProduct;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }
        }

        public void UpdateWithSp(Product addProduct)
        {
            try
            {
                data.storedProcedureConsult("storedUpdateProduct");
                data.SetParameter("@ProductId", addProduct.ProductId);
                data.SetParameter("@Name", addProduct.Name);
                data.SetParameter("@Description", addProduct.Description);
                data.SetParameter("@Price", addProduct.Price);
                data.SetParameter("@Quantity", addProduct.Quantity);
                data.SetParameter("@ImageUrl", (object)addProduct.ImageUrl ?? DBNull.Value);
                data.SetParameter("@CategoryId", addProduct.Category.CategoryId);
                data.SetParameter("@IsActive", addProduct.IsActive);
                data.executeAction();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }
        }


        public List<Product> AdvancedFilter(string field, string criterion, string filter, string state)
        {
            List<Product> listProducts = new List<Product>();

            try
            {
                string consult = "Select ProductId,P.Name, Description, Price, Quantity, P.ImageUrl, P.IsActive,  P.CreatedDate, C.Name Category from Products P, Categories C Where P.CategoryId = C.CategoryId And";

                switch (field)
                {
                    case "Name":

                        switch (criterion)
                        {
                            case "Starts with":
                                consult += " P.Name like " + "'" + filter + "%'";
                                break;
                            case "Ends with":
                                consult += " P.Name like " + "'%" + filter + "'";
                                break;
                            case "Contains":
                                consult += " P.Name like " + "'%" + filter + "%'";
                                break;
                        }
                        break;

                    case "Description":

                        switch (criterion)
                        {
                            case "Starts with":
                                consult += " Description like " + "'" + filter + "%'";
                                break;
                            case "Ends with":
                                consult += " Description like " + "'%" + filter + "'";
                                break;
                            case "Contains":
                                consult += " Description like " + "'%" + filter + "%'";
                                break;
                        }
                        break;
                    case "Price":

                        switch (criterion)
                        {
                            case "Greater than":
                                consult += " Price > " + filter;
                                break;
                            case "Less than":
                                consult += " Price < " + filter;
                                break;
                            case "Equal to":
                                consult += " Price = " + filter;
                                break;
                        }
                        break;
                    case "Quantity":

                        switch (criterion)
                        {
                            case "Greater than":
                                consult += " Quantity > " + filter;
                                break;
                            case "Less than":
                                consult += " Quantity < " + filter;
                                break;
                            case "Equal to":
                                consult += " Quantity = " + filter;
                                break;
                        }
                        break;
                    default:
                        break;
                }

                if (state == "Active")
                    consult += " And P.IsActive = 1";
                else if (state == "Inactive")
                    consult += " And P.IsActive = 0";

                data.setConsult(consult);
                data.executeRead();

                while (data.Read.Read())
                {
                    Product auxProduct = new Product();

                    auxProduct.ProductId = (int)data.Read["ProductId"];
                    if (!(data.Read["Name"] is DBNull))
                        auxProduct.Name = (string)data.Read["Name"];
                    if (!(data.Read["Description"] is DBNull))
                        auxProduct.Description = (string)data.Read["Description"];
                    if (!(data.Read["Price"] is DBNull))
                        auxProduct.Price = (decimal)data.Read["Price"];
                    if (!(data.Read["Quantity"] is DBNull))
                        auxProduct.Quantity = (int)data.Read["Quantity"];

                    if (!(data.Read["ImageUrl"] is DBNull))
                        auxProduct.ImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["IsActive"] is DBNull))
                        auxProduct.IsActive = bool.Parse(data.Read["IsActive"].ToString());
                    if (!(data.Read["CreatedDate"] is DBNull))
                        auxProduct.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());

                    if (!(data.Read["Category"] is DBNull))
                    {
                        auxProduct.Category = new CategoryD();
                        auxProduct.Category.Name = (string)data.Read["Category"];
                    }


                    listProducts.Add(auxProduct);
                }

                return listProducts;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void DeleteWithSP(Product deleteProduct)
        {
            try
            {
                data.storedProcedureConsult("storedDeleteProduct");
                data.SetParameter("@ProductId", deleteProduct.ProductId);
                data.executeAction();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }
        }

        public void AddWithSP(Product addProduct)
        {

            try
            {
                data.storedProcedureConsult("storedAddProductName");
                data.SetParameter("@Name", addProduct.Name);

                //ver si elimino esto !!!!!!!!!!!!!!!!
                //data.SetParameter("@Description", addProduct.Description);
                //data.SetParameter("@Price", addProduct.Price);
                //data.SetParameter("@Quantity", addProduct.Quantity);
                //data.SetParameter("@CategoryId", addProduct.Category.CategoryId);
                //data.SetParameter("@@ImageUrl", (object)addProduct.ImageUrl ?? DBNull.Value);
                //data.SetParameter("@IsActive", addProduct.IsActive);
                data.executeAction();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConection();
            }
        }

    }
}


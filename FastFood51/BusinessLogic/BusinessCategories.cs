using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using DataAccess;

namespace BusinessLogic
{
    public class BusinessCategories
    {
        private Connection data;
        public BusinessCategories()
        {
            this.data = new Connection();
        }

        public List<CategoryD> ListWithSP()
        {
            List<CategoryD> listCategories = new List<CategoryD>();

            try
            {
                data.storedProcedureConsult("storedListCategories");

                data.executeRead();
                while (data.Read.Read())
                {
                    CategoryD auxCategory = new CategoryD();

                    auxCategory.CategoryId = (int)data.Read["CategoryId"];
                    if (!(data.Read["Name"] is DBNull))
                        auxCategory.Name = (string)data.Read["Name"];
                    if (!(data.Read["ImageUrl"] is DBNull))
                        auxCategory.ImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["IsActive"] is DBNull))
                        auxCategory.IsActive = bool.Parse(data.Read["IsActive"].ToString());
                    if (!(data.Read["CreatedDate"] is DBNull))
                        auxCategory.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());
                    if (!(data.Read["IsOffert"] is DBNull))
                        auxCategory.IsOffert = bool.Parse(data.Read["IsOffert"].ToString());

                    listCategories.Add(auxCategory);
                }
                return listCategories;
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

        public int TotalCategories()
        {
            int TotalCategories = 0;

            try
            {
                data.clearParameter();
                data.storedProcedureConsult("storedTotalCategories");

                data.executeRead();
                while (data.Read.Read())
                {
                    if (!(data.Read["Total"] is DBNull))
                        TotalCategories = (int)data.Read["Total"];
                }
                return TotalCategories;
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

        public List<CategoryD> ListCategoryActive()
        {
            List<CategoryD> listCategories = new List<CategoryD>();

            try
            {
                data.storedProcedureConsult("storedListCategoriesActive");

                data.executeRead();
                while (data.Read.Read())
                {
                    CategoryD auxCategory = new CategoryD();

                    auxCategory.CategoryId = (int)data.Read["CategoryId"];
                    if (!(data.Read["Name"] is DBNull))
                        auxCategory.Name = (string)data.Read["Name"];
                    if (!(data.Read["ImageUrl"] is DBNull))
                        auxCategory.ImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["IsActive"] is DBNull))
                        auxCategory.IsActive = bool.Parse(data.Read["IsActive"].ToString());
                    if (!(data.Read["CreatedDate"] is DBNull))
                        auxCategory.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());

                    listCategories.Add(auxCategory);
                }
                return listCategories;
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

        public List<CategoryD> ListCategoryActiveOffert()
        {
            List<CategoryD> listCategories = new List<CategoryD>();

            try
            {
                data.storedProcedureConsult("storedListCategoriesActiveOffert");

                data.executeRead();
                while (data.Read.Read())
                {
                    CategoryD auxCategory = new CategoryD();

                    auxCategory.CategoryId = (int)data.Read["CategoryId"];
                    if (!(data.Read["Name"] is DBNull))
                        auxCategory.Name = (string)data.Read["Name"];
                    if (!(data.Read["ImageUrl"] is DBNull))
                        auxCategory.ImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["IsActive"] is DBNull))
                        auxCategory.IsActive = bool.Parse(data.Read["IsActive"].ToString());
                    if (!(data.Read["CreatedDate"] is DBNull))
                        auxCategory.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());
                    if (!(data.Read["IsOffert"] is DBNull))
                        auxCategory.IsOffert = bool.Parse(data.Read["IsOffert"].ToString());
                    if (!(data.Read["OfferPercentage"] is DBNull))
                        auxCategory.OfferPercentage = int.Parse(data.Read["OfferPercentage"].ToString());

                    listCategories.Add(auxCategory);
                }
                return listCategories;
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

        public CategoryD ShowCategory(CategoryD selectedCategory)
        {
            try
            {
                data.storedProcedureConsult("storedShowCategory");

                data.SetParameter("@CategoryId", selectedCategory.CategoryId);
                data.executeRead();

                while (data.Read.Read())
                {
                    selectedCategory.CategoryId = (int)data.Read["CategoryId"];
                    if (!(data.Read["Name"] is DBNull))
                        selectedCategory.Name = (string)data.Read["Name"];
                    if (!(data.Read["ImageUrl"] is DBNull))
                        selectedCategory.ImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["IsActive"] is DBNull))
                        selectedCategory.IsActive = bool.Parse(data.Read["IsActive"].ToString());
                    if (!(data.Read["CreatedDate"] is DBNull))
                        selectedCategory.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());
                    if (!(data.Read["IsOffert"] is DBNull))
                        selectedCategory.IsOffert = bool.Parse(data.Read["IsOffert"].ToString());
                    if (!(data.Read["OfferPercentage"] is DBNull))
                        selectedCategory.OfferPercentage = int.Parse(data.Read["OfferPercentage"].ToString());
                }
                return selectedCategory;
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
        public CategoryD ShowCategoryName(CategoryD selectedCategory)
        {
            try
            {
                data.storedProcedureConsult("storedShowCategoryName");

                data.SetParameter("@Name", selectedCategory.Name);
                data.executeRead();

                while (data.Read.Read())
                {
                    selectedCategory.CategoryId = (int)data.Read["CategoryId"];
                    if (!(data.Read["Name"] is DBNull))
                        selectedCategory.Name = (string)data.Read["Name"];
                    if (!(data.Read["CreatedDate"] is DBNull))
                        selectedCategory.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());
                }
                return selectedCategory;
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

        public void UpdateWithSp(CategoryD addCategory)
        {
            try
            {
                data.storedProcedureConsult("storedUpdateCategory");

                data.SetParameter("@CategoryId", addCategory.CategoryId);
                data.SetParameter("@Name", addCategory.Name);
                data.SetParameter("@IsActive", addCategory.IsActive);
                data.SetParameter("@ImageUrl", (object)addCategory.ImageUrl ?? DBNull.Value);
                data.SetParameter("@IsOffert", addCategory.IsOffert);
                data.SetParameter("@OfferPercentage", addCategory.OfferPercentage);
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

        public List<CategoryD> AdvancedFilter(string field, string criterion, string filter, string state)
        {
            List<CategoryD> listCategories = new List<CategoryD>();

            try
            {
                string consult = "Select CategoryId, Name, ImageUrl, IsActive, CreatedDate from Categories Where";

                switch (field)
                {
                    case "Name":

                        switch (criterion)
                        {
                            case "Starts with":
                                consult += " Name like " + "'" + filter + "%'";
                                break;
                            case "Ends with":
                                consult += " Name like " + "'%" + filter + "'";
                                break;
                            case "Contains":
                                consult += " Name like " + "'%" + filter + "%'";
                                break;
                        }
                        break;

                    default:
                        break;
                }
                if (state == "Active")
                    consult += " And IsActive = 1";
                else if (state == "Inactive")
                    consult += " And IsActive = 0";

                data.setConsult(consult);
                data.executeRead();

                while (data.Read.Read())
                {
                    CategoryD auxCategory = new CategoryD();

                    auxCategory.CategoryId = (int)data.Read["CategoryId"];
                    if (!(data.Read["Name"] is DBNull))
                        auxCategory.Name = (string)data.Read["Name"];
                    if (!(data.Read["ImageUrl"] is DBNull))
                        auxCategory.ImageUrl = (string)data.Read["ImageUrl"];
                    if (!(data.Read["IsActive"] is DBNull))
                        auxCategory.IsActive = bool.Parse(data.Read["IsActive"].ToString());
                    if (!(data.Read["CreatedDate"] is DBNull))
                        auxCategory.CreatedDate = DateTime.Parse(data.Read["CreatedDate"].ToString());

                    listCategories.Add(auxCategory);
                }
                return listCategories;
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

        public void DeleteWithSP(int deleteCategory)
        {
            try
            {
                data.storedProcedureConsult("storedDeleteCategory");
                data.SetParameter("@CategoryId", deleteCategory);
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

        public int AddWithSP(CategoryD addCategory)
        {
            try
            {
                data.storedProcedureConsult("storedAddCategory");

                data.SetParameter("@Name", addCategory.Name);
                data.SetParameter("@IsActive", addCategory.IsActive);
                data.SetParameter("@IsOffert", addCategory.IsOffert);
                data.SetParameter("@OfferPercentage", addCategory.OfferPercentage);

                return data.executeActionScalar();
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

        public void AddImageWithSP(CategoryD addCategory)
        {
            try
            {
                data.storedProcedureConsult("storedAddCategoryImage");

                data.clearParameter();
                data.SetParameter("@ImageUrl", (object)addCategory.ImageUrl ?? DBNull.Value);
                data.SetParameter("@CategoryId", addCategory.CategoryId);
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

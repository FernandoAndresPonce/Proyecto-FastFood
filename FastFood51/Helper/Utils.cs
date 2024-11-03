using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Helper
{
    public class Utils
    {
        public static string GetImageUrlProduct(Object url)
        {
            string url1 = "";
            if(/*string.IsNullOrEmpty(url.ToString()) || */ url == DBNull.Value)
            {
                url1 = "../Admin/Image/placeholder/placeholder.jpg";
            }
            else
            {
                url1 = string.Format("../Admin/Image/Products/{0}", url);
            }
            return url1;
        }
        public static string GetImageUrlCategory(Object url)
        {
            string url1 = "";
            if (url == DBNull.Value)
            {
                url1 = "../Admin/Image/placeholder/placeholder.jpg";
            }
            else
            {
                url1 = string.Format("../Admin/Image/Categories/{0}", url);
            }
            return url1;
        }
        public static string GetUniqueId()
        {
            Guid guid = Guid.NewGuid();
            String uniqueId = guid.ToString();
            return uniqueId;
        }
    }
}

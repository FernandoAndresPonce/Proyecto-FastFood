using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Dominio;
using Helper;

using System.Data;
using System.Data.SqlClient;
using System.Drawing.Printing;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;
using System.Net;

namespace FastFood.User
{
    public partial class Invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Segurity.activeSession(Session["User"]) && Request.QueryString["Id"] != null)
                    {

                        if (Session["MsgPaymentSuccess"] != null)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = Session["MsgPaymentSuccess"].ToString();
                            lblMsg.CssClass = "alert alert-success";
                            Session["MsgPaymentSuccess"] = null;
                        }

                        BusinessOrders business = new BusinessOrders();
                        OrdersD order = new OrdersD();
                        var userId = Session["User"] as UsersD;


                        order.User = new UsersD();
                        order.User.UserId = userId.UserId;
                        order.Payment = new PaymentD();
                        order.Payment.PaymentId = Convert.ToInt32(Request.QueryString["Id"]);

                        List<OrdersD> listOrders = business.ListWithSPOrder(order);

                        decimal grandtotal = 0;
                        ;
                        foreach (var listOrder in listOrders)
                        {
                            grandtotal += listOrder.TotalPrice;
                            DateTime orderDate = listOrder.OrderDate;
                            Session.Add("orderDate", orderDate);
                        }

                        Session.Add("grandTotalPrice", grandtotal);
                        Session.Add("listOrder", listOrders);




                        rOrderItem.DataSource = listOrders;
                        rOrderItem.DataBind();          

                    }
                    else
                    {
                        Response.Redirect("Login.aspx", false);
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);

            }
        }

        protected void lbDownloadInvoice_Click(object sender, EventArgs e)
        {
            try
            {                 
                string directoryPath = @"C:\Usuarios\Fernando\Escritorio"; 
                string downloadPath = Path.Combine(directoryPath, "order_invoice.pdf");

              
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                List<OrdersD> orders = Session["listOrder"] as List<OrdersD>;
                if (orders == null)
                {
                    throw new Exception("No se pudo obtener la lista de órdenes de la sesión.");
                }

                DataTable dtbl = ConvertToDataTable(orders);
                string strHeader = "Order Invoice"; 

                ExportToPdf(dtbl, downloadPath, strHeader);

                using (WebClient client = new WebClient())
                {
                    Byte[] buffer = client.DownloadData(downloadPath);
                    if (buffer != null)
                    {
                        Response.ContentType = "application/pdf";
                        Response.AddHeader("content-length", buffer.Length.ToString());
                        Response.BinaryWrite(buffer);
                    }
                }
            }
            catch (Exception ex )
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        void ExportToPdf(DataTable dtblTable, String strPdfPath, string strHeader)
        {
            FileStream fs = new FileStream(strPdfPath, FileMode.Create, FileAccess.Write, FileShare.None);
            Document document = new Document();
            document.SetPageSize(PageSize.A4);
            PdfWriter writer = PdfWriter.GetInstance(document, fs);
            document.Open();

            BaseFont bfntHead = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            Font fntHead = new Font(bfntHead, 16, 1, Color.GRAY);
            Paragraph prgHeading = new Paragraph();
            prgHeading.Alignment = Element.ALIGN_CENTER;
            prgHeading.Add(new Chunk(strHeader.ToUpper(), fntHead));
            document.Add(prgHeading);

            Paragraph prgAuthor = new Paragraph();
            BaseFont btnAuthor = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            Font fntAuthor = new Font(btnAuthor, 8, 2, Color.GRAY);
            prgAuthor.Alignment = Element.ALIGN_RIGHT;
            prgAuthor.Add(new Chunk("Order From : Foodie Fast Food", fntAuthor));
            prgAuthor.Add(new Chunk("\nOrder Date : " + dtblTable.Rows[0]["OrderDate"].ToString(), fntAuthor));
            document.Add(prgAuthor);

            Paragraph p = new Paragraph(new Chunk(new iTextSharp.text.pdf.draw.LineSeparator(0.0F, 100.0F, Color.BLACK, Element.ALIGN_LEFT, 1)));
            document.Add(p);

            document.Add(new Chunk("\n", fntHead));

            PdfPTable table = new PdfPTable(dtblTable.Columns.Count - 2);

            BaseFont btnColumnHeader = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            Font fntColumnHeader = new Font(btnColumnHeader, 9, 1, Color.WHITE);
            for (int i = 0; i < dtblTable.Columns.Count - 2; i++)
            {
                PdfPCell cell = new PdfPCell();
                cell.BackgroundColor = Color.GRAY;
                cell.AddElement(new Chunk(dtblTable.Columns[i].ColumnName.ToUpper(), fntColumnHeader));
                table.AddCell(cell);
            }
            Font fntColumnData = new Font(btnColumnHeader, 8, 1, Color.BLACK);
            for (int i = 0; i < dtblTable.Rows.Count; i++)
            {
                for (int j = 0; j < dtblTable.Columns.Count - 2; j++)
                {
                    PdfPCell cell = new PdfPCell();
                    cell.AddElement(new Chunk(dtblTable.Rows[i][j].ToString(), fntColumnData));
                    table.AddCell(cell);
                }
            }

            document.Add(table);
            document.Close();
            writer.Close();
            fs.Close();
        }

        private DataTable ConvertToDataTable(List<OrdersD> orders)
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("OrderDetailsId", typeof(int));
            dt.Columns.Add("OrderNo", typeof(string));
            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Price", typeof(decimal));
            dt.Columns.Add("Quantity", typeof(int));
            dt.Columns.Add("TotalPrice", typeof(decimal));
            dt.Columns.Add("OrderDate", typeof(DateTime));
            dt.Columns.Add("status", typeof(string));

            foreach (var order in orders)
            {
                dt.Rows.Add(order.OrderDetailsId,order.OrderNo, order.ProductName, order.TotalPrice, order.Quantity, order.TotalPrice, order.OrderDate); 
            }
            DataRow dr = dt.NewRow();
            dr["TotalPrice"] = Session["grandTotalPrice"];
            dt.Rows.Add(dr);

            return dt;
        }
        protected void lbReturnMenu_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}

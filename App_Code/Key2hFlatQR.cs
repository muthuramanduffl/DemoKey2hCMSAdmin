
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for key2hFlatQR
/// </summary>
public class key2hFlatQR
{
    public int ProjectID { get; set; }
    public int BlockID { get; set; }
    public int FlatID { get; set; }
    public int QFID { get; set; }
    public int QPID { get; set; }
    public string Title { get; set; }
    public string PDFName { get; set; }
    public string AddedBy { get; set; }
    public DateTime AddedDate { get; set; }
    public bool Status { get; set; }

    public string GetSqlConnection()
    {
        string connectionString = null;
        try
        {

            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Key2h"].ConnectionString;

        }
        catch (Exception ex)
        {
        }
        return connectionString;
    }

    public int AddFlatQualityReport(key2hFlatQR K2)
    {
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("AddFlatQP", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ProjectID", K2.ProjectID));
                command.Parameters.Add(new SqlParameter("@BlockId", K2.BlockID));
                command.Parameters.Add(new SqlParameter("@FlatID", K2.FlatID));
                command.Parameters.Add(new SqlParameter("@Title", K2.Title));
                command.Parameters.Add(new SqlParameter("@PDFName", K2.PDFName));
                command.Parameters.Add(new SqlParameter("@Status", K2.Status));
                command.Parameters.Add(new SqlParameter("@AddedBy", K2.AddedBy));
                command.Parameters.Add(new SqlParameter("@AddedDate", Utility.IndianTime));
                rowsAffected = command.ExecuteNonQuery();
            }
            cnn.Close();
        }
        catch (Exception ex)
        {
        }
        return rowsAffected;

    }


    public DataTable ViewAllQualityReportbyPIDBIDFID(int ProjectID,int BlockID,int FlatID)
    {
        string connectionString = GetSqlConnection();
        SqlConnection cnn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();

        try
        {
            using (SqlCommand command = new SqlCommand("ViewAllFlatQPbyPIDBIDFID", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ProjectID", ProjectID));
                command.Parameters.Add(new SqlParameter("@BlockId", BlockID));
                command.Parameters.Add(new SqlParameter("@FlatID", FlatID));
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {

        }
        return dt;
    }

    public int DeleteFlatQPbyQFID(int QRID,string AddedBy)
    {
        int rowaffected = 0;

        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("DeleteFlatQPbyQFID", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(command);
                command.Parameters.Add(new SqlParameter("@QFID", QRID));
                command.Parameters.Add(new SqlParameter("@AddedBy", AddedBy));
                rowaffected = command.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
        }

        return rowaffected;
    }


}

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Key2hQualityreport
/// </summary>
public class Key2hQualityreport
{
    public int ProjectID { get; set; }
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

    public int AddProjectQP(Key2hQualityreport K2)
    {
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("AddProjectQP", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ProjectID", K2.ProjectID));
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

    public int UpdateProjectQP(Key2hQualityreport K2)
    {
        string connectionString = GetSqlConnection();
        SqlConnection cnn = new SqlConnection(connectionString);
        int rowsAffected = 0;

        try
        {
            using (SqlCommand command = new SqlCommand("UpdateProjectQP", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@QPID", K2.QPID));
                command.Parameters.Add(new SqlParameter("@Title", K2.Title));
                command.Parameters.Add(new SqlParameter("@PDFName", K2.PDFName));
                SqlDataAdapter da = new SqlDataAdapter(command);
                rowsAffected = command.ExecuteNonQuery();
            }
            cnn.Close();
        }
        catch (Exception ex)
        {

        }

        return rowsAffected;
    }

    public DataTable ViewAllProjectQP()
    {
        string connectionString = GetSqlConnection();
        SqlConnection cnn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();

        try
        {
            using (SqlCommand command = new SqlCommand("ViewAllProjectQP", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
 

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {

        }

        return dt;
    }

    public DataTable ViewAllProjectQPbyProjectID(int ProjectID)
    {
        string connectionString = GetSqlConnection();
        SqlConnection cnn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();

        try
        {
            using (SqlCommand command = new SqlCommand("ViewAllProjectQPbyProjectID", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ProjectID", ProjectID));
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {

        }

        return dt;
    }

    public int DeleteProjectQPbyQFID(int QRID)
    {
        int rowaffected = 0;

        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("DeleteProjectQPbyQFID", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(command);
                command.Parameters.Add(new SqlParameter("@QFID", QRID));
                rowaffected = command.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
        }

        return rowaffected;
    }

    public int DeleteProjectQPbyProjectID(int ProjectID)
    {
        int rowaffected = 0;

        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("DeleteProjectQPbyProjectID", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ProjectID", ProjectID));
                rowaffected =command.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
        }

        return rowaffected;
    }


}
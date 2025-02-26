using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Key2hAmenities
/// </summary>
public class Key2hAmenities
{



    public int intAID { get; set; }
    public int intFlatID { get; set; }
    public int intBlockID { get; set; }
    public int intProjectID { get; set; }
    public string strTitle { get; set; }
    public string strimage { get; set; }
    public DateTime AddedDate { get; set; }
    public DateTime UpdatedDate { get; set; }
    public int AddedBy { get; set; }
    public int UpdatedBy { get; set; }
    public int intDisplayOrder { get; set; }




    #region GetSqlConnectionstring
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
    #endregion




    public int AddProjectAmenities(Key2hAmenities K2A)
    {
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("AddProjectAmenities", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ProjectID", K2A.intProjectID));
                command.Parameters.Add(new SqlParameter("@Title", K2A.strTitle));
                command.Parameters.Add(new SqlParameter("@Image", K2A.strimage));
                command.Parameters.Add(new SqlParameter("@DisplayOrder", K2A.intDisplayOrder));
                command.Parameters.Add(new SqlParameter("@AddedBy", K2A.AddedBy));
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


    public DataTable ViewAllAmenities(int ProjectID, string AddedBy)
    {
        string connectionString = GetSqlConnection();
        SqlConnection cnn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();

        try
        {
            using (SqlCommand command = new SqlCommand("ViewAllAmenities", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ProjectID", ProjectID));
                command.Parameters.Add(new SqlParameter("@AddedBy", AddedBy));
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {

        }
        return dt;
    }



    public DataTable ViewAllAmenitiesByFilter(string ProjectID,string AID,string AddedBy)
    {
        string connectionString = GetSqlConnection();
        SqlConnection cnn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();

        try
        {
            using (SqlCommand command = new SqlCommand("ViewAllAmenitiesByFilter", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ProjectID", string.IsNullOrWhiteSpace(ProjectID) ? (object)DBNull.Value : Convert.ToInt32(ProjectID)));
                command.Parameters.Add(new SqlParameter("@AID", string.IsNullOrWhiteSpace(AID) ? (object)DBNull.Value : Convert.ToInt32(AID)));
                command.Parameters.Add(new SqlParameter("@AddedBy", AddedBy));
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {

        }
        return dt;
    }

    public int DeleteProjectAmenities(int AID, string AddedBy)
    {
        int rowaffected = 0;

        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("DeleteProjectAmenities", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(command);
                command.Parameters.Add(new SqlParameter("@AID", AID));
                command.Parameters.Add(new SqlParameter("@AddedBy", AddedBy));
                rowaffected = command.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
        }

        return rowaffected;
    }
    
    public int DeleteAmenitiesByProjectID(int ProID, string AddedBy)
    {
        int rowaffected = 0;

        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("DeleteAmenitiesByProjectID", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(command);
                command.Parameters.Add(new SqlParameter("@ProjectID", ProID));
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
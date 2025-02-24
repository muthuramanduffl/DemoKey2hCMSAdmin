
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Security.Cryptography;

/// <summary>
/// Summary description for Key2hFlatFloorPlan
/// </summary>
public class Key2hFlatFloorPlan
{
    public int ProjectID { get; set; }
    public int BlockID { get; set; }
    public int FlatID { get; set; }


    public int FloorPlanID { get; set; }
    public string Title { get; set; }
    public string ImagePath { get; set; }
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

    public int AddflatFloorPlan(Key2hFlatFloorPlan K2)
    {
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("AddFlatFloorPlan", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ProjectID", K2.ProjectID));
                command.Parameters.Add(new SqlParameter("@BlockID", K2.BlockID));
                command.Parameters.Add(new SqlParameter("@FlatID", K2.FlatID));
                command.Parameters.Add(new SqlParameter("@Title", K2.Title));
                command.Parameters.Add(new SqlParameter("@ImagePath", K2.ImagePath));
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

    public int UpdateFlatFloorPlan(Key2hFlatFloorPlan K2)
    {
        string connectionString = GetSqlConnection();
        SqlConnection cnn = new SqlConnection(connectionString);
        int rowsAffected = 0;

        try
        {
            using (SqlCommand command = new SqlCommand("UpdateFlatFloorPlan", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@FlatFloorPlanID", K2.FloorPlanID));
                command.Parameters.Add(new SqlParameter("@ProjectID", K2.ProjectID));
                command.Parameters.Add(new SqlParameter("@BlockID", K2.BlockID));
                command.Parameters.Add(new SqlParameter("@FlatID", K2.FlatID));
                command.Parameters.Add(new SqlParameter("@Title", K2.Title));
                command.Parameters.Add(new SqlParameter("@ImagePath", K2.ImagePath));
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

    public DataTable ViewAllFlatFloorPlans()
    {
        string connectionString = GetSqlConnection();
        SqlConnection cnn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();

        try
        {
            using (SqlCommand command = new SqlCommand("ViewAllFlatFloorPlans", cnn))
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
    public DataTable ViewflatfloorplanByID(int flatID)
    {
        string connectionString = GetSqlConnection();
        SqlConnection cnn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();

        try
        {
            using (SqlCommand command = new SqlCommand("ViewflatfloorplanByID", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@FlatID", flatID));

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {

        }

        return dt;
    }

    public DataTable ViewflatFloorPlansbyFilter(string ProjectID, string BlockID ,string FlatID,string floorPlanID)
    {
        string connectionString = GetSqlConnection();
        SqlConnection cnn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();

        try
        {
            using (SqlCommand command = new SqlCommand("ViewflatFloorPlansbyFilter", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ProjectID", string.IsNullOrWhiteSpace(ProjectID) ? (object)DBNull.Value : Convert.ToInt32(ProjectID)));
                command.Parameters.Add(new SqlParameter("@BlockID", string.IsNullOrWhiteSpace(BlockID) ? (object)DBNull.Value : Convert.ToInt32(BlockID)));
                command.Parameters.Add(new SqlParameter("@FlatID", string.IsNullOrWhiteSpace(FlatID) ? (object)DBNull.Value : Convert.ToInt32(FlatID)));
                command.Parameters.Add(new SqlParameter("@FlatFloorPlanID", string.IsNullOrWhiteSpace(floorPlanID) ? (object)DBNull.Value : Convert.ToInt32(floorPlanID)));
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {

        }

        return dt;
    }

    public int DeleteFlatFloorPlanbyFloorPlanID(int FloorPlanID)
    {
        int rowaffected = 0;

        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("DeleteFlatFloorPlanbyFloorPlanID", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(command);
                command.Parameters.Add(new SqlParameter("@FlatFloorPlanID", FloorPlanID));
                rowaffected =command.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
        }

        return rowaffected;
    }

    public int DeleteflatFloorPlanbyFlatID(int flatid)
    {
        int rowaffected = 0;

        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("DeleteflatFloorPlanbyFlatID", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(command);
                command.Parameters.Add(new SqlParameter("@FlatID", flatid));
                rowaffected =command.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
        }

        return rowaffected;
    }


}

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Security.Cryptography;

/// <summary>
/// Summary description for Key2hBlockFloorPlan
/// </summary>
public class Key2hBlockFloorPlan
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

    public int AddBlockFloorPlan(Key2hBlockFloorPlan K2)
    {
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("AddBlockFloorPlan", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ProjectID", K2.ProjectID));
                command.Parameters.Add(new SqlParameter("@BlockID", K2.BlockID));
               
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

   
   

 
    public DataTable ViewBlockfloorplanByID(int BlockID)
    {
        string connectionString = GetSqlConnection();
        SqlConnection cnn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();

        try
        {
            using (SqlCommand command = new SqlCommand("ViewBlockfloorplanByID", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@BlockID", BlockID));

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {

        }

        return dt;
    }

    public DataTable ViewBlockPlansbyFilter(string ProjectID, string BlockID ,string floorPlanID)
    {
        string connectionString = GetSqlConnection();
        SqlConnection cnn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();

        try
        {
            using (SqlCommand command = new SqlCommand("ViewBlockPlansbyFilter", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ProjectID", string.IsNullOrWhiteSpace(ProjectID) ? (object)DBNull.Value : Convert.ToInt32(ProjectID)));
                command.Parameters.Add(new SqlParameter("@BlockID", string.IsNullOrWhiteSpace(BlockID) ? (object)DBNull.Value : Convert.ToInt32(BlockID)));
                command.Parameters.Add(new SqlParameter("@BlockFloorPlanID", string.IsNullOrWhiteSpace(floorPlanID) ? (object)DBNull.Value : Convert.ToInt32(floorPlanID)));
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {

        }

        return dt;
    }

    public int DeleteBlockFloorPlanbyBlockPlanID(int FloorPlanID)
    {
        int rowaffected = 0;

        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("DeleteBlockFloorPlanbyBlockPlanID", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(command);
                command.Parameters.Add(new SqlParameter("@BlockFloorPlanID", FloorPlanID));
                rowaffected =command.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
        }

        return rowaffected;
    }

    public int DeleteBlockFloorPlanbyBlockID(int BlockID)
    {
        int rowaffected = 0;

        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("DeleteBlockFloorPlanbyBlockID", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(command);
                command.Parameters.Add(new SqlParameter("@BlockID", BlockID));
                rowaffected =command.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
        }

        return rowaffected;
    }


}
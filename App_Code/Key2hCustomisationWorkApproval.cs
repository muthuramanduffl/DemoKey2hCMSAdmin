using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CustomisationWorkApproval
/// </summary>
public class Key2hCustomisationWorkApproval
{

    public int intCWAID { get; set; }
    public string strFlatID { get; set; }
    public string strCustomizationWork { get; set; }
    public string strCustomizationDetails { get; set; }
    public string strApprovalStatus { get; set; }
    public string strClientApprovalStatus { get; set; }
    public string strRemarks { get; set; }
    public string strAddedBy { get; set; }
    public string strAmount { get; set; }



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


    public int AddCustomisationWorkApproval(Key2hCustomisationWorkApproval CWA)
    {
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int ret = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("AddCustomisationWorkApproval", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@FlatID", CWA.strFlatID));
                command.Parameters.Add(new SqlParameter("@CustomizationWork", CWA.strCustomizationWork));
                command.Parameters.Add(new SqlParameter("@CustomizationDetails", CWA.strCustomizationDetails));
                command.Parameters.Add(new SqlParameter("@ApprovalStatus", CWA.strApprovalStatus));
                command.Parameters.Add(new SqlParameter("@Remarks", CWA.strRemarks));
                command.Parameters.Add(new SqlParameter("@Amount", CWA.strAmount));
                command.Parameters.Add(new SqlParameter("@ClientApprovedstatus", CWA.strClientApprovalStatus));
                command.Parameters.Add(new SqlParameter("@ApprovedBy", "Dashboard"));
                command.Parameters.Add(new SqlParameter("@AddedBy", CWA.strAddedBy));
                command.Parameters.Add(new SqlParameter("@AddedDate", Utility.IndianTime));
                SqlParameter outputIdParam = new SqlParameter("@CWAID", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output
                };
                command.Parameters.Add(outputIdParam);

                command.ExecuteNonQuery();
                ret = (int)outputIdParam.Value;
            }
            cnn.Close();
        }
        catch (Exception ex)
        {
        }
        return ret;

    }

    public int AddCustomisationWorkApprovalHistory(Key2hCustomisationWorkApproval CWA)
    {
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("addCustomisationWorkApprovalHistory", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@CWAID", CWA.intCWAID));
                command.Parameters.Add(new SqlParameter("@FlatID", CWA.strFlatID));
                command.Parameters.Add(new SqlParameter("@WorkTitle", CWA.strCustomizationWork));
                command.Parameters.Add(new SqlParameter("@Customizationwordetails", CWA.strCustomizationDetails));
                command.Parameters.Add(new SqlParameter("@Approvalstatus", CWA.strApprovalStatus));
                command.Parameters.Add(new SqlParameter("@ClientApprovedstatus", CWA.strClientApprovalStatus));
                command.Parameters.Add(new SqlParameter("@ApprovedBy", "Dashboard"));
                command.Parameters.Add(new SqlParameter("@Remarks", CWA.strRemarks));
                command.Parameters.Add(new SqlParameter("@Amount", CWA.strAmount));
                command.Parameters.Add(new SqlParameter("@HistoryDate", Utility.IndianTime));
                command.Parameters.Add(new SqlParameter("@AddedBy", CWA.strAddedBy));
                command.Parameters.Add(new SqlParameter("@UpdatedDate", Utility.IndianTime));
                rowsAffected = command.ExecuteNonQuery();
            }
            cnn.Close();
        }
        catch (Exception ex)
        {
        }
        return rowsAffected;

    }



    public int UpdateCustomisationWorkApproval(Key2hCustomisationWorkApproval CWA)
    {
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("UpdatedCustomisationWorkApproval", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@CWAID", CWA.intCWAID));
                command.Parameters.Add(new SqlParameter("@FlatID", CWA.strFlatID));
                command.Parameters.Add(new SqlParameter("@CustomizationWork", CWA.strCustomizationWork));
                command.Parameters.Add(new SqlParameter("@CustomizationDetails", CWA.strCustomizationDetails));
                command.Parameters.Add(new SqlParameter("@ApprovalStatus", CWA.strApprovalStatus));
                command.Parameters.Add(new SqlParameter("@Remarks", CWA.strRemarks));
                command.Parameters.Add(new SqlParameter("@Amount", CWA.strAmount));
                command.Parameters.Add(new SqlParameter("@ClientApprovedstatus", CWA.strClientApprovalStatus));
                command.Parameters.Add(new SqlParameter("@ApprovedBy", "Dashboard"));
                command.Parameters.Add(new SqlParameter("@UpdatedBy", CWA.strAddedBy));
                command.Parameters.Add(new SqlParameter("@UpdateDate", Utility.IndianTime));
                rowsAffected = command.ExecuteNonQuery();
            }
            cnn.Close();
        }
        catch (Exception ex)
        {
        }
        return rowsAffected;

    }




    public int CustomisationWorkApprovalAlreadyExist(string CWAID, string FlatID, string CustomizationWork, string AddedBy)
    {
        DataTable dt = new DataTable();
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int exists = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("CustomisationWorkApprovalAlreadyExist", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@CWAID", string.IsNullOrWhiteSpace(CWAID) ? (object)DBNull.Value : Convert.ToInt32(CWAID)));
                command.Parameters.Add(new SqlParameter("@FlatID ", FlatID));
                command.Parameters.Add(new SqlParameter("@CustomizationWork", CustomizationWork));
                command.Parameters.Add(new SqlParameter("@AddedBy", AddedBy));
                exists = Convert.ToInt32(command.ExecuteScalar());
            }
        }
        catch (Exception ex)
        {

        }
        return exists;
    }




    public DataTable ViewAllFlatCustomizationWorksApproval(string ProID, string BlockID, string FlatID, string CWAID, string AddedBy)
    {
        DataTable dt = new DataTable();

        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("ViewAllFlatCustomizationWorksApproval", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ProjectID", string.IsNullOrWhiteSpace(ProID) ? (object)DBNull.Value : Convert.ToInt32(ProID)));
                command.Parameters.Add(new SqlParameter("@FlatID", string.IsNullOrWhiteSpace(FlatID) ? (object)DBNull.Value : Convert.ToInt32(FlatID)));
                command.Parameters.Add(new SqlParameter("@BlockID", string.IsNullOrWhiteSpace(BlockID) ? (object)DBNull.Value : Convert.ToInt32(BlockID)));
                command.Parameters.Add(new SqlParameter("@CWAID", string.IsNullOrWhiteSpace(CWAID) ? (object)DBNull.Value : Convert.ToInt32(CWAID)));
                command.Parameters.Add(new SqlParameter("@AddedBy", string.IsNullOrWhiteSpace(AddedBy) ? (object)DBNull.Value : Convert.ToInt32(AddedBy)));
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
        }
        return dt;
    }



    public DataTable ViewAllCustomisationWorkApprovalByFlatIDandAddedBy(string FlatID, string AddedBy)
    {
        DataTable dt = new DataTable();
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);

        try
        {
            using (SqlCommand command = new SqlCommand("ViewAllCustomisationWorkApprovalByFlatIDandAddedBy", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@FlatID ", FlatID));
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




    public DataTable ViewCustomisationWorkApprovalBystatus(string FlatID, string AddedBy, string status)
    {
        DataTable dt = new DataTable();
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);

        try
        {
            using (SqlCommand command = new SqlCommand("ViewCustomisationWorkApprovalBystatus", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@FlatID ", FlatID));
                command.Parameters.Add(new SqlParameter("@ClientApprovedstatus ", status));
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


    public DataTable ViewCustomisationWorkApprovalAmount(string FlatID, string AddedBy, string status, string work)
    {
        DataTable dt = new DataTable();
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);

        try
        {
            using (SqlCommand command = new SqlCommand("ViewCustomisationWorkApprovalAmountByWorkTitle", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@FlatID ", FlatID));
                command.Parameters.Add(new SqlParameter("@ClientApprovedstatus ", status));
                command.Parameters.Add(new SqlParameter("@WorkTitle ", work));
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


    public DataTable ViewAllcustomerapprovalByID(int ID)
    {
        DataTable dt = new DataTable();
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);

        try
        {
            using (SqlCommand command = new SqlCommand("ViewAllcustomerapprovalByID", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ID", ID));
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {

        }
        return dt;
    }





    public int DeleteCustomisationWorkApprovalByCWAIDandaddedby(string CWIID, string AddedBy)
    {
        DataTable dt = new DataTable();
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int ret = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("DeleteCustomisationWorkApprovalByCWAIDandaddedby", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@CWAID", string.IsNullOrWhiteSpace(CWIID) ? (object)DBNull.Value : Convert.ToInt32(CWIID)));
                command.Parameters.Add(new SqlParameter("@AddedBy", AddedBy));
                ret = command.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {

        }
        return ret;
    }


    public bool existworkapprovalbyid(string ID, string AddedBy)
    {
        DataTable dt = new DataTable();
        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        bool exists =false;
        try
        {
            using (SqlCommand command = new SqlCommand("existworkapprovalbyid", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ID", string.IsNullOrWhiteSpace(ID) ? (object)DBNull.Value : Convert.ToInt32(ID)));
                command.Parameters.Add(new SqlParameter("@AddedBy", AddedBy));
                exists = Convert.ToBoolean(command.ExecuteScalar());
            }
        }
        catch (Exception ex)
        {

        }
        return exists;
    }

    public int DeleteAllCustomisationWorkApprovalByFlatIDAndAddedBy(int FlatID, string AddedBy)
    {


        string connetionString = null;
        SqlConnection cnn;
        connetionString = GetSqlConnection();
        cnn = new SqlConnection(connetionString);
        int rowsAffected = 0;
        try
        {
            using (SqlCommand command = new SqlCommand("DeleteAllCustomisationWorkApprovalByFlatIDAndAddedBy", cnn))
            {
                cnn.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@FlatID", FlatID));
                command.Parameters.Add(new SqlParameter("@AddedBy", AddedBy));
                rowsAffected = command.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
        }
        return rowsAffected;
    }


}
select * from 



sp_helptext AddFlatCustomerBookingDetails

  
CREATE Procedure [dbKey2h].[AddFlatCustomerBookingDetails]      
@CustomerID int, @ProjectID int, @BlockID int, @FlatID int, @ApplicantFirstName varchar(255),      
@ApplicantLastName varchar(255), @CoapplicantFirstName varchar(255), @CoapplicantLastName varchar(255),      
@Gender varchar(50), @EmailID varchar(255), @Mobilenumber1 varchar(20), @Mobilenumber2 varchar(20),      
@FatherorSpouseName varchar(255), @DoB datetime, @WhatsappNumber varchar(255), @Profession varchar(255),      
@CompanyName varchar(255), @Designation varchar(255), @CurrentAddress varchar(500), @PermanentAddress varchar(500),      
@ResidentialStatus varchar(50), @CoapplicantRelationship varchar(255), @CityID int, @StateID int, @Pincode int,      
@Reference1 varchar(255), @Reference2 varchar(255), @LeadSource int, @LoanTakenStatus Bit, @BankName nvarchar(255),      
@ApplicantPhoto nvarchar(500), @ApplicantPAN nvarchar(50), @ApplicantAadhar nvarchar(50), @CoApplicantPhoto nvarchar(500),      
@CoApplicantPAN nvarchar(50), @CoApplicantAadhar nvarchar(50), @PoAName varchar(255), @PoAAddress varchar(500),      
@PoAPAN varchar(50), @PoAAdhar varchar(50), @PoADOB datetime, @CoDOB Datetime, @CRMID int, @CustomerLoginStatus Bit,      
@BookingDate Datetime, @Amountpaid int, @PaymentMode Int, @Bookingknowledgement nvarchar(255), @CarparkAllocated bit,      
@NumberofSlots int, @Allottedcarparkslotnumber nvarchar(255), @Registrationcharges int, @RegistrationDate Datetime,      
@RegistrationOffice nvarchar(225), @ReferedBy nvarchar(80), @CoaGender varchar(50), @CoaEmailID varchar(255),      
@CoaMobilenumber1 Varchar(20), @CoaMobilenumber2 Varchar(20), @CoaWhatsappNumber Varchar(20), @CoaAddress varchar(500),      
@CoaResidentialStatus varchar(50), @CoaStateID int, @CoaCityID int, @CoaPinCode int, @Addeddate Datetime,      
@Addedby varchar(50), @FlatName varchar(256),@FlatLoginCode nvarchar(256)    
AS      
BEGIN      
    Insert into tblFlatCustomerBookingDetails(CustomerID, ProjectID, BlockID, FlatID, ApplicantFirstName,      
    ApplicantLastName, CoapplicantFirstName, CoapplicantLastName, Gender, EmailID, Mobilenumber1, Mobilenumber2,      
    FatherorSpouseName, DoB, WhatsappNumber, Profession, CompanyName, Designation, CurrentAddress, PermanentAddress,      
    ResidentialStatus, CoapplicantRelationship, CityID, StateID, Pincode, Reference1, Reference2, LeadSource,      
    LoanTakenStatus, BankName, ApplicantPhoto, ApplicantPAN, ApplicantAadhar, CoApplicantPhoto, CoApplicantPAN,      
    CoApplicantAadhar, PoAName, PoAAddress, PoAPAN, PoAAdhar, PoADOB, CRMID, CustomerLoginStatus, BookingDate,      
    Amountpaid, PaymentMode, Bookingknowledgement, CarparkAllocated, NumberofSlots, Allottedcarparkslotnumber,      
    Registrationcharges, RegistrationDate, RegistrationOffice, ReferedBy, CoaGender, CoaEmailID, CoaMobilenumber1,      
    CoaMobilenumber2, CoaWhatsappNumber, CoaAddress, CoaResidentialStatus, CoaStateID, CoaCityID, CoaPinCode,      
    CoDOB, Addeddate, Addedby)      
    Values(@CustomerID, @ProjectID, @BlockID, @FlatID, @ApplicantFirstName, @ApplicantLastName,      
    @CoapplicantFirstName, @CoapplicantLastName, @Gender, @EmailID, @Mobilenumber1, @Mobilenumber2,      
    @FatherorSpouseName, @DoB, @WhatsappNumber, @Profession, @CompanyName, @Designation, @CurrentAddress,      
    @PermanentAddress, @ResidentialStatus, @CoapplicantRelationship, @CityID, @StateID, @Pincode, @Reference1,      
    @Reference2, @LeadSource, @LoanTakenStatus, @BankName, @ApplicantPhoto, @ApplicantPAN, @ApplicantAadhar,      
    @CoApplicantPhoto, @CoApplicantPAN, @CoApplicantAadhar, @PoAName, @PoAAddress, @PoAPAN, @PoAAdhar, @PoADOB,      
    @CRMID, @CustomerLoginStatus, @BookingDate, @Amountpaid, @PaymentMode, @Bookingknowledgement, @CarparkAllocated,      
    @NumberofSlots, @Allottedcarparkslotnumber, @Registrationcharges, @RegistrationDate, @RegistrationOffice,      
    @ReferedBy, @CoaGender, @CoaEmailID, @CoaMobilenumber1, @CoaMobilenumber2, @CoaWhatsappNumber, @CoaAddress,      
    @CoaResidentialStatus, @CoaStateID, @CoaCityID, @CoaPinCode, @CoDOB, @Addeddate, @Addedby);      
    
    Update tblFlatCustomerBookingDetails      
    Set FlatLoginID = @FlatLoginCode + @FlatName    
    Where FlatID = @FlatID;      
END 


select * from tblFlatCustomerBookingDetails



sp_helptext ViewAllFlatCustomizationWorks




      
Alter PROCEDURE [dbKey2h].[ViewAllFlatCustomizationWorksApproval]    
    @ProjectID NVARCHAR(50) = NULL,           
    @FlatID NVARCHAR(50) = NULL,                    
    @BlockID NVARCHAR(50) = NULL,              
    @CWAID NVARCHAR(50) = NULL,    
    @AddedBy nvarchar(50)=null    
AS      
BEGIN      
    WITH RankedDemands AS (      
        SELECT       
            r.FlatID,    
            r.CustomizationWork,    
            r.ApprovalStatus,    
            r.Amount,    
            b.ProjectID,       
            b.BlockID,       
            r.CWAID,      
            r.AddedBy,  
           
   r.AddedDate,  
            b.ApplicantFirstName,  -- Include this column in the CTE    
            ROW_NUMBER() OVER (PARTITION BY r.FlatID, b.ProjectID, b.BlockID ORDER BY r.CWAID) AS RowNum      
        FROM tblCustomisationWorkApproval r    
        LEFT JOIN tblFlatCustomerBookingDetails b    
            ON r.FlatID = b.FlatID    
        WHERE       
            (@ProjectID IS NULL OR @ProjectID = '' OR b.ProjectID = @ProjectID) AND      
            (@FlatID IS NULL OR @FlatID = '' OR r.FlatID = @FlatID) AND      
            (@CWAID IS NULL OR @CWAID = '' OR r.CWAID = @CWAID) AND      
            (@AddedBy IS NULL OR @AddedBy = '' OR r.AddedBy = @AddedBy) AND      
            (@BlockID IS NULL OR @BlockID = '' OR b.BlockID = @BlockID)      
    )      
    SELECT     
    CWAID,    
        FlatID,     
        ProjectID,     
        BlockID,  
        
        CustomizationWork,    
        ApprovalStatus,    
        Amount,    
        AddedBy,   
  AddedDate,  
        ApplicantFirstName    
    FROM RankedDemands    
    WHERE RowNum = 1 order by AddedDate Desc,CWAID Desc;  -- Fetch only the first record      
END;


exec ViewAllFlatCustomizationWorksApproval


select * from tblCustomisationWorkApproval
select * from tblFlatCustomerBookingDetails

delete tblCustomisationWorkApproval where flatID='2'




sp_helptext ViewAllProjectQP


CREATE PROCEDURE [dbKey2h].[ViewAllProjectQP]  
AS  
BEGIN  
    SET NOCOUNT ON;  
  
    WITH CTE_FloorPlans AS  
    (  
        SELECT   
            *,  
            ROW_NUMBER() OVER (PARTITION BY ProjectID ORDER BY AddedDate DESC) AS RowNum  
        FROM tblProjectQualityReports  
    )  
    SELECT *  
    FROM CTE_FloorPlans  
    WHERE RowNum = 1  
    ORDER BY AddedDate DESC;  
END  


sp_help tblProjectQualityReports



sp_helptext DeleteProjectQPbyQFID


CREATE procedure DeleteProjectQPbyQFID    
@QFID int     
As    
Begin      
delete tblProjectQualityReports where QPID=@QFID     
End 




sp_helptext ViewAllFlatQualityReports


CREATE PROCEDURE ViewAllFlatQualityReports   
    @ProjectID INT = NULL,    
    @FlatID INT = NULL ,  
    @BlockID Int,  
    @QFID Int  
AS    
BEGIN    
    SET NOCOUNT ON;          
      
    -- Declare variables for dynamic SQL    
    DECLARE @SQL NVARCHAR(MAX);          
    DECLARE @ParameterDef NVARCHAR(MAX);          
      
    -- Define the parameter definition    
    SET @ParameterDef = '@ProjectID INT, @FlatID INT, @BlockID Int,@QFID Int';          
      
    -- Base query (always returns records if no filters are provided)    
    SET @SQL = '  
    WITH CTE AS (  
        SELECT   
            *,   
            ROW_NUMBER() OVER (PARTITION BY FlatID ORDER BY QFID) AS RowNum  
        FROM tblFlatQualityReports  
    )  
    SELECT *  
    FROM CTE  
    WHERE RowNum = 1';  -- Base condition to ensure only one row per FlatID  
          
    -- Add filters dynamically based on the presence of parameters    
    IF (@ProjectID IS NOT NULL and @ProjectID <>'')          
    BEGIN          
        SET @SQL = @SQL + ' AND ProjectID = @ProjectID';          
    END;          
          
    IF (@FlatID IS NOT NULL  and @FlatID <>'')          
    BEGIN          
        SET @SQL = @SQL + ' AND FlatID = @FlatID';          
    END;          
          
           IF (@BlockID IS NOT NULL and @BlockID<> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND BlockID = @BlockID';          
    END    
      IF (@QFID IS NOT NULL and   @QFID<> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND QFID = @QFID';          
    END    
  
  
    -- Add an ORDER BY clause    
    SET @SQL = @SQL + ' ORDER BY AddedDate DESC';          
          
    -- Execute the dynamic SQL query    
    EXEC sp_executesql @SQL,         
        @ParameterDef,         
        @ProjectID = @ProjectID,         
        @FlatID = @FlatID,  
        @QFID=@QFID,  
        @BlockID= @BlockID;   
END;  


exec ViewAllFlatQualityReports  

 @ProjectID  = NULL,    
    @FlatID  = '' ,  
    @BlockID ='',  
    @QFID =null


    select * from tblFlatQualityReports
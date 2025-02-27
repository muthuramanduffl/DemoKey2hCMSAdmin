


Create Procedure AddProjectAmenities  
@ProjectID int,  
@Title nvarchar(50),  
@Image nvarchar(200),  
@DisplayOrder int,  
@AddedDate Datetime,  
@AddedBy nvarchar(256)  
As  
Begin  
insert into  tblProjectAmenities (ProjectID,Title,Image,DisplayOrder,AddedDate,AddedBy) Values(@ProjectID,@Title,@Image,@DisplayOrder,@AddedDate,@AddedBy)  
End






Alter PROCEDURE ViewAllAmenitiesByFilter   
    @ProjectID INT = NULL, 
    @AID Int ,
    @AddedBy nvarchar(60)
AS    
BEGIN    
    SET NOCOUNT ON;          
        
    DECLARE @SQL NVARCHAR(MAX);          
    DECLARE @ParameterDef NVARCHAR(MAX);          
         
    SET @ParameterDef = '@ProjectID INT,@AID Int,@AddedBy nvarchar(60)';          
       
    SET @SQL = '  
    WITH CTE AS (  
        SELECT   
            *,   
            ROW_NUMBER() OVER (PARTITION BY ProjectID ORDER BY AID) AS RowNum  
        FROM tblProjectAmenities  
    )  
    SELECT *  
    FROM CTE  
    WHERE RowNum = 1';   
             
    IF (@ProjectID IS NOT NULL and @ProjectID <>'')          
    BEGIN          
        SET @SQL = @SQL + ' AND ProjectID = @ProjectID';          
    END;                   
      IF (@AID IS NOT NULL and   @AID<> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND AID = @AID';          
    END   
    IF (@AddedBy IS NOT NULL and   @AddedBy<> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND AddedBy = @AddedBy';          
    END         
    SET @SQL = @SQL + ' ORDER BY AddedDate DESC';          
    EXEC sp_executesql @SQL,         
        @ParameterDef,         
        @ProjectID = @ProjectID,  
        @AddedBy=@AddedBy,
        @AID=@AID;  
END;  


Exec ViewAllAmenitiesByFilter
@ProjectID='',
@AID='',
@AddedBy=''



select * from tblProjectAmenities

Alter Procedure DeleteAmenitiesByProjectID
@ProjectID int ,
@AddedBy nvarchar(60)
As
Begin
Delete tblProjectAmenities where ProjectID=@ProjectID and AddedBy=@AddedBy
End



sp_helptext AddCustomersBasicDetails

Create Procedure AddCustomersBasicDetails  
@Gender varchar(50),  
@EmailID Varchar(255),  
@Mobilenumber varchar(20),  
@WhatsappNumber varchar(20),  
@AddedBy  varchar(255),  
@AddedDate Datetime,  
@CustomerID INT OUTPUT  
as  
Begin  
Insert into tblCustomers (Gender,EmailID,Mobilenumber,WhatsappNumber,AddedBy,AddedDate) Values(@Gender,@EmailID,@Mobilenumber,@WhatsappNumber,@AddedBy,@AddedDate)  
SET @CustomerID = SCOPE_IDENTITY();  
End

select * from sys.tables
select * from tblProjects

sp_help tblProjects



Alter Procedure UpdateProjectCompletionStatus
@ProjectID Int,
@ProjectStatusPercentage int,
@AddedBy nvarchar(60),
@UpdatedDate datetime
As
Begin
Update tblProjects set  ProjectStatusPercentage=@ProjectStatusPercentage,UpdatedBy=@AddedBy,UpdatedDate=@UpdatedDate where ProjectID=@ProjectID and AddedBy=@AddedBy
END




sp_helptext ViewAllProjects



CREATE PROCEDURE ViewAllProjects            
    @ProjectID NVARCHAR(50) = NULL,  -- Changed to NVARCHAR to accept empty strings          
    @Status NVARCHAR(50) = NULL,          
    @Projectstatus INT = NULL          
AS          
BEGIN            
    SET NOCOUNT ON;            
            
    -- Convert empty strings to NULL    
    SET @ProjectID = CASE WHEN ISNULL(@ProjectID, '') = '' THEN NULL ELSE @ProjectID END;    
    SET @Status = CASE WHEN ISNULL(@Status, '') = '' THEN NULL ELSE @Status END;    
            
    -- Declare variables for dynamic SQL      
    DECLARE @SQL NVARCHAR(MAX);            
    DECLARE @ParameterDef NVARCHAR(MAX);            
            
    -- Define the parameter definition      
    SET @ParameterDef = '@ProjectID INT, @Status BIT, @Projectstatus INT';            
            
    -- Base query (always returns records if no parameters are provided)      
    SET @SQL = 'SELECT tp.*,TPS.BHK,TPS.SquareFeet FROM tblProjects tp inner join tblProjectHomeScreen TPS on tp.ProjectID=TPS.ProjectID    WHERE 1 = 1';            
            
    -- Add filters dynamically based on the presence of parameters      
    IF (@ProjectID IS NOT NULL)            
    BEGIN            
        SET @SQL = @SQL + ' AND ProjectID = @ProjectID';            
    END            
            
    IF (@Status IS NOT NULL)            
    BEGIN            
        SET @SQL = @SQL + ' AND ProjectDisplayStatus = @Status';            
    END            
            
    IF (@Projectstatus IS NOT NULL)            
    BEGIN            
        SET @SQL = @SQL + ' AND ProjectStatus = @Projectstatus';            
    END            
            
    -- Add an ORDER BY clause      
    SET @SQL = @SQL + ' ORDER BY AddedDate DESC';            
            
    -- Execute the dynamic SQL query      
    EXEC sp_executesql @SQL,           
        @ParameterDef,           
        @ProjectID = @ProjectID,           
        @Status = @Status,           
        @Projectstatus = @Projectstatus;            
END; 





select * from tblProjects
select * from tblProjectHomeScreen


sp_help tblProjectHomeScreen

delete tblProjectHomeScreen where PHID in ('5')







Alter procedure ViewAllProjectHomeScreenByFilter
@PHID int,
@ProjectID int,
@AddedBy nvarchar(60)
As
Begin
SET NOCOUNT ON;            
            
   
    -- Declare variables for dynamic SQL      
    DECLARE @SQL NVARCHAR(MAX);            
    DECLARE @ParameterDef NVARCHAR(MAX);            
            
    -- Define the parameter definition      
    SET @ParameterDef = '@ProjectID INT, @AddedBy nvarchar(60), @PHID INT';            
                
    SET @SQL = 'Select * from tblProjectHomeScreen WHERE 1 = 1';            
             
    IF (@ProjectID IS NOT NULL and @ProjectID <> '')            
    BEGIN            
        SET @SQL = @SQL + ' AND ProjectID = @ProjectID';            
    END            
           IF (@PHID IS NOT NULL and @PHID <> '')            
    BEGIN            
        SET @SQL = @SQL + ' AND PHID = @PHID';            
    END            
            
           
            
    IF (@AddedBy IS NOT NULL And @AddedBy <> '')            
    BEGIN            
        SET @SQL = @SQL + ' AND AddedBy = @AddedBy';            
    END            
            
    -- Add an ORDER BY clause      
    SET @SQL = @SQL + ' ORDER BY AddedDate DESC';            
            
    -- Execute the dynamic SQL query      
    EXEC sp_executesql @SQL,           
        @ParameterDef,           
        @ProjectID = @ProjectID,           
        @PHID = @PHID,           
        @AddedBy = @AddedBy;   
        END



exec ViewAllProjectHomeScreenByFilter
        @ProjectID ='3',           
        @PHID = '6',           
        @AddedBy = '1';


        Alter table tblProjectHomeScreen add Splacescreen nvarchar(512),Logo nvarchar(512) 








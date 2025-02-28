





sp_help tblProjectHomeScreen



Alter Procedure UpdateProjectHomeScreenByProjectID
@ProjectID int,
@HighlightImage1 nvarchar(512),
@HighlightImage2 nvarchar(512),
@HighlightImage3 nvarchar(512),
@HighlightImage4 nvarchar(512),
@HighlightImage5 nvarchar(512),
@Splacescreen nvarchar(512),
@Logo nvarchar(512),
@UpdatedDate Datetime,
@UpdatedBy nvarchar(60)
As
Begin
Update tblProjectHomeScreen set HighlightImage1=@HighlightImage1,HighlightImage2=@HighlightImage2,HighlightImage3=@HighlightImage3,HighlightImage4=@HighlightImage4,HighlightImage5=@HighlightImage5,Logo=@Logo,Splacescreen=@Splacescreen,UpdatedDate=@UpdatedDate,UpdatedBy=@UpdatedBy where ProjectID=@ProjectID
ENd


select * from sys.tables





sp_helptext ViewAllProjectHomeScreenByFilter


CREATE procedure ViewAllProjectHomeScreenByFilter  
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


select * from sys.tables



sp_helptext UpdateProjectBlock



select * from tblflat
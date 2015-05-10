USE [RealEstate]
GO
/****** Object:  StoredProcedure [dbo].[Advertise_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:13 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Advertise_Delete]
	@AdvID int
As
	Delete [Advertise] 
	Where  ([AdvID]= @AdvID)
GO
/****** Object:  StoredProcedure [dbo].[Advertise_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:13 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Advertise_Insert]
	@AdvID int,
	@AdvName nvarchar(300),
	@Image nvarchar(510),
	@Width int,
	@Height int,
	@Link nvarchar(510),
	@Target varchar(10),
	@Content ntext,
	@Position smallint,
	@PageID int,
	@Click int,
	@Ord int,
	@Active bit,
	@Lang varchar(5)
As
	Insert Into [Advertise]
	(
		[AdvID],
		[AdvName],
		[Image],
		[Width],
		[Height],
		[Link],
		[Target],
		[Content],
		[Position],
		[PageID],
		[Click],
		[Ord],
		[Active],
		[Lang]
	)
	Values
	(
		@AdvID,
		@AdvName,
		@Image,
		@Width,
		@Height,
		@Link,
		@Target,
		@Content,
		@Position,
		@PageID,
		@Click,
		@Ord,
		@Active,
		@Lang
	)

GO
/****** Object:  StoredProcedure [dbo].[Advertise_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:13 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Advertise_SelectAll]
As
	Select * From [Advertise]
GO
/****** Object:  StoredProcedure [dbo].[Advertise_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:13 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Advertise_SelectByID]
	@AdvID int
As
	Select *  From [Advertise]
 	Where  ([AdvID] = @AdvID)
GO
/****** Object:  StoredProcedure [dbo].[Advertise_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:13 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Advertise_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [AdvID]) As RowNum,*
		From [Advertise]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Advertise_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:13 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Advertise_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Advertise]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Advertise]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Advertise_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:13 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Advertise_TestByID]
	@AdvID int,
	@TestID Bit Output
As
	Select [AdvID] From [Advertise]
 	Where  ([AdvID] = @AdvID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Advertise_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:13 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Advertise_Update]
	@AdvID int,
	@AdvName nvarchar(300),
	@Image nvarchar(510),
	@Width int,
	@Height int,
	@Link nvarchar(510),
	@Target varchar(10),
	@Content ntext,
	@Position smallint,
	@PageID int,
	@Click int,
	@Ord int,
	@Active bit,
	@Lang varchar(5)
As
	Update [Advertise]  Set
		[AdvName] = @AdvName,
		[Image] = @Image,
		[Width] = @Width,
		[Height] = @Height,
		[Link] = @Link,
		[Target] = @Target,
		[Content] = @Content,
		[Position] = @Position,
		[PageID] = @PageID,
		[Click] = @Click,
		[Ord] = @Ord,
		[Active] = @Active,
		[Lang] = @Lang
	Where ([AdvID] = @AdvID)
GO
/****** Object:  StoredProcedure [dbo].[Apartment_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Apartment_Delete]
	@ApartmentID int
As
	Delete [Apartment] 
	Where  ([ApartmentID]= @ApartmentID)
GO
/****** Object:  StoredProcedure [dbo].[Apartment_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Apartment_Insert]
	@RealEstateOwnersID int,
	@RealEstateOwnersTypeID int,
	@RealEstateID int,
	@Description nvarchar(500),
	@Address nvarchar(500),
	@Price float,
	@TotalArea float,
	@FloorArea float,
	@GargenArea float,
	@HomeArea float,
	@RoomNumber tinyint,
	@TierNumber tinyint,
	@Image1 nvarchar(500),
	@Image2 nvarchar(500),
	@Image3 nvarchar(500)
As
	Insert Into [Apartment]
	(
		[RealEstateOwnersID],
		[RealEstateOwnersTypeID],
		[RealEstateID],
		[Description],
		[Address],
		[Price],
		[TotalArea],
		[FloorArea],
		[GargenArea],
		[HomeArea],
		[RoomNumber],
		[TierNumber],
		[Image1],
		[Image2],
		[Image3]
	)
	Values
	(
		@RealEstateOwnersID,
		@RealEstateOwnersTypeID,
		@RealEstateID,
		@Description,
		@Address,
		@Price,
		@TotalArea,
		@FloorArea,
		@GargenArea,
		@HomeArea,
		@RoomNumber,
		@TierNumber,
		@Image1,
		@Image2,
		@Image3
	)

GO
/****** Object:  StoredProcedure [dbo].[Apartment_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Apartment_SelectAll]
As
	Select * From [Apartment]
GO
/****** Object:  StoredProcedure [dbo].[Apartment_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Apartment_SelectByID]
	@ApartmentID int
As
	Select *  From [Apartment]
 	Where  ([ApartmentID] = @ApartmentID)
GO
/****** Object:  StoredProcedure [dbo].[Apartment_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Apartment_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [ApartmentID]) As RowNum,*
		From [Apartment]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Apartment_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Apartment_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Apartment]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Apartment]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Apartment_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Apartment_TestByID]
	@ApartmentID int,
	@TestID Bit Output
As
	Select [ApartmentID] From [Apartment]
 	Where  ([ApartmentID] = @ApartmentID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Apartment_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Apartment_Update]
	@ApartmentID int,
	@RealEstateOwnersID int,
	@RealEstateOwnersTypeID int,
	@RealEstateID int,
	@Description nvarchar(500),
	@Address nvarchar(500),
	@Price float,
	@TotalArea float,
	@FloorArea float,
	@GargenArea float,
	@HomeArea float,
	@RoomNumber tinyint,
	@TierNumber tinyint,
	@Image1 nvarchar(500),
	@Image2 nvarchar(500),
	@Image3 nvarchar(500)
As
	Update [Apartment]  Set
		[RealEstateOwnersID] = @RealEstateOwnersID,
		[RealEstateOwnersTypeID] = @RealEstateOwnersTypeID,
		[RealEstateID] = @RealEstateID,
		[Description] = @Description,
		[Address] = @Address,
		[Price] = @Price,
		[TotalArea] = @TotalArea,
		[FloorArea] = @FloorArea,
		[GargenArea] = @GargenArea,
		[HomeArea] = @HomeArea,
		[RoomNumber] = @RoomNumber,
		[TierNumber] = @TierNumber,
		[Image1] = @Image1,
		[Image2] = @Image2,
		[Image3] = @Image3
	Where ([ApartmentID] = @ApartmentID)
GO
/****** Object:  StoredProcedure [dbo].[Banner_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:34 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Banner_Delete]
	@BannerID int
As
	Delete [Banner] 
	Where  ([BannerID]= @BannerID)
GO
/****** Object:  StoredProcedure [dbo].[Banner_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:34 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Banner_Insert]
	@BannerType nvarchar(100),
	@Size nchar(30),
	@Description nvarchar(500),
	@Images nvarchar(500)
As
	Insert Into [Banner]
	(
		[BannerType],
		[Size],
		[Description],
		[Images]
	)
	Values
	(
		@BannerType,
		@Size,
		@Description,
		@Images
	)

GO
/****** Object:  StoredProcedure [dbo].[Banner_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:34 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Banner_SelectAll]
As
	Select * From [Banner]
GO
/****** Object:  StoredProcedure [dbo].[Banner_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:34 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Banner_SelectByID]
	@BannerID int
As
	Select *  From [Banner]
 	Where  ([BannerID] = @BannerID)
GO
/****** Object:  StoredProcedure [dbo].[Banner_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:34 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Banner_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [BannerID]) As RowNum,*
		From [Banner]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Banner_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:34 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Banner_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Banner]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Banner]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Banner_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:34 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Banner_TestByID]
	@BannerID int,
	@TestID Bit Output
As
	Select [BannerID] From [Banner]
 	Where  ([BannerID] = @BannerID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Banner_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:34 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Banner_Update]
	@BannerID int,
	@BannerType nvarchar(100),
	@Size nchar(30),
	@Description nvarchar(500),
	@Images nvarchar(500)
As
	Update [Banner]  Set
		[BannerType] = @BannerType,
		[Size] = @Size,
		[Description] = @Description,
		[Images] = @Images
	Where ([BannerID] = @BannerID)
GO
/****** Object:  StoredProcedure [dbo].[Categorys_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:21 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Categorys_Delete]
	@CategoryID int
As
	Delete [Categorys] 
	Where  ([CategoryID]= @CategoryID)
GO
/****** Object:  StoredProcedure [dbo].[Categorys_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:21 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Categorys_Insert]
	@Tag nvarchar(510),
	@Name nvarchar(510),
	@Content ntext,
	@Level nvarchar(200),
	@Priority smallint,
	@Index smallint,
	@Title nvarchar(510),
	@Description nvarchar(1000),
	@Keyword nvarchar(510),
	@Active int,
	@Ord int,
	@Lang varchar(5),
	@Image nvarchar(510),
	@Image2 nvarchar(510)
As
	Insert Into [Categorys]
	(
		[Tag],
		[Name],
		[Content],
		[Level],
		[Priority],
		[Index],
		[Title],
		[Description],
		[Keyword],
		[Active],
		[Ord],
		[Lang],
		[Image],
		[Image2]
	)
	Values
	(
		@Tag,
		@Name,
		@Content,
		@Level,
		@Priority,
		@Index,
		@Title,
		@Description,
		@Keyword,
		@Active,
		@Ord,
		@Lang,
		@Image,
		@Image2
	)

GO
/****** Object:  StoredProcedure [dbo].[Categorys_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:21 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Categorys_SelectAll]
As
	Select * From [Categorys]
GO
/****** Object:  StoredProcedure [dbo].[Categorys_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:21 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Categorys_SelectByID]
	@CategoryID int
As
	Select *  From [Categorys]
 	Where  ([CategoryID] = @CategoryID)
GO
/****** Object:  StoredProcedure [dbo].[Categorys_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:21 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Categorys_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [CategoryID]) As RowNum,*
		From [Categorys]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Categorys_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:21 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Categorys_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Categorys]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Categorys]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Categorys_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:21 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Categorys_TestByID]
	@CategoryID int,
	@TestID Bit Output
As
	Select [CategoryID] From [Categorys]
 	Where  ([CategoryID] = @CategoryID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Categorys_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:21 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Categorys_Update]
	@CategoryID int,
	@Tag nvarchar(510),
	@Name nvarchar(510),
	@Content ntext,
	@Level nvarchar(200),
	@Priority smallint,
	@Index smallint,
	@Title nvarchar(510),
	@Description nvarchar(1000),
	@Keyword nvarchar(510),
	@Active int,
	@Ord int,
	@Lang varchar(5),
	@Image nvarchar(510),
	@Image2 nvarchar(510)
As
	Update [Categorys]  Set
		[Tag] = @Tag,
		[Name] = @Name,
		[Content] = @Content,
		[Level] = @Level,
		[Priority] = @Priority,
		[Index] = @Index,
		[Title] = @Title,
		[Description] = @Description,
		[Keyword] = @Keyword,
		[Active] = @Active,
		[Ord] = @Ord,
		[Lang] = @Lang,
		[Image] = @Image,
		[Image2] = @Image2
	Where ([CategoryID] = @CategoryID)
GO
/****** Object:  StoredProcedure [dbo].[City_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[City_Delete]
	@CityID int
As
	Delete [City] 
	Where  ([CityID]= @CityID)
GO
/****** Object:  StoredProcedure [dbo].[City_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[City_Insert]
	@CityID int,
	@CityName nvarchar(40)
As
	Insert Into [City]
	(
		[CityID],
		[CityName]
	)
	Values
	(
		@CityID,
		@CityName
	)

GO
/****** Object:  StoredProcedure [dbo].[City_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[City_SelectAll]
As
	Select * From [City]
GO
/****** Object:  StoredProcedure [dbo].[City_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[City_SelectByID]
	@CityID int
As
	Select *  From [City]
 	Where  ([CityID] = @CityID)
GO
/****** Object:  StoredProcedure [dbo].[City_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[City_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [CityID]) As RowNum,*
		From [City]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[City_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[City_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [City]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [City]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[City_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[City_TestByID]
	@CityID int,
	@TestID Bit Output
As
	Select [CityID] From [City]
 	Where  ([CityID] = @CityID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[City_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[City_Update]
	@CityID int,
	@CityName nvarchar(40)
As
	Update [City]  Set
		[CityName] = @CityName
	Where ([CityID] = @CityID)
GO
/****** Object:  StoredProcedure [dbo].[Companys_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:27 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Companys_Delete]
	@CompanyID int
As
	Delete [Companys] 
	Where  ([CompanyID]= @CompanyID)
GO
/****** Object:  StoredProcedure [dbo].[Companys_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:27 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Companys_Insert]
	@CompanyName nvarchar(200),
	@Address nvarchar(500),
	@HotLine nchar(30),
	@PhoneNumber nvarchar(30),
	@Fax nvarchar(30),
	@Email nvarchar(100),
	@Surrogate nvarchar(100),
	@Chevron nvarchar(100)
As
	Insert Into [Companys]
	(
		[CompanyName],
		[Address],
		[HotLine],
		[PhoneNumber],
		[Fax],
		[Email],
		[Surrogate],
		[Chevron]
	)
	Values
	(
		@CompanyName,
		@Address,
		@HotLine,
		@PhoneNumber,
		@Fax,
		@Email,
		@Surrogate,
		@Chevron
	)

GO
/****** Object:  StoredProcedure [dbo].[Companys_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:27 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Companys_SelectAll]
As
	Select * From [Companys]
GO
/****** Object:  StoredProcedure [dbo].[Companys_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:27 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Companys_SelectByID]
	@CompanyID int
As
	Select *  From [Companys]
 	Where  ([CompanyID] = @CompanyID)
GO
/****** Object:  StoredProcedure [dbo].[Companys_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:27 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Companys_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [CompanyID]) As RowNum,*
		From [Companys]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Companys_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:27 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Companys_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Companys]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Companys]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Companys_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:27 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Companys_TestByID]
	@CompanyID int,
	@TestID Bit Output
As
	Select [CompanyID] From [Companys]
 	Where  ([CompanyID] = @CompanyID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Companys_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:27 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Companys_Update]
	@CompanyID int,
	@CompanyName nvarchar(200),
	@Address nvarchar(500),
	@HotLine nchar(30),
	@PhoneNumber nvarchar(30),
	@Fax nvarchar(30),
	@Email nvarchar(100),
	@Surrogate nvarchar(100),
	@Chevron nvarchar(100)
As
	Update [Companys]  Set
		[CompanyName] = @CompanyName,
		[Address] = @Address,
		[HotLine] = @HotLine,
		[PhoneNumber] = @PhoneNumber,
		[Fax] = @Fax,
		[Email] = @Email,
		[Surrogate] = @Surrogate,
		[Chevron] = @Chevron
	Where ([CompanyID] = @CompanyID)
GO
/****** Object:  StoredProcedure [dbo].[Controls_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:26:11 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Controls_Delete]
	@ControlID int
As
	Delete [Controls] 
	Where  ([ControlID]= @ControlID)
GO
/****** Object:  StoredProcedure [dbo].[Controls_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:26:11 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Controls_Insert]
	@PageId int,
	@Name nvarchar(200),
	@Path nvarchar(500),
	@Param nvarchar(500),
	@Status bigint,
	@Priority int
As
	Insert Into [Controls]
	(
		[PageId],
		[Name],
		[Path],
		[Param],
		[Status],
		[Priority]
	)
	Values
	(
		@PageId,
		@Name,
		@Path,
		@Param,
		@Status,
		@Priority
	)

GO
/****** Object:  StoredProcedure [dbo].[Controls_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:26:11 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Controls_SelectAll]
As
	Select * From [Controls]
GO
/****** Object:  StoredProcedure [dbo].[Controls_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:26:11 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Controls_SelectByID]
	@ControlID int
As
	Select *  From [Controls]
 	Where  ([ControlID] = @ControlID)
GO
/****** Object:  StoredProcedure [dbo].[Controls_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:26:11 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Controls_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [ControlID]) As RowNum,*
		From [Controls]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Controls_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:26:11 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Controls_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Controls]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Controls]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Controls_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:26:11 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Controls_TestByID]
	@ControlID int,
	@TestID Bit Output
As
	Select [ControlID] From [Controls]
 	Where  ([ControlID] = @ControlID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Controls_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:26:11 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Controls_Update]
	@ControlID int,
	@PageId int,
	@Name nvarchar(200),
	@Path nvarchar(500),
	@Param nvarchar(500),
	@Status bigint,
	@Priority int
As
	Update [Controls]  Set
		[PageId] = @PageId,
		[Name] = @Name,
		[Path] = @Path,
		[Param] = @Param,
		[Status] = @Status,
		[Priority] = @Priority
	Where ([ControlID] = @ControlID)
GO
/****** Object:  StoredProcedure [dbo].[Customers_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:19 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Customers_Delete]
	@CustomerID int
As
	Delete [Customers] 
	Where  ([CustomerID]= @CustomerID)
GO
/****** Object:  StoredProcedure [dbo].[Customers_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:19 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Customers_Insert]
	@CustomerID int,
	@UserName nvarchar(200),
	@Password nvarchar(200),
	@FullName nvarchar(100),
	@Gender bit,
	@Address nvarchar(500),
	@IdentityCard nvarchar(30),
	@MobileNumber nvarchar(30),
	@HomePhone nvarchar(30),
	@Email nvarchar(200)
As
	Insert Into [Customers]
	(
		[CustomerID],
		[UserName],
		[Password],
		[FullName],
		[Gender],
		[Address],
		[IdentityCard],
		[MobileNumber],
		[HomePhone],
		[Email]
	)
	Values
	(
		@CustomerID,
		@UserName,
		@Password,
		@FullName,
		@Gender,
		@Address,
		@IdentityCard,
		@MobileNumber,
		@HomePhone,
		@Email
	)

GO
/****** Object:  StoredProcedure [dbo].[Customers_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:19 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Customers_SelectAll]
As
	Select * From [Customers]
GO
/****** Object:  StoredProcedure [dbo].[Customers_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:19 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Customers_SelectByID]
	@CustomerID int
As
	Select *  From [Customers]
 	Where  ([CustomerID] = @CustomerID)
GO
/****** Object:  StoredProcedure [dbo].[Customers_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:19 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Customers_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [CustomerID]) As RowNum,*
		From [Customers]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Customers_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:19 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Customers_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Customers]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Customers]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Customers_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:19 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Customers_TestByID]
	@CustomerID int,
	@TestID Bit Output
As
	Select [CustomerID] From [Customers]
 	Where  ([CustomerID] = @CustomerID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Customers_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:19 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Customers_Update]
	@CustomerID int,
	@UserName nvarchar(200),
	@Password nvarchar(200),
	@FullName nvarchar(100),
	@Gender bit,
	@Address nvarchar(500),
	@IdentityCard nvarchar(30),
	@MobileNumber nvarchar(30),
	@HomePhone nvarchar(30),
	@Email nvarchar(200)
As
	Update [Customers]  Set
		[UserName] = @UserName,
		[Password] = @Password,
		[FullName] = @FullName,
		[Gender] = @Gender,
		[Address] = @Address,
		[IdentityCard] = @IdentityCard,
		[MobileNumber] = @MobileNumber,
		[HomePhone] = @HomePhone,
		[Email] = @Email
	Where ([CustomerID] = @CustomerID)
GO
/****** Object:  StoredProcedure [dbo].[District_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:28 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[District_Delete]
	@DistrictID int
As
	Delete [District] 
	Where  ([DistrictID]= @DistrictID)
GO
/****** Object:  StoredProcedure [dbo].[District_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:28 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[District_Insert]
	@CityID int,
	@DistrictName nvarchar(200)
As
	Insert Into [District]
	(
		[CityID],
		[DistrictName]
	)
	Values
	(
		@CityID,
		@DistrictName
	)

GO
/****** Object:  StoredProcedure [dbo].[District_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:28 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[District_SelectAll]
As
	Select * From [District]
GO
/****** Object:  StoredProcedure [dbo].[District_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:28 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[District_SelectByID]
	@DistrictID int
As
	Select *  From [District]
 	Where  ([DistrictID] = @DistrictID)
GO
/****** Object:  StoredProcedure [dbo].[District_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:28 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[District_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [DistrictID]) As RowNum,*
		From [District]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[District_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:28 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[District_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [District]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [District]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[District_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:28 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[District_TestByID]
	@DistrictID int,
	@TestID Bit Output
As
	Select [DistrictID] From [District]
 	Where  ([DistrictID] = @DistrictID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[District_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:28 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[District_Update]
	@DistrictID int,
	@CityID int,
	@DistrictName nvarchar(200)
As
	Update [District]  Set
		[CityID] = @CityID,
		[DistrictName] = @DistrictName
	Where ([DistrictID] = @DistrictID)
GO
/****** Object:  StoredProcedure [dbo].[Group_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:49 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Group_Delete]
	@GroupID int
As
	Delete [Group] 
	Where  ([GroupID]= @GroupID)
GO
/****** Object:  StoredProcedure [dbo].[Group_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:49 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Group_Insert]
	@ParentID int,
	@GroupName nvarchar(200),
	@Description nvarchar(500),
	@Status tinyint,
	@Priority int,
	@SwitchGroup nvarchar(500)
As
	Insert Into [Group]
	(
		[ParentID],
		[GroupName],
		[Description],
		[Status],
		[Priority],
		[SwitchGroup]
	)
	Values
	(
		@ParentID,
		@GroupName,
		@Description,
		@Status,
		@Priority,
		@SwitchGroup
	)

GO
/****** Object:  StoredProcedure [dbo].[Group_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:49 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Group_SelectAll]
As
	Select * From [Group]
GO
/****** Object:  StoredProcedure [dbo].[Group_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:49 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Group_SelectByID]
	@GroupID int
As
	Select *  From [Group]
 	Where  ([GroupID] = @GroupID)
GO
/****** Object:  StoredProcedure [dbo].[Group_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:49 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Group_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [GroupID]) As RowNum,*
		From [Group]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Group_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:49 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Group_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Group]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Group]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Group_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:49 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Group_TestByID]
	@GroupID int,
	@TestID Bit Output
As
	Select [GroupID] From [Group]
 	Where  ([GroupID] = @GroupID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Group_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:49 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Group_Update]
	@GroupID int,
	@ParentID int,
	@GroupName nvarchar(200),
	@Description nvarchar(500),
	@Status tinyint,
	@Priority int,
	@SwitchGroup nvarchar(500)
As
	Update [Group]  Set
		[ParentID] = @ParentID,
		[GroupName] = @GroupName,
		[Description] = @Description,
		[Status] = @Status,
		[Priority] = @Priority,
		[SwitchGroup] = @SwitchGroup
	Where ([GroupID] = @GroupID)
GO
/****** Object:  StoredProcedure [dbo].[Home_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:44 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Home_Delete]
	@HomeID int
As
	Delete [Home] 
	Where  ([HomeID]= @HomeID)
GO
/****** Object:  StoredProcedure [dbo].[Home_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:44 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Home_Insert]
	@HomeTypeID int,
	@RealEstateOwnersID int,
	@RealEstateOwnersTypeID int,
	@RealEstateID int,
	@Description nvarchar(500),
	@Address nvarchar(500),
	@Price float,
	@TotalArea float,
	@FloorArea float,
	@GargenArea float,
	@HomeArea float,
	@BedroomNumber tinyint,
	@TierNumber tinyint,
	@Image1 nvarchar(500),
	@Image2 nvarchar(500),
	@Image3 nvarchar(500)
As
	Insert Into [Home]
	(
		[HomeTypeID],
		[RealEstateOwnersID],
		[RealEstateOwnersTypeID],
		[RealEstateID],
		[Description],
		[Address],
		[Price],
		[TotalArea],
		[FloorArea],
		[GargenArea],
		[HomeArea],
		[BedroomNumber],
		[TierNumber],
		[Image1],
		[Image2],
		[Image3]
	)
	Values
	(
		@HomeTypeID,
		@RealEstateOwnersID,
		@RealEstateOwnersTypeID,
		@RealEstateID,
		@Description,
		@Address,
		@Price,
		@TotalArea,
		@FloorArea,
		@GargenArea,
		@HomeArea,
		@BedroomNumber,
		@TierNumber,
		@Image1,
		@Image2,
		@Image3
	)

GO
/****** Object:  StoredProcedure [dbo].[Home_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:44 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Home_SelectAll]
As
	Select * From [Home]
GO
/****** Object:  StoredProcedure [dbo].[Home_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:44 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Home_SelectByID]
	@HomeID int
As
	Select *  From [Home]
 	Where  ([HomeID] = @HomeID)
GO
/****** Object:  StoredProcedure [dbo].[Home_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:44 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Home_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [HomeID]) As RowNum,*
		From [Home]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Home_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:44 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Home_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Home]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Home]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Home_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:44 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Home_TestByID]
	@HomeID int,
	@TestID Bit Output
As
	Select [HomeID] From [Home]
 	Where  ([HomeID] = @HomeID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Home_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:44 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Home_Update]
	@HomeID int,
	@HomeTypeID int,
	@RealEstateOwnersID int,
	@RealEstateOwnersTypeID int,
	@RealEstateID int,
	@Description nvarchar(500),
	@Address nvarchar(500),
	@Price float,
	@TotalArea float,
	@FloorArea float,
	@GargenArea float,
	@HomeArea float,
	@BedroomNumber tinyint,
	@TierNumber tinyint,
	@Image1 nvarchar(500),
	@Image2 nvarchar(500),
	@Image3 nvarchar(500)
As
	Update [Home]  Set
		[HomeTypeID] = @HomeTypeID,
		[RealEstateOwnersID] = @RealEstateOwnersID,
		[RealEstateOwnersTypeID] = @RealEstateOwnersTypeID,
		[RealEstateID] = @RealEstateID,
		[Description] = @Description,
		[Address] = @Address,
		[Price] = @Price,
		[TotalArea] = @TotalArea,
		[FloorArea] = @FloorArea,
		[GargenArea] = @GargenArea,
		[HomeArea] = @HomeArea,
		[BedroomNumber] = @BedroomNumber,
		[TierNumber] = @TierNumber,
		[Image1] = @Image1,
		[Image2] = @Image2,
		[Image3] = @Image3
	Where ([HomeID] = @HomeID)
GO
/****** Object:  StoredProcedure [dbo].[HomeType_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:56 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[HomeType_Delete]
	@HomeTypeID int
As
	Delete [HomeType] 
	Where  ([HomeTypeID]= @HomeTypeID)
GO
/****** Object:  StoredProcedure [dbo].[HomeType_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:56 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[HomeType_Insert]
	@HomeTypeName nvarchar(200)
As
	Insert Into [HomeType]
	(
		[HomeTypeName]
	)
	Values
	(
		@HomeTypeName
	)

GO
/****** Object:  StoredProcedure [dbo].[HomeType_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:56 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[HomeType_SelectAll]
As
	Select * From [HomeType]
GO
/****** Object:  StoredProcedure [dbo].[HomeType_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:56 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[HomeType_SelectByID]
	@HomeTypeID int
As
	Select *  From [HomeType]
 	Where  ([HomeTypeID] = @HomeTypeID)
GO
/****** Object:  StoredProcedure [dbo].[HomeType_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:56 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[HomeType_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [HomeTypeID]) As RowNum,*
		From [HomeType]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[HomeType_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:56 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[HomeType_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [HomeType]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [HomeType]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[HomeType_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:56 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[HomeType_TestByID]
	@HomeTypeID int,
	@TestID Bit Output
As
	Select [HomeTypeID] From [HomeType]
 	Where  ([HomeTypeID] = @HomeTypeID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[HomeType_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:30:56 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[HomeType_Update]
	@HomeTypeID int,
	@HomeTypeName nvarchar(200)
As
	Update [HomeType]  Set
		[HomeTypeName] = @HomeTypeName
	Where ([HomeTypeID] = @HomeTypeID)
GO
/****** Object:  StoredProcedure [dbo].[Land_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Land_Delete]
	@LandID int
As
	Delete [Land] 
	Where  ([LandID]= @LandID)
GO
/****** Object:  StoredProcedure [dbo].[Land_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:24:59 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Land_Insert]
	@LandTypeID int,
	@RealEstateOwnersID int,
	@RealEstateOwnersTypeID int,
	@RealEstateID int,
	@Description nvarchar(500),
	@Address nvarchar(500),
	@Price float,
	@TotalArea float,
	@Image1 nvarchar(500),
	@Image2 nvarchar(500)
As
	Insert Into [Land]
	(
		[LandTypeID],
		[RealEstateOwnersID],
		[RealEstateOwnersTypeID],
		[RealEstateID],
		[Description],
		[Address],
		[Price],
		[TotalArea],
		[Image1],
		[Image2]
	)
	Values
	(
		@LandTypeID,
		@RealEstateOwnersID,
		@RealEstateOwnersTypeID,
		@RealEstateID,
		@Description,
		@Address,
		@Price,
		@TotalArea,
		@Image1,
		@Image2
	)

GO
/****** Object:  StoredProcedure [dbo].[Land_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Land_SelectAll]
As
	Select * From [Land]
GO
/****** Object:  StoredProcedure [dbo].[Land_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Land_SelectByID]
	@LandID int
As
	Select *  From [Land]
 	Where  ([LandID] = @LandID)
GO
/****** Object:  StoredProcedure [dbo].[Land_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Land_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [LandID]) As RowNum,*
		From [Land]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Land_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Land_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Land]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Land]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Land_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Land_TestByID]
	@LandID int,
	@TestID Bit Output
As
	Select [LandID] From [Land]
 	Where  ([LandID] = @LandID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Land_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:00 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Land_Update]
	@LandID int,
	@LandTypeID int,
	@RealEstateOwnersID int,
	@RealEstateOwnersTypeID int,
	@RealEstateID int,
	@Description nvarchar(500),
	@Address nvarchar(500),
	@Price float,
	@TotalArea float,
	@Image1 nvarchar(500),
	@Image2 nvarchar(500)
As
	Update [Land]  Set
		[LandTypeID] = @LandTypeID,
		[RealEstateOwnersID] = @RealEstateOwnersID,
		[RealEstateOwnersTypeID] = @RealEstateOwnersTypeID,
		[RealEstateID] = @RealEstateID,
		[Description] = @Description,
		[Address] = @Address,
		[Price] = @Price,
		[TotalArea] = @TotalArea,
		[Image1] = @Image1,
		[Image2] = @Image2
	Where ([LandID] = @LandID)
GO
/****** Object:  StoredProcedure [dbo].[LandType_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:09 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[LandType_Delete]
	@LandTypeID int
As
	Delete [LandType] 
	Where  ([LandTypeID]= @LandTypeID)
GO
/****** Object:  StoredProcedure [dbo].[LandType_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:09 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[LandType_Insert]
	@LandTypeName nvarchar(200)
As
	Insert Into [LandType]
	(
		[LandTypeName]
	)
	Values
	(
		@LandTypeName
	)

GO
/****** Object:  StoredProcedure [dbo].[LandType_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:09 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[LandType_SelectAll]
As
	Select * From [LandType]
GO
/****** Object:  StoredProcedure [dbo].[LandType_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:09 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[LandType_SelectByID]
	@LandTypeID int
As
	Select *  From [LandType]
 	Where  ([LandTypeID] = @LandTypeID)
GO
/****** Object:  StoredProcedure [dbo].[LandType_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:09 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[LandType_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [LandTypeID]) As RowNum,*
		From [LandType]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[LandType_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:09 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[LandType_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [LandType]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [LandType]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[LandType_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:09 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[LandType_TestByID]
	@LandTypeID int,
	@TestID Bit Output
As
	Select [LandTypeID] From [LandType]
 	Where  ([LandTypeID] = @LandTypeID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[LandType_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:09 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[LandType_Update]
	@LandTypeID int,
	@LandTypeName nvarchar(200)
As
	Update [LandType]  Set
		[LandTypeName] = @LandTypeName
	Where ([LandTypeID] = @LandTypeID)
GO
/****** Object:  StoredProcedure [dbo].[Location_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:24 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Location_Delete]
	@LocationID int
As
	Delete [Location] 
	Where  ([LocationID]= @LocationID)
GO
/****** Object:  StoredProcedure [dbo].[Location_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:24 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Location_Insert]
	@xcoor float,
	@ycoor float
As
	Insert Into [Location]
	(
		[xcoor],
		[ycoor]
	)
	Values
	(
		@xcoor,
		@ycoor
	)

GO
/****** Object:  StoredProcedure [dbo].[Location_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:24 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Location_SelectAll]
As
	Select * From [Location]
GO
/****** Object:  StoredProcedure [dbo].[Location_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:24 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Location_SelectByID]
	@LocationID int
As
	Select *  From [Location]
 	Where  ([LocationID] = @LocationID)
GO
/****** Object:  StoredProcedure [dbo].[Location_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:24 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Location_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [LocationID]) As RowNum,*
		From [Location]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Location_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:24 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Location_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Location]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Location]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Location_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:24 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Location_TestByID]
	@LocationID int,
	@TestID Bit Output
As
	Select [LocationID] From [Location]
 	Where  ([LocationID] = @LocationID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Location_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:24 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Location_Update]
	@LocationID int,
	@xcoor float,
	@ycoor float
As
	Update [Location]  Set
		[xcoor] = @xcoor,
		[ycoor] = @ycoor
	Where ([LocationID] = @LocationID)
GO
/****** Object:  StoredProcedure [dbo].[Menus_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:12 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Menus_Delete]
	@MenuID int
As
	Delete [Menus] 
	Where  ([MenuID]= @MenuID)
GO
/****** Object:  StoredProcedure [dbo].[Menus_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:12 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Menus_Insert]
	@ParentID int,
	@PageID int,
	@MenuName nvarchar(400),
	@Position int,
	@Status bigint,
	@Priority int,
	@Param nvarchar(2000),
	@GroupID int
As
	Insert Into [Menus]
	(
		[ParentID],
		[PageID],
		[MenuName],
		[Position],
		[Status],
		[Priority],
		[Param],
		[GroupID]
	)
	Values
	(
		@ParentID,
		@PageID,
		@MenuName,
		@Position,
		@Status,
		@Priority,
		@Param,
		@GroupID
	)

GO
/****** Object:  StoredProcedure [dbo].[Menus_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 11:48:24 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Menus_SelectAll]
As
	Select * From [Menus]
GO
/****** Object:  StoredProcedure [dbo].[Menus_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 11:48:40 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Menus_SelectByID]
	@MenuID int
As
	Select *  From [Menus]
 	Where  ([MenuID] = @MenuID)
GO
/****** Object:  StoredProcedure [dbo].[Menus_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 11:48:30 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Menus_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [MenuID]) As RowNum,*
		From [Menus]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Menus_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 11:48:35 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Menus_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Menus]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Menus]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Menus_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 11:48:47 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Menus_TestByID]
	@MenuID int,
	@TestID Bit Output
As
	Select [MenuID] From [Menus]
 	Where  ([MenuID] = @MenuID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Menus_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:12 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Menus_Update]
	@MenuID int,
	@ParentID int,
	@PageID int,
	@MenuName nvarchar(400),
	@Position int,
	@Status bigint,
	@Priority int,
	@Param nvarchar(2000),
	@GroupID int
As
	Update [Menus]  Set
		[ParentID] = @ParentID,
		[PageID] = @PageID,
		[MenuName] = @MenuName,
		[Position] = @Position,
		[Status] = @Status,
		[Priority] = @Priority,
		[Param] = @Param,
		[GroupID] = @GroupID
	Where ([MenuID] = @MenuID)
GO
/****** Object:  StoredProcedure [dbo].[MotelType_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:41 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[MotelType_Delete]
	@MotelTypeID int
As
	Delete [MotelType] 
	Where  ([MotelTypeID]= @MotelTypeID)
GO
/****** Object:  StoredProcedure [dbo].[MotelType_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:41 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[MotelType_Insert]
	@MotelTypeName nvarchar(100)
As
	Insert Into [MotelType]
	(
		[MotelTypeName]
	)
	Values
	(
		@MotelTypeName
	)

GO
/****** Object:  StoredProcedure [dbo].[MotelType_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:41 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[MotelType_SelectAll]
As
	Select * From [MotelType]
GO
/****** Object:  StoredProcedure [dbo].[MotelType_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:41 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[MotelType_SelectByID]
	@MotelTypeID int
As
	Select *  From [MotelType]
 	Where  ([MotelTypeID] = @MotelTypeID)
GO
/****** Object:  StoredProcedure [dbo].[MotelType_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:41 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[MotelType_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [MotelTypeID]) As RowNum,*
		From [MotelType]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[MotelType_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:41 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[MotelType_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [MotelType]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [MotelType]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[MotelType_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:41 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[MotelType_TestByID]
	@MotelTypeID int,
	@TestID Bit Output
As
	Select [MotelTypeID] From [MotelType]
 	Where  ([MotelTypeID] = @MotelTypeID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[MotelType_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:41 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[MotelType_Update]
	@MotelTypeID int,
	@MotelTypeName nvarchar(100)
As
	Update [MotelType]  Set
		[MotelTypeName] = @MotelTypeName
	Where ([MotelTypeID] = @MotelTypeID)
GO
/****** Object:  StoredProcedure [dbo].[PostContract_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[PostContract_Delete]
	@PostContractID int
As
	Delete [PostContract] 
	Where  ([PostContractID]= @PostContractID)
GO
/****** Object:  StoredProcedure [dbo].[PostContract_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[PostContract_Insert]
	@PostContractName nvarchar(100),
	@StaffD int,
	@UserName nvarchar(100),
	@RealEstateID int,
	@Fees money,
	@CreateDate datetime,
	@EndDate datetime,
	@Status bit
As
	Insert Into [PostContract]
	(
		[PostContractName],
		[StaffD],
		[UserName],
		[RealEstateID],
		[Fees],
		[CreateDate],
		[EndDate],
		[Status]
	)
	Values
	(
		@PostContractName,
		@StaffD,
		@UserName,
		@RealEstateID,
		@Fees,
		@CreateDate,
		@EndDate,
		@Status
	)

GO
/****** Object:  StoredProcedure [dbo].[PostContract_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[PostContract_SelectAll]
As
	Select * From [PostContract]
GO
/****** Object:  StoredProcedure [dbo].[PostContract_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[PostContract_SelectByID]
	@PostContractID int
As
	Select *  From [PostContract]
 	Where  ([PostContractID] = @PostContractID)
GO
/****** Object:  StoredProcedure [dbo].[PostContract_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[PostContract_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [PostContractID]) As RowNum,*
		From [PostContract]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[PostContract_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[PostContract_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [PostContract]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [PostContract]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[PostContract_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[PostContract_TestByID]
	@PostContractID int,
	@TestID Bit Output
As
	Select [PostContractID] From [PostContract]
 	Where  ([PostContractID] = @PostContractID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[PostContract_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:28:55 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[PostContract_Update]
	@PostContractID int,
	@PostContractName nvarchar(100),
	@StaffD int,
	@UserName nvarchar(100),
	@RealEstateID int,
	@Fees money,
	@CreateDate datetime,
	@EndDate datetime,
	@Status bit
As
	Update [PostContract]  Set
		[PostContractName] = @PostContractName,
		[StaffD] = @StaffD,
		[UserName] = @UserName,
		[RealEstateID] = @RealEstateID,
		[Fees] = @Fees,
		[CreateDate] = @CreateDate,
		[EndDate] = @EndDate,
		[Status] = @Status
	Where ([PostContractID] = @PostContractID)
GO
/****** Object:  StoredProcedure [dbo].[ProductType_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:12 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ProductType_Delete]
	@ProductTypeId int
As
	Delete [ProductType] 
	Where  ([ProductTypeId]= @ProductTypeId)
GO
/****** Object:  StoredProcedure [dbo].[ProductType_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:12 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ProductType_Insert]
	@ProductTypeId int,
	@ProductTypeName nvarchar(100),
	@ProductTypeDescription nvarchar(2000),
	@ProductTypeNameTranslationId int,
	@ProductTypeDescriptionNameTranslationId int
As
	Insert Into [ProductType]
	(
		[ProductTypeId],
		[ProductTypeName],
		[ProductTypeDescription],
		[ProductTypeNameTranslationId],
		[ProductTypeDescriptionNameTranslationId]
	)
	Values
	(
		@ProductTypeId,
		@ProductTypeName,
		@ProductTypeDescription,
		@ProductTypeNameTranslationId,
		@ProductTypeDescriptionNameTranslationId
	)

GO
/****** Object:  StoredProcedure [dbo].[ProductType_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:12 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[ProductType_SelectAll]
As
	Select * From [ProductType]
GO
/****** Object:  StoredProcedure [dbo].[ProductType_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:12 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ProductType_SelectByID]
	@ProductTypeId int
As
	Select *  From [ProductType]
 	Where  ([ProductTypeId] = @ProductTypeId)
GO
/****** Object:  StoredProcedure [dbo].[ProductType_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:12 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ProductType_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [ProductTypeId]) As RowNum,*
		From [ProductType]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[ProductType_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:12 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ProductType_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [ProductType]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [ProductType]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[ProductType_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:12 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ProductType_TestByID]
	@ProductTypeId int,
	@TestID Bit Output
As
	Select [ProductTypeId] From [ProductType]
 	Where  ([ProductTypeId] = @ProductTypeId)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[ProductType_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:12 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ProductType_Update]
	@ProductTypeId int,
	@ProductTypeName nvarchar(100),
	@ProductTypeDescription nvarchar(2000),
	@ProductTypeNameTranslationId int,
	@ProductTypeDescriptionNameTranslationId int
As
	Update [ProductType]  Set
		[ProductTypeName] = @ProductTypeName,
		[ProductTypeDescription] = @ProductTypeDescription,
		[ProductTypeNameTranslationId] = @ProductTypeNameTranslationId,
		[ProductTypeDescriptionNameTranslationId] = @ProductTypeDescriptionNameTranslationId
	Where ([ProductTypeId] = @ProductTypeId)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateNews_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RealEstateNews_Delete]
	@RealEstateNewsID int
As
	Delete [RealEstateNews] 
	Where  ([RealEstateNewsID]= @RealEstateNewsID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateNews_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RealEstateNews_Insert]
	@RealEstateNewsID int,
	@RealEstateID int,
	@Title nvarchar(400),
	@Content nvarchar(MAX),
	@CategoryID int,
	@Images nvarchar(500),
	@CreateDate datetime,
	@CreateBy datetime,
	@Source nvarchar(400)
As
	Insert Into [RealEstateNews]
	(
		[RealEstateNewsID],
		[RealEstateID],
		[Title],
		[Content],
		[CategoryID],
		[Images],
		[CreateDate],
		[CreateBy],
		[Source]
	)
	Values
	(
		@RealEstateNewsID,
		@RealEstateID,
		@Title,
		@Content,
		@CategoryID,
		@Images,
		@CreateDate,
		@CreateBy,
		@Source
	)

GO
/****** Object:  StoredProcedure [dbo].[RealEstateNews_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RealEstateNews_SelectAll]
As
	Select * From [RealEstateNews]
GO
/****** Object:  StoredProcedure [dbo].[RealEstateNews_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RealEstateNews_SelectByID]
	@RealEstateNewsID int
As
	Select *  From [RealEstateNews]
 	Where  ([RealEstateNewsID] = @RealEstateNewsID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateNews_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RealEstateNews_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [RealEstateNewsID]) As RowNum,*
		From [RealEstateNews]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[RealEstateNews_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RealEstateNews_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [RealEstateNews]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [RealEstateNews]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[RealEstateNews_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RealEstateNews_TestByID]
	@RealEstateNewsID int,
	@TestID Bit Output
As
	Select [RealEstateNewsID] From [RealEstateNews]
 	Where  ([RealEstateNewsID] = @RealEstateNewsID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[RealEstateNews_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RealEstateNews_Update]
	@RealEstateNewsID int,
	@RealEstateID int,
	@Title nvarchar(400),
	@Content nvarchar(MAX),
	@CategoryID int,
	@Images nvarchar(500),
	@CreateDate datetime,
	@CreateBy datetime,
	@Source nvarchar(400)
As
	Update [RealEstateNews]  Set
		[RealEstateID] = @RealEstateID,
		[Title] = @Title,
		[Content] = @Content,
		[CategoryID] = @CategoryID,
		[Images] = @Images,
		[CreateDate] = @CreateDate,
		[CreateBy] = @CreateBy,
		[Source] = @Source
	Where ([RealEstateNewsID] = @RealEstateNewsID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:37 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwners_Delete]
	@RealEstateOwnersID int
As
	Delete [RealEstateOwners] 
	Where  ([RealEstateOwnersID]= @RealEstateOwnersID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:37 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwners_Insert]
	@RealEstateOwnersTypeID int,
	@RealEstateOwnersName nvarchar(200),
	@CLUR tinyint,
	@Address nvarchar(400),
	@MobileNumber nchar(30),
	@Email nvarchar(200),
	@Gender bit,
	@IdentityCard nchar(30)
As
	Insert Into [RealEstateOwners]
	(
		[RealEstateOwnersTypeID],
		[RealEstateOwnersName],
		[CLUR],
		[Address],
		[MobileNumber],
		[Email],
		[Gender],
		[IdentityCard]
	)
	Values
	(
		@RealEstateOwnersTypeID,
		@RealEstateOwnersName,
		@CLUR,
		@Address,
		@MobileNumber,
		@Email,
		@Gender,
		@IdentityCard
	)

GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:37 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[RealEstateOwners_SelectAll]
As
	Select * From [RealEstateOwners]
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:37 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwners_SelectByID]
	@RealEstateOwnersID int
As
	Select *  From [RealEstateOwners]
 	Where  ([RealEstateOwnersID] = @RealEstateOwnersID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:37 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwners_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [RealEstateOwnersID]) As RowNum,*
		From [RealEstateOwners]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:37 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwners_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [RealEstateOwners]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [RealEstateOwners]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:37 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwners_TestByID]
	@RealEstateOwnersID int,
	@TestID Bit Output
As
	Select [RealEstateOwnersID] From [RealEstateOwners]
 	Where  ([RealEstateOwnersID] = @RealEstateOwnersID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:37 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwners_Update]
	@RealEstateOwnersID int,
	@RealEstateOwnersTypeID int,
	@RealEstateOwnersName nvarchar(200),
	@CLUR tinyint,
	@Address nvarchar(400),
	@MobileNumber nchar(30),
	@Email nvarchar(200),
	@Gender bit,
	@IdentityCard nchar(30)
As
	Update [RealEstateOwners]  Set
		[RealEstateOwnersTypeID] = @RealEstateOwnersTypeID,
		[RealEstateOwnersName] = @RealEstateOwnersName,
		[CLUR] = @CLUR,
		[Address] = @Address,
		[MobileNumber] = @MobileNumber,
		[Email] = @Email,
		[Gender] = @Gender,
		[IdentityCard] = @IdentityCard
	Where ([RealEstateOwnersID] = @RealEstateOwnersID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:18 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwnersType_Delete]
	@RealEstateOwnersTypeID int
As
	Delete [RealEstateOwnersType] 
	Where  ([RealEstateOwnersTypeID]= @RealEstateOwnersTypeID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:18 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwnersType_Insert]
	@RealEstateOwnersTypeName nchar(20)
As
	Insert Into [RealEstateOwnersType]
	(
		[RealEstateOwnersTypeName]
	)
	Values
	(
		@RealEstateOwnersTypeName
	)

GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:18 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[RealEstateOwnersType_SelectAll]
As
	Select * From [RealEstateOwnersType]
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:18 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwnersType_SelectByID]
	@RealEstateOwnersTypeID int
As
	Select *  From [RealEstateOwnersType]
 	Where  ([RealEstateOwnersTypeID] = @RealEstateOwnersTypeID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:18 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwnersType_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [RealEstateOwnersTypeID]) As RowNum,*
		From [RealEstateOwnersType]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:18 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwnersType_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [RealEstateOwnersType]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [RealEstateOwnersType]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:18 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwnersType_TestByID]
	@RealEstateOwnersTypeID int,
	@TestID Bit Output
As
	Select [RealEstateOwnersTypeID] From [RealEstateOwnersType]
 	Where  ([RealEstateOwnersTypeID] = @RealEstateOwnersTypeID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:18 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwnersType_Update]
	@RealEstateOwnersTypeID int,
	@RealEstateOwnersTypeName nchar(20)
As
	Update [RealEstateOwnersType]  Set
		[RealEstateOwnersTypeName] = @RealEstateOwnersTypeName
	Where ([RealEstateOwnersTypeID] = @RealEstateOwnersTypeID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstates_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstates_Delete]
	@RealEstateID int
As
	Delete [RealEstates] 
	Where  ([RealEstateID]= @RealEstateID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstates_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstates_Insert]
	@RealEstateName nvarchar(200),
	@RealEstateTypeID int,
	@LocationID int,
	@CityID int,
	@RegionID int,
	@DistrictID int,
	@RealEstateOwnersID int,
	@Address int,
	@Price float,
	@Description nvarchar(500),
	@CreateBy nvarchar(100),
	@CreateDate datetime,
	@Area float,
	@Lengh float,
	@Width float,
	@Height float,
	@Images nvarchar(500),
	@Status tinyint,
	@IsVip tinyint,
	@Period datetime
As
	Insert Into [RealEstates]
	(
		[RealEstateName],
		[RealEstateTypeID],
		[LocationID],
		[CityID],
		[RegionID],
		[DistrictID],
		[RealEstateOwnersID],
		[Address],
		[Price],
		[Description],
		[CreateBy],
		[CreateDate],
		[Area],
		[Lengh],
		[Width],
		[Height],
		[Images],
		[Status],
		[IsVip],
		[Period]
	)
	Values
	(
		@RealEstateName,
		@RealEstateTypeID,
		@LocationID,
		@CityID,
		@RegionID,
		@DistrictID,
		@RealEstateOwnersID,
		@Address,
		@Price,
		@Description,
		@CreateBy,
		@CreateDate,
		@Area,
		@Lengh,
		@Width,
		@Height,
		@Images,
		@Status,
		@IsVip,
		@Period
	)

GO
/****** Object:  StoredProcedure [dbo].[RealEstates_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[RealEstates_SelectAll]
As
	Select * From [RealEstates]
GO
/****** Object:  StoredProcedure [dbo].[RealEstates_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstates_SelectByID]
	@RealEstateID int
As
	Select *  From [RealEstates]
 	Where  ([RealEstateID] = @RealEstateID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstates_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstates_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [RealEstateID]) As RowNum,*
		From [RealEstates]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[RealEstates_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstates_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [RealEstates]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [RealEstates]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[RealEstates_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstates_TestByID]
	@RealEstateID int,
	@TestID Bit Output
As
	Select [RealEstateID] From [RealEstates]
 	Where  ([RealEstateID] = @RealEstateID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[RealEstates_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:29:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstates_Update]
	@RealEstateID int,
	@RealEstateName nvarchar(200),
	@RealEstateTypeID int,
	@LocationID int,
	@CityID int,
	@RegionID int,
	@DistrictID int,
	@RealEstateOwnersID int,
	@Address int,
	@Price float,
	@Description nvarchar(500),
	@CreateBy nvarchar(100),
	@CreateDate datetime,
	@Area float,
	@Lengh float,
	@Width float,
	@Height float,
	@Images nvarchar(500),
	@Status tinyint,
	@IsVip tinyint,
	@Period datetime
As
	Update [RealEstates]  Set
		[RealEstateName] = @RealEstateName,
		[RealEstateTypeID] = @RealEstateTypeID,
		[LocationID] = @LocationID,
		[CityID] = @CityID,
		[RegionID] = @RegionID,
		[DistrictID] = @DistrictID,
		[RealEstateOwnersID] = @RealEstateOwnersID,
		[Address] = @Address,
		[Price] = @Price,
		[Description] = @Description,
		[CreateBy] = @CreateBy,
		[CreateDate] = @CreateDate,
		[Area] = @Area,
		[Lengh] = @Lengh,
		[Width] = @Width,
		[Height] = @Height,
		[Images] = @Images,
		[Status] = @Status,
		[IsVip] = @IsVip,
		[Period] = @Period
	Where ([RealEstateID] = @RealEstateID)
GO
/****** Object:  StoredProcedure [dbo].[Region_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:42 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Region_Delete]
	@RegionID int
As
	Delete [Region] 
	Where  ([RegionID]= @RegionID)
GO
/****** Object:  StoredProcedure [dbo].[Region_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:42 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Region_Insert]
	@RegionName nvarchar(200)
As
	Insert Into [Region]
	(
		[RegionName]
	)
	Values
	(
		@RegionName
	)

GO
/****** Object:  StoredProcedure [dbo].[Region_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:42 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Region_SelectAll]
As
	Select * From [Region]
GO
/****** Object:  StoredProcedure [dbo].[Region_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:42 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Region_SelectByID]
	@RegionID int
As
	Select *  From [Region]
 	Where  ([RegionID] = @RegionID)
GO
/****** Object:  StoredProcedure [dbo].[Region_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:42 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Region_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [RegionID]) As RowNum,*
		From [Region]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Region_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:42 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Region_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Region]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Region]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Region_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:42 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Region_TestByID]
	@RegionID int,
	@TestID Bit Output
As
	Select [RegionID] From [Region]
 	Where  ([RegionID] = @RegionID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Region_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:25:42 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Region_Update]
	@RegionID int,
	@RegionName nvarchar(200)
As
	Update [Region]  Set
		[RegionName] = @RegionName
	Where ([RegionID] = @RegionID)
GO
/****** Object:  StoredProcedure [dbo].[sp_User_GetByAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_GetByAll]
As
	Select * From [User]
GO
/****** Object:  StoredProcedure [dbo].[sproc_City_GetByTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sproc_City_GetByTop]
	@Top nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [City]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [City]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL


if exists (select * from sysobjects where id = object_id(N'[sproc_City_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_City_Get]

GO
/****** Object:  StoredProcedure [dbo].[User_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Delete]
@Id int
As
	Delete [User] 
	Where  ([Id] = @Id)
GO
/****** Object:  StoredProcedure [dbo].[User_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 11:37:19 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[User_Insert]
	@Id int,
	@Name nvarchar(500),
	@Username nvarchar(500),
	@Password nvarchar(500),
	@Level nvarchar(100),
	@Admin int,
	@Ord int,
	@Active int
As
	Insert Into [User]
	(
		[Id],
		[Name],
		[Username],
		[Password],
		[Level],
		[Admin],
		[Ord],
		[Active]
	)
	Values
	(
		@Id,
		@Name,
		@Username,
		@Password,
		@Level,
		@Admin,
		@Ord,
		@Active
	)
GO
/****** Object:  StoredProcedure [dbo].[User_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[User_SelectByID]
	@Id int
As
	Select *  From [User]
 	Where  ([Id] = @Id)
GO
/****** Object:  StoredProcedure [dbo].[User_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [Id]) As RowNum,*
		From [User]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[User_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[User_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [User]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [User]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[User_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[User_TestByID]
	@Id int,
	@TestID Bit Output
As
	Select [Id] From [User]
 	Where  ([Id] = @Id)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[User_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Update]
	@Id int,
	@Name nvarchar(500),
	@Username nvarchar(500),
	@Password nvarchar(500),
	@Level nvarchar(100),
	@Admin int,
	@Ord int,
	@Active int
As
	Update [User]  Set
		[Id] = @Id,
		[Name] = @Name,
		[Username] = @Username,
		[Password] = @Password,
		[Level] = @Level,
		[Admin] = @Admin,
		[Ord] = @Ord,
		[Active] = @Active
	Where ([Id] = @Id)
GO
/****** Object:  StoredProcedure [dbo].[Users_CheckLogin]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Users_CheckLogin]
@UserName nvarchar(250),
@Password varchar(250)
as 
select * from [Users] where UserName = @UserName and [Password] = @Password
GO
/****** Object:  StoredProcedure [dbo].[Users_Delete]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Users_Delete]
	@UserID int
As
	Delete [Users] 
	Where  ([UserID]= @UserID)
GO
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Users_Insert]
	@UserName nvarchar(500),
	@Password nvarchar(500),
	@FullName nvarchar(100),
	@Role int,
	@Gender bit,
	@Avatar nvarchar(400),
	@CompanyName nvarchar(200),
	@Birthday datetime,
	@Email nvarchar(200),
	@Address nvarchar(500),
	@MobilePhone nvarchar(100),
	@HomePhone nvarchar(100),
	@IdentityCard nvarchar(200),
	@Status tinyint,
	@LastLoggedOn datetime,
	@CreatedDate datetime,
	@CreatedBy int,
	@IsFirstLogin bit,
	@GroupID int,
	@Active int,
	@Ord int
As
	Insert Into [Users]
	(
		[UserName],
		[Password],
		[FullName],
		[Role],
		[Gender],
		[Avatar],
		[CompanyName],
		[Birthday],
		[Email],
		[Address],
		[MobilePhone],
		[HomePhone],
		[IdentityCard],
		[Status],
		[LastLoggedOn],
		[CreatedDate],
		[CreatedBy],
		[IsFirstLogin],
		[GroupID],
		[Active],
		[Ord]
	)
	Values
	(
		@UserName,
		@Password,
		@FullName,
		@Role,
		@Gender,
		@Avatar,
		@CompanyName,
		@Birthday,
		@Email,
		@Address,
		@MobilePhone,
		@HomePhone,
		@IdentityCard,
		@Status,
		@LastLoggedOn,
		@CreatedDate,
		@CreatedBy,
		@IsFirstLogin,
		@GroupID,
		@Active,
		@Ord
	)

GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAll]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Users_SelectAll]
As
	Select * From [Users]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_SelectByID]
	@Id int
As
	Select *  From [User]
 	Where  ([Id] = @Id)
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectPage]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Users_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [UserID]) As RowNum,*
		From [Users]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectTop]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Users_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Users]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Users]'
		End
	If len(@Where) >0 
		Begin
			Set @SQL = @SQL + ' Where ' + @Where
		End
	If Len(@Order) >0
		Begin
			Set @SQL = @SQL + ' Order By ' + @Order
		End
Execute sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[Users_TestByID]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Users_TestByID]
	@UserID int,
	@TestID Bit Output
As
	Select [UserID] From [Users]
 	Where  ([UserID] = @UserID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Users_Update]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/17/2015 8:31:03 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Users_Update]
	@UserID int,
	@UserName nvarchar(500),
	@Password nvarchar(500),
	@FullName nvarchar(100),
	@Role int,
	@Gender bit,
	@Avatar nvarchar(400),
	@CompanyName nvarchar(200),
	@Birthday datetime,
	@Email nvarchar(200),
	@Address nvarchar(500),
	@MobilePhone nvarchar(100),
	@HomePhone nvarchar(100),
	@IdentityCard nvarchar(200),
	@Status tinyint,
	@LastLoggedOn datetime,
	@CreatedDate datetime,
	@CreatedBy int,
	@IsFirstLogin bit,
	@GroupID int,
	@Active int,
	@Ord int
As
	Update [Users]  Set
		[UserName] = @UserName,
		[Password] = @Password,
		[FullName] = @FullName,
		[Role] = @Role,
		[Gender] = @Gender,
		[Avatar] = @Avatar,
		[CompanyName] = @CompanyName,
		[Birthday] = @Birthday,
		[Email] = @Email,
		[Address] = @Address,
		[MobilePhone] = @MobilePhone,
		[HomePhone] = @HomePhone,
		[IdentityCard] = @IdentityCard,
		[Status] = @Status,
		[LastLoggedOn] = @LastLoggedOn,
		[CreatedDate] = @CreatedDate,
		[CreatedBy] = @CreatedBy,
		[IsFirstLogin] = @IsFirstLogin,
		[GroupID] = @GroupID,
		[Active] = @Active,
		[Ord] = @Ord
	Where ([UserID] = @UserID)
GO
/****** Object:  Table [dbo].[Advertise]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Advertise](
	[AdvID] [int] NOT NULL,
	[AdvName] [nvarchar](150) NULL,
	[Image] [nvarchar](255) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Link] [nvarchar](255) NULL,
	[Target] [varchar](10) NULL,
	[Content] [ntext] NULL,
	[Position] [smallint] NULL,
	[PageID] [int] NULL,
	[Click] [int] NULL,
	[Ord] [int] NULL,
	[Active] [bit] NOT NULL,
	[Lang] [varchar](5) NULL,
 CONSTRAINT [PK_Advertise] PRIMARY KEY CLUSTERED 
(
	[AdvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment](
	[ApartmentID] [int] IDENTITY(1,1) NOT NULL,
	[RealEstateOwnersID] [int] NOT NULL,
	[RealEstateOwnersTypeID] [int] NULL,
	[RealEstateID] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Price] [float] NOT NULL,
	[TotalArea] [float] NOT NULL,
	[FloorArea] [float] NOT NULL,
	[GargenArea] [float] NOT NULL,
	[HomeArea] [float] NOT NULL,
	[RoomNumber] [tinyint] NULL,
	[TierNumber] [tinyint] NULL,
	[Image1] [nvarchar](250) NULL,
	[Image2] [nvarchar](250) NULL,
	[Image3] [nvarchar](250) NULL,
 CONSTRAINT [PK_tblApartment] PRIMARY KEY CLUSTERED 
(
	[ApartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Banner]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[BannerID] [int] IDENTITY(1,1) NOT NULL,
	[BannerType] [nvarchar](50) NULL,
	[Size] [nchar](15) NULL,
	[Description] [nvarchar](250) NULL,
	[Images] [nvarchar](250) NULL,
 CONSTRAINT [PK_tblBanner] PRIMARY KEY CLUSTERED 
(
	[BannerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categorys](
	[CategoryID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Tag] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Content] [ntext] NULL,
	[Level] [nvarchar](100) NULL,
	[Priority] [smallint] NOT NULL,
	[Index] [smallint] NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](500) NULL,
	[Keyword] [nvarchar](255) NULL,
	[Active] [int] NULL,
	[Ord] [int] NULL,
	[Lang] [varchar](5) NOT NULL,
	[Image] [nvarchar](255) NULL,
	[Image2] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] NOT NULL,
	[CityName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Companys]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companys](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[HotLine] [nchar](15) NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Fax] [nvarchar](15) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Surrogate] [nvarchar](50) NOT NULL,
	[Chevron] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCompanys] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContractAdvertising]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractAdvertising](
	[ContractAdvertisingID] [int] IDENTITY(1,1) NOT NULL,
	[ContractAdvertisingName] [nvarchar](50) NOT NULL,
	[StaffID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[BannerID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Fees] [money] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_tblContractAdvertising] PRIMARY KEY CLUSTERED 
(
	[ContractAdvertisingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Controls]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Controls](
	[ControlID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PageId] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Path] [nvarchar](250) NOT NULL,
	[Param] [nvarchar](250) NULL,
	[Status] [bigint] NOT NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[ControlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Address] [nvarchar](250) NULL,
	[IdentityCard] [nvarchar](15) NULL,
	[MobileNumber] [nvarchar](15) NULL,
	[HomePhone] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[District]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[DistrictID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[DistrictName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblDistrictID] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ParentID] [int] NOT NULL,
	[GroupName] [nvarchar](100) NULL,
	[Description] [nvarchar](250) NULL,
	[Status] [tinyint] NOT NULL,
	[Priority] [int] NOT NULL,
	[SwitchGroup] [nvarchar](250) NULL,
 CONSTRAINT [PK_AdminGroups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Home]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Home](
	[HomeID] [int] IDENTITY(1,1) NOT NULL,
	[HomeTypeID] [int] NOT NULL,
	[RealEstateOwnersID] [int] NOT NULL,
	[RealEstateOwnersTypeID] [int] NOT NULL,
	[RealEstateID] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Price] [float] NOT NULL,
	[TotalArea] [float] NULL,
	[FloorArea] [float] NULL,
	[GargenArea] [float] NULL,
	[HomeArea] [float] NULL,
	[BedroomNumber] [tinyint] NULL,
	[TierNumber] [tinyint] NULL,
	[Image1] [nvarchar](250) NULL,
	[Image2] [nvarchar](250) NULL,
	[Image3] [nvarchar](250) NULL,
 CONSTRAINT [PK_tblHome] PRIMARY KEY CLUSTERED 
(
	[HomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HomeType]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeType](
	[HomeTypeID] [int] IDENTITY(1,1) NOT NULL,
	[HomeTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblHomeType] PRIMARY KEY CLUSTERED 
(
	[HomeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Land]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Land](
	[LandID] [int] IDENTITY(1,1) NOT NULL,
	[LandTypeID] [int] NOT NULL,
	[RealEstateOwnersID] [int] NOT NULL,
	[RealEstateOwnersTypeID] [int] NULL,
	[RealEstateID] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Price] [float] NOT NULL,
	[TotalArea] [float] NOT NULL,
	[Image1] [nvarchar](250) NOT NULL,
	[Image2] [nvarchar](250) NULL,
 CONSTRAINT [PK_tblLand] PRIMARY KEY CLUSTERED 
(
	[LandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LandType]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandType](
	[LandTypeID] [int] IDENTITY(1,1) NOT NULL,
	[LandTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblLandType] PRIMARY KEY CLUSTERED 
(
	[LandTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Language]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[LanguageId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ResourceFile] [nvarchar](50) NULL,
	[LanguageText] [nvarchar](50) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[xcoor] [float] NULL,
	[ycoor] [float] NULL,
 CONSTRAINT [PK_tblLocation] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menus]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[MenuID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ParentID] [int] NULL,
	[PageID] [int] NULL,
	[MenuName] [nvarchar](200) NULL,
	[Position] [int] NULL,
	[Status] [bigint] NULL,
	[Priority] [int] NULL,
	[Param] [nvarchar](1000) NULL,
	[GroupID] [int] NULL,
 CONSTRAINT [PK_tblMenus] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Motel]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Motel](
	[MotelID] [int] IDENTITY(1,1) NOT NULL,
	[RealEstateOwnersID] [int] NOT NULL,
	[RealEstateOwnersTypeID] [int] NOT NULL,
	[RealEstateID] [int] NOT NULL,
	[MotelTypeID] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Price] [float] NOT NULL,
	[TotalArea] [float] NOT NULL,
	[IsClosed] [bit] NULL,
	[IsCooker] [bit] NULL,
	[Furniture] [nvarchar](50) NULL,
	[TierNumber] [tinyint] NULL,
	[Image1] [nvarchar](250) NULL,
	[Image2] [nvarchar](250) NULL,
	[Image3] [nvarchar](250) NULL,
 CONSTRAINT [PK_tblMotel] PRIMARY KEY CLUSTERED 
(
	[MotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MotelType]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotelType](
	[MotelTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MotelTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblMotelType] PRIMARY KEY CLUSTERED 
(
	[MotelTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[PageID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Tag] [nvarchar](255) NULL,
	[Conntent] [nvarchar](max) NULL,
	[Detail] [nvarchar](250) NULL,
	[Level] [int] NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Keyword] [nvarchar](500) NULL,
	[Type] [nvarchar](50) NULL,
	[Link] [nvarchar](200) NULL,
	[Taget] [nvarchar](100) NULL,
	[Position] [int] NULL,
	[Index] [int] NULL,
	[Active] [int] NULL,
	[Lang] [nvarchar](50) NULL,
	[Ord] [int] NULL,
 CONSTRAINT [PK_AdminMenu] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostContract]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostContract](
	[PostContractID] [int] IDENTITY(1,1) NOT NULL,
	[PostContractName] [nvarchar](50) NOT NULL,
	[StaffD] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[RealEstateID] [int] NOT NULL,
	[Fees] [money] NOT NULL,
	[CreateDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblPostContract] PRIMARY KEY CLUSTERED 
(
	[PostContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeId] [int] NOT NULL,
	[ProductTypeName] [nvarchar](50) NULL,
	[ProductTypeDescription] [nvarchar](1000) NULL,
	[ProductTypeNameTranslationId] [int] NULL,
	[ProductTypeDescriptionNameTranslationId] [int] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RealEstateNews]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateNews](
	[RealEstateNewsID] [int] NOT NULL,
	[RealEstateID] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CategoryID] [int] NOT NULL,
	[Images] [nvarchar](250) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [datetime] NULL,
	[Source] [nvarchar](200) NULL,
 CONSTRAINT [PK_RealEstateNews] PRIMARY KEY CLUSTERED 
(
	[RealEstateNewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RealEstateOwners]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateOwners](
	[RealEstateOwnersID] [int] IDENTITY(1,1) NOT NULL,
	[RealEstateOwnersTypeID] [int] NULL,
	[RealEstateOwnersName] [nvarchar](100) NOT NULL,
	[CLUR] [tinyint] NOT NULL,
	[Address] [nvarchar](200) NULL,
	[MobileNumber] [nchar](15) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Gender] [bit] NULL,
	[IdentityCard] [nchar](15) NULL,
 CONSTRAINT [PK_tblRealEstateOwners] PRIMARY KEY CLUSTERED 
(
	[RealEstateOwnersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RealEstateOwnersType]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateOwnersType](
	[RealEstateOwnersTypeID] [int] IDENTITY(1,1) NOT NULL,
	[RealEstateOwnersTypeName] [nchar](10) NULL,
 CONSTRAINT [PK_RealEstateOwnersType] PRIMARY KEY CLUSTERED 
(
	[RealEstateOwnersTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RealEstates]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstates](
	[RealEstateID] [int] IDENTITY(1,1) NOT NULL,
	[RealEstateName] [nvarchar](100) NOT NULL,
	[RealEstateTypeID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[RegionID] [int] NOT NULL,
	[DistrictID] [int] NOT NULL,
	[RealEstateOwnersID] [int] NOT NULL,
	[Address] [int] NOT NULL,
	[Price] [float] NULL,
	[Description] [nvarchar](250) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[Area] [float] NULL,
	[Lengh] [float] NULL,
	[Width] [float] NULL,
	[Height] [float] NULL,
	[Images] [nvarchar](250) NULL,
	[Status] [tinyint] NULL,
	[IsVip] [tinyint] NULL,
	[Period] [datetime] NULL,
 CONSTRAINT [PK_tblRealEstate] PRIMARY KEY CLUSTERED 
(
	[RealEstateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RealEstateType]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateType](
	[RealEstateTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameRealEstateType] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_tblRealEstateType] PRIMARY KEY CLUSTERED 
(
	[RealEstateTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Region]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](20) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[IdNumber] [nvarchar](15) NOT NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[HomePhone] [nvarchar](15) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblStaff] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbvisistor]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbvisistor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[iuseronline] [int] NULL,
	[ivisistor] [bigint] NULL,
	[iuseronlinedate] [int] NULL,
	[dateonline] [datetime] NULL,
 CONSTRAINT [PRK_tbvisistor_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Username] [nvarchar](250) NULL,
	[Password] [nvarchar](250) NULL,
	[Level] [nvarchar](50) NULL,
	[Admin] [int] NULL,
	[Ord] [int] NULL,
	[Active] [int] NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/18/2015 2:07:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Role] [int] NULL,
	[Gender] [bit] NULL,
	[Avatar] [nvarchar](200) NULL,
	[CompanyName] [nvarchar](100) NULL,
	[Birthday] [datetime] NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](250) NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[HomePhone] [nvarchar](50) NULL,
	[IdentityCard] [nvarchar](100) NULL,
	[Status] [tinyint] NULL,
	[LastLoggedOn] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[IsFirstLogin] [bit] NULL,
	[GroupID] [int] NULL,
	[Active] [int] NULL,
	[Ord] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [unique_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Categorys] ADD  CONSTRAINT [DF_Category_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Categorys] ADD  CONSTRAINT [DF_Category_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Categorys] ADD  CONSTRAINT [DF_Category_DisplayUrl]  DEFAULT ('') FOR [Lang]
GO
ALTER TABLE [dbo].[Categorys] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((0)) FOR [Image2]
GO
ALTER TABLE [dbo].[Controls] ADD  CONSTRAINT [DF_Module_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Controls] ADD  CONSTRAINT [DF_Module_Module]  DEFAULT ('') FOR [Path]
GO
ALTER TABLE [dbo].[Controls] ADD  CONSTRAINT [DF_Module_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Controls] ADD  CONSTRAINT [DF_Module_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_AdminGroup_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_AdminGroup_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Menus] ADD  CONSTRAINT [DF_Menus_ParentId]  DEFAULT ((0)) FOR [ParentID]
GO
ALTER TABLE [dbo].[Menus] ADD  CONSTRAINT [DF_Menus_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Menus] ADD  CONSTRAINT [DF_Menus_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Pages] ADD  CONSTRAINT [DF_AdminMenu_ParentId]  DEFAULT ((0)) FOR [Name]
GO
ALTER TABLE [dbo].[Pages] ADD  CONSTRAINT [DF_AdminMenu_Name]  DEFAULT ('') FOR [Conntent]
GO
ALTER TABLE [dbo].[Pages] ADD  CONSTRAINT [DF_AdminMenu_Status]  DEFAULT ((0)) FOR [Title]
GO
ALTER TABLE [dbo].[Pages] ADD  CONSTRAINT [DF_AdminMenu_Priority]  DEFAULT ((0)) FOR [Keyword]
GO
ALTER TABLE [dbo].[Advertise]  WITH CHECK ADD  CONSTRAINT [FK_Advertise_Pages] FOREIGN KEY([PageID])
REFERENCES [dbo].[Pages] ([PageID])
GO
ALTER TABLE [dbo].[Advertise] CHECK CONSTRAINT [FK_Advertise_Pages]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_tblApartment_tblRealEstate] FOREIGN KEY([RealEstateID])
REFERENCES [dbo].[RealEstates] ([RealEstateID])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_tblApartment_tblRealEstate]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_tblApartment_tblRealEstateOwners] FOREIGN KEY([RealEstateOwnersID])
REFERENCES [dbo].[RealEstateOwners] ([RealEstateOwnersID])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_tblApartment_tblRealEstateOwners]
GO
ALTER TABLE [dbo].[ContractAdvertising]  WITH CHECK ADD  CONSTRAINT [FK_tblContractAdvertising_tblBanner] FOREIGN KEY([BannerID])
REFERENCES [dbo].[Banner] ([BannerID])
GO
ALTER TABLE [dbo].[ContractAdvertising] CHECK CONSTRAINT [FK_tblContractAdvertising_tblBanner]
GO
ALTER TABLE [dbo].[ContractAdvertising]  WITH CHECK ADD  CONSTRAINT [FK_tblContractAdvertising_tblCompanys] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companys] ([CompanyID])
GO
ALTER TABLE [dbo].[ContractAdvertising] CHECK CONSTRAINT [FK_tblContractAdvertising_tblCompanys]
GO
ALTER TABLE [dbo].[ContractAdvertising]  WITH CHECK ADD  CONSTRAINT [FK_tblContractAdvertising_tblStaff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[ContractAdvertising] CHECK CONSTRAINT [FK_tblContractAdvertising_tblStaff]
GO
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD  CONSTRAINT [FK_tblControls_tblPages] FOREIGN KEY([PageId])
REFERENCES [dbo].[Pages] ([PageID])
GO
ALTER TABLE [dbo].[Controls] CHECK CONSTRAINT [FK_tblControls_tblPages]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_tblDistrictID_tblCity] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_tblDistrictID_tblCity]
GO
ALTER TABLE [dbo].[Home]  WITH CHECK ADD  CONSTRAINT [FK_tblHome_tblHomeType] FOREIGN KEY([HomeTypeID])
REFERENCES [dbo].[HomeType] ([HomeTypeID])
GO
ALTER TABLE [dbo].[Home] CHECK CONSTRAINT [FK_tblHome_tblHomeType]
GO
ALTER TABLE [dbo].[Home]  WITH CHECK ADD  CONSTRAINT [FK_tblHome_tblRealEstate] FOREIGN KEY([RealEstateID])
REFERENCES [dbo].[RealEstates] ([RealEstateID])
GO
ALTER TABLE [dbo].[Home] CHECK CONSTRAINT [FK_tblHome_tblRealEstate]
GO
ALTER TABLE [dbo].[Home]  WITH CHECK ADD  CONSTRAINT [FK_tblHome_tblRealEstateOwners] FOREIGN KEY([RealEstateOwnersID])
REFERENCES [dbo].[RealEstateOwners] ([RealEstateOwnersID])
GO
ALTER TABLE [dbo].[Home] CHECK CONSTRAINT [FK_tblHome_tblRealEstateOwners]
GO
ALTER TABLE [dbo].[Land]  WITH CHECK ADD  CONSTRAINT [FK_tblLand_tblLandType] FOREIGN KEY([LandTypeID])
REFERENCES [dbo].[LandType] ([LandTypeID])
GO
ALTER TABLE [dbo].[Land] CHECK CONSTRAINT [FK_tblLand_tblLandType]
GO
ALTER TABLE [dbo].[Land]  WITH CHECK ADD  CONSTRAINT [FK_tblLand_tblRealEstate] FOREIGN KEY([RealEstateID])
REFERENCES [dbo].[RealEstates] ([RealEstateID])
GO
ALTER TABLE [dbo].[Land] CHECK CONSTRAINT [FK_tblLand_tblRealEstate]
GO
ALTER TABLE [dbo].[Land]  WITH CHECK ADD  CONSTRAINT [FK_tblLand_tblRealEstateOwners1] FOREIGN KEY([RealEstateOwnersID])
REFERENCES [dbo].[RealEstateOwners] ([RealEstateOwnersID])
GO
ALTER TABLE [dbo].[Land] CHECK CONSTRAINT [FK_tblLand_tblRealEstateOwners1]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_tblMenus_tblGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_tblMenus_tblGroup]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_tblMenus_tblPages] FOREIGN KEY([PageID])
REFERENCES [dbo].[Pages] ([PageID])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_tblMenus_tblPages]
GO
ALTER TABLE [dbo].[Motel]  WITH CHECK ADD  CONSTRAINT [FK_tblMotel_tblMotelType] FOREIGN KEY([MotelTypeID])
REFERENCES [dbo].[MotelType] ([MotelTypeID])
GO
ALTER TABLE [dbo].[Motel] CHECK CONSTRAINT [FK_tblMotel_tblMotelType]
GO
ALTER TABLE [dbo].[Motel]  WITH CHECK ADD  CONSTRAINT [FK_tblMotel_tblRealEstate] FOREIGN KEY([RealEstateID])
REFERENCES [dbo].[RealEstates] ([RealEstateID])
GO
ALTER TABLE [dbo].[Motel] CHECK CONSTRAINT [FK_tblMotel_tblRealEstate]
GO
ALTER TABLE [dbo].[Motel]  WITH CHECK ADD  CONSTRAINT [FK_tblMotel_tblRealEstateOwners] FOREIGN KEY([RealEstateOwnersID])
REFERENCES [dbo].[RealEstateOwners] ([RealEstateOwnersID])
GO
ALTER TABLE [dbo].[Motel] CHECK CONSTRAINT [FK_tblMotel_tblRealEstateOwners]
GO
ALTER TABLE [dbo].[PostContract]  WITH CHECK ADD  CONSTRAINT [FK_tblPostContract_tblRealEstate] FOREIGN KEY([RealEstateID])
REFERENCES [dbo].[RealEstates] ([RealEstateID])
GO
ALTER TABLE [dbo].[PostContract] CHECK CONSTRAINT [FK_tblPostContract_tblRealEstate]
GO
ALTER TABLE [dbo].[PostContract]  WITH CHECK ADD  CONSTRAINT [FK_tblPostContract_tblStaff] FOREIGN KEY([StaffD])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[PostContract] CHECK CONSTRAINT [FK_tblPostContract_tblStaff]
GO
ALTER TABLE [dbo].[RealEstateNews]  WITH CHECK ADD  CONSTRAINT [FK_RealEstateNews_RealEstates] FOREIGN KEY([RealEstateID])
REFERENCES [dbo].[RealEstates] ([RealEstateID])
GO
ALTER TABLE [dbo].[RealEstateNews] CHECK CONSTRAINT [FK_RealEstateNews_RealEstates]
GO
ALTER TABLE [dbo].[RealEstateOwners]  WITH CHECK ADD  CONSTRAINT [FK_RealEstateOwners_RealEstateOwnersType] FOREIGN KEY([RealEstateOwnersID])
REFERENCES [dbo].[RealEstateOwnersType] ([RealEstateOwnersTypeID])
GO
ALTER TABLE [dbo].[RealEstateOwners] CHECK CONSTRAINT [FK_RealEstateOwners_RealEstateOwnersType]
GO
ALTER TABLE [dbo].[RealEstates]  WITH CHECK ADD  CONSTRAINT [FK_RealEstates_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
GO
ALTER TABLE [dbo].[RealEstates] CHECK CONSTRAINT [FK_RealEstates_Region]
GO
ALTER TABLE [dbo].[RealEstates]  WITH CHECK ADD  CONSTRAINT [FK_tblRealEstate_tblCity] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[RealEstates] CHECK CONSTRAINT [FK_tblRealEstate_tblCity]
GO
ALTER TABLE [dbo].[RealEstates]  WITH CHECK ADD  CONSTRAINT [FK_tblRealEstate_tblDistrictID] FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[RealEstates] CHECK CONSTRAINT [FK_tblRealEstate_tblDistrictID]
GO
ALTER TABLE [dbo].[RealEstates]  WITH CHECK ADD  CONSTRAINT [FK_tblRealEstate_tblLocation] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[RealEstates] CHECK CONSTRAINT [FK_tblRealEstate_tblLocation]
GO
ALTER TABLE [dbo].[RealEstates]  WITH CHECK ADD  CONSTRAINT [FK_tblRealEstate_tblRealEstateOwners] FOREIGN KEY([RealEstateOwnersID])
REFERENCES [dbo].[RealEstateOwners] ([RealEstateOwnersID])
GO
ALTER TABLE [dbo].[RealEstates] CHECK CONSTRAINT [FK_tblRealEstate_tblRealEstateOwners]
GO
ALTER TABLE [dbo].[RealEstates]  WITH CHECK ADD  CONSTRAINT [FK_tblRealEstate_tblRealEstateType] FOREIGN KEY([RealEstateTypeID])
REFERENCES [dbo].[RealEstateType] ([RealEstateTypeID])
GO
ALTER TABLE [dbo].[RealEstates] CHECK CONSTRAINT [FK_tblRealEstate_tblRealEstateType]
GO

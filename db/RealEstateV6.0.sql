USE [RealEstate]
GO
/****** Object:  StoredProcedure [dbo].[Advertise_Delete]    Script Date: 6/10/2015 2:09:26 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Advertise_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Advertise_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Advertise_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Advertise_SelectBySub]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Advertise_SelectBySub]
@AdvID int
AS
SELECT * FROM [Advertise]
WHERE ([AdvID] = @AdvID)
order by AdvID
GO
/****** Object:  StoredProcedure [dbo].[Advertise_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Advertise_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Advertise_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Advertise_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Apartment_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Apartment_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Apartment_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
@Lang varchar(10)
As
	Select * From [Apartment] Where Lang = @Lang
GO
/****** Object:  StoredProcedure [dbo].[Apartment_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Apartment_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Apartment_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Apartment_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Apartment_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Banner_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Banner_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Banner_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Banner_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Banner_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Banner_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Banner_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Banner_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Broker_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/28/2015 3:00:28 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Broker_Delete]
	@BrokerID int
As
	Delete [Broker] 
	Where  ([BrokerID]= @BrokerID)
GO
/****** Object:  StoredProcedure [dbo].[Broker_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/28/2015 3:00:27 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Broker_Insert]
	@Name nvarchar(100),
	@Gender nchar(20),
	@About nvarchar(2000),
	@Birthday date,
	@IdentityCard nchar(30),
	@Address nvarchar(400),
	@HomePhone nchar(30),
	@MobiPhone nchar(30),
	@Email nvarchar(200),
	@PropertyNumber int,
	@RealEstateName nvarchar(500)
As
	Insert Into [Broker]
	(
		[Name],
		[Gender],
		[About],
		[Birthday],
		[IdentityCard],
		[Address],
		[HomePhone],
		[MobiPhone],
		[Email],
		[PropertyNumber],
		[RealEstateName]
	)
	Values
	(
		@Name,
		@Gender,
		@About,
		@Birthday,
		@IdentityCard,
		@Address,
		@HomePhone,
		@MobiPhone,
		@Email,
		@PropertyNumber,
		@RealEstateName
	)

GO
/****** Object:  StoredProcedure [dbo].[Broker_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/28/2015 3:00:28 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Broker_SelectAll]
As
	Select * From [Broker]
GO
/****** Object:  StoredProcedure [dbo].[Broker_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/28/2015 3:00:28 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Broker_SelectByID]
	@BrokerID int
As
	Select *  From [Broker]
 	Where  ([BrokerID] = @BrokerID)
GO
/****** Object:  StoredProcedure [dbo].[Broker_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/28/2015 3:00:28 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Broker_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [BrokerID]) As RowNum,*
		From [Broker]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Broker_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/28/2015 3:00:28 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Broker_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Broker]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Broker]'
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
/****** Object:  StoredProcedure [dbo].[Broker_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/28/2015 3:00:28 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Broker_TestByID]
	@BrokerID int,
	@TestID Bit Output
As
	Select [BrokerID] From [Broker]
 	Where  ([BrokerID] = @BrokerID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Broker_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/28/2015 3:00:28 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Broker_Update]
	@BrokerID int,
	@Name nvarchar(100),
	@Gender nchar(20),
	@About nvarchar(2000),
	@Birthday date,
	@IdentityCard nchar(30),
	@Address nvarchar(400),
	@HomePhone nchar(30),
	@MobiPhone nchar(30),
	@Email nvarchar(200),
	@PropertyNumber int,
	@RealEstateName nvarchar(500)
As
	Update [Broker]  Set
		[Name] = @Name,
		[Gender] = @Gender,
		[About] = @About,
		[Birthday] = @Birthday,
		[IdentityCard] = @IdentityCard,
		[Address] = @Address,
		[HomePhone] = @HomePhone,
		[MobiPhone] = @MobiPhone,
		[Email] = @Email,
		[PropertyNumber] = @PropertyNumber,
		[RealEstateName] = @RealEstateName
	Where ([BrokerID] = @BrokerID)
GO
/****** Object:  StoredProcedure [dbo].[Categorys_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Categorys_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Categorys_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Categorys_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Categorys_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Categorys_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Categorys_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Categorys_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[City_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[City_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[City_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[City_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[City_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[City_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[City_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[City_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
	@CityName nvarchar(50),
	@CityID int

AS
UPDATE [City]
SET
	[CityName] = @CityName
WHERE
	[CityID] = @CityID

GO
/****** Object:  StoredProcedure [dbo].[Companys_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:24:20 AM
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
/****** Object:  StoredProcedure [dbo].[Companys_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:23:58 AM
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
/****** Object:  StoredProcedure [dbo].[Companys_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:24:25 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Companys_SelectAll]
As
	Select * From [Companys]
GO
/****** Object:  StoredProcedure [dbo].[Companys_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:24:41 AM
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
/****** Object:  StoredProcedure [dbo].[Companys_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:24:31 AM
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
/****** Object:  StoredProcedure [dbo].[Companys_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:24:36 AM
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
/****** Object:  StoredProcedure [dbo].[Companys_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:24:46 AM
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
/****** Object:  StoredProcedure [dbo].[Companys_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:24:12 AM
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
/****** Object:  StoredProcedure [dbo].[ContractAdvertising_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:51:42 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ContractAdvertising_Delete]
	@ContractAdvertisingID int
As
	Delete [ContractAdvertising] 
	Where  ([ContractAdvertisingID]= @ContractAdvertisingID)
GO
/****** Object:  StoredProcedure [dbo].[ContractAdvertising_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:51:31 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ContractAdvertising_Insert]
	@ContractAdvertisingName nvarchar(100),
	@StaffID int,
	@CompanyID int,
	@BannerID int,
	@CreateDate datetime,
	@Fees money,
	@EndDate datetime,
	@Status bit
As
	Insert Into [ContractAdvertising]
	(
		[ContractAdvertisingName],
		[StaffID],
		[CompanyID],
		[BannerID],
		[CreateDate],
		[Fees],
		[EndDate],
		[Status]
	)
	Values
	(
		@ContractAdvertisingName,
		@StaffID,
		@CompanyID,
		@BannerID,
		@CreateDate,
		@Fees,
		@EndDate,
		@Status
	)
GO
/****** Object:  StoredProcedure [dbo].[ContractAdvertising_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:51:48 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[ContractAdvertising_SelectAll]
As
	Select * From [ContractAdvertising]
GO
/****** Object:  StoredProcedure [dbo].[ContractAdvertising_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:52:06 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ContractAdvertising_SelectByID]
	@ContractAdvertisingID int
As
	Select *  From [ContractAdvertising]
 	Where  ([ContractAdvertisingID] = @ContractAdvertisingID)
GO
/****** Object:  StoredProcedure [dbo].[ContractAdvertising_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:51:54 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ContractAdvertising_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [ContractAdvertisingID]) As RowNum,*
		From [ContractAdvertising]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[ContractAdvertising_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:52:00 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ContractAdvertising_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [ContractAdvertising]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [ContractAdvertising]'
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
/****** Object:  StoredProcedure [dbo].[ContractAdvertising_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:52:11 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ContractAdvertising_TestByID]
	@ContractAdvertisingID int,
	@TestID Bit Output
As
	Select [ContractAdvertisingID] From [ContractAdvertising]
 	Where  ([ContractAdvertisingID] = @ContractAdvertisingID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[ContractAdvertising_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 10:51:37 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[ContractAdvertising_Update]
	@ContractAdvertisingID int,
	@ContractAdvertisingName nvarchar(100),
	@StaffID int,
	@CompanyID int,
	@BannerID int,
	@CreateDate datetime,
	@Fees money,
	@EndDate datetime,
	@Status bit
As
	Update [ContractAdvertising]  Set
		[ContractAdvertisingName] = @ContractAdvertisingName,
		[StaffID] = @StaffID,
		[CompanyID] = @CompanyID,
		[BannerID] = @BannerID,
		[CreateDate] = @CreateDate,
		[Fees] = @Fees,
		[EndDate] = @EndDate,
		[Status] = @Status
	Where ([ContractAdvertisingID] = @ContractAdvertisingID)
GO
/****** Object:  StoredProcedure [dbo].[Controls_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Controls_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Controls_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Controls_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Controls_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Controls_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Controls_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Controls_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Customers_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Customers_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Customers_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Customers_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Customers_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Customers_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Customers_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Customers_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[District_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[District_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[District_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[District_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[District_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[District_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[District_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[District_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Group_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 3:03:07 PM
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
/****** Object:  StoredProcedure [dbo].[Group_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 3:02:54 PM
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
/****** Object:  StoredProcedure [dbo].[Group_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 3:03:13 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Group_SelectAll]
As
	Select * From [Group]
GO
/****** Object:  StoredProcedure [dbo].[Group_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 3:03:40 PM
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
/****** Object:  StoredProcedure [dbo].[Group_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 3:03:18 PM
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
/****** Object:  StoredProcedure [dbo].[Group_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 3:03:31 PM
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
/****** Object:  StoredProcedure [dbo].[Group_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 3:03:51 PM
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
/****** Object:  StoredProcedure [dbo].[Group_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/26/2015 3:03:00 PM
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
/****** Object:  StoredProcedure [dbo].[Home_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 12:32:03 AM
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
/****** Object:  StoredProcedure [dbo].[Home_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 12:32:03 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Home_Insert]
	@HomeTypeID int,
	@RealEstateOwnersID int,
	@RealEstateID int,
	@CityID int,
	@DistrictID int,
	@LocationID int,
	@RealEstateOwnersName nvarchar(200),
	@Title nvarchar(500),
	@Name nvarchar(500),
	@TransactionType nvarchar(100),
	@Description nvarchar(3000),
	@Address text,
	@Tag nvarchar(512),
	@Price float,
	@TotalArea float,
	@FloorArea float,
	@GargenArea float,
	@HomeArea float,
	@BedroomNumber tinyint,
	@CreateBy nvarchar(100),
	@CreateDate date,
	@TierNumber tinyint,
	@Image1 nvarchar(500),
	@Image2 nvarchar(500),
	@Image3 nvarchar(500),
	@Image4 nvarchar(500),
	@Image5 nvarchar(500),
	@Image6 nvarchar(500)
As
	Insert Into [Home]
	(
		[HomeTypeID],
		[RealEstateOwnersID],
		[RealEstateID],
		[CityID],
		[DistrictID],
		[LocationID],
		[RealEstateOwnersName],
		[Title],
		[Name],
		[TransactionType],
		[Description],
		[Address],
		[Tag],
		[Price],
		[TotalArea],
		[FloorArea],
		[GargenArea],
		[HomeArea],
		[BedroomNumber],
		[CreateBy],
		[CreateDate],
		[TierNumber],
		[Image1],
		[Image2],
		[Image3],
		[Image4],
		[Image5],
		[Image6]
	)
	Values
	(
		@HomeTypeID,
		@RealEstateOwnersID,
		@RealEstateID,
		@CityID,
		@DistrictID,
		@LocationID,
		@RealEstateOwnersName,
		@Title,
		@Name,
		@TransactionType,
		@Description,
		@Address,
		@Tag,
		@Price,
		@TotalArea,
		@FloorArea,
		@GargenArea,
		@HomeArea,
		@BedroomNumber,
		@CreateBy,
		@CreateDate,
		@TierNumber,
		@Image1,
		@Image2,
		@Image3,
		@Image4,
		@Image5,
		@Image6
	)
	Select Scope_Identity()
GO
/****** Object:  StoredProcedure [dbo].[Home_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 12:32:04 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Home_SelectAll]
As
	Select * From [Home]
GO
/****** Object:  StoredProcedure [dbo].[Home_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 12:32:04 AM
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
/****** Object:  StoredProcedure [dbo].[Home_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 12:32:04 AM
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
/****** Object:  StoredProcedure [dbo].[Home_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 12:32:04 AM
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
/****** Object:  StoredProcedure [dbo].[Home_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 12:32:04 AM
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
/****** Object:  StoredProcedure [dbo].[Home_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 12:32:03 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Home_Update]
	@HomeID int,
	@HomeTypeID int,
	@RealEstateOwnersID int,
	@RealEstateID int,
	@CityID int,
	@DistrictID int,
	@LocationID int,
	@RealEstateOwnersName nvarchar(200),
	@Title nvarchar(500),
	@Name nvarchar(500),
	@TransactionType nvarchar(100),
	@Description text,
	@Address nvarchar(500),
	@Tag nvarchar(512),
	@Price float,
	@TotalArea float,
	@FloorArea float,
	@GargenArea float,
	@HomeArea float,
	@BedroomNumber tinyint,
	@CreateBy nvarchar(100),
	@CreateDate date,
	@TierNumber tinyint,
	@Image1 nvarchar(500),
	@Image2 nvarchar(500),
	@Image3 nvarchar(500),
	@Image4 nvarchar(500),
	@Image5 nvarchar(500),
	@Image6 nvarchar(500)
As
	Update [Home]  Set
		[HomeTypeID] = @HomeTypeID,
		[RealEstateOwnersID] = @RealEstateOwnersID,
		[RealEstateID] = @RealEstateID,
		[CityID] = @CityID,
		[DistrictID] = @DistrictID,
		[LocationID] = @LocationID,
		[RealEstateOwnersName] = @RealEstateOwnersName,
		[Title] = @Title,
		[Name] = @Name,
		[TransactionType] = @TransactionType,
		[Description] = @Description,
		[Address] = @Address,
		[Tag] = @Tag,
		[Price] = @Price,
		[TotalArea] = @TotalArea,
		[FloorArea] = @FloorArea,
		[GargenArea] = @GargenArea,
		[HomeArea] = @HomeArea,
		[BedroomNumber] = @BedroomNumber,
		[CreateBy] = @CreateBy,
		[CreateDate] = @CreateDate,
		[TierNumber] = @TierNumber,
		[Image1] = @Image1,
		[Image2] = @Image2,
		[Image3] = @Image3,
		[Image4] = @Image4,
		[Image5] = @Image5,
		[Image6] = @Image6
	Where ([HomeID] = @HomeID)
GO
/****** Object:  StoredProcedure [dbo].[HomeType_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HomeType_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HomeType_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HomeType_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HomeType_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HomeType_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HomeType_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HomeType_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Land_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 12:17:32 AM
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
/****** Object:  StoredProcedure [dbo].[Land_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 12:17:32 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Land_Insert]
	@LandTypeID int,
	@RealEstateOwnersID int,
	@RealEstateID int,
	@CityID int,
	@DistrictID int,
	@LocationID int,
	@Title nvarchar(500),
	@Name nvarchar(500),
	@TransactionType nvarchar(100),
	@Description nvarchar(500),
	@Address nvarchar(500),
	@Tag nvarchar(500),
	@Price float,
	@TotalArea float,
	@CreateBy nvarchar(100),
	@CreateDate date,
	@Image1 nvarchar(500),
	@Image2 nvarchar(500),
	@Image3 nvarchar(500),
	@Image4 nvarchar(500),
	@Image5 nvarchar(500),
	@Image6 nvarchar(500)
As
	Insert Into [Land]
	(
		[LandTypeID],
		[RealEstateOwnersID],
		[RealEstateID],
		[CityID],
		[DistrictID],
		[LocationID],
		[Title],
		[Name],
		[TransactionType],
		[Description],
		[Address],
		[Tag],
		[Price],
		[TotalArea],
		[CreateBy],
		[CreateDate],
		[Image1],
		[Image2],
		[Image3],
		[Image4],
		[Image5],
		[Image6]
	)
	Values
	(
		@LandTypeID,
		@RealEstateOwnersID,
		@RealEstateID,
		@CityID,
		@DistrictID,
		@LocationID,
		@Title,
		@Name,
		@TransactionType,
		@Description,
		@Address,
		@Tag,
		@Price,
		@TotalArea,
		@CreateBy,
		@CreateDate,
		@Image1,
		@Image2,
		@Image3,
		@Image4,
		@Image5,
		@Image6
	)

GO
/****** Object:  StoredProcedure [dbo].[Land_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 12:17:32 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Land_SelectAll]
As
	Select * From [Land]
GO
/****** Object:  StoredProcedure [dbo].[Land_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 12:17:33 AM
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
/****** Object:  StoredProcedure [dbo].[Land_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 12:17:32 AM
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
/****** Object:  StoredProcedure [dbo].[Land_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 12:17:32 AM
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
/****** Object:  StoredProcedure [dbo].[Land_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 12:17:33 AM
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
/****** Object:  StoredProcedure [dbo].[Land_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 12:17:32 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Land_Update]
	@LandID int,
	@LandTypeID int,
	@RealEstateOwnersID int,
	@RealEstateID int,
	@CityID int,
	@DistrictID int,
	@LocationID int,
	@Title nvarchar(500),
	@Name nvarchar(500),
	@TransactionType nvarchar(100),
	@Description nvarchar(500),
	@Address nvarchar(500),
	@Tag nvarchar(500),
	@Price float,
	@TotalArea float,
	@CreateBy nvarchar(100),
	@CreateDate date,
	@Image1 nvarchar(500),
	@Image2 nvarchar(500),
	@Image3 nvarchar(500),
	@Image4 nvarchar(500),
	@Image5 nvarchar(500),
	@Image6 nvarchar(500)
As
	Update [Land]  Set
		[LandTypeID] = @LandTypeID,
		[RealEstateOwnersID] = @RealEstateOwnersID,
		[RealEstateID] = @RealEstateID,
		[CityID] = @CityID,
		[DistrictID] = @DistrictID,
		[LocationID] = @LocationID,
		[Title] = @Title,
		[Name] = @Name,
		[TransactionType] = @TransactionType,
		[Description] = @Description,
		[Address] = @Address,
		[Tag] = @Tag,
		[Price] = @Price,
		[TotalArea] = @TotalArea,
		[CreateBy] = @CreateBy,
		[CreateDate] = @CreateDate,
		[Image1] = @Image1,
		[Image2] = @Image2,
		[Image3] = @Image3,
		[Image4] = @Image4,
		[Image5] = @Image5,
		[Image6] = @Image6
	Where ([LandID] = @LandID)
GO
/****** Object:  StoredProcedure [dbo].[LandType_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LandType_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LandType_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LandType_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LandType_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LandType_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LandType_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LandType_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Links_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/2/2015 1:13:50 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Links_Delete]
	@ID int
As
	Delete [Links] 
	Where  ([ID]= @ID)
GO
/****** Object:  StoredProcedure [dbo].[Links_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/2/2015 1:13:49 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Links_Insert]
	@Name nvarchar(500),
	@Line1 nvarchar(500),
	@Line2 nvarchar(500),
	@Link1 nvarchar(1000),
	@Link2 nvarchar(1000),
	@Position int,
	@Ord int,
	@Active int,
	@Lang nchar(20)
As
	Insert Into [Links]
	(
		[Name],
		[Line1],
		[Line2],
		[Link1],
		[Link2],
		[Position],
		[Ord],
		[Active],
		[Lang]
	)
	Values
	(
		@Name,
		@Line1,
		@Line2,
		@Link1,
		@Link2,
		@Position,
		@Ord,
		@Active,
		@Lang
	)

GO
/****** Object:  StoredProcedure [dbo].[Links_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/2/2015 1:13:50 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Links_SelectAll]
@Lang varchar(5)
As
	Select * From [Links] where Lang = @Lang
GO
/****** Object:  StoredProcedure [dbo].[Links_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/2/2015 1:13:51 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Links_SelectByID]
	@ID int
As
	Select *  From [Links]
 	Where  ([ID] = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Links_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/2/2015 1:13:50 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Links_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [ID]) As RowNum,*
		From [Links]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Links_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/2/2015 1:13:51 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Links_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Links]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Links]'
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
/****** Object:  StoredProcedure [dbo].[Links_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/2/2015 1:13:51 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Links_TestByID]
	@ID int,
	@TestID Bit Output
As
	Select [ID] From [Links]
 	Where  ([ID] = @ID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Links_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/2/2015 1:13:50 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Links_Update]
	@ID int,
	@Name nvarchar(500),
	@Line1 nvarchar(500),
	@Line2 nvarchar(500),
	@Link1 nvarchar(1000),
	@Link2 nvarchar(1000),
	@Position int,
	@Ord int,
	@Active int,
	@Lang nchar(20)
As
	Update [Links]  Set
		[Name] = @Name,
		[Line1] = @Line1,
		[Line2] = @Line2,
		[Link1] = @Link1,
		[Link2] = @Link2,
		[Position] = @Position,
		[Ord] = @Ord,
		[Active] = @Active,
		[Lang] = @Lang
	Where ([ID] = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Location_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Location_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Location_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Location_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Location_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Location_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Location_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Location_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Menus_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Menus_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Menus_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Menus_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Menus_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Menus_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Menus_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Menus_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Motel_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 1:33:27 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Motel_Delete]
	@MotelID int
As
	Delete [Motel] 
	Where  ([MotelID]= @MotelID)
GO
/****** Object:  StoredProcedure [dbo].[Motel_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 1:32:47 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Motel_Insert]
	@RealEstateOwnersID int,
	@RealEstateID int,
	@MotelTypeID int,
	@CityID int,
	@DistrictID int,
	@LocationID int,
	@Tag nvarchar(1000),
	@RealEstateOwnersName nvarchar(200),
	@Title nvarchar(2000),
	@Name nvarchar(1000),
	@Description nvarchar(MAX),
	@Address nvarchar(500),
	@Price float,
	@TotalArea float,
	@IsClosed bit,
	@IsCooker bit,
	@Furniture nvarchar(100),
	@TierNumber tinyint,
	@CreateBy nvarchar(100),
	@CreateDate date,
	@Image1 nvarchar(500),
	@Image2 nvarchar(500),
	@Image3 nvarchar(500),
	@Image4 nvarchar(500),
	@Image5 nvarchar(500),
	@Image6 nvarchar(500)
As
	Insert Into [Motel]
	(
		[RealEstateOwnersID],
		[RealEstateID],
		[MotelTypeID],
		[CityID],
		[DistrictID],
		[LocationID],
		[Tag],
		[RealEstateOwnersName],
		[Title],
		[Name],
		[Description],
		[Address],
		[Price],
		[TotalArea],
		[IsClosed],
		[IsCooker],
		[Furniture],
		[TierNumber],
		[CreateBy],
		[CreateDate],
		[Image1],
		[Image2],
		[Image3],
		[Image4],
		[Image5],
		[Image6]
	)
	Values
	(
		@RealEstateOwnersID,
		@RealEstateID,
		@MotelTypeID,
		@CityID,
		@DistrictID,
		@LocationID,
		@Tag,
		@RealEstateOwnersName,
		@Title,
		@Name,
		@Description,
		@Address,
		@Price,
		@TotalArea,
		@IsClosed,
		@IsCooker,
		@Furniture,
		@TierNumber,
		@CreateBy,
		@CreateDate,
		@Image1,
		@Image2,
		@Image3,
		@Image4,
		@Image5,
		@Image6
	)
	Select Scope_Identity()
GO
/****** Object:  StoredProcedure [dbo].[Motel_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 1:33:33 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Motel_SelectAll]
As
	Select * From [Motel]
GO
/****** Object:  StoredProcedure [dbo].[Motel_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 1:33:57 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Motel_SelectByID]
	@MotelID int
As
	Select *  From [Motel]
 	Where  ([MotelID] = @MotelID)
GO
/****** Object:  StoredProcedure [dbo].[Motel_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 1:33:42 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Motel_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [MotelID]) As RowNum,*
		From [Motel]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Motel_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 1:33:52 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Motel_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Motel]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Motel]'
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
/****** Object:  StoredProcedure [dbo].[Motel_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 1:34:08 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Motel_TestByID]
	@MotelID int,
	@TestID Bit Output
As
	Select [MotelID] From [Motel]
 	Where  ([MotelID] = @MotelID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Motel_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/10/2015 1:33:13 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Motel_Update]
	@MotelID int,
	@RealEstateOwnersID int,
	@RealEstateID int,
	@MotelTypeID int,
	@CityID int,
	@DistrictID int,
	@LocationID int,
	@Tag nvarchar(1000),
	@RealEstateOwnersName nvarchar(200),
	@Title nvarchar(2000),
	@Name nvarchar(1000),
	@Description nvarchar(MAX),
	@Address nvarchar(500),
	@Price float,
	@TotalArea float,
	@IsClosed bit,
	@IsCooker bit,
	@Furniture nvarchar(100),
	@TierNumber tinyint,
	@CreateBy nvarchar(100),
	@CreateDate date,
	@Image1 nvarchar(500),
	@Image2 nvarchar(500),
	@Image3 nvarchar(500),
	@Image4 nvarchar(500),
	@Image5 nvarchar(500),
	@Image6 nvarchar(500)
As
	Update [Motel]  Set
		[RealEstateOwnersID] = @RealEstateOwnersID,
		[RealEstateID] = @RealEstateID,
		[MotelTypeID] = @MotelTypeID,
		[CityID] = @CityID,
		[DistrictID] = @DistrictID,
		[LocationID] = @LocationID,
		[Tag] = @Tag,
		[RealEstateOwnersName] = @RealEstateOwnersName,
		[Title] = @Title,
		[Name] = @Name,
		[Description] = @Description,
		[Address] = @Address,
		[Price] = @Price,
		[TotalArea] = @TotalArea,
		[IsClosed] = @IsClosed,
		[IsCooker] = @IsCooker,
		[Furniture] = @Furniture,
		[TierNumber] = @TierNumber,
		[CreateBy] = @CreateBy,
		[CreateDate] = @CreateDate,
		[Image1] = @Image1,
		[Image2] = @Image2,
		[Image3] = @Image3,
		[Image4] = @Image4,
		[Image5] = @Image5,
		[Image6] = @Image6
	Where ([MotelID] = @MotelID)
GO
/****** Object:  StoredProcedure [dbo].[MotelType_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MotelType_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MotelType_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MotelType_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MotelType_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MotelType_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MotelType_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MotelType_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Pages_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/29/2015 2:02:02 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Pages_Delete]
	@PageID int
As
	Delete [Pages] 
	Where  ([PageID]= @PageID)
GO
/****** Object:  StoredProcedure [dbo].[Pages_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/29/2015 2:00:49 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Pages_Insert]
	@Name nvarchar(200),
	@Tag nvarchar(510),
	@Content nvarchar(MAX),
	@Detail nvarchar(500),
	@Level int,
	@Title nvarchar(200),
	@Description nvarchar(1000),
	@Keyword nvarchar(1000),
	@Type nvarchar(100),
	@Link nvarchar(400),
	@Taget nvarchar(200),
	@Index int,
	@Position int,
	@Active int,
	@Ord int,
	@Lang varchar(5)
As
	Insert Into [Pages]
	(
		[Name],
		[Tag],
		[Content],
		[Detail],
		[Level],
		[Title],
		[Description],
		[Keyword],
		[Type],
		[Link],
		[Taget],
		[Index],
		[Position],
		[Active],
		[Ord],
		[Lang]
	)
	Values
	(
		@Name,
		@Tag,
		@Content,
		@Detail,
		@Level,
		@Title,
		@Description,
		@Keyword,
		@Type,
		@Link,
		@Taget,
		@Index,
		@Position,
		@Active,
		@Ord,
		@Lang
	)
GO
/****** Object:  StoredProcedure [dbo].[Pages_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/29/2015 2:02:09 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Pages_SelectAll]
@Lang varchar(10)
As
	Select * From [Pages] where Lang = @Lang
GO
/****** Object:  StoredProcedure [dbo].[Pages_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/29/2015 2:02:32 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Pages_SelectByID]
	@PageID int
As
	Select *  From [Pages]
 	Where  ([PageID] = @PageID)
GO
/****** Object:  StoredProcedure [dbo].[Pages_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/29/2015 2:02:15 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Pages_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [PageID]) As RowNum,*
		From [Pages]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[Pages_SelectSub]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Pages_SelectSub]
@Level varchar(100)
as
    select * from [Pages]
	where len(Level) > len(@Level) and left(Level, len(@Level)) = @Level
	order by Level
GO
/****** Object:  StoredProcedure [dbo].[Pages_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/29/2015 2:02:24 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Pages_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [Pages]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [Pages]'
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
/****** Object:  StoredProcedure [dbo].[Pages_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/29/2015 2:02:38 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Pages_TestByID]
	@PageID int,
	@TestID Bit Output
As
	Select [PageID] From [Pages]
 	Where  ([PageID] = @PageID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Pages_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/29/2015 2:01:50 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Pages_Update]
	@PageID int,
	@Name nvarchar(200),
	@Tag nvarchar(510),
	@Content nvarchar(MAX),
	@Detail nvarchar(500),
	@Level int,
	@Title nvarchar(200),
	@Description nvarchar(1000),
	@Keyword nvarchar(1000),
	@Type nvarchar(100),
	@Link nvarchar(400),
	@Taget nvarchar(200),
	@Index int,
	@Position int,
	@Active int,
	@Ord int,
	@Lang varchar(5)
As
	Update [Pages]  Set
		[Name] = @Name,
		[Tag] = @Tag,
		[Content] = @Content,
		[Detail] = @Detail,
		[Level] = @Level,
		[Title] = @Title,
		[Description] = @Description,
		[Keyword] = @Keyword,
		[Type] = @Type,
		[Link] = @Link,
		[Taget] = @Taget,
		[Index] = @Index,
		[Position] = @Position,
		[Active] = @Active,
		[Ord] = @Ord,
		[Lang] = @Lang
	Where ([PageID] = @PageID)
GO
/****** Object:  StoredProcedure [dbo].[PostContract_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[PostContract_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[PostContract_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[PostContract_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[PostContract_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[PostContract_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[PostContract_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[PostContract_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ProductType_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ProductType_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ProductType_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ProductType_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ProductType_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ProductType_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ProductType_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ProductType_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RealEstateNews_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/26/2015 11:57:47 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateNews_Delete]
	@RealEstateNewsID int
As
	Delete [RealEstateNews] 
	Where  ([RealEstateNewsID]= @RealEstateNewsID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateNews_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/26/2015 11:56:54 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateNews_Insert]
	@RealEstateNewsID int,
	@RealEstateID int,
	@Title nvarchar(400),
	@Description nvarchar(MAX),
	@Content nvarchar(MAX),
	@CategoryID int,
	@Images nvarchar(500),
	@CreateDate datetime,
	@CreateBy nvarchar(100),
	@Position int,
	@Source nvarchar(400),
	@Lang varchar(5)
As
	Insert Into [RealEstateNews]
	(
		[RealEstateNewsID],
		[RealEstateID],
		[Title],
		[Description],
		[Content],
		[CategoryID],
		[Images],
		[CreateDate],
		[CreateBy],
		[Position],
		[Source],
		[Lang]
	)
	Values
	(
		@RealEstateNewsID,
		@RealEstateID,
		@Title,
		@Description,
		@Content,
		@CategoryID,
		@Images,
		@CreateDate,
		@CreateBy,
		@Position,
		@Source,
		@Lang
	)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateNews_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/26/2015 11:57:53 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[RealEstateNews_SelectAll]
As
	Select * From [RealEstateNews]
GO
/****** Object:  StoredProcedure [dbo].[RealEstateNews_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/26/2015 11:58:14 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateNews_SelectByID]
	@RealEstateNewsID int
As
	Select *  From [RealEstateNews]
 	Where  ([RealEstateNewsID] = @RealEstateNewsID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateNews_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/26/2015 11:58:01 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

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
/****** Object:  StoredProcedure [dbo].[RealEstateNews_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/26/2015 11:58:06 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

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
/****** Object:  StoredProcedure [dbo].[RealEstateNews_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/26/2015 11:58:23 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateNews_TestByID]
	@RealEstateNewsID int,
	@TestID Bit Output
As
	Select [RealEstateNewsID] From [RealEstateNews]
 	Where  ([RealEstateNewsID] = @RealEstateNewsID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[RealEstateNews_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/26/2015 11:57:30 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateNews_Update]
	@RealEstateNewsID int,
	@RealEstateID int,
	@Title nvarchar(400),
	@Description nvarchar(MAX),
	@Content nvarchar(MAX),
	@CategoryID int,
	@Images nvarchar(500),
	@CreateDate datetime,
	@CreateBy nvarchar(100),
	@Position int,
	@Source nvarchar(400),
	@Lang varchar(5)
As
	Update [RealEstateNews]  Set
		[RealEstateID] = @RealEstateID,
		[Title] = @Title,
		[Description] = @Description,
		[Content] = @Content,
		[CategoryID] = @CategoryID,
		[Images] = @Images,
		[CreateDate] = @CreateDate,
		[CreateBy] = @CreateBy,
		[Position] = @Position,
		[Source] = @Source,
		[Lang] = @Lang
	Where ([RealEstateNewsID] = @RealEstateNewsID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/9/2015 10:05:26 PM
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
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/9/2015 10:05:26 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwners_Insert]
	@RealEstateOwnersName nvarchar(200),
	@CLUR nvarchar(20),
	@RealEstateOwnersType nvarchar(100),
	@Address nvarchar(400),
	@MobilePhone nchar(30),
	@Email nvarchar(200),
	@Gender nvarchar(20),
	@IdentityCard nchar(30)
As
	Insert Into [RealEstateOwners]
	(
		[RealEstateOwnersName],
		[CLUR],
		[RealEstateOwnersType],
		[Address],
		[MobilePhone],
		[Email],
		[Gender],
		[IdentityCard]
	)
	Values
	(
		@RealEstateOwnersName,
		@CLUR,
		@RealEstateOwnersType,
		@Address,
		@MobilePhone,
		@Email,
		@Gender,
		@IdentityCard
	)
	Select Scope_Identity()
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/9/2015 10:05:26 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[RealEstateOwners_SelectAll]
As
	Select * From [RealEstateOwners]
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/9/2015 10:05:27 PM
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
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/9/2015 10:05:26 PM
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
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/9/2015 10:05:27 PM
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
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/9/2015 10:05:27 PM
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
/****** Object:  StoredProcedure [dbo].[RealEstateOwners_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 6/9/2015 10:05:26 PM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateOwners_Update]
	@RealEstateOwnersID int,
	@RealEstateOwnersName nvarchar(200),
	@CLUR nvarchar(20),
	@RealEstateOwnersType nvarchar(100),
	@Address nvarchar(400),
	@MobilePhone nchar(30),
	@Email nvarchar(200),
	@Gender nvarchar(20),
	@IdentityCard nchar(30)
As
	Update [RealEstateOwners]  Set
		[RealEstateOwnersName] = @RealEstateOwnersName,
		[CLUR] = @CLUR,
		[RealEstateOwnersType] = @RealEstateOwnersType,
		[Address] = @Address,
		[MobilePhone] = @MobilePhone,
		[Email] = @Email,
		[Gender] = @Gender,
		[IdentityCard] = @IdentityCard
	Where ([RealEstateOwnersID] = @RealEstateOwnersID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RealEstateOwnersType_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RealEstates_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 4:00:10 AM
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
/****** Object:  StoredProcedure [dbo].[RealEstates_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 4:00:10 AM
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
	@CategoryID int,
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
	@Lang varchar(5),
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
		[CategoryID],
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
		[Lang],
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
		@CategoryID,
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
		@Lang,
		@Status,
		@IsVip,
		@Period
	)

GO
/****** Object:  StoredProcedure [dbo].[RealEstates_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 4:00:10 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[RealEstates_SelectAll]
As
	Select * From [RealEstates]
GO
/****** Object:  StoredProcedure [dbo].[RealEstates_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 4:00:10 AM
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
/****** Object:  StoredProcedure [dbo].[RealEstates_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 4:00:10 AM
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
/****** Object:  StoredProcedure [dbo].[RealEstates_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 4:00:10 AM
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
/****** Object:  StoredProcedure [dbo].[RealEstates_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 4:00:10 AM
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
/****** Object:  StoredProcedure [dbo].[RealEstates_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/31/2015 4:00:10 AM
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
	@CategoryID int,
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
	@Lang varchar(5),
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
		[CategoryID] = @CategoryID,
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
		[Lang] = @Lang,
		[Status] = @Status,
		[IsVip] = @IsVip,
		[Period] = @Period
	Where ([RealEstateID] = @RealEstateID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateType_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/29/2015 3:13:55 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateType_Delete]
	@RealEstateTypeID int
As
	Delete [RealEstateType] 
	Where  ([RealEstateTypeID]= @RealEstateTypeID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateType_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/29/2015 3:13:55 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateType_Insert]
	@RealEstateTypeID int,
	@NameRealEstateType nvarchar(200),
	@Description nvarchar(500)
As
	Insert Into [RealEstateType]
	(
		[RealEstateTypeID],
		[NameRealEstateType],
		[Description]
	)
	Values
	(
		@RealEstateTypeID,
		@NameRealEstateType,
		@Description
	)

GO
/****** Object:  StoredProcedure [dbo].[RealEstateType_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/29/2015 3:13:55 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[RealEstateType_SelectAll]
As
	Select * From [RealEstateType]
GO
/****** Object:  StoredProcedure [dbo].[RealEstateType_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/29/2015 3:13:55 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateType_SelectByID]
	@RealEstateTypeID int
As
	Select *  From [RealEstateType]
 	Where  ([RealEstateTypeID] = @RealEstateTypeID)
GO
/****** Object:  StoredProcedure [dbo].[RealEstateType_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/29/2015 3:13:55 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateType_SelectPage]
	@CurrentPage int,
	@PageSize int,
	@RowCount int output
As
	With TablePaging As
	(
		 Select ROW_NUMBER()
		Over(Order By [RealEstateTypeID]) As RowNum,*
		From [RealEstateType]
	)
	Select @RowCount = Count(RowNum) from  TablePaging
	Select * From TablePaging
	Where RowNum Between (@CurrentPage - 1) * @PageSize + 1 And @CurrentPage * @PageSize
	Order By RowNum
GO
/****** Object:  StoredProcedure [dbo].[RealEstateType_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/29/2015 3:13:55 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateType_SelectTop]
	@Top	Nvarchar(10),
	@Where	Nvarchar(200),
	@Order	Nvarchar(200)
AS
	Declare @SQL Nvarchar(500)
	Set @SQL = 'Select Top (' + @Top + ') * From [RealEstateType]'
	if Len(@Top) = 0
		Begin
			Set @SQL = 'Select * From [RealEstateType]'
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
/****** Object:  StoredProcedure [dbo].[RealEstateType_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/29/2015 3:13:55 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateType_TestByID]
	@RealEstateTypeID int,
	@TestID Bit Output
As
	Select [RealEstateTypeID] From [RealEstateType]
 	Where  ([RealEstateTypeID] = @RealEstateTypeID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[RealEstateType_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 5/29/2015 3:13:55 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[RealEstateType_Update]
	@RealEstateTypeID int,
	@NameRealEstateType nvarchar(200),
	@Description nvarchar(500)
As
	Update [RealEstateType]  Set
		[NameRealEstateType] = @NameRealEstateType,
		[Description] = @Description
	Where ([RealEstateTypeID] = @RealEstateTypeID)
GO
/****** Object:  StoredProcedure [dbo].[Region_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Region_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Region_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Region_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Region_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Region_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Region_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Region_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_User_CheckLogin]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_User_CheckLogin]
@UserName nvarchar(250),
@PassWord nvarchar(250)

as
select * from [User] WHERE Username = @UserName and [Password] = @PassWord

GO
/****** Object:  StoredProcedure [dbo].[sp_User_GetByAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_GetByAll]
As
	Select * From [User]
GO
/****** Object:  StoredProcedure [dbo].[sproc_Advertise_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Advertise_Add*/
CREATE PROCEDURE [dbo].[sproc_Advertise_Add]
	@AdvID int OUTPUT
	,@AdvName nvarchar(150)
	,@Image nvarchar(255)
	,@Width int
	,@Height int
	,@Link nvarchar(255)
	,@Target varchar(10)
	,@Content ntext
	,@Position smallint
	,@PageID int
	,@Click int
	,@Ord int
	,@Active bit
	,@Lang varchar(5)

AS

	INSERT INTO [Advertise]
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
	VALUES
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
/****** Object:  StoredProcedure [dbo].[sproc_Advertise_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Advertise_Delete*/
CREATE PROCEDURE [dbo].[sproc_Advertise_Delete]
	@AdvID int
AS
DELETE
FROM
	[Advertise]
WHERE
	[AdvID] = @AdvID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Advertise_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Advertise_Get*/
CREATE PROCEDURE [dbo].[sproc_Advertise_Get]
AS
SELECT
	--[AdvID],
	--[AdvName],
	--[Image],
	--[Width],
	--[Height],
	--[Link],
	--[Target],
	--[Content],
	--[Position],
	--[PageID],
	--[Click],
	--[Ord],
	--[Active],
	--[Lang]

*
FROM
	[Advertise]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Advertise_GetByAdvID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Advertise_GetByAdvID*/
CREATE PROCEDURE [dbo].[sproc_Advertise_GetByAdvID]
@AdvID int
AS
SELECT
	--[AdvID],
	--[AdvName],
	--[Image],
	--[Width],
	--[Height],
	--[Link],
	--[Target],
	--[Content],
	--[Position],
	--[PageID],
	--[Click],
	--[Ord],
	--[Active],
	--[Lang]

*
FROM
	[Advertise]
WHERE
	[AdvID] = @AdvID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Advertise_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Advertise_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Advertise_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Advertise]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Advertise_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Advertise_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Advertise_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [AdvID]
FROM [Advertise]


-- query out
SELECT *
FROM [Advertise]
WHERE [AdvID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Advertise_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Advertise_Update*/
CREATE PROCEDURE [dbo].[sproc_Advertise_Update]
	@AdvName nvarchar(150),
	@Image nvarchar(255),
	@Width int,
	@Height int,
	@Link nvarchar(255),
	@Target varchar(10),
	@Content ntext,
	@Position smallint,
	@PageID int,
	@Click int,
	@Ord int,
	@Active bit,
	@Lang varchar(5),
	@AdvID int

AS
UPDATE [Advertise]
SET
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
WHERE
	[AdvID] = @AdvID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Apartment_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Apartment_Add*/
CREATE PROCEDURE [dbo].[sproc_Apartment_Add]
	@ApartmentID int OUTPUT
	,@RealEstateOwnersID int
	,@RealEstateOwnersTypeID int
	,@RealEstateID int
	,@Description nvarchar(250)
	,@Address nvarchar(250)
	,@Price float(8)
	,@TotalArea float(8)
	,@FloorArea float(8)
	,@GargenArea float(8)
	,@HomeArea float(8)
	,@RoomNumber tinyint
	,@TierNumber tinyint
	,@Image1 nvarchar(250)
	,@Image2 nvarchar(250)
	,@Image3 nvarchar(250)

AS

	INSERT INTO [Apartment]
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
	VALUES
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
	SELECT
		@ApartmentID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Apartment_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Apartment_Delete*/
CREATE PROCEDURE [dbo].[sproc_Apartment_Delete]
	@ApartmentID int
AS
DELETE
FROM
	[Apartment]
WHERE
	[ApartmentID] = @ApartmentID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Apartment_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Apartment_Get*/
CREATE PROCEDURE [dbo].[sproc_Apartment_Get]
AS
SELECT
	--[ApartmentID],
	--[RealEstateOwnersID],
	--[RealEstateOwnersTypeID],
	--[RealEstateID],
	--[Description],
	--[Address],
	--[Price],
	--[TotalArea],
	--[FloorArea],
	--[GargenArea],
	--[HomeArea],
	--[RoomNumber],
	--[TierNumber],
	--[Image1],
	--[Image2],
	--[Image3]

*
FROM
	[Apartment]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Apartment_GetByApartmentID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Apartment_GetByApartmentID*/
CREATE PROCEDURE [dbo].[sproc_Apartment_GetByApartmentID]
@ApartmentID int
AS
SELECT
	--[ApartmentID],
	--[RealEstateOwnersID],
	--[RealEstateOwnersTypeID],
	--[RealEstateID],
	--[Description],
	--[Address],
	--[Price],
	--[TotalArea],
	--[FloorArea],
	--[GargenArea],
	--[HomeArea],
	--[RoomNumber],
	--[TierNumber],
	--[Image1],
	--[Image2],
	--[Image3]

*
FROM
	[Apartment]
WHERE
	[ApartmentID] = @ApartmentID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Apartment_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Apartment_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Apartment_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Apartment]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Apartment_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Apartment_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Apartment_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [ApartmentID]
FROM [Apartment]


-- query out
SELECT *
FROM [Apartment]
WHERE [ApartmentID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Apartment_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Apartment_Update*/
CREATE PROCEDURE [dbo].[sproc_Apartment_Update]
	@RealEstateOwnersID int,
	@RealEstateOwnersTypeID int,
	@RealEstateID int,
	@Description nvarchar(250),
	@Address nvarchar(250),
	@Price float(8),
	@TotalArea float(8),
	@FloorArea float(8),
	@GargenArea float(8),
	@HomeArea float(8),
	@RoomNumber tinyint,
	@TierNumber tinyint,
	@Image1 nvarchar(250),
	@Image2 nvarchar(250),
	@Image3 nvarchar(250),
	@ApartmentID int

AS
UPDATE [Apartment]
SET
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
WHERE
	[ApartmentID] = @ApartmentID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Banner_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Banner_Add*/
CREATE PROCEDURE [dbo].[sproc_Banner_Add]
	@BannerID int OUTPUT
	,@BannerType nvarchar(50)
	,@Size nchar(15)
	,@Description nvarchar(250)
	,@Images nvarchar(250)

AS

	INSERT INTO [Banner]
	(
		[BannerType],
		[Size],
		[Description],
		[Images]
	)
	VALUES
	(
		@BannerType,
		@Size,
		@Description,
		@Images
	)
	SELECT
		@BannerID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Banner_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Banner_Delete*/
CREATE PROCEDURE [dbo].[sproc_Banner_Delete]
	@BannerID int
AS
DELETE
FROM
	[Banner]
WHERE
	[BannerID] = @BannerID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Banner_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Banner_Get*/
CREATE PROCEDURE [dbo].[sproc_Banner_Get]
AS
SELECT
	--[BannerID],
	--[BannerType],
	--[Size],
	--[Description],
	--[Images]

*
FROM
	[Banner]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Banner_GetByBannerID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Banner_GetByBannerID*/
CREATE PROCEDURE [dbo].[sproc_Banner_GetByBannerID]
@BannerID int
AS
SELECT
	--[BannerID],
	--[BannerType],
	--[Size],
	--[Description],
	--[Images]

*
FROM
	[Banner]
WHERE
	[BannerID] = @BannerID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Banner_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Banner_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Banner_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Banner]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Banner_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Banner_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Banner_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [BannerID]
FROM [Banner]


-- query out
SELECT *
FROM [Banner]
WHERE [BannerID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Banner_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Banner_Update*/
CREATE PROCEDURE [dbo].[sproc_Banner_Update]
	@BannerType nvarchar(50),
	@Size nchar(15),
	@Description nvarchar(250),
	@Images nvarchar(250),
	@BannerID int

AS
UPDATE [Banner]
SET
	[BannerType] = @BannerType,
	[Size] = @Size,
	[Description] = @Description,
	[Images] = @Images
WHERE
	[BannerID] = @BannerID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Categorys_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Categorys_Add*/
CREATE PROCEDURE [dbo].[sproc_Categorys_Add]
	@CategoryID int OUTPUT
	,@Tag nvarchar(255)
	,@Name nvarchar(255)
	,@Content ntext
	,@Level nvarchar(100)
	,@Priority smallint
	,@Index smallint
	,@Title nvarchar(255)
	,@Description nvarchar(500)
	,@Keyword nvarchar(255)
	,@Active int
	,@Ord int
	,@Lang varchar(5)
	,@Image nvarchar(255)
	,@Image2 nvarchar(255)

AS

	INSERT INTO [Categorys]
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
	VALUES
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
	SELECT
		@CategoryID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Categorys_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Categorys_Delete*/
CREATE PROCEDURE [dbo].[sproc_Categorys_Delete]
	@CategoryID int
AS
DELETE
FROM
	[Categorys]
WHERE
	[CategoryID] = @CategoryID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Categorys_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Categorys_Get*/
CREATE PROCEDURE [dbo].[sproc_Categorys_Get]
AS
SELECT
	--[CategoryID],
	--[Tag],
	--[Name],
	--[Content],
	--[Level],
	--[Priority],
	--[Index],
	--[Title],
	--[Description],
	--[Keyword],
	--[Active],
	--[Ord],
	--[Lang],
	--[Image],
	--[Image2]

*
FROM
	[Categorys]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Categorys_GetByCategoryID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Categorys_GetByCategoryID*/
CREATE PROCEDURE [dbo].[sproc_Categorys_GetByCategoryID]
@CategoryID int
AS
SELECT
	--[CategoryID],
	--[Tag],
	--[Name],
	--[Content],
	--[Level],
	--[Priority],
	--[Index],
	--[Title],
	--[Description],
	--[Keyword],
	--[Active],
	--[Ord],
	--[Lang],
	--[Image],
	--[Image2]

*
FROM
	[Categorys]
WHERE
	[CategoryID] = @CategoryID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Categorys_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Categorys_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Categorys_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Categorys]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Categorys_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Categorys_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Categorys_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [CategoryID]
FROM [Categorys]


-- query out
SELECT *
FROM [Categorys]
WHERE [CategoryID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Categorys_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Categorys_Update*/
CREATE PROCEDURE [dbo].[sproc_Categorys_Update]
	@Tag nvarchar(255),
	@Name nvarchar(255),
	@Content ntext,
	@Level nvarchar(100),
	@Priority smallint,
	@Index smallint,
	@Title nvarchar(255),
	@Description nvarchar(500),
	@Keyword nvarchar(255),
	@Active int,
	@Ord int,
	@Lang varchar(5),
	@Image nvarchar(255),
	@Image2 nvarchar(255),
	@CategoryID int

AS
UPDATE [Categorys]
SET
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
WHERE
	[CategoryID] = @CategoryID

GO
/****** Object:  StoredProcedure [dbo].[sproc_City_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_City_Add*/
CREATE PROCEDURE [dbo].[sproc_City_Add]
	@CityID int OUTPUT
	,@CityName nvarchar(20)

AS

	INSERT INTO [City]
	(
		[CityID],
		[CityName]
	)
	VALUES
	(
		@CityID,
		@CityName
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_City_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_City_Delete*/
CREATE PROCEDURE [dbo].[sproc_City_Delete]
	@CityID int
AS
DELETE
FROM
	[City]
WHERE
	[CityID] = @CityID

GO
/****** Object:  StoredProcedure [dbo].[sproc_City_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_City_Get*/
CREATE PROCEDURE [dbo].[sproc_City_Get]
AS
SELECT
	--[CityID],
	--[CityName]

*
FROM
	[City]

GO
/****** Object:  StoredProcedure [dbo].[sproc_City_GetByCityID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_City_GetByCityID*/
CREATE PROCEDURE [dbo].[sproc_City_GetByCityID]
@CityID int
AS
SELECT
	--[CityID],
	--[CityName]

*
FROM
	[City]
WHERE
	[CityID] = @CityID

GO
/****** Object:  StoredProcedure [dbo].[sproc_City_GetByTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_City_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_City_GetCount*/
CREATE PROCEDURE [dbo].[sproc_City_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[City]

GO
/****** Object:  StoredProcedure [dbo].[sproc_City_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_City_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_City_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [CityID]
FROM [City]


-- query out
SELECT *
FROM [City]
WHERE [CityID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_City_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_City_Update*/
CREATE PROCEDURE [dbo].[sproc_City_Update]
	@CityName nvarchar(50),
	@CityID int

AS
UPDATE [City]
SET
	[CityName] = @CityName
WHERE
	[CityID] = @CityID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Companys_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Companys_Add*/
CREATE PROCEDURE [dbo].[sproc_Companys_Add]
	@CompanyID int OUTPUT
	,@CompanyName nvarchar(100)
	,@Address nvarchar(250)
	,@HotLine nchar(15)
	,@PhoneNumber nvarchar(15)
	,@Fax nvarchar(15)
	,@Email nvarchar(50)
	,@Surrogate nvarchar(50)
	,@Chevron nvarchar(50)

AS

	INSERT INTO [Companys]
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
	VALUES
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
	SELECT
		@CompanyID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Companys_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Companys_Delete*/
CREATE PROCEDURE [dbo].[sproc_Companys_Delete]
	@CompanyID int
AS
DELETE
FROM
	[Companys]
WHERE
	[CompanyID] = @CompanyID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Companys_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Companys_Get*/
CREATE PROCEDURE [dbo].[sproc_Companys_Get]
AS
SELECT
	--[CompanyID],
	--[CompanyName],
	--[Address],
	--[HotLine],
	--[PhoneNumber],
	--[Fax],
	--[Email],
	--[Surrogate],
	--[Chevron]

*
FROM
	[Companys]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Companys_GetByCompanyID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Companys_GetByCompanyID*/
CREATE PROCEDURE [dbo].[sproc_Companys_GetByCompanyID]
@CompanyID int
AS
SELECT
	--[CompanyID],
	--[CompanyName],
	--[Address],
	--[HotLine],
	--[PhoneNumber],
	--[Fax],
	--[Email],
	--[Surrogate],
	--[Chevron]

*
FROM
	[Companys]
WHERE
	[CompanyID] = @CompanyID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Companys_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Companys_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Companys_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Companys]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Companys_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Companys_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Companys_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [CompanyID]
FROM [Companys]


-- query out
SELECT *
FROM [Companys]
WHERE [CompanyID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Companys_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Companys_Update*/
CREATE PROCEDURE [dbo].[sproc_Companys_Update]
	@CompanyName nvarchar(100),
	@Address nvarchar(250),
	@HotLine nchar(15),
	@PhoneNumber nvarchar(15),
	@Fax nvarchar(15),
	@Email nvarchar(50),
	@Surrogate nvarchar(50),
	@Chevron nvarchar(50),
	@CompanyID int

AS
UPDATE [Companys]
SET
	[CompanyName] = @CompanyName,
	[Address] = @Address,
	[HotLine] = @HotLine,
	[PhoneNumber] = @PhoneNumber,
	[Fax] = @Fax,
	[Email] = @Email,
	[Surrogate] = @Surrogate,
	[Chevron] = @Chevron
WHERE
	[CompanyID] = @CompanyID

GO
/****** Object:  StoredProcedure [dbo].[sproc_ContractAdvertising_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ContractAdvertising_Add*/
CREATE PROCEDURE [dbo].[sproc_ContractAdvertising_Add]
	@ContractAdvertisingID int OUTPUT
	,@ContractAdvertisingName nvarchar(50)
	,@StaffID int
	,@CompanyID int
	,@BannerID int
	,@CreateDate datetime
	,@Fees money
	,@EndDate datetime
	,@Status bit

AS

	INSERT INTO [ContractAdvertising]
	(
		[ContractAdvertisingName],
		[StaffID],
		[CompanyID],
		[BannerID],
		[CreateDate],
		[Fees],
		[EndDate],
		[Status]
	)
	VALUES
	(
		@ContractAdvertisingName,
		@StaffID,
		@CompanyID,
		@BannerID,
		@CreateDate,
		@Fees,
		@EndDate,
		@Status
	)
	SELECT
		@ContractAdvertisingID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_ContractAdvertising_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ContractAdvertising_Delete*/
CREATE PROCEDURE [dbo].[sproc_ContractAdvertising_Delete]
	@ContractAdvertisingID int
AS
DELETE
FROM
	[ContractAdvertising]
WHERE
	[ContractAdvertisingID] = @ContractAdvertisingID

GO
/****** Object:  StoredProcedure [dbo].[sproc_ContractAdvertising_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ContractAdvertising_Get*/
CREATE PROCEDURE [dbo].[sproc_ContractAdvertising_Get]
AS
SELECT
	--[ContractAdvertisingID],
	--[ContractAdvertisingName],
	--[StaffID],
	--[CompanyID],
	--[BannerID],
	--[CreateDate],
	--[Fees],
	--[EndDate],
	--[Status]

*
FROM
	[ContractAdvertising]

GO
/****** Object:  StoredProcedure [dbo].[sproc_ContractAdvertising_GetByContractAdvertisingID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ContractAdvertising_GetByContractAdvertisingID*/
CREATE PROCEDURE [dbo].[sproc_ContractAdvertising_GetByContractAdvertisingID]
@ContractAdvertisingID int
AS
SELECT
	--[ContractAdvertisingID],
	--[ContractAdvertisingName],
	--[StaffID],
	--[CompanyID],
	--[BannerID],
	--[CreateDate],
	--[Fees],
	--[EndDate],
	--[Status]

*
FROM
	[ContractAdvertising]
WHERE
	[ContractAdvertisingID] = @ContractAdvertisingID

GO
/****** Object:  StoredProcedure [dbo].[sproc_ContractAdvertising_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ContractAdvertising_GetCount*/
CREATE PROCEDURE [dbo].[sproc_ContractAdvertising_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[ContractAdvertising]

GO
/****** Object:  StoredProcedure [dbo].[sproc_ContractAdvertising_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ContractAdvertising_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_ContractAdvertising_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [ContractAdvertisingID]
FROM [ContractAdvertising]


-- query out
SELECT *
FROM [ContractAdvertising]
WHERE [ContractAdvertisingID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_ContractAdvertising_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ContractAdvertising_Update*/
CREATE PROCEDURE [dbo].[sproc_ContractAdvertising_Update]
	@ContractAdvertisingName nvarchar(50),
	@StaffID int,
	@CompanyID int,
	@BannerID int,
	@CreateDate datetime,
	@Fees money,
	@EndDate datetime,
	@Status bit,
	@ContractAdvertisingID int

AS
UPDATE [ContractAdvertising]
SET
	[ContractAdvertisingName] = @ContractAdvertisingName,
	[StaffID] = @StaffID,
	[CompanyID] = @CompanyID,
	[BannerID] = @BannerID,
	[CreateDate] = @CreateDate,
	[Fees] = @Fees,
	[EndDate] = @EndDate,
	[Status] = @Status
WHERE
	[ContractAdvertisingID] = @ContractAdvertisingID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Controls_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Controls_Add*/
CREATE PROCEDURE [dbo].[sproc_Controls_Add]
	@ControlID int OUTPUT
	,@PageId int
	,@Name nvarchar(100)
	,@Path nvarchar(250)
	,@Param nvarchar(250)
	,@Status bigint
	,@Priority int

AS

	INSERT INTO [Controls]
	(
		[PageId],
		[Name],
		[Path],
		[Param],
		[Status],
		[Priority]
	)
	VALUES
	(
		@PageId,
		@Name,
		@Path,
		@Param,
		@Status,
		@Priority
	)
	SELECT
		@ControlID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Controls_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Controls_Delete*/
CREATE PROCEDURE [dbo].[sproc_Controls_Delete]
	@ControlID int
AS
DELETE
FROM
	[Controls]
WHERE
	[ControlID] = @ControlID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Controls_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Controls_Get*/
CREATE PROCEDURE [dbo].[sproc_Controls_Get]
AS
SELECT
	--[ControlID],
	--[PageId],
	--[Name],
	--[Path],
	--[Param],
	--[Status],
	--[Priority]

*
FROM
	[Controls]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Controls_GetByControlID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Controls_GetByControlID*/
CREATE PROCEDURE [dbo].[sproc_Controls_GetByControlID]
@ControlID int
AS
SELECT
	--[ControlID],
	--[PageId],
	--[Name],
	--[Path],
	--[Param],
	--[Status],
	--[Priority]

*
FROM
	[Controls]
WHERE
	[ControlID] = @ControlID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Controls_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Controls_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Controls_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Controls]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Controls_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Controls_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Controls_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [ControlID]
FROM [Controls]


-- query out
SELECT *
FROM [Controls]
WHERE [ControlID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Controls_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Controls_Update*/
CREATE PROCEDURE [dbo].[sproc_Controls_Update]
	@PageId int,
	@Name nvarchar(100),
	@Path nvarchar(250),
	@Param nvarchar(250),
	@Status bigint,
	@Priority int,
	@ControlID int

AS
UPDATE [Controls]
SET
	[PageId] = @PageId,
	[Name] = @Name,
	[Path] = @Path,
	[Param] = @Param,
	[Status] = @Status,
	[Priority] = @Priority
WHERE
	[ControlID] = @ControlID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Customers_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Customers_Add*/
CREATE PROCEDURE [dbo].[sproc_Customers_Add]
	@CustomerID int OUTPUT
	,@UserName nvarchar(100)
	,@Password nvarchar(100)
	,@FullName nvarchar(50)
	,@Gender bit
	,@Address nvarchar(250)
	,@IdentityCard nvarchar(15)
	,@MobileNumber nvarchar(15)
	,@HomePhone nvarchar(15)
	,@Email nvarchar(100)

AS

	INSERT INTO [Customers]
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
	VALUES
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
/****** Object:  StoredProcedure [dbo].[sproc_Customers_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Customers_Delete*/
CREATE PROCEDURE [dbo].[sproc_Customers_Delete]
	@CustomerID int
AS
DELETE
FROM
	[Customers]
WHERE
	[CustomerID] = @CustomerID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Customers_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Customers_Get*/
CREATE PROCEDURE [dbo].[sproc_Customers_Get]
AS
SELECT
	--[CustomerID],
	--[UserName],
	--[Password],
	--[FullName],
	--[Gender],
	--[Address],
	--[IdentityCard],
	--[MobileNumber],
	--[HomePhone],
	--[Email]

*
FROM
	[Customers]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Customers_GetByCustomerID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Customers_GetByCustomerID*/
CREATE PROCEDURE [dbo].[sproc_Customers_GetByCustomerID]
@CustomerID int
AS
SELECT
	--[CustomerID],
	--[UserName],
	--[Password],
	--[FullName],
	--[Gender],
	--[Address],
	--[IdentityCard],
	--[MobileNumber],
	--[HomePhone],
	--[Email]

*
FROM
	[Customers]
WHERE
	[CustomerID] = @CustomerID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Customers_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Customers_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Customers_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Customers]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Customers_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Customers_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Customers_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [CustomerID]
FROM [Customers]


-- query out
SELECT *
FROM [Customers]
WHERE [CustomerID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Customers_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Customers_Update*/
CREATE PROCEDURE [dbo].[sproc_Customers_Update]
	@UserName nvarchar(100),
	@Password nvarchar(100),
	@FullName nvarchar(50),
	@Gender bit,
	@Address nvarchar(250),
	@IdentityCard nvarchar(15),
	@MobileNumber nvarchar(15),
	@HomePhone nvarchar(15),
	@Email nvarchar(100),
	@CustomerID int

AS
UPDATE [Customers]
SET
	[UserName] = @UserName,
	[Password] = @Password,
	[FullName] = @FullName,
	[Gender] = @Gender,
	[Address] = @Address,
	[IdentityCard] = @IdentityCard,
	[MobileNumber] = @MobileNumber,
	[HomePhone] = @HomePhone,
	[Email] = @Email
WHERE
	[CustomerID] = @CustomerID

GO
/****** Object:  StoredProcedure [dbo].[sproc_District_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_District_Add*/
CREATE PROCEDURE [dbo].[sproc_District_Add]
	@DistrictID int OUTPUT
	,@CityID int
	,@DistrictName nvarchar(100)

AS

	INSERT INTO [District]
	(
		[CityID],
		[DistrictName]
	)
	VALUES
	(
		@CityID,
		@DistrictName
	)
	SELECT
		@DistrictID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_District_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_District_Delete*/
CREATE PROCEDURE [dbo].[sproc_District_Delete]
	@DistrictID int
AS
DELETE
FROM
	[District]
WHERE
	[DistrictID] = @DistrictID

GO
/****** Object:  StoredProcedure [dbo].[sproc_District_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_District_Get*/
CREATE PROCEDURE [dbo].[sproc_District_Get]
AS
SELECT
	--[DistrictID],
	--[CityID],
	--[DistrictName]

*
FROM
	[District]

GO
/****** Object:  StoredProcedure [dbo].[sproc_District_GetByDistrictID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_District_GetByDistrictID*/
CREATE PROCEDURE [dbo].[sproc_District_GetByDistrictID]
@DistrictID int
AS
SELECT
	--[DistrictID],
	--[CityID],
	--[DistrictName]

*
FROM
	[District]
WHERE
	[DistrictID] = @DistrictID

GO
/****** Object:  StoredProcedure [dbo].[sproc_District_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_District_GetCount*/
CREATE PROCEDURE [dbo].[sproc_District_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[District]

GO
/****** Object:  StoredProcedure [dbo].[sproc_District_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_District_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_District_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [DistrictID]
FROM [District]


-- query out
SELECT *
FROM [District]
WHERE [DistrictID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_District_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_District_Update*/
CREATE PROCEDURE [dbo].[sproc_District_Update]
	@CityID int,
	@DistrictName nvarchar(100),
	@DistrictID int

AS
UPDATE [District]
SET
	[CityID] = @CityID,
	[DistrictName] = @DistrictName
WHERE
	[DistrictID] = @DistrictID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Group_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Group_Add*/
CREATE PROCEDURE [dbo].[sproc_Group_Add]
	@GroupID int OUTPUT
	,@ParentID int
	,@GroupName nvarchar(100)
	,@Description nvarchar(250)
	,@Status tinyint
	,@Priority int
	,@SwitchGroup nvarchar(250)

AS

	INSERT INTO [Group]
	(
		[ParentID],
		[GroupName],
		[Description],
		[Status],
		[Priority],
		[SwitchGroup]
	)
	VALUES
	(
		@ParentID,
		@GroupName,
		@Description,
		@Status,
		@Priority,
		@SwitchGroup
	)
	SELECT
		@GroupID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Group_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Group_Delete*/
CREATE PROCEDURE [dbo].[sproc_Group_Delete]
	@GroupID int
AS
DELETE
FROM
	[Group]
WHERE
	[GroupID] = @GroupID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Group_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Group_Get*/
CREATE PROCEDURE [dbo].[sproc_Group_Get]
AS
SELECT
	--[GroupID],
	--[ParentID],
	--[GroupName],
	--[Description],
	--[Status],
	--[Priority],
	--[SwitchGroup]

*
FROM
	[Group]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Group_GetByGroupID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Group_GetByGroupID*/
CREATE PROCEDURE [dbo].[sproc_Group_GetByGroupID]
@GroupID int
AS
SELECT
	--[GroupID],
	--[ParentID],
	--[GroupName],
	--[Description],
	--[Status],
	--[Priority],
	--[SwitchGroup]

*
FROM
	[Group]
WHERE
	[GroupID] = @GroupID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Group_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Group_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Group_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Group]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Group_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Group_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Group_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [GroupID]
FROM [Group]


-- query out
SELECT *
FROM [Group]
WHERE [GroupID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Group_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Group_Update*/
CREATE PROCEDURE [dbo].[sproc_Group_Update]
	@ParentID int,
	@GroupName nvarchar(100),
	@Description nvarchar(250),
	@Status tinyint,
	@Priority int,
	@SwitchGroup nvarchar(250),
	@GroupID int

AS
UPDATE [Group]
SET
	[ParentID] = @ParentID,
	[GroupName] = @GroupName,
	[Description] = @Description,
	[Status] = @Status,
	[Priority] = @Priority,
	[SwitchGroup] = @SwitchGroup
WHERE
	[GroupID] = @GroupID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Home_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Home_Add*/
CREATE PROCEDURE [dbo].[sproc_Home_Add]
	@HomeID int OUTPUT
	,@HomeTypeID int
	,@RealEstateOwnersID int
	,@RealEstateOwnersTypeID int
	,@RealEstateID int
	,@Description nvarchar(250)
	,@Address nvarchar(250)
	,@Price float(8)
	,@TotalArea float(8)
	,@FloorArea float(8)
	,@GargenArea float(8)
	,@HomeArea float(8)
	,@BedroomNumber tinyint
	,@TierNumber tinyint
	,@Image1 nvarchar(250)
	,@Image2 nvarchar(250)
	,@Image3 nvarchar(250)

AS

	INSERT INTO [Home]
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
	VALUES
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
	SELECT
		@HomeID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Home_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Home_Delete*/
CREATE PROCEDURE [dbo].[sproc_Home_Delete]
	@HomeID int
AS
DELETE
FROM
	[Home]
WHERE
	[HomeID] = @HomeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Home_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Home_Get*/
CREATE PROCEDURE [dbo].[sproc_Home_Get]
AS
SELECT
	--[HomeID],
	--[HomeTypeID],
	--[RealEstateOwnersID],
	--[RealEstateOwnersTypeID],
	--[RealEstateID],
	--[Description],
	--[Address],
	--[Price],
	--[TotalArea],
	--[FloorArea],
	--[GargenArea],
	--[HomeArea],
	--[BedroomNumber],
	--[TierNumber],
	--[Image1],
	--[Image2],
	--[Image3]

*
FROM
	[Home]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Home_GetByHomeID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Home_GetByHomeID*/
CREATE PROCEDURE [dbo].[sproc_Home_GetByHomeID]
@HomeID int
AS
SELECT
	--[HomeID],
	--[HomeTypeID],
	--[RealEstateOwnersID],
	--[RealEstateOwnersTypeID],
	--[RealEstateID],
	--[Description],
	--[Address],
	--[Price],
	--[TotalArea],
	--[FloorArea],
	--[GargenArea],
	--[HomeArea],
	--[BedroomNumber],
	--[TierNumber],
	--[Image1],
	--[Image2],
	--[Image3]

*
FROM
	[Home]
WHERE
	[HomeID] = @HomeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Home_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Home_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Home_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Home]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Home_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Home_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Home_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [HomeID]
FROM [Home]


-- query out
SELECT *
FROM [Home]
WHERE [HomeID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Home_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Home_Update*/
CREATE PROCEDURE [dbo].[sproc_Home_Update]
	@HomeTypeID int,
	@RealEstateOwnersID int,
	@RealEstateOwnersTypeID int,
	@RealEstateID int,
	@Description nvarchar(250),
	@Address nvarchar(250),
	@Price float(8),
	@TotalArea float(8),
	@FloorArea float(8),
	@GargenArea float(8),
	@HomeArea float(8),
	@BedroomNumber tinyint,
	@TierNumber tinyint,
	@Image1 nvarchar(250),
	@Image2 nvarchar(250),
	@Image3 nvarchar(250),
	@HomeID int

AS
UPDATE [Home]
SET
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
WHERE
	[HomeID] = @HomeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_HomeType_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HomeType_Add*/
CREATE PROCEDURE [dbo].[sproc_HomeType_Add]
	@HomeTypeID int OUTPUT
	,@HomeTypeName nvarchar(100)

AS

	INSERT INTO [HomeType]
	(
		[HomeTypeName]
	)
	VALUES
	(
		@HomeTypeName
	)
	SELECT
		@HomeTypeID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_HomeType_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HomeType_Delete*/
CREATE PROCEDURE [dbo].[sproc_HomeType_Delete]
	@HomeTypeID int
AS
DELETE
FROM
	[HomeType]
WHERE
	[HomeTypeID] = @HomeTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_HomeType_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HomeType_Get*/
CREATE PROCEDURE [dbo].[sproc_HomeType_Get]
AS
SELECT
	--[HomeTypeID],
	--[HomeTypeName]

*
FROM
	[HomeType]

GO
/****** Object:  StoredProcedure [dbo].[sproc_HomeType_GetByHomeTypeID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HomeType_GetByHomeTypeID*/
CREATE PROCEDURE [dbo].[sproc_HomeType_GetByHomeTypeID]
@HomeTypeID int
AS
SELECT
	--[HomeTypeID],
	--[HomeTypeName]

*
FROM
	[HomeType]
WHERE
	[HomeTypeID] = @HomeTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_HomeType_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HomeType_GetCount*/
CREATE PROCEDURE [dbo].[sproc_HomeType_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[HomeType]

GO
/****** Object:  StoredProcedure [dbo].[sproc_HomeType_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HomeType_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_HomeType_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [HomeTypeID]
FROM [HomeType]


-- query out
SELECT *
FROM [HomeType]
WHERE [HomeTypeID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_HomeType_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HomeType_Update*/
CREATE PROCEDURE [dbo].[sproc_HomeType_Update]
	@HomeTypeName nvarchar(100),
	@HomeTypeID int

AS
UPDATE [HomeType]
SET
	[HomeTypeName] = @HomeTypeName
WHERE
	[HomeTypeID] = @HomeTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Land_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Land_Add*/
CREATE PROCEDURE [dbo].[sproc_Land_Add]
	@LandID int OUTPUT
	,@LandTypeID int
	,@RealEstateOwnersID int
	,@RealEstateOwnersTypeID int
	,@RealEstateID int
	,@Description nvarchar(250)
	,@Address nvarchar(250)
	,@Price float(8)
	,@TotalArea float(8)
	,@Image1 nvarchar(250)
	,@Image2 nvarchar(250)

AS

	INSERT INTO [Land]
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
	VALUES
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
	SELECT
		@LandID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Land_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Land_Delete*/
CREATE PROCEDURE [dbo].[sproc_Land_Delete]
	@LandID int
AS
DELETE
FROM
	[Land]
WHERE
	[LandID] = @LandID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Land_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Land_Get*/
CREATE PROCEDURE [dbo].[sproc_Land_Get]
AS
SELECT
	--[LandID],
	--[LandTypeID],
	--[RealEstateOwnersID],
	--[RealEstateOwnersTypeID],
	--[RealEstateID],
	--[Description],
	--[Address],
	--[Price],
	--[TotalArea],
	--[Image1],
	--[Image2]

*
FROM
	[Land]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Land_GetByLandID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Land_GetByLandID*/
CREATE PROCEDURE [dbo].[sproc_Land_GetByLandID]
@LandID int
AS
SELECT
	--[LandID],
	--[LandTypeID],
	--[RealEstateOwnersID],
	--[RealEstateOwnersTypeID],
	--[RealEstateID],
	--[Description],
	--[Address],
	--[Price],
	--[TotalArea],
	--[Image1],
	--[Image2]

*
FROM
	[Land]
WHERE
	[LandID] = @LandID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Land_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Land_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Land_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Land]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Land_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Land_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Land_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [LandID]
FROM [Land]


-- query out
SELECT *
FROM [Land]
WHERE [LandID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Land_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Land_Update*/
CREATE PROCEDURE [dbo].[sproc_Land_Update]
	@LandTypeID int,
	@RealEstateOwnersID int,
	@RealEstateOwnersTypeID int,
	@RealEstateID int,
	@Description nvarchar(250),
	@Address nvarchar(250),
	@Price float(8),
	@TotalArea float(8),
	@Image1 nvarchar(250),
	@Image2 nvarchar(250),
	@LandID int

AS
UPDATE [Land]
SET
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
WHERE
	[LandID] = @LandID

GO
/****** Object:  StoredProcedure [dbo].[sproc_LandType_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LandType_Add*/
CREATE PROCEDURE [dbo].[sproc_LandType_Add]
	@LandTypeID int OUTPUT
	,@LandTypeName nvarchar(100)

AS

	INSERT INTO [LandType]
	(
		[LandTypeName]
	)
	VALUES
	(
		@LandTypeName
	)
	SELECT
		@LandTypeID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_LandType_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LandType_Delete*/
CREATE PROCEDURE [dbo].[sproc_LandType_Delete]
	@LandTypeID int
AS
DELETE
FROM
	[LandType]
WHERE
	[LandTypeID] = @LandTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_LandType_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LandType_Get*/
CREATE PROCEDURE [dbo].[sproc_LandType_Get]
AS
SELECT
	--[LandTypeID],
	--[LandTypeName]

*
FROM
	[LandType]

GO
/****** Object:  StoredProcedure [dbo].[sproc_LandType_GetByLandTypeID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LandType_GetByLandTypeID*/
CREATE PROCEDURE [dbo].[sproc_LandType_GetByLandTypeID]
@LandTypeID int
AS
SELECT
	--[LandTypeID],
	--[LandTypeName]

*
FROM
	[LandType]
WHERE
	[LandTypeID] = @LandTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_LandType_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LandType_GetCount*/
CREATE PROCEDURE [dbo].[sproc_LandType_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[LandType]

GO
/****** Object:  StoredProcedure [dbo].[sproc_LandType_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LandType_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_LandType_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [LandTypeID]
FROM [LandType]


-- query out
SELECT *
FROM [LandType]
WHERE [LandTypeID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_LandType_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LandType_Update*/
CREATE PROCEDURE [dbo].[sproc_LandType_Update]
	@LandTypeName nvarchar(100),
	@LandTypeID int

AS
UPDATE [LandType]
SET
	[LandTypeName] = @LandTypeName
WHERE
	[LandTypeID] = @LandTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Language_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Language_Add*/
CREATE PROCEDURE [dbo].[sproc_Language_Add]
	@LanguageId int OUTPUT
	,@Name nvarchar(50)
	,@ResourceFile nvarchar(50)
	,@LanguageText nvarchar(50)

AS

	INSERT INTO [Language]
	(
		[Name],
		[ResourceFile],
		[LanguageText]
	)
	VALUES
	(
		@Name,
		@ResourceFile,
		@LanguageText
	)
	SELECT
		@LanguageId = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Language_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Language_Delete*/
CREATE PROCEDURE [dbo].[sproc_Language_Delete]
	@LanguageId int
AS
DELETE
FROM
	[Language]
WHERE
	[LanguageId] = @LanguageId

GO
/****** Object:  StoredProcedure [dbo].[sproc_Language_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Language_Get*/
CREATE PROCEDURE [dbo].[sproc_Language_Get]
AS
SELECT
	--[LanguageId],
	--[Name],
	--[ResourceFile],
	--[LanguageText]

*
FROM
	[Language]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Language_GetByLanguageId]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Language_GetByLanguageId*/
CREATE PROCEDURE [dbo].[sproc_Language_GetByLanguageId]
@LanguageId int
AS
SELECT
	--[LanguageId],
	--[Name],
	--[ResourceFile],
	--[LanguageText]

*
FROM
	[Language]
WHERE
	[LanguageId] = @LanguageId

GO
/****** Object:  StoredProcedure [dbo].[sproc_Language_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Language_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Language_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Language]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Language_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Language_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Language_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [LanguageId]
FROM [Language]


-- query out
SELECT *
FROM [Language]
WHERE [LanguageId]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Language_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Language_Update*/
CREATE PROCEDURE [dbo].[sproc_Language_Update]
	@Name nvarchar(50),
	@ResourceFile nvarchar(50),
	@LanguageText nvarchar(50),
	@LanguageId int

AS
UPDATE [Language]
SET
	[Name] = @Name,
	[ResourceFile] = @ResourceFile,
	[LanguageText] = @LanguageText
WHERE
	[LanguageId] = @LanguageId

GO
/****** Object:  StoredProcedure [dbo].[sproc_Location_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Location_Add*/
CREATE PROCEDURE [dbo].[sproc_Location_Add]
	@LocationID int OUTPUT
	,@xcoor float(8)
	,@ycoor float(8)

AS

	INSERT INTO [Location]
	(
		[xcoor],
		[ycoor]
	)
	VALUES
	(
		@xcoor,
		@ycoor
	)
	SELECT
		@LocationID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Location_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Location_Delete*/
CREATE PROCEDURE [dbo].[sproc_Location_Delete]
	@LocationID int
AS
DELETE
FROM
	[Location]
WHERE
	[LocationID] = @LocationID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Location_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Location_Get*/
CREATE PROCEDURE [dbo].[sproc_Location_Get]
AS
SELECT
	--[LocationID],
	--[xcoor],
	--[ycoor]

*
FROM
	[Location]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Location_GetByLocationID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Location_GetByLocationID*/
CREATE PROCEDURE [dbo].[sproc_Location_GetByLocationID]
@LocationID int
AS
SELECT
	--[LocationID],
	--[xcoor],
	--[ycoor]

*
FROM
	[Location]
WHERE
	[LocationID] = @LocationID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Location_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Location_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Location_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Location]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Location_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Location_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Location_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [LocationID]
FROM [Location]


-- query out
SELECT *
FROM [Location]
WHERE [LocationID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Location_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Location_Update*/
CREATE PROCEDURE [dbo].[sproc_Location_Update]
	@xcoor float(8),
	@ycoor float(8),
	@LocationID int

AS
UPDATE [Location]
SET
	[xcoor] = @xcoor,
	[ycoor] = @ycoor
WHERE
	[LocationID] = @LocationID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Menus_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Menus_Add*/
CREATE PROCEDURE [dbo].[sproc_Menus_Add]
	@MenuID int OUTPUT
	,@ParentID int
	,@PageID int
	,@MenuName nvarchar(200)
	,@Position int
	,@Status bigint
	,@Priority int
	,@Param nvarchar(1000)
	,@GroupID int

AS

	INSERT INTO [Menus]
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
	VALUES
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
	SELECT
		@MenuID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Menus_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Menus_Delete*/
CREATE PROCEDURE [dbo].[sproc_Menus_Delete]
	@MenuID int
AS
DELETE
FROM
	[Menus]
WHERE
	[MenuID] = @MenuID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Menus_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Menus_Get*/
CREATE PROCEDURE [dbo].[sproc_Menus_Get]
AS
SELECT
	--[MenuID],
	--[ParentID],
	--[PageID],
	--[MenuName],
	--[Position],
	--[Status],
	--[Priority],
	--[Param],
	--[GroupID]

*
FROM
	[Menus]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Menus_GetByMenuID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Menus_GetByMenuID*/
CREATE PROCEDURE [dbo].[sproc_Menus_GetByMenuID]
@MenuID int
AS
SELECT
	--[MenuID],
	--[ParentID],
	--[PageID],
	--[MenuName],
	--[Position],
	--[Status],
	--[Priority],
	--[Param],
	--[GroupID]

*
FROM
	[Menus]
WHERE
	[MenuID] = @MenuID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Menus_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Menus_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Menus_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Menus]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Menus_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Menus_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Menus_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MenuID]
FROM [Menus]


-- query out
SELECT *
FROM [Menus]
WHERE [MenuID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Menus_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Menus_Update*/
CREATE PROCEDURE [dbo].[sproc_Menus_Update]
	@ParentID int,
	@PageID int,
	@MenuName nvarchar(200),
	@Position int,
	@Status bigint,
	@Priority int,
	@Param nvarchar(1000),
	@GroupID int,
	@MenuID int

AS
UPDATE [Menus]
SET
	[ParentID] = @ParentID,
	[PageID] = @PageID,
	[MenuName] = @MenuName,
	[Position] = @Position,
	[Status] = @Status,
	[Priority] = @Priority,
	[Param] = @Param,
	[GroupID] = @GroupID
WHERE
	[MenuID] = @MenuID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Motel_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Motel_Add*/
CREATE PROCEDURE [dbo].[sproc_Motel_Add]
	@MotelID int OUTPUT
	,@RealEstateOwnersID int
	,@RealEstateOwnersTypeID int
	,@RealEstateID int
	,@MotelTypeID int
	,@Description nvarchar(250)
	,@Address nvarchar(250)
	,@Price float(8)
	,@TotalArea float(8)
	,@IsClosed bit
	,@IsCooker bit
	,@Furniture nvarchar(50)
	,@TierNumber tinyint
	,@Image1 nvarchar(250)
	,@Image2 nvarchar(250)
	,@Image3 nvarchar(250)

AS

	INSERT INTO [Motel]
	(
		[RealEstateOwnersID],
		[RealEstateOwnersTypeID],
		[RealEstateID],
		[MotelTypeID],
		[Description],
		[Address],
		[Price],
		[TotalArea],
		[IsClosed],
		[IsCooker],
		[Furniture],
		[TierNumber],
		[Image1],
		[Image2],
		[Image3]
	)
	VALUES
	(
		@RealEstateOwnersID,
		@RealEstateOwnersTypeID,
		@RealEstateID,
		@MotelTypeID,
		@Description,
		@Address,
		@Price,
		@TotalArea,
		@IsClosed,
		@IsCooker,
		@Furniture,
		@TierNumber,
		@Image1,
		@Image2,
		@Image3
	)
	SELECT
		@MotelID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Motel_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Motel_Delete*/
CREATE PROCEDURE [dbo].[sproc_Motel_Delete]
	@MotelID int
AS
DELETE
FROM
	[Motel]
WHERE
	[MotelID] = @MotelID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Motel_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Motel_Get*/
CREATE PROCEDURE [dbo].[sproc_Motel_Get]
AS
SELECT
	--[MotelID],
	--[RealEstateOwnersID],
	--[RealEstateOwnersTypeID],
	--[RealEstateID],
	--[MotelTypeID],
	--[Description],
	--[Address],
	--[Price],
	--[TotalArea],
	--[IsClosed],
	--[IsCooker],
	--[Furniture],
	--[TierNumber],
	--[Image1],
	--[Image2],
	--[Image3]

*
FROM
	[Motel]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Motel_GetByMotelID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Motel_GetByMotelID*/
CREATE PROCEDURE [dbo].[sproc_Motel_GetByMotelID]
@MotelID int
AS
SELECT
	--[MotelID],
	--[RealEstateOwnersID],
	--[RealEstateOwnersTypeID],
	--[RealEstateID],
	--[MotelTypeID],
	--[Description],
	--[Address],
	--[Price],
	--[TotalArea],
	--[IsClosed],
	--[IsCooker],
	--[Furniture],
	--[TierNumber],
	--[Image1],
	--[Image2],
	--[Image3]

*
FROM
	[Motel]
WHERE
	[MotelID] = @MotelID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Motel_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Motel_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Motel_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Motel]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Motel_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Motel_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Motel_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MotelID]
FROM [Motel]


-- query out
SELECT *
FROM [Motel]
WHERE [MotelID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Motel_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Motel_Update*/
CREATE PROCEDURE [dbo].[sproc_Motel_Update]
	@RealEstateOwnersID int,
	@RealEstateOwnersTypeID int,
	@RealEstateID int,
	@MotelTypeID int,
	@Description nvarchar(250),
	@Address nvarchar(250),
	@Price float(8),
	@TotalArea float(8),
	@IsClosed bit,
	@IsCooker bit,
	@Furniture nvarchar(50),
	@TierNumber tinyint,
	@Image1 nvarchar(250),
	@Image2 nvarchar(250),
	@Image3 nvarchar(250),
	@MotelID int

AS
UPDATE [Motel]
SET
	[RealEstateOwnersID] = @RealEstateOwnersID,
	[RealEstateOwnersTypeID] = @RealEstateOwnersTypeID,
	[RealEstateID] = @RealEstateID,
	[MotelTypeID] = @MotelTypeID,
	[Description] = @Description,
	[Address] = @Address,
	[Price] = @Price,
	[TotalArea] = @TotalArea,
	[IsClosed] = @IsClosed,
	[IsCooker] = @IsCooker,
	[Furniture] = @Furniture,
	[TierNumber] = @TierNumber,
	[Image1] = @Image1,
	[Image2] = @Image2,
	[Image3] = @Image3
WHERE
	[MotelID] = @MotelID

GO
/****** Object:  StoredProcedure [dbo].[sproc_MotelType_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MotelType_Add*/
CREATE PROCEDURE [dbo].[sproc_MotelType_Add]
	@MotelTypeID int OUTPUT
	,@MotelTypeName nvarchar(50)

AS

	INSERT INTO [MotelType]
	(
		[MotelTypeName]
	)
	VALUES
	(
		@MotelTypeName
	)
	SELECT
		@MotelTypeID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_MotelType_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MotelType_Delete*/
CREATE PROCEDURE [dbo].[sproc_MotelType_Delete]
	@MotelTypeID int
AS
DELETE
FROM
	[MotelType]
WHERE
	[MotelTypeID] = @MotelTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_MotelType_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MotelType_Get*/
CREATE PROCEDURE [dbo].[sproc_MotelType_Get]
AS
SELECT
	--[MotelTypeID],
	--[MotelTypeName]

*
FROM
	[MotelType]

GO
/****** Object:  StoredProcedure [dbo].[sproc_MotelType_GetByMotelTypeID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MotelType_GetByMotelTypeID*/
CREATE PROCEDURE [dbo].[sproc_MotelType_GetByMotelTypeID]
@MotelTypeID int
AS
SELECT
	--[MotelTypeID],
	--[MotelTypeName]

*
FROM
	[MotelType]
WHERE
	[MotelTypeID] = @MotelTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_MotelType_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MotelType_GetCount*/
CREATE PROCEDURE [dbo].[sproc_MotelType_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[MotelType]

GO
/****** Object:  StoredProcedure [dbo].[sproc_MotelType_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MotelType_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_MotelType_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MotelTypeID]
FROM [MotelType]


-- query out
SELECT *
FROM [MotelType]
WHERE [MotelTypeID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_MotelType_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MotelType_Update*/
CREATE PROCEDURE [dbo].[sproc_MotelType_Update]
	@MotelTypeName nvarchar(50),
	@MotelTypeID int

AS
UPDATE [MotelType]
SET
	[MotelTypeName] = @MotelTypeName
WHERE
	[MotelTypeID] = @MotelTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Pages_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Pages_Add*/
CREATE PROCEDURE [dbo].[sproc_Pages_Add]
	@PageID int OUTPUT
	,@Name nvarchar(100)
	,@Tag nvarchar(255)
	,@Conntent ntext
	,@Detail nvarchar(250)
	,@Level int
	,@Title nvarchar(100)
	,@Description nvarchar(500)
	,@Keyword nvarchar(500)
	,@Type nvarchar(50)
	,@Link nvarchar(200)
	,@Taget nvarchar(100)
	,@Position int
	,@Index int
	,@Active int
	,@Lang nvarchar(50)
	,@Ord int

AS

	INSERT INTO [Pages]
	(
		[Name],
		[Tag],
		[Conntent],
		[Detail],
		[Level],
		[Title],
		[Description],
		[Keyword],
		[Type],
		[Link],
		[Taget],
		[Position],
		[Index],
		[Active],
		[Lang],
		[Ord]
	)
	VALUES
	(
		@Name,
		@Tag,
		@Conntent,
		@Detail,
		@Level,
		@Title,
		@Description,
		@Keyword,
		@Type,
		@Link,
		@Taget,
		@Position,
		@Index,
		@Active,
		@Lang,
		@Ord
	)
	SELECT
		@PageID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Pages_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Pages_Delete*/
CREATE PROCEDURE [dbo].[sproc_Pages_Delete]
	@PageID int
AS
DELETE
FROM
	[Pages]
WHERE
	[PageID] = @PageID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Pages_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Pages_Get*/
CREATE PROCEDURE [dbo].[sproc_Pages_Get]
AS
SELECT
	--[PageID],
	--[Name],
	--[Tag],
	--[Conntent],
	--[Detail],
	--[Level],
	--[Title],
	--[Description],
	--[Keyword],
	--[Type],
	--[Link],
	--[Taget],
	--[Position],
	--[Index],
	--[Active],
	--[Lang],
	--[Ord]

*
FROM
	[Pages]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Pages_GetByPageID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Pages_GetByPageID*/
CREATE PROCEDURE [dbo].[sproc_Pages_GetByPageID]
@PageID int
AS
SELECT
	--[PageID],
	--[Name],
	--[Tag],
	--[Conntent],
	--[Detail],
	--[Level],
	--[Title],
	--[Description],
	--[Keyword],
	--[Type],
	--[Link],
	--[Taget],
	--[Position],
	--[Index],
	--[Active],
	--[Lang],
	--[Ord]

*
FROM
	[Pages]
WHERE
	[PageID] = @PageID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Pages_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Pages_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Pages_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Pages]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Pages_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Pages_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Pages_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [PageID]
FROM [Pages]


-- query out
SELECT *
FROM [Pages]
WHERE [PageID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Pages_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Pages_Update*/
CREATE PROCEDURE [dbo].[sproc_Pages_Update]
	@Name nvarchar(100),
	@Tag nvarchar(255),
	@Conntent ntext,
	@Detail nvarchar(250),
	@Level int,
	@Title nvarchar(100),
	@Description nvarchar(500),
	@Keyword nvarchar(500),
	@Type nvarchar(50),
	@Link nvarchar(200),
	@Taget nvarchar(100),
	@Position int,
	@Index int,
	@Active int,
	@Lang nvarchar(50),
	@Ord int,
	@PageID int

AS
UPDATE [Pages]
SET
	[Name] = @Name,
	[Tag] = @Tag,
	[Conntent] = @Conntent,
	[Detail] = @Detail,
	[Level] = @Level,
	[Title] = @Title,
	[Description] = @Description,
	[Keyword] = @Keyword,
	[Type] = @Type,
	[Link] = @Link,
	[Taget] = @Taget,
	[Position] = @Position,
	[Index] = @Index,
	[Active] = @Active,
	[Lang] = @Lang,
	[Ord] = @Ord
WHERE
	[PageID] = @PageID

GO
/****** Object:  StoredProcedure [dbo].[sproc_PostContract_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PostContract_Add*/
CREATE PROCEDURE [dbo].[sproc_PostContract_Add]
	@PostContractID int OUTPUT
	,@PostContractName nvarchar(50)
	,@StaffD int
	,@UserName nvarchar(50)
	,@RealEstateID int
	,@Fees money
	,@CreateDate datetime
	,@EndDate datetime
	,@Status bit

AS

	INSERT INTO [PostContract]
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
	VALUES
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
	SELECT
		@PostContractID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_PostContract_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PostContract_Delete*/
CREATE PROCEDURE [dbo].[sproc_PostContract_Delete]
	@PostContractID int
AS
DELETE
FROM
	[PostContract]
WHERE
	[PostContractID] = @PostContractID

GO
/****** Object:  StoredProcedure [dbo].[sproc_PostContract_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PostContract_Get*/
CREATE PROCEDURE [dbo].[sproc_PostContract_Get]
AS
SELECT
	--[PostContractID],
	--[PostContractName],
	--[StaffD],
	--[UserName],
	--[RealEstateID],
	--[Fees],
	--[CreateDate],
	--[EndDate],
	--[Status]

*
FROM
	[PostContract]

GO
/****** Object:  StoredProcedure [dbo].[sproc_PostContract_GetByPostContractID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PostContract_GetByPostContractID*/
CREATE PROCEDURE [dbo].[sproc_PostContract_GetByPostContractID]
@PostContractID int
AS
SELECT
	--[PostContractID],
	--[PostContractName],
	--[StaffD],
	--[UserName],
	--[RealEstateID],
	--[Fees],
	--[CreateDate],
	--[EndDate],
	--[Status]

*
FROM
	[PostContract]
WHERE
	[PostContractID] = @PostContractID

GO
/****** Object:  StoredProcedure [dbo].[sproc_PostContract_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PostContract_GetCount*/
CREATE PROCEDURE [dbo].[sproc_PostContract_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[PostContract]

GO
/****** Object:  StoredProcedure [dbo].[sproc_PostContract_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PostContract_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_PostContract_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [PostContractID]
FROM [PostContract]


-- query out
SELECT *
FROM [PostContract]
WHERE [PostContractID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_PostContract_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PostContract_Update*/
CREATE PROCEDURE [dbo].[sproc_PostContract_Update]
	@PostContractName nvarchar(50),
	@StaffD int,
	@UserName nvarchar(50),
	@RealEstateID int,
	@Fees money,
	@CreateDate datetime,
	@EndDate datetime,
	@Status bit,
	@PostContractID int

AS
UPDATE [PostContract]
SET
	[PostContractName] = @PostContractName,
	[StaffD] = @StaffD,
	[UserName] = @UserName,
	[RealEstateID] = @RealEstateID,
	[Fees] = @Fees,
	[CreateDate] = @CreateDate,
	[EndDate] = @EndDate,
	[Status] = @Status
WHERE
	[PostContractID] = @PostContractID

GO
/****** Object:  StoredProcedure [dbo].[sproc_ProductType_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ProductType_Add*/
CREATE PROCEDURE [dbo].[sproc_ProductType_Add]
	@ProductTypeId int OUTPUT
	,@ProductTypeName nvarchar(50)
	,@ProductTypeDescription nvarchar(1000)
	,@ProductTypeNameTranslationId int
	,@ProductTypeDescriptionNameTranslationId int

AS

	INSERT INTO [ProductType]
	(
		[ProductTypeId],
		[ProductTypeName],
		[ProductTypeDescription],
		[ProductTypeNameTranslationId],
		[ProductTypeDescriptionNameTranslationId]
	)
	VALUES
	(
		@ProductTypeId,
		@ProductTypeName,
		@ProductTypeDescription,
		@ProductTypeNameTranslationId,
		@ProductTypeDescriptionNameTranslationId
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_ProductType_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ProductType_Delete*/
CREATE PROCEDURE [dbo].[sproc_ProductType_Delete]
	@ProductTypeId int
AS
DELETE
FROM
	[ProductType]
WHERE
	[ProductTypeId] = @ProductTypeId

GO
/****** Object:  StoredProcedure [dbo].[sproc_ProductType_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ProductType_Get*/
CREATE PROCEDURE [dbo].[sproc_ProductType_Get]
AS
SELECT
	--[ProductTypeId],
	--[ProductTypeName],
	--[ProductTypeDescription],
	--[ProductTypeNameTranslationId],
	--[ProductTypeDescriptionNameTranslationId]

*
FROM
	[ProductType]

GO
/****** Object:  StoredProcedure [dbo].[sproc_ProductType_GetByProductTypeId]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ProductType_GetByProductTypeId*/
CREATE PROCEDURE [dbo].[sproc_ProductType_GetByProductTypeId]
@ProductTypeId int
AS
SELECT
	--[ProductTypeId],
	--[ProductTypeName],
	--[ProductTypeDescription],
	--[ProductTypeNameTranslationId],
	--[ProductTypeDescriptionNameTranslationId]

*
FROM
	[ProductType]
WHERE
	[ProductTypeId] = @ProductTypeId

GO
/****** Object:  StoredProcedure [dbo].[sproc_ProductType_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ProductType_GetCount*/
CREATE PROCEDURE [dbo].[sproc_ProductType_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[ProductType]

GO
/****** Object:  StoredProcedure [dbo].[sproc_ProductType_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ProductType_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_ProductType_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [ProductTypeId]
FROM [ProductType]


-- query out
SELECT *
FROM [ProductType]
WHERE [ProductTypeId]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_ProductType_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_ProductType_Update*/
CREATE PROCEDURE [dbo].[sproc_ProductType_Update]
	@ProductTypeName nvarchar(50),
	@ProductTypeDescription nvarchar(1000),
	@ProductTypeNameTranslationId int,
	@ProductTypeDescriptionNameTranslationId int,
	@ProductTypeId int

AS
UPDATE [ProductType]
SET
	[ProductTypeName] = @ProductTypeName,
	[ProductTypeDescription] = @ProductTypeDescription,
	[ProductTypeNameTranslationId] = @ProductTypeNameTranslationId,
	[ProductTypeDescriptionNameTranslationId] = @ProductTypeDescriptionNameTranslationId
WHERE
	[ProductTypeId] = @ProductTypeId

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateNews_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateNews_Add*/
CREATE PROCEDURE [dbo].[sproc_RealEstateNews_Add]
	@RealEstateNewsID int OUTPUT
	,@RealEstateID int
	,@Title nvarchar(200)
	,@Content ntext
	,@CategoryID int
	,@Images nvarchar(250)
	,@CreateDate datetime
	,@CreateBy datetime
	,@Source nvarchar(200)

AS

	INSERT INTO [RealEstateNews]
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
	VALUES
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
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateNews_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateNews_Delete*/
CREATE PROCEDURE [dbo].[sproc_RealEstateNews_Delete]
	@RealEstateNewsID int
AS
DELETE
FROM
	[RealEstateNews]
WHERE
	[RealEstateNewsID] = @RealEstateNewsID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateNews_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateNews_Get*/
CREATE PROCEDURE [dbo].[sproc_RealEstateNews_Get]
AS
SELECT
	--[RealEstateNewsID],
	--[RealEstateID],
	--[Title],
	--[Content],
	--[CategoryID],
	--[Images],
	--[CreateDate],
	--[CreateBy],
	--[Source]

*
FROM
	[RealEstateNews]

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateNews_GetByRealEstateNewsID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateNews_GetByRealEstateNewsID*/
CREATE PROCEDURE [dbo].[sproc_RealEstateNews_GetByRealEstateNewsID]
@RealEstateNewsID int
AS
SELECT
	--[RealEstateNewsID],
	--[RealEstateID],
	--[Title],
	--[Content],
	--[CategoryID],
	--[Images],
	--[CreateDate],
	--[CreateBy],
	--[Source]

*
FROM
	[RealEstateNews]
WHERE
	[RealEstateNewsID] = @RealEstateNewsID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateNews_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateNews_GetCount*/
CREATE PROCEDURE [dbo].[sproc_RealEstateNews_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[RealEstateNews]

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateNews_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateNews_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_RealEstateNews_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [RealEstateNewsID]
FROM [RealEstateNews]


-- query out
SELECT *
FROM [RealEstateNews]
WHERE [RealEstateNewsID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateNews_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateNews_Update*/
CREATE PROCEDURE [dbo].[sproc_RealEstateNews_Update]
	@RealEstateID int,
	@Title nvarchar(200),
	@Content ntext,
	@CategoryID int,
	@Images nvarchar(250),
	@CreateDate datetime,
	@CreateBy datetime,
	@Source nvarchar(200),
	@RealEstateNewsID int

AS
UPDATE [RealEstateNews]
SET
	[RealEstateID] = @RealEstateID,
	[Title] = @Title,
	[Content] = @Content,
	[CategoryID] = @CategoryID,
	[Images] = @Images,
	[CreateDate] = @CreateDate,
	[CreateBy] = @CreateBy,
	[Source] = @Source
WHERE
	[RealEstateNewsID] = @RealEstateNewsID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwners_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwners_Add*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwners_Add]
	@RealEstateOwnersID int OUTPUT
	,@RealEstateOwnersTypeID int
	,@RealEstateOwnersName nvarchar(100)
	,@CLUR tinyint
	,@Address nvarchar(200)
	,@MobileNumber nchar(15)
	,@Email nvarchar(100)
	,@Gender bit
	,@IdentityCard nchar(15)

AS

	INSERT INTO [RealEstateOwners]
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
	VALUES
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
	SELECT
		@RealEstateOwnersID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwners_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwners_Delete*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwners_Delete]
	@RealEstateOwnersID int
AS
DELETE
FROM
	[RealEstateOwners]
WHERE
	[RealEstateOwnersID] = @RealEstateOwnersID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwners_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwners_Get*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwners_Get]
AS
SELECT
	--[RealEstateOwnersID],
	--[RealEstateOwnersTypeID],
	--[RealEstateOwnersName],
	--[CLUR],
	--[Address],
	--[MobileNumber],
	--[Email],
	--[Gender],
	--[IdentityCard]

*
FROM
	[RealEstateOwners]

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwners_GetByRealEstateOwnersID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwners_GetByRealEstateOwnersID*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwners_GetByRealEstateOwnersID]
@RealEstateOwnersID int
AS
SELECT
	--[RealEstateOwnersID],
	--[RealEstateOwnersTypeID],
	--[RealEstateOwnersName],
	--[CLUR],
	--[Address],
	--[MobileNumber],
	--[Email],
	--[Gender],
	--[IdentityCard]

*
FROM
	[RealEstateOwners]
WHERE
	[RealEstateOwnersID] = @RealEstateOwnersID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwners_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwners_GetCount*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwners_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[RealEstateOwners]

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwners_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwners_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwners_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [RealEstateOwnersID]
FROM [RealEstateOwners]


-- query out
SELECT *
FROM [RealEstateOwners]
WHERE [RealEstateOwnersID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwners_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwners_Update*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwners_Update]
	@RealEstateOwnersTypeID int,
	@RealEstateOwnersName nvarchar(100),
	@CLUR tinyint,
	@Address nvarchar(200),
	@MobileNumber nchar(15),
	@Email nvarchar(100),
	@Gender bit,
	@IdentityCard nchar(15),
	@RealEstateOwnersID int

AS
UPDATE [RealEstateOwners]
SET
	[RealEstateOwnersTypeID] = @RealEstateOwnersTypeID,
	[RealEstateOwnersName] = @RealEstateOwnersName,
	[CLUR] = @CLUR,
	[Address] = @Address,
	[MobileNumber] = @MobileNumber,
	[Email] = @Email,
	[Gender] = @Gender,
	[IdentityCard] = @IdentityCard
WHERE
	[RealEstateOwnersID] = @RealEstateOwnersID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwnersType_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwnersType_Add*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwnersType_Add]
	@RealEstateOwnersTypeID int OUTPUT
	,@RealEstateOwnersTypeName nchar(10)

AS

	INSERT INTO [RealEstateOwnersType]
	(
		[RealEstateOwnersTypeName]
	)
	VALUES
	(
		@RealEstateOwnersTypeName
	)
	SELECT
		@RealEstateOwnersTypeID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwnersType_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwnersType_Delete*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwnersType_Delete]
	@RealEstateOwnersTypeID int
AS
DELETE
FROM
	[RealEstateOwnersType]
WHERE
	[RealEstateOwnersTypeID] = @RealEstateOwnersTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwnersType_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwnersType_Get*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwnersType_Get]
AS
SELECT
	--[RealEstateOwnersTypeID],
	--[RealEstateOwnersTypeName]

*
FROM
	[RealEstateOwnersType]

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwnersType_GetByRealEstateOwnersTypeID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwnersType_GetByRealEstateOwnersTypeID*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwnersType_GetByRealEstateOwnersTypeID]
@RealEstateOwnersTypeID int
AS
SELECT
	--[RealEstateOwnersTypeID],
	--[RealEstateOwnersTypeName]

*
FROM
	[RealEstateOwnersType]
WHERE
	[RealEstateOwnersTypeID] = @RealEstateOwnersTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwnersType_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwnersType_GetCount*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwnersType_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[RealEstateOwnersType]

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwnersType_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwnersType_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwnersType_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [RealEstateOwnersTypeID]
FROM [RealEstateOwnersType]


-- query out
SELECT *
FROM [RealEstateOwnersType]
WHERE [RealEstateOwnersTypeID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateOwnersType_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateOwnersType_Update*/
CREATE PROCEDURE [dbo].[sproc_RealEstateOwnersType_Update]
	@RealEstateOwnersTypeName nchar(10),
	@RealEstateOwnersTypeID int

AS
UPDATE [RealEstateOwnersType]
SET
	[RealEstateOwnersTypeName] = @RealEstateOwnersTypeName
WHERE
	[RealEstateOwnersTypeID] = @RealEstateOwnersTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstates_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstates_Add*/
CREATE PROCEDURE [dbo].[sproc_RealEstates_Add]
	@RealEstateID int OUTPUT
	,@RealEstateName nvarchar(100)
	,@RealEstateTypeID int
	,@LocationID int
	,@CityID int
	,@RegionID int
	,@DistrictID int
	,@RealEstateOwnersID int
	,@Address int
	,@Price float(8)
	,@Description nvarchar(250)
	,@CreateBy nvarchar(50)
	,@CreateDate datetime
	,@Area float(8)
	,@Lengh float(8)
	,@Width float(8)
	,@Height float(8)
	,@Images nvarchar(250)
	,@Status tinyint
	,@IsVip tinyint
	,@Period datetime

AS

	INSERT INTO [RealEstates]
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
	VALUES
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
	SELECT
		@RealEstateID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstates_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstates_Delete*/
CREATE PROCEDURE [dbo].[sproc_RealEstates_Delete]
	@RealEstateID int
AS
DELETE
FROM
	[RealEstates]
WHERE
	[RealEstateID] = @RealEstateID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstates_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstates_Get*/
CREATE PROCEDURE [dbo].[sproc_RealEstates_Get]
AS
SELECT
	--[RealEstateID],
	--[RealEstateName],
	--[RealEstateTypeID],
	--[LocationID],
	--[CityID],
	--[RegionID],
	--[DistrictID],
	--[RealEstateOwnersID],
	--[Address],
	--[Price],
	--[Description],
	--[CreateBy],
	--[CreateDate],
	--[Area],
	--[Lengh],
	--[Width],
	--[Height],
	--[Images],
	--[Status],
	--[IsVip],
	--[Period]

*
FROM
	[RealEstates]

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstates_GetByRealEstateID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstates_GetByRealEstateID*/
CREATE PROCEDURE [dbo].[sproc_RealEstates_GetByRealEstateID]
@RealEstateID int
AS
SELECT
	--[RealEstateID],
	--[RealEstateName],
	--[RealEstateTypeID],
	--[LocationID],
	--[CityID],
	--[RegionID],
	--[DistrictID],
	--[RealEstateOwnersID],
	--[Address],
	--[Price],
	--[Description],
	--[CreateBy],
	--[CreateDate],
	--[Area],
	--[Lengh],
	--[Width],
	--[Height],
	--[Images],
	--[Status],
	--[IsVip],
	--[Period]

*
FROM
	[RealEstates]
WHERE
	[RealEstateID] = @RealEstateID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstates_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstates_GetCount*/
CREATE PROCEDURE [dbo].[sproc_RealEstates_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[RealEstates]

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstates_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstates_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_RealEstates_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [RealEstateID]
FROM [RealEstates]


-- query out
SELECT *
FROM [RealEstates]
WHERE [RealEstateID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstates_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstates_Update*/
CREATE PROCEDURE [dbo].[sproc_RealEstates_Update]
	@RealEstateName nvarchar(100),
	@RealEstateTypeID int,
	@LocationID int,
	@CityID int,
	@RegionID int,
	@DistrictID int,
	@RealEstateOwnersID int,
	@Address int,
	@Price float(8),
	@Description nvarchar(250),
	@CreateBy nvarchar(50),
	@CreateDate datetime,
	@Area float(8),
	@Lengh float(8),
	@Width float(8),
	@Height float(8),
	@Images nvarchar(250),
	@Status tinyint,
	@IsVip tinyint,
	@Period datetime,
	@RealEstateID int

AS
UPDATE [RealEstates]
SET
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
WHERE
	[RealEstateID] = @RealEstateID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateType_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateType_Add*/
CREATE PROCEDURE [dbo].[sproc_RealEstateType_Add]
	@RealEstateTypeID int OUTPUT
	,@NameRealEstateType nvarchar(100)
	,@Description nvarchar(250)

AS

	INSERT INTO [RealEstateType]
	(
		[NameRealEstateType],
		[Description]
	)
	VALUES
	(
		@NameRealEstateType,
		@Description
	)
	SELECT
		@RealEstateTypeID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateType_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateType_Delete*/
CREATE PROCEDURE [dbo].[sproc_RealEstateType_Delete]
	@RealEstateTypeID int
AS
DELETE
FROM
	[RealEstateType]
WHERE
	[RealEstateTypeID] = @RealEstateTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateType_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateType_Get*/
CREATE PROCEDURE [dbo].[sproc_RealEstateType_Get]
AS
SELECT
	--[RealEstateTypeID],
	--[NameRealEstateType],
	--[Description]

*
FROM
	[RealEstateType]

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateType_GetByRealEstateTypeID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateType_GetByRealEstateTypeID*/
CREATE PROCEDURE [dbo].[sproc_RealEstateType_GetByRealEstateTypeID]
@RealEstateTypeID int
AS
SELECT
	--[RealEstateTypeID],
	--[NameRealEstateType],
	--[Description]

*
FROM
	[RealEstateType]
WHERE
	[RealEstateTypeID] = @RealEstateTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateType_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateType_GetCount*/
CREATE PROCEDURE [dbo].[sproc_RealEstateType_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[RealEstateType]

GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateType_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateType_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_RealEstateType_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [RealEstateTypeID]
FROM [RealEstateType]


-- query out
SELECT *
FROM [RealEstateType]
WHERE [RealEstateTypeID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_RealEstateType_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_RealEstateType_Update*/
CREATE PROCEDURE [dbo].[sproc_RealEstateType_Update]
	@NameRealEstateType nvarchar(100),
	@Description nvarchar(250),
	@RealEstateTypeID int

AS
UPDATE [RealEstateType]
SET
	[NameRealEstateType] = @NameRealEstateType,
	[Description] = @Description
WHERE
	[RealEstateTypeID] = @RealEstateTypeID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Region_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Region_Add*/
CREATE PROCEDURE [dbo].[sproc_Region_Add]
	@RegionID int OUTPUT
	,@RegionName nvarchar(100)

AS

	INSERT INTO [Region]
	(
		[RegionName]
	)
	VALUES
	(
		@RegionName
	)
	SELECT
		@RegionID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Region_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Region_Delete*/
CREATE PROCEDURE [dbo].[sproc_Region_Delete]
	@RegionID int
AS
DELETE
FROM
	[Region]
WHERE
	[RegionID] = @RegionID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Region_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Region_Get*/
CREATE PROCEDURE [dbo].[sproc_Region_Get]
AS
SELECT
	--[RegionID],
	--[RegionName]

*
FROM
	[Region]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Region_GetByRegionID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Region_GetByRegionID*/
CREATE PROCEDURE [dbo].[sproc_Region_GetByRegionID]
@RegionID int
AS
SELECT
	--[RegionID],
	--[RegionName]

*
FROM
	[Region]
WHERE
	[RegionID] = @RegionID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Region_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Region_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Region_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Region]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Region_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Region_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Region_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [RegionID]
FROM [Region]


-- query out
SELECT *
FROM [Region]
WHERE [RegionID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Region_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Region_Update*/
CREATE PROCEDURE [dbo].[sproc_Region_Update]
	@RegionName nvarchar(100),
	@RegionID int

AS
UPDATE [Region]
SET
	[RegionName] = @RegionName
WHERE
	[RegionID] = @RegionID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Staff_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Staff_Add*/
CREATE PROCEDURE [dbo].[sproc_Staff_Add]
	@StaffID int OUTPUT
	,@Fullname nvarchar(20)
	,@Gender bit
	,@Address nvarchar(100)
	,@IdNumber nvarchar(15)
	,@PhoneNumber nvarchar(15)
	,@HomePhone nvarchar(15)
	,@Email nvarchar(50)

AS

	INSERT INTO [Staff]
	(
		[Fullname],
		[Gender],
		[Address],
		[IdNumber],
		[PhoneNumber],
		[HomePhone],
		[Email]
	)
	VALUES
	(
		@Fullname,
		@Gender,
		@Address,
		@IdNumber,
		@PhoneNumber,
		@HomePhone,
		@Email
	)
	SELECT
		@StaffID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Staff_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Staff_Delete*/
CREATE PROCEDURE [dbo].[sproc_Staff_Delete]
	@StaffID int
AS
DELETE
FROM
	[Staff]
WHERE
	[StaffID] = @StaffID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Staff_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Staff_Get*/
CREATE PROCEDURE [dbo].[sproc_Staff_Get]
AS
SELECT
	--[StaffID],
	--[Fullname],
	--[Gender],
	--[Address],
	--[IdNumber],
	--[PhoneNumber],
	--[HomePhone],
	--[Email]

*
FROM
	[Staff]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Staff_GetByStaffID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Staff_GetByStaffID*/
CREATE PROCEDURE [dbo].[sproc_Staff_GetByStaffID]
@StaffID int
AS
SELECT
	--[StaffID],
	--[Fullname],
	--[Gender],
	--[Address],
	--[IdNumber],
	--[PhoneNumber],
	--[HomePhone],
	--[Email]

*
FROM
	[Staff]
WHERE
	[StaffID] = @StaffID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Staff_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Staff_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Staff_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Staff]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Staff_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Staff_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Staff_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [StaffID]
FROM [Staff]


-- query out
SELECT *
FROM [Staff]
WHERE [StaffID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Staff_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Staff_Update*/
CREATE PROCEDURE [dbo].[sproc_Staff_Update]
	@Fullname nvarchar(20),
	@Gender bit,
	@Address nvarchar(100),
	@IdNumber nvarchar(15),
	@PhoneNumber nvarchar(15),
	@HomePhone nvarchar(15),
	@Email nvarchar(50),
	@StaffID int

AS
UPDATE [Staff]
SET
	[Fullname] = @Fullname,
	[Gender] = @Gender,
	[Address] = @Address,
	[IdNumber] = @IdNumber,
	[PhoneNumber] = @PhoneNumber,
	[HomePhone] = @HomePhone,
	[Email] = @Email
WHERE
	[StaffID] = @StaffID

GO
/****** Object:  StoredProcedure [dbo].[sproc_trace_xe_action_map_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_trace_xe_action_map_Add*/
CREATE PROCEDURE [dbo].[sproc_trace_xe_action_map_Add]
	@trace_column_id smallint,
	@package_name nvarchar(60),
	@xe_action_name nvarchar(60)
AS

	INSERT INTO [trace_xe_action_map]
	(
		[trace_column_id],
		[package_name],
		[xe_action_name]
	)
	VALUES
	(
		@trace_column_id,
		@package_name,
		@xe_action_name
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_trace_xe_action_map_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_trace_xe_action_map_Get*/
CREATE PROCEDURE [dbo].[sproc_trace_xe_action_map_Get]
AS
SELECT
	--[trace_column_id],
	--[package_name],
	--[xe_action_name]

*
FROM
	[trace_xe_action_map]

GO
/****** Object:  StoredProcedure [dbo].[sproc_trace_xe_action_map_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_trace_xe_action_map_GetCount*/
CREATE PROCEDURE [dbo].[sproc_trace_xe_action_map_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[trace_xe_action_map]

GO
/****** Object:  StoredProcedure [dbo].[sproc_trace_xe_event_map_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_trace_xe_event_map_Add*/
CREATE PROCEDURE [dbo].[sproc_trace_xe_event_map_Add]
	@trace_event_id smallint,
	@package_name nvarchar(60),
	@xe_event_name nvarchar(60)
AS

	INSERT INTO [trace_xe_event_map]
	(
		[trace_event_id],
		[package_name],
		[xe_event_name]
	)
	VALUES
	(
		@trace_event_id,
		@package_name,
		@xe_event_name
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_trace_xe_event_map_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_trace_xe_event_map_Get*/
CREATE PROCEDURE [dbo].[sproc_trace_xe_event_map_Get]
AS
SELECT
	--[trace_event_id],
	--[package_name],
	--[xe_event_name]

*
FROM
	[trace_xe_event_map]

GO
/****** Object:  StoredProcedure [dbo].[sproc_trace_xe_event_map_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_trace_xe_event_map_GetCount*/
CREATE PROCEDURE [dbo].[sproc_trace_xe_event_map_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[trace_xe_event_map]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Users_Add]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Users_Add*/
CREATE PROCEDURE [dbo].[sproc_Users_Add]
	@UserID int OUTPUT
	,@UserName nvarchar(250)
	,@Password nvarchar(250)
	,@FullName nvarchar(50)
	,@Role int
	,@Gender bit
	,@Avatar nvarchar(200)
	,@CompanyName nvarchar(100)
	,@Birthday datetime
	,@Email nvarchar(100)
	,@Address nvarchar(250)
	,@MobilePhone nvarchar(50)
	,@HomePhone nvarchar(50)
	,@IdentityCard nvarchar(100)
	,@Status tinyint
	,@LastLoggedOn datetime
	,@CreatedDate datetime
	,@CreatedBy int
	,@IsFirstLogin bit
	,@GroupID int
	,@Active int
	,@Ord int

AS

	INSERT INTO [Users]
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
	VALUES
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
	SELECT
		@UserID = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_Users_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Users_Delete*/
CREATE PROCEDURE [dbo].[sproc_Users_Delete]
	@UserID int
AS
DELETE
FROM
	[Users]
WHERE
	[UserID] = @UserID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Users_Get]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Users_Get*/
CREATE PROCEDURE [dbo].[sproc_Users_Get]
AS
SELECT
	--[UserID],
	--[UserName],
	--[Password],
	--[FullName],
	--[Role],
	--[Gender],
	--[Avatar],
	--[CompanyName],
	--[Birthday],
	--[Email],
	--[Address],
	--[MobilePhone],
	--[HomePhone],
	--[IdentityCard],
	--[Status],
	--[LastLoggedOn],
	--[CreatedDate],
	--[CreatedBy],
	--[IsFirstLogin],
	--[GroupID],
	--[Active],
	--[Ord]

*
FROM
	[Users]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Users_GetByUserID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Users_GetByUserID*/
CREATE PROCEDURE [dbo].[sproc_Users_GetByUserID]
@UserID int
AS
SELECT
	--[UserID],
	--[UserName],
	--[Password],
	--[FullName],
	--[Role],
	--[Gender],
	--[Avatar],
	--[CompanyName],
	--[Birthday],
	--[Email],
	--[Address],
	--[MobilePhone],
	--[HomePhone],
	--[IdentityCard],
	--[Status],
	--[LastLoggedOn],
	--[CreatedDate],
	--[CreatedBy],
	--[IsFirstLogin],
	--[GroupID],
	--[Active],
	--[Ord]

*
FROM
	[Users]
WHERE
	[UserID] = @UserID

GO
/****** Object:  StoredProcedure [dbo].[sproc_Users_GetCount]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Users_GetCount*/
CREATE PROCEDURE [dbo].[sproc_Users_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[Users]

GO
/****** Object:  StoredProcedure [dbo].[sproc_Users_GetPaged]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Users_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_Users_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [UserID]
FROM [Users]


-- query out
SELECT *
FROM [Users]
WHERE [UserID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_Users_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_Users_Update*/
CREATE PROCEDURE [dbo].[sproc_Users_Update]
	@UserName nvarchar(250),
	@Password nvarchar(250),
	@FullName nvarchar(50),
	@Role int,
	@Gender bit,
	@Avatar nvarchar(200),
	@CompanyName nvarchar(100),
	@Birthday datetime,
	@Email nvarchar(100),
	@Address nvarchar(250),
	@MobilePhone nvarchar(50),
	@HomePhone nvarchar(50),
	@IdentityCard nvarchar(100),
	@Status tinyint,
	@LastLoggedOn datetime,
	@CreatedDate datetime,
	@CreatedBy int,
	@IsFirstLogin bit,
	@GroupID int,
	@Active int,
	@Ord int,
	@UserID int

AS
UPDATE [Users]
SET
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
WHERE
	[UserID] = @UserID

GO
/****** Object:  StoredProcedure [dbo].[User_CheckLogin]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[User_CheckLogin]
@UserName nvarchar(250),
@Password varchar(250)
as 
select * from [User] where UserName = @UserName and [Password] = @Password
GO
/****** Object:  StoredProcedure [dbo].[User_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[User_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[User_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[User_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[User_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[User_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[User_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Users_CheckLogin]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Users_Delete]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/28/2015 12:28:33 AM
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
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/28/2015 12:28:32 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Users_Insert]
	@UserName nvarchar(500),
	@Password nvarchar(500),
	@FullName nvarchar(100),
	@Gender bit,
	@Avatar nvarchar(400),
	@Birthday datetime,
	@Email nvarchar(200),
	@Address nvarchar(500),
	@IdentityCard nchar(30),
	@MobilePhone nvarchar(100),
	@LastLoggedOn datetime,
	@CreatedDate datetime,
	@GroupID int,
	@Active int,
	@Ord int,
	@Level nvarchar(100),
	@Admin bit
As
	Insert Into [Users]
	(
		[UserName],
		[Password],
		[FullName],
		[Gender],
		[Avatar],
		[Birthday],
		[Email],
		[Address],
		[IdentityCard],
		[MobilePhone],
		[LastLoggedOn],
		[CreatedDate],
		[GroupID],
		[Active],
		[Ord],
		[Level],
		[Admin]
	)
	Values
	(
		@UserName,
		@Password,
		@FullName,
		@Gender,
		@Avatar,
		@Birthday,
		@Email,
		@Address,
		@IdentityCard,
		@MobilePhone,
		@LastLoggedOn,
		@CreatedDate,
		@GroupID,
		@Active,
		@Ord,
		@Level,
		@Admin
	)
	--Set @UserID = Scope_Identity()
	Select Scope_Identity()
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAll]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/28/2015 12:28:33 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================
CREATE PROCEDURE [dbo].[Users_SelectAll]
As
	Select * From [Users]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/28/2015 12:28:33 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Users_SelectByID]
	@UserID int
As
	Select *  From [Users]
 	Where  ([UserID] = @UserID)
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectPage]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/28/2015 12:28:33 AM
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
/****** Object:  StoredProcedure [dbo].[Users_SelectTop]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/28/2015 12:28:33 AM
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
/****** Object:  StoredProcedure [dbo].[Users_TestByID]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/28/2015 12:28:33 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Users_TestByID]
	@UserID int,
	@TestID Bit Output
As
	Select [UserID] From [Users]
 	Where  ([UserID] = @UserID)
	If(@@rowcount =0) Set @TestID = 0
	Else Set @TestID = 1
GO
/****** Object:  StoredProcedure [dbo].[Users_Update]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==============================================
-- Author: AutoNetCoder @ 2015
-- Create date: 4/28/2015 12:28:33 AM
-- Project: RealEstate
-- Description: Auto code by AutoNetCoder
-- Website: http://.www.softviet.net
--==============================================

CREATE PROCEDURE [dbo].[Users_Update]
	@UserID int,
	@UserName nvarchar(500),
	@Password nvarchar(500),
	@FullName nvarchar(100),
	@Gender bit,
	@Avatar nvarchar(400),
	@Birthday datetime,
	@Email nvarchar(200),
	@Address nvarchar(500),
	@IdentityCard nchar(30),
	@MobilePhone nvarchar(100),
	@LastLoggedOn datetime,
	@CreatedDate datetime,
	@GroupID int,
	@Active int,
	@Ord int,
	@Level nvarchar(100),
	@Admin bit
As
	Update [Users]  Set
		[UserName] = @UserName,
		[Password] = @Password,
		[FullName] = @FullName,
		[Gender] = @Gender,
		[Avatar] = @Avatar,
		[Birthday] = @Birthday,
		[Email] = @Email,
		[Address] = @Address,
		[IdentityCard] = @IdentityCard,
		[MobilePhone] = @MobilePhone,
		[LastLoggedOn] = @LastLoggedOn,
		[CreatedDate] = @CreatedDate,
		[GroupID] = @GroupID,
		[Active] = @Active,
		[Ord] = @Ord,
		[Level] = @Level,
		[Admin] = @Admin
	Where ([UserID] = @UserID)
GO
/****** Object:  StoredProcedure [dbo].[Users_UpdatePassword]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Users_UpdatePassword]
@UserName nvarchar(250),
@Password varchar(250)
as 
UPDATE [Users] SET [Password] = @Password	 WHERE UserName = @UserName

GO
/****** Object:  Table [dbo].[Advertise]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Advertise](
	[AdvID] [int] IDENTITY(1,1) NOT NULL,
	[RealEstateID] [int] NULL,
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
	[Active] [bit] NULL,
	[Lang] [varchar](5) NULL,
 CONSTRAINT [PK_Advertise] PRIMARY KEY CLUSTERED 
(
	[AdvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment](
	[ApartmentID] [int] IDENTITY(1,1) NOT NULL,
	[RealEstateOwnersID] [int] NOT NULL,
	[RealEstateID] [int] NULL,
	[CityID] [int] NULL,
	[DistrictID] [int] NULL,
	[LocationID] [int] NULL,
	[Title] [nvarchar](250) NULL,
	[Name] [nvarchar](50) NULL,
	[Tag] [nvarchar](250) NULL,
	[TransactionType] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
	[Address] [nvarchar](250) NULL,
	[Price] [float] NULL,
	[TotalArea] [float] NULL,
	[FloorArea] [float] NULL,
	[HomeArea] [float] NULL,
	[BedroomNumber] [tinyint] NULL,
	[TierNumber] [tinyint] NULL,
	[CreateDate] [date] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[Image1] [nvarchar](250) NULL,
	[Image2] [nvarchar](250) NULL,
	[Image3] [nvarchar](250) NULL,
	[Image4] [nvarchar](250) NULL,
	[Image5] [nvarchar](250) NULL,
	[Image6] [nvarchar](250) NULL,
	[Lang] [nchar](10) NULL,
 CONSTRAINT [PK_tblApartment] PRIMARY KEY CLUSTERED 
(
	[ApartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Banner]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[Broker]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Broker](
	[BrokerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nchar](10) NULL,
	[About] [nvarchar](1000) NULL,
	[Birthday] [date] NULL,
	[IdentityCard] [nchar](15) NULL,
	[Address] [nvarchar](200) NULL,
	[HomePhone] [nchar](15) NULL,
	[MobiPhone] [nchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[PropertyNumber] [int] NULL,
	[RealEstateName] [nvarchar](250) NULL,
 CONSTRAINT [PK_Broker] PRIMARY KEY CLUSTERED 
(
	[BrokerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[City]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [varchar](5) NOT NULL,
	[CityCode] [varchar](5) NULL,
	[CityName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Companys]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[ContractAdvertising]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[Controls]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Birthday] [datetime] NULL,
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
/****** Object:  Table [dbo].[District]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[District](
	[DistrictID] [int] IDENTITY(1,1) NOT NULL,
	[CityCode] [varchar](5) NULL,
	[DistrictCode] [varchar](5) NULL,
	[DistrictName] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblDistrictID] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Group](
	[GroupID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ParentID] [int] NOT NULL,
	[GroupName] [nvarchar](100) NULL,
	[Description] [nvarchar](250) NULL,
	[Status] [tinyint] NOT NULL,
	[Priority] [int] NOT NULL,
	[Lang] [varchar](5) NULL,
 CONSTRAINT [PK_AdminGroups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Home]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Home](
	[HomeID] [int] IDENTITY(1,1) NOT NULL,
	[HomeTypeID] [int] NULL,
	[RealEstateOwnersID] [int] NULL,
	[RealEstateID] [int] NULL,
	[CityID] [int] NULL,
	[DistrictID] [int] NULL,
	[LocationID] [int] NULL,
	[RealEstateOwnersName] [nvarchar](100) NULL,
	[Title] [nvarchar](250) NULL,
	[Name] [nvarchar](250) NULL,
	[TransactionType] [nvarchar](50) NULL,
	[Description] [text] NULL,
	[Address] [nvarchar](250) NULL,
	[Tag] [nvarchar](256) NULL,
	[Price] [float] NULL,
	[TotalArea] [float] NULL,
	[FloorArea] [float] NULL,
	[GargenArea] [float] NULL,
	[HomeArea] [float] NULL,
	[BedroomNumber] [tinyint] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDate] [date] NULL,
	[TierNumber] [tinyint] NULL,
	[Image1] [nvarchar](250) NULL,
	[Image2] [nvarchar](250) NULL,
	[Image3] [nvarchar](250) NULL,
	[Image4] [nvarchar](250) NULL,
	[Image5] [nvarchar](250) NULL,
	[Image6] [nvarchar](250) NULL,
 CONSTRAINT [PK_tblHome] PRIMARY KEY CLUSTERED 
(
	[HomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HomeType]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeType](
	[HomeTypeID] [int] NOT NULL,
	[HomeTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblHomeType] PRIMARY KEY CLUSTERED 
(
	[HomeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Land]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Land](
	[LandID] [int] IDENTITY(1,1) NOT NULL,
	[LandTypeID] [int] NOT NULL,
	[RealEstateOwnersID] [int] NULL,
	[RealEstateID] [int] NULL,
	[CityID] [int] NULL,
	[DistrictID] [int] NULL,
	[LocationID] [int] NULL,
	[Title] [nvarchar](250) NULL,
	[Name] [nvarchar](250) NULL,
	[TransactionType] [nvarchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[RealEstateOwnersName] [nvarchar](100) NULL,
	[Tag] [nvarchar](250) NULL,
	[Price] [float] NULL,
	[TotalArea] [float] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDate] [date] NULL,
	[Image1] [nvarchar](250) NULL,
	[Image2] [nvarchar](250) NULL,
	[Image3] [nvarchar](250) NULL,
	[Image4] [nvarchar](250) NULL,
	[Image5] [nvarchar](250) NULL,
	[Image6] [nvarchar](250) NULL,
 CONSTRAINT [PK_tblLand] PRIMARY KEY CLUSTERED 
(
	[LandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LandType]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandType](
	[LandTypeID] [int] NOT NULL,
	[LandTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblLandType] PRIMARY KEY CLUSTERED 
(
	[LandTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Language]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[Links]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Links](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Line1] [nvarchar](250) NULL,
	[Line2] [nvarchar](250) NULL,
	[Link1] [nvarchar](500) NULL,
	[Link2] [nvarchar](500) NULL,
	[Position] [int] NULL,
	[Ord] [int] NULL,
	[Active] [int] NULL,
	[Lang] [nchar](10) NULL,
 CONSTRAINT [PK_Links] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[Menus]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[Motel]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Motel](
	[MotelID] [int] IDENTITY(1,1) NOT NULL,
	[RealEstateOwnersID] [int] NOT NULL,
	[RealEstateID] [int] NULL,
	[MotelTypeID] [int] NULL,
	[CityID] [int] NULL,
	[DistrictID] [int] NULL,
	[LocationID] [int] NULL,
	[Tag] [nvarchar](500) NULL,
	[RealEstateOwnersName] [nvarchar](100) NULL,
	[Title] [nvarchar](1000) NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[Address] [nvarchar](250) NULL,
	[Price] [float] NULL,
	[TotalArea] [float] NULL,
	[IsClosed] [bit] NULL,
	[IsCooker] [bit] NULL,
	[Furniture] [nvarchar](50) NULL,
	[TierNumber] [tinyint] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDate] [date] NULL,
	[Image1] [nvarchar](250) NULL,
	[Image2] [nvarchar](250) NULL,
	[Image3] [nvarchar](250) NULL,
	[Image4] [nvarchar](250) NULL,
	[Image5] [nvarchar](250) NULL,
	[Image6] [nvarchar](250) NULL,
 CONSTRAINT [PK_tblMotel] PRIMARY KEY CLUSTERED 
(
	[MotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MotelType]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotelType](
	[MotelTypeID] [int] NOT NULL,
	[MotelTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblMotelType] PRIMARY KEY CLUSTERED 
(
	[MotelTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pages](
	[PageID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Tag] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[Detail] [nvarchar](250) NULL,
	[Level] [varchar](10) NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Keyword] [nvarchar](500) NULL,
	[Type] [nvarchar](50) NULL,
	[Link] [nvarchar](200) NULL,
	[Target] [nvarchar](100) NULL,
	[Index] [int] NULL,
	[Position] [int] NULL,
	[Active] [int] NULL,
	[Ord] [int] NULL,
	[Lang] [varchar](5) NULL,
 CONSTRAINT [PK_AdminMenu] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostContract]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[ProductType]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[RealEstateNews]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RealEstateNews](
	[RealEstateNewsID] [int] IDENTITY(1,1) NOT NULL,
	[RealEstateID] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[CategoryID] [int] NULL,
	[Images] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[Position] [int] NULL,
	[Source] [nvarchar](200) NULL,
	[Lang] [varchar](5) NULL,
 CONSTRAINT [PK_RealEstateNews] PRIMARY KEY CLUSTERED 
(
	[RealEstateNewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RealEstateOwners]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateOwners](
	[RealEstateOwnersID] [int] IDENTITY(1,1) NOT NULL,
	[RealEstateOwnersName] [nvarchar](100) NOT NULL,
	[CLUR] [nvarchar](10) NOT NULL,
	[RealEstateOwnersType] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[MobilePhone] [nchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[Gender] [nvarchar](10) NULL,
	[IdentityCard] [nchar](15) NULL,
 CONSTRAINT [PK_tblRealEstateOwners] PRIMARY KEY CLUSTERED 
(
	[RealEstateOwnersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RealEstateOwnersType]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateOwnersType](
	[RealEstateOwnersTypeID] [int] NOT NULL,
	[RealEstateOwnersTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RealEstateOwnersType] PRIMARY KEY CLUSTERED 
(
	[RealEstateOwnersTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RealEstates]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RealEstates](
	[RealEstateID] [int] IDENTITY(1,1) NOT NULL,
	[RealEstateName] [nvarchar](100) NOT NULL,
	[RealEstateTypeID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[RegionID] [int] NOT NULL,
	[DistrictID] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[RealEstateOwnersID] [int] NOT NULL,
	[Address] [int] NULL,
	[Price] [float] NULL,
	[Description] [nvarchar](250) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[Area] [float] NULL,
	[Lengh] [float] NULL,
	[Width] [float] NULL,
	[Height] [float] NULL,
	[Images] [nvarchar](250) NULL,
	[Lang] [varchar](5) NULL,
	[Status] [tinyint] NULL,
	[IsVip] [tinyint] NULL,
	[Period] [datetime] NULL,
 CONSTRAINT [PK_tblRealEstate] PRIMARY KEY CLUSTERED 
(
	[RealEstateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RealEstateType]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateType](
	[RealEstateTypeID] [int] NOT NULL,
	[NameRealEstateType] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_tblRealEstateType] PRIMARY KEY CLUSTERED 
(
	[RealEstateTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Region]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[Staff]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[tbvisistor]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 6/10/2015 2:09:27 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Gender] [bit] NULL,
	[Avatar] [nvarchar](200) NULL,
	[Birthday] [datetime] NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](250) NULL,
	[IdentityCard] [nchar](15) NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[LastLoggedOn] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[GroupID] [int] NULL,
	[Active] [int] NULL,
	[Ord] [int] NULL,
	[Level] [nvarchar](50) NULL,
	[Admin] [bit] NULL,
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
/****** Object:  View [dbo].[DistrictCity]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DistrictCity]
AS
SELECT        dbo.City.CityID, dbo.City.CityName, dbo.District.DistrictID, dbo.District.DistrictName
FROM            dbo.City INNER JOIN
                         dbo.District ON dbo.City.CityID = dbo.District.CityID

GO
/****** Object:  View [dbo].[HomeRE]    Script Date: 6/10/2015 2:09:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HomeRE]
AS
SELECT        dbo.HomeType.HomeTypeName, dbo.RealEstateOwners.RealEstateOwnersName, dbo.Home.HomeTypeID, dbo.Home.RealEstateOwnersID, dbo.Home.Name, dbo.Home.TransactionType, dbo.Home.Description, 
                         dbo.Home.Address, dbo.Home.Tag, dbo.Home.Price, dbo.Home.TotalArea, dbo.Home.FloorArea, dbo.Home.GargenArea, dbo.Home.HomeArea, dbo.Home.BedroomNumber, dbo.Home.TierNumber, 
                         dbo.Home.Image1, dbo.Home.Image2, dbo.Home.Image3, dbo.Home.Image4, dbo.Home.Image5, dbo.Home.Image6, dbo.Home.Title, dbo.Home.CreateDate, dbo.Home.CreateBy
FROM            dbo.HomeType INNER JOIN
                         dbo.Home ON dbo.HomeType.HomeTypeID = dbo.Home.HomeTypeID INNER JOIN
                         dbo.RealEstateOwners ON dbo.Home.RealEstateOwnersID = dbo.RealEstateOwners.RealEstateOwnersID

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
ALTER TABLE [dbo].[Pages] ADD  CONSTRAINT [DF_AdminMenu_Name]  DEFAULT ('') FOR [Content]
GO
ALTER TABLE [dbo].[Pages] ADD  CONSTRAINT [DF_AdminMenu_Status]  DEFAULT ((0)) FOR [Title]
GO
ALTER TABLE [dbo].[Pages] ADD  CONSTRAINT [DF_AdminMenu_Priority]  DEFAULT ((0)) FOR [Keyword]
GO
ALTER TABLE [dbo].[Advertise]  WITH CHECK ADD  CONSTRAINT [FK_Advertise_Pages] FOREIGN KEY([PageID])
REFERENCES [dbo].[Pages] ([PageID])
ON UPDATE CASCADE
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
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ContractAdvertising] CHECK CONSTRAINT [FK_tblContractAdvertising_tblBanner]
GO
ALTER TABLE [dbo].[ContractAdvertising]  WITH CHECK ADD  CONSTRAINT [FK_tblContractAdvertising_tblCompanys] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companys] ([CompanyID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ContractAdvertising] CHECK CONSTRAINT [FK_tblContractAdvertising_tblCompanys]
GO
ALTER TABLE [dbo].[ContractAdvertising]  WITH CHECK ADD  CONSTRAINT [FK_tblContractAdvertising_tblStaff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ContractAdvertising] CHECK CONSTRAINT [FK_tblContractAdvertising_tblStaff]
GO
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD  CONSTRAINT [FK_tblControls_tblPages] FOREIGN KEY([PageId])
REFERENCES [dbo].[Pages] ([PageID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Controls] CHECK CONSTRAINT [FK_tblControls_tblPages]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_tblDistrictID_tblCity] FOREIGN KEY([CityCode])
REFERENCES [dbo].[City] ([CityID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_tblDistrictID_tblCity]
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
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_tblMenus_tblGroup]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_tblMenus_tblPages] FOREIGN KEY([PageID])
REFERENCES [dbo].[Pages] ([PageID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_tblMenus_tblPages]
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
ALTER TABLE [dbo].[RealEstateNews]  WITH CHECK ADD  CONSTRAINT [FK_RealEstateNews_RealEstates] FOREIGN KEY([RealEstateID])
REFERENCES [dbo].[RealEstates] ([RealEstateID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RealEstateNews] CHECK CONSTRAINT [FK_RealEstateNews_RealEstates]
GO
ALTER TABLE [dbo].[RealEstates]  WITH CHECK ADD  CONSTRAINT [FK_tblRealEstate_tblRealEstateOwners] FOREIGN KEY([RealEstateOwnersID])
REFERENCES [dbo].[RealEstateOwners] ([RealEstateOwnersID])
GO
ALTER TABLE [dbo].[RealEstates] CHECK CONSTRAINT [FK_tblRealEstate_tblRealEstateOwners]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "City"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "District"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DistrictCity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DistrictCity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[68] 4[13] 2[18] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HomeType"
            Begin Extent = 
               Top = 0
               Left = 390
               Bottom = 93
               Right = 570
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Home"
            Begin Extent = 
               Top = 0
               Left = 6
               Bottom = 130
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 24
         End
         Begin Table = "RealEstateOwners"
            Begin Extent = 
               Top = 178
               Left = 255
               Bottom = 308
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HomeRE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HomeRE'
GO

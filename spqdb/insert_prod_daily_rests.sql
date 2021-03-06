USE [spqdb]
GO
/****** Object:  StoredProcedure [dbo].[insert_prod_daily_rests]    Script Date: 25.08.2017 10:36:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[insert_prod_daily_rests]
	@date_time datetime2(7),
	@deleted datetime2(7),
	@notes varchar(255),
	@volume float,
	@product_id varchar(100)

AS
BEGIN
INSERT INTO
	[spqdb].dbo.[prod_daily_rests]
	([date_time],
	[deleted],
	[notes],
	[volume],
	[product_id])
VALUES
	(@date_time,
	@deleted,
	@notes,
	@volume,
	(SELECT TOP 1 
	product_id 
	FROM dbo.products
	WHERE
		id1c = @product_id))
END

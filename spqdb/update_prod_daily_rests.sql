USE [spqdb]
GO
/****** Object:  StoredProcedure [dbo].[update_prod_daily_rests]    Script Date: 25.08.2017 10:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[update_prod_daily_rests]
	@date_time datetime2(7),
	@deleted datetime2(7),
	@notes varchar(255),
	@volume float,
	@profuct_id varchar(100)

AS
BEGIN
	UPDATE [spqdb].dbo.[prod_daily_rests]
	SET
		[date_time] = @date_time,
		[deleted] = @deleted,
		[notes] = @notes,
		[volume] = @volume,
		[product_id] = 
		(SELECT TOP 1 
		product_id 
		FROM dbo.products
		WHERE
			id1c = @profuct_id)
	WHERE
		[date_time] = @date_time 
		AND [product_id] =	
		(SELECT TOP 1 
		product_id 
		FROM dbo.products
		WHERE
			id1c = @profuct_id)
END

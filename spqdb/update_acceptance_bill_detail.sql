USE [spqdb]
GO
/****** Object:  StoredProcedure [dbo].[update_acceptance_bill_detail]    Script Date: 25.08.2017 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[update_acceptance_bill_detail]
	@deleted			datetime2(7),
	@notes				varchar(255),
	@part_num			varchar(20),
	@quantity_by_pallet float,
	@quantity_by_volume float,
	@product_id			varchar(100),
	@id1c				varchar(36)

AS
BEGIN
UPDATE 
	[spqdb].dbo.[acceptance_bill_detail]
SET
	[deleted]				= @deleted,
	[notes]					= @notes,
	[part_num]				= @part_num,
	[quantity_by_pallet]	= @quantity_by_pallet,
	[quantity_by_volume]	= @quantity_by_volume,
	[acc_bill_id]			= (SELECT TOP 1 acceptance_bill_id
								FROM dbo.acceptance_bill
								WHERE id1c = @id1c),
	[product_id]			= (SELECT TOP 1 product_id 
								FROM dbo.products
								WHERE id1c = @product_id)
WHERE
	[acc_bill_id]			= (SELECT TOP 1 acceptance_bill_id
								FROM dbo.acceptance_bill
								WHERE id1c = @id1c) 
	AND 
	[product_id]			= (SELECT TOP 1 product_id 
								FROM dbo.products
								WHERE id1c = @product_id) 
END

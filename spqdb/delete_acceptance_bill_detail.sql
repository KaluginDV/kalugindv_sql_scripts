USE [spqdb]
GO
/****** Object:  StoredProcedure [dbo].[delete_acceptance_bill_detail]    Script Date: 25.08.2017 10:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[delete_acceptance_bill_detail]
	@id1c				varchar(36)

AS
BEGIN
DELETE 
	[spqdb].dbo.[acceptance_bill_detail]
WHERE
	[acc_bill_id]			= (SELECT TOP 1 acceptance_bill_id
								FROM dbo.acceptance_bill
								WHERE id1c = @id1c)
END

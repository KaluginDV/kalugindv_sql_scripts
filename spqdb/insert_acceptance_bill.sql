USE [spqdb]
GO
/****** Object:  StoredProcedure [dbo].[insert_acceptance_bill]    Script Date: 25.08.2017 10:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[insert_acceptance_bill]
	@date_time datetime2(7),
	@deleted datetime2(7),
	@notes varchar(255),
	@num bigint,
	@shift_id varchar(100),
	@shiftman_id varchar(100),
	@storekeeper_id bigint,
	@id1c varchar(36)

AS
BEGIN
INSERT INTO
	[spqdb].dbo.[acceptance_bill]
	([date_time],
	[deleted],
	[notes],
	[num],
	[shift_id],
	[shiftman_id],
	[storekeeper_id],
	[id1c])
VALUES
	(@date_time,
	@deleted,
	@notes,
	@num,
	(SELECT TOP 1 
		shift_id
	FROM dbo.shifts
	WHERE
		id1c = @shift_id),
	(SELECT TOP 1 
		person_id
	FROM dbo.personal
	WHERE
		id1c = @shiftman_id),
	@storekeeper_id,
	@id1c)
END

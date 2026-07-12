CREATE TABLE [dbo].[tblRole] (
    [rleID]               INT              IDENTITY (1, 1) NOT NULL,
    [rleName]             VARCHAR (300)    NOT NULL,
    [rleDateCreated]      DATETIME         DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [rleCreatedBy_prnID]  INT              NULL,
    [rleDateModified]     DATETIME         NULL,
    [rleModifiedBy_prnID] INT              NULL,
    [rleGUID]             UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([rleID] ASC),
    CONSTRAINT [tblRole_rleCreatedBy_prnID_tblPerson] FOREIGN KEY ([rleCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [tblRole_rleModifiedBy_prnID_tblPerson] FOREIGN KEY ([rleModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID])
);


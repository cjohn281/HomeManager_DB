CREATE TABLE [dbo].[tblSystem] (
    [sysID]               INT              IDENTITY (1, 1) NOT NULL,
    [sysParent_sysID]     INT              NULL,
    [sysName]             VARCHAR (50)     NOT NULL,
    [sysDateCreated]      DATETIME         CONSTRAINT [DF_tblSystem_sysDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NOT NULL,
    [sysCreatedBy_prnID]  INT              NULL,
    [sysDateModified]     DATETIME         NULL,
    [sysModifiedBy_prnID] INT              NULL,
    [sysGUID]             UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([sysID] ASC),
    CONSTRAINT [fk_tblSystem_sysCreatedBy_prnID_tblPerson] FOREIGN KEY ([sysCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblSystem_sysModifiedBy_prnID_tblPerson] FOREIGN KEY ([sysModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblSystem_sysParent_sysID_tblSystem] FOREIGN KEY ([sysParent_sysID]) REFERENCES [dbo].[tblSystem] ([sysID])
);


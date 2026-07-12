CREATE TABLE [dbo].[tblLookupType] (
    [lktID]               INT              IDENTITY (1, 1) NOT NULL,
    [lktName]             VARCHAR (300)    NOT NULL,
    [lktsystem_sysID]     INT              NOT NULL,
    [lktDateCreated]      DATETIME         CONSTRAINT [DF_tblLookupType_lktDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [lktCreatedBy_prnID]  INT              NULL,
    [lktDateModified]     DATETIME         NULL,
    [lktModifiedBy_prnID] INT              NULL,
    [lktGUID]             UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([lktID] ASC),
    CONSTRAINT [fk_tblLookupType_lktCreatedBy_prnID_tblPerson] FOREIGN KEY ([lktCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblLookupType_lktModifiedBy_prnID_tblPerson] FOREIGN KEY ([lktModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblLookupType_lktSystem_sysID_tblSystem] FOREIGN KEY ([lktsystem_sysID]) REFERENCES [dbo].[tblSystem] ([sysID])
);


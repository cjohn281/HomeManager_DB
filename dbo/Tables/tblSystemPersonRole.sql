CREATE TABLE [dbo].[tblSystemPersonRole] (
    [sprID]               INT              IDENTITY (1, 1) NOT NULL,
    [sprSystem_sysID]     INT              NOT NULL,
    [sprPerson_prnID]     INT              NOT NULL,
    [sprRole_rleID]       INT              NOT NULL,
    [sprDateCreated]      DATETIME         DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [sprCreatedBy_prnID]  INT              NULL,
    [sprDateModified]     DATETIME         NULL,
    [sprModifiedBy_prnID] INT              NULL,
    [sprGUID]             UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([sprID] ASC),
    CONSTRAINT [fk_tblSystemPersonRole_sprCreatedBy_prnID_tblPerson] FOREIGN KEY ([sprCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblSystemPersonRole_sprModifiedBy_prnID_tblPerson] FOREIGN KEY ([sprModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblSystemPersonRole_sprPerson_prnID_tblPerson] FOREIGN KEY ([sprPerson_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblSystemPersonRole_sprRole_rleID_tblRole] FOREIGN KEY ([sprRole_rleID]) REFERENCES [dbo].[tblRole] ([rleID]),
    CONSTRAINT [fk_tblSystemPersonRole_sprSystem_sysID_tblSystem] FOREIGN KEY ([sprSystem_sysID]) REFERENCES [dbo].[tblSystem] ([sysID]),
    CONSTRAINT [UQ_tblSystemPersonRole] UNIQUE NONCLUSTERED ([sprSystem_sysID] ASC, [sprPerson_prnID] ASC)
);


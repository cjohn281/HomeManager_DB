CREATE TABLE [dbo].[tblPerson] (
    [prnID]               INT              IDENTITY (1, 1) NOT NULL,
    [prnNameFirst]        VARCHAR (30)     NOT NULL,
    [prnNameLast]         VARCHAR (30)     NOT NULL,
    [prnEmail]            VARCHAR (320)    NOT NULL,
    [prnSalt]             VARCHAR (1000)   NOT NULL,
    [prnPassword]         VARCHAR (1000)   NOT NULL,
    [prnDateCreated]      DATETIME         CONSTRAINT [DF_tblPerson_prnDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [prnCreatedBy_prnID]  INT              NULL,
    [prnDateModified]     DATETIME         NULL,
    [prnModifiedBy_prnID] INT              NULL,
    [prnGUID]             UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([prnID] ASC),
    CONSTRAINT [fk_tblPerson_prnCreatedBy_prnID_tblPerson] FOREIGN KEY ([prnCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblPerson_prnModifiedBy_prnID_tblPerson] FOREIGN KEY ([prnModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID])
);


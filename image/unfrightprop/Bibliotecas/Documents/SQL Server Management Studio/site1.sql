USE [Db_Tank]
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Active]    Script Date: 25/01/2015 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Zuck - Ragezone Brazil>
-- ALTER  date: <2013-07-12>
-- Description:	<Procedure responsável pelo cadastro de usuários e a devida ativação do user>
-- Other Infos: <Procedure modificada por Zuck para postagem na Ragezone Brasil>
-- Version:     <1.2>
-- =============================================
ALTER Procedure [dbo].[SP_Users_Active]
@UserID int out,
@Attack int,
@Defence int,
@Luck int,
@Agility int,
@Gold int,
@Money int,
@Style Nvarchar(200),
@Colors Nvarchar(200),
@Hide int,
@Grade int,
@GP int,
@State int,
@ConsortiaID int,
@UserName Nvarchar(200),
@PassWord Nvarchar(200),
@Sex bit,
@ActiveIP Nvarchar(50),
@Skin Nvarchar(500),
@Site nvarchar(200),
@code int,
@Coins int,
@vipdays int

as
declare @count int
-- Aqui começam as modificações

set @Money = '5000'; -- Quantidade de Cupons
set @Gold = '5000';  -- Quantidade de GOLD
set @Grade = '16';      -- O level
set @GP = '202472';  -- Quantidade de XP! Lembra de olhar na LevelList.xml pra não bugar o level!!

-- Não modifica mais nada daqui pra baixo!

select @count= isnull(count(*),0) from Sys_Users_Detail where UserName = @UserName

if @count <> 0
begin
  return 1
end

set xact_abort on
begin tran

insert into Sys_Users_Detail(UserName,[PassWord],NickName,[Date],IsConsortia,ConsortiaID,Sex,Win,Total,[Escape],GP,Honor,Gold,[Money],Style,Colors,Hide,Grade,State,IsFirst,Repute,ActiveIP,IsExist,Skin,Site,code,coins,VipDays)
values(@UserName,@PassWord,'',getdate(),0,0,@Sex,0,0,0,@GP,'',@Gold,@Money,@Style,@Colors,@Hide,@Grade,@State,0,0,@ActiveIP,1,@Skin,@Site,@code,@Coins,@vipdays)

if @@error <> 0
begin
  rollback tran
  return @@error
end

select @UserID = isnull(@@IDENTITY ,0)

if @UserID = 0 
begin
  rollback tran
  return 1
end

insert into Sys_Users_Fight(UserID,Attack,Defence,Luck,Agility,[Delay],Honor,Map,Directory,IsExist)
values(@UserID,@Attack,@Defence,@Luck,@Agility,0,'','','',1)

if @@error<>0
begin
  rollback tran
  return @@error
end

INSERT INTO [Db_Tank].[dbo].[Sys_VIP_Info]
           ([UserID])
     VALUES
           (@UserID)

if @@error<>0
begin 
  rollback tran
  return @@error
end

INSERT INTO [Db_Tank].[dbo].[Sys_Users_Texp]
           ([UserID])
     VALUES
           (@UserID)

if @@error<>0
begin 
  rollback tran
  return @@error
end

insert into [Db_Tank].[dbo].[DailyLogList]([UserID]) values(@UserID)

if @@error<>0
begin 
  rollback tran
  return @@error
end

--@@
Declare @Index Int
Declare @type Int
Set @Index = 0
Set @type = 0
While @Index < 5
  Begin   
                 If @Index = 0
                     Begin
                       Set @type = 1
                     End
                  Else
                      Begin
                        Set @type = 0
                      End
     INSERT INTO [Db_Tank].[dbo].[Sys_Users_Card]
           ([UserID],[Place],[IsExit],[Type])
     VALUES(@UserID,@Index,1,@type)
     if @@error<>0
		begin 
			rollback tran
			return @@error
		end
    Set @Index = @Index+1
  End


--@@
commit tran
set xact_abort off
return 0

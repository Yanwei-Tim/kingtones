prompt PL/SQL Developer import file
prompt Created on 2011年5月10日 by Administrator
set feedback off
set define off
prompt Creating DOJO_TREE_T...
create table DOJO_TREE_T
(
  ID        VARCHAR2(32) not null,
  NAME      VARCHAR2(64),
  PARENT_ID VARCHAR2(128)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating GNMK...
create table GNMK
(
  ID     VARCHAR2(50) not null,
  GNMKDM VARCHAR2(50),
  GNMKMC VARCHAR2(50),
  GNMKLJ VARCHAR2(50),
  GNMKTB VARCHAR2(50),
  GNMKBZ VARCHAR2(50),
  GNMKSJ VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating PLOT...
create table PLOT
(
  ID           NUMBER,
  DEVICE_ID    VARCHAR2(30) not null,
  BEGINTIME    VARCHAR2(5) not null,
  ENDTIME      VARCHAR2(5) not null,
  INTERVALTIME NUMBER not null,
  FLAG         NUMBER default 0
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    minextents 1
    maxextents unlimited
  );

prompt Creating POLICETYPE...
create table POLICETYPE
(
  ID   NUMBER not null,
  NAME VARCHAR2(50),
  TYPE VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SSI_AUTH_MENU...
create table SSI_AUTH_MENU
(
  MENU_ID     VARCHAR2(32) not null,
  RESOURCE_ID VARCHAR2(32),
  NAME        VARCHAR2(64),
  DESCRIPTION VARCHAR2(128),
  PARENT_ID   VARCHAR2(32),
  POSITION    NUMBER(8),
  URL         VARCHAR2(128)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SSI_AUTH_M_MENU_ROLE...
create table SSI_AUTH_M_MENU_ROLE
(
  MENU_ID VARCHAR2(32) not null,
  ROLE_ID VARCHAR2(32) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SSI_AUTH_M_MENU_ROLE2...
create table SSI_AUTH_M_MENU_ROLE2
(
  MENU_ID VARCHAR2(32) not null,
  ROLE_ID VARCHAR2(32) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SSI_AUTH_M_ROLE_RESOURCE...
create table SSI_AUTH_M_ROLE_RESOURCE
(
  ROLE_ID     VARCHAR2(32) not null,
  RESOURCE_ID VARCHAR2(32) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSI_AUTH_M_ROLE_RESOURCE
  add constraint PK_SSI_MAPP_RES_AND_ROLE primary key (ROLE_ID, RESOURCE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SSI_AUTH_M_USER_ROLE...
create table SSI_AUTH_M_USER_ROLE
(
  ROLE_ID VARCHAR2(32),
  USER_ID VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SSI_AUTH_RESOURCE...
create table SSI_AUTH_RESOURCE
(
  RESOURCE_ID VARCHAR2(32) not null,
  URL         VARCHAR2(512),
  TITLE       VARCHAR2(128),
  PARENT_ID   VARCHAR2(32),
  IS_LEAF     VARCHAR2(1),
  DESCRIPTION VARCHAR2(128)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSI_AUTH_RESOURCE
  add constraint PK_SSI_AUTH_RESOURCE primary key (RESOURCE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SSI_AUTH_ROLE...
create table SSI_AUTH_ROLE
(
  ROLE_ID     VARCHAR2(32) not null,
  ROLE_NAME   VARCHAR2(128),
  DESCRIPTION VARCHAR2(128),
  PARENT_ID   VARCHAR2(32),
  IS_LEAF     VARCHAR2(10),
  UNIT_ID     VARCHAR2(128)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSI_AUTH_ROLE
  add constraint PK_SSI_AUTH_ROLE primary key (ROLE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SSI_ORG_ACCOUNT...
create table SSI_ORG_ACCOUNT
(
  ACCOUNT_ID   VARCHAR2(32) not null,
  USER_ID      VARCHAR2(32),
  USERNAME     VARCHAR2(128),
  PASSWORD     VARCHAR2(128),
  REGISTE_DATE DATE,
  EXPIRED_DATE DATE,
  ENABLED      VARCHAR2(1),
  LOCKED       VARCHAR2(1),
  DESCRIPTION  VARCHAR2(1024)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSI_ORG_ACCOUNT
  add constraint PK_SSI_ORG_ACCOUNT_KEY primary key (ACCOUNT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SSI_ORG_M_USER_UNIT...
create table SSI_ORG_M_USER_UNIT
(
  UNIT_ID VARCHAR2(32),
  USER_ID VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SSI_ORG_UNIT...
create table SSI_ORG_UNIT
(
  UNIT_ID     VARCHAR2(32) not null,
  UNIT_NAME   VARCHAR2(128),
  DESCRIPTION VARCHAR2(128),
  PARENT_ID   VARCHAR2(32),
  IS_LEAF     VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSI_ORG_UNIT
  add constraint PK_SSI_ORG_UNIT primary key (UNIT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SSI_ORG_USER...
create table SSI_ORG_USER
(
  USER_ID     VARCHAR2(32) not null,
  FULL_NAME   VARCHAR2(128),
  SEX         VARCHAR2(1),
  TEL         VARCHAR2(20),
  EMAIL       VARCHAR2(128),
  DESCRIPTION VARCHAR2(1024)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSI_ORG_USER
  add constraint PK_SSI_ORG_USER primary key (USER_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating TABLE1...
create table TABLE1
(
  NAME VARCHAR2(100),
  PSW  VARCHAR2(100),
  DES  VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_SJSB...
create table T_SJSB
(
  ID        NUMBER not null,
  DW        VARCHAR2(30),
  BM        VARCHAR2(30),
  XM        VARCHAR2(20),
  JH        VARCHAR2(6),
  SJH       VARCHAR2(20),
  DEVICE_ID VARCHAR2(30),
  SFZHM     VARCHAR2(20),
  JZ        VARCHAR2(20),
  PWD       VARCHAR2(50) default 0,
  ZQZT      VARCHAR2(10),
  DDJB      VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 192K
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for DOJO_TREE_T...
alter table DOJO_TREE_T disable all triggers;
prompt Disabling triggers for GNMK...
alter table GNMK disable all triggers;
prompt Disabling triggers for PLOT...
alter table PLOT disable all triggers;
prompt Disabling triggers for POLICETYPE...
alter table POLICETYPE disable all triggers;
prompt Disabling triggers for SSI_AUTH_MENU...
alter table SSI_AUTH_MENU disable all triggers;
prompt Disabling triggers for SSI_AUTH_M_MENU_ROLE...
alter table SSI_AUTH_M_MENU_ROLE disable all triggers;
prompt Disabling triggers for SSI_AUTH_M_MENU_ROLE2...
alter table SSI_AUTH_M_MENU_ROLE2 disable all triggers;
prompt Disabling triggers for SSI_AUTH_M_ROLE_RESOURCE...
alter table SSI_AUTH_M_ROLE_RESOURCE disable all triggers;
prompt Disabling triggers for SSI_AUTH_M_USER_ROLE...
alter table SSI_AUTH_M_USER_ROLE disable all triggers;
prompt Disabling triggers for SSI_AUTH_RESOURCE...
alter table SSI_AUTH_RESOURCE disable all triggers;
prompt Disabling triggers for SSI_AUTH_ROLE...
alter table SSI_AUTH_ROLE disable all triggers;
prompt Disabling triggers for SSI_ORG_ACCOUNT...
alter table SSI_ORG_ACCOUNT disable all triggers;
prompt Disabling triggers for SSI_ORG_M_USER_UNIT...
alter table SSI_ORG_M_USER_UNIT disable all triggers;
prompt Disabling triggers for SSI_ORG_UNIT...
alter table SSI_ORG_UNIT disable all triggers;
prompt Disabling triggers for SSI_ORG_USER...
alter table SSI_ORG_USER disable all triggers;
prompt Disabling triggers for TABLE1...
alter table TABLE1 disable all triggers;
prompt Disabling triggers for T_SJSB...
alter table T_SJSB disable all triggers;
prompt Deleting T_SJSB...
delete from T_SJSB;
commit;
prompt Deleting TABLE1...
delete from TABLE1;
commit;
prompt Deleting SSI_ORG_USER...
delete from SSI_ORG_USER;
commit;
prompt Deleting SSI_ORG_UNIT...
delete from SSI_ORG_UNIT;
commit;
prompt Deleting SSI_ORG_M_USER_UNIT...
delete from SSI_ORG_M_USER_UNIT;
commit;
prompt Deleting SSI_ORG_ACCOUNT...
delete from SSI_ORG_ACCOUNT;
commit;
prompt Deleting SSI_AUTH_ROLE...
delete from SSI_AUTH_ROLE;
commit;
prompt Deleting SSI_AUTH_RESOURCE...
delete from SSI_AUTH_RESOURCE;
commit;
prompt Deleting SSI_AUTH_M_USER_ROLE...
delete from SSI_AUTH_M_USER_ROLE;
commit;
prompt Deleting SSI_AUTH_M_ROLE_RESOURCE...
delete from SSI_AUTH_M_ROLE_RESOURCE;
commit;
prompt Deleting SSI_AUTH_M_MENU_ROLE2...
delete from SSI_AUTH_M_MENU_ROLE2;
commit;
prompt Deleting SSI_AUTH_M_MENU_ROLE...
delete from SSI_AUTH_M_MENU_ROLE;
commit;
prompt Deleting SSI_AUTH_MENU...
delete from SSI_AUTH_MENU;
commit;
prompt Deleting POLICETYPE...
delete from POLICETYPE;
commit;
prompt Deleting PLOT...
delete from PLOT;
commit;
prompt Deleting GNMK...
delete from GNMK;
commit;
prompt Deleting DOJO_TREE_T...
delete from DOJO_TREE_T;
commit;
prompt Loading DOJO_TREE_T...
insert into DOJO_TREE_T (ID, NAME, PARENT_ID)
values ('1', '1', '-1');
insert into DOJO_TREE_T (ID, NAME, PARENT_ID)
values ('2', '2', '-1');
insert into DOJO_TREE_T (ID, NAME, PARENT_ID)
values ('3', '3', '-1');
insert into DOJO_TREE_T (ID, NAME, PARENT_ID)
values ('4', '4', '-1');
insert into DOJO_TREE_T (ID, NAME, PARENT_ID)
values ('5', '5', '-1');
insert into DOJO_TREE_T (ID, NAME, PARENT_ID)
values ('6', '6', '-1');
insert into DOJO_TREE_T (ID, NAME, PARENT_ID)
values ('7', '7', '-1');
insert into DOJO_TREE_T (ID, NAME, PARENT_ID)
values ('11', '11', '1');
commit;
prompt 8 records loaded
prompt Loading GNMK...
insert into GNMK (ID, GNMKDM, GNMKMC, GNMKLJ, GNMKTB, GNMKBZ, GNMKSJ)
values ('d098a59f0b765c30010b765d6b780001', '01', '一级目录1', null, 'system.gif', 'Y', null);
insert into GNMK (ID, GNMKDM, GNMKMC, GNMKLJ, GNMKTB, GNMKBZ, GNMKSJ)
values ('d098a59f0b765e68010b765fda830001', '0101', '二级目录1', 'cxtjAction.do', 'system.gif', 'N', '01');
insert into GNMK (ID, GNMKDM, GNMKMC, GNMKLJ, GNMKTB, GNMKBZ, GNMKSJ)
values ('d098a59f0b765e68010b765fda830001', '0102', '二级目录2', 'cxtjAction.do', 'system.gif', 'N', '01');
insert into GNMK (ID, GNMKDM, GNMKMC, GNMKLJ, GNMKTB, GNMKBZ, GNMKSJ)
values ('d098a59f0b765c30010b765d6b780002', '02', '一级目录2', null, 'system.gif', 'Y', null);
insert into GNMK (ID, GNMKDM, GNMKMC, GNMKLJ, GNMKTB, GNMKBZ, GNMKSJ)
values ('d098a59f0b765e68010b765fda830002', '0201', '二级目录1', 'cxtjAction.do', 'system.gif', 'N', '02');
insert into GNMK (ID, GNMKDM, GNMKMC, GNMKLJ, GNMKTB, GNMKBZ, GNMKSJ)
values ('d098a59f0b765e68010b765fda830002', '0202', '二级目录2', 'cxtjAction.do', 'system.gif', 'Y', '02');
insert into GNMK (ID, GNMKDM, GNMKMC, GNMKLJ, GNMKTB, GNMKBZ, GNMKSJ)
values ('d098a59f0b765e68010b765fda830002', '020201', '三级目录1', 'cxtjAction.do', 'system.gif', 'N', '0202');
insert into GNMK (ID, GNMKDM, GNMKMC, GNMKLJ, GNMKTB, GNMKBZ, GNMKSJ)
values ('d098a59f0b765e68010b765fda830002', '020202', '三级目录2', 'cxtjAction.do', 'system.gif', 'N', '0202');
commit;
prompt 8 records loaded
prompt Loading PLOT...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (718, 'A1000012B82D78', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (719, 'A1000012B82D85', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (720, 'A1000012B82D82', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (721, 'A1000012B82DD3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (722, 'A1000012B82C86', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (723, 'A1000012B82CAE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (724, 'A1000012B82DF4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (725, 'A1000012B75C58', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (726, 'A1000012B76B2F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (727, 'A1000012B76B01', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (728, 'A1000012B78C12', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (729, 'A1000012B78CBF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (730, 'A1000012B7B61A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (731, 'A1000012B7B228', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (732, 'A1000012B7BA1F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (733, 'A1000012B78BA4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (735, 'A1000012B7F258', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (736, 'A1000012B7F10F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (734, 'A1000012B7B6AC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (737, 'A1000012B7F3C6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (738, 'A1000012B7F1CA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (739, 'A1000012B7F226', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (740, 'A1000012B7F03D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (741, 'A1000012B7F1D8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (742, 'A1000012B7F240', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (743, 'A1000012B7F036', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (744, 'A1000012B7F1E4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (745, 'A1000012B82B58', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (746, 'A1000012B82C79', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (747, 'A1000012B82C6E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (748, 'A1000012B82C31', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (749, 'A1000012B82DC2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (750, 'A1000012B82DBD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (751, 'A1000012B82D0F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (752, 'A1000012B82BD7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (753, 'A1000012B82B80', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (754, 'A1000012B82B82', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (755, 'A1000012B7A8FC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (756, 'A1000012B7A60F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (757, 'A1000012B7AE49', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (758, 'A1000012B7AE1E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (759, 'A1000012B7ACA2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (760, 'A1000012B77DDA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (761, 'A1000012B7A8ED', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (762, 'A1000012B7A837', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (763, 'A1000012B7A934', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (764, 'A1000012B7AA22', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (765, 'A1000012B82CBA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (766, 'A1000012B82C82', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (767, 'A1000012B82C8C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (768, 'A1000012B82C5B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (769, 'A1000012B82965', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (770, 'A1000012B82CD6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (771, 'A1000012B82C71', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (772, 'A1000012B82C12', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (773, 'A1000012B82F5D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (774, 'A1000012B82F25', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (775, 'A1000012B8310F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (776, 'A1000012B830D7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (777, 'A1000012B830B6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (778, 'A1000012B815CD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (779, 'A1000012B8160B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (780, 'A1000012B81641', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (781, 'A1000012B7DD37', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (782, 'A1000012B81623', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (783, 'A1000012B7DA2C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (784, 'A1000012B815FE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (785, 'A1000012B8161A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (786, 'A1000012B81624', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (787, 'A1000012B81638', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (788, 'A1000012B8160E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (789, 'A1000012B815F9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (790, 'A1000012B8162C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (791, 'A1000012B81647', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (792, 'A1000012B815C8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (793, 'A1000012B815DF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (794, 'A1000012B815CE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (795, 'A1000012B81DEC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (796, 'A1000012B81CA5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (797, 'A1000012B820EC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (798, 'A1000012B820D7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (799, 'A1000012B7E877', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (800, 'A1000012B820EA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (801, 'A1000012B81EF4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (802, 'A1000012B81DFC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (803, 'A1000012B82CE2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (804, 'A1000012B81D42', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (805, 'A1000012B75E0D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (806, 'A1000012B7546C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (807, 'A1000012B7B954', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (808, 'A1000012B7BA1B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (809, 'A1000012B78B5F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (810, 'A1000012B78D25', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (811, 'A1000012B7595D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (812, 'A1000012B7588B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (813, 'A1000012B7B2C8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (814, 'A1000012B74CDA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (815, 'A1000012B7B19E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (816, 'A1000012B7B697', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (817, 'A1000012B7B046', '05:00', '14:00', 15, 1);
commit;
prompt 101 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (818, 'A1000012B7B6BF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (819, 'A1000012B7B331', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (820, 'A1000012B7B5FB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (821, 'A1000012B7B742', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (822, 'A1000012B7B341', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (823, 'A1000012B7B2EB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (824, 'A1000012B7B3DC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (825, 'A1000012B7D0F3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (826, 'A1000012B7C4D6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (827, 'A1000012B7C2E1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (828, 'A1000012B7BF03', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (829, 'A1000012B7D1A1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (830, 'A1000012B7C43E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (831, 'A1000012B7D1A4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (832, 'A1000012B7D1A5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (833, 'A1000012B7D174', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (834, 'A1000012B7D172', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (835, 'A1000012B823D0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (836, 'A1000012B831F2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (837, 'A1000012B829F6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (838, 'A1000012B7F64E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (839, 'A1000012B82A7E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (840, 'A1000012B82870', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (841, 'A1000012B82A92', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (842, 'A1000012B82A84', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (843, 'A1000012B8281E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (844, 'A1000012B8286C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (845, 'A1000012B7AF6B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (846, 'A1000012B7AEFE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (847, 'A1000012B7AC9C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (848, 'A1000012B7AE97', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (849, 'A1000012B7ACAF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (850, 'A1000012B7AC3E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (851, 'A1000012B7AF8A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (852, 'A1000012B7AFAA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (853, 'A1000012B7AF5D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (854, 'A1000012B7AEE9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (855, 'A1000012B83008', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (856, 'A1000012B8300E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (857, 'A1000012B82F24', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (858, 'A1000012B83010', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (859, 'A1000012B82F0C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (860, 'A1000012B82F18', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (861, 'A1000012B83016', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (862, 'A1000012B82F84', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (863, 'A1000012B8301B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (864, 'A1000012B82F60', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (865, 'A1000012B82238', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (866, 'A1000012B8222D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (867, 'A1000012B82202', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (868, 'A1000012B82231', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (869, 'A1000012B8222A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (870, 'A1000012B821F9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (871, 'A1000012B8222F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (872, 'A1000012B8220C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (873, 'A1000012B82260', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (874, 'A1000012B82208', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (875, 'A1000012B7D1B9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (876, 'A1000012B7D1BA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (877, 'A1000012B7D1D4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (878, 'A1000012B7D1D2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (879, 'A1000012B7D1B8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (880, 'A1000012B7D1BB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (881, 'A1000012B7D1B6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (882, 'A1000012B7D1B4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (883, 'A1000012B7D1E2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (884, 'A1000012B7C327', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (885, 'A1000012B7C445', '04:00', '14:00', 25, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (886, 'A1000012B7C45A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (887, 'A1000012B7C403', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (888, 'A1000012B7C478', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (889, 'A1000012B7C459', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (28, 'A1000012B82904', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (29, 'A1000012B82411', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (30, 'A1000012B7D11F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (31, 'A1000012B823E3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (32, 'A1000012B7F62F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (33, 'A1000012B828EF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (34, 'A1000012B82434', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (35, 'A1000012B7D1A8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (36, 'A1000012B82A45', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (37, 'A1000012B82A8B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (38, 'A1000012B7C4D4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (39, 'A1000012B7D1C8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (40, 'A1000012B7C4BA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (41, 'A1000012B7C2E5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (42, 'A1000012B7D1DE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (43, 'A1000012B7C4DA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (44, 'A1000012B7C528', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (45, 'A1000012B7C4A0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (46, 'A1000012B7C4F0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (47, 'A1000012B7C49B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (48, 'A1000012B82220', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (49, 'A1000012B82245', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (50, 'A1000012B82255', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (51, 'A1000012B8223C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (52, 'A1000012B8221F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (53, 'A1000012B8224E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (54, 'A1000012B82252', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (55, 'A1000012B82210', '05:00', '14:00', 15, 1);
commit;
prompt 201 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (56, 'A1000012B82253', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (57, 'A1000012B82240', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (58, 'A1000012B7D7B4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (59, 'A1000012B7D773', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (60, 'A1000012B7D788', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (61, 'A1000012B7D7DA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (62, 'A1000012B7D7E5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (63, 'A1000012B7D782', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (64, 'A1000012B7D7AE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (65, 'A1000012B7D7E0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (66, 'A1000012B81DF6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (67, 'A1000012B7D7E1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (68, 'A1000012B81EF2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (69, 'A1000012B7D7E2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (70, 'A1000012B81EF3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (71, 'A1000012B81CC0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (72, 'A1000012B820B0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (73, 'A1000012B81E3D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (74, 'A1000012B81E47', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (75, 'A1000012B75D8F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (76, 'A1000012B81EB7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (77, 'A1000012B7A576', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (78, 'A1000012B81D78', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (79, 'A1000012B81E6F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (80, 'A1000012B78BDB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (81, 'A1000012B7BB7B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (82, 'A1000012B78C33', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (83, 'A1000012B7A568', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (84, 'A1000012B7B92B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (85, 'A1000012B7B6FE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (86, 'A1000012B7CC40', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (87, 'A1000012B7CA72', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (88, 'A1000012B7CA7E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (89, 'A1000012B7B938', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (90, 'A1000012B7CA76', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (91, 'A1000012B7BA7A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (92, 'A1000012B7CC38', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (93, 'A1000012B7CA71', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (94, 'A1000012B7CA77', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (95, 'A1000012B7CC39', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (96, 'A1000012B7CA83', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (97, 'A1000012B7ECE6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (98, 'A1000012BE238A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (99, 'A1000012B7ECF5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (100, 'A1000012B7CA79', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (101, 'A1000012B7EA64', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (102, 'A1000012B7EBF8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (103, 'A1000012B7ECEF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (104, 'A1000012B7E8EB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (105, 'A1000012B7ECFF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (106, 'A1000012B7ECDF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (107, 'A1000012B822BC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (108, 'A1000012B822B5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (109, 'A1000012B822B4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (110, 'A1000012B7E8DC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (111, 'A1000012B8228B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (112, 'A1000012B8228E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (113, 'A1000012B822AC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (114, 'A1000012B8226B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (115, 'A1000012B8228A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (116, 'A1000012B822BD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (117, 'A1000012B829E3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (118, 'A1000012B82E3D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (119, 'A1000012B822B2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (120, 'A1000012B7A440', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (121, 'A1000012B81A92', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (122, 'A1000012B82C5D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (123, 'A1000012B82E57', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (124, 'A1000012B82AD0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (125, 'A1000012B82DDD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (126, 'A1000012B7B8EF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (127, 'A1000012B7B9EE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (128, 'A1000012B7BBAA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (129, 'A1000012B7B8D4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (130, 'A1000012B7B7F6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (131, 'A1000012B7B99E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (132, 'A1000012B82E3A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (133, 'A1000012B82DE3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (134, 'A1000012B829CC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (135, 'A1000012B822A6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (136, 'A1000012B8223F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (137, 'A1000012 BE238', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (138, 'A1000012B7BBB7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (139, 'A1000012B7BAC4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (140, 'A1000012B82261', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (141, 'A1000012B822AE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (142, 'A1000012B822A7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (143, 'A1000012B8228D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (144, 'A1000012B822B8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (145, 'A1000012B822AB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (146, 'A1000012B822B3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (147, 'A1000012B7F85D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (148, 'A1000012B7F869', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (149, 'A1000012B7F6CE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (150, 'A1000012B7F863', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (151, 'A1000012B7F82D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (152, 'A1000012B7F84A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (153, 'A1000012B7F791', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (154, 'A1000012B822B7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (155, 'A1000012B7F36E', '05:00', '14:00', 15, 1);
commit;
prompt 301 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (156, 'A1000012B7F6CF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (157, 'A1000012B8163B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (158, 'A1000012B7F819', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (159, 'A1000012B81602', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (160, 'A1000012B815EE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (161, 'A1000012B81611', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (162, 'A1000012B7D00E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (163, 'A1000012B81618', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (164, 'A1000012B815D0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (165, 'A1000012B81637', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (166, 'A1000012B815CB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (167, 'A1000012B81629', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (168, 'A1000012B7D076', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (169, 'A1000012B7D00D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (170, 'A1000012B7C90E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (171, 'A1000012B815EB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (172, 'A1000012B7CF9C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (173, 'A1000012B7D063', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (174, 'A1000012B82C66', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (175, 'A1000012B7CF97', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (176, 'A1000012B82C44', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (177, 'A1000012B7CFA9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (178, 'A1000012B7D00F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (179, 'A1000012B82CA8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (180, 'A1000012B82C32', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (181, 'A1000012B82BC5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (182, 'A1000012B7CF9B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (183, 'A1000012B82BF4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (184, 'A1000012B82C5A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (185, 'A1000012B82C61', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (186, 'A1000012B82C46', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (187, 'A1000012B82C4D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (188, 'A1000012B82963', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (189, 'A1000012B829D6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (190, 'A1000012B8294E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (191, 'A1000012B8295F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (192, 'A1000012B82C85', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (193, 'A1000012B825ED', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (194, 'A1000012B8280E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (195, 'A1000012B829AB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (196, 'A1000012B82571', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (197, 'A1000012B82598', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (198, 'A1000012B7D8B4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (199, 'A1000012B7D880', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (200, 'A1000012B7D9FD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (201, 'A1000012B7D89D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (374, 'A1000012B7C230', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (375, 'A1000012B7C26A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (376, 'A1000012B7C26D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (377, 'A1000012B7C27A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (378, 'A1000012B7C2AD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (379, 'A1000012B7C2DB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (2, 'A1000012B829E3A', '8:00', '18:00', 20, null);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (380, 'A1000012B7C2EA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (381, 'A1000012B7C2EE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (382, 'A1000012B7C33A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (383, 'A1000012B7C375', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (384, 'A1000012B7C380', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (385, 'A1000012B7C383', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (386, 'A1000012B7C388', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (387, 'A1000012B7C38E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (388, 'A1000012B7C394', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (389, 'A1000012B7C395', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (390, 'A1000012B7C3BB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (391, 'A1000012B7C3C1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (392, 'A1000012B7C3CA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (393, 'A1000012B7C3CD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (394, 'A1000012B7C3D1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (395, 'A1000012B7C3D5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (396, 'A1000012B7C3E8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (397, 'A1000012B7C3EC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (398, 'A1000012B7C401', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (399, 'A1000012B7C41B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (400, 'A1000012B7C426', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (401, 'A1000012B7C42D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (402, 'A1000012B7C444', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (403, 'A1000012B7C447', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (404, 'A1000012B7C44B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (405, 'A1000012B7C44D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (406, 'A1000012B7C44F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (407, 'A1000012B7B877', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (408, 'A1000012B7C480', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (409, 'A1000012B7C4B3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (410, 'A1000012B7C4C5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (411, 'A1000012B7C4D5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (412, 'A1000012B7C4D7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (413, 'A1000012B7C4E4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (414, 'A1000012B7C4EB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (415, 'A1000012B7C50D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (416, 'A1000012B7C527', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (417, 'A1000012B7D0EC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (418, 'A1000012B7D0FA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (419, 'A1000012B7D161', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (420, 'A1000012B7D1A3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (421, 'A1000012B7D1C7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (422, 'A1000012B7D1C9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (423, 'A1000012B7D1CA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (424, 'A1000012B7D1CC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (425, 'A1000012B7D1CF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (426, 'A1000012B7D1E1', '05:00', '14:00', 15, 1);
commit;
prompt 401 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (427, 'A1000012B7D298', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (428, 'A1000012B81605', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (429, 'A1000012B81628', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (430, 'A1000012B8162F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (431, 'A1000012B81632', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (432, 'A1000012B8222E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (433, 'A1000012B82242', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (434, 'A1000012B82268', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (435, 'A1000012B82270', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (436, 'A1000012B8227D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (437, 'A1000012B82294', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (438, 'A1000012B82295', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (439, 'A1000012B82297', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (440, 'A1000012B82298', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (441, 'A1000012B8229A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (442, 'A1000012B8229D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (443, 'A1000012B824DE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (444, 'A1000012B8250E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (445, 'A1000012B8295A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (446, 'A1000012B82967', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (447, 'A1000012B82969', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (448, 'A1000012B82981', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (449, 'A1000012B82984', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (450, 'A1000012B8298E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (451, 'A1000012B82994', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (452, 'A1000012B829A1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (453, 'A1000012B82B4A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (454, 'A1000012B82BB7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (455, 'A1000012B82BC7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (456, 'A1000012B82BD1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (457, 'A1000012B82BD3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (458, 'A1000012B82BF1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (459, 'A1000012B82C2E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (460, 'A1000012B82C3A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (461, 'A1000012B82C47', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (462, 'A1000012B82C49', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (463, 'A1000012B82C4E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (464, 'A1000012B82C50', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (465, 'A1000012B82C52', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (466, 'A1000012B82C56', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (467, 'A1000012B82C58', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (468, 'A1000012B82C69', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (469, 'A1000012B82C6F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (470, 'A1000012B82C77', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (471, 'A1000012B82C78', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (472, 'A1000012B82C80', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (473, 'A1000012B82C81', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (474, 'A1000012B82C84', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (475, 'A1000012B82C90', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (476, 'A1000012B82C97', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (477, 'A1000012B82C99', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (478, 'A1000012B82C9B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (479, 'A1000012B82C9F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (480, 'A1000012B82CA4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (481, 'A1000012B82CA5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (482, 'A1000012B82CA6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (483, 'A1000012B82CAF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (484, 'A1000012B82CB8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (485, 'A1000012B82CC7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (486, 'A1000012B82CC9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (487, 'A1000012B82CCD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (488, 'A1000012B82CD8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (489, 'A1000012B82CDC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (490, 'A1000012B82CE0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (491, 'A1000012B82D57', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (492, 'A1000012B82D9D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (493, 'A1000012B82D9F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (494, 'A1000012B82DA2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (495, 'A1000012B82DA6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (496, 'A1000012B82DAE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (497, 'A1000012B82DCA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (498, 'A1000012B82DF5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (499, 'A1000012B82E15', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (500, 'A1000012B82DCF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (501, 'A1000012B82E61', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (502, 'A1000012B82E7B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (503, 'A1000012B82E7C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (504, 'A1000012B82E87', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (505, 'A1000012B82ED1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (506, 'A1000012B82EE8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (507, 'A1000012B82F48', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (508, 'A1000012B82F52', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (509, 'A1000012B82FA2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (510, 'A1000012B82FD7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (511, 'A1000012B83028', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (512, 'A1000012B83029', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (513, 'A1000012B8306B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (514, 'A1000012B8309C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (515, 'A1000012B8309E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (516, 'A1000012B830A2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (517, 'A1000012B830DA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (518, 'A1000012B830EE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (519, 'A1000012B830F3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (520, 'A1000012B8310E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (521, 'A1000012B83110', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (522, 'A1000012B83111', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (523, 'A1000012B83113', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (524, 'A1000012B83116', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (525, 'A1000012B8311B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (526, 'A1000012B8311F', '05:00', '14:00', 15, 1);
commit;
prompt 501 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (527, 'A1000012B83149', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (528, 'A1000012B7C378', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (529, 'A1000012B7E8EE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (530, 'A1000012B7EA66', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (531, 'A1000012B7EA67', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (532, 'A1000012B7EAAC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (533, 'A1000012B7EC86', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (534, 'A1000012B7ECA3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (535, 'A1000012B7ECDD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (536, 'A1000012B7ECE1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (537, 'A1000012B7ECE5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (538, 'A1000012B7D71F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (539, 'A1000012B7D717', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (540, 'A1000012B7BACE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (541, 'A1000012B7D73C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (542, 'A1000012B7D71E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (543, 'A1000012B7D716', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (544, 'A1000012B7D6BB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (545, 'A1000012B7D719', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (546, 'A1000012B8220E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (547, 'A1000012B821FD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (548, 'A1000012B82269', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (549, 'A1000012B821FB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (550, 'A1000012B82256', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (551, 'A1000012B82226', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (552, 'A1000012B821F7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (553, 'A1000012B821FF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (554, 'A1000012B82205', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (555, 'A1000012B82267', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (556, 'A1000012B7F6E9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (559, 'A1000012B7F6E0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (560, 'A1000012B7F7CB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (561, 'A1000012B8226A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (562, 'A1000012B82265', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (563, 'A1000012B82264', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (564, 'A1000012B8221D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (565, 'A1000012B821F5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (566, 'A1000012B82229', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (567, 'A1000012B821F6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (568, 'A1000012B8227C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (569, 'A1000012B821F0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (570, 'A1000012B821FA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (571, 'A1000012B8227F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (572, 'A1000012B82F15', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (573, 'A1000012B82EDE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (574, 'A1000012B82D1A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (575, 'A1000012B82F05', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (576, 'A1000012B82273', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (577, 'A1000012B82258', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (578, 'A1000012B82279', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (579, 'A1000012B82E3B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (580, 'A1000012B7B786', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (581, 'A1000012B78C98', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (582, 'A1000012B7AFA4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (583, 'A1000012B79C58', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (584, 'A1000012B74B71', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (585, 'A1000012B7B9F3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (586, 'A1000012B78D26', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (587, 'A1000012B7B82D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (588, 'A1000012B80609', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (589, 'A1000012B82F13', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (590, 'A1000012B82964', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (591, 'A1000012B7D47C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (592, 'A1000012B82EE0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (593, 'A1000012B82EBC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (594, 'A1000012B82F0F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (595, 'A1000012B7F78F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (596, 'A1000012B82FF0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (597, 'A1000012B83244', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (598, 'A1000012B7C3C2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (599, 'A1000012B82FF6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (600, 'A1000012B805DE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (601, 'A1000012B82FEE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (602, 'A1000012B83249', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (603, 'A1000012B8239F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (604, 'A1000012B83253', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (605, 'A1000012B82F4B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (606, 'A1000012B82D08', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (607, 'A1000012B82F8C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (608, 'A1000012B82F5A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (609, 'A1000012B82F47', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (610, 'A1000012B82F32', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (611, 'A1000012B82F55', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (612, 'A1000012B7F9B3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (613, 'A1000012B82F5C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (614, 'A1000012B7F78E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (615, 'A1000012B7D727', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (616, 'A1000012B7C499', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (617, 'A1000012B7C530', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (618, 'A1000012B8226D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (619, 'A1000012B7C515', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (620, 'A1000012B7BA96', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (621, 'A1000012B7495D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (622, 'A1000012B7C4F2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (623, 'A1000012B7C52A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (624, 'A1000012B7C516', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (625, 'A1000012B7C4D9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (626, 'A1000012B7C50E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (627, 'A1000012B7C4D2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (628, 'A1000012B7F7FA', '05:00', '14:00', 15, 1);
commit;
prompt 601 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (629, 'A1000012B7F77D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (630, 'A1000012B8312E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (631, 'A1000012B8323B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (632, 'A1000012B807AE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (633, 'A1000012B7C10D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (634, 'A1000012B8312D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (635, 'A1000012B83125', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (636, 'A1000012B83117', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (637, 'A1000012B831FF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (638, 'A1000012B83250', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (639, 'A1000012B83129', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (640, 'A1000012B82D8D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (641, 'A1000012B82C75', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (642, 'A1000012B820F0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (643, 'A1000012B820BF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (644, 'A1000012B81E4B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (645, 'A1000012B829AD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (646, 'A1000012B81F3A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (647, 'A1000012B81CCC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (648, 'A1000012B81C2A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (649, 'A1000012B829A2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (650, 'A1000012B82B7B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (651, 'A1000012B82B3F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (652, 'A1000012B82B76', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (653, 'A1000012B82B83', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (654, 'A1000012B82B59', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (655, 'A1000012B82B28', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (656, 'A1000012B82B3D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (657, 'A1000012B82B19', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (658, 'A1000012B82B6B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (659, 'A1000012B82B55', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (660, 'A1000012B82C91', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (661, 'A1000012B82F3B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (662, 'A1000012B824D1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (663, 'A1000012B7D725', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (664, 'A1000012B7F809', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (665, 'A1000012B7D1E0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (666, 'A1000012B7D1D7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (667, 'A1000012B7D1D1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (668, 'A1000012B7D0EE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (669, 'A1000012B7D1DF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (670, 'A1000012B7D200', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (671, 'A1000012B7D1E3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (672, 'A1000012B7D1DC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (673, 'A1000012B7D1DD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (674, 'A1000012B7D1BC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (675, 'A1000012B8292E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (676, 'A1000012B82996', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (677, 'A1000012B82998', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (678, 'A1000012B8298A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (679, 'A1000012B8292D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (680, 'A1000012B82962', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (681, 'A1000012B82995', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (682, 'A1000012B82597', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (683, 'A1000012B829AA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (684, 'A1000012B8298D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (685, 'A1000012B7BEFB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (686, 'A1000012B7C4B5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (687, 'A1000012B7C363', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (688, 'A1000012B7C4A4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (689, 'A1000012B7C514', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (690, 'A1000012B7D10A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (691, 'A1000012B7D204', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (692, 'A1000012B7D207', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (693, 'A1000012B7D175', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (694, 'A1000012B7C4B6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (695, 'A1000012B8227B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (696, 'A1000012B82274', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (697, 'A1000012B822BF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (698, 'A1000012B822C3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (699, 'A1000012B82271', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (700, 'A1000012B8225F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (701, 'A1000012B82281', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (702, 'A1000012B822C6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (703, 'A1000012B822C9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (704, 'A1000012B822B1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (705, 'A1000012B7CFB6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (706, 'A1000012B7D002', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (707, 'A1000012B7D00C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (708, 'A1000012B7D003', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (709, 'A1000012B7D087', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (557, 'A1000012B7F7F0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (558, 'A1000012B7FDBF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (710, 'A1000012B7CF91', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (711, 'A1000012B7CFAD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (712, 'A1000012B7CFA7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (713, 'A1000012B7CFAB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (714, 'A1000012B7D073', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (715, 'A1000012B82D7D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (716, 'A1000012B82C34', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (717, 'A1000012B82DCD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (202, 'A1000012B7D6D0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (203, 'A1000012B7D9FF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (204, 'A1000012B7D834', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (205, 'A1000012B7D89A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1, 'A1000012B74D99', '8:00', '18:00', 20, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (206, 'A1000012B7D875', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (207, 'A1000012B7D89E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (208, 'A1000012B7C442', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (209, 'A1000012B7C41E', '05:00', '14:00', 15, 1);
commit;
prompt 701 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (210, 'A1000012B7C448', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (211, 'A1000012B7C3F7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (212, 'A1000012B7C453', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (213, 'A1000012BF227D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (214, 'A1000012B7C460', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (215, 'A1000012B75D85', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (216, 'A1000012B7B9F7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (217, 'A1000012B7BB28', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (218, 'A1000012B7C429', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (219, 'A1000012B75D70', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (220, 'A1000012B75B36', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (221, 'A1000012B758A3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (222, 'A1000012B7B9ED', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (223, 'A1000012B7BA7F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (224, 'A1000012B78B91', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (225, 'A1000012B7C420', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (226, 'A1000012B7C449', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (227, 'A1000012B7BDE3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (228, 'A1000012B7D318', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (229, 'A1000012B7D2E9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (230, 'A1000012B7D2C5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (231, 'A1000012B7D30B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (232, 'A1000012B7D2F6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (233, 'A1000012B7D2D9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (234, 'A1000012B7C42B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (235, 'A1000012B7D2D3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (236, 'A1000012B7D31F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (237, 'A1000012B7D2D1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (238, 'A1000012B7C3D0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (239, 'A1000012B80155', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (240, 'A1000012B82B6D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (241, 'A1000012B829E4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (242, 'A1000012B7C441', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (243, 'A1000012B829C3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (244, 'A1000012B7C40C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (245, 'A1000012B7C3F4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (246, 'A1000012B7D317', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (247, 'A1000012B7C430', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (248, 'A1000012B7C3D3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (249, 'A1000012B7C3F3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (250, 'A1000012B82952', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (251, 'A1000012B829EB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (252, 'A1000012B7C3F9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (253, 'A1000012B7C413', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (254, 'A1000012B829DC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (255, 'A1000012B8297C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (256, 'A1000012B829C1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (257, 'A1000012B82A41', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (258, 'A1000012B82FA1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (259, 'A1000012B82F23', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (260, 'A1000012B825AA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (261, 'A1000012B82F2B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (262, 'A1000012B82F8D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (263, 'A1000012B82973', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (264, 'A1000012B824D5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (265, 'A1000012B829B3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (266, 'A1000012B829D1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (267, 'A1000012B7E9CE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (268, 'A1000012B7EB0C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (269, 'A1000012B82F1F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (270, 'A1000012B7E37B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (271, 'A1000012B7EADF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (272, 'A1000012B7EB56', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (273, 'A1000012B82816', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (274, 'A1000012B7EA4C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (275, 'A1000012B7EAE2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (276, 'A1000012B82F42', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (277, 'A1000012B829A6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (278, 'A1000012B7D2D2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (279, 'A1000012B7D316', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (280, 'A1000012B829D3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (281, 'A1000012B7D2FE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (282, 'A1000012B82F5F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (283, 'A1000012B824A4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (284, 'A1000012B7E2E7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (285, 'A1000012B7C440', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (286, 'A1000012B82820', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (287, 'A1000012B829B0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (288, 'A1000012B82565', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (289, 'A1000012B7D3F3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (290, 'A1000012B7D2DC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (291, 'A1000012B7D2C4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (292, 'A1000012B82F8F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (293, 'A1000012B829AE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (294, 'A1000012B7D325', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (295, 'A1000012B829B4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (296, 'A1000012B82971', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (297, 'A1000012B7D13C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (298, 'A1000012B82841', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (299, 'A1000012B829B8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (300, 'A1000012B7D14C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (301, 'A1000012B7D147', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (302, 'A1000012B7CF95', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (303, 'A1000012B7D2EA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (304, 'A1000012B7D13D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (305, 'A1000012B7B645', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (306, 'A1000012B829C7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (307, 'A1000012B7D141', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (308, 'A1000012B7B676', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (309, 'A1000012B7B2E5', '05:00', '14:00', 15, 1);
commit;
prompt 801 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (310, 'A1000012B7D13E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (311, 'A1000012B7D008', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (312, 'A1000012B829DE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (313, 'A1000012B7CFAC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (314, 'A1000012B7D14B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (315, 'A1000012B7CFB0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (316, 'A1000012B7D05C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (317, 'A1000012B7D143', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (318, 'A1000012B7CF69', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (319, 'A1000012B7B6B8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (320, 'A1000012B7CFA5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (321, 'A1000012B82661', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (322, 'A1000012B7D059', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (323, 'A1000012B7E8E8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (324, 'A1000012B82983', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (325, 'A1000012B7B687', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (326, 'A1000012B7EC97', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (327, 'A1000012B7ECC8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (328, 'A1000012B7B388', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (329, 'A1000012B7D0BC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (330, 'A1000012B7CFB3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (331, 'A1000012B7EC8F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (332, 'A1000012B7ECA7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (333, 'A1000012B7EABD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (334, 'A1000012B7E8DE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (335, 'A1000012B7EA6A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (336, 'A1000012B82F5B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (337, 'A1000012B7CF99', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (338, 'A1000012B7E970', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (339, 'A1000012B7B705', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (340, 'A1000012B7ECEA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (341, 'A1000012B7CFA4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (342, 'A1000012B7B359', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (343, 'A1000012B7D2FA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (344, 'A1000012B7B286', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (345, 'A1000012B7B72D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (346, 'A1000012B7EACB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (347, 'A1000012BE240B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (348, 'A1000012B82F45', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (349, 'A1000012B825AB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (350, 'A1000012B75975', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (351, 'A1000012B75B47', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (352, 'A1000012B75B74', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (353, 'A1000012B75BE5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (354, 'A1000012B75D1A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (355, 'A1000012B75D7E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (356, 'A1000012B75D86', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (357, 'A1000012B75DA6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (358, 'A1000012B75DBA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (359, 'A1000012B76B17', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (360, 'A1000012B76B19', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (361, 'A1000012B76B27', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (362, 'A1000012B76B2E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (363, 'A1000012B78B7E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (364, 'A1000012B78B81', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (365, 'A1000012B78BA8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (366, 'A1000012B78C2B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (367, 'A1000012B7B6C7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (368, 'A1000012B7B9B1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (369, 'A1000012B7BD86', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (370, 'A1000012B7BEFA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (371, 'A1000012B7BF02', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (372, 'A1000012B7C182', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (373, 'A1000012B7C21A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1578, 'A1000012B81643', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1579, 'A1000012B815FF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1580, 'A1000012B81631', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1581, 'A1000012B81612', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1582, 'A1000012B83184', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1583, 'A1000012B831A7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1584, 'A1000012B83112', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1585, 'A1000012B831AA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1586, 'A1000012B81610', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1587, 'A1000012B82997', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1588, 'A1000012B829A3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1589, 'A1000012B8287A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1590, 'A1000012B8293F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1591, 'A1000012B824CC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1592, 'A1000012B82819', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1593, 'A1000012B8294D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1594, 'A1000012B8288F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1595, 'A1000012B82945', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1596, 'A1000012B8295C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1597, 'A1000012B79D2D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1598, 'A1000012B7B552', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1599, 'A1000012B7B791', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1600, 'A1000012B75769', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1601, 'A1000012B76B2A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1602, 'A1000012B75DD4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1603, 'A1000012B75BBC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1604, 'A1000012B76B08', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1605, 'A1000012B754E0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (7, '23', '8:00', '18:00', 20, null);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (8, '24', '8:00', '18:00', 20, null);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (9, '25', '8:00', '18:00', 20, null);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (10, '26', '8:00', '18:00', 20, null);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (11, '27', '8:00', '18:00', 20, null);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (12, '28', '8:00', '18:00', 20, null);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (13, '29', '8:00', '18:00', 20, null);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (14, '30', '8:00', '18:00', 20, null);
commit;
prompt 901 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (15, '31', '8:00', '18:00', 20, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (16, '32', '8:00', '18:00', 20, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (17, '211', '8:00', '18:00', 20, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (18, '221', '8:00', '18:00', 20, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (19, '231', '8:00', '18:00', 20, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (20, '241', '8:00', '18:00', 20, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (21, '251', '8:00', '18:00', 20, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (22, '261', '8:00', '18:00', 20, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (23, '271', '08:00', '18:00', 20, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (24, '281', '08:00', '18:00', 20, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1607, '123', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1608, '1122', '08:00', '18:00', 10, 0);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (27, '311', '8:00', '18:00', 20, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (5, '21', '8:00', '18:00', 20, null);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (6, '22', '8:00', '18:00', 20, null);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (890, 'A1000012B7C455', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (891, 'A1000012B7C41F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (892, 'A1000012B7C329', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (893, 'A1000012B7C45B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (894, 'A1000012B7C452', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (895, 'A1000012B8225A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (896, 'A1000012B82259', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (897, 'A1000012B8224A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (898, 'A1000012B82235', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (899, 'A1000012B82221', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (900, 'A1000012B82216', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (901, 'A1000012B82234', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (902, 'A1000012B8220D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (903, 'A1000012B8221A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (904, 'A1000012B8223B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (905, 'A1000012B7D77A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (906, 'A1000012B7D76F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (907, 'A1000012B7D76B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (908, 'A1000012B7D763', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (909, 'A1000012B7D76E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (910, 'A1000012B7D76D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (911, 'A1000012B7D764', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (912, 'A1000012B7D767', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (913, 'A1000012B7D711', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (914, 'A1000012B7D6FC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (915, 'A1000012B7C32A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (916, 'A1000012B7C4A2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (917, 'A1000012B7C500', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (918, 'A1000012B7C326', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (919, 'A1000012B7C4B9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (920, 'A1000012B7BEF6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (921, 'A1000012B7C4E1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (922, 'A1000012B7C4DD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (923, 'A1000012B7C4EE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (924, 'A1000012B7C4AA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (925, 'A1000012B7F244', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (926, 'A1000012B7F247', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (927, 'A1000012B7F14E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (928, 'A1000012B7F254', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (929, 'A1000012B7F22C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (930, 'A1000012B7F246', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (931, 'A1000012B7F21D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (932, 'A1000012B7F12F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (933, 'A1000012B7F245', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (934, 'A1000012B7F24E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (935, 'A1000012B8205E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (936, 'A1000012B81FCF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (937, 'A1000012B820D0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (938, 'A1000012B8299D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (939, 'A1000012B81E74', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (940, 'A1000012B81F73', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (941, 'A1000012B82129', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (942, 'A1000012B82114', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (943, 'A1000012B81E87', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (944, 'A1000012B8297D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (945, 'A1000012B822A0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (946, 'A1000012B8229C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (947, 'A1000012B822A4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (948, 'A1000012B82247', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (949, 'A1000012B82299', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (950, 'A1000012B8229F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (951, 'A1000012B822A8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (952, 'A1000012B82239', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (953, 'A1000012B822A1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (954, 'A1000012B822AD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (955, 'A1000012B7D1D6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (956, 'A1000012B7D1EA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (957, 'A1000012B7D1E4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (958, 'A1000012B7D1F1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (959, 'A1000012B7D1EE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (960, 'A1000012B7D1F4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (961, 'A1000012B7D103', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (962, 'A1000012B7D0F5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (963, 'A1000012B7D0F6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (964, 'A1000012B7D1F0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (965, 'A1000012B83014', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (966, 'A1000012B83013', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (967, 'A1000012B82C9C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (968, 'A1000012B82C73', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (969, 'A1000012B82C9D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (970, 'A1000012B83006', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (971, 'A1000012B82CA3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (972, 'A1000012B82C94', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (973, 'A1000012B82C8D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (974, 'A1000012B82C7D', '05:00', '14:00', 15, 1);
commit;
prompt 1001 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (975, 'A1000012B829A8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (976, 'A1000012B829BD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (977, 'A1000012B824F6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (978, 'A1000012B82814', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (979, 'A1000012B829C8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (980, 'A1000012B829BF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (981, 'A1000012B8283C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (982, 'A1000012B82823', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (983, 'A1000012B829BA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (984, 'A1000012B827F8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (985, 'A1000012B7D39A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (986, 'A1000012B7D36B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (987, 'A1000012B7D353', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (988, 'A1000012B7D39D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (989, 'A1000012B7D355', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (990, 'A1000012B7D32B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (991, 'A1000012B7D37F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (992, 'A1000012B7D379', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (993, 'A1000012B7D354', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (994, 'A1000012B7D36F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (995, 'A1000012B82B7C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (996, 'A1000012B82B45', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (997, 'A1000012B82BA6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (998, 'A1000012B82B5B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (999, 'A1000012B82B2E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1000, 'A1000012B82B53', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1001, 'A1000012B82A9A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1002, 'A1000012B82B8A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1003, 'A1000012B82B4E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1004, 'A1000012B82B4B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1005, 'A1000012B829AF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1006, 'A1000012B829BB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1007, 'A1000012B825A6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1008, 'A1000012B8282A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1009, 'A1000012B82635', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1010, 'A1000012B829E2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1011, 'A1000012B7C42C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1012, 'A1000012B7C409', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1013, 'A1000012B7C40B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1014, 'A1000012B7C3DC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1015, 'A1000012B7C446', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1016, 'A1000012B7C34A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1017, 'A1000012B7C3F0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1018, 'A1000012B7C3DB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1019, 'A1000012B7C408', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1020, 'A1000012B7C42F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1021, 'A1000012B7C8C5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1022, 'A1000012B7C8CB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1023, 'A1000012B7C787', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1024, 'A1000012B7C789', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1025, 'A1000012B7C8B2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1026, 'A1000012B7C795', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1027, 'A1000012B7C94C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1028, 'A1000012B7C893', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1029, 'A1000012B7C93F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1030, 'A1000012B7C92C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1031, 'A1000012B7FEC1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1032, 'A1000012B82BF5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1033, 'A1000012B82C6C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1034, 'A1000012B82C5C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1035, 'A1000012B82F4C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1036, 'A1000012B82F4A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1037, 'A1000012B82F06', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1038, 'A1000012B82F1A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1039, 'A1000012B82F02', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1040, 'A1000012B82F33', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1041, 'A1000012B7D35C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1042, 'A1000012B7D359', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1043, 'A1000012B7D380', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1044, 'A1000012B7D39E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1045, 'A1000012B7D3D2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1046, 'A1000012B7D37A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1047, 'A1000012B7D385', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1048, 'A1000012B7D35D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1049, 'A1000012B7D37D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1050, 'A1000012B7E8E6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1051, 'A1000012B7EAA0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1052, 'A1000012B7EC7D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1053, 'A1000012B7E8DD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1054, 'A1000012B7E8E7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1055, 'A1000012B7ECFD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1056, 'A1000012B7ECEB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1057, 'A1000012B7E8DF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1058, 'A1000012B7ED21', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1059, 'A1000012B7EA5D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1060, 'A1000012B82C96', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1061, 'A1000012B82CF9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1062, 'A1000012B82BC8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1063, 'A1000012B82D27', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1064, 'A1000012B82C6A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1065, 'A1000012B82D74', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1066, 'A1000012B82DB5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1067, 'A1000012B82C87', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1068, 'A1000012B82D0B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1069, 'A1000012B82D5B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1070, 'A1000012B7CFB2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1071, 'A1000012B7CFAE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1072, 'A1000012B7D000', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1073, 'A1000012B7D001', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1074, 'A1000012B7D067', '05:00', '14:00', 15, 1);
commit;
prompt 1101 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1075, 'A1000012B7D05F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1076, 'A1000012B7CF98', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1077, 'A1000012B7D006', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1078, 'A1000012B7CFB9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1079, 'A1000012B7D065', '04:00', '14:00', 25, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1080, 'A1000012B83148', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1081, 'A1000012B831AD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1082, 'A1000012B830BB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1083, 'A1000012B830EA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1084, 'A1000012B815FA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1085, 'A1000012B8160D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1086, 'A1000012B82FFD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1087, 'A1000012B82F73', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1090, 'A1000012B7F714', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1088, 'A1000012B8163E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1089, 'A1000012B82FEA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1091, 'A1000012B7DDAF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1092, 'A1000012B7F80B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1093, 'A1000012B7F7DC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1094, 'A1000012B7F78D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1095, 'A1000012B7F7C0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1096, 'A1000012B7F6F2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1097, 'A1000012B7F7CC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1098, 'A1000012B7F782', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1099, 'A1000012B7F795', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1100, 'A1000012B7D35A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1101, 'A1000012B7D369', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1102, 'A1000012B7D365', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1103, 'A1000012B7D392', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1104, 'A1000012B7D322', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1105, 'A1000012B7D396', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1106, 'A1000012B7D2FF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1107, 'A1000012B7D393', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1108, 'A1000012B7D390', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1109, 'A1000012B82282', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1110, 'A1000012B82272', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1111, 'A1000012B8227E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1112, 'A1000012B82283', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1113, 'A1000012B821EF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1114, 'A1000012B82278', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1115, 'A1000012B82276', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1116, 'A1000012B8224B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1117, 'A1000012B82286', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1118, 'A1000012B82284', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1119, 'A1000012B75DA2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1120, 'A1000012B7673C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1121, 'A1000012B7B5E2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1122, 'A1000012B763FE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1123, 'A1000012B75CD1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1124, 'A1000012B757FD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1125, 'A1000012B7B602', '04:00', '14:00', 25, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1126, 'A1000012B74E91', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1127, 'A1000012B753E7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1128, 'A1000012B75761', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1129, 'A1000012B7C34E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1130, 'A1000012B7C333', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1131, 'A1000012B7C2D4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1132, 'A1000012B7C350', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1133, 'A1000012B7C346', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1134, 'A1000012B7C338', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1135, 'A1000012B7C32F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1136, 'A1000012B7C1DF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1137, 'A1000012B7C340', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1138, 'A1000012B7C2C2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1139, 'A1000012B82990', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1140, 'A1000012B82510', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1141, 'A1000012B82988', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1142, 'A1000012B829A4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1143, 'A1000012B82927', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1144, 'A1000012B8296B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1145, 'A1000012B82961', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1146, 'A1000012B824F3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1147, 'A1000012B75D96', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1148, 'A1000012B8292A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1149, 'A1000012B7B379', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1150, 'A1000012B7B95C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1151, 'A1000012B78DAF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1152, 'A1000012B7772C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1153, 'A1000012B78C05', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1154, 'A1000012B7A87F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1155, 'A1000012B757A5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1156, 'A1000012B7BDB6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1157, 'A1000012B82982', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1158, 'A1000012B7B38E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1159, 'A1000012B82F94', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1160, 'A1000012B82F9F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1161, 'A1000012B83027', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1162, 'A1000012B7F2AC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1163, 'A1000012B7F2A1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1164, 'A1000012B7F2D1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1165, 'A1000012B7F283', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1166, 'A1000012B7F2E8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1167, 'A1000012B7F168', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1168, 'A1000012B7F2DC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1169, 'A1000012B7F2D7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1170, 'A1000012B7F2D3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1171, 'A1000012B7F234', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1172, 'A1000012B830F5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1173, 'A1000012B82FF4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1174, 'A1000012B831EF', '05:00', '14:00', 15, 1);
commit;
prompt 1201 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1175, 'A1000012B8324B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1176, 'A1000012B831E7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1177, 'A1000012B83247', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1178, 'A1000012B83093', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1179, 'A1000012B83251', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1180, 'A1000012B83127', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1181, 'A1000012B823E8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1182, 'A1000012B82992', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1183, 'A1000012B8299B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1184, 'A1000012B8296C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1185, 'A1000012B82926', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1186, 'A1000012B82C89', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1187, 'A1000012B82940', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1188, 'A1000012B8299C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1189, 'A1000012B82986', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1190, 'A1000012B8290B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1191, 'A1000012B824DB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1192, 'A1000012B7D062', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1193, 'A1000012B7CFFD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1194, 'A1000012B7CFB7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1195, 'A1000012B7CF9D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1196, 'A1000012B7D007', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1197, 'A1000012B7CF96', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1198, 'A1000012B7CFBD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1199, 'A1000012B7CF9E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1200, 'A1000012B7CFA6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1201, 'A1000012B7CFA2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1202, 'A1000012B83023', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1203, 'A1000012B82F22', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1204, 'A1000012B82F1D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1205, 'A1000012B82F3C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1206, 'A1000012B82F21', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1207, 'A1000012B82F2E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1208, 'A1000012B82F3F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1209, 'A1000012B82F04', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1210, 'A1000012B82F93', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1211, 'A1000012B82F1B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1212, 'A1000012B7F82C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1213, 'A1000012B7F84F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1214, 'A1000012B7F854', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1215, 'A1000012B7F85B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1216, 'A1000012B7F6D2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1217, 'A1000012B7F817', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1218, 'A1000012B7F80C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1219, 'A1000012B7F6D0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1220, 'A1000012B7F85E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1221, 'A1000012B7F823', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1222, 'A1000012B7B64B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1223, 'A1000012B7B252', '04:00', '14:00', 25, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1224, 'A1000012B7B651', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1225, 'A1000012B7B2BA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1226, 'A1000012B7B2C9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1227, 'A1000012B7B589', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1228, 'A1000012B7B2CC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1229, 'A1000012B7B710', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1230, 'A1000012B7B6DD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1231, 'A1000012B7B6A6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1232, 'A1000012B831A4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1233, 'A1000012B826BC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1234, 'A1000012B8309D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1235, 'A1000012B830C1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1236, 'A1000012B831AB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1237, 'A1000012B830A0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1238, 'A1000012B815E2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1239, 'A1000012B831C2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1240, 'A1000012B815D4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1241, 'A1000012B815EA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1242, 'A1000012B7C9A3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1243, 'A1000012B7C997', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1244, 'A1000012B7C84A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1245, 'A1000012B7C97A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1246, 'A1000012B7C940', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1247, 'A1000012B7C89A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1248, 'A1000012B7C996', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1249, 'A1000012B7C8D4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1250, 'A1000012B7C8D0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1251, 'A1000012B7C86C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1252, 'A1000012B82CB0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1253, 'A1000012B82C98', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1254, 'A1000012B82CAA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1255, 'A1000012B82C88', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1256, 'A1000012B82CC0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1257, 'A1000012B82C95', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1258, 'A1000012B82CAB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1259, 'A1000012B82CB1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1260, 'A1000012B82CA0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1261, 'A1000012B82C7A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1262, 'A1000012B82292', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1263, 'A1000012B822BE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1264, 'A1000012B82288', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1265, 'A1000012B82230', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1266, 'A1000012B8224C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1267, 'A1000012B82266', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1268, 'A1000012B82232', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1269, 'A1000012B8225B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1270, 'A1000012B82249', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1271, 'A1000012B8228C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1272, 'A1000012B7D202', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1273, 'A1000012B7D0F2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1274, 'A1000012B7D101', '05:00', '14:00', 15, 1);
commit;
prompt 1301 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1275, 'A1000012B7D16F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1276, 'A1000012B7D170', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1277, 'A1000012B7D1F8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1278, 'A1000012B7D203', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1279, 'A1000012B7D173', '04:00', '14:00', 25, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1280, 'A1000012B7D1DB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1281, 'A1000012B7D1FC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1282, 'A1000012B79D60', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1283, 'A1000012B76B1E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1284, 'A1000012B7B593', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1285, 'A1000012B763A0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1286, 'A1000012B7B382', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1287, 'A1000012B7B28B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1288, 'A1000012B75BB7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1289, 'A1000012B758F3', '04:00', '14:00', 25, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1290, 'A1000012B75D58', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1291, 'A1000012B7B3D6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1292, 'A1000012B7DDB1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1293, 'A1000012B7F81A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1294, 'A1000012B7F810', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1295, 'A1000012B7F844', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1296, 'A1000012B7BF05', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1297, 'A1000012B7F840', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1298, 'A1000012B7C2F9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1299, 'A1000012B7C2F3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1300, 'A1000012B7C2FB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1301, 'A1000012B7C2A8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1302, 'A1000012B7F824', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1303, 'A1000012B7F7AD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1304, 'A1000012B7F857', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1305, 'A1000012B7F867', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1306, 'A1000012B7F849', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1307, 'A1000012B7C2B5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1308, 'A1000012B7C2BF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1309, 'A1000012B7C2D6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1310, 'A1000012B7C0A0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1311, 'A1000012B7C2A7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1312, 'A1000012B82FEB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1313, 'A1000012B815FC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1314, 'A1000012B8161C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1315, 'A1000012B82CAC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1316, 'A1000012B82C8F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1317, 'A1000012B82C67', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1318, 'A1000012B82CBC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1319, 'A1000012B82C48', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1320, 'A1000012B82956', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1321, 'A1000012B82C7F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1322, 'A1000012B82B6A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1323, 'A1000012B82CBE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1324, 'A1000012B82C72', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1325, 'A1000012B820DD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1326, 'A1000012B81C92', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1327, 'A1000012B82120', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1328, 'A1000012B820E7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1329, 'A1000012B8208D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1330, 'A1000012B81E0F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1331, 'A1000012B820ED', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1332, 'A1000012B83020', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1333, 'A1000012B820CD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1334, 'A1000012B820D8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1335, 'A1000012B820BE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1336, 'A1000012B7D7D2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1337, 'A1000012B7D718', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1338, 'A1000012B7D7D3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1339, 'A1000012B7D71A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1340, 'A1000012B7D740', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1341, 'A1000012B7D7D5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1342, 'A1000012B7D741', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1343, 'A1000012B7D74A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1344, 'A1000012B7D724', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1345, 'A1000012B7D721', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1346, 'A1000012B8162D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1347, 'A1000012B81630', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1348, 'A1000012B815FD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1349, 'A1000012B822C0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1350, 'A1000012B822C7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1351, 'A1000012B815D1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1352, 'A1000012B822C1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1353, 'A1000012B82285', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1354, 'A1000012B81606', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1355, 'A1000012B815FB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1356, 'A1000012B82225', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1357, 'A1000012B82228', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1358, 'A1000012B82214', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1359, 'A1000012B821FE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1360, 'A1000012B82201', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1361, 'A1000012B8221E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1362, 'A1000012B8222C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1363, 'A1000012B82241', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1364, 'A1000012B821F2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1365, 'A1000012B82215', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1366, 'A1000012B7C425', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1367, 'A1000012B7C3CF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1368, 'A1000012B7C38F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1369, 'A1000012B7C41D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1370, 'A1000012B7C415', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1371, 'A1000012B7C434', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1372, 'A1000012B7C391', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1373, 'A1000012B7C432', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1374, 'A1000012B7C42A', '05:00', '14:00', 15, 1);
commit;
prompt 1401 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1375, 'A1000012B7C38D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1376, 'A1000012B7590C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1377, 'A1000012B78C82', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1378, 'A1000012B7BB5A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1379, 'A1000012B76B3F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1380, 'A1000012B7A565', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1381, 'A1000012B82F92', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1382, 'A1000012B7B835', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1383, 'A1000012B78CA9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1384, 'A1000012B7591B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1385, 'A1000012B7594E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1386, 'A1000012B7D504', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1387, 'A1000012B7D58B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1388, 'A1000012B7D4D3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1389, 'A1000012B7D59B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1390, 'A1000012B7D52F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1391, 'A1000012B7D57E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1392, 'A1000012B7D536', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1393, 'A1000012B7D4FC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1394, 'A1000012B7D58E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1395, 'A1000012B7D589', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1396, 'A1000012B82211', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1397, 'A1000012B82236', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1398, 'A1000012B82224', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1399, 'A1000012B82257', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1400, 'A1000012B82251', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1401, 'A1000012B8224F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1402, 'A1000012B8223E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1403, 'A1000012B82219', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1404, 'A1000012B82248', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1405, 'A1000012B82233', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1406, 'A1000012B81604', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1407, 'A1000012B81544', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1408, 'A1000012B81620', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1409, 'A1000012B831BD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1410, 'A1000012B8163C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1411, 'A1000012B81616', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1412, 'A1000012B81617', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1413, 'A1000012B815DD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1414, 'A1000012B81608', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1415, 'A1000012B8162E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1416, 'A1000012B7C443', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1417, 'A1000012B7C431', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1418, 'A1000012B7C33D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1419, 'A1000012B7C418', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1420, 'A1000012B7C3D8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1421, 'A1000012B7C433', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1422, 'A1000012B7C404', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1423, 'A1000012B7C428', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1424, 'A1000012B7C471', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1425, 'A1000012B7C3DF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1426, 'A1000012B7B1EE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1427, 'A1000012B78CD4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1428, 'A1000012B7BA6A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1429, 'A1000012B78CB6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1430, 'A1000012B79D71', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1431, 'A1000012B7B60C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1432, 'A1000012B758D2', '04:00', '14:00', 25, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1433, 'A1000012B7B7CD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1434, 'A1000012B7589C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1435, 'A1000012B78C51', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1436, 'A1000012B7D8FB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1437, 'A1000012B7D83E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1438, 'A1000012B7D96F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1439, 'A1000012B7D9A2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1440, 'A1000012B7D80F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1441, 'A1000012B7D8F1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1442, 'A1000012B7D884', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1443, 'A1000012B7DA00', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1444, 'A1000012B7D9FE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1445, 'A1000012B7D91C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1446, 'A1000012B7DD77', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1447, 'A1000012B7F7CF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1448, 'A1000012B7F7C3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1449, 'A1000012B7F7F4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1450, 'A1000012B7F7D9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1451, 'A1000012B7DE0F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1452, 'A1000012B7F7B1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1453, 'A1000012B7FDBB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1454, 'A1000012B7F7EE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1455, 'A1000012B7F7A4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1456, 'A1000012B7F710', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1457, 'A1000012B7FDB0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1458, 'A1000012B7FDAD', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1459, 'A1000012B7F73A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1460, 'A1000012B7F75E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1461, 'A1000012B7F747', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1462, 'A1000012B7F767', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1463, 'A1000012B7FDB7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1464, 'A1000012B7F76B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1465, 'A1000012B7F67F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1466, 'A1000012B83026', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1467, 'A1000012B81D3C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1468, 'A1000012B81E75', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1469, 'A1000012B81C9F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1470, 'A1000012B82071', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1471, 'A1000012B8250B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1472, 'A1000012B820E5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1473, 'A1000012B81E81', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1474, 'A1000012B81EB6', '05:00', '14:00', 15, 1);
commit;
prompt 1501 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1475, 'A1000012B82079', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1476, 'A1000012B81C86', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1477, 'A1000012B7F7BE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1478, 'A1000012B7F7BB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1479, 'A1000012B7F796', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1480, 'A1000012B7F81F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1481, 'A1000012B7F7E9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1482, 'A1000012B7F7BA', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1483, 'A1000012B7F7E5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1484, 'A1000012B7F7E0', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1485, 'A1000012B7C891', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1486, 'A1000012B7C934', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1487, 'A1000012B7D071', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1488, 'A1000012B7D04C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1489, 'A1000012B7CF8F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1490, 'A1000012B7D052', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1491, 'A1000012B7D055', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1492, 'A1000012B7D05E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1493, 'A1000012B7D050', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1494, 'A1000012B7D09E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1495, 'A1000012B7CFB1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1496, 'A1000012B7D06E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1497, 'A1000012B7C9B3', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1498, 'A1000012B7CA57', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1499, 'A1000012B7C9AE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1500, 'A1000012B7CA51', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1501, 'A1000012B7CA48', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1502, 'A1000012B7CA54', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1503, 'A1000012B7C96D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1504, 'A1000012B7CA2A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1505, 'A1000012B7CA21', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1506, 'A1000012B7CA39', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1507, 'A1000012B8226C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1508, 'A1000012B82277', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1509, 'A1000012B82296', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1510, 'A1000012B822A9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1511, 'A1000012B8223A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1512, 'A1000012B82287', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1513, 'A1000012B82280', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1514, 'A1000012B8229B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1515, 'A1000012B82293', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1516, 'A1000012B8228F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1517, 'A1000012B7D056', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1518, 'A1000012B7D044', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1519, 'A1000012B7D04B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1520, 'A1000012B7D004', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1521, 'A1000012B7CF90', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1522, 'A1000012B7D054', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1523, 'A1000012B7D05D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1524, 'A1000012B7CFB4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1525, 'A1000012B7D053', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1526, 'A1000012B7D048', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1527, 'A1000012B7D4D6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1528, 'A1000012B7D3CE', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1529, 'A1000012B7D4D7', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1530, 'A1000012B7D342', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1531, 'A1000012B7D4D5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1532, 'A1000012B7D395', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1533, 'A1000012B7D4D8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1534, 'A1000012B7D37B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1535, 'A1000012B7CE52', '04:00', '14:00', 25, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1536, 'A1000012B7CE79', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1537, 'A1000012B7B18C', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1538, 'A1000012B7B276', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1539, 'A1000012B7B667', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1540, 'A1000012B7B701', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1541, 'A1000012B7B3AB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1542, 'A1000012B7B3B4', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1543, 'A1000012B7B6B2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1544, 'A1000012B7B399', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1545, 'A1000012B7B72F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1546, 'A1000012B7B2F5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1547, 'A1000012B7D04F', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1548, 'A1000012B7CFA1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1549, 'A1000012B7D072', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1550, 'A1000012B7D090', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1551, 'A1000012B7D06A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1552, 'A1000012B7CFB8', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1553, 'A1000012B7CFBB', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1554, 'A1000012B7D060', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1555, 'A1000012B7D068', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1556, 'A1000012B7D00B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1557, 'A1000012B82C74', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1558, 'A1000012B82D38', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1559, 'A1000012B82DC5', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1560, 'A1000012B82D1B', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1561, 'A1000012B82D5A', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1562, 'A1000012B82DC9', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1563, 'A1000012B82BEF', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1564, 'A1000012B82D1E', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1565, 'A1000012B82C59', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1566, 'A1000012B82DCC', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1567, 'A1000012B82BC1', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1568, 'A1000012B82F95', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1569, 'A1000012B82C6D', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1570, 'A1000012B82C64', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1571, 'A1000012B83025', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1572, 'A1000012B82CC6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1573, 'A1000012B82D19', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1574, 'A1000012B8302C', '05:00', '14:00', 15, 1);
commit;
prompt 1601 records committed...
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1575, 'A1000012B82CB6', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1576, 'A1000012B82CA2', '05:00', '14:00', 15, 1);
insert into PLOT (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG)
values (1577, 'A1000012B815CF', '05:00', '14:00', 15, 1);
commit;
prompt 1603 records loaded
prompt Loading POLICETYPE...
insert into POLICETYPE (ID, NAME, TYPE)
values (0, '民警', null);
insert into POLICETYPE (ID, NAME, TYPE)
values (1, '协警', null);
insert into POLICETYPE (ID, NAME, TYPE)
values (2, '摩托车', null);
insert into POLICETYPE (ID, NAME, TYPE)
values (3, '汽车', null);
commit;
prompt 4 records loaded
prompt Loading SSI_AUTH_MENU...
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('-693b2f33:12fba395ab8:-7ffe', '-693b2f33:12fba395ab8:-7fff', '测试模块', '测试模块', null, 1, '1');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('1', '000001', '机构管理', '1', null, 111, null);
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('2', '000002', '用户管理', '1', null, 112, null);
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('3', '000003', '权限管理', '1', null, 113, null);
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('4', '000004', '菜单管理', '1', null, 110, null);
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('1.1', '0003', '单位管理', '1', '1', 1, 'platform/org/unit_mgr_list.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('2.1', '0004', '人员管理', '1', '2', 0, 'platform/org/user_mgr_list.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('3.1', '0002', '角色管理', '1', '3', 6, 'platform/auth/role_mgr_list.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('4.1', '0001', '菜单管理', '1', '4', 7, 'platform/auth/menu_mgr_list.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('5', '000005', '业务模块1', '1', null, 8, null);
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('5.1', '0005', '业务页面1', '1', '5', 9, 'biz/model1/model1.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('-693b2f33:12fba395ab8:-7ffb', '-693b2f33:12fba395ab8:-7ffc', '测试菜单', '测试菜单', '-693b2f33:12fba395ab8:-7ffe', 2, '/biz/model2/model2.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('69aa7b23:12fc366fd02:-7ffe', '69aa7b23:12fc366fd02:-7fff', '设备管理', '设备管理', null, 1, '1');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('69aa7b23:12fc366fd02:-7ffb', '69aa7b23:12fc366fd02:-7ffc', '手机设备', '手机设备', '69aa7b23:12fc366fd02:-7ffe', 1, '/biz/mobile/mobile_list.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('6', '000006', '业务模块2', '1', null, 10, null);
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('6.1', '0006', '业务页面2', '1', '6', 11, 'biz/model2/model2.jsp');
commit;
prompt 16 records loaded
prompt Loading SSI_AUTH_M_MENU_ROLE...
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('69aa7b23:12fc366fd02:-7ffe', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('69aa7b23:12fc366fd02:-7ffb', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('69aa7b23:12fc366fd02:-7ffe', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('69aa7b23:12fc366fd02:-7ffb', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('6', '6c8d3966:12fbf14e288:-7ffb');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('6.1', '6c8d3966:12fbf14e288:-7ffb');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('1', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('1.1', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('2', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('2.1', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('3', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('3.1', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('1', '6c8d3966:12fbf14e288:-7ffc');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('1.1', '6c8d3966:12fbf14e288:-7ffc');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('2', '6c8d3966:12fbf14e288:-7ffc');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('2.1', '6c8d3966:12fbf14e288:-7ffc');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('3', '6c8d3966:12fbf14e288:-7ffc');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('3.1', '6c8d3966:12fbf14e288:-7ffc');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('5', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('5.1', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('6', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('6.1', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('1', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('1.1', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-693b2f33:12fba395ab8:-7ffe', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-693b2f33:12fba395ab8:-7ffb', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('4.1', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('4', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('3.1', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('3', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('2.1', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('2', 'adminRole');
commit;
prompt 32 records loaded
prompt Loading SSI_AUTH_M_MENU_ROLE2...
prompt Table is empty
prompt Loading SSI_AUTH_M_ROLE_RESOURCE...
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', '-693b2f33:12fba395ab8:-7ffc');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', '-693b2f33:12fba395ab8:-7fff');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', '000005');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', '000006');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', '0005');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', '0006');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', '69aa7b23:12fc366fd02:-7ffc');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', '69aa7b23:12fc366fd02:-7fff');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', 'base');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('6c8d3966:12fbf14e288:-7ffb', '000006');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('6c8d3966:12fbf14e288:-7ffb', '0006');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('6c8d3966:12fbf14e288:-7ffb', 'base');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('6c8d3966:12fbf14e288:-7ffc', '000001');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('6c8d3966:12fbf14e288:-7ffc', '000002');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('6c8d3966:12fbf14e288:-7ffc', '000003');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('6c8d3966:12fbf14e288:-7ffc', '0002');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('6c8d3966:12fbf14e288:-7ffc', '0003');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('6c8d3966:12fbf14e288:-7ffc', '0004');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('6c8d3966:12fbf14e288:-7ffc', 'base');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', '69aa7b23:12fc366fd02:-7ffc');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', '69aa7b23:12fc366fd02:-7fff');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', 'allresource');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '000001');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '000002');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '000003');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '0002');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '0003');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '0004');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', 'base');
commit;
prompt 29 records loaded
prompt Loading SSI_AUTH_M_USER_ROLE...
insert into SSI_AUTH_M_USER_ROLE (ROLE_ID, USER_ID)
values ('6c8d3966:12fbf14e288:-7ffc', '-beeb56c:11ce53e3927:-7feb');
insert into SSI_AUTH_M_USER_ROLE (ROLE_ID, USER_ID)
values ('6c8d3966:12fbf14e288:-7ffb', '6c8d3966:12fbf14e288:-7ffe');
insert into SSI_AUTH_M_USER_ROLE (ROLE_ID, USER_ID)
values ('adminRole', 'admin');
insert into SSI_AUTH_M_USER_ROLE (ROLE_ID, USER_ID)
values ('-3dd28002:12fbebeba22:-8000', '-beeb56c:11ce53e3927:-7fed');
insert into SSI_AUTH_M_USER_ROLE (ROLE_ID, USER_ID)
values ('sysUserRole', '3e36c54c:11cfa326220:-7fd7');
commit;
prompt 5 records loaded
prompt Loading SSI_AUTH_RESOURCE...
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('base', '.(js|xml|html|htm|css|jpg|png|bmp|gif|index.jsp|platform/login_point.action|platform/login!.*?\.action.*|platform/logout.action|platform/framework.*)', null, null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('-693b2f33:12fba395ab8:-7ffc', '/biz/model2/model2.jsp', '测试菜单', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('0007', '/platform/org/unit_mgr_list.jsp', '11', null, '1', '1111');
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('000001', '000001', null, null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('000002', '000002', null, null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('000003', '000003', null, null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('000004', '000004', null, null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('000005', '000005', null, null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('000006', '000006', null, null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('69aa7b23:12fc366fd02:-7ffc', '.(biz/mobile/mobile_.*.jsp|biz/mobileAC!.*)', '手机设备', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('3', '/biz/model1AC!operatorHandler.action\?id=1111', '33', null, '1', '1');
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('unlimitedresource', '.*?\.(js|xml|html|htm|css|jpg|png|bmp|gif)', '系统文件资源', null, '2', '系统中所有不受限资源，例如js，css。');
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('allresource', '.*', '系统所有资源', null, '2', '系统所有资源，只能超级管理员访问');
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('-693b2f33:12fba395ab8:-7fff', '1', '测试模块', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('0001', '.(platform/auth/menu_.*.jsp|platform/menuAC!.*)', '菜单', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('0002', '.(platform/auth/role_.*.jsp|platform/roleAC!.*)', '角色管理', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('0003', '.(platform/org/unit_.*.jsp|platform/unit.*)', '单位管理', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('0004', '.(platform/org/user_.*.jsp|platform/userAC!.*)', '人员管理', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('0005', '/biz/model1/model1.jsp', '业务页面1', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('0006', '/biz/model2/model2.jsp', '业务页面2', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('69aa7b23:12fc366fd02:-7fff', '1', '设备管理', null, '1', null);
commit;
prompt 21 records loaded
prompt Loading SSI_AUTH_ROLE...
insert into SSI_AUTH_ROLE (ROLE_ID, ROLE_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, UNIT_ID)
values ('6c8d3966:12fbf14e288:-7ffb', '业务用户1', '业务用户1', null, '1', '10000');
insert into SSI_AUTH_ROLE (ROLE_ID, ROLE_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, UNIT_ID)
values ('sysUserRole', '系统管理员', '系统管理员', null, '1', '00000');
insert into SSI_AUTH_ROLE (ROLE_ID, ROLE_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, UNIT_ID)
values ('adminRole', '超级管理员', '超级管理员，不允许删除', null, '1', '00000');
insert into SSI_AUTH_ROLE (ROLE_ID, ROLE_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, UNIT_ID)
values ('-3dd28002:12fbebeba22:-8000', '业务用户', '业务用户', null, '1', '00000');
insert into SSI_AUTH_ROLE (ROLE_ID, ROLE_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, UNIT_ID)
values ('6c8d3966:12fbf14e288:-7ffc', '系统管理员1', '系统管理员1', null, '1', '10000');
commit;
prompt 5 records loaded
prompt Loading SSI_ORG_ACCOUNT...
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('110010001', '110010001', 'mafei', '1', to_date('05-05-2011 15:40:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2014 00:11:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('110010002', '110010002', 'wangying', '1', to_date('05-05-2011 15:40:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2014 00:11:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('110020001', '110020001', 'songchao', '1', to_date('05-05-2011 15:40:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2014 00:11:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('110020002', '110020002', 'wangliang', '1', to_date('05-05-2011 15:40:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2014 00:11:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('120010001', '120010001', 'liusi', '1', to_date('05-05-2011 15:40:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2014 00:11:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('120010002', '120010002', 'zhangying', '1', to_date('05-05-2011 15:40:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2014 00:11:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('120020001', '120020001', 'lixiaohuan', '1', to_date('05-05-2011 15:40:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2014 00:11:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('120020002', '120020002', 'husi', '1', to_date('05-05-2011 15:40:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2014 00:11:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('admin', 'admin', 'admin', '1', to_date('01-04-2011', 'dd-mm-yyyy'), to_date('11-01-2014 00:11:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '0', '超级管理员，不允许删除。');
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('-beeb56c:11ce53e3927:-7fec', '3e36c54c:11cfa326220:-7fd7', 'zhangsan', '1', to_date('02-04-2011', 'dd-mm-yyyy'), to_date('01-04-2013', 'dd-mm-yyyy'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('-beeb56c:11ce53e3927:-7fea', '-beeb56c:11ce53e3927:-7fed', 'lisi', '1', to_date('02-04-2011', 'dd-mm-yyyy'), to_date('01-04-2013', 'dd-mm-yyyy'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('-beeb56c:11ce53e3927:-7fe8', '-beeb56c:11ce53e3927:-7feb', 'wangwu', '1', to_date('02-04-2011', 'dd-mm-yyyy'), to_date('01-04-2013', 'dd-mm-yyyy'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('6c8d3966:12fbf14e288:-7ffd', '6c8d3966:12fbf14e288:-7ffe', 'maliu', '1', to_date('05-05-2011 15:40:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2014 00:11:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '0', null);
commit;
prompt 13 records loaded
prompt Loading SSI_ORG_M_USER_UNIT...
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('10000', '-beeb56c:11ce53e3927:-7fed');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('00000', 'admin');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('11001', '110010001');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('11001', '110010002');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('11002', '110020001');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('11002', '110020002');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('12001', '120010001');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('12001', '120010002');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('12002', '120020001');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('12002', '120020002');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('10000', '3e36c54c:11cfa326220:-7fd7');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('11000', '-beeb56c:11ce53e3927:-7feb');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('11000', '6c8d3966:12fbf14e288:-7ffe');
commit;
prompt 13 records loaded
prompt Loading SSI_ORG_UNIT...
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF)
values ('10000', '市局', '市局', '00000', '0');
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF)
values ('11000', '市局部门', '市局部门', '10000', '0');
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF)
values ('12000', '分县局', '分县局', '10000', '0');
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF)
values ('11001', '一科', '一科', '11000', '1');
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF)
values ('11002', '二科', '二科', '11000', '1');
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF)
values ('12001', '一队', '一队', '12000', '1');
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF)
values ('12002', '二队', '二队', '12000', '1');
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF)
values ('11003', '三科', '三科', '11000', '1');
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF)
values ('11004', '四科', '四科', '11000', '1');
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF)
values ('00000', '根组织单元', '根组织单元', null, null);
commit;
prompt 10 records loaded
prompt Loading SSI_ORG_USER...
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('-beeb56c:11ce53e3927:-7feb', '王五', 'M', null, null, '超级管理员');
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('admin', '超级管理员', 'M', null, null, '超级管理员，不允许删除。');
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('3e36c54c:11cfa326220:-7fd7', '张三', 'M', null, null, '系统用户');
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('-beeb56c:11ce53e3927:-7fed', '李四', 'M', null, null, '普通用户');
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('110010001', '马飞', 'M', null, null, '11');
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('110010002', '王英', 'F', null, null, null);
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('110020001', '宋超', 'F', null, null, null);
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('110020002', '王亮', 'F', null, null, null);
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('120010001', '刘四', 'F', null, null, null);
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('120010002', '张影', 'F', null, null, null);
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('120020001', '李小环', 'F', null, null, null);
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('120020002', '胡四', 'F', null, null, null);
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('6c8d3966:12fbf14e288:-7ffe', '马六', 'M', null, null, '马六');
commit;
prompt 13 records loaded
prompt Loading TABLE1...
insert into TABLE1 (NAME, PSW, DES)
values ('1', '1', '1');
insert into TABLE1 (NAME, PSW, DES)
values ('x', 'x', null);
insert into TABLE1 (NAME, PSW, DES)
values ('1', '1', '1');
insert into TABLE1 (NAME, PSW, DES)
values ('1', '1', '1');
insert into TABLE1 (NAME, PSW, DES)
values ('1', '1', '1');
insert into TABLE1 (NAME, PSW, DES)
values ('1', '1', '1');
commit;
prompt 6 records loaded
prompt Loading T_SJSB...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1458, '大庆公安局东安分局', '支队一', '吕默', null, '18945600613', 'A1000012B7C891', '230103197909055919', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1459, '大庆公安局东安分局', '支队一', '金宝玉', null, '18945601101', 'A1000012B7C934', '230602197006064030', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1460, '大庆公安局东安分局', '支队一', '冯文彬', null, '18945601102', 'A1000012B7D071', '230603196601051156', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1461, '大庆公安局东安分局', '支队一', '孙庆晟', null, '18945601103', 'A1000012B7D04C', '230602198003244452', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1462, '大庆公安局东安分局', '支队一', '王冠军', null, '18945601105', 'A1000012B7CF8F', '230602195202285712', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1463, '大庆公安局东安分局', '支队一', '刘洪亮', null, '18945601106', 'A1000012B7D052', '23060519750514021X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1464, '大庆公安局东安分局', '支队一', '贺剑秋', null, '18945601107', 'A1000012B7D055', '230602196510152713', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1465, '大庆公安局东安分局', '支队一', '魏炜', null, '18945601108', 'A1000012B7D05E', '230105197901120512', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1466, '大庆公安局东安分局', '支队一', '郭勇', null, '18945601109', 'A1000012B7D050', '23060219710404341X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1467, '大庆公安局东安分局', '支队一', '孙万库', null, '18945601110', 'A1000012B7D09E', '230602197202016239', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1468, '大庆公安局东安分局', '支队一', '封士艳', null, '18945601121', 'A1000012B7CFB1', '230602196604063420', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1469, '大庆公安局东安分局', '支队一', '陈宇', null, '18945601122', 'A1000012B7D06E', '230604197807074418', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1470, '大庆公安局东安分局', '支队一', '马树伟', null, '18945601123', 'A1000012B7C9B3', '230602196404013410', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1471, '大庆公安局东安分局', '支队一', '曹亮', null, '18945601126', 'A1000012B7CA57', '230402197801010030', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1472, '大庆公安局东安分局', '支队一', '李啸军', null, '18945601127', 'A1000012B7C9AE', '230602197309011016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1473, '大庆公安局东安分局', '支队一', '徐雷', null, '18945601128', 'A1000012B7CA51', '230206197406140219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1474, '大庆公安局东安分局', '支队一', '孙福春', null, '18945601129', 'A1000012B7CA48', '230103197704085110', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1475, '大庆公安局东安分局', '支队一', '袁静华', null, '18945601130', 'A1000012B7CA54', '230602195902260022', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1476, '大庆公安局东安分局', '支队一', '胡学忠', null, '18945601131', 'A1000012B7C96D', '23060219680601191X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1477, '大庆公安局东安分局', '支队一', '严冰', null, '18945601135', 'A1000012B7CA2A', '230602198211045925', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1478, '大庆公安局东安分局', '支队一', '郭洪亮', null, '18945601136', 'A1000012B7CA21', '230604198301051838', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1479, '大庆公安局东安分局', '支队一', '史广文', null, '18945601137', 'A1000012B7CA39', '230602196710062114', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1480, '大庆公安局东安分局', '支队一', '孙亚军', null, '18945601139', 'A1000012B8226C', '230602196308130035', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1481, '大庆公安局东安分局', '支队一', '单良', null, '18945601140', 'A1000012B82277', '230804198512270935', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1482, '大庆公安局东安分局', '支队一', '陈国军', null, '18945601148', 'A1000012B82296', '230602196710013638', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1483, '大庆公安局东安分局', '支队一', '肖勇', null, '18945601150', 'A1000012B822A9', '230602196211014417', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1484, '大庆公安局东安分局', '支队一', '夏崇印', null, '18945601151', 'A1000012B8223A', '230602197308270219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1485, '大庆公安局东安分局', '支队一', '李国彬', null, '18945601152', 'A1000012B82287', '110108197002102355', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1486, '大庆公安局东安分局', '支队一', '崔英', null, '18945601156', 'A1000012B82280', '230602196302023810', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1487, '大庆公安局东安分局', '支队一', '周宪庭', null, '18945601157', 'A1000012B8229B', '230602195710200818', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1488, '大庆公安局东安分局', '支队一', '刘艳梅', null, '18945601158', 'A1000012B82293', '230602196310310828', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1489, '大庆公安局东安分局', '支队一', '曹晓峰', null, '18945601159', 'A1000012B8228F', '230602197109201018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1490, '大庆公安局东安分局', '支队一', '叶锐', null, '18945601160', 'A1000012B7D056', '230603197604252513', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1491, '大庆公安局东安分局', '支队一', '孙毅', null, '18945601161', 'A1000012B7D044', '23060319730930021X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1494, '大庆公安局东安分局', '支队一', '王钰', null, '18945601165', 'A1000012B7CF90', '230602197211173826', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1492, '大庆公安局东安分局', '支队一', '周朋友', null, '18945601162', 'A1000012B7D04B', '23060219670925061X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1493, '大庆公安局东安分局', '支队一', '郝春良', null, '18945601163', 'A1000012B7D004', '230602197008123815', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1495, '大庆公安局东安分局', '支队一', '褚洪军', null, '18945601166', 'A1000012B7D054', '230602197104010239', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1496, '大庆公安局东安分局', '支队一', '王显亮', null, '18945601167', 'A1000012B7D05D', '230602195601293532', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1497, '大庆公安局东安分局', '支队一', '赵玉海', null, '18945601168', 'A1000012B7CFB4', '232302197211181012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1498, '大庆公安局东安分局', '支队一', '魏金樑', null, '18945601170', 'A1000012B7D053', '230602196906260411', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1499, '大庆公安局东安分局', '支队一', '于晶苏', null, '18945601171', 'A1000012B7D048', '23070419751105021X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1500, '大庆公安局东安分局', '支队一', '曹贵忠', null, '18945601173', 'A1000012B7D4D6', '230602196503011015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1501, '大庆公安局东安分局', '支队一', '刘剑涛', null, '18945601174', 'A1000012B7D3CE', '230602196402193075', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1502, '大庆公安局东安分局', '支队一', '张冰', null, '18945601176', 'A1000012B7D4D7', '230602197607022127', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1503, '大庆公安局东安分局', '支队一', '王庆武', null, '18945601177', 'A1000012B7D342', '230602196610100013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1504, '大庆公安局东安分局', '支队一', '刘景林', null, '18945601178', 'A1000012B7D4D5', '230602196605281913', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1505, '大庆公安局东安分局', '支队一', '谷相文', null, '18945601179', 'A1000012B7D395', '230605195902140011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1506, '大庆公安局东安分局', '支队一', '刘清泉', null, '18945601180', 'A1000012B7D4D8', '230602196501041915', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1507, '大庆公安局东安分局', '支队一', '王法', null, '18945601181', 'A1000012B7D37B', '230602196312313037', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1508, '大庆公安局东安分局', '支队一', '郑艳艳', null, '18945601183', 'A1000012B7CE52', '230602197706144445', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1509, '大庆公安局东安分局', '支队一', '张宇航', null, '18945601185', 'A1000012B7CE79', '230602197908124418', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1510, '大庆公安局东安分局', '支队一', '王士斌', null, '18945601186', 'A1000012B7B18C', '230602195101010437', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1511, '大庆公安局东安分局', '支队一', '李亚龙', null, '18945601187', 'A1000012B7B276', '230602196401200819', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1512, '大庆公安局东安分局', '支队一', '马波', null, '18945601188', 'A1000012B7B667', '230605196605262033', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1513, '大庆公安局东安分局', '支队一', '刘丽君', null, '18945601189', 'A1000012B7B701', '230606196204060060', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1514, '大庆公安局东安分局', '支队一', '刘岩松', null, '18945601190', 'A1000012B7B3AB', '232126197102070217', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1515, '大庆公安局东安分局', '支队一', '孙波', null, '18945601191', 'A1000012B7B3B4', '230104197512283450', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1516, '大庆公安局东安分局', '支队一', '霍瑞学', null, '18945601192', 'A1000012B7B6B2', '230603196402092318', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1517, '大庆公安局东安分局', '支队一', '杨景辉', null, '18945601195', 'A1000012B7B399', '230602196910020816', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1518, '大庆公安局东安分局', '支队一', '王海明', null, '18945601196', 'A1000012B7B72F', '230603196909140251', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1519, '大庆公安局东安分局', '支队一', '张学龙', null, '18945601197', 'A1000012B7B2F5', '230602197804132130', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1520, '大庆公安局东安分局', '支队一', '朱明', null, '18945601198', 'A1000012B7D04F', '230602196701301910', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1521, '大庆公安局东安分局', '支队一', '孙国富', null, '18945601199', 'A1000012B7CFA1', '230602196511240416', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1522, '大庆公安局东安分局', '支队一', '李莉', null, '18945601200', 'A1000012B7D072', '23060219570322343X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1523, '大庆公安局东安分局', '支队一', '许恩生', null, '18945601201', 'A1000012B7D090', '230602197008094014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1524, '大庆公安局东安分局', '支队一', '王立娟', null, '18945601202', 'A1000012B7D06A', '230602196403015924', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1525, '大庆公安局东安分局', '支队一', '张春玲', null, '18945601203', 'A1000012B7CFB8', '230605197005150024', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1526, '大庆公安局东安分局', '支队一', '尹静媛', null, '18945601205', 'A1000012B7CFBB', '230602196303063865', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1527, '大庆公安局东安分局', '支队一', '曲国栋', null, '18945601206', 'A1000012B7D060', '230602197602266210', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1528, '大庆公安局东安分局', '支队一', '佟建莉', null, '18945601207', 'A1000012B7D068', '230602195808073829', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1529, '大庆公安局东安分局', '支队一', '张春丽', null, '18945601208', 'A1000012B7D00B', '230602196310140064', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1530, '大庆公安局东安分局', '支队一', '黄华', null, '18945601209', 'A1000012B82C74', '230602197212183815', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1531, '大庆公安局东安分局', '支队一', '李冠杰', null, '18945601210', 'A1000012B82D38', '230604195004192016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1532, '大庆公安局东安分局', '支队一', '董正罡', null, '18945601211', 'A1000012B82DC5', '230602197709277518', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1533, '大庆公安局东安分局', '支队一', '王振忠', null, '18945601212', 'A1000012B82D1B', '230602197512020233', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1534, '大庆公安局东安分局', '支队一', '兰萍', null, '18945601213', 'A1000012B82D5A', '230602196404013410', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1535, '大庆公安局东安分局', '支队一', '王振芳', null, '18945601215', 'A1000012B82DC9', '230602196810254017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1126, '大庆市公安局', '大庆公安局', '陈国强', null, '18945600183', 'A1000012B78C05', '230602196711021955', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1127, '大庆市公安局', '支队一', '高玉福', null, '18945600185', 'A1000012B7A87F', '230602195901280013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1128, '大庆市公安局', '支队一', '晏鹏', null, '18945600186', 'A1000012B757A5', '230602196906011933', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1129, '大庆市公安局', '支队一1', '边疆强', null, '18945600188', 'A1000012B7BDB6', '230602196702020011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1130, '大庆市公安局', '支队一1', '冯连生', null, '18945600189', 'A1000012B82982', '230606196006151610', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1131, '大庆市公安局', '支队一', '马兵', null, '18945600191', 'A1000012B7B38E', '230105197808010757', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1132, '大庆市公安局', '支队一', '王明星', null, '18945600195', 'A1000012B82F94', '230602196812144014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1133, '大庆市公安局', '支队一', '金德春', null, '18945600197', 'A1000012B82F9F', '230602196010261016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1134, '大庆市公安局', '支队一', '刘喜贵', null, '18945600198', 'A1000012B83027', '230606195801280038', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1135, '大庆市公安局', '支队一', '赵继娜', null, '18945600200', 'A1000012B7F2AC', '230603197507211322', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1136, '大庆市公安局', '支队一', '王国臣', null, '18945600789', 'A1000012B7F2A1', '230602196708111933', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1137, '大庆市公安局', '支队一', '王亚君', null, '18945600055', 'A1000012B7F2D1', '230602196601241949', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1138, '大庆市公安局', '支队一', '周江', null, '18945600501', 'A1000012B7F283', '230602196306100617', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1139, '大庆市公安局', '支队一', '姜文海', null, '18945600505', 'A1000012B7F2E8', '230602196503251975', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1140, '大庆市公安局', '支队一', '王剑', null, '18945600506', 'A1000012B7F168', '230602197907287119', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1141, '大庆市公安局', '支队一', '张川伟', null, '18945600509', 'A1000012B7F2DC', '230602195805086237', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1142, '大庆市公安局', '支队一', '王景林', null, '18945600511', 'A1000012B7F2D7', '230602195704273818', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1143, '大庆市公安局', '支队一', '田峰', null, '18945600515', 'A1000012B7F2D3', '232328197703030011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1144, '大庆市公安局', '支队一', '许守俊', null, '18945600516', 'A1000012B7F234', '23060219710215401X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1145, '大庆市公安局', '支队一', '商胜学', null, '18945600519', 'A1000012B830F5', '230221197311060711', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1146, '大庆市公安局', '支队一', '谷泉', null, '18945600520', 'A1000012B82FF4', '230602198204105918', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1147, '大庆市公安局', '支队一', '沈志强', null, '18945600521', 'A1000012B831EF', '230602197802052110', '0', '0', null, null);
commit;
prompt 101 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1148, '大庆市公安局', '支队一', '赵雪莉', null, '18945600523', 'A1000012B8324B', '230603196401281141', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1149, '大庆市公安局', '支队一', '高勇', null, '18945600526', 'A1000012B831E7', '23060219670825001X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1150, '大庆市公安局', '支队一', '曹丽', null, '18945600527', 'A1000012B83247', '230602196809193886', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1151, '大庆市公安局', '支队一', '陈永泉', null, '18945600528', 'A1000012B83093', '230602195812121213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1152, '大庆市公安局', '支队一', '刘广志', null, '18945600531', 'A1000012B83251', '230602196606100037', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1153, '大庆市公安局', '支队一', '王秋安', null, '18945600532', 'A1000012B83127', '230602196009020012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1154, '大庆市公安局', '支队一', '孙凯', null, '18945600533', 'A1000012B823E8', '230602197710305918', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1155, '大庆市公安局', '支队一', '韩洁', null, '18945600535', 'A1000012B82992', '230602197709216221', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1156, '大庆市公安局', '支队一', '王力侠', null, '18945600536', 'A1000012B8299B', '230606196611075820', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1157, '大庆市公安局', '支队一', '高桂萍', null, '18945600538', 'A1000012B8296C', '230602196409083821', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1158, '大庆市公安局', '支队一', '郜婉秋', null, '18945600539', 'A1000012B82926', '232722196710180228', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1159, '大庆市公安局', '支队一', '范世飚', null, '18945600543', 'A1000012B82C89', '230602196811141970', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1160, '大庆市公安局', '支队一', '吕凤琴', null, '18945600545', 'A1000012B82940', '230602196407014427', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1161, '大庆市公安局', '支队一', '李多渤', null, '18945600550', 'A1000012B8299C', '230602196109085614', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1162, '大庆市公安局', '支队一', '李雪静', null, '18945600556', 'A1000012B82986', '230604197912193662', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1163, '大庆市公安局', '支队一', '邹林国', null, '18945600557', 'A1000012B8290B', '230605196106142010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1164, '大庆市公安局', '支队一', '程大秋', null, '18945600558', 'A1000012B824DB', '230103197408085159', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1165, '大庆市公安局', '支队一', '蒋洪军', null, '18945600559', 'A1000012B7D062', '23060219691128213X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1166, '大庆市公安局', '支队一', '张新双', null, '18945600560', 'A1000012B7CFFD', '230602196901115151', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1167, '大庆市公安局', '支队一', '张磊', null, '18945600566', 'A1000012B7CFB7', '230602197212283859', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1168, '大庆市公安局', '支队一', '张永森', null, '18945600567', 'A1000012B7CF9D', '230602195806104214', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1169, '大庆市公安局', '支队一', '姜东华', null, '18945600568', 'A1000012B7D007', '230602196811300417', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1170, '大庆市公安局', '支队一', '刘勇', null, '18945600570', 'A1000012B7CF96', '23010319750303515X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1171, '大庆市公安局', '支队一', '渠修泉', null, '18945600577', 'A1000012B7CFBD', '230602197303307115', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1172, '大庆市公安局', '支队一', '刘海峰', null, '18945600579', 'A1000012B7CF9E', '230602196909220810', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1173, '大庆市公安局', '支队一', '殷龙', null, '18945600037', 'A1000012B7CFA6', '232328197803250011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1174, '大庆市公安局', '支队一', '李健春', null, '18945600583', 'A1000012B7CFA2', '230604196808061817', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1175, '大庆市公安局', '支队一', '单启辉', null, '18945600585', 'A1000012B83023', '230602197909285918', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1176, '大庆市公安局', '支队一', '张臣', null, '18945600586', 'A1000012B82F22', '230602196710261957', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1177, '大庆市公安局', '支队一', '徐岱', null, '18945600588', 'A1000012B82F1D', '230602197211166239', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1178, '大庆市公安局', '支队一', '黄齐南', null, '18945600589', 'A1000012B82F3C', '230202196103091018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1179, '大庆市公安局', '支队一', '宋海涛', null, '18945600595', 'A1000012B82F21', '232328197010040014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1180, '大庆市公安局', '支队一', '沈永志', null, '18945600599', 'A1000012B82F2E', '230602195708100017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1181, '大庆市公安局', '支队一', '曲明', null, '18945600600', 'A1000012B82F3F', '230602195903023416', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1182, '大庆市公安局', '支队一', '肖景慧', null, '18945600989', 'A1000012B82F04', '232303197212252050', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1183, '大庆市公安局', '支队一', '徐景波', null, '18945600601', 'A1000012B82F93', '230602197003064019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1184, '大庆市公安局', '支队一', '盖海涛', null, '18945600605', 'A1000012B82F1B', '230602197710252174', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1185, '大庆市公安局', '支队一', '王乐夫', null, '18945600606', 'A1000012B7F82C', '230602196704071954', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1186, '大庆市公安局', '支队一', '王连', null, '18945600607', 'A1000012B7F84F', '230602196003220013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1187, '大庆市公安局', '支队一', '姜立波', null, '18945600608', 'A1000012B7F854', '222326197407109214', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1188, '大庆市公安局', '支队一', '米云凯', null, '18945600609', 'A1000012B7F85B', '230602197606295158', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1189, '大庆市公安局', '支队一', '张昌吉', null, '18945600610', 'A1000012B7F6D2', '230602197707052155', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1190, '大庆市公安局', '支队一', '王大伟', null, '18945600611', 'A1000012B7F817', '230103197809172835', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1191, '大庆市公安局', '支队一', '申景辉', null, '18945600612', 'A1000012B7F80C', '230602197705074414', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1192, '大庆市公安局', '支队一', '付彦龙', null, '18945600616', 'A1000012B7F6D0', '230103197612154617', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1193, '大庆市公安局', '支队一', '王学东', null, '18945600617', 'A1000012B7F85E', '230603197103242333', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1194, '大庆市公安局', '支队一', '张会臣', null, '18945600618', 'A1000012B7F823', '230602197202040618', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1195, '大庆市公安局', '支队一', '何巍巍', null, '18945600619', 'A1000012B7B64B', '230602197912144024', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1196, '大庆市公安局', '支队一', '郑宏', null, '18945600626', 'A1000012B7B252', '231024197512130033', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1197, '大庆市公安局', '支队一', '王东', null, '18945600627', 'A1000012B7B651', '230602197602104019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1198, '大庆市公安局', '支队一', '张伟东', null, '18945600628', 'A1000012B7B2BA', '230602196908081919', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1199, '大庆市公安局', '支队一', '景大志', null, '18945600629', 'A1000012B7B2C9', '230602198002252530', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1200, '大庆市公安局', '支队一', '邢云舜', null, '18945600630', 'A1000012B7B589', '230602197511194012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1201, '大庆市公安局', '支队一', '马力为', null, '18945600631', 'A1000012B7B2CC', '230603197803291371', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1202, '大庆市公安局', '支队一', '宿国庆', null, '18945600633', 'A1000012B7B710', '230602197210124010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1203, '大庆市公安局', '支队一', '梁雪丽', null, '18945600635', 'A1000012B7B6DD', '230602195611214229', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1204, '大庆市公安局', '支队一', '于勇东', null, '18945600637', 'A1000012B7B6A6', '230602196708171936', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1205, '大庆市公安局', '支队一', '刘广政', null, '18945600638', 'A1000012B831A4', '230602197409124034', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1206, '大庆市公安局', '支队一', '姜福顺', null, '18945600639', 'A1000012B826BC', '23060219630407083X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1207, '大庆市公安局', '支队一', '姜来金', null, '18945600651', 'A1000012B8309D', '230602196306070016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1208, '大庆市公安局', '支队一', '薛淑玲', null, '18945600655', 'A1000012B830C1', '230602196707091926', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1292, '大庆市公安局', '支队一', '晏滨', null, '18945600829', 'A1000012B82C48', '230605196008030023', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1293, '大庆市公安局', '支队一', '刘秋玲', null, '18945600830', 'A1000012B82956', '230604196708080228', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1294, '大庆市公安局', '支队一', '李俭华', null, '18945600831', 'A1000012B82C7F', '230602197202073057', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1295, '大庆市公安局', '支队一', '吕莹', null, '18945600832', 'A1000012B82B6A', '23060419800419471X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1296, '大庆市公安局', '支队一', '王寿鹏', null, '18945600833', 'A1000012B82CBE', '230604196702232614', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1297, '大庆市公安局', '支队一', '吴海涛', null, '18945600835', 'A1000012B82C72', '230602197602194034', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1298, '大庆市公安局', '支队一', '姚东海', null, '18945600836', 'A1000012B820DD', '230606197501061756', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1299, '大庆市公安局', '支队一', '李达', null, '18945600837', 'A1000012B81C92', '230602197410122853', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1300, '大庆市公安局', '支队一', '仇建立', null, '18945600838', 'A1000012B82120', '230602197203170019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1301, '大庆市公安局', '支队一', '王维芳', null, '18945600839', 'A1000012B820E7', '230605196401312019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1302, '大庆市公安局', '支队一', '赵春来', null, '18945600856', 'A1000012B8208D', '230602196308190417', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1303, '大庆市公安局', '支队一', '李艳斌', null, '18945600849', 'A1000012B81E0F', '230602197602063632', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1304, '大庆市公安局', '支队一', '董伟', null, '18945600851', 'A1000012B820ED', '230602197607200210', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1305, '大庆市公安局', '支队一', '杨卓群', null, '18945601155', 'A1000012B83020', '23060219681115021X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1306, '大庆市公安局', '支队一', '焦艳丽', null, '18945600857', 'A1000012B820CD', '230604198011154724', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1307, '大庆市公安局', '支队一', '陈萍', null, '18945600858', 'A1000012B820D8', '230604197310081823', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1308, '大庆市公安局', '支队一', '高彧杉', null, '18945600860', 'A1000012B820BE', '23060319770619211X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1309, '大庆市公安局', '支队一', '于少春', null, '18945600861', 'A1000012B7D7D2', '230602198106134010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1310, '大庆市公安局', '支队一', '李文江', null, '18945600863', 'A1000012B7D718', '230604197512314138', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1311, '大庆市公安局', '支队一', '李洪涛', null, '18945600865', 'A1000012B7D7D3', '230226197510302818', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1312, '大庆市公安局', '支队一', '朱铁峰', null, '18945600866', 'A1000012B7D71A', '230602197112173812', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1313, '大庆市公安局', '支队一', '张阔', null, '18945600868', 'A1000012B7D740', '230602197909086353', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1314, '大庆市公安局', '支队一', '李永新', null, '18945600869', 'A1000012B7D7D5', '230605196210261634', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1315, '大庆市公安局', '支队一', '于志会', null, '18945600870', 'A1000012B7D741', '230605197609100212', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1316, '大庆市公安局', '支队一', '陶传宝', null, '18945600876', 'A1000012B7D74A', '230603197504074019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1317, '大庆市公安局', '支队一', '徐德民', null, '18945600877', 'A1000012B7D724', '230602196804191953', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1318, '大庆市公安局', '支队一', '于涛', null, '18945600878', 'A1000012B7D721', '230604197507115417', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1319, '大庆市公安局', '支队一', '金维民', null, '18945600879', 'A1000012B8162D', '230606196402051654', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1320, '大庆市公安局', '支队一', '曲柏臣', null, '18945600880', 'A1000012B81630', '230606196406040012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1321, '大庆市公安局', '支队一', '王学军', null, '18945600881', 'A1000012B815FD', '230603195710143012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1322, '大庆市公安局', '支队一', '郜英平', null, '18945600882', 'A1000012B822C0', '230606196212010771', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1323, '大庆市公安局', '支队一', '周军宝', null, '18945600883', 'A1000012B822C7', '230606197303050255', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1324, '大庆市公安局', '支队一', '杨柏楠', null, '18945600885', 'A1000012B815D1', '230604197507152613', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1325, '大庆市公安局', '支队一', '韩大伟', null, '18945600886', 'A1000012B822C1', '230602197505294017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1326, '大庆市公安局', '支队一', '王兆国', null, '18945600887', 'A1000012B82285', '230602197209073818', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1327, '大庆市公安局', '支队一', '王维东', null, '18945600889', 'A1000012B81606', '230604197508010633', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1328, '大庆市公安局', '支队一', '张国良', null, '18945600890', 'A1000012B815FB', '230605196109240011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1329, '大庆市公安局', '支队一', '孙沸水', null, '18945600891', 'A1000012B82225', '230606195901150011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1330, '大庆市公安局', '支队一', '李宝', null, '18945600892', 'A1000012B82228', '230606196412120019', '0', '0', null, null);
commit;
prompt 201 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1331, '大庆市公安局', '支队一', '牛百合', null, '18945600893', 'A1000012B82214', '230606196704171918', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1332, '大庆市公安局', '支队一', '沈广金', null, '18945600895', 'A1000012B821FE', '230602195410096211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1333, '大庆市公安局', '支队一', '王万友', null, '18945600896', 'A1000012B82201', '230602195602033434', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1334, '大庆市公安局', '支队一', '张喜瑞', null, '18945600897', 'A1000012B8221E', '230605195304151255', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1335, '大庆市公安局', '支队一', '张继刚', null, '18945600898', 'A1000012B8222C', '230605197510030613', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1336, '大庆市公安局', '支队一', '于开勇', null, '18945600899', 'A1000012B82241', '110108196212225738', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1337, '大庆市公安局', '支队一', '张海峰', null, '18945600900', 'A1000012B821F2', '230602197604106210', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1338, '大庆市公安局', '支队一', '徐忠峰', null, '18945600901', 'A1000012B82215', '230602196602070213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1339, '大庆市公安局', '支队一', '刘思佥', null, '18945600902', 'A1000012B7C425', '321002196703221818', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1340, '大庆市公安局', '支队一', '赵起超', null, '18945600903', 'A1000012B7C3CF', '230602196606141912', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1341, '大庆市公安局', '支队一', '陈永吉', null, '18945600905', 'A1000012B7C38F', '230604196405092619', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1342, '大庆市公安局', '支队一', '马超', null, '18945600906', 'A1000012B7C41D', '230602196405100831', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1343, '大庆市公安局', '支队一', '徐维彦', null, '18945600907', 'A1000012B7C415', '230602195810150213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1344, '大庆市公安局', '支队一', '仇雪松', null, '18945600908', 'A1000012B7C434', '230604197410304713', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1345, '大庆市公安局', '支队一', '李广林', null, '18945600909', 'A1000012B7C391', '230602196603011936', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1346, '大庆市公安局', '支队一', '张明仁', null, '18945600910', 'A1000012B7C432', '372301197201281911', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1347, '大庆市公安局', '支队一', '杨家富', null, '18945600911', 'A1000012B7C42A', '230226197503192817', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1348, '大庆市公安局', '支队一', '刘玉清', null, '18945600913', 'A1000012B7C38D', '230602196304143015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1349, '大庆市公安局', '支队一', '孙长旭', null, '18945600915', 'A1000012B7590C', '230604196503221218', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1350, '大庆市公安局', '支队一', '张文庆', null, '18945600916', 'A1000012B78C82', '230604197612124112', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1351, '大庆市公安局', '支队一', '吕明', null, '18945600917', 'A1000012B7BB5A', '230602197202283839', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1352, '大庆市公安局', '支队一', '陈宝成', null, '18945600918', 'A1000012B76B3F', '230605197510261016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1353, '大庆市公安局', '支队一', '崔家宏', null, '18945600919', 'A1000012B7A565', '230602195602270413', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1354, '大庆市公安局', '支队一', '李显刚', null, '18945600920', 'A1000012B82F92', '230605196509191634', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1355, '大庆市公安局', '支队一', '綦宝龙', null, '18945600923', 'A1000012B7B835', '23060219750504021X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1356, '大庆市公安局', '支队一', '王士军', null, '18945600926', 'A1000012B78CA9', '230604196302012612', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1357, '大庆市公安局', '支队一', '王洪勤', null, '18945600927', 'A1000012B7591B', '230602196503281218', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1358, '大庆市公安局', '支队一', '于松波', null, '18945600928', 'A1000012B7594E', '230605196409190036', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1359, '大庆市公安局', '支队一', '田雨江', null, '18945600929', 'A1000012B7D504', '230602195503102211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1360, '大庆市公安局', '支队一', '董伟', null, '18945600930', 'A1000012B7D58B', '230605196602200814', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1361, '大庆市公安局', '支队一', '何兰泰', null, '18945600933', 'A1000012B7D4D3', '230605197505101413', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1362, '大庆市公安局', '支队一', '曲成忠', null, '18945600935', 'A1000012B7D59B', '230605195209032012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1363, '大庆市公安局', '支队一', '张柏林', null, '18945600936', 'A1000012B7D52F', '230602196210213430', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1364, '大庆市公安局', '支队一', '姜青山', null, '18945600937', 'A1000012B7D57E', '230602195507153817', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1365, '大庆市公安局', '支队一', '赵伟', null, '18945600938', 'A1000012B7D536', '23060219671030286X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1366, '大庆市公安局', '支队一', '贾丽珩', null, '18945600939', 'A1000012B7D4FC', '230602197712292129', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1367, '大庆市公安局', '支队一', '李国良', null, '18945600945', 'A1000012B7D58E', '230604196703111611', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1368, '大庆市公安局', '支队一', '夏江平', null, '18945600948', 'A1000012B7D589', '230602196207183410', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1369, '大庆市公安局', '支队一', '张宝文', null, '18945600950', 'A1000012B82211', '230605196206080013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1370, '大庆市公安局', '支队一', '朱福乾', null, '18945600955', 'A1000012B82236', '230605196505011210', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1371, '大庆市公安局', '支队一', '刘文喜', null, '18945600956', 'A1000012B82224', '230603196405230712', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1372, '大庆市公安局', '支队一', '宋学平', null, '18945600957', 'A1000012B82257', '230602196202174419', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1373, '大庆市公安局', '支队一', '宁英军', null, '18945600958', 'A1000012B82251', '230602197404134057', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1374, '大庆市公安局', '支队一', '宋玉军', null, '18945600959', 'A1000012B8224F', '230605196405101251', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1375, '大庆市公安局', '支队一', '刘海波', null, '18945600962', 'A1000012B8223E', '230604197406065115', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1376, '大庆市公安局', '支队一', '艾福铁', null, '18945600963', 'A1000012B82219', '230604196810161411', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1377, '大庆市公安局', '支队一', '白光明', null, '18945600965', 'A1000012B82248', '230604196501102418', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1378, '大庆市公安局', '支队一', '姜国涛', null, '18945600966', 'A1000012B82233', '230602196508102338', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1379, '大庆市公安局', '支队一', '张健', null, '18945600967', 'A1000012B81604', '230602197803302855', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1380, '大庆市公安局', '支队一', '张安', null, '18945600968', 'A1000012B81544', '230602196211133010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1381, '大庆市公安局', '支队一', '王占臣', null, '18945600969', 'A1000012B81620', '230606196312070712', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1382, '大庆市公安局', '支队一', '孟庆松', null, '18945600975', 'A1000012B831BD', '230604197201270035', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1383, '大庆市公安局', '支队一', '侯松涛', null, '18945600976', 'A1000012B8163C', '230602197009013837', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1384, '大庆市公安局', '支队一', '冷占军', null, '18945600977', 'A1000012B81616', '230602196208243016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1385, '大庆市公安局', '支队一', '栾俊杰', null, '18945600978', 'A1000012B81617', '230602196907133211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1386, '大庆市公安局', '支队一', '杨峰', null, '18945600979', 'A1000012B815DD', '231021741010361', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1387, '大庆市公安局', '支队一', '何彦民', null, '18945600980', 'A1000012B81608', '230602195903202510', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1388, '大庆市公安局', '支队一', '刘国富', null, '18945601001', 'A1000012B8162E', '230602196211101932', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1389, '大庆市公安局', '支队一', '何敏怀', null, '18945601002', 'A1000012B7C443', '230605196310010234', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1390, '大庆市公安局', '支队一', '左玉成', null, '18945601003', 'A1000012B7C431', '230602196402191918', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1391, '大庆市公安局', '支队一', '尚德芳', null, '18945601005', 'A1000012B7C33D', '230602196110153821', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1392, '大庆市公安局', '支队一', '蔡贵锋', null, '18945601006', 'A1000012B7C418', '230602197201202515', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1393, '大庆市公安局', '支队一', '卢杰', null, '18945601007', 'A1000012B7C3D8', '230602196308040427', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1394, '大庆市公安局', '支队一', '孙晶', null, '18945601008', 'A1000012B7C433', '230603197306190561', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1395, '大庆市公安局', '支队一', '李琳琳', null, '18945601009', 'A1000012B7C404', '230605198206290220', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1396, '大庆市公安局', '支队一', '刘志礼', null, '18945601010', 'A1000012B7C428', '230602195708020033', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1397, '大庆市公安局', '支队一', '张宇', null, '18945601011', 'A1000012B7C471', '230605197702112218', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1398, '大庆市公安局', '支队一', '于永玲', null, '18945601015', 'A1000012B7C3DF', '23060419661021008X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1399, '大庆市公安局', '支队一', '胡廷和', null, '18945601016', 'A1000012B7B1EE', '230602196104221912', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1400, '大庆市公安局', '支队一', '谷丹红', null, '18945601017', 'A1000012B78CD4', '230602197504203240', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1401, '大庆市公安局', '支队一', '孙雷', null, '18945601018', 'A1000012B7BA6A', '230602198103100616', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1402, '大庆市公安局', '支队一', '姜楠', null, '18945601019', 'A1000012B78CB6', '230604198004235147', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1403, '大庆市公安局', '支队一', '陈凌巍', null, '18945601020', 'A1000012B79D71', '230602197306035151', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1404, '大庆市公安局', '支队一', '李华东', null, '18945601023', 'A1000012B7B60C', '220102197111113392', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1405, '大庆市公安局', '支队一', '郑晓玉', null, '18945601024', 'A1000012B758D2', '230602196608031944', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1406, '大庆市公安局', '支队一', '李晓天', null, '18945601026', 'A1000012B7B7CD', '230602197610102128', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1407, '大庆市公安局', '支队一', '谢方贵', null, '18945601027', 'A1000012B7589C', '230902197010160312', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1408, '大庆市公安局', '支队一', '赵群', null, '18945601028', 'A1000012B78C51', '230602197610172126', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1409, '大庆市公安局', '支队一', '赵安龙', null, '18945601029', 'A1000012B7D8FB', '230602196608035611', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1410, '大庆市公安局', '支队一', '王元莉', null, '18945601030', 'A1000012B7D83E', '420400197010203824', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1411, '大庆市公安局', '支队一', '石兆霞', null, '18945601034', 'A1000012B7D96F', '230602195901143828', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1412, '大庆市公安局', '支队一', '陈彦彬', null, '18945601035', 'A1000012B7D9A2', '230602197011135737', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1413, '大庆市公安局', '支队一', '高长林', null, '18945601036', 'A1000012B7D80F', '230602195405053831', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1414, '大庆市公安局', '支队一', '胡宏伟', null, '18945601037', 'A1000012B7D8F1', '230603196501031318', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1415, '大庆市公安局', '支队一', '杨福', null, '18945601038', 'A1000012B7D884', '230602196406010213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1416, '大庆市公安局', '支队一', '刘彦平', null, '18945601039', 'A1000012B7DA00', '230602196606142122', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1417, '大庆市公安局', '支队一', '李恺', null, '18945601040', 'A1000012B7D9FE', '230602197811070628', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1418, '大庆市公安局', '支队一', '吴国栋', null, '18945601046', 'A1000012B7D91C', '230602198003242158', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1419, '大庆市公安局', '支队一', '王淑梅', null, '18945601048', 'A1000012B7DD77', '230229196812080020', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1420, '大庆市公安局', '支队一', '姜喜泉', null, '18945601049', 'A1000012B7F7CF', '230602195505051219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1421, '大庆市公安局', '支队一', '王忠池', null, '18945601050', 'A1000012B7F7C3', '230602196010303810', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1422, '大庆市公安局', '支队一', '范宗瑞', null, '18945601051', 'A1000012B7F7F4', '230602197906237128', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1423, '大庆市公安局', '支队一', '刘亚丽', null, '18945601055', 'A1000012B7F7D9', '232301197905120824', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1424, '大庆市公安局', '支队一', '盖艳天', null, '18945601056', 'A1000012B7DE0F', '230602196710032118', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1425, '大庆市公安局', '支队一', '黄久萍', null, '18945601057', 'A1000012B7F7B1', '230602196305071922', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1426, '大庆市公安局', '支队一', '高海涛', null, '18945601058', 'A1000012B7FDBB', '23060219580102192X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1427, '大庆市公安局', '支队一', '王敏', null, '18945601059', 'A1000012B7F7EE', '23060219621226192X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1428, '大庆市公安局', '支队一', '于鹤玲', null, '18945601060', 'A1000012B7F7A4', '230602196301201523', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1429, '大庆市公安局', '支队一', '张志民', null, '18945601061', 'A1000012B7F710', '230602196409242116', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1430, '大庆市公安局', '支队一', '周海鹰', null, '18945601062', 'A1000012B7FDB0', '230602196209012113', '0', '0', null, null);
commit;
prompt 301 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1431, '大庆市公安局', '支队一', '于兆祥', null, '18945601065', 'A1000012B7FDAD', '23060219661129215x', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1432, '大庆市公安局', '支队一', '卢国喜', null, '18945601066', 'A1000012B7F73A', '230603197608114011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1433, '大庆市公安局', '支队一', '王继常', null, '18945601068', 'A1000012B7F75E', '230602197011303016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1434, '大庆市公安局', '支队一', '冯勇', null, '18945601069', 'A1000012B7F747', '230605197402121016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1435, '大庆市公安局', '支队一', '王津江', null, '18945601070', 'A1000012B7F767', '230602197211070018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1436, '大庆市公安局', '支队一', '郭景明', null, '18945601071', 'A1000012B7FDB7', '23060219630630381X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1437, '大庆市公安局', '支队一', '刘彦飞', null, '18945601075', 'A1000012B7F76B', '34212319750705537X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1438, '大庆市公安局', '支队一', '李彦茹', null, '18945601077', 'A1000012B7F67F', '230602196507253820', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1439, '大庆市公安局', '支队一', '王继辉', null, '18945601078', 'A1000012B83026', '220125197403074211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1440, '大庆市公安局', '支队一', '孟凡彬', null, '18945601079', 'A1000012B81D3C', '230604197409084717', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1441, '大庆市公安局', '支队一', '谢刚', null, '18945601080', 'A1000012B81E75', '210114198001201939', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1442, '大庆市公安局', '支队一', '吴述', null, '18945601081', 'A1000012B81C9F', '230605197506110223', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1443, '大庆市公安局', '支队一', '朱静波', null, '18945601083', 'A1000012B82071', '230602196406122119', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1444, '大庆市公安局', '支队一', '代宏亮', null, '18945601085', 'A1000012B8250B', '230605197109171030', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1445, '大庆市公安局', '支队一', '董志刚', null, '18945601086', 'A1000012B820E5', '230828197712276211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1446, '大庆市公安局', '支队一', '杨剑宇', null, '18945601087', 'A1000012B81E81', '110102197504262334', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1447, '大庆市公安局', '支队一', '何兵', null, '18945601088', 'A1000012B81EB6', '23060219690208211X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1448, '大庆市公安局', '支队一', '杨枫', null, '18945601089', 'A1000012B82079', '230602197508062123', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1449, '大庆市公安局', '支队一', '王京铎', null, '18945601090', 'A1000012B81C86', '370625197306181533', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1450, '大庆市公安局', '支队一', '李君', null, '18945601091', 'A1000012B7F7BE', '230602197305300232', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1451, '大庆市公安局', '支队一', '郭景利', null, '18945601092', 'A1000012B7F7BB', '230602195307030011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1452, '大庆市公安局', '支队一', '杨忠军', null, '18945601095', 'A1000012B7F796', '230602196805041930', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1453, '大庆市公安局', '支队一', '霍新利', null, '18945601096', 'A1000012B7F81F', '230605195309151211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1454, '大庆市公安局', '支队一', '姜鸿萍', null, '18945601097', 'A1000012B7F7E9', '230602197110281924', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1455, '大庆市公安局', '支队一', '孙兆林', null, '18945601098', 'A1000012B7F7BA', '230602195801033832', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1456, '大庆市公安局', '支队一', '孙春风', null, '18945601099', 'A1000012B7F7E5', '230602196907273812', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1457, '大庆市公安局', '支队一', '侯丽梅', null, '18945601100', 'A1000012B7F7E0', '230602196310242124', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1209, '大庆市公安局', '支队一', '王静波', null, '18945600656', 'A1000012B831AB', '230602196707124417', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1210, '大庆市公安局', '支队一', '张宝哲', null, '18945600657', 'A1000012B830A0', '230602196508144415', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1211, '大庆市公安局', '支队一', '宋伟', null, '18945600658', 'A1000012B815E2', '230602197212180040', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1212, '大庆市公安局', '支队一', '卢启鑫', null, '18945600660', 'A1000012B831C2', '230226197312200212', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1213, '大庆市公安局', '支队一', '杨鹏', null, '18945600661', 'A1000012B815D4', '230103197810014615', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1214, '大庆市公安局', '支队一', '闫军勤', null, '18945600663', 'A1000012B815EA', '230602197010020612', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1215, '大庆市公安局', '支队一', '卢东飞', null, '18945600665', 'A1000012B7C9A3', '230104197512153410', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1216, '大庆市公安局', '支队一', '陈景山', null, '18945600667', 'A1000012B7C997', '230602197607222110', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1217, '大庆市公安局', '支队一', '鞠明刚', null, '18945600668', 'A1000012B7C84A', '230605197012010214', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1218, '大庆市公安局', '支队一', '周丽艳', null, '18945600669', 'A1000012B7C97A', '230606197509210242', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1219, '大庆市公安局', '支队一', '刘士权', null, '18945600670', 'A1000012B7C940', '23060319791208091X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1220, '大庆市公安局', '支队一', '罗汉文', null, '18945600671', 'A1000012B7C89A', '230604197004266213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1221, '大庆市公安局', '支队一', '郭宇', null, '18945600673', 'A1000012B7C996', '230603197908012519', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1222, '大庆市公安局', '支队一', '刘志刚', null, '18945600676', 'A1000012B7C8D4', '230602197306056219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1223, '大庆市公安局', '支队一', '孙海涛', null, '18945600677', 'A1000012B7C8D0', '21010519730624535X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1224, '大庆市公安局', '支队一', '王炳臣', null, '18945600678', 'A1000012B7C86C', '230602196105180411', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1225, '大庆市公安局', '支队一', '杨宪芝', null, '18945600680', 'A1000012B82CB0', '230603196302140087', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1226, '大庆市公安局', '支队一', '吴丹', null, '18945600681', 'A1000012B82C98', '230602197203200425', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1227, '大庆市公安局', '支队一', '张玉萍', null, '18945600682', 'A1000012B82CAA', '230226195805230023', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1228, '大庆市公安局', '支队一', '周建洪', null, '18945600685', 'A1000012B82C88', '230602196810227115', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1229, '大庆市公安局', '支队一', '董生才', null, '18945600686', 'A1000012B82CC0', '23060319740901021X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1230, '大庆市公安局', '支队一', '陈净', null, '18945600687', 'A1000012B82C95', '23060419771004444X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1231, '大庆市公安局', '支队一', '侯庆峰', null, '18945600688', 'A1000012B82CAB', '230604197903223014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1232, '大庆市公安局', '支队一', '高翔', null, '18945600689', 'A1000012B82CB1', '23060219770525516X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1233, '大庆市公安局', '支队一', '杨俊', null, '18945600690', 'A1000012B82CA0', '230602197412044019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1234, '大庆市公安局', '支队一', '张忠义', null, '18945600691', 'A1000012B82C7A', '23060219591202041X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1235, '大庆市公安局', '支队一', '王春志', null, '18945600692', 'A1000012B82292', '230602196104126237', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1236, '大庆市公安局', '支队一', '卢炳友', null, '18945600693', 'A1000012B822BE', '230602195903313819', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1237, '大庆市公安局', '支队一', '张振友', null, '18945600695', 'A1000012B82288', '230606195709220016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1238, '大庆市公安局', '支队一', '王永权', null, '18945600696', 'A1000012B82230', '230121197306242013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1239, '大庆市公安局', '支队一', '孙波', null, '18945600698', 'A1000012B8224C', '230602196604260416', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1240, '大庆市公安局', '支队一', '关伟', null, '18945600700', 'A1000012B82266', '230602197505161353', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1241, '大庆市公安局', '支队一', '宗瑞生', null, '18945600246', 'A1000012B82232', '230602197608083212', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1242, '大庆市公安局', '支队一', '王天华', null, '18945600701', 'A1000012B8225B', '210105197005225312', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1243, '大庆市公安局', '支队一', '孙景海', null, '18945600702', 'A1000012B82249', '23060519670602021X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1244, '大庆市公安局', '支队一', '贾士友', null, '18945600703', 'A1000012B8228C', '230604196706200214', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1245, '大庆市公安局', '支队一', '闻东贵', null, '18945600705', 'A1000012B7D202', '230602196511110056', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1246, '大庆市公安局', '支队一', '王岩', null, '18945600706', 'A1000012B7D0F2', '230624196210040056', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1247, '大庆市公安局', '支队一', '王蕊', null, '18945600707', 'A1000012B7D101', '230605198205070226', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1248, '大庆市公安局', '支队一', '艾绍新', null, '18945600708', 'A1000012B7D16F', '23060219801226173X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1249, '大庆市公安局', '支队一', '齐兴福', null, '18945600709', 'A1000012B7D170', '230602196503141012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1250, '大庆市公安局', '支队一', '郭凤军', null, '18945600710', 'A1000012B7D1F8', '230602196812130210', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1251, '大庆市公安局', '支队一', '于晓涛', null, '18945600711', 'A1000012B7D203', '230602197903081711', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1252, '大庆市公安局', '支队一', '郑国民', null, '18945600712', 'A1000012B7D173', '230602196807163413', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1253, '大庆市公安局', '支队一', '刘延秋', null, '18945600715', 'A1000012B7D1DB', '230602197209024418', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1254, '大庆市公安局', '支队一', '李喜柱', null, '18945600716', 'A1000012B7D1FC', '230228197711211413', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1255, '大庆市公安局', '支队一', '王宝军', null, '18945600717', 'A1000012B79D60', '230603197001302331', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1256, '大庆市公安局', '支队一', '孙衍良', null, '18945600718', 'A1000012B76B1E', '230602197403024016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1257, '大庆市公安局', '支队一', '郭晓虎', null, '18945600719', 'A1000012B7B593', '23060219790614591X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1258, '大庆市公安局', '支队一', '邹广发', null, '18945600720', 'A1000012B763A0', '140102196906292334', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1259, '大庆市公安局', '支队一', '高伟', null, '18945600721', 'A1000012B7B382', '210102197205171815', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1260, '大庆市公安局', '支队一', '王蕴丽', null, '18945600722', 'A1000012B7B28B', '230602197901236222', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1261, '大庆市公安局', '支队一', '张荣华', null, '18945600726', 'A1000012B75BB7', '230602197203183848', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1262, '大庆市公安局', '支队一', '郑兵', null, '18945600727', 'A1000012B758F3', '230226196908070071', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1263, '大庆市公安局', '支队一', '金玉海', null, '18945600728', 'A1000012B75D58', '230602196501240017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1264, '大庆市公安局', '支队一', '王文军', null, '18945600730', 'A1000012B7B3D6', '23060219580830501X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1265, '大庆市公安局', '支队一', '韩松', null, '18945600731', 'A1000012B7DDB1', '230605196507050010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1266, '大庆市公安局', '支队一', '姜忠姣', null, '18945600733', 'A1000012B7F81A', '23060219740514752X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1267, '大庆市公安局', '支队一', '魏福军', null, '18945600736', 'A1000012B7F810', '230206197512282210', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1268, '大庆市公安局', '支队一', '王春飚', null, '18945600737', 'A1000012B7F844', '230602197004194018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1269, '大庆市公安局', '支队一', '陈先华', null, '18945600739', 'A1000012B7BF05', '230321197207156217', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1270, '大庆市公安局', '支队一', '贾茹', null, '18945600750', 'A1000012B7F840', '230604198208294720', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1271, '大庆市公安局', '支队一', '于军', null, '18945600036', 'A1000012B7C2F9', '231025197109020017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1272, '大庆市公安局', '支队一', '马铁军', null, '18945600400', 'A1000012B7C2F3', '230602196806294411', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1273, '大庆市公安局', '支队一', '张立范', null, '18945600801', 'A1000012B7C2FB', '230602196001030419', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1274, '大庆市公安局', '支队一', '张纯军', null, '18945600803', 'A1000012B7C2A8', '230602196208014213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1275, '大庆市公安局', '支队一', '王辉', null, '18945600805', 'A1000012B7F824', '230605197711112818', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1276, '大庆市公安局', '支队一', '柏春奎', null, '18945600806', 'A1000012B7F7AD', '230606197110085013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1277, '大庆市公安局', '支队一', '张辉', null, '18945600807', 'A1000012B7F857', '230602197503102886', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1278, '大庆市公安局', '支队一', '熊吉华', null, '18945600809', 'A1000012B7F867', '23060219740429515x', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1279, '大庆市公安局', '支队一', '韩颖', null, '18945600810', 'A1000012B7F849', '230602196305210021', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1280, '大庆市公安局', '支队一', '张喜民', null, '18945600811', 'A1000012B7C2B5', '230604196208160010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1281, '大庆市公安局', '支队一', '王长海', null, '18945600813', 'A1000012B7C2BF', '230602195101263012', '0', '0', null, null);
commit;
prompt 401 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1282, '大庆市公安局', '支队一', '陈彦明', null, '18945600815', 'A1000012B7C2D6', '230605196710041419', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1283, '大庆市公安局', '支队一', '杜利峰', null, '18945600816', 'A1000012B7C0A0', '230605197511211459', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1284, '大庆市公安局', '支队一', '陈必和', null, '18945600817', 'A1000012B7C2A7', '230602195406230019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1285, '大庆市公安局', '支队一', '陈欣', null, '18945600818', 'A1000012B82FEB', '230602197906262147', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1286, '大庆市公安局', '支队一', '李航', null, '18945600819', 'A1000012B815FC', '230203197406122310', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1287, '大庆市公安局', '支队一', '张玉波', null, '18945600820', 'A1000012B8161C', '23060219630904303X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1288, '大庆市公安局', '支队一', '王延峰', null, '18945600821', 'A1000012B82CAC', '230602197004165014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1289, '大庆市公安局', '支队一', '朱家居', null, '18945600822', 'A1000012B82C8F', '230604196409052614', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1290, '大庆市公安局', '支队一', '刘兆龙', null, '18945600825', 'A1000012B82C67', '232700197008130016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1291, '大庆市公安局', '支队一', '马长福', null, '18945600828', 'A1000012B82CBC', '230605196405170812', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (196, '大庆公安局铁人分局', '铁人分局', '吕晓平', null, '18945601655', 'A1000012B7BA7F', '230602196012020013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (197, '大庆公安局铁人分局', '铁人分局', '丁玉山', null, '18945601657', 'A1000012B78B91', '230602196703030819', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (198, '大庆公安局铁人分局', '铁人分局', '于跃申', null, '18945601658', 'A1000012B7C420', '230602196404280017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (199, '大庆公安局铁人分局', '铁人分局', '付彦东', null, '18945601660', 'A1000012B7C449', '230602197012082315', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (200, '大庆公安局铁人分局', '铁人分局', '邹德明', null, '18945601661', 'A1000012B7BDE3', '230604196907270614', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (201, '大庆公安局铁人分局', '铁人分局', '董敏华', null, '18945601662', 'A1000012B7D318', '23060219640511001X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (202, '大庆公安局铁人分局', '铁人分局', '李怀金', null, '18945601663', 'A1000012B7D2E9', '230602195902025313', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (203, '大庆公安局铁人分局', '铁人分局', '潘春晖', null, '18945601665', 'A1000012B7D2C5', '232301197511154618', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (204, '大庆公安局铁人分局', '铁人分局', '苏志平', null, '18945601667', 'A1000012B7D30B', '230602196803303618', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (205, '大庆公安局铁人分局', '铁人分局', '张福龙', null, '18945601668', 'A1000012B7D2F6', '23062419811211281X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (206, '大庆公安局铁人分局', '铁人分局', '任利', null, '18945601669', 'A1000012B7D2D9', '23060619731228175X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (207, '大庆公安局铁人分局', '铁人分局', '王立晨', null, '18945601670', 'A1000012B7C42B', '230602196805121973', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (208, '大庆公安局铁人分局', '铁人分局', '王思辽', null, '18945601671', 'A1000012B7D2D3', '230602196505103415', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (209, '大庆公安局铁人分局', '铁人分局', '张矿生', null, '18945601675', 'A1000012B7D31F', '23060219581117003X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (210, '大庆公安局铁人分局', '铁人分局', '付金生', null, '18945601676', 'A1000012B7D2D1', '230602196106267519', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (211, '大庆公安局铁人分局', '铁人分局', '高忠昌', null, '18945601677', 'A1000012B7C3D0', '230606197002034876', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (212, '大庆公安局铁人分局', '铁人分局', '王实央', null, '18945601678', 'A1000012B80155', '230602196607251910', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (213, '大庆公安局铁人分局', '铁人分局', '郭祥娇', null, '18945601679', 'A1000012B82B6D', '230603197403200223', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (214, '大庆公安局铁人分局', '铁人分局', '杨裕涛', null, '18945601680', 'A1000012B829E4', '230602197409280619', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (215, '大庆公安局铁人分局', '铁人分局', '孙保国', null, '18945601681', 'A1000012B7C441', '23060219710721101X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (216, '大庆公安局铁人分局', '铁人分局', '崔富', null, '18945601682', 'A1000012B829C3', '230602195910255311', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (217, '大庆公安局铁人分局', '铁人分局', '郭友军', null, '18945601683', 'A1000012B7C40C', '230604195804080012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (218, '大庆公安局铁人分局', '铁人分局', '武建新', null, '18945601685', 'A1000012B7C3F4', '230602195808183817', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (219, '大庆公安局铁人分局', '铁人分局', '马宝文', null, '18945601686', 'A1000012B7D317', '230602196210040015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (220, '大庆公安局铁人分局', '铁人分局', '李义军', null, '18945601688', 'A1000012B7C430', '230602196703051011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (221, '大庆公安局铁人分局', '铁人分局', '孙杰', null, '18945601689', 'A1000012B7C3D3', '230602196212250614', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (222, '大庆公安局铁人分局', '铁人分局', '高永春', null, '18945601690', 'A1000012B7C3F3', '230606196812180010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (223, '大庆公安局铁人分局', '铁人分局', '李冰', null, '18945601691', 'A1000012B82952', '230602196707231925', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (224, '大庆公安局铁人分局', '铁人分局', '姚洪涛', null, '18945601693', 'A1000012B829EB', '230602197008271711', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (225, '大庆公安局铁人分局', '铁人分局', '温良友', null, '18945601695', 'A1000012B7C3F9', '230602196610271912', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (226, '大庆公安局铁人分局', '铁人分局', '周立涛', null, '18945601696', 'A1000012B7C413', '230602197012153056', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (227, '大庆公安局铁人分局', '铁人分局', '李兆麒', null, '18945601697', 'A1000012B829DC', '34010419710120205X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (228, '大庆公安局铁人分局', '铁人分局', '于海洋', null, '18945601698', 'A1000012B8297C', '230602197911162132', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (229, '大庆公安局铁人分局', '铁人分局', '程伟', null, '18945601699', 'A1000012B829C1', '230602197512263219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (230, '大庆公安局铁人分局', '铁人分局', '梁晨利', null, '18945601700', 'A1000012B82A41', '230604196005020018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (231, '大庆公安局铁人分局', '铁人分局', '乔华', null, '18945601701', 'A1000012B82FA1', '230603197108010013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (232, '大庆公安局铁人分局', '铁人分局', '车通', null, '18945601702', 'A1000012B82F23', '230605197305200716', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (233, '大庆公安局铁人分局', '铁人分局', '郭宏', null, '18945601703', 'A1000012B825AA', '230602196308120814', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (234, '大庆公安局铁人分局', '铁人分局', '于华锋', null, '18945601706', 'A1000012B82F2B', '230602196007213013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (235, '大庆公安局铁人分局', '铁人分局', '张建国', null, '18945601707', 'A1000012B82F8D', '230602196110260037', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (236, '大庆公安局铁人分局', '铁人分局', '丁学军', null, '18945601709', 'A1000012B82973', '230602197508014420', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (237, '大庆公安局铁人分局', '铁人分局', '田昌秋', null, '18945601710', 'A1000012B824D5', '230602197103091735', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (238, '大庆公安局铁人分局', '铁人分局', '袁大升', null, '18945601711', 'A1000012B829B3', '23060219650518151X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (239, '大庆公安局铁人分局', '铁人分局', '刘相军', null, '18945601712', 'A1000012B829D1', '230602197212170037', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (240, '大庆公安局铁人分局', '铁人分局', '王广文', null, '18945601716', 'A1000012B7E9CE', '230602197112111718', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (241, '大庆公安局铁人分局', '铁人分局', '田野', null, '18945601717', 'A1000012B7EB0C', '230604197111272416', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (242, '大庆公安局铁人分局', '铁人分局', '高富', null, '18945601718', 'A1000012B82F1F', '230602196306132715', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (243, '大庆公安局铁人分局', '铁人分局', '申宝', null, '18945601719', 'A1000012B7E37B', '230602196206082714', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (244, '大庆公安局铁人分局', '铁人分局', '崔国立', null, '18945601721', 'A1000012B7EADF', '230602197901252150', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (245, '大庆公安局铁人分局', '铁人分局', '关歆', null, '18945601725', 'A1000012B7EB56', '230602197305103634', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (246, '大庆公安局铁人分局', '铁人分局', '佟天明', null, '18945601726', 'A1000012B82816', '230602197311242534', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (247, '大庆公安局铁人分局', '铁人分局', '吕殿民', null, '18945601727', 'A1000012B7EA4C', '230602197403192116', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (248, '大庆公安局铁人分局', '铁人分局', '张吉庆', null, '18945601728', 'A1000012B7EAE2', '230605197010180834', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (249, '大庆公安局铁人分局', '铁人分局', '李维民', null, '18945601729', 'A1000012B82F42', '230602196111260610', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (250, '大庆公安局公交分局', '公交分局', '艾文山', null, '18945600061', 'A1000012B829A6', '23060419630804181X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (251, '大庆公安局公交分局', '公交分局', '金树臣', null, '18945602801', 'A1000012B7D2D2', '230605195708110011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (252, '大庆公安局公交分局', '公交分局', '王宏伟', null, '18945602802', 'A1000012B7D316', '230602196707211916', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (253, '大庆公安局公交分局', '公交分局', '李宏宇', null, '18945602803', 'A1000012B829D3', '230604196311220413', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (254, '大庆公安局公交分局', '公交分局', '孙会君', null, '18945602805', 'A1000012B7D2FE', '230603196411131139', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (255, '大庆公安局公交分局', '公交分局', '常兴球', null, '18945602806', 'A1000012B82F5F', '230604196109030018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (256, '大庆公安局公交分局', '公交分局', '孙成伟', null, '18945602807', 'A1000012B824A4', '230602197312154018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (257, '大庆公安局公交分局', '公交分局', '李琨', null, '18945602808', 'A1000012B7E2E7', '230602196312245919', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (258, '大庆公安局公交分局', '公交分局', '杨云刚', null, '18945602809', 'A1000012B7C440', '230606196207290019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (259, '大庆公安局公交分局', '公交分局', '马学伟', null, '18945602810', 'A1000012B82820', '231121198107241910', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (260, '大庆公安局公交分局', '公交分局', '张金华', null, '18945602811', 'A1000012B829B0', '230604198211262623', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (261, '大庆公安局公交分局', '公交分局', '姚丽霞', null, '18945602812', 'A1000012B82565', '230103197904034625', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (262, '大庆公安局公交分局', '公交分局', '魏祎', null, '18945602815', 'A1000012B7D3F3', '230602197306213229', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (263, '大庆公安局公交分局', '公交分局', '韩玉红', null, '18945602816', 'A1000012B7D2DC', '230602196812091960', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (264, '大庆公安局公交分局', '公交分局', '王烁', null, '18945602817', 'A1000012B7D2C4', '23010319760710464X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (265, '大庆公安局公交分局', '公交分局', '朱艳红', null, '18945602818', 'A1000012B82F8F', '230602197704055721', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (266, '大庆公安局公交分局', '公交分局', '王相瑞', null, '18945602819', 'A1000012B829AE', '230602196004020013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (267, '大庆公安局公交分局', '公交分局', '杨文军', null, '18945602820', 'A1000012B7D325', '230602196001110419', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (268, '大庆公安局公交分局', '公交分局', '陈惠谦', null, '18945602821', 'A1000012B829B4', '230602195608015915', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (269, '大庆公安局公交分局', '公交分局', '高长春', null, '18945602822', 'A1000012B82971', '230602196201153413', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (270, '大庆公安局公交分局', '公交分局', '李会国', null, '18945602825', 'A1000012B7D13C', '23060219600401043X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (271, '大庆公安局公交分局', '公交分局', '胡金宝', null, '18945602826', 'A1000012B82841', '230602197707014415', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (272, '大庆公安局公交分局', '公交分局', '王玉涛', null, '18945602827', 'A1000012B829B8', '230603198211150211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (273, '大庆公安局公交分局', '公交分局', '赵彦千', null, '18945602828', 'A1000012B7D14C', '230602196609091957', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (274, '大庆公安局公交分局', '公交分局', '张伟明', null, '18945602829', 'A1000012B7D147', '23060219601121385', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (275, '大庆公安局公交分局', '公交分局', '何玉坚', null, '18945602830', 'A1000012B7CF95', '230602197901203615', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (276, '大庆公安局公交分局', '公交分局', '牟凯', null, '18945602831', 'A1000012B7D2EA', '230603197807203711', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (277, '大庆公安局公交分局', '公交分局', '钟微', null, '18945602832', 'A1000012B7D13D', '23060319810724092X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (278, '大庆公安局公交分局', '公交分局', '王野', null, '18945602833', 'A1000012B7B645', '230602197510204012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (279, '大庆公安局公交分局', '公交分局', '王宇', null, '18945602835', 'A1000012B829C7', '230602197703013212', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (280, '大庆公安局公交分局', '公交分局', '丛生', null, '18945602837', 'A1000012B7D141', '23060619811217281X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (281, '大庆公安局公交分局', '公交分局', '陈立辉', null, '18945602838', 'A1000012B7B676', '230623198203290017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (282, '大庆公安局公交分局', '公交分局', '曹纪', null, '18945602839', 'A1000012B7B2E5', '230602197809292117', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (283, '大庆公安局公交分局', '公交分局', '吕成平', null, '18945602850', 'A1000012B7D13E', '230602196007250412', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (284, '大庆公安局公交分局', '公交分局', '闫伟', null, '18945602851', 'A1000012B7D008', '23060219811020101X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (285, '大庆公安局公交分局', '公交分局', '孙庆龙', null, '18945602852', 'A1000012B829DE', '230603198112301379', '0', '0', null, null);
commit;
prompt 501 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (286, '大庆公安局公交分局', '公交分局', '刘伟亮', null, '18945602853', 'A1000012B7CFAC', '230603198206072511', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (287, '大庆公安局公交分局', '公交分局', '满佳音', null, '18945602855', 'A1000012B7D14B', '230603198111132526', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (288, '大庆公安局公交分局', '公交分局', '王立辉', null, '18945602856', 'A1000012B7CFB0', '230606197804010235', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (289, '大庆公安局公交分局', '公交分局', '赵海峰', null, '18945602857', 'A1000012B7D05C', '230603198205270217', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (290, '大庆公安局公交分局', '公交分局', '赵金录', null, '18945602858', 'A1000012B7D143', '230605196402032019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (291, '大庆公安局公交分局', '公交分局', '盛佳', null, '18945602860', 'A1000012B7CF69', '230604198204274714', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (292, '大庆公安局公交分局', '公交分局', '车仁丰', null, '18945602861', 'A1000012B7B6B8', '230602197604184016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (293, '大庆公安局公交分局', '公交分局', '沈恩武', null, '18945602862', 'A1000012B7CFA5', '230602196502265910', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (294, '大庆公安局公交分局', '公交分局', '刘钟岳', null, '18945602863', 'A1000012B82661', '230602195710223817', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (295, '大庆公安局公交分局', '公交分局', '陆庆华', null, '18945602865', 'A1000012B7D059', '230602196402020019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (296, '大庆公安局公交分局', '公交分局', '黄孝春', null, '18945602866', 'A1000012B7E8E8', '230604196603302015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (297, '大庆公安局公交分局', '公交分局', '孙立军', null, '18945602867', 'A1000012B82983', '230602197010224412', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (298, '大庆公安局公交分局', '公交分局', '韩伟峰', null, '18945602868', 'A1000012B7B687', '230602196606220012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (299, '大庆公安局公交分局', '公交分局', '单士臣', null, '18945602870', 'A1000012B7EC97', '230624198206150059', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (300, '大庆公安局公交分局', '公交分局', '高玉峰', null, '18945602871', 'A1000012B7ECC8', '230603198110203732', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (301, '大庆公安局公交分局', '公交分局', '贾立杰', null, '18945602873', 'A1000012B7B388', '230602196802070015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (302, '大庆公安局公交分局', '公交分局', '遽树春', null, '18945602876', 'A1000012B7D0BC', '230621198003113953', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (303, '大庆公安局公交分局', '公交分局', '孙海超', null, '18945602877', 'A1000012B7CFB3', '230602198109266238', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (304, '大庆公安局公交分局', '公交分局', '孙延国', null, '18945602878', 'A1000012B7EC8F', '230602197508062158', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (305, '大庆公安局公交分局', '公交分局', '关伟', null, '18945602879', 'A1000012B7ECA7', '230624198108100613', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (306, '大庆公安局公交分局', '公交分局', '佟力', null, '18945602880', 'A1000012B7EABD', '23060419620720101X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (307, '大庆公安局公交分局', '公交分局', '韩彦春', null, '18945602881', 'A1000012B7E8DE', '23060319830415211X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (308, '大庆公安局公交分局', '公交分局', '杨帆', null, '18945602882', 'A1000012B7EA6A', '23230219821017101X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (309, '大庆公安局公交分局', '公交分局', '宋书利', null, '18945602883', 'A1000012B82F5B', '23060219610724671X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (310, '大庆公安局公交分局', '公交分局', '刘相林', null, '18945602885', 'A1000012B7CF99', '230602196302230019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (311, '大庆公安局公交分局', '公交分局', '佟高然', null, '18945602886', 'A1000012B7E970', '230602198004154010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (312, '大庆公安局公交分局', '公交分局', '任立铭', null, '18945602887', 'A1000012B7B705', '230604198008285117', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (313, '大庆公安局公交分局', '公交分局', '陈秀波', null, '18945602889', 'A1000012B7ECEA', '230603197812041710', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (314, '大庆公安局公交分局', '公交分局', '陈晓磊', null, '18945602890', 'A1000012B7CFA4', '230602198107305715', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (315, '大庆公安局公交分局', '公交分局', '王萌', null, '18945602891', 'A1000012B7B359', '230604198404042221', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (316, '大庆公安局公交分局', '公交分局', '曾永继', null, '18945602892', 'A1000012B7D2FA', '230603198109030926', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (317, '大庆公安局公交分局', '公交分局', '曲线', null, '18945602895', 'A1000012B7B286', '230602197711062137', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (318, '大庆公安局公交分局', '公交分局', '赵剑峰', null, '18945602896', 'A1000012B7B72D', '23082319761226043X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (319, '大庆公安局公交分局', '公交分局', '栾庆德', null, '18945602897', 'A1000012B7EACB', '230602196405100217', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (320, '大庆公安局公交分局', '公交分局', '卜凤林', null, '18945602898', 'A1000012BE240B', '230602196605234017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (321, '大庆公安局公交分局', '公交分局', '赵彬', null, '18945602899', 'A1000012B82F45', '230603198402190216', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (322, '大庆公安局公交分局', '公交分局', '邹玉峰', null, '18945602888', 'A1000012B825AB', null, '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (323, '大庆公安局大同分局', '大同分局', '林金山', null, '18945601736', 'A1000012B75975', '230603197902053715', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (324, '大庆公安局大同分局', '大同分局', '任中广', null, '18945601981', 'A1000012B75B47', '230602198106211012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (325, '大庆公安局大同分局', '大同分局', '胡静', null, '18945601982', 'A1000012B75B74', '23060619820108116X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (326, '大庆公安局大同分局', '大同分局', '王力英', null, '18945601983', 'A1000012B75BE5', '230606196503060066', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (327, '大庆公安局大同分局', '大同分局', '郑洪亮', null, '18945601986', 'A1000012B75D1A', '230606197809244014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (328, '大庆公安局大同分局', '大同分局', '张海波', null, '18945601987', 'A1000012B75D7E', '230606197210192051', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (329, '大庆公安局大同分局', '大同分局', '李世东', null, '18945601988', 'A1000012B75D86', '23060619691101021X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (330, '大庆公安局大同分局', '大同分局', '李强', null, '18945601989', 'A1000012B75DA6', '230606197509061750', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (331, '大庆公安局大同分局', '大同分局', '李宝', null, '18945601990', 'A1000012B75DBA', '230606196308080010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (332, '大庆公安局大同分局', '大同分局', '王雨龙', null, '18945601991', 'A1000012B76B17', '230606196305020012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (333, '大庆公安局大同分局', '大同分局', '史晓梅', null, '18945601992', 'A1000012B76B19', '230606196001100021', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (334, '大庆公安局大同分局', '大同分局', '庞琳琳', null, '18945601993', 'A1000012B76B27', '230606198209020222', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (335, '大庆公安局大同分局', '大同分局', '程彪', null, '18945601995', 'A1000012B76B2E', '230606196410260034', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (336, '大庆公安局大同分局', '大同分局', '宋国峰', null, '18945601997', 'A1000012B78B7E', '23060219761026213X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (337, '大庆公安局大同分局', '大同分局', '苗燕伍', null, '18945601998', 'A1000012B78B81', '230602197609192138', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (338, '大庆公安局大同分局', '大同分局', '张书峰', null, '18945602001', 'A1000012B78BA8', '230606196009010012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (339, '大庆公安局大同分局', '大同分局', '蒋思峰', null, '18945602002', 'A1000012B78C2B', '230604197409013011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (340, '大庆公安局大同分局', '大同分局', '王焕佰', null, '18945602003', 'A1000012B7B6C7', '230602196310015917', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (341, '大庆公安局大同分局', '大同分局', '刘英威', null, '18945602004', 'A1000012B7B9B1', '23060619770427521X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (342, '大庆公安局大同分局', '大同分局', '赵万仁', null, '18945602005', 'A1000012B7BD86', '230604197510100259', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (343, '大庆公安局大同分局', '大同分局', '李春芳', null, '18945602006', 'A1000012B7BEFA', '230606195803010066', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (344, '大庆公安局大同分局', '大同分局', '孙明旭', null, '18945602007', 'A1000012B7BF02', '230606196911130211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (345, '大庆公安局大同分局', '大同分局', '于佩军', null, '18945602008', 'A1000012B7C182', '230606196512080018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (346, '大庆公安局大同分局', '大同分局', '杨建国', null, '18945602009', 'A1000012B7C21A', '23230219700630073X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (347, '大庆公安局大同分局', '大同分局', '吴连昌', null, '18945602010', 'A1000012B7C230', '230606195503140010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (348, '大庆公安局大同分局', '大同分局', '姜贵仁', null, '18945602011', 'A1000012B7C26A', '230606196311011630', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (349, '大庆公安局大同分局', '大同分局', '王淑华', null, '18945602012', 'A1000012B7C26D', '230606195609170066', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (426, '大庆公安局大同分局', '大同分局', '张晓堂', null, '18945602139', 'A1000012B82B4A', '230606196908180015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (427, '大庆公安局大同分局', '大同分局', '张喜权', null, '18945602140', 'A1000012B82BB7', '230606196402010051', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (428, '大庆公安局大同分局', '大同分局', '崔金奎', null, '18945602141', 'A1000012B82BC7', '230606198103184018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (429, '大庆公安局大同分局', '大同分局', '刘新宇', null, '18945602143', 'A1000012B82BD1', '230602197703102135', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (430, '大庆公安局大同分局', '大同分局', '赵永辉', null, '18945602148', 'A1000012B82BD3', '230606197502070232', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (431, '大庆公安局大同分局', '大同分局', '张明', null, '18945602151', 'A1000012B82BF1', '230606196703021010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (432, '大庆公安局大同分局', '大同分局', '李仕文', null, '18945602152', 'A1000012B82C2E', '230606196507153833', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (433, '大庆公安局大同分局', '大同分局', '冯维', null, '18945602153', 'A1000012B82C3A', '23060619570818421X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (434, '大庆公安局大同分局', '大同分局', '李志海', null, '18945602154', 'A1000012B82C47', '23060619540620115X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (435, '大庆公安局大同分局', '大同分局', '路君', null, '18945602155', 'A1000012B82C49', '23060619641204102X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (436, '大庆公安局大同分局', '大同分局', '刘建国', null, '18945602156', 'A1000012B82C4E', '230606195704191017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (437, '大庆公安局大同分局', '大同分局', '刘井东', null, '18945602157', 'A1000012B82C50', '230606197410130218', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (438, '大庆公安局大同分局', '大同分局', '董志', null, '18945602158', 'A1000012B82C52', '23060619650211101X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (439, '大庆公安局大同分局', '大同分局', '张军', null, '18945602159', 'A1000012B82C56', '230606196504251016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (440, '大庆公安局大同分局', '大同分局', '杨广忠', null, '18945602160', 'A1000012B82C58', '230606196308250016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (441, '大庆公安局大同分局', '大同分局', '李继国', null, '18945602161', 'A1000012B82C69', '230606197312120235', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (442, '大庆公安局大同分局', '大同分局', '王锡军', null, '18945602162', 'A1000012B82C6F', '23060619681204115X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (443, '大庆公安局大同分局', '大同分局', '张卫东', null, '18945602165', 'A1000012B82C77', '230606197610150213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (444, '大庆公安局大同分局', '大同分局', '高兴', null, '18945602166', 'A1000012B82C78', '230606197306031797', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (445, '大庆公安局大同分局', '大同分局', '徐树栋', null, '18945602167', 'A1000012B82C80', '230606197502070216', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (446, '大庆公安局大同分局', '大同分局', '田秀国', null, '18945602168', 'A1000012B82C81', '230606196510290011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (447, '大庆公安局大同分局', '大同分局', '张维新', null, '18945602175', 'A1000012B82C84', '230606195410150017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (448, '大庆公安局大同分局', '大同分局', '申明祥', null, '18945602176', 'A1000012B82C90', '230606195409250715', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (449, '大庆公安局大同分局', '大同分局', '赵波', null, '18945602177', 'A1000012B82C97', '230606195603295415', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (450, '大庆公安局大同分局', '大同分局', '郑志强', null, '18945602178', 'A1000012B82C99', '230606196812112616', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (451, '大庆公安局大同分局', '大同分局', '刘亚臣', null, '18945602179', 'A1000012B82C9B', '230606196212140031', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (452, '大庆公安局大同分局', '大同分局', '宫喜彬', null, '18945602180', 'A1000012B82C9F', '230606196603200230', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (453, '大庆公安局大同分局', '大同分局', '罗洪学', null, '18945602181', 'A1000012B82CA4', '230606195202100015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (454, '大庆公安局大同分局', '大同分局', '张继财', null, '18945602185', 'A1000012B82CA5', '230606195912150033', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (455, '大庆公安局大同分局', '大同分局', '张玉生', null, '18945602186', 'A1000012B82CA6', '230606195807091756', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (456, '大庆公安局大同分局', '大同分局', '杨发', null, '18945602187', 'A1000012B82CAF', '230606195408252057', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (457, '大庆公安局大同分局', '大同分局', '吴德胜', null, '18945602188', 'A1000012B82CB8', '230606196310201619', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (458, '大庆公安局大同分局', '大同分局', '薛凤海', null, '18945602189', 'A1000012B82CC7', '230606197112252815', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (460, '大庆公安局大同分局', '大同分局', '王海军', null, '18945602191', 'A1000012B82CCD', '230606196509021316', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (461, '大庆公安局大同分局', '大同分局', '李景华', null, '18945602193', 'A1000012B82CD8', '230606195705190059', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (459, '大庆公安局大同分局', '大同分局', '陈耀国', null, '18945602190', 'A1000012B82CC9', '230606196811013413', '0', '0', null, null);
commit;
prompt 601 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (462, '大庆公安局大同分局', '大同分局', '刘凤龙', null, '18945602195', 'A1000012B82CDC', '230604196405053812', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (463, '大庆公安局大同分局', '大同分局', '孙中珍', null, '18945602196', 'A1000012B82CE0', '230606195702195022', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (464, '大庆公安局大同分局', '大同分局', '姜殿文', null, '18945602197', 'A1000012B82D57', '230606195508200019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (465, '大庆公安局大同分局', '大同分局', '丁一新', null, '18945602198', 'A1000012B82D9D', '230606195804060049', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (466, '大庆公安局大同分局', '大同分局', '刘殿政', null, '18945602199', 'A1000012B82D9F', '230606196507130017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (467, '大庆公安局大同分局', '大同分局', '杨久锋', null, '18945602200', 'A1000012B82DA2', '23060219770109213X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (468, '大庆公安局大同分局', '大同分局', '常青', null, '18945602201', 'A1000012B82DA6', '230606195704010036', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (469, '大庆公安局大同分局', '大同分局', '李德忠', null, '18945602202', 'A1000012B82DAE', '230606195804190011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (470, '大庆公安局大同分局', '大同分局', '李德才', null, '18945602203', 'A1000012B82DCA', '230606195605140011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (471, '大庆公安局大同分局', '大同分局', '贾军', null, '18945602205', 'A1000012B82DF5', '230606196002193418', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (472, '大庆公安局大同分局', '大同分局', '苏继祥', null, '18945602206', 'A1000012B82E15', '230606196411110214', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (473, '大庆公安局大同分局', '大同分局', '高庆', null, '18945602207', 'A1000012B82DCF', '230606196204220015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (474, '大庆公安局大同分局', '大同分局', '刘春来', null, '18945602208', 'A1000012B82E61', '230606198303142437', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (475, '大庆公安局大同分局', '大同分局', '程福民', null, '18945602209', 'A1000012B82E7B', '230606197209180213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (476, '大庆公安局大同分局', '大同分局', '钱玉刚', null, '18945602210', 'A1000012B82E7C', '230606195610010035', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (477, '大庆公安局大同分局', '大同分局', '刘福国', null, '18945602211', 'A1000012B82E87', '230602197510162158', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (478, '大庆公安局大同分局', '大同分局', '曹文贵', null, '18945602212', 'A1000012B82ED1', '230226197612272816', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (479, '大庆公安局大同分局', '大同分局', '杨家君', null, '18945602213', 'A1000012B82EE8', '230624197702060218', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (480, '大庆公安局大同分局', '大同分局', '栾胜祥', null, '18945602215', 'A1000012B82F48', '230605197903241817', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (481, '大庆公安局大同分局', '大同分局', '邹万金', null, '18945602216', 'A1000012B82F52', '230602197701212154', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (482, '大庆公安局大同分局', '大同分局', '陈家昌', null, '18945602217', 'A1000012B82FA2', '230606197811154018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (483, '大庆公安局大同分局', '大同分局', '侯玉刚', null, '18945602218', 'A1000012B82FD7', '230606197706045610', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (484, '大庆公安局大同分局', '大同分局', '方树林', null, '18945602219', 'A1000012B83028', '230602198003055918', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (485, '大庆公安局大同分局', '大同分局', '沙迪', null, '18945602220', 'A1000012B83029', '370211197908220018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (486, '大庆公安局大同分局', '大同分局', '姜彬', null, '18945602221', 'A1000012B8306B', '230606196509200011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (487, '大庆公安局大同分局', '大同分局', '丁国福', null, '18945602223', 'A1000012B8309C', '230604197006080017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (488, '大庆公安局大同分局', '大同分局', '张书东', null, '18945602225', 'A1000012B8309E', '230606196903120811', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (489, '大庆公安局大同分局', '大同分局', '左晓波', null, '18945602226', 'A1000012B830A2', '230606197212244839', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (490, '大庆公安局大同分局', '大同分局', '孙海权', null, '18945602227', 'A1000012B830DA', '230606197508011751', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (491, '大庆公安局大同分局', '大同分局', '彭晓波', null, '18945602228', 'A1000012B830EE', '230606197309020014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (492, '大庆公安局大同分局', '大同分局', '潘迎春', null, '18945602229', 'A1000012B830F3', '230103197905154610', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (493, '大庆公安局大同分局', '大同分局', '张廷昌', null, '18945602230', 'A1000012B8310E', '230604196407073810', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (494, '大庆公安局大同分局', '大同分局', '盖凤', null, '18945602232', 'A1000012B83110', '230606198101294045', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (495, '大庆公安局大同分局', '大同分局', '李云龙', null, '18945602233', 'A1000012B83111', '23060219790903211X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (496, '大庆公安局大同分局', '大同分局', '韩立臣', null, '18945602234', 'A1000012B83113', '230606196410032816', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (497, '大庆公安局大同分局', '大同分局', '田文刚', null, '18945602236', 'A1000012B83116', '230606197511200852', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (498, '大庆公安局大同分局', '大同分局', '胥振才', null, '18945602238', 'A1000012B8311B', '230606196304101611', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (499, '大庆公安局大同分局', '大同分局', '于守龙', null, '18945602239', 'A1000012B8311F', '230606197608090215', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (500, '大庆公安局大同分局', '大同分局', '张亚良', null, '18945602246', 'A1000012B83149', '230606197610250230', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (350, '大庆公安局大同分局', '大同分局', '迟庆林', null, '18945602013', 'A1000012B7C27A', '230606195412061915', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (351, '大庆公安局大同分局', '大同分局', '刘云龙', null, '18945602015', 'A1000012B7C2AD', '230606196303230024', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (352, '大庆公安局大同分局', '大同分局', '刘淑敏', null, '18945602016', 'A1000012B7C2DB', '230606196409160220', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (353, '大庆公安局大同分局', '大同分局', '于宪华', null, '18945602017', 'A1000012B7C2EA', '230606195801100025', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (354, '大庆公安局大同分局', '大同分局', '贾锋', null, '18945602018', 'A1000012B7C2EE', '230606197412220217', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (355, '大庆公安局大同分局', '大同分局', '王华', null, '18945602019', 'A1000012B7C33A', '230606196805120028', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (356, '大庆公安局大同分局', '大同分局', '宁晓娟', null, '18945602020', 'A1000012B7C375', '230602197811302126', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (357, '大庆公安局大同分局', '大同分局', '李沛哲', null, '18945602022', 'A1000012B7C380', '230621197807220055', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (358, '大庆公安局大同分局', '大同分局', '吴鹏', null, '18945602025', 'A1000012B7C383', '230604197802120219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (359, '大庆公安局大同分局', '大同分局', '王培武', null, '18945602026', 'A1000012B7C388', '230606195804180016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (360, '大庆公安局大同分局', '大同分局', '吴希春', null, '18945602027', 'A1000012B7C38E', '230606195611114610', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (361, '大庆公安局大同分局', '大同分局', '毕国才', null, '18945602028', 'A1000012B7C394', '230606196407050714', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (362, '大庆公安局大同分局', '大同分局', '任河', null, '18945602029', 'A1000012B7C395', '230606195805220016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (363, '大庆公安局大同分局', '大同分局', '张术心', null, '18945602030', 'A1000012B7C3BB', '23060219790209211X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (364, '大庆公安局大同分局', '大同分局', '刘福林', null, '18945602033', 'A1000012B7C3C1', '23060619631008001X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (365, '大庆公安局大同分局', '大同分局', '张洪波', null, '18945602035', 'A1000012B7C3CA', '230604198105055110', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (366, '大庆公安局大同分局', '大同分局', '庄民', null, '18945602037', 'A1000012B7C3CD', '230602197805011015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (367, '大庆公安局大同分局', '大同分局', '王国柱', null, '18945602039', 'A1000012B7C3D1', '23060619640617001X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (368, '大庆公安局大同分局', '大同分局', '谭旭辉', null, '18945602055', 'A1000012B7C3D5', '230606196008010037', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (369, '大庆公安局大同分局', '大同分局', '张国庆', null, '18945602056', 'A1000012B7C3E8', '230602198009042130', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (370, '大庆公安局大同分局', '大同分局', '孔凡刚', null, '18945602057', 'A1000012B7C3EC', '230602197901012130', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (371, '大庆公安局大同分局', '大同分局', '范树彬', null, '18945602058', 'A1000012B7C401', '230606196511200014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (372, '大庆公安局大同分局', '大同分局', '王贵春', null, '18945602060', 'A1000012B7C41B', '230602197208104416', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (373, '大庆公安局大同分局', '大同分局', '王华', null, '18945602061', 'A1000012B7C426', '230606196105010047', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (374, '大庆公安局大同分局', '大同分局', '张达', null, '18945602065', 'A1000012B7C42D', '230621198003150412', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (375, '大庆公安局大同分局', '大同分局', '王超越', null, '18945602066', 'A1000012B7C444', '23062219830502002X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (376, '大庆公安局大同分局', '大同分局', '陈永成', null, '18945602067', 'A1000012B7C447', '230226197908050219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (377, '大庆公安局大同分局', '大同分局', '姜成岗', null, '18945602068', 'A1000012B7C44B', '230602198009162116', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (378, '大庆公安局大同分局', '大同分局', '杨国福', null, '18945602070', 'A1000012B7C44D', '230606196206040018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (379, '大庆公安局大同分局', '大同分局', '陈静', null, '18945602072', 'A1000012B7C44F', '230606198303274827', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (380, '大庆公安局大同分局', '大同分局', '于福贵', null, '18945602075', 'A1000012B7B877', '230226197804080210', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (381, '大庆公安局大同分局', '大同分局', '李志军', null, '18945602076', 'A1000012B7C480', '230602197811232113', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (382, '大庆公安局大同分局', '大同分局', '刘广平', null, '18945602077', 'A1000012B7C4B3', '230604196705210015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (383, '大庆公安局大同分局', '大同分局', '宋振波', null, '18945602078', 'A1000012B7C4C5', '230606196601184214', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (384, '大庆公安局大同分局', '大同分局', '陆青山', null, '18945602079', 'A1000012B7C4D5', '230606196006232058', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (385, '大庆公安局大同分局', '大同分局', '邹大军', null, '18945602080', 'A1000012B7C4D7', '230606197702100213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (386, '大庆公安局大同分局', '大同分局', '程广军', null, '18945602082', 'A1000012B7C4E4', '230606197412072816', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (387, '大庆公安局大同分局', '大同分局', '程晓华', null, '18945602083', 'A1000012B7C4EB', '23060619600720004X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (388, '大庆公安局大同分局', '大同分局', '刘志刚', null, '18945602085', 'A1000012B7C50D', '230602197503232154', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (389, '大庆公安局大同分局', '大同分局', '王文辉', null, '18945602086', 'A1000012B7C527', '230606197603040219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (390, '大庆公安局大同分局', '大同分局', '李艳斌', null, '18945602088', 'A1000012B7D0EC', '230606198105180213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (391, '大庆公安局大同分局', '大同分局', '裴国栋', null, '18945602089', 'A1000012B7D0FA', '230606197102280214', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (392, '大庆公安局大同分局', '大同分局', '李显辉', null, '18945602091', 'A1000012B7D161', '230606196512020031', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (393, '大庆公安局大同分局', '大同分局', '于宏钢', null, '18945602092', 'A1000012B7D1A3', '230606197810070218', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (394, '大庆公安局大同分局', '大同分局', '肖苏庆', null, '18945602093', 'A1000012B7D1C7', '230606197806040219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (395, '大庆公安局大同分局', '大同分局', '高树国', null, '18945602096', 'A1000012B7D1C9', '230606196805052619', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (396, '大庆公安局大同分局', '大同分局', '张井忠', null, '18945602097', 'A1000012B7D1CA', '230606196502280016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (397, '大庆公安局大同分局', '大同分局', '林治宽', null, '18945602098', 'A1000012B7D1CC', '230606196003213812', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (398, '大庆公安局大同分局', '大同分局', '马明国', null, '18945602099', 'A1000012B7D1CF', '23060619701215541X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (399, '大庆公安局大同分局', '大同分局', '宫政', null, '18945602100', 'A1000012B7D1E1', '230606195605200010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (400, '大庆公安局大同分局', '大同分局', '佟庆双', null, '18945602101', 'A1000012B7D298', '230602197609272138', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (401, '大庆公安局大同分局', '大同分局', '郑洪亮', null, '18945602102', 'A1000012B81605', '232325198408030030', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (402, '大庆公安局大同分局', '大同分局', '苏向清', null, '18945602105', 'A1000012B81628', '230606196402231647', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (403, '大庆公安局大同分局', '大同分局', '姜彦双', null, '18945602106', 'A1000012B8162F', '230606196307301774', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (404, '大庆公安局大同分局', '大同分局', '邹德林', null, '18945602107', 'A1000012B81632', '230606196308143018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (405, '大庆公安局大同分局', '大同分局', '刘珍', null, '18945602108', 'A1000012B8222E', '230602197808042175', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (406, '大庆公安局大同分局', '大同分局', '张科学', null, '18945602110', 'A1000012B82242', '230606197909294414', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (407, '大庆公安局大同分局', '大同分局', '耿晓波', null, '18945602112', 'A1000012B82268', '230606196010101616', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (408, '大庆公安局大同分局', '大同分局', '宋桂峰', null, '18945602117', 'A1000012B82270', '230602197504082178', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (409, '大庆公安局大同分局', '大同分局', '高晓东', null, '18945602118', 'A1000012B8227D', '230606196407010034', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (410, '大庆公安局大同分局', '大同分局', '张福林', null, '18945602119', 'A1000012B82294', '230604196909280832', '0', '0', null, null);
commit;
prompt 701 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (411, '大庆公安局大同分局', '大同分局', '吴兴跃', null, '18945602120', 'A1000012B82295', '230606196212161617', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (412, '大庆公安局大同分局', '大同分局', '罗文丰', null, '18945602121', 'A1000012B82297', '23060219760306213X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (413, '大庆公安局大同分局', '大同分局', '李坤', null, '18945602122', 'A1000012B82298', '230605196905222615', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (414, '大庆公安局大同分局', '大同分局', '刘云龙', null, '18945602123', 'A1000012B8229A', '230605196203131612', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (415, '大庆公安局大同分局', '大同分局', '张彦', null, '18945602125', 'A1000012B8229D', '230606196204280018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (416, '大庆公安局大同分局', '大同分局', '杨国林', null, '18945602126', 'A1000012B824DE', '230606197207011758', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (417, '大庆公安局大同分局', '大同分局', '刘林', null, '18945602127', 'A1000012B8250E', '23060619620809161X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (418, '大庆公安局大同分局', '大同分局', '丁春雷', null, '18945602128', 'A1000012B8295A', '230606198101074819', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (419, '大庆公安局大同分局', '大同分局', '张大龙', null, '18945602130', 'A1000012B82967', '23060219761213211X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (420, '大庆公安局大同分局', '大同分局', '赵乐全', null, '18945602131', 'A1000012B82969', '230606195612070031', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (421, '大庆公安局大同分局', '大同分局', '崔连武', null, '18945602133', 'A1000012B82981', '230606196308010012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (422, '大庆公安局大同分局', '大同分局', '林志全', null, '18945602134', 'A1000012B82984', '230602197707092130', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (423, '大庆公安局大同分局', '大同分局', '张春德', null, '18945602135', 'A1000012B8298E', '230606197410260231', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (424, '大庆公安局大同分局', '大同分局', '谷长春', null, '18945602137', 'A1000012B82994', '230602195211203838', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (425, '大庆公安局大同分局', '大同分局', '门艳冬', null, '18945602138', 'A1000012B829A1', '230602197810262134', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1536, '大庆公安局东安分局', '支队一', '李彦生', null, '18945601216', 'A1000012B82BEF', '230602197310087114', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1537, '大庆公安局东安分局', '支队一', '韩国鹏', null, '18945601217', 'A1000012B82D1E', '230103197510042833', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1538, '大庆公安局东安分局', '支队一', '杨月琴', null, '18945601218', 'A1000012B82C59', '23060219570516084X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1539, '大庆公安局东安分局', '支队一', '马庆辉', null, '18945601220', 'A1000012B82DCC', '230602197203062333', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1540, '大庆公安局东安分局', '支队一', '曹丽楠', null, '18945601221', 'A1000012B82BC1', '230602196711111029', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1541, '大庆公安局东安分局', '支队一', '宋冬梅', null, '18945601223', 'A1000012B82F95', '230602197111283825', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1542, '大庆公安局东安分局', '支队一', '王文威', null, '18945601227', 'A1000012B82C6D', '230603197806290219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1543, '大庆公安局东安分局', '支队一', '王飞', null, '18945601228', 'A1000012B82C64', '23060219620915041X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1544, '大庆公安局东安分局', '支队一', '全刚', null, '18945601229', 'A1000012B83025', '230603197704021739', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1545, '大庆公安局东安分局', '支队一', '邓艳英', null, '18945601230', 'A1000012B82CC6', '230506198107080448', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1546, '大庆公安局东安分局', '支队一', '韩绍军', null, '18945601231', 'A1000012B82D19', '230602196206170810', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1547, '大庆公安局东安分局', '支队一', '贾俊玲', null, '18945601232', 'A1000012B8302C', '230602197212271727', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1548, '大庆公安局东安分局', '支队一', '李庆男', null, '18945601233', 'A1000012B82CB6', '230602197106010419', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1549, '大庆公安局东安分局', '支队一', '李艳群', null, '18945601235', 'A1000012B82CA2', '230602197308297120', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1550, '大庆公安局东安分局', '支队一', '于海涛', null, '18945601236', 'A1000012B815CF', '230602197703092117', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1551, '大庆公安局东安分局', '支队一', '赵双庆', null, '18945601237', 'A1000012B81643', '230602197304244419', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1552, '大庆公安局东安分局', '支队一', '战超庆', null, '18945601238', 'A1000012B815FF', '230602195601240212', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1553, '大庆公安局东安分局', '支队一', '高艺文', null, '18945601239', 'A1000012B81631', '230602196407200844', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1554, '大庆公安局东安分局', '支队一', '李金权', null, '18945601252', 'A1000012B81612', '230603196810071516', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1555, '大庆公安局东安分局', '支队一', '刘百涛', null, '18945601255', 'A1000012B83184', '230602196904301013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1556, '大庆公安局东安分局', '支队一', '王万君', null, '18945601256', 'A1000012B831A7', '23060219771026591X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1557, '大庆公安局东安分局', '支队一', '张晓奇', null, '18945601257', 'A1000012B83112', '230602196402247117', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1558, '大庆公安局东安分局', '支队一', '高玉春', null, '18945601259', 'A1000012B831AA', '230602196712070214', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1559, '大庆公安局东安分局', '支队一', '石建平', null, '18945601260', 'A1000012B81610', '23060219600220621X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1560, '大庆公安局东安分局', '支队一', '付新慧', null, '18945601261', 'A1000012B82997', '230602196410043827', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1561, '大庆公安局东安分局', '支队一', '古立楠', null, '18945601263', 'A1000012B829A3', '230602198109225719', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1562, '大庆公安局东安分局', '支队一', '钱树臣', null, '18945601265', 'A1000012B8287A', '232325196506150213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1563, '大庆公安局东安分局', '支队一', '孙冬雪', null, '18945601266', 'A1000012B8293F', '232126197701060168', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1564, '大庆公安局东安分局', '支队一', '张明德', null, '18945601267', 'A1000012B824CC', '230602196812252138', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1565, '大庆公安局东安分局', '支队一', '甄树林', null, '18945601268', 'A1000012B82819', '230605197105252431', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1566, '大庆公安局东安分局', '支队一', '冯春伟', null, '18945601269', 'A1000012B8294D', '230604196909290053', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1567, '大庆公安局东安分局', '支队一', '曹军', null, '18945601270', 'A1000012B8288F', '230602197408141018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1568, '大庆公安局东安分局', '支队一', '林玉江', null, '18945601271', 'A1000012B82945', '230602196310107512', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1569, '大庆公安局东安分局', '支队一', '丁彩凤', null, '18945601272', 'A1000012B8295C', '230602197903245923', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1570, '大庆公安局东安分局', '支队一', '蔡兴金', null, '18945601275', 'A1000012B79D2D', '230605197408141018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1571, '大庆公安局东安分局', '支队一', '池昌洙', null, '18945601276', 'A1000012B7B552', '230602196506184413', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1572, '大庆公安局东安分局', '支队一', '李帝', null, '18945601277', 'A1000012B7B791', '23060219681005201X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1573, '大庆公安局东安分局', '支队一', '姜海波', null, '18945601278', 'A1000012B75769', '230602196509183811', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1574, '大庆公安局东安分局', '支队一', '付立安', null, '18945601117', 'A1000012B76B2A', '230122196209250371', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1575, '大庆公安局东安分局', '支队一', '徐守卫', null, '18945601280', 'A1000012B75DD4', '230602198611014431', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1576, '大庆公安局东安分局', '支队一', '杨志彬', null, '18945601281', 'A1000012B75BBC', '230602197209222131', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1577, '大庆公安局东安分局', '支队一', '王平英', null, '18945601286', 'A1000012B76B08', '230602196009282725', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1578, '大庆公安局东安分局', '支队一', '马里', null, '18945601287', 'A1000012B754E0', '230602197602160643', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1581, '雁塔分局', '雁塔分局', '李四', '1', '1122', '1122', '1122', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1580, '雁塔分局', '雁塔分局', '张三', '123', '1', '123', '123456789012345678', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1, '大庆公安局会战分局', '会战分局', '艾长君', null, '18945601301', 'A1000012B82904', '230604196809170214', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (2, '大庆公安局会战分局', '会战分局', '刘洋', null, '18945601303', 'A1000012B82411', '230605197205200014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (3, '大庆公安局会战分局', '会战分局', '苏学江', null, '18945601305', 'A1000012B7D11F', '230604196402242036', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (4, '大庆公安局会战分局', '会战分局', '关术威', null, '18945601306', 'A1000012B823E3', '23060519701207121X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (5, '大庆公安局会战分局', '会战分局', '鲁德景', null, '18945601307', 'A1000012B7F62F', '230604196208270412', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (6, '大庆公安局会战分局', '会战分局', '候典军', null, '18945601308', 'A1000012B828EF', '230603196411022311', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (7, '大庆公安局会战分局', '会战分局', '刘长林', null, '18945601309', 'A1000012B82434', '230602196401213011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (8, '大庆公安局会战分局', '会战分局', '周松岩', null, '18945601310', 'A1000012B7D1A8', '23210119730626063X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (9, '大庆公安局会战分局', '会战分局', '王丽', null, '18945601312', 'A1000012B82A45', '230603198112121722', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (10, '大庆公安局会战分局', '会战分局', '李玲', null, '18945601313', 'A1000012B82A8B', '230602196607260622', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (11, '大庆公安局会战分局', '会战分局', '刘磊', null, '18945601314', 'A1000012B7C4D4', '230604198112210607', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (12, '大庆公安局会战分局', '会战分局', '刘铁军', null, '18945601315', 'A1000012B7D1C8', '230602197008031013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (13, '大庆公安局会战分局', '会战分局', '邢晓冬', null, '18945601316', 'A1000012B7C4BA', '230605197705252216', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (14, '大庆公安局会战分局', '会战分局', '杨玉兴', null, '18945601317', 'A1000012B7C2E5', '230407197005040011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (15, '大庆公安局会战分局', '会战分局', '刘涛', null, '18945601318', 'A1000012B7D1DE', '230602198006096512', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (16, '大庆公安局会战分局', '会战分局', '修朋志', null, '18945601319', 'A1000012B7C4DA', '230602196311200831', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (17, '大庆公安局会战分局', '会战分局', '黄景柱', null, '18945601320', 'A1000012B7C528', '230602197411062119', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (18, '大庆公安局会战分局', '会战分局', '王殿生', null, '18945601321', 'A1000012B7C4A0', '230103197409022811', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (19, '大庆公安局会战分局', '会战分局', '薛文政', null, '18945601323', 'A1000012B7C4F0', '230604198105194137', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (20, '大庆公安局会战分局', '会战分局', '李广有', null, '18945601325', 'A1000012B7C49B', '230602196208287510', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (21, '大庆公安局会战分局', '会战分局', '刘克煜', null, '18945601326', 'A1000012B82220', '230602197010031717', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (22, '大庆公安局会战分局', '会战分局', '李志财', null, '18945601327', 'A1000012B82245', '230103197307014634', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (23, '大庆公安局会战分局', '会战分局', '孙超', null, '18945601328', 'A1000012B82255', '230103197408024612', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (24, '大庆公安局会战分局', '会战分局', '王峰', null, '18945601329', 'A1000012B8223C', '230603198309012116', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (25, '大庆公安局会战分局', '会战分局', '邢云峰', null, '18945601331', 'A1000012B8221F', '230602197311120617', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (26, '大庆公安局会战分局', '会战分局', '李大权', null, '18945601335', 'A1000012B8224E', '230602196404252315', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (27, '大庆公安局会战分局', '会战分局', '周磊', null, '18945601336', 'A1000012B82252', '23062119770413041X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (28, '大庆公安局会战分局', '会战分局', '甄柳', null, '18945601337', 'A1000012B82210', '230602197909152541', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (29, '大庆公安局会战分局', '会战分局', '李犁', null, '18945601339', 'A1000012B82253', '232301197609280014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (30, '大庆公安局会战分局', '会战分局', '张志刚', null, '18945601340', 'A1000012B82240', '230302197805204232', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (31, '大庆公安局会战分局', '会战分局', '刘延国', null, '18945601341', 'A1000012B7D7B4', '230602196405303815', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (32, '大庆公安局会战分局', '会战分局', '曹海东', null, '18945601342', 'A1000012B7D773', '230602198003192138', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (33, '大庆公安局会战分局', '会战分局', '赵云江', null, '18945601343', 'A1000012B7D788', '230602195508061519', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (34, '大庆公安局会战分局', '会战分局', '刘洪峰', null, '18945601345', 'A1000012B7D7DA', '230602197411213618', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (35, '大庆公安局会战分局', '会战分局', '巢辉', null, '18945601346', 'A1000012B7D7E5', '230602196704013412', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (36, '大庆公安局会战分局', '会战分局', '刘彦中', null, '18945601347', 'A1000012B7D782', '230602197608281016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (37, '大庆公安局会战分局', '会战分局', '任德文', null, '18945601348', 'A1000012B7D7AE', '230602197305121015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (38, '大庆公安局会战分局', '会战分局', '王刚（小）', null, '18945601349', 'A1000012B7D7E0', '230221198402062012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (39, '大庆公安局会战分局', '会战分局', '赵丹', null, '18945601350', 'A1000012B81DF6', '230603197803243169', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (40, '大庆公安局会战分局', '会战分局', '韩少杰', null, '18945601351', 'A1000012B7D7E1', '230602195904270814', '0', '0', null, null);
commit;
prompt 801 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (41, '大庆公安局会战分局', '会战分局', '张中良', null, '18945601352', 'A1000012B81EF2', '230602197812230216', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (42, '大庆公安局会战分局', '会战分局', '张磊', null, '18945601353', 'A1000012B7D7E2', '230602198204120210', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (43, '大庆公安局会战分局', '会战分局', '薛文军', null, '18945601356', 'A1000012B81EF3', '230602196908013019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (44, '大庆公安局会战分局', '会战分局', '张焉', null, '18945601357', 'A1000012B81CC0', '230602197405070614', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (45, '大庆公安局会战分局', '会战分局', '王名强', null, '18945601358', 'A1000012B820B0', '23230219730625101X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (46, '大庆公安局会战分局', '会战分局', '李治强', null, '18945601359', 'A1000012B81E3D', '230602197603106518', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (47, '大庆公安局会战分局', '会战分局', '李峰', null, '18945601360', 'A1000012B81E47', '231026197008106133', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (48, '大庆公安局会战分局', '会战分局', '王晓冬', null, '18945601361', 'A1000012B75D8F', '230602197412201715', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (49, '大庆公安局会战分局', '会战分局', '刘健', null, '18945601362', 'A1000012B81EB7', '230226198107022810', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (50, '大庆公安局会战分局', '会战分局', '滕玉国', null, '18945601363', 'A1000012B7A576', '230604197203101630', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (51, '大庆公安局会战分局', '会战分局', '葛崇垒', null, '18945601365', 'A1000012B81D78', '230602196410150016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (52, '大庆公安局会战分局', '会战分局', '李永明', null, '18945601367', 'A1000012B81E6F', '230604197009104416', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (53, '大庆公安局会战分局', '会战分局', '王进军', null, '18945601368', 'A1000012B78BDB', '230602196604191211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (54, '大庆公安局会战分局', '会战分局', '吴利军', null, '18945601369', 'A1000012B7BB7B', '230602197011144414', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (55, '大庆公安局会战分局', '会战分局', '郭建新', null, '18945601370', 'A1000012B78C33', '230602197012310410', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (56, '大庆公安局会战分局', '会战分局', '马力', null, '18945601371', 'A1000012B7A568', '230602195706130810', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (57, '大庆公安局会战分局', '会战分局', '梁勇', null, '18945601372', 'A1000012B7B92B', '23060219750511651X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (58, '大庆公安局会战分局', '会战分局', '杨万成', null, '18945601373', 'A1000012B7B6FE', '232302197309053270', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (59, '大庆公安局会战分局', '会战分局', '董国义', null, '18945601375', 'A1000012B7CC40', '232328197504120014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (60, '大庆公安局会战分局', '会战分局', '曹占文', null, '18945601376', 'A1000012B7CA72', '230602196305283310', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (61, '大庆公安局会战分局', '会战分局', '王贵山', null, '18945601378', 'A1000012B7CA7E', '230604196504200419', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (62, '大庆公安局会战分局', '会战分局', '那策', null, '18945601379', 'A1000012B7B938', '23060219740309411X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (63, '大庆公安局会战分局', '会战分局', '吴树权', null, '18945601380', 'A1000012B7CA76', '230604197209033659', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (64, '大庆公安局会战分局', '会战分局', '庄宝清', null, '18945601381', 'A1000012B7BA7A', '230602197510142114', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (65, '大庆公安局会战分局', '会战分局', '吕玉江', null, '18945601382', 'A1000012B7CC38', '230602196412142319', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (66, '大庆公安局会战分局', '会战分局', '冯刚', null, '18945601383', 'A1000012B7CA71', '23060219750612401X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (67, '大庆公安局会战分局', '会战分局', '胡宪影', null, '18945601385', 'A1000012B7CA77', '230602196806162136', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (68, '大庆公安局会战分局', '会战分局', '张龙江', null, '18945601386', 'A1000012B7CC39', '230602197810162133', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (69, '大庆公安局会战分局', '会战分局', '张赞', null, '18945601387', 'A1000012B7CA83', '230602198110250612', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (70, '大庆公安局会战分局', '会战分局', '贾春', null, '18945601389', 'A1000012B7ECE6', '230602196906062319', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (71, '大庆公安局会战分局', '会战分局', '王清武', null, '18945601390', 'A1000012BE238A', '230602196403080814', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (72, '大庆公安局会战分局', '会战分局', '于德学', null, '18945601391', 'A1000012B7ECF5', '23060319720413151X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (73, '大庆公安局会战分局', '会战分局', '董文胜', null, '18945601392', 'A1000012B7CA79', '230602196804055011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (74, '大庆公安局会战分局', '会战分局', '张奇', null, '18945601393', 'A1000012B7EA64', '230602198205020617', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (75, '大庆公安局会战分局', '会战分局', '李群', null, '18945601395', 'A1000012B7EBF8', '230231197609035431', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (76, '大庆公安局会战分局', '会战分局', '吴刚', null, '18945601396', 'A1000012B7ECEF', '230602197212260016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (77, '大庆公安局会战分局', '会战分局', '徐才良', null, '18945601397', 'A1000012B7E8EB', '230602196402222710', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1052, '大庆市公安局', '支队一', '郑淼', null, '18945600083', 'A1000012B7D065', '230602197609302122', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1053, '大庆市公安局', '支队一', '汪景涛', null, '18945600085', 'A1000012B83148', '232332196909235418', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1054, '大庆市公安局', '支队一', '张华凯', null, '18945600086', 'A1000012B831AD', '230602196909076214', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1055, '大庆市公安局', '支队一', '李长海', null, '18945600087', 'A1000012B830BB', '230604197608112610', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1056, '大庆市公安局', '支队一', '刘才', null, '18945600088', 'A1000012B830EA', '232127197305012013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1057, '大庆市公安局', '支队一', '冯景涛', null, '18945600089', 'A1000012B815FA', '230603198212223152', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1058, '大庆市公安局', '支队一', '于生', null, '18945600090', 'A1000012B8160D', '230603196603080217', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1059, '大庆市公安局', '支队一', '杨丽珍', null, '18945600091', 'A1000012B82FFD', '230602197401124443', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1060, '大庆市公安局', '支队一', '刘鹏', null, '18945600092', 'A1000012B82F73', '230602198207175911', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1061, '大庆市公安局', '支队一', '安靖勇', null, '18945600093', 'A1000012B8163E', '230602198206151010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1062, '大庆市公安局', '支队一', '王浩', null, '18945600095', 'A1000012B82FEA', '230602197809236000', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1063, '大庆市公安局', '支队一', '杨旭', null, '18945600096', 'A1000012B7F714', '230604198006301013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1064, '大庆市公安局', '支队一', '徐文俊', null, '18945600097', 'A1000012B7DDAF', '230602197805304459', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1065, '大庆市公安局', '支队一', '闫石', null, '18945600098', 'A1000012B7F80B', '23060219830110591X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1066, '大庆市公安局', '支队一', '陈永清', null, '18945600099', 'A1000012B7F7DC', '230602195404194413', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1067, '大庆市公安局', '支队一', '籍岩', null, '18945600100', 'A1000012B7F78D', '230602197908181025', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1068, '大庆市公安局', '支队一', '安伟', null, '18945600517', 'A1000012B7F7C0', '230605197906110230', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1069, '大庆市公安局', '支队一', '任继全', null, '18945600351', 'A1000012B7F6F2', '230604197008161216', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1070, '大庆市公安局', '支队一', '李树桥', null, '18945600353', 'A1000012B7F7CC', '230602195808243832', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1071, '大庆市公安局', '支队一', '夏志伟', null, '18945600355', 'A1000012B7F782', '230602196506060832', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1072, '大庆市公安局', '支队一', '夏英涛', null, '18945600356', 'A1000012B7F795', '230602196206270010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1073, '大庆市公安局', '支队一', '黄宪国', null, '18945600357', 'A1000012B7D35A', '230602197609102139', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1074, '大庆市公安局', '支队一', '王东', null, '18945600358', 'A1000012B7D369', '230602198011172110', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1075, '大庆市公安局', '支队一', '崔丽萍', null, '18945600359', 'A1000012B7D365', '230602196401280046', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1076, '大庆市公安局', '支队一', '孙维建', null, '18945600360', 'A1000012B7D392', '230602197307024411', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1077, '大庆市公安局', '支队一', '杨松柏', null, '18945600363', 'A1000012B7D322', '230624197908121514', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1078, '大庆市公安局', '支队一', '张静宇', null, '18945600365', 'A1000012B7D396', '230603197710291372', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1079, '大庆市公安局', '支队一', '刘莉', null, '18945600367', 'A1000012B7D2FF', '230602196503070461', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1080, '大庆市公安局', '支队一', '徐力军', null, '18945600368', 'A1000012B7D393', '230604196305221647', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1081, '大庆市公安局', '支队一', '刘生平', null, '18945600369', 'A1000012B7D390', '230602195702180810', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1082, '大庆市公安局', '支队一', '张辉', null, '18945600373', 'A1000012B82282', '230604198209100211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1083, '大庆市公安局', '支队一', '高树学', null, '18945600377', 'A1000012B82272', '230606196305100039', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1084, '大庆市公安局', '支队一', '周克', null, '18945600379', 'A1000012B8227E', '230602196003010411', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1085, '大庆市公安局', '支队一', '姜忠广', null, '18945600122', 'A1000012B82283', '230602197610196224', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1086, '大庆市公安局', '支队一', '张久林', null, '18945600201', 'A1000012B821EF', '230404197504160510', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1087, '大庆市公安局', '支队一', '李建超', null, '18945600202', 'A1000012B82278', '230606197912260223', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1088, '大庆市公安局', '支队一', '刘金友', null, '18945600203', 'A1000012B82276', '51021219700218165X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1089, '大庆市公安局', '支队一', '田继东', null, '18945600206', 'A1000012B8224B', '110102196711242358', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1090, '大庆市公安局', '支队一', '范雪梅', null, '18945600208', 'A1000012B82286', '230604781014022', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1091, '大庆市公安局', '支队一', '李丽娟', null, '18945600211', 'A1000012B82284', '230603197212123165', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1092, '大庆市公安局', '支队一', '郭柏林', null, '18945600215', 'A1000012B75DA2', '230602195411010416', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1093, '大庆市公安局', '支队一', '侯喜', null, '18945600227', 'A1000012B7673C', '230603197512304013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1094, '大庆市公安局', '支队一', '张娜', null, '18945600228', 'A1000012B7B5E2', '230602197702200622', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1095, '大庆市公安局', '支队一', '曹建龙', null, '18945600233', 'A1000012B763FE', '230602700117515', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1096, '大庆市公安局', '支队一', '金庆君', null, '18945600234', 'A1000012B75CD1', '232301197902260813', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1097, '大庆市公安局', '支队一', '吴建军', null, '18945600383', 'A1000012B757FD', '232604196210110022', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1098, '大庆市公安局', '支队一', '郑旭平', null, '18945600387', 'A1000012B7B602', '230604196309060211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1099, '大庆市公安局', '支队一', '张亚芳', null, '18945600393', 'A1000012B74E91', '23060519730504002X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1100, '大庆市公安局', '支队一', '张殿昌', null, '18945600808', 'A1000012B753E7', '230606198102032071', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1101, '大庆市公安局', '支队一', '李茂山', null, '18945600132', 'A1000012B75761', '230604196303190816', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1102, '大庆市公安局', '支队一', '张海涛', null, '18945600133', 'A1000012B7C34E', '232301197212030236', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1103, '大庆市公安局', '支队一', '明显东', null, '18945600135', 'A1000012B7C333', '230602196308073413', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1104, '大庆市公安局', '支队一', '包民星', null, '18945600136', 'A1000012B7C2D4', '230605196711072425', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1105, '大庆市公安局', '支队一', '王立祥', null, '18945600137', 'A1000012B7C350', '230602196603291915', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1106, '大庆市公安局', '支队一', '尹志军', null, '18945600138', 'A1000012B7C346', '230604195505100079', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1107, '大庆市公安局', '支队一', '王俨', null, '18945600150', 'A1000012B7C338', '230602196805160411', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1108, '大庆市公安局', '支队一', '孙庆华', null, '18945600155', 'A1000012B7C32F', '230602197009180416', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1109, '大庆市公安局', '支队一', '张忠语', null, '18945600156', 'A1000012B7C1DF', '230602196701246237', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1110, '大庆市公安局', '支队一', '贲春德', null, '18945600157', 'A1000012B7C340', '230602196807184011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1111, '大庆市公安局', '支队一', '陈英睿', null, '18945600158', 'A1000012B7C2C2', '230602196409080014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1112, '大庆市公安局', '支队一', '高柏森', null, '18945600159', 'A1000012B82990', '230602196804081017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1113, '大庆市公安局', '支队一', '高奎', null, '18945600160', 'A1000012B82510', '230602196908250815', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1114, '大庆市公安局', '支队一', '张天若', null, '18945600161', 'A1000012B82988', '230604197206190077', '0', '0', null, null);
commit;
prompt 901 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1115, '大庆市公安局', '支队一', '曹振国', null, '18945600163', 'A1000012B829A4', '230102196208143413', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1116, '大庆市公安局', '支队一', '李德民', null, '18945600166', 'A1000012B82927', '230602196406150871', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1117, '大庆市公安局', '支队一', '毛玉春', null, '18945600168', 'A1000012B8296B', '230602196309123814', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1118, '大庆市公安局', '支队一', '吴雪梅', null, '18945600169', 'A1000012B82961', '230602196604160423', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1119, '大庆市公安局', '支队一', '宋云波', null, '18945600171', 'A1000012B824F3', '230602196112213824', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1120, '大庆市公安局', '支队一', '李峰', null, '18945600177', 'A1000012B75D96', '230602196302060259', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1121, '大庆市公安局', '支队一', '姜国安', null, '18945600178', 'A1000012B8292A', '230602195212260412', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1122, '大庆市公安局', '支队一', '高晓辉', null, '18945600179', 'A1000012B7B379', '310109197103054018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1123, '大庆市公安局', '支队一', '金晶', null, '18945600180', 'A1000012B7B95C', '230606197609030222', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1124, '大庆市公安局', '支队一', '王志刚', null, '18945600181', 'A1000012B78DAF', '230602197204111512', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1125, '大庆市公安局', '支队一', '马玉福', null, '18945600182', 'A1000012B7772C', '230603197405201334', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (80, '大庆公安局会战分局', '会战分局', '王敬军', null, '18945601432', 'A1000012B822BC', '230228197802280211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (81, '大庆公安局会战分局', '会战分局', '张金成', null, '18945601456', 'A1000012B822B5', '230226197408020013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (78, '大庆公安局会战分局', '会战分局', '林立刚', null, '18945601398', 'A1000012B7ECFF', '230606197805255613', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (79, '大庆公安局会战分局', '会战分局', '于长江', null, '18945601403', 'A1000012B7ECDF', '230602196901106212', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (82, '大庆公安局会战分局', '会战分局', '王建新', null, '18945601459', 'A1000012B822B4', '230602196304020816', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (83, '大庆公安局会战分局', '会战分局', '李捍民', null, '18945601497', 'A1000012B7E8DC', '23060219640909191X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (84, '大庆公安局会战分局', '会战分局', '满江波', null, '18945601498', 'A1000012B8228B', '230602197207183618', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (85, '大庆公安局会战分局', '会战分局', '于希军', null, '18945601501', 'A1000012B8228E', '230602196501101914', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (86, '大庆公安局会战分局', '会战分局', '李成斌', null, '18945601502', 'A1000012B822AC', '230225197208010551', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (87, '大庆公安局会战分局', '会战分局', '陈珊珊', null, '18945601503', 'A1000012B8226B', '230602198111146526', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (88, '大庆公安局会战分局', '会战分局', '于宝贵', null, '18945601505', 'A1000012B8228A', '230602196411070034', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (89, '大庆公安局会战分局', '会战分局', '宋士军', null, '18945601506', 'A1000012B822BD', '230604196407101670', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (90, '大庆公安局会战分局', '会战分局', '张春云', null, '18945601507', 'A1000012B829E3', '230602196401270243', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (91, '大庆公安局会战分局', '会战分局', '逯全丽', null, '18945601508', 'A1000012B82E3D', '230602196101011020', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (92, '大庆公安局会战分局', '会战分局', '王中华', null, '18945601509', 'A1000012B822B2', '230602197605023660', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (93, '大庆公安局会战分局', '会战分局', '黄晓明', null, '18945601510', 'A1000012B7A440', '230604196511084719', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (94, '大庆公安局会战分局', '会战分局', '刘德生', null, '18945601512', 'A1000012B81A92', '230602195504090830', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (95, '大庆公安局会战分局', '会战分局', '张楠楠', null, '18945601513', 'A1000012B82C5D', '230602196405303815', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (96, '大庆公安局会战分局', '会战分局', '罗红卫', null, '18945601515', 'A1000012B82E57', '232302197006100711', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (97, '大庆公安局会战分局', '会战分局', '张铁静', null, '18945601516', 'A1000012B82AD0', '230602196908241046', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (98, '大庆公安局会战分局', '会战分局', '门志新', null, '18945601517', 'A1000012B82DDD', '230602197206214419', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (99, '大庆公安局会战分局', '会战分局', '王刚（大）', null, '18945601518', 'A1000012B7B8EF', '230602197302285153', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (100, '大庆公安局会战分局', '会战分局', '侯向莉', null, '18945601519', 'A1000012B7B9EE', '230602195911060428', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (101, '大庆公安局会战分局', '会战分局', '王勇', null, '18945601520', 'A1000012B7BBAA', '230602196510151016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (102, '大庆公安局会战分局', '会战分局', '许凯', null, '18945601521', 'A1000012B7B8D4', '230602197011150216', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (103, '大庆公安局会战分局', '会战分局', '冯健明', null, '18945601523', 'A1000012B7B7F6', '230602197811262136', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (104, '大庆公安局会战分局', '会战分局', '赵娜', null, '18945601525', 'A1000012B7B99E', '230602198304193628', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (105, '大庆公安局会战分局', '会战分局', '陶大明', null, '18945601526', 'A1000012B82E3A', '230602198011197510', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (106, '大庆公安局会战分局', '会战分局', '张志强', null, '18945601527', 'A1000012B82DE3', '23060219600725021X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (107, '大庆公安局会战分局', '会战分局', '陈耀武', null, '18945601528', 'A1000012B829CC', '230602196605182317', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (108, '大庆公安局会战分局', '会战分局', '罗成焕', null, '18945601529', 'A1000012B822A6', '230602196607051919', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (109, '大庆公安局会战分局', '会战分局', '孙伟', null, '18945601530', 'A1000012B8223F', '230602196508201213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (110, '大庆公安局会战分局', '会战分局', '张立霞', null, '18945601531', 'A1000012 BE238', '230602197410024428', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (111, '大庆公安局会战分局', '会战分局', '孙宇', null, '18945601532', 'A1000012B7BBB7', '230602197802212153', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (112, '大庆公安局会战分局', '会战分局', '吕守君', null, '18945601535', 'A1000012B7BAC4', '230103196812064232', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (113, '大庆公安局会战分局', '会战分局', '郭岩峰', null, '18945601536', 'A1000012B82261', '230602197212011722', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (114, '大庆公安局会战分局', '会战分局', '孙洪祥', null, '18945601537', 'A1000012B822AE', '220519197212275234', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (115, '大庆公安局会战分局', '会战分局', '芦翠兰', null, '18945601538', 'A1000012B822A7', '230604196211130023', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (116, '大庆公安局会战分局', '会战分局', '齐淑华', null, '18945601539', 'A1000012B8228D', '230602196205022728', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (117, '大庆公安局会战分局', '会战分局', '惠松辽', null, '18945601540', 'A1000012B822B8', '230604196401241613', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (118, '大庆公安局会战分局', '会战分局', '冷树才', null, '18945601541', 'A1000012B822AB', '230606196809100219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (119, '大庆公安局会战分局', '会战分局', '李天宝', null, '18945601542', 'A1000012B822B3', '230604197209253037', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (120, '大庆公安局会战分局', '会战分局', '吕岩', null, '18945601543', 'A1000012B7F85D', '230602196912256515', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (121, '大庆公安局会战分局', '会战分局', '王兴杰', null, '18945601545', 'A1000012B7F869', '230602195210020810', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (122, '大庆公安局会战分局', '会战分局', '王勤祥', null, '18945601546', 'A1000012B7F6CE', '230226197408020013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (123, '大庆公安局会战分局', '会战分局', '栾雪峰', null, '18945601547', 'A1000012B7F863', '230602197011040412', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (124, '大庆公安局会战分局', '会战分局', '姜晓波', null, '18945601548', 'A1000012B7F82D', '230602196302182512', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (125, '大庆公安局会战分局', '会战分局', '穆国军', null, '18945601549', 'A1000012B7F84A', '230602196009100813', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (126, '大庆公安局会战分局', '会战分局', '赵玉玲', null, '18945601550', 'A1000012B7F791', '230605197608231421', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (127, '大庆公安局会战分局', '会战分局', '田伟', null, '18945601551', 'A1000012B822B7', '230602196812175021', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (128, '大庆公安局会战分局', '会战分局', '杨炳琦', null, '18945601552', 'A1000012B7F36E', '230602196402073831', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (129, '大庆公安局会战分局', '会战分局', '刘晓军', null, '18945601553', 'A1000012B7F6CF', '230602196001170817', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (130, '大庆公安局会战分局', '会战分局', '于勇', null, '18945601556', 'A1000012B8163B', '230602195412280258', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (131, '大庆公安局会战分局', '会战分局', '王芳', null, '18945601557', 'A1000012B7F819', '230623198204170105', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (132, '大庆公安局会战分局', '会战分局', '关小华', null, '18945601558', 'A1000012B81602', '230602197309020211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (133, '大庆公安局会战分局', '会战分局', '隋继文', null, '18945601559', 'A1000012B815EE', '230602196110251915', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (134, '大庆公安局会战分局', '会战分局', '刘继先', null, '18945601560', 'A1000012B81611', '230602196412051011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (135, '大庆公安局铁人分局', '铁人分局', '赵竹雁', null, '18945601025', 'A1000012B7D00E', '230602196511150429', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (136, '大庆公安局铁人分局', '铁人分局', '高信国', null, '18945601561', 'A1000012B81618', '230603196410240413', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (137, '大庆公安局铁人分局', '铁人分局', '吴丽敏', null, '18945601563', 'A1000012B815D0', '230602195909290822', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (138, '大庆公安局铁人分局', '铁人分局', '徐光焰', null, '18945601565', 'A1000012B81637', '230602196907116518', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (139, '大庆公安局铁人分局', '铁人分局', '王丽娟', null, '18945601566', 'A1000012B815CB', '230223198106070221', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (140, '大庆公安局铁人分局', '铁人分局', '王海龙', null, '18945601567', 'A1000012B81629', '230602197612312110', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (141, '大庆公安局铁人分局', '铁人分局', '孙德强', null, '18945601568', 'A1000012B7D076', '230602196807031015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (142, '大庆公安局铁人分局', '铁人分局', '张丽', null, '18945601569', 'A1000012B7D00D', '230602196210180843', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (143, '大庆公安局铁人分局', '铁人分局', '孙雪辉', null, '18945601570', 'A1000012B7C90E', '230602197502075919', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (144, '大庆公安局铁人分局', '铁人分局', '罗中宇', null, '18945601575', 'A1000012B815EB', '232304198004207918', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (145, '大庆公安局铁人分局', '铁人分局', '鲍春梅', null, '18945601577', 'A1000012B7CF9C', '230602197705021021', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (146, '大庆公安局铁人分局', '铁人分局', '田凤林', null, '18945601579', 'A1000012B7D063', '230602197103150213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (147, '大庆公安局铁人分局', '铁人分局', '刁云鹏', null, '18945601580', 'A1000012B82C66', '230602196012272333', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (148, '大庆公安局铁人分局', '铁人分局', '王晓勃', null, '18945601581', 'A1000012B7CF97', '230605197304120212', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (149, '大庆公安局铁人分局', '铁人分局', '刘丽杰', null, '18945601582', 'A1000012B82C44', '230602196204260425', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (150, '大庆公安局铁人分局', '铁人分局', '张立国', null, '18945601583', 'A1000012B7CFA9', '230602197302241038', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (151, '大庆公安局铁人分局', '铁人分局', '曲建伟', null, '18945601585', 'A1000012B7D00F', '230603198008021318', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (152, '大庆公安局铁人分局', '铁人分局', '马云鸣', null, '18945601586', 'A1000012B82CA8', '230403197109270238', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (153, '大庆公安局铁人分局', '铁人分局', '李勇', null, '18945601587', 'A1000012B82C32', '230602196802201011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (154, '大庆公安局铁人分局', '铁人分局', '石磊', null, '18945601588', 'A1000012B82BC5', '230602198109223617', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (155, '大庆公安局铁人分局', '铁人分局', '曹冶', null, '18945601589', 'A1000012B7CF9B', '230602196309130854', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (156, '大庆公安局铁人分局', '铁人分局', '车艳军', null, '18945601590', 'A1000012B82BF4', '23060219690820101X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (157, '大庆公安局铁人分局', '铁人分局', '李敏', null, '18945601593', 'A1000012B82C5A', '230604197401210627', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (158, '大庆公安局铁人分局', '铁人分局', '关志伟', null, '18945601595', 'A1000012B82C61', '230605197612082211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (159, '大庆公安局铁人分局', '铁人分局', '陈金', null, '18945601596', 'A1000012B82C46', '230605197103071610', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (160, '大庆公安局铁人分局', '铁人分局', '范春明', null, '18945601598', 'A1000012B82C4D', '230602196610256210', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (161, '大庆公安局铁人分局', '铁人分局', '张博', null, '18945601599', 'A1000012B82963', '230602198210194419', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (162, '大庆公安局铁人分局', '铁人分局', '侯永飞', null, '18945601600', 'A1000012B829D6', '23060219660314101X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (163, '大庆公安局铁人分局', '铁人分局', '高飞', null, '18945601601', 'A1000012B8294E', '230602196905070413', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (164, '大庆公安局铁人分局', '铁人分局', '魏洪庆', null, '18945601602', 'A1000012B8295F', '230602196101120016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (165, '大庆公安局铁人分局', '铁人分局', '崔福志', null, '18945601603', 'A1000012B82C85', '230604196504162811', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (166, '大庆公安局铁人分局', '铁人分局', '郭洪江', null, '18945601605', 'A1000012B825ED', '230602195308270017', '0', '0', null, null);
commit;
prompt 1001 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (167, '大庆公安局铁人分局', '铁人分局', '满永亮', null, '18945601606', 'A1000012B8280E', '231181198108081134', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (168, '大庆公安局铁人分局', '铁人分局', '陈珲', null, '18945601607', 'A1000012B829AB', '230602197005313015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (169, '大庆公安局铁人分局', '铁人分局', '王景林', null, '18945601608', 'A1000012B82571', '230605196301060811', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (170, '大庆公安局大同分局', '大同分局', '孙显忠', null, '18945601609', 'A1000012B82598', '230606196507141613', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (171, '大庆公安局铁人分局', '铁人分局', '朱利辉', null, '18945601610', 'A1000012B7D8B4', '230602197201161717', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (172, '大庆公安局铁人分局', '铁人分局', '赵双', null, '18945601611', 'A1000012B7D880', '230602196509281518', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (173, '大庆公安局铁人分局', '铁人分局', '孟庆革', null, '18945601612', 'A1000012B7D9FD', '230602196710110016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (174, '大庆公安局铁人分局', '铁人分局', '李连生', null, '18945601613', 'A1000012B7D89D', '23060219600221341X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (175, '大庆公安局铁人分局', '铁人分局', '张贺量', null, '18945601615', 'A1000012B7D6D0', '230602197903116216', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (176, '大庆公安局铁人分局', '铁人分局', '侯光明', null, '18945601616', 'A1000012B7D9FF', '230712196111110338', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (177, '大庆公安局铁人分局', '铁人分局', '常云龙', null, '18945601617', 'A1000012B7D834', '230602197408250215', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (178, '大庆公安局铁人分局', '铁人分局', '孙彬彬', null, '18945601618', 'A1000012B7D89A', '230602197404184417', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (179, '大庆公安局铁人分局', '铁人分局', '郭长路', null, '18945601619', 'A1000012B7D875', '230602196912132117', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (180, '大庆公安局铁人分局', '铁人分局', '赵春凯', null, '18945601620', 'A1000012B7D89E', '230602198301024415', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (181, '大庆公安局铁人分局', '铁人分局', '邵宪生', null, '18945601621', 'A1000012B7C442', '230602196210253811', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (182, '大庆公安局铁人分局', '铁人分局', '崔恩忠', null, '18945601626', 'A1000012B7C41E', '23022319710715203X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (183, '大庆公安局铁人分局', '铁人分局', '张国才', null, '18945601628', 'A1000012B7C448', '230602196302210819', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (184, '大庆公安局铁人分局', '铁人分局', '宋民福', null, '18945601630', 'A1000012B7C3F7', '230602196203290817', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (185, '大庆公安局铁人分局', '铁人分局', '蒋本忠', null, '18945601633', 'A1000012B7C453', '230602196812201939', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (186, '大庆公安局铁人分局', '铁人分局', '李少宏', null, '18945601636', 'A1000012BF227D', '230602196610031978', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (187, '大庆公安局铁人分局', '铁人分局', '陈绍红', null, '18945601637', 'A1000012B7C460', '230602196001200422', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (188, '大庆公安局铁人分局', '铁人分局', '赵振峰', null, '18945601638', 'A1000012B75D85', '230606197308230239', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (189, '大庆公安局铁人分局', '铁人分局', '于海波', null, '18945601639', 'A1000012B7B9F7', '230602196107063833', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (190, '大庆公安局铁人分局', '铁人分局', '唐明杰', null, '18945601640', 'A1000012B7BB28', '230602196312202310', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (191, '大庆公安局铁人分局', '铁人分局', '张国华', null, '18945601646', 'A1000012B7C429', '230602196505183013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (192, '大庆公安局铁人分局', '铁人分局', '王凯', null, '18945601648', 'A1000012B75D70', '230602197103100814', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (193, '大庆公安局铁人分局', '铁人分局', '孟祥集', null, '18945601650', 'A1000012B75B36', '230606197306080214', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (194, '大庆公安局铁人分局', '铁人分局', '杨文佐', null, '18945601651', 'A1000012B758A3', '230602195709240011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (195, '大庆公安局铁人分局', '铁人分局', '赵晓磊', null, '18945601654', 'A1000012B7B9ED', '230602198204172512', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (738, '龙凤分局', '龙凤分局', '吴荣伟', null, '18945601878', 'A1000012B82CBA', '230603196702220916', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (739, '龙凤分局', '龙凤分局', '常桂文', null, '18945601879', 'A1000012B82C82', '230603196404060723', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (740, '龙凤分局', '龙凤分局', '宋殿利', null, '18945601880', 'A1000012B82C8C', '230603195708170716', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (741, '龙凤分局', '龙凤分局', '刘兴亮', null, '18945601881', 'A1000012B82C5B', '230603197603312115', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (742, '龙凤分局', '龙凤分局', '方景迁', null, '18945601882', 'A1000012B82965', '230603195503080055', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (743, '龙凤分局', '龙凤分局', '刘存玉', null, '18945601883', 'A1000012B82CD6', '230603195505200014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (744, '龙凤分局', '龙凤分局', '常瑞华', null, '18945601885', 'A1000012B82C71', '230605197211070826', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (745, '龙凤分局', '龙凤分局', '张林', null, '18945601886', 'A1000012B82C12', '230602196501011919', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (746, '龙凤分局', '龙凤分局', '王礼', null, '18945601887', 'A1000012B82F5D', '230602196212101918', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (747, '龙凤分局', '龙凤分局', '王永胜', null, '18945601889', 'A1000012B82F25', '230602196410220811', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (748, '龙凤分局', '龙凤分局', '曲家坤', null, '18945601890', 'A1000012B8310F', '230603196109030716', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (749, '龙凤分局', '龙凤分局', '刘玉芳', null, '18945601891', 'A1000012B830D7', '230603197107181128', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (750, '龙凤分局', '龙凤分局', '李文丽', null, '18945601892', 'A1000012B830B6', '230603196411061943', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (751, '龙凤分局', '龙凤分局', '周爱平', null, '18945601895', 'A1000012B815CD', '230228197804180046', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (752, '龙凤分局', '龙凤分局', '韩岳', null, '18945601896', 'A1000012B8160B', '230603195201210213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (753, '龙凤分局', '龙凤分局', '郝洪杰', null, '18945601897', 'A1000012B81641', '230603195611170023', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (754, '龙凤分局', '龙凤分局', '彭国东', null, '18945601898', 'A1000012B7DD37', '23060319620623071X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (755, '龙凤分局', '龙凤分局', '赵德俊', null, '18945601899', 'A1000012B81623', '230603196204143313', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (756, '龙凤分局', '龙凤分局', '张宝东', null, '18945601900', 'A1000012B7DA2C', '230602196511013838', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (757, '龙凤分局', '龙凤分局', '孙玉忠', null, '18945601901', 'A1000012B815FE', '230603196304051117', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (758, '龙凤分局', '龙凤分局', '付振国', null, '18945601902', 'A1000012B8161A', '230603195411250731', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (759, '龙凤分局', '龙凤分局', '闫成峰', null, '18945601903', 'A1000012B81624', '230603196902070932', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (760, '龙凤分局', '龙凤分局', '吴波', null, '18945601905', 'A1000012B81638', '230602196607190011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (761, '龙凤分局', '龙凤分局', '姜振勇', null, '18945601906', 'A1000012B8160E', '230603196302231114', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (762, '龙凤分局', '龙凤分局', '刘贵才', null, '18945601907', 'A1000012B815F9', '230602195605011919', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (763, '龙凤分局', '龙凤分局', '王玉昌', null, '18945601908', 'A1000012B8162C', '230603197403281713', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (764, '龙凤分局', '龙凤分局', '范洪强', null, '18945601909', 'A1000012B81647', '230603197304141352', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (765, '龙凤分局', '龙凤分局', '任杰敏', null, '18945601910', 'A1000012B815C8', '230603196212280713', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (766, '龙凤分局', '龙凤分局', '张武', null, '18945601911', 'A1000012B815DF', '230603196905101116', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (767, '龙凤分局', '龙凤分局', '崔凤友', null, '18945601913', 'A1000012B815CE', '230603195307060030', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (768, '龙凤分局', '龙凤分局', '邵洪喜', null, '18945601915', 'A1000012B81DEC', '230603195505021112', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (769, '龙凤分局', '龙凤分局', '张洪军', null, '18945601916', 'A1000012B81CA5', '230602195804013810', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (770, '龙凤分局', '龙凤分局', '白秀丽', null, '18945601917', 'A1000012B820EC', '230603196001130723', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (771, '龙凤分局', '龙凤分局', '王新兵', null, '18945601918', 'A1000012B820D7', '230603196601291117', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (772, '龙凤分局', '龙凤分局', '王恒魁', null, '18945601919', 'A1000012B7E877', '230604196308040219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (773, '龙凤分局', '龙凤分局', '王洪芳', null, '18945601920', 'A1000012B820EA', '230604197502050220', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (774, '龙凤分局', '龙凤分局', '黄松绵', null, '18945601921', 'A1000012B81EF4', '230603196301110716', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (775, '龙凤分局', '龙凤分局', '李春生', null, '18945601922', 'A1000012B81DFC', '230602196701230219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (776, '龙凤分局', '龙凤分局', '姜勇', null, '18945601923', 'A1000012B82CE2', '230603196104190016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (777, '龙凤分局', '龙凤分局', '徐慧', null, '18945601925', 'A1000012B81D42', '230603197408052127', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (778, '龙凤分局', '龙凤分局', '于忠海', null, '18945601926', 'A1000012B75E0D', '230805197510270036', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (779, '龙凤分局', '龙凤分局', '田志军', null, '18945601927', 'A1000012B7546C', '230603196507071118', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (780, '龙凤分局', '龙凤分局', '庞刚', null, '18945601928', 'A1000012B7B954', '230602197812096213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (781, '龙凤分局', '龙凤分局', '杨光', null, '18945601930', 'A1000012B7BA1B', '230603197102024019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (782, '龙凤分局', '龙凤分局', '崔玉田', null, '18945601932', 'A1000012B78B5F', '23060319571120071X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (783, '龙凤分局', '龙凤分局', '臧庆祝', null, '18945601933', 'A1000012B78D25', '230603196501231117', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (784, '龙凤分局', '龙凤分局', '方淑杰', null, '18945601936', 'A1000012B7595D', '230603196312230027', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (785, '龙凤分局', '龙凤分局', '李金波', null, '18945601939', 'A1000012B7588B', '230602196207150010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (786, '龙凤分局', '龙凤分局', '李永山', null, '18945601949', 'A1000012B7B2C8', '230603196102260017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (787, '龙凤分局', '龙凤分局', '郭学利', null, '18945601950', 'A1000012B74CDA', '230603195108081314', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (788, '龙凤分局', '龙凤分局', '董树和', null, '18945601951', 'A1000012B7B19E', '230603195407180013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (789, '龙凤分局', '龙凤分局', '陈海军', null, '18945601955', 'A1000012B7B697', '232321197403299014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (790, '龙凤分局', '龙凤分局', '刘永利', null, '18945601956', 'A1000012B7B046', '230603195610020015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (791, '龙凤分局', '龙凤分局', '李志海', null, '18945601958', 'A1000012B7B6BF', '230603195811080014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (792, '龙凤分局', '龙凤分局', '王延军', null, '18945601959', 'A1000012B7B331', '230603196303101119', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (793, '龙凤分局', '龙凤分局', '吕慧', null, '18945601965', 'A1000012B7B5FB', '230603196507150027', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (794, '龙凤分局', '龙凤分局', '韩冰', null, '18945601966', 'A1000012B7B742', '230602197404284020', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (795, '龙凤分局', '龙凤分局', '房亚辉', null, '18945601967', 'A1000012B7B341', '230603197112041111', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (796, '龙凤分局', '龙凤分局', '林静', null, '18945601968', 'A1000012B7B2EB', '230204197305172120', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (797, '龙凤分局', '龙凤分局', '孔令发', null, '18945601969', 'A1000012B7B3DC', '230603196206290712', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (798, '龙凤分局', '龙凤分局', '寇鲁庚', null, '18945601970', 'A1000012B7D0F3', '230603195205110711', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (799, '龙凤分局', '龙凤分局', '于丽舫', null, '18945601971', 'A1000012B7C4D6', '230603197103032328', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (800, '龙凤分局', '龙凤分局', '隋金玲', null, '18945601975', 'A1000012B7C2E1', '230103197506064626', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (801, '龙凤分局', '龙凤分局', '梁富强', null, '18945601976', 'A1000012B7BF03', '230602197601182111', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (802, '龙凤分局', '龙凤分局', '刘厚鑫', null, '18945601977', 'A1000012B7D1A1', '232622197306134616', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (803, '龙凤分局', '龙凤分局', '郑西彬', null, '18945601978', 'A1000012B7C43E', '23010719780910247X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (804, '龙凤分局', '龙凤分局', '马健', null, '18945601980', 'A1000012B7D1A4', '230603196105011139', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (805, '大庆公安局卧里屯分局', '支队一', '张义清', null, '18945602501', 'A1000012B7D1A5', '230603195508052336', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (806, '大庆公安局卧里屯分局', '支队一', '金常清', null, '18945602502', 'A1000012B7D174', '230606195702035811', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (807, '大庆公安局卧里屯分局', '支队一', '朱为民', null, '18945602503', 'A1000012B7D172', '230602196402210058', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (808, '大庆公安局卧里屯分局', '支队一', '齐德厚', null, '18945602505', 'A1000012B823D0', '230603196508242310', '0', '0', null, null);
commit;
prompt 1101 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (809, '大庆公安局卧里屯分局', '支队一', '李贵义', null, '18945602506', 'A1000012B831F2', '230603196412042533', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (810, '大庆公安局卧里屯分局', '支队一', '宋孝成', null, '18945602507', 'A1000012B829F6', '230603195509243513', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (811, '大庆公安局卧里屯分局', '支队一', '张生文', null, '18945602508', 'A1000012B7F64E', '230602196505090239', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (812, '大庆公安局卧里屯分局', '支队一', '刘维加', null, '18945602509', 'A1000012B82A7E', '230602195703190033', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (813, '大庆公安局卧里屯分局', '支队一', '马洪君', null, '18945602510', 'A1000012B82870', '230602196212174017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (814, '大庆公安局卧里屯分局', '支队一', '王东锋', null, '18945602512', 'A1000012B82A92', '230603197311182531', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (815, '大庆公安局卧里屯分局', '支队一', '辛勇', null, '18945602513', 'A1000012B82A84', '230603197702150932', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (816, '大庆公安局卧里屯分局', '支队一', '王晓冰', null, '18945602515', 'A1000012B8281E', '23060319781129373X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (817, '大庆公安局卧里屯分局', '支队一', '王新宇', null, '18945602516', 'A1000012B8286C', '230603196310262527', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (818, '大庆公安局卧里屯分局', '支队一', '孙庆艳', null, '18945602517', 'A1000012B7AF6B', '23060319630913232X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (819, '大庆公安局卧里屯分局', '支队一', '果志方', null, '18945602518', 'A1000012B7AEFE', '230603196110122335', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (501, '大庆公安局大同分局', '大同分局', '李术凤', null, '18945602248', 'A1000012B7C378', '230606197605032052', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (502, '大庆公安局大同分局', '大同分局', '程广宇', null, '18945602255', 'A1000012B7E8EE', '230604197610070210', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (503, '大庆公安局大同分局', '大同分局', '高波', null, '18945602256', 'A1000012B7EA66', '23060619750928521X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (504, '大庆公安局大同分局', '大同分局', '刘军奎', null, '18945602257', 'A1000012B7EA67', '230606197308202051', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (505, '大庆公安局大同分局', '大同分局', '刘晓全', null, '18945602258', 'A1000012B7EAAC', '230606197203071753', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (506, '大庆公安局大同分局', '大同分局', '曲志国', null, '18945602259', 'A1000012B7EC86', '230622197711050051', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (507, '大庆公安局大同分局', '大同分局', '唐文晶', null, '18945602260', 'A1000012B7ECA3', '230604198208254120', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (508, '大庆公安局大同分局', '大同分局', '陈彦学', null, '18945601999', 'A1000012B7ECDD', '230606195903290034', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (509, '大庆公安局大同分局', '大同分局', '于锡亮', null, '18945602000', 'A1000012B7ECE1', '230602196712241917', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (510, '大庆公安局大同分局', '大同分局', '崔玉峰', null, '18945602111', 'A1000012B7ECE5', '230604196510271635', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (511, '大庆公安局高新区分局', '高新区分局', '魏冰冰', null, '18945602265', 'A1000012B7D71F', '230602197311297527', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (512, '大庆公安局高新区分局', '高新区分局', '宋天贺', null, '18945602266', 'A1000012B7D717', '230602196612085697', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (513, '大庆公安局高新区分局', '高新区分局', '杨越', null, '18945602269', 'A1000012B7BACE', '230605197209060223', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (514, '大庆公安局高新区分局', '高新区分局', '王斌', null, '18945602271', 'A1000012B7D73C', '230602197210093410', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (515, '大庆公安局高新区分局', '高新区分局', '杨光', null, '18945602272', 'A1000012B7D71E', '230605820421101', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (516, '大庆公安局高新区分局', '高新区分局', '徐颜君', null, '18945602277', 'A1000012B7D716', '230604197005134116', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (517, '大庆公安局高新区分局', '高新区分局', '赵希岚', null, '18945602278', 'A1000012B7D6BB', '230605196706182825', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (518, '大庆公安局高新区分局', '高新区分局', '王文红', null, '18945602279', 'A1000012B7D719', '230602197003133424', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (519, '大庆公安局高新区分局', '高新区分局', '战环宇', null, '18945602281', 'A1000012B8220E', '230828198105220026', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (520, '大庆公安局高新区分局', '高新区分局', '王东庆', null, '18945602287', 'A1000012B821FD', '230602196204083019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (521, '大庆公安局高新区分局', '高新区分局', '焦希忠', null, '18945602288', 'A1000012B82269', '370205195912089175', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (522, '大庆公安局高新区分局', '高新区分局', '程永生', null, '18945602289', 'A1000012B821FB', '230604196301114414', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (523, '大庆公安局高新区分局', '高新区分局', '王子刚', null, '18945602292', 'A1000012B82256', '230604197209170055', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (524, '大庆公安局高新区分局', '高新区分局', '周利双', null, '18945602296', 'A1000012B82226', '230103720306461', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (525, '大庆公安局高新区分局', '高新区分局', '刘庆宇', null, '18945602297', 'A1000012B821F7', '230226197908241912', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (526, '大庆公安局高新区分局', '高新区分局', '王亮', null, '18945602298', 'A1000012B821FF', '230604198003260631', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (527, '大庆公安局高新区分局', '高新区分局', '周庆', null, '18945602299', 'A1000012B82205', '230603197106081117', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (528, '大庆公安局高新区分局', '高新区分局', '赵彦君', null, '18945602300', 'A1000012B82267', '23060219730108021X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (529, '大庆公安局高新区分局', '高新区分局', '孙伟', null, '18945602301', 'A1000012B7F6E9', '230604197401093010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (530, '大庆公安局高新区分局', '高新区分局', '刘波', null, '18945602303', 'A1000012B7F7F0', '230602197901224010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (531, '大庆公安局高新区分局', '高新区分局', '刘继光', null, '18945602305', 'A1000012B7FDBF', '230281197407154911', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (532, '大庆公安局高新区分局', '高新区分局', '柳瑞江', null, '18945602306', 'A1000012B7F6E0', '230605197404231016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (533, '大庆公安局高新区分局', '高新区分局', '杨荣涛', null, '18945602307', 'A1000012B7F7CB', '230602750921441', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (534, '大庆公安局高新区分局', '高新区分局', '贾少武', null, '18945602309', 'A1000012B8226A', '230203197811092135', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (535, '大庆公安局高新区分局', '高新区分局', '任法宝', null, '18945602311', 'A1000012B82265', '230605640615205', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (536, '大庆公安局高新区分局', '高新区分局', '李鹏', null, '18945602313', 'A1000012B82264', '230602198205126219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (537, '大庆公安局高新区分局', '高新区分局', '陈艺仁', null, '18945602322', 'A1000012B8221D', '230602821025101', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (538, '大庆公安局高新区分局', '高新区分局', '陈建国', null, '18945602323', 'A1000012B821F5', '230602196307111211', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (539, '大庆公安局高新区分局', '高新区分局', '李井刚', null, '18945602332', 'A1000012B82229', '230602631203381', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (540, '大庆公安局高新区分局', '高新区分局', '邢栋', null, '18945602336', 'A1000012B821F6', '230604780907101', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (541, '大庆公安局高新区分局', '高新区分局', '张磊', null, '18945602337', 'A1000012B8227C', '230602197911034026', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (542, '大庆公安局高新区分局', '高新区分局', '曹晓红', null, '18945602339', 'A1000012B821F0', '230602197812025925', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (543, '大庆公安局高新区分局', '高新区分局', '张学伟', null, '18945602341', 'A1000012B821FA', '230602197307274015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (544, '大庆公安局高新区分局', '高新区分局', '田志勇', null, '18945602342', 'A1000012B8227F', '230602790316061', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (545, '大庆公安局高新区分局', '高新区分局', '田晔崧', null, '18945602343', 'A1000012B82F15', '230602197211210412', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (546, '大庆公安局高新区分局', '高新区分局', '付加冬', null, '18945602345', 'A1000012B82EDE', '230603760721401', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (547, '大庆公安局高新区分局', '高新区分局', '王刚', null, '18945602346', 'A1000012B82D1A', '230103820214393', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (548, '大庆公安局高新区分局', '高新区分局', '冯廷波', null, '18945602347', 'A1000012B82F05', '230602630615041', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (549, '大庆公安局高新区分局', '高新区分局', '曹琳', null, '18945602350', 'A1000012B82273', '230603780122401', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (550, '大庆公安局高新区分局', '高新区分局', '李广地', null, '18945602351', 'A1000012B82258', '210105690630533', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (551, '大庆公安局高新区分局', '高新区分局', '周勃', null, '18945602353', 'A1000012B82279', '230602197709204415', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (552, '大庆公安局高新区分局', '高新区分局', '杜剑华', null, '18945602355', 'A1000012B82E3B', '230602196712271956', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (553, '大庆公安局高新区分局', '高新区分局', '刘国栋', null, '18945602357', 'A1000012B7B786', '230603790903371', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (554, '大庆公安局高新区分局', '高新区分局', '张晶堃', null, '18945602358', 'A1000012B78C98', '230602197301240615', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (555, '大庆公安局高新区分局', '高新区分局', '牟宗文', null, '18945602359', 'A1000012B7AFA4', '232622690226491', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (556, '大庆公安局高新区分局', '高新区分局', '徐铁龙', null, '18945602366', 'A1000012B79C58', '230606610901001', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (557, '大庆公安局高新区分局', '高新区分局', '宫本双', null, '18945602367', 'A1000012B74B71', '230602790430625', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (558, '大庆公安局高新区分局', '高新区分局', '刘剑虹', null, '18945602368', 'A1000012B7B9F3', '230226196407260045', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (559, '大庆公安局高新区分局', '高新区分局', '朱国君', null, '18945602369', 'A1000012B78D26', '230603195212122518', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (560, '大庆公安局高新区分局', '高新区分局', '郎森林', null, '18945602370', 'A1000012B7B82D', '230602640126151', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (561, '大庆公安局高新区分局', '高新区分局', '林凯', null, '18945602371', 'A1000012B80609', '230602197108270812', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (562, '大庆公安局高新区分局', '高新区分局', '郑昌炎', null, '18945602372', 'A1000012B82F13', '230603740714315', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (563, '大庆公安局高新区分局', '高新区分局', '马永', null, '18945602373', 'A1000012B82964', '230602198109116213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (564, '大庆公安局高新区分局', '高新区分局', '徐大庆', null, '18945602375', 'A1000012B7D47C', '230602197706286216', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (565, '大庆公安局高新区分局', '高新区分局', '杨科元', null, '18945602376', 'A1000012B82EE0', '230603196112011111', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (566, '大庆公安局高新区分局', '高新区分局', '徐洪福', null, '18945602377', 'A1000012B82EBC', '230604197310300299', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (567, '大庆公安局高新区分局', '高新区分局', '李大军', null, '18945602378', 'A1000012B82F0F', '230602196509250818', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (568, '大庆公安局高新区分局', '高新区分局', '王国峰', null, '18945602379', 'A1000012B7F78F', '230606197805042431', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (569, '大庆公安局高新区分局', '高新区分局', '蒋建军', null, '18945602380', 'A1000012B82FF0', '230602780801061', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (570, '大庆公安局高新区分局', '高新区分局', '沈阳', null, '18945602381', 'A1000012B83244', '230602781011361', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (571, '大庆公安局高新区分局', '高新区分局', '李斌', null, '18945602382', 'A1000012B7C3C2', '230602197004182316', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (572, '大庆公安局高新区分局', '高新区分局', '王智平', null, '18945602383', 'A1000012B82FF6', '230602196403163011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (573, '大庆公安局高新区分局', '高新区分局', '高业玺', null, '18945602385', 'A1000012B805DE', '230603195708153019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (574, '大庆公安局高新区分局', '高新区分局', '王德丰', null, '18945602387', 'A1000012B82FEE', '230105720701051', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (575, '大庆公安局高新区分局', '高新区分局', '吴金', null, '18945602388', 'A1000012B83249', '230605640408201', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (820, '大庆公安局卧里屯分局', '支队一', '刘文娟', null, '18945602519', 'A1000012B7AC9C', '230603196509192546', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (821, '大庆公安局卧里屯分局', '支队一', '徐丹', null, '18945602520', 'A1000012B7AE97', '23060319771024252X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (822, '大庆公安局卧里屯分局', '支队一', '魏淑芳', null, '18945602521', 'A1000012B7ACAF', '230603196304162327', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (823, '大庆公安局卧里屯分局', '支队一', '普志成', null, '18945602523', 'A1000012B7AC3E', '230603195911272312', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (824, '大庆公安局卧里屯分局', '支队一', '张建军', null, '18945602526', 'A1000012B7AF8A', '23060319540510237X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (825, '大庆公安局卧里屯分局', '支队一', '郭瑞林', null, '18945602527', 'A1000012B7AFAA', '230603195401100713', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (826, '大庆公安局卧里屯分局', '支队一', '滕淑娟', null, '18945602528', 'A1000012B7AF5D', '230603196511201122', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (827, '大庆公安局卧里屯分局', '支队一', '刘玉春', null, '18945602529', 'A1000012B7AEE9', '230603195304152335', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (828, '大庆公安局卧里屯分局', '支队一', '于彬', null, '18945602530', 'A1000012B83008', '230603197209131949', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (829, '大庆公安局卧里屯分局', '支队一', '马晓辉', null, '18945602531', 'A1000012B8300E', '230603197108080011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (830, '大庆公安局卧里屯分局', '支队一', '胡军', null, '18945602532', 'A1000012B82F24', '230606196303045814', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (831, '大庆公安局卧里屯分局', '支队一', '张志宏', null, '18945602535', 'A1000012B83010', '230521196512030027', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (832, '大庆公安局卧里屯分局', '支队一', '杨丽霞', null, '18945602536', 'A1000012B82F0C', '230603196509182321', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (833, '大庆公安局卧里屯分局', '支队一', '刘欣梅', null, '18945602537', 'A1000012B82F18', '230603197610113341', '0', '0', null, null);
commit;
prompt 1201 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (834, '大庆公安局卧里屯分局', '支队一', '徐宝莲', null, '18945602538', 'A1000012B83016', '230603195608232326', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (835, '大庆公安局卧里屯分局', '支队一', '张华', null, '18945602539', 'A1000012B82F84', '230603196406012127', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (836, '大庆公安局卧里屯分局', '支队一', '罗苏龙', null, '18945602550', 'A1000012B8301B', '230603196311232338', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (837, '大庆公安局卧里屯分局', '支队一', '薛大伟', null, '18945602551', 'A1000012B82F60', '230603196808220017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (838, '大庆公安局卧里屯分局', '支队一', '马鑫玉', null, '18945602552', 'A1000012B82238', '230603197410110939', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (839, '大庆公安局卧里屯分局', '支队一', '暴希龙', null, '18945602553', 'A1000012B8222D', '230603195507022338', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (840, '大庆公安局卧里屯分局', '支队一', '徐广宇', null, '18945602556', 'A1000012B82202', '230603197307082511', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (841, '大庆公安局卧里屯分局', '支队一', '张国', null, '18945602557', 'A1000012B82231', '23060319680503231X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (842, '大庆公安局卧里屯分局', '支队一', '廖道富', null, '18945602558', 'A1000012B8222A', '230603195408262694', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (843, '大庆公安局卧里屯分局', '支队一', '王长慧', null, '18945602559', 'A1000012B821F9', '230603197308102510', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (844, '大庆公安局卧里屯分局', '支队一', '邱彤', null, '18945602560', 'A1000012B8222F', '230603197507110214', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (845, '大庆公安局卧里屯分局', '支队一', '杨军', null, '18945602561', 'A1000012B8220C', '230603196106260911', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (846, '大庆公安局卧里屯分局', '支队一', '刘恒', null, '18945602562', 'A1000012B82260', '230602197611012116', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (847, '大庆公安局卧里屯分局', '支队一', '李迎辉', null, '18945602563', 'A1000012B82208', '230603196402132519', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (848, '大庆公安局卧里屯分局', '支队一', '李建伟', null, '18945602565', 'A1000012B7D1B9', '230603196311270035', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (849, '大庆公安局卧里屯分局', '支队一', '孙洪刚', null, '18945602568', 'A1000012B7D1BA', '230603197609102119', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (850, '大庆公安局卧里屯分局', '支队一', '鲁德成', null, '18945602569', 'A1000012B7D1D4', '230603196511221916', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (851, '大庆公安局卧里屯分局', '支队一', '杨英林', null, '18945602570', 'A1000012B7D1D2', '230603196512282518', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (852, '大庆公安局卧里屯分局', '支队一', '刘建利', null, '18945602571', 'A1000012B7D1B8', '230605196906102017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (853, '大庆公安局卧里屯分局', '支队一', '刘洋', null, '18945602572', 'A1000012B7D1BB', '230603197611180212', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (854, '大庆公安局卧里屯分局', '支队一', '王莹', null, '18945602573', 'A1000012B7D1B6', '230603197708240015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (855, '大庆公安局卧里屯分局', '支队一', '裴廷伟', null, '18945602575', 'A1000012B7D1B4', '230603196502281917', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (856, '大庆公安局卧里屯分局', '支队一', '王岩', null, '18945602576', 'A1000012B7D1E2', '230603197404150977', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (857, '大庆公安局卧里屯分局', '支队一', '曾照良', null, '18945602578', 'A1000012B7C327', '230603196004162317', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (858, '大庆公安局卧里屯分局', '支队一', '郑宝和', null, '18945602579', 'A1000012B7C445', '230603196609042318', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (859, '大庆公安局卧里屯分局', '支队一', '付新宇', null, '18945602580', 'A1000012B7C45A', '230603197412010210', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (860, '大庆公安局卧里屯分局', '支队一', '范守义', null, '18945602581', 'A1000012B7C403', '230603196501060215', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (861, '大庆公安局卧里屯分局', '支队一', '于来恩', null, '18945602582', 'A1000012B7C478', '230603197209212538', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (862, '大庆公安局卧里屯分局', '支队一', '唐立文', null, '18945602583', 'A1000012B7C459', '230603196412080011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (863, '大庆公安局卧里屯分局', '支队一', '林军', null, '18945602585', 'A1000012B7C455', '230603196310112350', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (864, '大庆公安局卧里屯分局', '支队一', '顾伟', null, '18945602586', 'A1000012B7C41F', '230603197003030034', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (865, '大庆公安局卧里屯分局', '支队一', '尚玉军', null, '18945602589', 'A1000012B7C329', '23060319650507231X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (866, '大庆公安局卧里屯分局', '支队一', '潘利民', null, '18945602590', 'A1000012B7C45B', '230603196602092312', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (867, '大庆公安局卧里屯分局', '支队一', '康英杰', null, '18945602591', 'A1000012B7C452', '230603197508040916', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (868, '大庆公安局卧里屯分局', '支队一', '黄文彪', null, '18945602592', 'A1000012B8225A', '230603195812102334', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (869, '大庆公安局卧里屯分局', '支队一', '才华', null, '18945602593', 'A1000012B82259', '230603196310142322', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (870, '大庆公安局卧里屯分局', '支队一', '何烈军', null, '18945602595', 'A1000012B8224A', '230603196212272318', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (871, '大庆公安局卧里屯分局', '支队一', '谷江伟', null, '18945602596', 'A1000012B82235', '230603197206060719', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (872, '大庆公安局卧里屯分局', '支队一', '张晓红', null, '18945602597', 'A1000012B82221', '230603196706111127', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (873, '大庆公安局卧里屯分局', '支队一', '陈少辉', null, '18945602598', 'A1000012B82216', '230603196306042310', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (874, '大庆公安局卧里屯分局', '支队一', '赵岩', null, '18945602601', 'A1000012B82234', '230603196504180212', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (875, '大庆公安局卧里屯分局', '支队一', '李建成', null, '18945602602', 'A1000012B8220D', '230603195405042354', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (876, '大庆公安局卧里屯分局', '支队一', '张凤柒', null, '18945602603', 'A1000012B8221A', '230603196501071918', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (877, '大庆公安局卧里屯分局', '支队一', '吴蕾', null, '18945602605', 'A1000012B8223B', '230603196501142122', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (878, '大庆公安局卧里屯分局', '支队一', '李松涛', null, '18945602606', 'A1000012B7D77A', '230603197705290930', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (879, '大庆公安局卧里屯分局', '支队一', '胡玉良', null, '18945602607', 'A1000012B7D76F', '230603196301171914', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (880, '大庆公安局卧里屯分局', '支队一', '黄珣', null, '18945602608', 'A1000012B7D76B', '230603196312052515', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (881, '大庆公安局卧里屯分局', '支队一', '王歆', null, '18945602609', 'A1000012B7D763', '230603197205082342', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (882, '大庆公安局卧里屯分局', '支队一', '杨永春', null, '18945602610', 'A1000012B7D76E', '230603196604141915', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (883, '大庆公安局卧里屯分局', '支队一', '刘继民', null, '18945602612', 'A1000012B7D76D', '230603195811292316', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (884, '大庆公安局卧里屯分局', '支队一', '杨以山', null, '18945602613', 'A1000012B7D764', '230603197302160939', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (885, '大庆公安局卧里屯分局', '支队一', '程诗芳', null, '18945602615', 'A1000012B7D767', '230603195306062317', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (886, '大庆公安局卧里屯分局', '支队一', '陈庆有', null, '18945602616', 'A1000012B7D711', '230603196408082356', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (887, '大庆公安局卧里屯分局', '支队一', '于晓臣', null, '18945602617', 'A1000012B7D6FC', '230602196308083013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (888, '大庆公安局卧里屯分局', '支队一', '张冠军', null, '18945602618', 'A1000012B7C32A', '230602196408203015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (889, '大庆公安局卧里屯分局', '支队一', '李宝昌', null, '18945602619', 'A1000012B7C4A2', '230603196308302358', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (890, '大庆公安局卧里屯分局', '支队一', '宋云超', null, '18945602620', 'A1000012B7C500', '230603196307291917', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (891, '大庆公安局卧里屯分局', '支队一', '张德明', null, '18945602621', 'A1000012B7C326', '230603196310300415', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (892, '大庆公安局卧里屯分局', '支队一', '杨凯', null, '18945602623', 'A1000012B7C4B9', '230605196208260819', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (893, '大庆公安局卧里屯分局', '支队一', '李兆峰', null, '18945602625', 'A1000012B7BEF6', '230603197507092511', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (894, '大庆公安局卧里屯分局', '支队一', '付建邦', null, '18945602627', 'A1000012B7C4E1', '23060519640618241X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (895, '大庆公安局卧里屯分局', '支队一', '季大勇', null, '18945602628', 'A1000012B7C4DD', '230603196403132334', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (972, '大庆公安局卧里屯分局', '支队一', '程燕', null, '18945602737', 'A1000012B82B2E', '23060319711111194X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (973, '大庆公安局卧里屯分局', '支队一', '于萍', null, '18945602738', 'A1000012B82B53', '230603197101210020', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (974, '大庆公安局卧里屯分局', '支队一', '徐忠伟', null, '18945602739', 'A1000012B82A9A', '230603196207082317', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (975, '大庆公安局卧里屯分局', '支队一', '林树滨', null, '18945602750', 'A1000012B82B8A', '230602196404260059', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (976, '大庆公安局卧里屯分局', '支队一', '蒋国忠', null, '18945602751', 'A1000012B82B4E', '230603195012272319', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (977, '大庆公安局卧里屯分局', '支队一', '马恒林', null, '18945602752', 'A1000012B82B4B', '230603195302020013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (978, '大庆公安局卧里屯分局', '支队一', '李广江', null, '18945602753', 'A1000012B829AF', '230603195405191915', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (981, '大庆公安局卧里屯分局', '支队一', '张洪程', null, '18945602758', 'A1000012B8282A', '230603195410052311', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (982, '大庆公安局卧里屯分局', '支队一', '祝明', null, '18945602759', 'A1000012B82635', '230603195708141915', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (983, '大庆公安局卧里屯分局', '支队一', '孙明琦', null, '18945602760', 'A1000012B829E2', '230603195304212334', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (984, '大庆市公安局', '支队一', '梁希明', null, '18945600011', 'A1000012B7C42C', '230602195112200615', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (985, '大庆市公安局', '支队一', '兰英杰', null, '18945600012', 'A1000012B7C409', '230602195108230010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (986, '大庆市公安局', '支队一', '蒋玉利', null, '18945600013', 'A1000012B7C40B', '23060219520308383X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (987, '大庆市公安局', '支队一', '韩秉发', null, '18945600015', 'A1000012B7C3DC', '230606195304165813', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (988, '大庆市公安局', '支队一', '刘连生', null, '18945600016', 'A1000012B7C446', '230602195502170415', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (989, '大庆市公安局', '支队一', '孙绍民', null, '18945600017', 'A1000012B7C34A', '230602196311270012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (990, '大庆市公安局', '支队一', '邓长兴', null, '18945600018', 'A1000012B7C3F0', '230602195302263852', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (991, '大庆市公安局', '支队一', '刘生民', null, '18945600019', 'A1000012B7C3DB', '230602195803013835', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (992, '大庆市公安局', '支队一', '李洪志', null, '18945600020', 'A1000012B7C408', '230606195112240030', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (993, '大庆市公安局', '支队一', '杨金才', null, '18945600021', 'A1000012B7C42F', '23060319520209113X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (994, '大庆市公安局', '支队一', '张玉文', null, '18945600022', 'A1000012B7C8C5', '230602195205313811', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (995, '大庆市公安局', '支队一', '盖兴斌', null, '18945600023', 'A1000012B7C8CB', '230602195211113859', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (996, '大庆市公安局', '支队一', '胡明才', null, '18945600025', 'A1000012B7C787', '230602195208240013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (979, '大庆公安局卧里屯分局', '支队一', '王立祥', null, '18945602756', 'A1000012B829BB', '230603196408041917', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (980, '大庆公安局卧里屯分局', '支队一', '金钢', null, '18945602757', 'A1000012B825A6', '230603196904101915', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (997, '大庆市公安局', '支队一', '吴洪志', null, '18945600026', 'A1000012B7C789', '230605195301200410', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (998, '大庆市公安局', '支队一', '李晓光', null, '18945600027', 'A1000012B7C8B2', '230623195311150034', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (999, '大庆市公安局', '支队一', '王树岐', null, '18945600028', 'A1000012B7C795', '230226195402220031', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1000, '大庆市公安局', '支队一', '王佩军', null, '18945600029', 'A1000012B7C94C', '230602195602106218', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1001, '大庆市公安局', '支队一', '吕刚', null, '18945600030', 'A1000012B7C893', '232329195512260217', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1002, '大庆市公安局', '支队一', '蒲英学', null, '18945600031', 'A1000012B7C93F', '230602195206100412', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1003, '大庆市公安局', '支队一', '张宪', null, '18945600103', 'A1000012B7C92C', '230602730607023', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1004, '大庆市公安局', '支队一', '张焕峰', null, '18945600105', 'A1000012B7FEC1', '232126197109090376', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1005, '大庆市公安局', '支队一', '佟丽伟', null, '18945600106', 'A1000012B82BF5', '23060219770314022X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1006, '大庆市公安局', '支队一', '于迎春', null, '18945600107', 'A1000012B82C6C', '232328760201812', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1007, '大庆市公安局', '支队一', '马平', null, '18945600108', 'A1000012B82C5C', '230602197003231921', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1008, '大庆市公安局', '支队一', '王明', null, '18945600109', 'A1000012B82F4C', '230602781202215', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1009, '大庆市公安局', '支队一', '袁晓辉', null, '18945600110', 'A1000012B82F4A', '230603198107170554', '0', '0', null, null);
commit;
prompt 1301 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1010, '大庆市公安局', '支队一', '董颖', null, '18945600116', 'A1000012B82F06', '230602196004241924', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1011, '大庆市公安局', '支队一', '王雪莲', null, '18945611117', 'A1000012B82F1A', '230603197706130584', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1012, '大庆市公安局', '支队一', '刘雅丽', null, '18945600118', 'A1000012B82F02', '23060219691021192X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1013, '大庆市公安局', '支队一', '张振祥', null, '18945600119', 'A1000012B82F33', '222302690227053', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1014, '大庆市公安局', '支队一', '刘洪斌', null, '18945611118', 'A1000012B7D35C', '232321197309059014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1015, '大庆市公安局', '支队一', '赵勇', null, '18945600167', 'A1000012B7D359', '230602197803300219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1016, '大庆市公安局', '支队一', '张丽亚', null, '18945600456', 'A1000012B7D380', '230602601111044', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1017, '大庆市公安局', '支队一', '王伟', null, '18945600301', 'A1000012B7D39E', '230604196402270053', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1018, '大庆市公安局', '支队一', '岳峰', null, '18945600302', 'A1000012B7D3D2', '230604198002154116', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1019, '大庆市公安局', '支队一', '李晓军', null, '18945600305', 'A1000012B7D37A', '230602196601221016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1020, '大庆市公安局', '支队一', '孙辉', null, '18945600306', 'A1000012B7D385', '230604197412243037', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1021, '大庆市公安局', '支队一', '靳长青', null, '18945600308', 'A1000012B7D35D', '230602197212220014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1022, '大庆市公安局', '支队一', '张伟', null, '18945600309', 'A1000012B7D37D', '23060219710917251X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1023, '大庆市公安局', '支队一', '左仲林', null, '18945600315', 'A1000012B7E8E6', '230105197406070511', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1024, '大庆市公安局', '支队一', '王洪星', null, '18945600317', 'A1000012B7EAA0', '230107197312212470', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1025, '大庆市公安局', '支队一', '张建华', null, '18945600319', 'A1000012B7EC7D', '230606197401115956', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1026, '大庆市公安局', '支队一', '田一', null, '18945600321', 'A1000012B7E8DD', '230602197205011613', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1027, '大庆市公安局', '支队一', '张秋林', null, '18945600330', 'A1000012B7E8E7', '230229197208080037', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1028, '大庆市公安局', '支队一', '辛健', null, '18945600335', 'A1000012B7ECFD', '230602197505184010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1029, '大庆市公安局', '支队一', '史本放', null, '18945600336', 'A1000012B7ECEB', '230602197006021014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1030, '大庆市公安局', '支队一', '李守亮', null, '18945600338', 'A1000012B7E8DF', '23060219780227213X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1031, '大庆市公安局', '支队一', '刘锋', null, '18945600339', 'A1000012B7ED21', '230602197601242110', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1032, '大庆市公安局', '支队一', '刘秋梅', null, '18945600056', 'A1000012B7EA5D', '230621198104260282', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1033, '大庆市公安局', '支队一', '彭彦文', null, '18945600058', 'A1000012B82C96', '23022219700305181X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1034, '大庆市公安局', '支队一', '王爽', null, '18945600059', 'A1000012B82CF9', '239005198109043143', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1035, '大庆市公安局', '支队一', '周爱英', null, '18945600060', 'A1000012B82BC8', '230603196109021123', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1036, '大庆市公安局', '支队一', '吴长江', null, '18945600063', 'A1000012B82D27', '230602196707061938', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1037, '大庆市公安局', '支队一', '李成乾', null, '18945600065', 'A1000012B82C6A', '230602196903274017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1038, '大庆市公安局', '支队一', '王志刚', null, '18945600066', 'A1000012B82D74', '230602197410175736', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1039, '大庆市公安局', '支队一', '赵光辉', null, '18945600067', 'A1000012B82DB5', '230604196410070828', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1040, '大庆市公安局', '支队一', '费洪涛', null, '18945600068', 'A1000012B82C87', '230602197809102512', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1041, '大庆市公安局', '支队一', '孙雪冰', null, '18945600069', 'A1000012B82D0B', '230823197904040417', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1042, '大庆市公安局', '支队一', '赵成雷', null, '18945600070', 'A1000012B82D5B', '230602197403244457', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1043, '大庆市公安局', '支队一', '曹双', null, '18945600071', 'A1000012B7CFB2', '23060219540909231X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1044, '大庆市公安局', '支队一', '鲁达', null, '18945600073', 'A1000012B7CFAE', '230203196909022333', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1045, '大庆市公安局', '支队一', '麻晓光', null, '18945600076', 'A1000012B7D000', '230604197408080212', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1046, '大庆市公安局', '支队一', '马姝慧', null, '18945600077', 'A1000012B7D001', '230604197011154121', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1047, '大庆市公安局', '支队一', '王健', null, '18945600078', 'A1000012B7D067', '230603197901211371', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1048, '大庆市公安局', '支队一', '张新宝', null, '18945600079', 'A1000012B7D05F', '230602197912283630', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1049, '大庆市公安局', '支队一', '张晓燕', null, '18945600080', 'A1000012B7CF98', '230602197311217523', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1050, '大庆市公安局', '支队一', '高振波', null, '18945600081', 'A1000012B7D006', '230602197311060618', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1051, '大庆市公安局', '支队一', '张生', null, '18945600082', 'A1000012B7CFB9', '230602195201023411', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (1582, '12', '12', '12', '12', '12', '12', '12', '12', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (896, '大庆公安局卧里屯分局', '支队一', '孟柏石', null, '18945602629', 'A1000012B7C4EE', '230602196703211978', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (897, '大庆公安局卧里屯分局', '支队一', '王绍军', null, '18945602630', 'A1000012B7C4AA', '230603196208013516', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (898, '大庆公安局卧里屯分局', '支队一', '于雷', null, '18945602631', 'A1000012B7F244', '230603197209222314', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (899, '大庆公安局卧里屯分局', '支队一', '高锐', null, '18945602632', 'A1000012B7F247', '230603196802071110', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (900, '大庆公安局卧里屯分局', '支队一', '张文军', null, '18945602635', 'A1000012B7F14E', '230603196006022393', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (901, '大庆公安局卧里屯分局', '支队一', '崔庆', null, '18945602636', 'A1000012B7F254', '230603197409020231', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (902, '大庆公安局卧里屯分局', '支队一', '杨建秋', null, '18945602637', 'A1000012B7F22C', '230603196308302331', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (903, '大庆公安局卧里屯分局', '支队一', '邢克兵', null, '18945602638', 'A1000012B7F246', '230602196311301516', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (904, '大庆公安局卧里屯分局', '支队一', '刘喜和', null, '18945602639', 'A1000012B7F21D', '230603195302011918', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (905, '大庆公安局卧里屯分局', '支队一', '刁振全', null, '18945602648', 'A1000012B7F12F', '230603196303052310', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (906, '大庆公安局卧里屯分局', '支队一', '王英超', null, '18945602650', 'A1000012B7F245', '230603195812011918', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (907, '大庆公安局卧里屯分局', '支队一', '娄明欣', null, '18945602651', 'A1000012B7F24E', '230603197405062119', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (908, '大庆公安局卧里屯分局', '支队一', '赵小军', null, '18945602652', 'A1000012B8205E', '230603196305030019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (909, '大庆公安局卧里屯分局', '支队一', '魏朝成', null, '18945602653', 'A1000012B81FCF', '230603196402241934', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (910, '大庆公安局卧里屯分局', '支队一', '杨国发', null, '18945602656', 'A1000012B820D0', '230603195406203332', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (911, '大庆公安局卧里屯分局', '支队一', '刘利民', null, '18945602657', 'A1000012B8299D', '230603196405212397', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (912, '大庆公安局卧里屯分局', '支队一', '白建军', null, '18945602658', 'A1000012B81E74', '230603196410072395', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (913, '大庆公安局卧里屯分局', '支队一', '李志清', null, '18945602659', 'A1000012B81F73', '230603196104202339', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (914, '大庆公安局卧里屯分局', '支队一', '赵宝金', null, '18945602660', 'A1000012B82129', '230603196604141931', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (915, '大庆公安局卧里屯分局', '支队一', '金要华', null, '18945602661', 'A1000012B82114', '230603196504022353', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (916, '大庆公安局卧里屯分局', '支队一', '梁凤彬', null, '18945602662', 'A1000012B81E87', '230603196010011910', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (917, '大庆公安局卧里屯分局', '支队一', '王立成', null, '18945602663', 'A1000012B8297D', '230603195109272331', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (918, '大庆公安局卧里屯分局', '支队一', '金玉喜', null, '18945602665', 'A1000012B822A0', '230603196405181914', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (919, '大庆公安局卧里屯分局', '支队一', '卢叶才', null, '18945602667', 'A1000012B8229C', '230604196506080019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (920, '大庆公安局卧里屯分局', '支队一', '孙洪涛', null, '18945602668', 'A1000012B822A4', '230603197704172131', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (921, '大庆公安局卧里屯分局', '支队一', '刘忠田', null, '18945602669', 'A1000012B82247', '230603196404100019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (922, '大庆公安局卧里屯分局', '支队一', '季洪彬', null, '18945602670', 'A1000012B82299', '230603196309052311', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (923, '大庆公安局卧里屯分局', '支队一', '谢庆利', null, '18945602671', 'A1000012B8229F', '230604197010040034', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (924, '大庆公安局卧里屯分局', '支队一', '于国峰', null, '18945602672', 'A1000012B822A8', '230603196407062310', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (925, '大庆公安局卧里屯分局', '支队一', '张云福', null, '18945602673', 'A1000012B82239', '230603195403052313', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (926, '大庆公安局卧里屯分局', '支队一', '张昫', null, '18945602675', 'A1000012B822A1', '230603197608123727', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (927, '大庆公安局卧里屯分局', '支队一', '邢真君', null, '18945602676', 'A1000012B822AD', '230603195609023315', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (928, '大庆公安局卧里屯分局', '支队一', '徐丰', null, '18945602679', 'A1000012B7D1D6', '230603196401243516', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (929, '大庆公安局卧里屯分局', '支队一', '李化金', null, '18945602680', 'A1000012B7D1EA', '230603196703082316', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (930, '大庆公安局卧里屯分局', '支队一', '王健', null, '18945602681', 'A1000012B7D1E4', '230603197306262510', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (931, '大庆公安局卧里屯分局', '支队一', '石正可', null, '18945602682', 'A1000012B7D1F1', '230603196401231910', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (932, '大庆公安局卧里屯分局', '支队一', '赵建新', null, '18945602683', 'A1000012B7D1EE', '230603196505061119', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (933, '大庆公安局卧里屯分局', '支队一', '葛晓庆', null, '18945602685', 'A1000012B7D1F4', '230603195309210012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (934, '大庆公安局卧里屯分局', '支队一', '李景顺', null, '18945602686', 'A1000012B7D103', '230603195506080018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (935, '大庆公安局卧里屯分局', '支队一', '张宝太', null, '18945602687', 'A1000012B7D0F5', '230603195309251957', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (936, '大庆公安局卧里屯分局', '支队一', '王庆斌', null, '18945602689', 'A1000012B7D0F6', '230603196310233312', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (937, '大庆公安局卧里屯分局', '支队一', '许振文', null, '18945602690', 'A1000012B7D1F0', '230603195611052318', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (938, '大庆公安局卧里屯分局', '支队一', '李立群', null, '18945602691', 'A1000012B83014', '230603196304133315', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (939, '大庆公安局卧里屯分局', '支队一', '张申', null, '18945602692', 'A1000012B83013', '230603196409091916', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (940, '大庆公安局卧里屯分局', '支队一', '刘育洁', null, '18945602693', 'A1000012B82C9C', '230603197308272544', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (941, '大庆公安局卧里屯分局', '支队一', '孙爱国', null, '18945602695', 'A1000012B82C73', '23060319731018253X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (942, '大庆公安局卧里屯分局', '支队一', '佟晓忠', null, '18945602696', 'A1000012B82C9D', '230603196510032312', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (943, '大庆公安局卧里屯分局', '支队一', '仇成太', null, '18945602697', 'A1000012B83006', '230603196304152313', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (944, '大庆公安局卧里屯分局', '支队一', '谭兴洲', null, '18945602698', 'A1000012B82CA3', '230603195810082317', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (945, '大庆公安局卧里屯分局', '支队一', '刘仁', null, '18945602701', 'A1000012B82C94', '230603196107292333', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (946, '大庆公安局卧里屯分局', '支队一', '韩欣', null, '18945602702', 'A1000012B82C8D', '230603195404080033', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (947, '大庆公安局卧里屯分局', '支队一', '李岩', null, '18945602703', 'A1000012B82C7D', '23060219650718081X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (948, '大庆公安局卧里屯分局', '支队一', '常树学', null, '18945602705', 'A1000012B829A8', '230603196504161919', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (949, '大庆公安局卧里屯分局', '支队一', '张忠孝', null, '18945602706', 'A1000012B829BD', '230603195503082333', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (950, '大庆公安局卧里屯分局', '支队一', '李伯敬', null, '18945602707', 'A1000012B824F6', '230603195310060015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (951, '大庆公安局卧里屯分局', '支队一', '赵景茹', null, '18945602708', 'A1000012B82814', '230603195910233514', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (952, '大庆公安局卧里屯分局', '支队一', '韩力', null, '18945602709', 'A1000012B829C8', '230603196101302318', '0', '0', null, null);
commit;
prompt 1401 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (953, '大庆公安局卧里屯分局', '支队一', '韩爽', null, '18945602710', 'A1000012B829BF', '230603197506203726', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (954, '大庆公安局卧里屯分局', '支队一', '刘向东', null, '18945602713', 'A1000012B8283C', '230603196509162515', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (955, '大庆公安局卧里屯分局', '支队一', '丁志强', null, '18945602715', 'A1000012B82823', '230603197207012516', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (956, '大庆公安局卧里屯分局', '支队一', '何凤武', null, '18945602716', 'A1000012B829BA', '230603196107022536', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (957, '大庆公安局卧里屯分局', '支队一', '冯树林', null, '18945602717', 'A1000012B827F8', '230603195612100916', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (958, '大庆公安局卧里屯分局', '支队一', '刘宝林', null, '18945602718', 'A1000012B7D39A', '230603196310073515', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (959, '大庆公安局卧里屯分局', '支队一', '刘艳萍', null, '18945602719', 'A1000012B7D36B', '230603196803180028', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (960, '大庆公安局卧里屯分局', '支队一', '王文举', null, '18945602720', 'A1000012B7D353', '230603196507150019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (961, '大庆公安局卧里屯分局', '支队一', '田野', null, '18945602721', 'A1000012B7D39D', '230603197102221119', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (962, '大庆公安局卧里屯分局', '支队一', '刘国章', null, '18945602723', 'A1000012B7D355', '230603195810092312', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (963, '大庆公安局卧里屯分局', '支队一', '赵新伟', null, '18945602725', 'A1000012B7D32B', '230603196205090719', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (964, '大庆公安局卧里屯分局', '支队一', '任良军', null, '18945602726', 'A1000012B7D37F', '230603196508082513', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (965, '大庆公安局卧里屯分局', '支队一', '赵伟庆', null, '18945602728', 'A1000012B7D379', '230603198105023315', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (966, '大庆公安局卧里屯分局', '支队一', '王龙', null, '18945602729', 'A1000012B7D354', '230603195608142515', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (967, '大庆公安局卧里屯分局', '支队一', '张爱民', null, '18945602730', 'A1000012B7D36F', '230603196210122316', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (968, '大庆公安局卧里屯分局', '支队一', '李平', null, '18945602731', 'A1000012B82B7C', '230603196404082324', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (969, '大庆公安局卧里屯分局', '支队一', '唐亚萍', null, '18945602732', 'A1000012B82B45', '230603195911022321', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (970, '大庆公安局卧里屯分局', '支队一', '祝莉宁', null, '18945602735', 'A1000012B82BA6', '230603197403193721', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (971, '大庆公安局卧里屯分局', '支队一', '刘粤', null, '18945602736', 'A1000012B82B5B', '230603196303182326', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (576, '大庆公安局高新区分局', '高新区分局', '韩玉泽', null, '18945602389', 'A1000012B8239F', '230602730303021', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (577, '大庆公安局高新区分局', '高新区分局', '杨其伟', null, '18945602390', 'A1000012B83253', '230602811015403', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (578, '大庆公安局高新区分局', '高新区分局', '郝光', null, '18945602391', 'A1000012B82F4B', '232328740902007', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (579, '大庆公安局高新区分局', '高新区分局', '宋立辉', null, '18945602392', 'A1000012B82D08', '230602197207110419', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (580, '大庆公安局高新区分局', '高新区分局', '韩伟庆', null, '18945602393', 'A1000012B82F8C', '230602197012110013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (581, '大庆公安局高新区分局', '高新区分局', '李建军', null, '18945602398', 'A1000012B82F5A', '230605780801101', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (582, '大庆公安局高新区分局', '高新区分局', '袁良辉', null, '18945602399', 'A1000012B82F47', '230606197809222050', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (583, '大庆公安局高新区分局', '高新区分局', '沈淑娥', null, '18945602400', 'A1000012B82F32', '230602196103190026', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (584, '大庆公安局高新区分局', '高新区分局', '石磊', null, '18945602402', 'A1000012B82F55', '230602197302137150', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (585, '大庆公安局高新区分局', '高新区分局', '李国强', null, '18945602403', 'A1000012B7F9B3', '230602197503204014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (586, '大庆公安局高新区分局', '高新区分局', '郑继光', null, '18945602405', 'A1000012B82F5C', '230605195609050412', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (587, '大庆公安局高新区分局', '高新区分局', '侯喜峰', null, '18945602407', 'A1000012B7F78E', '230107197611262478', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (588, '大庆公安局高新区分局', '高新区分局', '郭力', null, '18945602408', 'A1000012B7D727', '230602196911151957', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (589, '大庆公安局高新区分局', '高新区分局', '孙铁军', null, '18945602409', 'A1000012B7C499', '232301701027031', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (590, '大庆公安局高新区分局', '高新区分局', '景志宏', null, '18945602410', 'A1000012B7C530', '230602197003283019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (591, '大庆公安局高新区分局', '高新区分局', '赵立君', null, '18945600848', 'A1000012B8226D', '230602196601010817', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (592, '大庆公安局高新区分局', '高新区分局', '张立林', null, '18945602412', 'A1000012B7C515', '230605681007243', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (593, '大庆公安局高新区分局', '高新区分局', '张耀旭', null, '18945602413', 'A1000012B7BA96', '230602197204013212', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (594, '大庆公安局高新区分局', '高新区分局', '付焱', null, '18945602415', 'A1000012B7495D', '23060219770726211X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (595, '大庆公安局高新区分局', '高新区分局', '雷承宇', null, '18945602416', 'A1000012B7C4F2', '230604196203231625', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (596, '大庆公安局高新区分局', '高新区分局', '吴军', null, '18945602417', 'A1000012B7C52A', '230603196106020010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (597, '大庆公安局高新区分局', '高新区分局', '王京', null, '18945602436', 'A1000012B7C516', '152104195509110615', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (598, '大庆公安局高新区分局', '高新区分局', '孙海涛', null, '18945602437', 'A1000012B7C4D9', '230602197906204019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (599, '大庆公安局高新区分局', '高新区分局', '韩少青', null, '18945602438', 'A1000012B7C50E', '230602196508250816', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (600, '大庆公安局高新区分局', '高新区分局', '刘鹏', null, '18945600850', 'A1000012B7C4D2', '230602197511173617', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (601, '大庆公安局高新区分局', '高新区分局', '张来顺', null, '18945602451', 'A1000012B7F7FA', '230602195612290813', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (602, '大庆公安局高新区分局', '高新区分局', '高凤哗', null, '18945602453', 'A1000012B7F77D', '230602670912194', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (603, '大庆公安局高新区分局', '高新区分局', '丁志刚', null, '18945602455', 'A1000012B8312E', '230602197105046217', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (604, '大庆公安局高新区分局', '高新区分局', '孙雪峰', null, '18945602456', 'A1000012B8323B', '230606197812010219', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (605, '大庆公安局高新区分局', '高新区分局', '任传宝', null, '18945602458', 'A1000012B807AE', '230602720812545', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (606, '大庆公安局高新区分局', '高新区分局', '陈占山', null, '18945602459', 'A1000012B7C10D', '230602571031341', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (607, '大庆公安局高新区分局', '高新区分局', '祝继军', null, '18945602460', 'A1000012B8312D', '230604197008262017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (608, '大庆公安局高新区分局', '高新区分局', '吕冰', null, '18945602461', 'A1000012B83125', '230602621211191', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (609, '大庆公安局高新区分局', '高新区分局', '祝有希', null, '18945602462', 'A1000012B83117', '230603195711283017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (610, '大庆公安局高新区分局', '高新区分局', '郭耀飞', null, '18945602463', 'A1000012B831FF', '230602810525545', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (611, '大庆公安局高新区分局', '高新区分局', '高海连', null, '18945602465', 'A1000012B83250', '230604197308144717', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (612, '大庆公安局高新区分局', '高新区分局', '宋慧娟', null, '18945602466', 'A1000012B83129', '23232619691023102X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (613, '大庆公安局高新区分局', '高新区分局', '王桂英', null, '18945602467', 'A1000012B82D8D', '230605196212140027', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (614, '大庆公安局高新区分局', '高新区分局', '唐立明', null, '18945602468', 'A1000012B82C75', '230604198306040230', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (615, '大庆公安局高新区分局', '高新区分局', '梁利', null, '18945602469', 'A1000012B820F0', '230603196409101117', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (616, '大庆公安局高新区分局', '高新区分局', '代军', null, '18945602470', 'A1000012B820BF', '230602790206171', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (617, '大庆公安局高新区分局', '高新区分局', '刘方海', null, '18945602471', 'A1000012B81E4B', '230603551101301', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (618, '大庆公安局高新区分局', '高新区分局', '刘方爱', null, '18945602472', 'A1000012B829AD', '230603600523301', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (619, '大庆公安局高新区分局', '高新区分局', '郭长久', null, '18945602473', 'A1000012B81F3A', '230602661207191', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (620, '大庆公安局高新区分局', '高新区分局', '宋国臣', null, '18945602475', 'A1000012B81CCC', '230606197407140853', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (621, '大庆公安局高新区分局', '高新区分局', '张海斌', null, '18945602386', 'A1000012B81C2A', '230602661030361', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (622, '大庆公安局高新区分局', '高新区分局', '乔春来', null, '18945602478', 'A1000012B829A2', '230226780120201', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (623, '大庆公安局高新区分局', '高新区分局', '王才慧', null, '18945602479', 'A1000012B82B7B', '230602197401205710', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (624, '大庆公安局高新区分局', '高新区分局', '杨波', null, '18945602480', 'A1000012B82B3F', '230602195205120016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (625, '大庆公安局高新区分局', '高新区分局', '孙晓峰', null, '18945602481', 'A1000012B82B76', '230602195903023033', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (626, '大庆公安局高新区分局', '高新区分局', '李丽', null, '18945602482', 'A1000012B82B83', '230602660818402', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (627, '大庆公安局高新区分局', '高新区分局', '孙景宏', null, '18945602483', 'A1000012B82B59', '230604197309173042', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (628, '大庆公安局高新区分局', '高新区分局', '于巍巍', null, '18945602485', 'A1000012B82B28', '230602197806040627', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (629, '大庆公安局高新区分局', '高新区分局', '徐兰佳', null, '18945602486', 'A1000012B82B3D', '230602810710712', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (630, '大庆公安局高新区分局', '高新区分局', '张敬婷', null, '18945602487', 'A1000012B82B19', '23060219790125624X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (631, '大庆公安局高新区分局', '高新区分局', '王娟', null, '18945602488', 'A1000012B82B6B', '23060519681022022X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (632, '大庆公安局高新区分局', '高新区分局', '徐丹', null, '18945602489', 'A1000012B82B55', '230602790731444', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (633, '大庆公安局高新区分局', '高新区分局', '伊文革', null, '18945602499', 'A1000012B82C91', '23060219650303441X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (634, '大庆公安局高新区分局', '高新区分局', '刘丽萍', null, '18945602500', 'A1000012B82F3B', '23212519720302364X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (635, '大庆公安局高新区分局', '高新区分局', '孙化呈', null, '18945602333', 'A1000012B824D1', '230603196509040411', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (636, '大庆公安局高新区分局', '高新区分局', '王磊', null, '18945602262', 'A1000012B7D725', '230604198109052259', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (637, '大庆公安局高新区分局', '高新区分局', '关明裕', null, '18945602308', 'A1000012B7F809', '230602670314081', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (638, '龙凤分局', '龙凤分局', '赵兴洋', null, '18945600113', 'A1000012B7D1E0', '23060219751216021X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (639, '龙凤分局', '龙凤分局', '赵志惠', null, '18945601735', 'A1000012B7D1D7', '230603196401260017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (640, '龙凤分局', '龙凤分局', '于海波', null, '18945601737', 'A1000012B7D1D1', '232623197010266018', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (641, '龙凤分局', '龙凤分局', '吕永胜', null, '18945601738', 'A1000012B7D0EE', '23060219700712383X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (642, '龙凤分局', '龙凤分局', '郝群诗', null, '18945601739', 'A1000012B7D1DF', '230603197205300012', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (643, '龙凤分局', '龙凤分局', '袁士忠', null, '18945601750', 'A1000012B7D200', '230602197409094453', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (644, '龙凤分局', '龙凤分局', '杜建伟', null, '18945601751', 'A1000012B7D1E3', '230605197502091037', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (645, '龙凤分局', '龙凤分局', '臧美刚', null, '18945601752', 'A1000012B7D1DC', '230603197111051115', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (646, '龙凤分局', '龙凤分局', '王泽民', null, '18945601753', 'A1000012B7D1DD', '230603197912270916', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (647, '龙凤分局', '龙凤分局', '白冰', null, '18945601755', 'A1000012B7D1BC', '230603197911290210', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (648, '龙凤分局', '龙凤分局', '张鹏', null, '18945601756', 'A1000012B8292E', '230602196812121971', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (649, '龙凤分局', '龙凤分局', '强伟', null, '18945601757', 'A1000012B82996', '230603198203092111', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (650, '龙凤分局', '龙凤分局', '孙立生', null, '18945601758', 'A1000012B82998', '230603196505011111', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (651, '龙凤分局', '龙凤分局', '刘光锋', null, '18945601759', 'A1000012B8298A', '23060219680722591X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (652, '龙凤分局', '龙凤分局', '张天德', null, '18945601760', 'A1000012B8292D', '230603196406280017', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (653, '龙凤分局', '龙凤分局', '王健', null, '18945601761', 'A1000012B82962', '232325196710110614', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (654, '龙凤分局', '龙凤分局', '孙宏伟', null, '18945601762', 'A1000012B82995', '230604197104020034', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (655, '龙凤分局', '龙凤分局', '崔宇', null, '18945601763', 'A1000012B82597', '230603198405070914', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (656, '龙凤分局', '龙凤分局', '鲍晓娜', null, '18945601765', 'A1000012B829AA', '230603197701043721', '0', '0', null, null);
commit;
prompt 1501 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (657, '龙凤分局', '龙凤分局', '孙晓东', null, '18945601766', 'A1000012B8298D', '230603197710162511', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (658, '龙凤分局', '龙凤分局', '王一兵', null, '18945601767', 'A1000012B7BEFB', '230603197711052146', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (659, '龙凤分局', '龙凤分局', '董艳淘', null, '18945601768', 'A1000012B7C4B5', '23060319780702254X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (660, '龙凤分局', '龙凤分局', '高彦波', null, '18945601769', 'A1000012B7C363', '230602196603233630', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (661, '龙凤分局', '龙凤分局', '屈晓刚', null, '18945601770', 'A1000012B7C4A4', '230604197104020034', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (662, '龙凤分局', '龙凤分局', '任静媛', null, '18945601771', 'A1000012B7C514', '230103197307102925', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (663, '龙凤分局', '龙凤分局', '赵云武', null, '18945601772', 'A1000012B7D10A', '230603196404050736', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (664, '龙凤分局', '龙凤分局', '李凤英', null, '18945601773', 'A1000012B7D204', '230602196805091962', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (665, '龙凤分局', '龙凤分局', '付磊', null, '18945601775', 'A1000012B7D207', '230603197804123716', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (666, '龙凤分局', '龙凤分局', '杜光宇', null, '18945601776', 'A1000012B7D175', '230503196712180051', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (667, '龙凤分局', '龙凤分局', '孙恒利', null, '18945600038', 'A1000012B7C4B6', '230602196604191916', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (668, '龙凤分局', '龙凤分局', '姜苗', null, '18945601779', 'A1000012B8227B', '230603195304091114', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (669, '龙凤分局', '龙凤分局', '张玉军', null, '18945601780', 'A1000012B82274', '230603196911150213', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (670, '龙凤分局', '龙凤分局', '苏巍', null, '18945601781', 'A1000012B822BF', '230603197505253318', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (671, '龙凤分局', '龙凤分局', '赵永保', null, '18945601782', 'A1000012B822C3', '230603195408241113', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (672, '龙凤分局', '龙凤分局', '吴海龙', null, '18945601783', 'A1000012B82271', '23062119771215215X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (673, '龙凤分局', '龙凤分局', '高国权', null, '18945601785', 'A1000012B8225F', '23060319550128111X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (674, '龙凤分局', '龙凤分局', '邹佰文', null, '18945601786', 'A1000012B82281', '23060319640828111X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (675, '龙凤分局', '龙凤分局', '于松寒', null, '18945601787', 'A1000012B822C6', '230603196306240712', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (676, '龙凤分局', '龙凤分局', '连德育', null, '18945601788', 'A1000012B822C9', '230602196002204214', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (677, '龙凤分局', '龙凤分局', '孔箐莹', null, '18945601789', 'A1000012B822B1', '230602196802151931', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (678, '龙凤分局', '龙凤分局', '华长城', null, '18945601790', 'A1000012B7CFB6', '230603197607124314', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (679, '龙凤分局', '龙凤分局', '梁斌', null, '18945601796', 'A1000012B7D002', '230603197910092116', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (680, '龙凤分局', '龙凤分局', '张春艳', null, '18945601797', 'A1000012B7D00C', '230602196403241243', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (681, '龙凤分局', '龙凤分局', '李毅刚', null, '18945601798', 'A1000012B7D003', '230602196808141937', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (682, '龙凤分局', '龙凤分局', '郑绪军', null, '18945601799', 'A1000012B7D087', '230603197411101313', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (683, '龙凤分局', '龙凤分局', '范玲', null, '18945601800', 'A1000012B7CF91', '230603196210170027', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (684, '龙凤分局', '龙凤分局', '张忠实', null, '18945601801', 'A1000012B7CFAD', '230603195702071119', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (685, '龙凤分局', '龙凤分局', '李泽和', null, '18945601802', 'A1000012B7CFA7', '230603196203050019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (686, '龙凤分局', '龙凤分局', '郑刚', null, '18945601803', 'A1000012B7CFAB', '230603196407160711', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (687, '龙凤分局', '龙凤分局', '杜召胜', null, '18945601805', 'A1000012B7D073', '230603197007201734', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (688, '龙凤分局', '龙凤分局', '吕纯元', null, '18945601806', 'A1000012B82D7D', '230603196102051119', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (689, '龙凤分局', '龙凤分局', '刘海虹', null, '18945601807', 'A1000012B82C34', '23010319680529462X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (690, '龙凤分局', '龙凤分局', '李宏军', null, '18945601808', 'A1000012B82DCD', '230603195705040713', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (691, '龙凤分局', '龙凤分局', '马云峰', null, '18945601809', 'A1000012B82D78', '230603196407010019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (692, '龙凤分局', '龙凤分局', '黄灵双', null, '18945601810', 'A1000012B82D85', '230603196412210736', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (693, '龙凤分局', '龙凤分局', '纪世国', null, '18945601811', 'A1000012B82D82', '230603195302200030', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (694, '龙凤分局', '龙凤分局', '彭征强', null, '18945601812', 'A1000012B82DD3', '230602196411083417', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (695, '龙凤分局', '龙凤分局', '段国忠', null, '18945601815', 'A1000012B82C86', '230604196503112011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (696, '龙凤分局', '龙凤分局', '纪兰涛', null, '18945601816', 'A1000012B82CAE', '230606196502220013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (697, '龙凤分局', '龙凤分局', '张森', null, '18945601817', 'A1000012B82DF4', '230603196311261139', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (698, '龙凤分局', '龙凤分局', '梁华', null, '18945601818', 'A1000012B75C58', '230721197104293114', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (699, '龙凤分局', '龙凤分局', '张莉', null, '18945601819', 'A1000012B76B2F', '230603196802161140', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (700, '龙凤分局', '龙凤分局', '芦找仁', null, '18945601820', 'A1000012B76B01', '230603195204130016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (701, '龙凤分局', '龙凤分局', '杨鑫', null, '18945601821', 'A1000012B78C12', '230603197710210245', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (702, '龙凤分局', '龙凤分局', '尉景龙', null, '18945601823', 'A1000012B78CBF', '230603196509231314', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (703, '龙凤分局', '龙凤分局', '薛伏生', null, '18945601825', 'A1000012B7B61A', '230603197207200015', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (704, '龙凤分局', '龙凤分局', '许凤君', null, '18945601827', 'A1000012B7B228', '230603196103180019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (705, '龙凤分局', '龙凤分局', '段树江', null, '18945601828', 'A1000012B7BA1F', '230603196303081111', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (706, '龙凤分局', '龙凤分局', '朱海', null, '18945601829', 'A1000012B78BA4', '230603195111100010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (707, '龙凤分局', '龙凤分局', '岳金环', null, '18945601833', 'A1000012B7B6AC', '230603196408240422', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (708, '龙凤分局', '龙凤分局', '顾大鹏', null, '18945601835', 'A1000012B7F258', '230602196303020419', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (709, '龙凤分局', '龙凤分局', '胡君君', null, '18945601836', 'A1000012B7F10F', '230602198111024019', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (710, '龙凤分局', '龙凤分局', '蒋德忠', null, '18945601837', 'A1000012B7F3C6', '230603196007242312', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (711, '龙凤分局', '龙凤分局', '牛德平', null, '18945600050', 'A1000012B7F1CA', '230603196905072319', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (712, '龙凤分局', '龙凤分局', '邢建', null, '18945601842', 'A1000012B7F226', '230603196309031932', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (713, '龙凤分局', '龙凤分局', '刘德校', null, '18945601845', 'A1000012B7F03D', '230603196307031373', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (714, '龙凤分局', '龙凤分局', '王怀杰', null, '18945601846', 'A1000012B7F1D8', '230604195807050812', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (715, '龙凤分局', '龙凤分局', '佟忠满', null, '18945601849', 'A1000012B7F240', '230603196201163419', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (716, '龙凤分局', '龙凤分局', '史海峰', null, '18945601850', 'A1000012B7F036', '230621198107140016', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (717, '龙凤分局', '龙凤分局', '周静媛', null, '18945601851', 'A1000012B7F1E4', '230603196503091920', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (718, '龙凤分局', '龙凤分局', '孙德友', null, '18945601852', 'A1000012B82B58', '23060419720825381X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (719, '龙凤分局', '龙凤分局', '沈秀年', null, '18945601853', 'A1000012B82C79', '230604196706100010', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (720, '龙凤分局', '龙凤分局', '栾立业', null, '18945601855', 'A1000012B82C6E', '230604196312090817', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (721, '龙凤分局', '龙凤分局', '李长海', null, '18945601856', 'A1000012B82C31', '230603196411230014', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (722, '龙凤分局', '龙凤分局', '齐胜利', null, '18945601858', 'A1000012B82DC2', '230603197301120919', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (723, '龙凤分局', '龙凤分局', '杨林', null, '18945601859', 'A1000012B82DBD', '23060319600307055X', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (724, '龙凤分局', '龙凤分局', '张荣第', null, '18945601860', 'A1000012B82D0F', '230602196203230013', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (725, '龙凤分局', '龙凤分局', '齐丽', null, '18945601861', 'A1000012B82BD7', '230603197808013522', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (726, '龙凤分局', '龙凤分局', '刘君', null, '18945601862', 'A1000012B82B80', '230603195601301114', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (727, '龙凤分局', '龙凤分局', '王平', null, '18945601863', 'A1000012B82B82', '230604197605050231', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (728, '龙凤分局', '龙凤分局', '张丽华', null, '18945601866', 'A1000012B7A8FC', '230603196303042323', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (729, '龙凤分局', '龙凤分局', '张玉玲', null, '18945601867', 'A1000012B7A60F', '230603196611160428', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (730, '龙凤分局', '龙凤分局', '司爱华', null, '18945601868', 'A1000012B7AE49', '230603196103160026', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (731, '龙凤分局', '龙凤分局', '温晓光', null, '18945601869', 'A1000012B7AE1E', '230603197011231311', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (732, '龙凤分局', '龙凤分局', '高明成', null, '18945601870', 'A1000012B7ACA2', '230603196209171313', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (733, '龙凤分局', '龙凤分局', '刘振贤', null, '18945601871', 'A1000012B77DDA', '230603196306050011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (734, '龙凤分局', '龙凤分局', '孙成君', null, '18945601872', 'A1000012B7A8ED', '230603196309042519', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (735, '龙凤分局', '龙凤分局', '秦晓冬', null, '18945601873', 'A1000012B7A837', '230603196212310011', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (736, '龙凤分局', '龙凤分局', '马勇刚', null, '18945601876', 'A1000012B7A934', '230603197408100918', '0', '0', null, null);
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB)
values (737, '龙凤分局', '龙凤分局', '李静安', null, '18945601877', 'A1000012B7AA22', '230605195402011256', '0', '0', null, null);
commit;
prompt 1581 records loaded
prompt Enabling triggers for DOJO_TREE_T...
alter table DOJO_TREE_T enable all triggers;
prompt Enabling triggers for GNMK...
alter table GNMK enable all triggers;
prompt Enabling triggers for PLOT...
alter table PLOT enable all triggers;
prompt Enabling triggers for POLICETYPE...
alter table POLICETYPE enable all triggers;
prompt Enabling triggers for SSI_AUTH_MENU...
alter table SSI_AUTH_MENU enable all triggers;
prompt Enabling triggers for SSI_AUTH_M_MENU_ROLE...
alter table SSI_AUTH_M_MENU_ROLE enable all triggers;
prompt Enabling triggers for SSI_AUTH_M_MENU_ROLE2...
alter table SSI_AUTH_M_MENU_ROLE2 enable all triggers;
prompt Enabling triggers for SSI_AUTH_M_ROLE_RESOURCE...
alter table SSI_AUTH_M_ROLE_RESOURCE enable all triggers;
prompt Enabling triggers for SSI_AUTH_M_USER_ROLE...
alter table SSI_AUTH_M_USER_ROLE enable all triggers;
prompt Enabling triggers for SSI_AUTH_RESOURCE...
alter table SSI_AUTH_RESOURCE enable all triggers;
prompt Enabling triggers for SSI_AUTH_ROLE...
alter table SSI_AUTH_ROLE enable all triggers;
prompt Enabling triggers for SSI_ORG_ACCOUNT...
alter table SSI_ORG_ACCOUNT enable all triggers;
prompt Enabling triggers for SSI_ORG_M_USER_UNIT...
alter table SSI_ORG_M_USER_UNIT enable all triggers;
prompt Enabling triggers for SSI_ORG_UNIT...
alter table SSI_ORG_UNIT enable all triggers;
prompt Enabling triggers for SSI_ORG_USER...
alter table SSI_ORG_USER enable all triggers;
prompt Enabling triggers for TABLE1...
alter table TABLE1 enable all triggers;
prompt Enabling triggers for T_SJSB...
alter table T_SJSB enable all triggers;
set feedback on
set define on
prompt Done.

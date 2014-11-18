prompt PL/SQL Developer import file
prompt Created on 2011��8��11�� by Administrator
set feedback off
set define off
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
;

prompt Creating SSI_AUTH_M_MENU_ROLE...
create table SSI_AUTH_M_MENU_ROLE
(
  MENU_ID VARCHAR2(32) not null,
  ROLE_ID VARCHAR2(32) not null
)
;

prompt Creating SSI_AUTH_M_MENU_ROLE2...
create table SSI_AUTH_M_MENU_ROLE2
(
  MENU_ID VARCHAR2(32) not null,
  ROLE_ID VARCHAR2(32) not null
)
;

prompt Creating SSI_AUTH_M_ROLE_RESOURCE...
create table SSI_AUTH_M_ROLE_RESOURCE
(
  ROLE_ID     VARCHAR2(32) not null,
  RESOURCE_ID VARCHAR2(32) not null
)
;
alter table SSI_AUTH_M_ROLE_RESOURCE
  add constraint PK_SSI_MAPP_RES_AND_ROLE primary key (ROLE_ID, RESOURCE_ID);

prompt Creating SSI_AUTH_M_USER_ROLE...
create table SSI_AUTH_M_USER_ROLE
(
  ROLE_ID VARCHAR2(32),
  USER_ID VARCHAR2(32)
)
;

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
;
alter table SSI_AUTH_RESOURCE
  add constraint PK_SSI_AUTH_RESOURCE primary key (RESOURCE_ID);

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
;
alter table SSI_AUTH_ROLE
  add constraint PK_SSI_AUTH_ROLE primary key (ROLE_ID);

prompt Creating SSI_CODE...
create table SSI_CODE
(
  CODE     VARCHAR2(100) not null,
  CODENAME VARCHAR2(100) not null,
  CODEDES  VARCHAR2(100),
  CODETYPE VARCHAR2(100) not null
)
;

prompt Creating SSI_CODETYPE...
create table SSI_CODETYPE
(
  TYPE     VARCHAR2(100) not null,
  TYPENAME VARCHAR2(100) not null,
  TYPEDES  VARCHAR2(100)
)
;
comment on column SSI_CODETYPE.TYPE
  is '��������';
comment on column SSI_CODETYPE.TYPENAME
  is '����������';
comment on column SSI_CODETYPE.TYPEDES
  is '������������';

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
;
alter table SSI_ORG_ACCOUNT
  add constraint PK_SSI_ORG_ACCOUNT_KEY primary key (ACCOUNT_ID);

prompt Creating SSI_ORG_M_USER_UNIT...
create table SSI_ORG_M_USER_UNIT
(
  UNIT_ID VARCHAR2(32),
  USER_ID VARCHAR2(32)
)
;

prompt Creating SSI_ORG_UNIT...
create table SSI_ORG_UNIT
(
  UNIT_ID     VARCHAR2(32) not null,
  UNIT_NAME   VARCHAR2(128),
  DESCRIPTION VARCHAR2(128),
  PARENT_ID   VARCHAR2(32),
  IS_LEAF     VARCHAR2(10),
  XZQH        VARCHAR2(128),
  ORDERID     NUMBER
)
;
alter table SSI_ORG_UNIT
  add constraint PK_SSI_ORG_UNIT primary key (UNIT_ID);

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
;
alter table SSI_ORG_USER
  add constraint PK_SSI_ORG_USER primary key (USER_ID);

prompt Creating TABLE1...
create table TABLE1
(
  NAME   VARCHAR2(100),
  PSW    VARCHAR2(100),
  DES    VARCHAR2(200),
  ODERBY NUMBER
)
;

prompt Creating T_CPCJ...
create table T_CPCJ
(
  ID           NUMBER not null,
  DESCRIPTION  VARCHAR2(500),
  PICTURENAME  VARCHAR2(50) not null,
  CREATEUSERID NUMBER,
  CREATETIME   DATE,
  DEVICE_ID    VARCHAR2(30)
)
;
comment on table T_CPCJ
  is 'ͼƬ�ɼ�';
comment on column T_CPCJ.ID
  is '����ID';
comment on column T_CPCJ.DESCRIPTION
  is '��Ϣ����';
comment on column T_CPCJ.PICTURENAME
  is 'ͼƬ����';
comment on column T_CPCJ.CREATEUSERID
  is '������';
comment on column T_CPCJ.CREATETIME
  is '����ʱ��';
comment on column T_CPCJ.DEVICE_ID
  is '�����ߵ��ֻ�����';
alter table T_CPCJ
  add constraint PK_T_CPCJ primary key (ID);

prompt Creating T_NOTICE...
create table T_NOTICE
(
  ID             NUMBER not null,
  TITLE          VARCHAR2(100) not null,
  TYPE           VARCHAR2(10) not null,
  CONTENT        VARCHAR2(2000) not null,
  SENDUSERID     VARCHAR2(50) not null,
  SENDTIME       DATE,
  SENDSTATUS     VARCHAR2(50) default 0 not null,
  SENDDEPTID     VARCHAR2(50),
  UPLOADFILENAME VARCHAR2(4000),
  REQDEVICE_ID   VARCHAR2(2000),
  REQUSERNAME    VARCHAR2(2000),
  REQDEPTID      VARCHAR2(2000),
  REQDEPTNAME    VARCHAR2(2000)
)
;
comment on table T_NOTICE
  is '֪ͨͨ����������';
comment on column T_NOTICE.ID
  is '����ID';
comment on column T_NOTICE.TITLE
  is '��Ϣ����';
comment on column T_NOTICE.TYPE
  is '��Ϣ���ͣ�Э��ͨ��=1��֪ͨͨ��=2������֪ͨ=3��';
comment on column T_NOTICE.CONTENT
  is '��Ϣ��������';
comment on column T_NOTICE.SENDUSERID
  is '�����ˣ���¼�û���ID��';
comment on column T_NOTICE.SENDTIME
  is '����ʱ����ϵͳĬ��ʱ��';
comment on column T_NOTICE.SENDSTATUS
  is '����״̬��0=δ����,1=�ѷ���';
comment on column T_NOTICE.SENDDEPTID
  is '���͵�λ����¼�û�������ԪID��';
comment on column T_NOTICE.UPLOADFILENAME
  is '�ϴ��ļ�������';
comment on column T_NOTICE.REQDEVICE_ID
  is '���շ��ֻ������ַ���';
comment on column T_NOTICE.REQUSERNAME
  is '���շ������ַ���';
comment on column T_NOTICE.REQDEPTID
  is '���շ���λ���������ַ���';
comment on column T_NOTICE.REQDEPTNAME
  is '���շ���λ�����ַ���';
alter table T_NOTICE
  add constraint PK_T_NOTICE primary key (ID);

prompt Creating T_NOTICEUSER...
create table T_NOTICEUSER
(
  ID          NUMBER not null,
  READSTATUS  NUMBER default 0,
  NOTICEID    NUMBER not null,
  DEVICE_ID   VARCHAR2(30),
  RECEIVETIME DATE
)
;
comment on table T_NOTICEUSER
  is '֪ͨͨ�������ӱ�';
comment on column T_NOTICEUSER.ID
  is '����ID';
comment on column T_NOTICEUSER.READSTATUS
  is '�Ƿ�����״̬0=δ�Ķ�;1=���Ķ�';
comment on column T_NOTICEUSER.NOTICEID
  is 'NOTICE���';
comment on column T_NOTICEUSER.DEVICE_ID
  is '�ֻ�����';
comment on column T_NOTICEUSER.RECEIVETIME
  is 'ǩ��ʱ��';
alter table T_NOTICEUSER
  add constraint PK_T_NOTICEUSER primary key (ID);

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
  DDJB      VARCHAR2(10),
  DELFLAG   NUMBER default 0,
  XZQH      VARCHAR2(50)
)
;
comment on column T_SJSB.ID
  is 'id';
comment on column T_SJSB.DW
  is '��λ';
comment on column T_SJSB.BM
  is '����';
comment on column T_SJSB.XM
  is '����';
comment on column T_SJSB.JH
  is '����';
comment on column T_SJSB.SJH
  is '�ֻ���';
comment on column T_SJSB.DEVICE_ID
  is '�ֻ�����';
comment on column T_SJSB.SFZHM
  is '���֤����';
comment on column T_SJSB.JZ
  is '���� ,0��ʾ��-1��ʾЭ��-2Ħ�г�- 3����';
comment on column T_SJSB.PWD
  is '�ն˵�½���� Ĭ��ֵ��0';
comment on column T_SJSB.ZQZT
  is 'ִ��״̬���п������ֵ�';
comment on column T_SJSB.DDJB
  is '���ȼ����п������ֵ�';
comment on column T_SJSB.DELFLAG
  is 'ɾ����ʶ 0-δɾ��;1-ɾ��';
comment on column T_SJSB.XZQH
  is '������������-�������������';
alter table T_SJSB
  add constraint PK_T_SJSB primary key (ID);

prompt Creating T_SJSB_SUB...
create table T_SJSB_SUB
(
  ID           NUMBER not null,
  DEVICE_ID    VARCHAR2(30) not null,
  BEGINTIME    VARCHAR2(5) not null,
  ENDTIME      VARCHAR2(5) not null,
  INTERVALTIME NUMBER not null,
  FLAG         NUMBER default 0,
  WEEKFLAG     VARCHAR2(2)
)
;
comment on column T_SJSB_SUB.ID
  is '����ID';
comment on column T_SJSB_SUB.DEVICE_ID
  is '�豸ID';
comment on column T_SJSB_SUB.BEGINTIME
  is '���Կ�ʼʱ�䣬��ÿ����Կ�ʼ��Ч��ʱ�䣬��ʽΪ: Сʱ:����';
comment on column T_SJSB_SUB.ENDTIME
  is 'ÿ�����ʧЧ��ʱ��';
comment on column T_SJSB_SUB.INTERVALTIME
  is '���Լ��ʱ�䣬������GPS��Ϣ�ϴ��ļ��ʱ�䣬����Ϊ��λ';
comment on column T_SJSB_SUB.FLAG
  is '״̬';
comment on column T_SJSB_SUB.WEEKFLAG
  is '������1��7���洢��һ������';
alter table T_SJSB_SUB
  add constraint PK_T_SJSB_SUB primary key (ID);

prompt Creating T_SPCJ...
create table T_SPCJ
(
  ID          NUMBER not null,
  DESCRIPTION VARCHAR2(500),
  VIDEONAME   VARCHAR2(50) not null,
  CREATETIME  DATE not null,
  DEVICE_ID   VARCHAR2(30) not null,
  LENGTH      VARCHAR2(10)
)
;
comment on table T_SPCJ
  is '��Ƶ�ɼ�';
comment on column T_SPCJ.ID
  is '����ID';
comment on column T_SPCJ.DESCRIPTION
  is '��Ϣ����';
comment on column T_SPCJ.VIDEONAME
  is '��Ƶ����';
comment on column T_SPCJ.CREATETIME
  is '����ʱ��';
comment on column T_SPCJ.DEVICE_ID
  is '�ֻ�����';
comment on column T_SPCJ.LENGTH
  is '����';
alter table T_SPCJ
  add constraint PK_T_SPCJ primary key (ID);

prompt Loading SSI_AUTH_MENU...
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('-4bf1caa4:1318e65c096:-8000', '-4bf1caa4:1318e65c096:-7fff', '���ݲɼ�', '1', null, 1, '1');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('-4bf1caa4:1318e65c096:-7ffc', '-4bf1caa4:1318e65c096:-7ffb', '֪ͨͨ��', '1', '-4bf1caa4:1318e65c096:-7ffe', 1, '/biz/common/tztg_mgr_list.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('-4bf1caa4:1318e65c096:-7ffa', '-4bf1caa4:1318e65c096:-7ff9', 'ͼƬ�ɼ�', '1', '-4bf1caa4:1318e65c096:-8000', 1, '/biz/common/tpcj_mgr_list.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('-4bf1caa4:1318e65c096:-7ff8', '-4bf1caa4:1318e65c096:-7ff7', '��Ƶ�ɼ�', '1', '-4bf1caa4:1318e65c096:-8000', 1, '/biz/common/spcj_mgr_list.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('-4bf1caa4:1318e65c096:-7ffe', '-4bf1caa4:1318e65c096:-7ffd', '֪ͨͨ��', '1', null, 1, '1');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('1', '000001', '��������', '1', null, 111, null);
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('2', '000002', '�û�����', '1', null, 112, null);
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('3', '000003', 'Ȩ�޹���', '1', null, 113, null);
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('4', '000004', '�˵�����', '1', null, 110, null);
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('1.1', '0003', '��λ����', '1', '1', 1, 'platform/org/unit_mgr_list.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('2.1', '0004', '��Ա����', '1', '2', 0, 'platform/org/user_mgr_list.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('3.1', '0002', '��ɫ����', '1', '3', 6, 'platform/auth/role_mgr_list.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('4.1', '0001', '�˵�����', '1', '4', 7, 'platform/auth/menu_mgr_list.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('69aa7b23:12fc366fd02:-7ffe', '69aa7b23:12fc366fd02:-7fff', '�豸����', '�豸����', null, 1, '1');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('69aa7b23:12fc366fd02:-7ffb', '69aa7b23:12fc366fd02:-7ffc', '�ֻ��豸', '�ֻ��豸', '69aa7b23:12fc366fd02:-7ffe', 1, '/biz/mobile/mobile_list.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('158b24c4:131ac8da986:-8000', '158b24c4:131ac8da986:-7fff', '���ÿ����', '1', null, 1, '1');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('158b24c4:131ac8da986:-7ffe', '158b24c4:131ac8da986:-7ffd', 'ͼƬά��', '1', '158b24c4:131ac8da986:-8000', 5, '/biz/service/imageinfo_mgr.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('158b24c4:131ac8da986:-7ffc', '158b24c4:131ac8da986:-7ffb', 'ϵͳ�����', '1', '158b24c4:131ac8da986:-8000', 2, '/biz/service/code_mgr.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('158b24c4:131ac8da986:-7ffa', '158b24c4:131ac8da986:-7ff9', 'ҵ��ά��', 'ҵ��ά����ά��ҵ���ҵ�������ҵ�������', '158b24c4:131ac8da986:-8000', 1, '/biz/service/business_mgr.jsp');
insert into SSI_AUTH_MENU (MENU_ID, RESOURCE_ID, NAME, DESCRIPTION, PARENT_ID, POSITION, URL)
values ('158b24c4:131ac8da986:-7ff8', '158b24c4:131ac8da986:-7ff7', 'ҵ������', '1', '158b24c4:131ac8da986:-8000', 3, '/biz/service/codetype_mgr.jsp');
commit;
prompt 20 records loaded
prompt Loading SSI_AUTH_M_MENU_ROLE...
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-7ff8', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-8000', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-7ffe', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('69aa7b23:12fc366fd02:-7ffe', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('69aa7b23:12fc366fd02:-7ffb', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('69aa7b23:12fc366fd02:-7ffb', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('6', '6c8d3966:12fbf14e288:-7ffb');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('6.1', '6c8d3966:12fbf14e288:-7ffb');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-7ff8', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('1.1', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('2', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('3', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('3.1', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('4.1', 'sysUserRole');
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
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-7ffa', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-7ffc', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-7ffe', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('69aa7b23:12fc366fd02:-7ffe', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('158b24c4:131ac8da986:-8000', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('158b24c4:131ac8da986:-7ffe', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('158b24c4:131ac8da986:-7ffa', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('158b24c4:131ac8da986:-7ff8', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('158b24c4:131ac8da986:-7ffc', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-8000', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-7ffc', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-7ffe', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-7ffa', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-8000', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-7ffc', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('158b24c4:131ac8da986:-8000', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('158b24c4:131ac8da986:-7ffa', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('1', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('2.1', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('4', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('69aa7b23:12fc366fd02:-7ffb', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('158b24c4:131ac8da986:-7ffc', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-7ff8', 'sysUserRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('-4bf1caa4:1318e65c096:-7ffa', '-3dd28002:12fbebeba22:-8000');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('69aa7b23:12fc366fd02:-7ffe', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('158b24c4:131ac8da986:-7ffe', 'adminRole');
insert into SSI_AUTH_M_MENU_ROLE (MENU_ID, ROLE_ID)
values ('158b24c4:131ac8da986:-7ff8', 'adminRole');
commit;
prompt 61 records loaded
prompt Loading SSI_AUTH_M_MENU_ROLE2...
prompt Table is empty
prompt Loading SSI_AUTH_M_ROLE_RESOURCE...
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', '-4bf1caa4:1318e65c096:-7ff7');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', '-4bf1caa4:1318e65c096:-7ff9');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', '-4bf1caa4:1318e65c096:-7ffb');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', '-4bf1caa4:1318e65c096:-7ffd');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('-3dd28002:12fbebeba22:-8000', '-4bf1caa4:1318e65c096:-7fff');
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
values ('adminRole', '-4bf1caa4:1318e65c096:-7ff7');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', '-4bf1caa4:1318e65c096:-7ff9');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', '-4bf1caa4:1318e65c096:-7ffb');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', '-4bf1caa4:1318e65c096:-7ffd');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', '-4bf1caa4:1318e65c096:-7fff');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', '158b24c4:131ac8da986:-7ff7');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', '158b24c4:131ac8da986:-7ff9');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', '158b24c4:131ac8da986:-7ffb');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', '158b24c4:131ac8da986:-7ffd');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', '158b24c4:131ac8da986:-7fff');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', '69aa7b23:12fc366fd02:-7ffc');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', '69aa7b23:12fc366fd02:-7fff');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('adminRole', 'allresource');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '-4bf1caa4:1318e65c096:-7ff7');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '-4bf1caa4:1318e65c096:-7ff9');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '-4bf1caa4:1318e65c096:-7ffb');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '-4bf1caa4:1318e65c096:-7ffd');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '-4bf1caa4:1318e65c096:-7fff');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '000001');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '000002');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '000003');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '000004');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '0001');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '0002');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '0003');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '0004');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '158b24c4:131ac8da986:-7ff7');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '158b24c4:131ac8da986:-7ff9');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '158b24c4:131ac8da986:-7ffb');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '158b24c4:131ac8da986:-7ffd');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '158b24c4:131ac8da986:-7fff');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '69aa7b23:12fc366fd02:-7ffc');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', '69aa7b23:12fc366fd02:-7fff');
insert into SSI_AUTH_M_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID)
values ('sysUserRole', 'base');
commit;
prompt 58 records loaded
prompt Loading SSI_AUTH_M_USER_ROLE...
insert into SSI_AUTH_M_USER_ROLE (ROLE_ID, USER_ID)
values ('6c8d3966:12fbf14e288:-7ffc', '-beeb56c:11ce53e3927:-7feb');
insert into SSI_AUTH_M_USER_ROLE (ROLE_ID, USER_ID)
values ('adminRole', 'admin');
insert into SSI_AUTH_M_USER_ROLE (ROLE_ID, USER_ID)
values ('-3dd28002:12fbebeba22:-8000', '-beeb56c:11ce53e3927:-7fed');
insert into SSI_AUTH_M_USER_ROLE (ROLE_ID, USER_ID)
values ('sysUserRole', '3e36c54c:11cfa326220:-7fd7');
insert into SSI_AUTH_M_USER_ROLE (ROLE_ID, USER_ID)
values ('-3dd28002:12fbebeba22:-8000', '3e36c54c:11cfa326220:-7fd7');
commit;
prompt 5 records loaded
prompt Loading SSI_AUTH_RESOURCE...
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('-4bf1caa4:1318e65c096:-7fff', '1', '���ݲɼ�', null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('-4bf1caa4:1318e65c096:-7ffb', '.(biz/common/tztg_.*.jsp|commonbiz/tztgAC!.*|platform/unitAC!.*)', '֪ͨͨ��', null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('-4bf1caa4:1318e65c096:-7ff9', '.(biz/common/tpcj_.*.jsp|commonbiz/sjcjAC!.*|platform/unitAC!.*)', 'ͼƬ�ɼ�', null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('-4bf1caa4:1318e65c096:-7ff7', '.(biz/common/spcj_.*.jsp|commonbiz/sjcjAC!.*|platform/unitAC!.*)', '��Ƶ�ɼ�', null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('base', '.(js|xml|html|htm|css|jpg|png|bmp|gif|index.jsp|platform/login_point.action|platform/login!.*?\.action.*|platform/logout.action|platform/framework.*|platform/codeListAC.*)', null, null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('-4bf1caa4:1318e65c096:-7ffd', '1', '֪ͨͨ��', null, null, null);
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
values ('69aa7b23:12fc366fd02:-7ffc', '.(biz/mobile/mobile_.*.jsp|biz/mobileAC!.*)', '�ֻ��豸', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('3', '/biz/model1AC!operatorHandler.action\?id=1111', '33', null, '1', '1');
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('unlimitedresource', '.*?\.(js|xml|html|htm|css|jpg|png|bmp|gif)', 'ϵͳ�ļ���Դ', null, '2', 'ϵͳ�����в�������Դ������js��css��');
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('allresource', '.*', 'ϵͳ������Դ', null, '2', 'ϵͳ������Դ��ֻ�ܳ�������Ա����');
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('0001', '.(platform/auth/menu_.*.jsp|platform/menuAC!.*)', '�˵�', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('0002', '.(platform/auth/role_.*.jsp|platform/roleAC!.*)', '��ɫ����', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('0003', '.(platform/org/unit_.*.jsp|platform/unit.*)', '��λ����', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('0004', '.(platform/org/user_.*.jsp|platform/userAC!.*)', '��Ա����', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('69aa7b23:12fc366fd02:-7fff', '1', '�豸����', null, '1', null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('158b24c4:131ac8da986:-7fff', '1', '���ÿ����', null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('158b24c4:131ac8da986:-7ffd', '.(biz/service/imageinfo.*|biz/serviceAC!.*)', 'ͼƬά��', null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('158b24c4:131ac8da986:-7ffb', '.(biz/service/code.*|biz/serviceAC!.*)', 'ϵͳ�����', null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('158b24c4:131ac8da986:-7ff9', '.(biz/service/business.*|biz/serviceAC!.*)', 'ҵ��ά��', null, null, null);
insert into SSI_AUTH_RESOURCE (RESOURCE_ID, URL, TITLE, PARENT_ID, IS_LEAF, DESCRIPTION)
values ('158b24c4:131ac8da986:-7ff7', '.(biz/service/codetype.*|biz/serviceAC!.*)', 'ҵ������', null, null, null);
commit;
prompt 25 records loaded
prompt Loading SSI_AUTH_ROLE...
insert into SSI_AUTH_ROLE (ROLE_ID, ROLE_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, UNIT_ID)
values ('6c8d3966:12fbf14e288:-7ffb', 'ҵ���û�1', 'ҵ���û�1', null, '1', '10000');
insert into SSI_AUTH_ROLE (ROLE_ID, ROLE_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, UNIT_ID)
values ('sysUserRole', 'ϵͳ����Ա', 'ϵͳ����Ա', null, '1', '00000');
insert into SSI_AUTH_ROLE (ROLE_ID, ROLE_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, UNIT_ID)
values ('adminRole', '��������Ա', '��������Ա��������ɾ��', null, '1', '00000');
insert into SSI_AUTH_ROLE (ROLE_ID, ROLE_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, UNIT_ID)
values ('-3dd28002:12fbebeba22:-8000', 'ҵ���û�', 'ҵ���û�', null, '1', '00000');
insert into SSI_AUTH_ROLE (ROLE_ID, ROLE_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, UNIT_ID)
values ('6c8d3966:12fbf14e288:-7ffc', 'ϵͳ����Ա1', 'ϵͳ����Ա1', null, '1', '10000');
commit;
prompt 5 records loaded
prompt Loading SSI_CODE...
insert into SSI_CODE (CODE, CODENAME, CODEDES, CODETYPE)
values ('-1', '��ѡ��', null, 'sendstatus');
insert into SSI_CODE (CODE, CODENAME, CODEDES, CODETYPE)
values ('-1', '��ѡ��', null, 'noticetype');
insert into SSI_CODE (CODE, CODENAME, CODEDES, CODETYPE)
values ('0', 'δ����', null, 'sendstatus');
insert into SSI_CODE (CODE, CODENAME, CODEDES, CODETYPE)
values ('1', '�ѷ���', null, 'sendstatus');
insert into SSI_CODE (CODE, CODENAME, CODEDES, CODETYPE)
values ('1', 'Э��ͨ��', null, 'noticetype');
insert into SSI_CODE (CODE, CODENAME, CODEDES, CODETYPE)
values ('2', '֪ͨͨ��', null, 'noticetype');
insert into SSI_CODE (CODE, CODENAME, CODEDES, CODETYPE)
values ('3', '����֪ͨ', null, 'noticetype');
commit;
prompt 7 records loaded
prompt Loading SSI_CODETYPE...
insert into SSI_CODETYPE (TYPE, TYPENAME, TYPEDES)
values ('sendstatus', '����״̬', '֪ͨͨ��ģ�鷢��״̬��0δ���ͣ�1����');
insert into SSI_CODETYPE (TYPE, TYPENAME, TYPEDES)
values ('noticetype', '֪ͨ����', '֪ͨͨ��ģ�飬֪ͨ����');
commit;
prompt 2 records loaded
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
values ('120020002', '120020002', 'husi', '1', to_date('05-05-2011 15:40:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-01-2014 00:11:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('admin', 'admin', 'admin', '1', to_date('01-04-2011', 'dd-mm-yyyy'), to_date('11-01-2014 00:11:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '0', '��������Ա��������ɾ����');
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('-beeb56c:11ce53e3927:-7fec', '3e36c54c:11cfa326220:-7fd7', 'zhangsan', '1', to_date('02-04-2011', 'dd-mm-yyyy'), to_date('01-04-2013', 'dd-mm-yyyy'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('-beeb56c:11ce53e3927:-7fea', '-beeb56c:11ce53e3927:-7fed', 'lisi', '1', to_date('02-04-2011', 'dd-mm-yyyy'), to_date('01-04-2013', 'dd-mm-yyyy'), '1', '0', null);
insert into SSI_ORG_ACCOUNT (ACCOUNT_ID, USER_ID, USERNAME, PASSWORD, REGISTE_DATE, EXPIRED_DATE, ENABLED, LOCKED, DESCRIPTION)
values ('-beeb56c:11ce53e3927:-7fe8', '-beeb56c:11ce53e3927:-7feb', 'wangwu', '1', to_date('02-04-2011', 'dd-mm-yyyy'), to_date('01-04-2013', 'dd-mm-yyyy'), '1', '0', null);
commit;
prompt 11 records loaded
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
values ('12002', '120020002');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('11000', '-beeb56c:11ce53e3927:-7feb');
insert into SSI_ORG_M_USER_UNIT (UNIT_ID, USER_ID)
values ('10000', '3e36c54c:11cfa326220:-7fd7');
commit;
prompt 11 records loaded
prompt Loading SSI_ORG_UNIT...
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, XZQH, ORDERID)
values ('10000', '�о�', '�о�', '00000', '0', '0001', 1);
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, XZQH, ORDERID)
values ('11000', '�оֲ���', '�оֲ���', '10000', '0', '0002', 2);
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, XZQH, ORDERID)
values ('12000', '���ؾ�', '���ؾ�', '10000', '0', '0003', 3);
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, XZQH, ORDERID)
values ('11001', 'һ��', 'һ��', '11000', '1', '0004', 4);
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, XZQH, ORDERID)
values ('11002', '����', '����', '11000', '1', '0005', 5);
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, XZQH, ORDERID)
values ('12001', 'һ��', 'һ��', '12000', '1', '0006', 6);
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, XZQH, ORDERID)
values ('12002', '����', '����', '12000', '1', '0007', 7);
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, XZQH, ORDERID)
values ('11003', '����', '����', '11000', '1', '0008', 8);
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, XZQH, ORDERID)
values ('11004', '�Ŀ�', '�Ŀ�', '11000', '1', '0009', 9);
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, XZQH, ORDERID)
values ('00000', '����֯��Ԫ', '����֯��Ԫ', null, null, '0000', 10);
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, XZQH, ORDERID)
values ('11111111', '�о�1', '�о�1', '00000', '0', '11001', 19);
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, XZQH, ORDERID)
values ('1111001111', '�о�3', '�о�1', '10000', '0', '11001', 19);
insert into SSI_ORG_UNIT (UNIT_ID, UNIT_NAME, DESCRIPTION, PARENT_ID, IS_LEAF, XZQH, ORDERID)
values ('10111001111', '�о�3', '�о�1', '10000', '0', '11001', 19);
commit;
prompt 13 records loaded
prompt Loading SSI_ORG_USER...
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('-beeb56c:11ce53e3927:-7feb', '����', 'M', null, null, '��������Ա');
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('admin', '��������Ա', 'M', null, null, '��������Ա��������ɾ����');
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('3e36c54c:11cfa326220:-7fd7', '����', 'M', null, null, 'ϵͳ�û�');
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('-beeb56c:11ce53e3927:-7fed', '����', 'M', null, null, '��ͨ�û�');
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('110010001', '���', 'M', null, null, '11');
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('110010002', '��Ӣ', 'F', null, null, null);
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('110020001', '�γ�', 'F', null, null, null);
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('110020002', '����', 'F', null, null, null);
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('120010001', '����', 'F', null, null, null);
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('120010002', '��Ӱ', 'F', null, null, null);
insert into SSI_ORG_USER (USER_ID, FULL_NAME, SEX, TEL, EMAIL, DESCRIPTION)
values ('120020002', '����', 'F', null, null, null);
commit;
prompt 11 records loaded
prompt Loading TABLE1...
insert into TABLE1 (NAME, PSW, DES, ODERBY)
values ('1', '1', '1', 1);
insert into TABLE1 (NAME, PSW, DES, ODERBY)
values ('x', '22', null, 22);
insert into TABLE1 (NAME, PSW, DES, ODERBY)
values ('1', '3', '1', 3);
insert into TABLE1 (NAME, PSW, DES, ODERBY)
values ('1', '33', '1', 33);
insert into TABLE1 (NAME, PSW, DES, ODERBY)
values ('1', '4', '1', 4);
insert into TABLE1 (NAME, PSW, DES, ODERBY)
values ('1', '44', '1', 44);
commit;
prompt 6 records loaded
prompt Loading T_CPCJ...
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (102, '1', 'picture_1308104243688.jpg', null, to_date('15-06-2011 10:19:51', 'dd-mm-yyyy hh24:mi:ss'), 'A1000012B74DA0D');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (103, '1', 'picture_1308104243688.jpg', null, to_date('15-06-2011 10:20:47', 'dd-mm-yyyy hh24:mi:ss'), 'A1000012B74DA0D');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (2, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (3, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (4, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (5, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (6, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (7, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (8, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (9, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (10, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (11, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (12, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (13, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (14, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (15, '13', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), 'A1000012B754E0');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (16, '12', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), 'A1000012B754E0');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (17, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (18, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (1, '�����������������ڴ����������ڴ�������������������', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '12345678901233');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (161, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), 'A0000024DBEF1F');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (162, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), 'A0000024DBEF1F');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (105, '��Ƭ', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), 'A1000012B74DA0D');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (106, 'Сʱ��', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), 'A1000012B74DA0D');
insert into T_CPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (101, 'ytest', 'picture_1308104243688.jpg', null, to_date('15-06-2011 10:18:08', 'dd-mm-yyyy hh24:mi:ss'), 'A1000012B74DA0D');
commit;
prompt 25 records loaded
prompt Loading T_NOTICE...
insert into T_NOTICE (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME)
values (346, '55', '1', '5', 'admin', null, '0', '00000', 'D:\��λ��Ϣ����ģ��.xls', null, null, null, null);
insert into T_NOTICE (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME)
values (345, '4', '1', '4', 'admin', null, '0', '00000', null, null, null, null, null);
insert into T_NOTICE (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME)
values (342, '1', '1', '1', 'admin', to_date('10-08-2011 13:35:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', null, null, null, null, null);
insert into T_NOTICE (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME)
values (344, '3', '1', '3', 'admin', to_date('10-08-2011 13:38:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', null, null, null, null, null);
insert into T_NOTICE (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME)
values (347, '55', '1', '222', 'admin', to_date('11-08-2011 09:11:05', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', null, 'A1000012B826BCsplit', '����˳,', '4split', '4,');
insert into T_NOTICE (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME)
values (343, '223', '1', '22ɶʱ', 'admin', null, '0', '00000', 'D:\', null, null, null, null);
insert into T_NOTICE (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME)
values (349, '2', '1', '2', '3e36c54c:11cfa326220:-7fd7', to_date('11-08-2011 09:16:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '10000', null, null, null, null, null);
insert into T_NOTICE (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME)
values (350, '3', '2', '3', '3e36c54c:11cfa326220:-7fd7', to_date('11-08-2011 09:16:16', 'dd-mm-yyyy hh24:mi:ss'), '1', '10000', null, null, null, null, null);
insert into T_NOTICE (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME)
values (348, '1', '1', '1', '3e36c54c:11cfa326220:-7fd7', to_date('11-08-2011 09:16:00', 'dd-mm-yyyy hh24:mi:ss'), '1', '10000', 'D:\', 'A1000012B7B6DDsplit', '��ѩ��,', '0002split', '�оֲ���,');
insert into T_NOTICE (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME)
values (351, '4', '1', '4', '3e36c54c:11cfa326220:-7fd7', to_date('11-08-2011 09:16:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '10000', null, null, null, null, null);
commit;
prompt 10 records loaded
prompt Loading T_NOTICEUSER...
insert into T_NOTICEUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (16277, 0, 348, 'A1000012B7B6DD', null);
insert into T_NOTICEUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (16276, 0, 347, 'A1000012B826BC', null);
commit;
prompt 2 records loaded
prompt Loading T_SJSB...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1203, '���칫����', '֧��һ', '��ѩ��', null, '18945600635', 'A1000012B7B6DD', '230602195611214229', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1204, '���칫����', '֧��һ', '���¶�', null, '18945600637', 'A1000012B7B6A6', '230602196708171936', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1205, '���칫����', '֧��һ', '������', null, '18945600638', 'A1000012B831A4', '230602197409124034', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1206, '���칫����', '֧��һ', '����˳', null, '18945600639', 'A1000012B826BC', '23060219630407083X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1207, '���칫����', '֧��һ', '������', null, '18945600651', 'A1000012B8309D', '230602196306070016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1208, '���칫����', '֧��һ', 'Ѧ����', null, '18945600655', 'A1000012B830C1', '230602196707091926', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1209, '���칫����', '֧��һ', '������', null, '18945600656', 'A1000012B831AB', '230602196707124417', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1210, '���칫����', '֧��һ', '�ű���', null, '18945600657', 'A1000012B830A0', '230602196508144415', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1211, '���칫����', '֧��һ', '��ΰ', null, '18945600658', 'A1000012B815E2', '230602197212180040', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1212, '���칫����', '֧��һ', '¬����', null, '18945600660', 'A1000012B831C2', '230226197312200212', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1213, '���칫����', '֧��һ', '����', null, '18945600661', 'A1000012B815D4', '230103197810014615', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1214, '���칫����', '֧��һ', '�ƾ���', null, '18945600663', 'A1000012B815EA', '230602197010020612', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1215, '���칫����', '֧��һ', '¬����', null, '18945600665', 'A1000012B7C9A3', '230104197512153410', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1216, '���칫����', '֧��һ', '�¾�ɽ', null, '18945600667', 'A1000012B7C997', '230602197607222110', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1217, '���칫����', '֧��һ', '������', null, '18945600668', 'A1000012B7C84A', '230605197012010214', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1218, '���칫����', '֧��һ', '������', null, '18945600669', 'A1000012B7C97A', '230606197509210242', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1219, '���칫����', '֧��һ', '��ʿȨ', null, '18945600670', 'A1000012B7C940', '23060319791208091X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1220, '���칫����', '֧��һ', '�޺���', null, '18945600671', 'A1000012B7C89A', '230604197004266213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1221, '���칫����', '֧��һ', '����', null, '18945600673', 'A1000012B7C996', '230603197908012519', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1222, '���칫����', '֧��һ', '��־��', null, '18945600676', 'A1000012B7C8D4', '230602197306056219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1223, '���칫����', '֧��һ', '�ﺣ��', null, '18945600677', 'A1000012B7C8D0', '21010519730624535X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1224, '���칫����', '֧��һ', '������', null, '18945600678', 'A1000012B7C86C', '230602196105180411', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1225, '���칫����', '֧��һ', '����֥', null, '18945600680', 'A1000012B82CB0', '230603196302140087', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1226, '���칫����', '֧��һ', '�ⵤ', null, '18945600681', 'A1000012B82C98', '230602197203200425', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1227, '���칫����', '֧��һ', '����Ƽ', null, '18945600682', 'A1000012B82CAA', '230226195805230023', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1228, '���칫����', '֧��һ', '�ܽ���', null, '18945600685', 'A1000012B82C88', '230602196810227115', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1229, '���칫����', '֧��һ', '������', null, '18945600686', 'A1000012B82CC0', '23060319740901021X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1230, '���칫����', '֧��һ', '�¾�', null, '18945600687', 'A1000012B82C95', '23060419771004444X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1231, '���칫����', '֧��һ', '�����', null, '18945600688', 'A1000012B82CAB', '230604197903223014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1232, '���칫����', '֧��һ', '����', null, '18945600689', 'A1000012B82CB1', '23060219770525516X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1233, '���칫����', '֧��һ', '�', null, '18945600690', 'A1000012B82CA0', '230602197412044019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1234, '���칫����', '֧��һ', '������', null, '18945600691', 'A1000012B82C7A', '23060219591202041X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1235, '���칫����', '֧��һ', '����־', null, '18945600692', 'A1000012B82292', '230602196104126237', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1236, '���칫����', '֧��һ', '¬����', null, '18945600693', 'A1000012B822BE', '230602195903313819', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1237, '���칫����', '֧��һ', '������', null, '18945600695', 'A1000012B82288', '230606195709220016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1238, '���칫����', '֧��һ', '����Ȩ', null, '18945600696', 'A1000012B82230', '230121197306242013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1239, '���칫����', '֧��һ', '�ﲨ', null, '18945600698', 'A1000012B8224C', '230602196604260416', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1240, '���칫����', '֧��һ', '��ΰ', null, '18945600700', 'A1000012B82266', '230602197505161353', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1241, '���칫����', '֧��һ', '������', null, '18945600246', 'A1000012B82232', '230602197608083212', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1242, '���칫����', '֧��һ', '���컪', null, '18945600701', 'A1000012B8225B', '210105197005225312', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1243, '���칫����', '֧��һ', '�ﾰ��', null, '18945600702', 'A1000012B82249', '23060519670602021X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1244, '���칫����', '֧��һ', '��ʿ��', null, '18945600703', 'A1000012B8228C', '230604196706200214', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1245, '���칫����', '֧��һ', '�Ŷ���', null, '18945600705', 'A1000012B7D202', '230602196511110056', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1246, '���칫����', '֧��һ', '����', null, '18945600706', 'A1000012B7D0F2', '230624196210040056', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1247, '���칫����', '֧��һ', '����', null, '18945600707', 'A1000012B7D101', '230605198205070226', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1248, '���칫����', '֧��һ', '������', null, '18945600708', 'A1000012B7D16F', '23060219801226173X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1249, '���칫����', '֧��һ', '���˸�', null, '18945600709', 'A1000012B7D170', '230602196503141012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1250, '���칫����', '֧��һ', '�����', null, '18945600710', 'A1000012B7D1F8', '230602196812130210', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1251, '���칫����', '֧��һ', '������', null, '18945600711', 'A1000012B7D203', '230602197903081711', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1252, '���칫����', '֧��һ', '֣����', null, '18945600712', 'A1000012B7D173', '230602196807163413', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1253, '���칫����', '֧��һ', '������', null, '18945600715', 'A1000012B7D1DB', '230602197209024418', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1254, '���칫����', '֧��һ', '��ϲ��', null, '18945600716', 'A1000012B7D1FC', '230228197711211413', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1255, '���칫����', '֧��һ', '������', null, '18945600717', 'A1000012B79D60', '230603197001302331', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1256, '���칫����', '֧��һ', '������', null, '18945600718', 'A1000012B76B1E', '230602197403024016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1257, '���칫����', '֧��һ', '������', null, '18945600719', 'A1000012B7B593', '23060219790614591X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1258, '���칫����', '֧��һ', '�޹㷢', null, '18945600720', 'A1000012B763A0', '140102196906292334', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1259, '���칫����', '֧��һ', '��ΰ', null, '18945600721', 'A1000012B7B382', '210102197205171815', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1260, '���칫����', '֧��һ', '������', null, '18945600722', 'A1000012B7B28B', '230602197901236222', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1261, '���칫����', '֧��һ', '���ٻ�', null, '18945600726', 'A1000012B75BB7', '230602197203183848', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1262, '���칫����', '֧��һ', '֣��', null, '18945600727', 'A1000012B758F3', '230226196908070071', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1263, '���칫����', '֧��һ', '����', null, '18945600728', 'A1000012B75D58', '230602196501240017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1264, '���칫����', '֧��һ', '���ľ�', null, '18945600730', 'A1000012B7B3D6', '23060219580830501X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1265, '���칫����', '֧��һ', '����', null, '18945600731', 'A1000012B7DDB1', '230605196507050010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1266, '���칫����', '֧��һ', '�����', null, '18945600733', 'A1000012B7F81A', '23060219740514752X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1267, '���칫����', '֧��һ', 'κ����', null, '18945600736', 'A1000012B7F810', '230206197512282210', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1268, '���칫����', '֧��һ', '�����', null, '18945600737', 'A1000012B7F844', '230602197004194018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1269, '���칫����', '֧��һ', '���Ȼ�', null, '18945600739', 'A1000012B7BF05', '230321197207156217', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1270, '���칫����', '֧��һ', '����', null, '18945600750', 'A1000012B7F840', '230604198208294720', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1271, '���칫����', '֧��һ', '�ھ�', null, '18945600036', 'A1000012B7C2F9', '231025197109020017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1272, '���칫����', '֧��һ', '������', null, '18945600400', 'A1000012B7C2F3', '230602196806294411', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1273, '���칫����', '֧��һ', '������', null, '18945600801', 'A1000012B7C2FB', '230602196001030419', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1274, '���칫����', '֧��һ', '�Ŵ���', null, '18945600803', 'A1000012B7C2A8', '230602196208014213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1275, '���칫����', '֧��һ', '����', null, '18945600805', 'A1000012B7F824', '230605197711112818', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1276, '���칫����', '֧��һ', '�ش���', null, '18945600806', 'A1000012B7F7AD', '230606197110085013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1277, '���칫����', '֧��һ', '�Ż�', null, '18945600807', 'A1000012B7F857', '230602197503102886', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1278, '���칫����', '֧��һ', '�ܼ���', null, '18945600809', 'A1000012B7F867', '23060219740429515x', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1279, '���칫����', '֧��һ', '��ӱ', null, '18945600810', 'A1000012B7F849', '230602196305210021', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1280, '���칫����', '֧��һ', '��ϲ��', null, '18945600811', 'A1000012B7C2B5', '230604196208160010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1281, '���칫����', '֧��һ', '������', null, '18945600813', 'A1000012B7C2BF', '230602195101263012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1282, '���칫����', '֧��һ', '������', null, '18945600815', 'A1000012B7C2D6', '230605196710041419', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1283, '���칫����', '֧��һ', '������', null, '18945600816', 'A1000012B7C0A0', '230605197511211459', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1284, '���칫����', '֧��һ', '�±غ�', null, '18945600817', 'A1000012B7C2A7', '230602195406230019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1285, '���칫����', '֧��һ', '����', null, '18945600818', 'A1000012B82FEB', '230602197906262147', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1376, '���칫����', '֧��һ', '������', null, '18945600963', 'A1000012B82219', '230604196810161411', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1377, '���칫����', '֧��һ', '�׹���', null, '18945600965', 'A1000012B82248', '230604196501102418', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1378, '���칫����', '֧��һ', '������', null, '18945600966', 'A1000012B82233', '230602196508102338', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1379, '���칫����', '֧��һ', '�Ž�', null, '18945600967', 'A1000012B81604', '230602197803302855', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1380, '���칫����', '֧��һ', '�Ű�', null, '18945600968', 'A1000012B81544', '230602196211133010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1381, '���칫����', '֧��һ', '��ռ��', null, '18945600969', 'A1000012B81620', '230606196312070712', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1382, '���칫����', '֧��һ', '������', null, '18945600975', 'A1000012B831BD', '230604197201270035', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1383, '���칫����', '֧��һ', '������', null, '18945600976', 'A1000012B8163C', '230602197009013837', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1384, '���칫����', '֧��һ', '��ռ��', null, '18945600977', 'A1000012B81616', '230602196208243016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1385, '���칫����', '֧��һ', '�￡��', null, '18945600978', 'A1000012B81617', '230602196907133211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1386, '���칫����', '֧��һ', '���', null, '18945600979', 'A1000012B815DD', '231021741010361', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1387, '���칫����', '֧��һ', '������', null, '18945600980', 'A1000012B81608', '230602195903202510', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1388, '���칫����', '֧��һ', '������', null, '18945601001', 'A1000012B8162E', '230602196211101932', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1389, '���칫����', '֧��һ', '������', null, '18945601002', 'A1000012B7C443', '230605196310010234', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1390, '���칫����', '֧��һ', '�����', null, '18945601003', 'A1000012B7C431', '230602196402191918', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1391, '���칫����', '֧��һ', '�е·�', null, '18945601005', 'A1000012B7C33D', '230602196110153821', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1392, '���칫����', '֧��һ', '�̹��', null, '18945601006', 'A1000012B7C418', '230602197201202515', '0', '0', null, null, 0, '0001');
commit;
prompt 101 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1393, '���칫����', '֧��һ', '¬��', null, '18945601007', 'A1000012B7C3D8', '230602196308040427', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1394, '���칫����', '֧��һ', '�ﾧ', null, '18945601008', 'A1000012B7C433', '230603197306190561', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1395, '���칫����', '֧��һ', '������', null, '18945601009', 'A1000012B7C404', '230605198206290220', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1396, '���칫����', '֧��һ', '��־��', null, '18945601010', 'A1000012B7C428', '230602195708020033', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1397, '���칫����', '֧��һ', '����', null, '18945601011', 'A1000012B7C471', '230605197702112218', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1398, '���칫����', '֧��һ', '������', null, '18945601015', 'A1000012B7C3DF', '23060419661021008X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1399, '���칫����', '֧��һ', '��͢��', null, '18945601016', 'A1000012B7B1EE', '230602196104221912', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1400, '���칫����', '֧��һ', '�ȵ���', null, '18945601017', 'A1000012B78CD4', '230602197504203240', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1401, '���칫����', '֧��һ', '����', null, '18945601018', 'A1000012B7BA6A', '230602198103100616', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1402, '���칫����', '֧��һ', '���', null, '18945601019', 'A1000012B78CB6', '230604198004235147', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1403, '���칫����', '֧��һ', '����Ρ', null, '18945601020', 'A1000012B79D71', '230602197306035151', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1404, '���칫����', '֧��һ', '���', null, '18945601023', 'A1000012B7B60C', '220102197111113392', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1405, '���칫����', '֧��һ', '֣����', null, '18945601024', 'A1000012B758D2', '230602196608031944', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1406, '���칫����', '֧��һ', '������', null, '18945601026', 'A1000012B7B7CD', '230602197610102128', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1407, '���칫����', '֧��һ', 'л����', null, '18945601027', 'A1000012B7589C', '230902197010160312', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1408, '���칫����', '֧��һ', '��Ⱥ', null, '18945601028', 'A1000012B78C51', '230602197610172126', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1409, '���칫����', '֧��һ', '�԰���', null, '18945601029', 'A1000012B7D8FB', '230602196608035611', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1410, '���칫����', '֧��һ', '��Ԫ��', null, '18945601030', 'A1000012B7D83E', '420400197010203824', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1411, '���칫����', '֧��һ', 'ʯ��ϼ', null, '18945601034', 'A1000012B7D96F', '230602195901143828', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1412, '���칫����', '֧��һ', '�����', null, '18945601035', 'A1000012B7D9A2', '230602197011135737', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1413, '���칫����', '֧��һ', '�߳���', null, '18945601036', 'A1000012B7D80F', '230602195405053831', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1414, '���칫����', '֧��һ', '����ΰ', null, '18945601037', 'A1000012B7D8F1', '230603196501031318', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1415, '���칫����', '֧��һ', '�', null, '18945601038', 'A1000012B7D884', '230602196406010213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1416, '���칫����', '֧��һ', '����ƽ', null, '18945601039', 'A1000012B7DA00', '230602196606142122', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1417, '���칫����', '֧��һ', '����', null, '18945601040', 'A1000012B7D9FE', '230602197811070628', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1418, '���칫����', '֧��һ', '�����', null, '18945601046', 'A1000012B7D91C', '230602198003242158', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1419, '���칫����', '֧��һ', '����÷', null, '18945601048', 'A1000012B7DD77', '230229196812080020', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1420, '���칫����', '֧��һ', '��ϲȪ', null, '18945601049', 'A1000012B7F7CF', '230602195505051219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1421, '���칫����', '֧��һ', '���ҳ�', null, '18945601050', 'A1000012B7F7C3', '230602196010303810', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1422, '���칫����', '֧��һ', '������', null, '18945601051', 'A1000012B7F7F4', '230602197906237128', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1423, '���칫����', '֧��һ', '������', null, '18945601055', 'A1000012B7F7D9', '232301197905120824', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1424, '���칫����', '֧��һ', '������', null, '18945601056', 'A1000012B7DE0F', '230602196710032118', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1425, '���칫����', '֧��һ', '�ƾ�Ƽ', null, '18945601057', 'A1000012B7F7B1', '230602196305071922', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1426, '���칫����', '֧��һ', '�ߺ���', null, '18945601058', 'A1000012B7FDBB', '23060219580102192X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1427, '���칫����', '֧��һ', '����', null, '18945601059', 'A1000012B7F7EE', '23060219621226192X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1428, '���칫����', '֧��һ', '�ں���', null, '18945601060', 'A1000012B7F7A4', '230602196301201523', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1429, '���칫����', '֧��һ', '��־��', null, '18945601061', 'A1000012B7F710', '230602196409242116', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1430, '���칫����', '֧��һ', '�ܺ�ӥ', null, '18945601062', 'A1000012B7FDB0', '230602196209012113', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1431, '���칫����', '֧��һ', '������', null, '18945601065', 'A1000012B7FDAD', '23060219661129215x', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1432, '���칫����', '֧��һ', '¬��ϲ', null, '18945601066', 'A1000012B7F73A', '230603197608114011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1433, '���칫����', '֧��һ', '���̳�', null, '18945601068', 'A1000012B7F75E', '230602197011303016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1434, '���칫����', '֧��һ', '����', null, '18945601069', 'A1000012B7F747', '230605197402121016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1435, '���칫����', '֧��һ', '����', null, '18945601070', 'A1000012B7F767', '230602197211070018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1436, '���칫����', '֧��һ', '������', null, '18945601071', 'A1000012B7FDB7', '23060219630630381X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1437, '���칫����', '֧��һ', '�����', null, '18945601075', 'A1000012B7F76B', '34212319750705537X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1438, '���칫����', '֧��һ', '������', null, '18945601077', 'A1000012B7F67F', '230602196507253820', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1439, '���칫����', '֧��һ', '���̻�', null, '18945601078', 'A1000012B83026', '220125197403074211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1440, '���칫����', '֧��һ', '�Ϸ���', null, '18945601079', 'A1000012B81D3C', '230604197409084717', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1441, '���칫����', '֧��һ', 'л��', null, '18945601080', 'A1000012B81E75', '210114198001201939', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1442, '���칫����', '֧��һ', '����', null, '18945601081', 'A1000012B81C9F', '230605197506110223', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1443, '���칫����', '֧��һ', '�쾲��', null, '18945601083', 'A1000012B82071', '230602196406122119', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1444, '���칫����', '֧��һ', '������', null, '18945601085', 'A1000012B8250B', '230605197109171030', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1445, '���칫����', '֧��һ', '��־��', null, '18945601086', 'A1000012B820E5', '230828197712276211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1446, '���칫����', '֧��һ', '���', null, '18945601087', 'A1000012B81E81', '110102197504262334', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1447, '���칫����', '֧��һ', '�α�', null, '18945601088', 'A1000012B81EB6', '23060219690208211X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1448, '���칫����', '֧��һ', '���', null, '18945601089', 'A1000012B82079', '230602197508062123', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1449, '���칫����', '֧��һ', '������', null, '18945601090', 'A1000012B81C86', '370625197306181533', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1450, '���칫����', '֧��һ', '���', null, '18945601091', 'A1000012B7F7BE', '230602197305300232', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1451, '���칫����', '֧��һ', '������', null, '18945601092', 'A1000012B7F7BB', '230602195307030011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1452, '���칫����', '֧��һ', '���Ҿ�', null, '18945601095', 'A1000012B7F796', '230602196805041930', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1453, '���칫����', '֧��һ', '������', null, '18945601096', 'A1000012B7F81F', '230605195309151211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1454, '���칫����', '֧��һ', '����Ƽ', null, '18945601097', 'A1000012B7F7E9', '230602197110281924', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1455, '���칫����', '֧��һ', '������', null, '18945601098', 'A1000012B7F7BA', '230602195801033832', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1456, '���칫����', '֧��һ', '�ﴺ��', null, '18945601099', 'A1000012B7F7E5', '230602196907273812', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1457, '���칫����', '֧��һ', '����÷', null, '18945601100', 'A1000012B7F7E0', '230602196310242124', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1458, '���칫���ֶ����־�', '֧��һ', '��Ĭ', null, '18945600613', 'A1000012B7C891', '230103197909055919', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1459, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601101', 'A1000012B7C934', '230602197006064030', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1460, '���칫���ֶ����־�', '֧��һ', '���ı�', null, '18945601102', 'A1000012B7D071', '230603196601051156', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1461, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601103', 'A1000012B7D04C', '230602198003244452', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1462, '���칫���ֶ����־�', '֧��һ', '���ھ�', null, '18945601105', 'A1000012B7CF8F', '230602195202285712', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1463, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601106', 'A1000012B7D052', '23060519750514021X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1464, '���칫���ֶ����־�', '֧��һ', '�ؽ���', null, '18945601107', 'A1000012B7D055', '230602196510152713', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1465, '���칫���ֶ����־�', '֧��һ', 'κ�', null, '18945601108', 'A1000012B7D05E', '230105197901120512', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1466, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601109', 'A1000012B7D050', '23060219710404341X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1467, '���칫���ֶ����־�', '֧��һ', '�����', null, '18945601110', 'A1000012B7D09E', '230602197202016239', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1468, '���칫���ֶ����־�', '֧��һ', '��ʿ��', null, '18945601121', 'A1000012B7CFB1', '230602196604063420', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1469, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601122', 'A1000012B7D06E', '230604197807074418', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1470, '���칫���ֶ����־�', '֧��һ', '����ΰ', null, '18945601123', 'A1000012B7C9B3', '230602196404013410', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1471, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601126', 'A1000012B7CA57', '230402197801010030', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1472, '���칫���ֶ����־�', '֧��һ', '��Х��', null, '18945601127', 'A1000012B7C9AE', '230602197309011016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1473, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601128', 'A1000012B7CA51', '230206197406140219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1474, '���칫���ֶ����־�', '֧��һ', '�︣��', null, '18945601129', 'A1000012B7CA48', '230103197704085110', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1475, '���칫���ֶ����־�', '֧��һ', 'Ԭ����', null, '18945601130', 'A1000012B7CA54', '230602195902260022', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1476, '���칫���ֶ����־�', '֧��һ', '��ѧ��', null, '18945601131', 'A1000012B7C96D', '23060219680601191X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1477, '���칫���ֶ����־�', '֧��һ', '�ϱ�', null, '18945601135', 'A1000012B7CA2A', '230602198211045925', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1478, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601136', 'A1000012B7CA21', '230604198301051838', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1479, '���칫���ֶ����־�', '֧��һ', 'ʷ����', null, '18945601137', 'A1000012B7CA39', '230602196710062114', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1480, '���칫���ֶ����־�', '֧��һ', '���Ǿ�', null, '18945601139', 'A1000012B8226C', '230602196308130035', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1481, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601140', 'A1000012B82277', '230804198512270935', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1482, '���칫���ֶ����־�', '֧��һ', '�¹���', null, '18945601148', 'A1000012B82296', '230602196710013638', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1483, '���칫���ֶ����־�', '֧��һ', 'Ф��', null, '18945601150', 'A1000012B822A9', '230602196211014417', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1484, '���칫���ֶ����־�', '֧��һ', '�ĳ�ӡ', null, '18945601151', 'A1000012B8223A', '230602197308270219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1485, '���칫���ֶ����־�', '֧��һ', '�����', null, '18945601152', 'A1000012B82287', '110108197002102355', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1486, '���칫���ֶ����־�', '֧��һ', '��Ӣ', null, '18945601156', 'A1000012B82280', '230602196302023810', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1487, '���칫���ֶ����־�', '֧��һ', '����ͥ', null, '18945601157', 'A1000012B8229B', '230602195710200818', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1488, '���칫���ֶ����־�', '֧��һ', '����÷', null, '18945601158', 'A1000012B82293', '230602196310310828', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1489, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601159', 'A1000012B8228F', '230602197109201018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1490, '���칫���ֶ����־�', '֧��һ', 'Ҷ��', null, '18945601160', 'A1000012B7D056', '230603197604252513', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1491, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601161', 'A1000012B7D044', '23060319730930021X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1494, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601165', 'A1000012B7CF90', '230602197211173826', '0', '0', null, null, 0, '0001');
commit;
prompt 201 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1492, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601162', 'A1000012B7D04B', '23060219670925061X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1493, '���칫���ֶ����־�', '֧��һ', '�´���', null, '18945601163', 'A1000012B7D004', '230602197008123815', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1495, '���칫���ֶ����־�', '֧��һ', '�Һ��', null, '18945601166', 'A1000012B7D054', '230602197104010239', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1496, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601167', 'A1000012B7D05D', '230602195601293532', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1497, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601168', 'A1000012B7CFB4', '232302197211181012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1498, '���칫���ֶ����־�', '֧��һ', 'κ���', null, '18945601170', 'A1000012B7D053', '230602196906260411', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1499, '���칫���ֶ����־�', '֧��һ', '�ھ���', null, '18945601171', 'A1000012B7D048', '23070419751105021X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1500, '���칫���ֶ����־�', '֧��һ', '�ܹ���', null, '18945601173', 'A1000012B7D4D6', '230602196503011015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1501, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601174', 'A1000012B7D3CE', '230602196402193075', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1502, '���칫���ֶ����־�', '֧��һ', '�ű�', null, '18945601176', 'A1000012B7D4D7', '230602197607022127', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1503, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601177', 'A1000012B7D342', '230602196610100013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1504, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601178', 'A1000012B7D4D5', '230602196605281913', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1505, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601179', 'A1000012B7D395', '230605195902140011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1506, '���칫���ֶ����־�', '֧��һ', '����Ȫ', null, '18945601180', 'A1000012B7D4D8', '230602196501041915', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1507, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601181', 'A1000012B7D37B', '230602196312313037', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1508, '���칫���ֶ����־�', '֧��һ', '֣����', null, '18945601183', 'A1000012B7CE52', '230602197706144445', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1509, '���칫���ֶ����־�', '֧��һ', '���', null, '18945601185', 'A1000012B7CE79', '230602197908124418', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1510, '���칫���ֶ����־�', '֧��һ', '��ʿ��', null, '18945601186', 'A1000012B7B18C', '230602195101010437', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1511, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601187', 'A1000012B7B276', '230602196401200819', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1512, '���칫���ֶ����־�', '֧��һ', '��', null, '18945601188', 'A1000012B7B667', '230605196605262033', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1513, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601189', 'A1000012B7B701', '230606196204060060', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1514, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601190', 'A1000012B7B3AB', '232126197102070217', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1515, '���칫���ֶ����־�', '֧��һ', '�ﲨ', null, '18945601191', 'A1000012B7B3B4', '230104197512283450', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1516, '���칫���ֶ����־�', '֧��һ', '����ѧ', null, '18945601192', 'A1000012B7B6B2', '230603196402092318', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1517, '���칫���ֶ����־�', '֧��һ', '���', null, '18945601195', 'A1000012B7B399', '230602196910020816', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1518, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601196', 'A1000012B7B72F', '230603196909140251', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1519, '���칫���ֶ����־�', '֧��һ', '��ѧ��', null, '18945601197', 'A1000012B7B2F5', '230602197804132130', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1520, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601198', 'A1000012B7D04F', '230602196701301910', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1521, '���칫���ֶ����־�', '֧��һ', '�����', null, '18945601199', 'A1000012B7CFA1', '230602196511240416', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1522, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601200', 'A1000012B7D072', '23060219570322343X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1523, '���칫���ֶ����־�', '֧��һ', '�����', null, '18945601201', 'A1000012B7D090', '230602197008094014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1524, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601202', 'A1000012B7D06A', '230602196403015924', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1525, '���칫���ֶ����־�', '֧��һ', '�Ŵ���', null, '18945601203', 'A1000012B7CFB8', '230605197005150024', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1526, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601205', 'A1000012B7CFBB', '230602196303063865', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1527, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601206', 'A1000012B7D060', '230602197602266210', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1528, '���칫���ֶ����־�', '֧��һ', '١����', null, '18945601207', 'A1000012B7D068', '230602195808073829', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1529, '���칫���ֶ����־�', '֧��һ', '�Ŵ���', null, '18945601208', 'A1000012B7D00B', '230602196310140064', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1530, '���칫���ֶ����־�', '֧��һ', '�ƻ�', null, '18945601209', 'A1000012B82C74', '230602197212183815', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1531, '���칫���ֶ����־�', '֧��һ', '��ڽ�', null, '18945601210', 'A1000012B82D38', '230604195004192016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1532, '���칫���ֶ����־�', '֧��һ', '�����', null, '18945601211', 'A1000012B82DC5', '230602197709277518', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1533, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601212', 'A1000012B82D1B', '230602197512020233', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1534, '���칫���ֶ����־�', '֧��һ', '��Ƽ', null, '18945601213', 'A1000012B82D5A', '230602196404013410', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1535, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601215', 'A1000012B82DC9', '230602196810254017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1126, '���칫����', '���칫����', '�¹�ǿ', null, '18945600183', 'A1000012B78C05', '230602196711021955', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1127, '���칫����', '֧��һ', '����', null, '18945600185', 'A1000012B7A87F', '230602195901280013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1128, '���칫����', '֧��һ', '����', null, '18945600186', 'A1000012B757A5', '230602196906011933', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1129, '���칫����', '֧��һ1', '�߽�ǿ', null, '18945600188', 'A1000012B7BDB6', '230602196702020011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1130, '���칫����', '֧��һ1', '������', null, '18945600189', 'A1000012B82982', '230606196006151610', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1131, '���칫����', '֧��һ', '���', null, '18945600191', 'A1000012B7B38E', '230105197808010757', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1132, '���칫����', '֧��һ', '������', null, '18945600195', 'A1000012B82F94', '230602196812144014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1133, '���칫����', '֧��һ', '��´�', null, '18945600197', 'A1000012B82F9F', '230602196010261016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1134, '���칫����', '֧��һ', '��ϲ��', null, '18945600198', 'A1000012B83027', '230606195801280038', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1135, '���칫����', '֧��һ', '�Լ���', null, '18945600200', 'A1000012B7F2AC', '230603197507211322', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1136, '���칫����', '֧��һ', '������', null, '18945600789', 'A1000012B7F2A1', '230602196708111933', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1137, '���칫����', '֧��һ', '���Ǿ�', null, '18945600055', 'A1000012B7F2D1', '230602196601241949', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1138, '���칫����', '֧��һ', '�ܽ�', null, '18945600501', 'A1000012B7F283', '230602196306100617', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1139, '���칫����', '֧��һ', '���ĺ�', null, '18945600505', 'A1000012B7F2E8', '230602196503251975', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1140, '���칫����', '֧��һ', '����', null, '18945600506', 'A1000012B7F168', '230602197907287119', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1141, '���칫����', '֧��һ', '�Ŵ�ΰ', null, '18945600509', 'A1000012B7F2DC', '230602195805086237', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1142, '���칫����', '֧��һ', '������', null, '18945600511', 'A1000012B7F2D7', '230602195704273818', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1143, '���칫����', '֧��һ', '���', null, '18945600515', 'A1000012B7F2D3', '232328197703030011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1144, '���칫����', '֧��һ', '���ؿ�', null, '18945600516', 'A1000012B7F234', '23060219710215401X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1145, '���칫����', '֧��һ', '��ʤѧ', null, '18945600519', 'A1000012B830F5', '230221197311060711', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1146, '���칫����', '֧��һ', '��Ȫ', null, '18945600520', 'A1000012B82FF4', '230602198204105918', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1147, '���칫����', '֧��һ', '��־ǿ', null, '18945600521', 'A1000012B831EF', '230602197802052110', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1148, '���칫����', '֧��һ', '��ѩ��', null, '18945600523', 'A1000012B8324B', '230603196401281141', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1149, '���칫����', '֧��һ', '����', null, '18945600526', 'A1000012B831E7', '23060219670825001X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1150, '���칫����', '֧��һ', '����', null, '18945600527', 'A1000012B83247', '230602196809193886', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1151, '���칫����', '֧��һ', '����Ȫ', null, '18945600528', 'A1000012B83093', '230602195812121213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1152, '���칫����', '֧��һ', '����־', null, '18945600531', 'A1000012B83251', '230602196606100037', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1153, '���칫����', '֧��һ', '���ﰲ', null, '18945600532', 'A1000012B83127', '230602196009020012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1154, '���칫����', '֧��һ', '�￭', null, '18945600533', 'A1000012B823E8', '230602197710305918', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1155, '���칫����', '֧��һ', '����', null, '18945600535', 'A1000012B82992', '230602197709216221', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1156, '���칫����', '֧��һ', '������', null, '18945600536', 'A1000012B8299B', '230606196611075820', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1157, '���칫����', '֧��һ', '�߹�Ƽ', null, '18945600538', 'A1000012B8296C', '230602196409083821', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1158, '���칫����', '֧��һ', '۬����', null, '18945600539', 'A1000012B82926', '232722196710180228', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1159, '���칫����', '֧��һ', '�����', null, '18945600543', 'A1000012B82C89', '230602196811141970', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1160, '���칫����', '֧��һ', '������', null, '18945600545', 'A1000012B82940', '230602196407014427', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1161, '���칫����', '֧��һ', '��ಳ', null, '18945600550', 'A1000012B8299C', '230602196109085614', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1162, '���칫����', '֧��һ', '��ѩ��', null, '18945600556', 'A1000012B82986', '230604197912193662', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1163, '���칫����', '֧��һ', '���ֹ�', null, '18945600557', 'A1000012B8290B', '230605196106142010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1164, '���칫����', '֧��һ', '�̴���', null, '18945600558', 'A1000012B824DB', '230103197408085159', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1165, '���칫����', '֧��һ', '�����', null, '18945600559', 'A1000012B7D062', '23060219691128213X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1166, '���칫����', '֧��һ', '����˫', null, '18945600560', 'A1000012B7CFFD', '230602196901115151', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1167, '���칫����', '֧��һ', '����', null, '18945600566', 'A1000012B7CFB7', '230602197212283859', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1168, '���칫����', '֧��һ', '����ɭ', null, '18945600567', 'A1000012B7CF9D', '230602195806104214', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1169, '���칫����', '֧��һ', '������', null, '18945600568', 'A1000012B7D007', '230602196811300417', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1170, '���칫����', '֧��һ', '����', null, '18945600570', 'A1000012B7CF96', '23010319750303515X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1171, '���칫����', '֧��һ', '����Ȫ', null, '18945600577', 'A1000012B7CFBD', '230602197303307115', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1172, '���칫����', '֧��һ', '������', null, '18945600579', 'A1000012B7CF9E', '230602196909220810', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1173, '���칫����', '֧��һ', '����', null, '18945600037', 'A1000012B7CFA6', '232328197803250011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1174, '���칫����', '֧��һ', '���', null, '18945600583', 'A1000012B7CFA2', '230604196808061817', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1175, '���칫����', '֧��һ', '������', null, '18945600585', 'A1000012B83023', '230602197909285918', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1176, '���칫����', '֧��һ', '�ų�', null, '18945600586', 'A1000012B82F22', '230602196710261957', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1177, '���칫����', '֧��һ', '���', null, '18945600588', 'A1000012B82F1D', '230602197211166239', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1178, '���칫����', '֧��һ', '������', null, '18945600589', 'A1000012B82F3C', '230202196103091018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1179, '���칫����', '֧��һ', '�κ���', null, '18945600595', 'A1000012B82F21', '232328197010040014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1180, '���칫����', '֧��һ', '����־', null, '18945600599', 'A1000012B82F2E', '230602195708100017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1181, '���칫����', '֧��һ', '����', null, '18945600600', 'A1000012B82F3F', '230602195903023416', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1182, '���칫����', '֧��һ', 'Ф����', null, '18945600989', 'A1000012B82F04', '232303197212252050', '0', '0', null, null, 0, '0001');
commit;
prompt 301 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1183, '���칫����', '֧��һ', '�쾰��', null, '18945600601', 'A1000012B82F93', '230602197003064019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1184, '���칫����', '֧��һ', '�Ǻ���', null, '18945600605', 'A1000012B82F1B', '230602197710252174', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1185, '���칫����', '֧��һ', '���ַ�', null, '18945600606', 'A1000012B7F82C', '230602196704071954', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1186, '���칫����', '֧��һ', '����', null, '18945600607', 'A1000012B7F84F', '230602196003220013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1187, '���칫����', '֧��һ', '������', null, '18945600608', 'A1000012B7F854', '222326197407109214', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1188, '���칫����', '֧��һ', '���ƿ�', null, '18945600609', 'A1000012B7F85B', '230602197606295158', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1189, '���칫����', '֧��һ', '�Ų���', null, '18945600610', 'A1000012B7F6D2', '230602197707052155', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1190, '���칫����', '֧��һ', '����ΰ', null, '18945600611', 'A1000012B7F817', '230103197809172835', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1191, '���칫����', '֧��һ', '�꾰��', null, '18945600612', 'A1000012B7F80C', '230602197705074414', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1192, '���칫����', '֧��һ', '������', null, '18945600616', 'A1000012B7F6D0', '230103197612154617', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1193, '���칫����', '֧��һ', '��ѧ��', null, '18945600617', 'A1000012B7F85E', '230603197103242333', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1194, '���칫����', '֧��һ', '�Ż᳼', null, '18945600618', 'A1000012B7F823', '230602197202040618', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1195, '���칫����', '֧��һ', '��ΡΡ', null, '18945600619', 'A1000012B7B64B', '230602197912144024', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1196, '���칫����', '֧��һ', '֣��', null, '18945600626', 'A1000012B7B252', '231024197512130033', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1197, '���칫����', '֧��һ', '����', null, '18945600627', 'A1000012B7B651', '230602197602104019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1198, '���칫����', '֧��һ', '��ΰ��', null, '18945600628', 'A1000012B7B2BA', '230602196908081919', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1199, '���칫����', '֧��һ', '����־', null, '18945600629', 'A1000012B7B2C9', '230602198002252530', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1200, '���칫����', '֧��һ', '����˴', null, '18945600630', 'A1000012B7B589', '230602197511194012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1201, '���칫����', '֧��һ', '����Ϊ', null, '18945600631', 'A1000012B7B2CC', '230603197803291371', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1202, '���칫����', '֧��һ', '�޹���', null, '18945600633', 'A1000012B7B710', '230602197210124010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1286, '���칫����', '֧��һ', '�', null, '18945600819', 'A1000012B815FC', '230203197406122310', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1287, '���칫����', '֧��һ', '����', null, '18945600820', 'A1000012B8161C', '23060219630904303X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1288, '���칫����', '֧��һ', '���ӷ�', null, '18945600821', 'A1000012B82CAC', '230602197004165014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1289, '���칫����', '֧��һ', '��Ҿ�', null, '18945600822', 'A1000012B82C8F', '230604196409052614', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1290, '���칫����', '֧��һ', '������', null, '18945600825', 'A1000012B82C67', '232700197008130016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1291, '���칫����', '֧��һ', '����', null, '18945600828', 'A1000012B82CBC', '230605196405170812', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1292, '���칫����', '֧��һ', '�̱�', null, '18945600829', 'A1000012B82C48', '230605196008030023', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1293, '���칫����', '֧��һ', '������', null, '18945600830', 'A1000012B82956', '230604196708080228', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1294, '���칫����', '֧��һ', '���', null, '18945600831', 'A1000012B82C7F', '230602197202073057', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1295, '���칫����', '֧��һ', '��Ө', null, '18945600832', 'A1000012B82B6A', '23060419800419471X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1296, '���칫����', '֧��һ', '������', null, '18945600833', 'A1000012B82CBE', '230604196702232614', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1297, '���칫����', '֧��һ', '�⺣��', null, '18945600835', 'A1000012B82C72', '230602197602194034', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1298, '���칫����', '֧��һ', 'Ҧ����', null, '18945600836', 'A1000012B820DD', '230606197501061756', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1299, '���칫����', '֧��һ', '���', null, '18945600837', 'A1000012B81C92', '230602197410122853', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1300, '���칫����', '֧��һ', '����', null, '18945600838', 'A1000012B82120', '230602197203170019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1301, '���칫����', '֧��һ', '��ά��', null, '18945600839', 'A1000012B820E7', '230605196401312019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1302, '���칫����', '֧��һ', '�Դ���', null, '18945600856', 'A1000012B8208D', '230602196308190417', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1303, '���칫����', '֧��һ', '���ޱ�', null, '18945600849', 'A1000012B81E0F', '230602197602063632', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1304, '���칫����', '֧��һ', '��ΰ', null, '18945600851', 'A1000012B820ED', '230602197607200210', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1305, '���칫����', '֧��һ', '��׿Ⱥ', null, '18945601155', 'A1000012B83020', '23060219681115021X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1306, '���칫����', '֧��һ', '������', null, '18945600857', 'A1000012B820CD', '230604198011154724', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1307, '���칫����', '֧��һ', '��Ƽ', null, '18945600858', 'A1000012B820D8', '230604197310081823', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1308, '���칫����', '֧��һ', '�ߏ�ɼ', null, '18945600860', 'A1000012B820BE', '23060319770619211X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1309, '���칫����', '֧��һ', '���ٴ�', null, '18945600861', 'A1000012B7D7D2', '230602198106134010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1310, '���칫����', '֧��һ', '���Ľ�', null, '18945600863', 'A1000012B7D718', '230604197512314138', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1311, '���칫����', '֧��һ', '�����', null, '18945600865', 'A1000012B7D7D3', '230226197510302818', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1312, '���칫����', '֧��һ', '������', null, '18945600866', 'A1000012B7D71A', '230602197112173812', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1313, '���칫����', '֧��һ', '����', null, '18945600868', 'A1000012B7D740', '230602197909086353', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1314, '���칫����', '֧��һ', '������', null, '18945600869', 'A1000012B7D7D5', '230605196210261634', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1315, '���칫����', '֧��һ', '��־��', null, '18945600870', 'A1000012B7D741', '230605197609100212', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1316, '���칫����', '֧��һ', '�մ���', null, '18945600876', 'A1000012B7D74A', '230603197504074019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1317, '���칫����', '֧��һ', '�����', null, '18945600877', 'A1000012B7D724', '230602196804191953', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1318, '���칫����', '֧��һ', '����', null, '18945600878', 'A1000012B7D721', '230604197507115417', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1319, '���칫����', '֧��һ', '��ά��', null, '18945600879', 'A1000012B8162D', '230606196402051654', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1320, '���칫����', '֧��һ', '���س�', null, '18945600880', 'A1000012B81630', '230606196406040012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1321, '���칫����', '֧��һ', '��ѧ��', null, '18945600881', 'A1000012B815FD', '230603195710143012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1322, '���칫����', '֧��һ', '۬Ӣƽ', null, '18945600882', 'A1000012B822C0', '230606196212010771', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1323, '���칫����', '֧��һ', '�ܾ���', null, '18945600883', 'A1000012B822C7', '230606197303050255', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1324, '���칫����', '֧��һ', '����', null, '18945600885', 'A1000012B815D1', '230604197507152613', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1325, '���칫����', '֧��һ', '����ΰ', null, '18945600886', 'A1000012B822C1', '230602197505294017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1326, '���칫����', '֧��һ', '���׹�', null, '18945600887', 'A1000012B82285', '230602197209073818', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1327, '���칫����', '֧��һ', '��ά��', null, '18945600889', 'A1000012B81606', '230604197508010633', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1328, '���칫����', '֧��һ', '�Ź���', null, '18945600890', 'A1000012B815FB', '230605196109240011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1329, '���칫����', '֧��һ', '���ˮ', null, '18945600891', 'A1000012B82225', '230606195901150011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1330, '���칫����', '֧��һ', '�', null, '18945600892', 'A1000012B82228', '230606196412120019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1331, '���칫����', '֧��һ', 'ţ�ٺ�', null, '18945600893', 'A1000012B82214', '230606196704171918', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1332, '���칫����', '֧��һ', '����', null, '18945600895', 'A1000012B821FE', '230602195410096211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1333, '���칫����', '֧��һ', '������', null, '18945600896', 'A1000012B82201', '230602195602033434', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1334, '���칫����', '֧��һ', '��ϲ��', null, '18945600897', 'A1000012B8221E', '230605195304151255', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1335, '���칫����', '֧��һ', '�ż̸�', null, '18945600898', 'A1000012B8222C', '230605197510030613', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1336, '���칫����', '֧��һ', '�ڿ���', null, '18945600899', 'A1000012B82241', '110108196212225738', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1337, '���칫����', '֧��һ', '�ź���', null, '18945600900', 'A1000012B821F2', '230602197604106210', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1338, '���칫����', '֧��һ', '���ҷ�', null, '18945600901', 'A1000012B82215', '230602196602070213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1339, '���칫����', '֧��һ', '��˼��', null, '18945600902', 'A1000012B7C425', '321002196703221818', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1340, '���칫����', '֧��һ', '����', null, '18945600903', 'A1000012B7C3CF', '230602196606141912', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1341, '���칫����', '֧��һ', '������', null, '18945600905', 'A1000012B7C38F', '230604196405092619', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1342, '���칫����', '֧��һ', '��', null, '18945600906', 'A1000012B7C41D', '230602196405100831', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1343, '���칫����', '֧��һ', '��ά��', null, '18945600907', 'A1000012B7C415', '230602195810150213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1344, '���칫����', '֧��һ', '��ѩ��', null, '18945600908', 'A1000012B7C434', '230604197410304713', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1345, '���칫����', '֧��һ', '�����', null, '18945600909', 'A1000012B7C391', '230602196603011936', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1346, '���칫����', '֧��һ', '������', null, '18945600910', 'A1000012B7C432', '372301197201281911', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1347, '���칫����', '֧��һ', '��Ҹ�', null, '18945600911', 'A1000012B7C42A', '230226197503192817', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1348, '���칫����', '֧��һ', '������', null, '18945600913', 'A1000012B7C38D', '230602196304143015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1349, '���칫����', '֧��һ', '�ﳤ��', null, '18945600915', 'A1000012B7590C', '230604196503221218', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1350, '���칫����', '֧��һ', '������', null, '18945600916', 'A1000012B78C82', '230604197612124112', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1351, '���칫����', '֧��һ', '����', null, '18945600917', 'A1000012B7BB5A', '230602197202283839', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1352, '���칫����', '֧��һ', '�±���', null, '18945600918', 'A1000012B76B3F', '230605197510261016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1353, '���칫����', '֧��һ', '�޼Һ�', null, '18945600919', 'A1000012B7A565', '230602195602270413', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1354, '���칫����', '֧��һ', '���Ը�', null, '18945600920', 'A1000012B82F92', '230605196509191634', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1355, '���칫����', '֧��һ', '�뱦��', null, '18945600923', 'A1000012B7B835', '23060219750504021X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1356, '���칫����', '֧��һ', '��ʿ��', null, '18945600926', 'A1000012B78CA9', '230604196302012612', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1357, '���칫����', '֧��һ', '������', null, '18945600927', 'A1000012B7591B', '230602196503281218', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1358, '���칫����', '֧��һ', '���ɲ�', null, '18945600928', 'A1000012B7594E', '230605196409190036', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1359, '���칫����', '֧��һ', '���꽭', null, '18945600929', 'A1000012B7D504', '230602195503102211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1360, '���칫����', '֧��һ', '��ΰ', null, '18945600930', 'A1000012B7D58B', '230605196602200814', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1361, '���칫����', '֧��һ', '����̩', null, '18945600933', 'A1000012B7D4D3', '230605197505101413', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1362, '���칫����', '֧��һ', '������', null, '18945600935', 'A1000012B7D59B', '230605195209032012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1363, '���칫����', '֧��һ', '�Ű���', null, '18945600936', 'A1000012B7D52F', '230602196210213430', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1364, '���칫����', '֧��һ', '����ɽ', null, '18945600937', 'A1000012B7D57E', '230602195507153817', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1365, '���칫����', '֧��һ', '��ΰ', null, '18945600938', 'A1000012B7D536', '23060219671030286X', '0', '0', null, null, 0, '0001');
commit;
prompt 401 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1375, '���칫����', '֧��һ', '������', null, '18945600962', '15555218135', '230604197406065115', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (102, '���칫���ֻ�ս�־�', '��ս�־�', '��', null, '18945601521', 'A1000012B7B8D4', '230602197011150216', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (103, '���칫���ֻ�ս�־�', '��ս�־�', '�뽡��', null, '18945601523', 'A1000012B7B7F6', '230602197811262136', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (104, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601525', 'A1000012B7B99E', '230602198304193628', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (105, '���칫���ֻ�ս�־�', '��ս�־�', '�մ���', null, '18945601526', 'A1000012B82E3A', '230602198011197510', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (106, '���칫���ֻ�ս�־�', '��ս�־�', '��־ǿ', null, '18945601527', 'A1000012B82DE3', '23060219600725021X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (107, '���칫���ֻ�ս�־�', '��ս�־�', '��ҫ��', null, '18945601528', 'A1000012B829CC', '230602196605182317', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (108, '���칫���ֻ�ս�־�', '��ս�־�', '�޳ɻ�', null, '18945601529', 'A1000012B822A6', '230602196607051919', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (109, '���칫���ֻ�ս�־�', '��ս�־�', '��ΰ', null, '18945601530', 'A1000012B8223F', '230602196508201213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (110, '���칫���ֻ�ս�־�', '��ս�־�', '����ϼ', null, '18945601531', 'A1000012 BE238', '230602197410024428', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (111, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601532', 'A1000012B7BBB7', '230602197802212153', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (112, '���칫���ֻ�ս�־�', '��ս�־�', '���ؾ�', null, '18945601535', 'A1000012B7BAC4', '230103196812064232', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (113, '���칫���ֻ�ս�־�', '��ս�־�', '���ҷ�', null, '18945601536', 'A1000012B82261', '230602197212011722', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (114, '���칫���ֻ�ս�־�', '��ս�־�', '�����', null, '18945601537', 'A1000012B822AE', '220519197212275234', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (115, '���칫���ֻ�ս�־�', '��ս�־�', '«����', null, '18945601538', 'A1000012B822A7', '230604196211130023', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (116, '���칫���ֻ�ս�־�', '��ս�־�', '���绪', null, '18945601539', 'A1000012B8228D', '230602196205022728', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (117, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601540', 'A1000012B822B8', '230604196401241613', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (118, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601541', 'A1000012B822AB', '230606196809100219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (119, '���칫���ֻ�ս�־�', '��ս�־�', '���챦', null, '18945601542', 'A1000012B822B3', '230604197209253037', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (120, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601543', 'A1000012B7F85D', '230602196912256515', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (121, '���칫���ֻ�ս�־�', '��ս�־�', '���˽�', null, '18945601545', 'A1000012B7F869', '230602195210020810', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (122, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601546', 'A1000012B7F6CE', '230226197408020013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (123, '���칫���ֻ�ս�־�', '��ս�־�', '��ѩ��', null, '18945601547', 'A1000012B7F863', '230602197011040412', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (124, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601548', 'A1000012B7F82D', '230602196302182512', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (125, '���칫���ֻ�ս�־�', '��ս�־�', '�¹���', null, '18945601549', 'A1000012B7F84A', '230602196009100813', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (126, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601550', 'A1000012B7F791', '230605197608231421', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (127, '���칫���ֻ�ս�־�', '��ս�־�', '��ΰ', null, '18945601551', 'A1000012B822B7', '230602196812175021', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (128, '���칫���ֻ�ս�־�', '��ս�־�', '�����', null, '18945601552', 'A1000012B7F36E', '230602196402073831', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (129, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601553', 'A1000012B7F6CF', '230602196001170817', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (130, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601556', 'A1000012B8163B', '230602195412280258', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (131, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601557', 'A1000012B7F819', '230623198204170105', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (132, '���칫���ֻ�ս�־�', '��ս�־�', '��С��', null, '18945601558', 'A1000012B81602', '230602197309020211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (133, '���칫���ֻ�ս�־�', '��ս�־�', '�����', null, '18945601559', 'A1000012B815EE', '230602196110251915', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (134, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601560', 'A1000012B81611', '230602196412051011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (135, '���칫�������˷־�', '���˷־�', '������', null, '18945601025', 'A1000012B7D00E', '230602196511150429', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (136, '���칫�������˷־�', '���˷־�', '���Ź�', null, '18945601561', 'A1000012B81618', '230603196410240413', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (137, '���칫�������˷־�', '���˷־�', '������', null, '18945601563', 'A1000012B815D0', '230602195909290822', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (138, '���칫�������˷־�', '���˷־�', '�����', null, '18945601565', 'A1000012B81637', '230602196907116518', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (139, '���칫�������˷־�', '���˷־�', '������', null, '18945601566', 'A1000012B815CB', '230223198106070221', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (140, '���칫�������˷־�', '���˷־�', '������', null, '18945601567', 'A1000012B81629', '230602197612312110', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (141, '���칫�������˷־�', '���˷־�', '���ǿ', null, '18945601568', 'A1000012B7D076', '230602196807031015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (142, '���칫�������˷־�', '���˷־�', '����', null, '18945601569', 'A1000012B7D00D', '230602196210180843', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (143, '���칫�������˷־�', '���˷־�', '��ѩ��', null, '18945601570', 'A1000012B7C90E', '230602197502075919', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (144, '���칫�������˷־�', '���˷־�', '������', null, '18945601575', 'A1000012B815EB', '232304198004207918', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (145, '���칫�������˷־�', '���˷־�', '����÷', null, '18945601577', 'A1000012B7CF9C', '230602197705021021', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (146, '���칫�������˷־�', '���˷־�', '�����', null, '18945601579', 'A1000012B7D063', '230602197103150213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (147, '���칫�������˷־�', '���˷־�', '������', null, '18945601580', 'A1000012B82C66', '230602196012272333', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (148, '���칫�������˷־�', '���˷־�', '������', null, '18945601581', 'A1000012B7CF97', '230605197304120212', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (149, '���칫�������˷־�', '���˷־�', '������', null, '18945601582', 'A1000012B82C44', '230602196204260425', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (150, '���칫�������˷־�', '���˷־�', '������', null, '18945601583', 'A1000012B7CFA9', '230602197302241038', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (151, '���칫�������˷־�', '���˷־�', '����ΰ', null, '18945601585', 'A1000012B7D00F', '230603198008021318', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (152, '���칫�������˷־�', '���˷־�', '������', null, '18945601586', 'A1000012B82CA8', '230403197109270238', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (153, '���칫�������˷־�', '���˷־�', '����', null, '18945601587', 'A1000012B82C32', '230602196802201011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (154, '���칫�������˷־�', '���˷־�', 'ʯ��', null, '18945601588', 'A1000012B82BC5', '230602198109223617', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (155, '���칫�������˷־�', '���˷־�', '��ұ', null, '18945601589', 'A1000012B7CF9B', '230602196309130854', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (156, '���칫�������˷־�', '���˷־�', '���޾�', null, '18945601590', 'A1000012B82BF4', '23060219690820101X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (157, '���칫�������˷־�', '���˷־�', '����', null, '18945601593', 'A1000012B82C5A', '230604197401210627', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (158, '���칫�������˷־�', '���˷־�', '��־ΰ', null, '18945601595', 'A1000012B82C61', '230605197612082211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (159, '���칫�������˷־�', '���˷־�', '�½�', null, '18945601596', 'A1000012B82C46', '230605197103071610', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (160, '���칫�������˷־�', '���˷־�', '������', null, '18945601598', 'A1000012B82C4D', '230602196610256210', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (161, '���칫�������˷־�', '���˷־�', '�Ų�', null, '18945601599', 'A1000012B82963', '230602198210194419', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (162, '���칫�������˷־�', '���˷־�', '������', null, '18945601600', 'A1000012B829D6', '23060219660314101X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (163, '���칫�������˷־�', '���˷־�', '�߷�', null, '18945601601', 'A1000012B8294E', '230602196905070413', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (164, '���칫�������˷־�', '���˷־�', 'κ����', null, '18945601602', 'A1000012B8295F', '230602196101120016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (165, '���칫�������˷־�', '���˷־�', '�޸�־', null, '18945601603', 'A1000012B82C85', '230604196504162811', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (166, '���칫�������˷־�', '���˷־�', '���齭', null, '18945601605', 'A1000012B825ED', '230602195308270017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (167, '���칫�������˷־�', '���˷־�', '������', null, '18945601606', 'A1000012B8280E', '231181198108081134', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (168, '���칫�������˷־�', '���˷־�', '����', null, '18945601607', 'A1000012B829AB', '230602197005313015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (169, '���칫�������˷־�', '���˷־�', '������', null, '18945601608', 'A1000012B82571', '230605196301060811', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (170, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945601609', 'A1000012B82598', '230606196507141613', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (171, '���칫�������˷־�', '���˷־�', '������', null, '18945601610', 'A1000012B7D8B4', '230602197201161717', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (172, '���칫�������˷־�', '���˷־�', '��˫', null, '18945601611', 'A1000012B7D880', '230602196509281518', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (173, '���칫�������˷־�', '���˷־�', '�����', null, '18945601612', 'A1000012B7D9FD', '230602196710110016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (174, '���칫�������˷־�', '���˷־�', '������', null, '18945601613', 'A1000012B7D89D', '23060219600221341X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (175, '���칫�������˷־�', '���˷־�', '�ź���', null, '18945601615', 'A1000012B7D6D0', '230602197903116216', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (176, '���칫�������˷־�', '���˷־�', '�����', null, '18945601616', 'A1000012B7D9FF', '230712196111110338', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (177, '���칫�������˷־�', '���˷־�', '������', null, '18945601617', 'A1000012B7D834', '230602197408250215', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (178, '���칫�������˷־�', '���˷־�', '����', null, '18945601618', 'A1000012B7D89A', '230602197404184417', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (179, '���칫�������˷־�', '���˷־�', '����·', null, '18945601619', 'A1000012B7D875', '230602196912132117', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (180, '���칫�������˷־�', '���˷־�', '�Դ���', null, '18945601620', 'A1000012B7D89E', '230602198301024415', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (181, '���칫�������˷־�', '���˷־�', '������', null, '18945601621', 'A1000012B7C442', '230602196210253811', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (182, '���칫�������˷־�', '���˷־�', '�޶���', null, '18945601626', 'A1000012B7C41E', '23022319710715203X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (183, '���칫�������˷־�', '���˷־�', '�Ź���', null, '18945601628', 'A1000012B7C448', '230602196302210819', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (184, '���칫�������˷־�', '���˷־�', '����', null, '18945601630', 'A1000012B7C3F7', '230602196203290817', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (185, '���칫�������˷־�', '���˷־�', '������', null, '18945601633', 'A1000012B7C453', '230602196812201939', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (186, '���칫�������˷־�', '���˷־�', '���ٺ�', null, '18945601636', 'A1000012BF227D', '230602196610031978', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (187, '���칫�������˷־�', '���˷־�', '���ܺ�', null, '18945601637', 'A1000012B7C460', '230602196001200422', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (188, '���칫�������˷־�', '���˷־�', '�����', null, '18945601638', 'A1000012B75D85', '230606197308230239', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (189, '���칫�������˷־�', '���˷־�', '�ں���', null, '18945601639', 'A1000012B7B9F7', '230602196107063833', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (190, '���칫�������˷־�', '���˷־�', '������', null, '18945601640', 'A1000012B7BB28', '230602196312202310', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (191, '���칫�������˷־�', '���˷־�', '�Ź���', null, '18945601646', 'A1000012B7C429', '230602196505183013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (192, '���칫�������˷־�', '���˷־�', '����', null, '18945601648', 'A1000012B75D70', '230602197103100814', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (193, '���칫�������˷־�', '���˷־�', '���鼯', null, '18945601650', 'A1000012B75B36', '230606197306080214', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (194, '���칫�������˷־�', '���˷־�', '������', null, '18945601651', 'A1000012B758A3', '230602195709240011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (195, '���칫�������˷־�', '���˷־�', '������', null, '18945601654', 'A1000012B7B9ED', '230602198204172512', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (196, '���칫�������˷־�', '���˷־�', '����ƽ', null, '18945601655', 'A1000012B7BA7F', '230602196012020013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (197, '���칫�������˷־�', '���˷־�', '����ɽ', null, '18945601657', 'A1000012B78B91', '230602196703030819', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (198, '���칫�������˷־�', '���˷־�', '��Ծ��', null, '18945601658', 'A1000012B7C420', '230602196404280017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (199, '���칫�������˷־�', '���˷־�', '���嶫', null, '18945601660', 'A1000012B7C449', '230602197012082315', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (200, '���칫�������˷־�', '���˷־�', '�޵���', null, '18945601661', 'A1000012B7BDE3', '230604196907270614', '0', '0', null, null, 0, '0001');
commit;
prompt 501 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (201, '���칫�������˷־�', '���˷־�', '������', null, '18945601662', 'A1000012B7D318', '23060219640511001X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (202, '���칫�������˷־�', '���˷־�', '���', null, '18945601663', 'A1000012B7D2E9', '230602195902025313', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (203, '���칫�������˷־�', '���˷־�', '�˴���', null, '18945601665', 'A1000012B7D2C5', '232301197511154618', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (204, '���칫�������˷־�', '���˷־�', '��־ƽ', null, '18945601667', 'A1000012B7D30B', '230602196803303618', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (205, '���칫�������˷־�', '���˷־�', '�Ÿ���', null, '18945601668', 'A1000012B7D2F6', '23062419811211281X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (206, '���칫�������˷־�', '���˷־�', '����', null, '18945601669', 'A1000012B7D2D9', '23060619731228175X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (207, '���칫�������˷־�', '���˷־�', '������', null, '18945601670', 'A1000012B7C42B', '230602196805121973', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (208, '���칫�������˷־�', '���˷־�', '��˼��', null, '18945601671', 'A1000012B7D2D3', '230602196505103415', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (209, '���칫�������˷־�', '���˷־�', '�ſ���', null, '18945601675', 'A1000012B7D31F', '23060219581117003X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (210, '���칫�������˷־�', '���˷־�', '������', null, '18945601676', 'A1000012B7D2D1', '230602196106267519', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (211, '���칫�������˷־�', '���˷־�', '���Ҳ�', null, '18945601677', 'A1000012B7C3D0', '230606197002034876', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (212, '���칫�������˷־�', '���˷־�', '��ʵ��', null, '18945601678', 'A1000012B80155', '230602196607251910', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (213, '���칫�������˷־�', '���˷־�', '���齿', null, '18945601679', 'A1000012B82B6D', '230603197403200223', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (214, '���칫�������˷־�', '���˷־�', '��ԣ��', null, '18945601680', 'A1000012B829E4', '230602197409280619', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (215, '���칫�������˷־�', '���˷־�', '�ﱣ��', null, '18945601681', 'A1000012B7C441', '23060219710721101X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (216, '���칫�������˷־�', '���˷־�', '�޸�', null, '18945601682', 'A1000012B829C3', '230602195910255311', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (217, '���칫�������˷־�', '���˷־�', '���Ѿ�', null, '18945601683', 'A1000012B7C40C', '230604195804080012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (218, '���칫�������˷־�', '���˷־�', '�佨��', null, '18945601685', 'A1000012B7C3F4', '230602195808183817', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (219, '���칫�������˷־�', '���˷־�', '����', null, '18945601686', 'A1000012B7D317', '230602196210040015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (220, '���칫�������˷־�', '���˷־�', '�����', null, '18945601688', 'A1000012B7C430', '230602196703051011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (221, '���칫�������˷־�', '���˷־�', '���', null, '18945601689', 'A1000012B7C3D3', '230602196212250614', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (222, '���칫�������˷־�', '���˷־�', '������', null, '18945601690', 'A1000012B7C3F3', '230606196812180010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (223, '���칫�������˷־�', '���˷־�', '���', null, '18945601691', 'A1000012B82952', '230602196707231925', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (224, '���칫�������˷־�', '���˷־�', 'Ҧ����', null, '18945601693', 'A1000012B829EB', '230602197008271711', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (225, '���칫�������˷־�', '���˷־�', '������', null, '18945601695', 'A1000012B7C3F9', '230602196610271912', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (226, '���칫�������˷־�', '���˷־�', '������', null, '18945601696', 'A1000012B7C413', '230602197012153056', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (227, '���칫�������˷־�', '���˷־�', '������', null, '18945601697', 'A1000012B829DC', '34010419710120205X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (228, '���칫�������˷־�', '���˷־�', '�ں���', null, '18945601698', 'A1000012B8297C', '230602197911162132', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (229, '���칫�������˷־�', '���˷־�', '��ΰ', null, '18945601699', 'A1000012B829C1', '230602197512263219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (230, '���칫�������˷־�', '���˷־�', '������', null, '18945601700', 'A1000012B82A41', '230604196005020018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (231, '���칫�������˷־�', '���˷־�', '�ǻ�', null, '18945601701', 'A1000012B82FA1', '230603197108010013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (232, '���칫�������˷־�', '���˷־�', '��ͨ', null, '18945601702', 'A1000012B82F23', '230605197305200716', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (233, '���칫�������˷־�', '���˷־�', '����', null, '18945601703', 'A1000012B825AA', '230602196308120814', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (234, '���칫�������˷־�', '���˷־�', '�ڻ���', null, '18945601706', 'A1000012B82F2B', '230602196007213013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (235, '���칫�������˷־�', '���˷־�', '�Ž���', null, '18945601707', 'A1000012B82F8D', '230602196110260037', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (236, '���칫�������˷־�', '���˷־�', '��ѧ��', null, '18945601709', 'A1000012B82973', '230602197508014420', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (237, '���칫�������˷־�', '���˷־�', '�����', null, '18945601710', 'A1000012B824D5', '230602197103091735', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (238, '���칫�������˷־�', '���˷־�', 'Ԭ����', null, '18945601711', 'A1000012B829B3', '23060219650518151X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (239, '���칫�������˷־�', '���˷־�', '�����', null, '18945601712', 'A1000012B829D1', '230602197212170037', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (240, '���칫�������˷־�', '���˷־�', '������', null, '18945601716', 'A1000012B7E9CE', '230602197112111718', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (241, '���칫�������˷־�', '���˷־�', '��Ұ', null, '18945601717', 'A1000012B7EB0C', '230604197111272416', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (242, '���칫�������˷־�', '���˷־�', '�߸�', null, '18945601718', 'A1000012B82F1F', '230602196306132715', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (243, '���칫�������˷־�', '���˷־�', '�걦', null, '18945601719', 'A1000012B7E37B', '230602196206082714', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (244, '���칫�������˷־�', '���˷־�', '�޹���', null, '18945601721', 'A1000012B7EADF', '230602197901252150', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (245, '���칫�������˷־�', '���˷־�', '���', null, '18945601725', 'A1000012B7EB56', '230602197305103634', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (246, '���칫�������˷־�', '���˷־�', '١����', null, '18945601726', 'A1000012B82816', '230602197311242534', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (247, '���칫�������˷־�', '���˷־�', '������', null, '18945601727', 'A1000012B7EA4C', '230602197403192116', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (248, '���칫�������˷־�', '���˷־�', '�ż���', null, '18945601728', 'A1000012B7EAE2', '230605197010180834', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (249, '���칫�������˷־�', '���˷־�', '��ά��', null, '18945601729', 'A1000012B82F42', '230602196111260610', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (250, '���칫���ֹ����־�', '�����־�', '����ɽ', null, '18945600061', 'A1000012B829A6', '23060419630804181X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (251, '���칫���ֹ����־�', '�����־�', '������', null, '18945602801', 'A1000012B7D2D2', '230605195708110011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (252, '���칫���ֹ����־�', '�����־�', '����ΰ', null, '18945602802', 'A1000012B7D316', '230602196707211916', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (253, '���칫���ֹ����־�', '�����־�', '�����', null, '18945602803', 'A1000012B829D3', '230604196311220413', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (254, '���칫���ֹ����־�', '�����־�', '����', null, '18945602805', 'A1000012B7D2FE', '230603196411131139', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (255, '���칫���ֹ����־�', '�����־�', '������', null, '18945602806', 'A1000012B82F5F', '230604196109030018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (256, '���칫���ֹ����־�', '�����־�', '���ΰ', null, '18945602807', 'A1000012B824A4', '230602197312154018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (257, '���칫���ֹ����־�', '�����־�', '����', null, '18945602808', 'A1000012B7E2E7', '230602196312245919', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (258, '���칫���ֹ����־�', '�����־�', '���Ƹ�', null, '18945602809', 'A1000012B7C440', '230606196207290019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (259, '���칫���ֹ����־�', '�����־�', '��ѧΰ', null, '18945602810', 'A1000012B82820', '231121198107241910', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (260, '���칫���ֹ����־�', '�����־�', '�Ž�', null, '18945602811', 'A1000012B829B0', '230604198211262623', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (261, '���칫���ֹ����־�', '�����־�', 'Ҧ��ϼ', null, '18945602812', 'A1000012B82565', '230103197904034625', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (262, '���칫���ֹ����־�', '�����־�', 'κ�t', null, '18945602815', 'A1000012B7D3F3', '230602197306213229', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (263, '���칫���ֹ����־�', '�����־�', '�����', null, '18945602816', 'A1000012B7D2DC', '230602196812091960', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (264, '���칫���ֹ����־�', '�����־�', '��˸', null, '18945602817', 'A1000012B7D2C4', '23010319760710464X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (265, '���칫���ֹ����־�', '�����־�', '���޺�', null, '18945602818', 'A1000012B82F8F', '230602197704055721', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (266, '���칫���ֹ����־�', '�����־�', '������', null, '18945602819', 'A1000012B829AE', '230602196004020013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (267, '���칫���ֹ����־�', '�����־�', '���ľ�', null, '18945602820', 'A1000012B7D325', '230602196001110419', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (268, '���칫���ֹ����־�', '�����־�', '�»�ǫ', null, '18945602821', 'A1000012B829B4', '230602195608015915', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (269, '���칫���ֹ����־�', '�����־�', '�߳���', null, '18945602822', 'A1000012B82971', '230602196201153413', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (270, '���칫���ֹ����־�', '�����־�', '����', null, '18945602825', 'A1000012B7D13C', '23060219600401043X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (271, '���칫���ֹ����־�', '�����־�', '����', null, '18945602826', 'A1000012B82841', '230602197707014415', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (272, '���칫���ֹ����־�', '�����־�', '������', null, '18945602827', 'A1000012B829B8', '230603198211150211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (273, '���칫���ֹ����־�', '�����־�', '����ǧ', null, '18945602828', 'A1000012B7D14C', '230602196609091957', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (274, '���칫���ֹ����־�', '�����־�', '��ΰ��', null, '18945602829', 'A1000012B7D147', '23060219601121385', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (275, '���칫���ֹ����־�', '�����־�', '�����', null, '18945602830', 'A1000012B7CF95', '230602197901203615', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (276, '���칫���ֹ����־�', '�����־�', 'Ĳ��', null, '18945602831', 'A1000012B7D2EA', '230603197807203711', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (277, '���칫���ֹ����־�', '�����־�', '��΢', null, '18945602832', 'A1000012B7D13D', '23060319810724092X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (278, '���칫���ֹ����־�', '�����־�', '��Ұ', null, '18945602833', 'A1000012B7B645', '230602197510204012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (279, '���칫���ֹ����־�', '�����־�', '����', null, '18945602835', 'A1000012B829C7', '230602197703013212', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (280, '���칫���ֹ����־�', '�����־�', '����', null, '18945602837', 'A1000012B7D141', '23060619811217281X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (281, '���칫���ֹ����־�', '�����־�', '������', null, '18945602838', 'A1000012B7B676', '230623198203290017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (282, '���칫���ֹ����־�', '�����־�', '�ܼ�', null, '18945602839', 'A1000012B7B2E5', '230602197809292117', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (283, '���칫���ֹ����־�', '�����־�', '����ƽ', null, '18945602850', 'A1000012B7D13E', '230602196007250412', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (284, '���칫���ֹ����־�', '�����־�', '��ΰ', null, '18945602851', 'A1000012B7D008', '23060219811020101X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (285, '���칫���ֹ����־�', '�����־�', '������', null, '18945602852', 'A1000012B829DE', '230603198112301379', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (286, '���칫���ֹ����־�', '�����־�', '��ΰ��', null, '18945602853', 'A1000012B7CFAC', '230603198206072511', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (287, '���칫���ֹ����־�', '�����־�', '������', null, '18945602855', 'A1000012B7D14B', '230603198111132526', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (288, '���칫���ֹ����־�', '�����־�', '������', null, '18945602856', 'A1000012B7CFB0', '230606197804010235', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (289, '���칫���ֹ����־�', '�����־�', '�Ժ���', null, '18945602857', 'A1000012B7D05C', '230603198205270217', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (290, '���칫���ֹ����־�', '�����־�', '�Խ�¼', null, '18945602858', 'A1000012B7D143', '230605196402032019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (291, '���칫���ֹ����־�', '�����־�', 'ʢ��', null, '18945602860', 'A1000012B7CF69', '230604198204274714', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (292, '���칫���ֹ����־�', '�����־�', '���ʷ�', null, '18945602861', 'A1000012B7B6B8', '230602197604184016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (293, '���칫���ֹ����־�', '�����־�', '�����', null, '18945602862', 'A1000012B7CFA5', '230602196502265910', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (294, '���칫���ֹ����־�', '�����־�', '������', null, '18945602863', 'A1000012B82661', '230602195710223817', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (295, '���칫���ֹ����־�', '�����־�', '½�컪', null, '18945602865', 'A1000012B7D059', '230602196402020019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (296, '���칫���ֹ����־�', '�����־�', '��Т��', null, '18945602866', 'A1000012B7E8E8', '230604196603302015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (297, '���칫���ֹ����־�', '�����־�', '������', null, '18945602867', 'A1000012B82983', '230602197010224412', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (298, '���칫���ֹ����־�', '�����־�', '��ΰ��', null, '18945602868', 'A1000012B7B687', '230602196606220012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (299, '���칫���ֹ����־�', '�����־�', '��ʿ��', null, '18945602870', 'A1000012B7EC97', '230624198206150059', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (300, '���칫���ֹ����־�', '�����־�', '�����', null, '18945602871', 'A1000012B7ECC8', '230603198110203732', '0', '0', null, null, 0, '0001');
commit;
prompt 601 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (301, '���칫���ֹ����־�', '�����־�', '������', null, '18945602873', 'A1000012B7B388', '230602196802070015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (302, '���칫���ֹ����־�', '�����־�', '������', null, '18945602876', 'A1000012B7D0BC', '230621198003113953', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (303, '���칫���ֹ����־�', '�����־�', '�ﺣ��', null, '18945602877', 'A1000012B7CFB3', '230602198109266238', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (304, '���칫���ֹ����־�', '�����־�', '���ӹ�', null, '18945602878', 'A1000012B7EC8F', '230602197508062158', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (305, '���칫���ֹ����־�', '�����־�', '��ΰ', null, '18945602879', 'A1000012B7ECA7', '230624198108100613', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (306, '���칫���ֹ����־�', '�����־�', '١��', null, '18945602880', 'A1000012B7EABD', '23060419620720101X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (307, '���칫���ֹ����־�', '�����־�', '���崺', null, '18945602881', 'A1000012B7E8DE', '23060319830415211X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (308, '���칫���ֹ����־�', '�����־�', '�', null, '18945602882', 'A1000012B7EA6A', '23230219821017101X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (309, '���칫���ֹ����־�', '�����־�', '������', null, '18945602883', 'A1000012B82F5B', '23060219610724671X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (310, '���칫���ֹ����־�', '�����־�', '������', null, '18945602885', 'A1000012B7CF99', '230602196302230019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (311, '���칫���ֹ����־�', '�����־�', '١��Ȼ', null, '18945602886', 'A1000012B7E970', '230602198004154010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (312, '���칫���ֹ����־�', '�����־�', '������', null, '18945602887', 'A1000012B7B705', '230604198008285117', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (313, '���칫���ֹ����־�', '�����־�', '���㲨', null, '18945602889', 'A1000012B7ECEA', '230603197812041710', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (314, '���칫���ֹ����־�', '�����־�', '������', null, '18945602890', 'A1000012B7CFA4', '230602198107305715', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (315, '���칫���ֹ����־�', '�����־�', '����', null, '18945602891', 'A1000012B7B359', '230604198404042221', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (316, '���칫���ֹ����־�', '�����־�', '������', null, '18945602892', 'A1000012B7D2FA', '230603198109030926', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (317, '���칫���ֹ����־�', '�����־�', '����', null, '18945602895', 'A1000012B7B286', '230602197711062137', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (318, '���칫���ֹ����־�', '�����־�', '�Խ���', null, '18945602896', 'A1000012B7B72D', '23082319761226043X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (319, '���칫���ֹ����־�', '�����־�', '�����', null, '18945602897', 'A1000012B7EACB', '230602196405100217', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (320, '���칫���ֹ����־�', '�����־�', '������', null, '18945602898', 'A1000012BE240B', '230602196605234017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (321, '���칫���ֹ����־�', '�����־�', '�Ա�', null, '18945602899', 'A1000012B82F45', '230603198402190216', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (322, '���칫���ֹ����־�', '�����־�', '�����', null, '18945602888', 'A1000012B825AB', null, '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (323, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ֽ�ɽ', null, '18945601736', 'A1000012B75975', '230603197902053715', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (324, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���й�', null, '18945601981', 'A1000012B75B47', '230602198106211012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (325, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945601982', 'A1000012B75B74', '23060619820108116X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (326, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����Ӣ', null, '18945601983', 'A1000012B75BE5', '230606196503060066', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (327, '���칫���ִ�ͬ�־�', '��ͬ�־�', '֣����', null, '18945601986', 'A1000012B75D1A', '230606197809244014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (328, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ź���', null, '18945601987', 'A1000012B75D7E', '230606197210192051', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (329, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945601988', 'A1000012B75D86', '23060619691101021X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (330, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��ǿ', null, '18945601989', 'A1000012B75DA6', '230606197509061750', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (331, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�', null, '18945601990', 'A1000012B75DBA', '230606196308080010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (332, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945601991', 'A1000012B76B17', '230606196305020012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (333, '���칫���ִ�ͬ�־�', '��ͬ�־�', 'ʷ��÷', null, '18945601992', 'A1000012B76B19', '230606196001100021', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (334, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945601993', 'A1000012B76B27', '230606198209020222', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (335, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�̱�', null, '18945601995', 'A1000012B76B2E', '230606196410260034', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (336, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ι���', null, '18945601997', 'A1000012B78B7E', '23060219761026213X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (337, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945601998', 'A1000012B78B81', '230602197609192138', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (338, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�����', null, '18945602001', 'A1000012B78BA8', '230606196009010012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (339, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��˼��', null, '18945602002', 'A1000012B78C2B', '230604197409013011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (340, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602003', 'A1000012B7B6C7', '230602196310015917', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (341, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��Ӣ��', null, '18945602004', 'A1000012B7B9B1', '23060619770427521X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (342, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602005', 'A1000012B7BD86', '230604197510100259', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (343, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���', null, '18945602006', 'A1000012B7BEFA', '230606195803010066', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (344, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602007', 'A1000012B7BF02', '230606196911130211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (345, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�����', null, '18945602008', 'A1000012B7C182', '230606196512080018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (346, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���', null, '18945602009', 'A1000012B7C21A', '23230219700630073X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (347, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602010', 'A1000012B7C230', '230606195503140010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (348, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602011', 'A1000012B7C26A', '230606196311011630', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (349, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���绪', null, '18945602012', 'A1000012B7C26D', '230606195609170066', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (350, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602013', 'A1000012B7C27A', '230606195412061915', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (351, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602015', 'A1000012B7C2AD', '230606196303230024', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (352, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602016', 'A1000012B7C2DB', '230606196409160220', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (353, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���ܻ�', null, '18945602017', 'A1000012B7C2EA', '230606195801100025', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (354, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ַ�', null, '18945602018', 'A1000012B7C2EE', '230606197412220217', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (355, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602019', 'A1000012B7C33A', '230606196805120028', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (356, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602020', 'A1000012B7C375', '230602197811302126', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (357, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602022', 'A1000012B7C380', '230621197807220055', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (358, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602025', 'A1000012B7C383', '230604197802120219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (359, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602026', 'A1000012B7C388', '230606195804180016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (360, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��ϣ��', null, '18945602027', 'A1000012B7C38E', '230606195611114610', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (361, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�Ϲ���', null, '18945602028', 'A1000012B7C394', '230606196407050714', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (362, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�κ�', null, '18945602029', 'A1000012B7C395', '230606195805220016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (363, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602030', 'A1000012B7C3BB', '23060219790209211X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (364, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602033', 'A1000012B7C3C1', '23060619631008001X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (365, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ź鲨', null, '18945602035', 'A1000012B7C3CA', '230604198105055110', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (366, '���칫���ִ�ͬ�־�', '��ͬ�־�', 'ׯ��', null, '18945602037', 'A1000012B7C3CD', '230602197805011015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (367, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602039', 'A1000012B7C3D1', '23060619640617001X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (368, '���칫���ִ�ͬ�־�', '��ͬ�־�', '̷���', null, '18945602055', 'A1000012B7C3D5', '230606196008010037', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (369, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�Ź���', null, '18945602056', 'A1000012B7C3E8', '230602198009042130', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (370, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�׷���', null, '18945602057', 'A1000012B7C3EC', '230602197901012130', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (371, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602058', 'A1000012B7C401', '230606196511200014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (372, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602060', 'A1000012B7C41B', '230602197208104416', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (373, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602061', 'A1000012B7C426', '230606196105010047', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (374, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�Ŵ�', null, '18945602065', 'A1000012B7C42D', '230621198003150412', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (375, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����Խ', null, '18945602066', 'A1000012B7C444', '23062219830502002X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (376, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602067', 'A1000012B7C447', '230226197908050219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (377, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���ɸ�', null, '18945602068', 'A1000012B7C44B', '230602198009162116', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (378, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�����', null, '18945602070', 'A1000012B7C44D', '230606196206040018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (379, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�¾�', null, '18945602072', 'A1000012B7C44F', '230606198303274827', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (380, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ڸ���', null, '18945602075', 'A1000012B7B877', '230226197804080210', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (381, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��־��', null, '18945602076', 'A1000012B7C480', '230602197811232113', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (382, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����ƽ', null, '18945602077', 'A1000012B7C4B3', '230604196705210015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (383, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602078', 'A1000012B7C4C5', '230606196601184214', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (384, '���칫���ִ�ͬ�־�', '��ͬ�־�', '½��ɽ', null, '18945602079', 'A1000012B7C4D5', '230606196006232058', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (385, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�޴��', null, '18945602080', 'A1000012B7C4D7', '230606197702100213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (386, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�̹��', null, '18945602082', 'A1000012B7C4E4', '230606197412072816', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (387, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602083', 'A1000012B7C4EB', '23060619600720004X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (388, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��־��', null, '18945602085', 'A1000012B7C50D', '230602197503232154', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (389, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���Ļ�', null, '18945602086', 'A1000012B7C527', '230606197603040219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (390, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���ޱ�', null, '18945602088', 'A1000012B7D0EC', '230606198105180213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (391, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�����', null, '18945602089', 'A1000012B7D0FA', '230606197102280214', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (392, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���Ի�', null, '18945602091', 'A1000012B7D161', '230606196512020031', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (393, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ں��', null, '18945602092', 'A1000012B7D1A3', '230606197810070218', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1366, '���칫����', '֧��һ', '������', null, '18945600939', 'A1000012B7D4FC', '230602197712292129', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1367, '���칫����', '֧��һ', '�����', null, '18945600945', 'A1000012B7D58E', '230604196703111611', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1368, '���칫����', '֧��һ', '�Ľ�ƽ', null, '18945600948', 'A1000012B7D589', '230602196207183410', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1369, '���칫����', '֧��һ', '�ű���', null, '18945600950', 'A1000012B82211', '230605196206080013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1370, '���칫����', '֧��һ', '�츣Ǭ', null, '18945600955', 'A1000012B82236', '230605196505011210', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1371, '���칫����', '֧��һ', '����ϲ', null, '18945600956', 'A1000012B82224', '230603196405230712', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1372, '���칫����', '֧��һ', '��ѧƽ', null, '18945600957', 'A1000012B82257', '230602196202174419', '0', '0', null, null, 0, '0001');
commit;
prompt 701 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1373, '���칫����', '֧��һ', '��Ӣ��', null, '18945600958', 'A1000012B82251', '230602197404134057', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1374, '���칫����', '֧��һ', '�����', null, '18945600959', 'A1000012B8224F', '230605196405101251', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (425, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���޶�', null, '18945602138', 'A1000012B829A1', '230602197810262134', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (426, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602139', 'A1000012B82B4A', '230606196908180015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (427, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��ϲȨ', null, '18945602140', 'A1000012B82BB7', '230606196402010051', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (428, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�޽��', null, '18945602141', 'A1000012B82BC7', '230606198103184018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (429, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602143', 'A1000012B82BD1', '230602197703102135', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (430, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602148', 'A1000012B82BD3', '230606197502070232', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (431, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602151', 'A1000012B82BF1', '230606196703021010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (432, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602152', 'A1000012B82C2E', '230606196507153833', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (433, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��ά', null, '18945602153', 'A1000012B82C3A', '23060619570818421X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (434, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��־��', null, '18945602154', 'A1000012B82C47', '23060619540620115X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (435, '���칫���ִ�ͬ�־�', '��ͬ�־�', '·��', null, '18945602155', 'A1000012B82C49', '23060619641204102X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (436, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602156', 'A1000012B82C4E', '230606195704191017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (437, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602157', 'A1000012B82C50', '230606197410130218', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (438, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��־', null, '18945602158', 'A1000012B82C52', '23060619650211101X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (439, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ž�', null, '18945602159', 'A1000012B82C56', '230606196504251016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (440, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�����', null, '18945602160', 'A1000012B82C58', '230606196308250016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (441, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��̹�', null, '18945602161', 'A1000012B82C69', '230606197312120235', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (442, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602162', 'A1000012B82C6F', '23060619681204115X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (443, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602165', 'A1000012B82C77', '230606197610150213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (444, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602166', 'A1000012B82C78', '230606197306031797', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (445, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602167', 'A1000012B82C80', '230606197502070216', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (446, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�����', null, '18945602168', 'A1000012B82C81', '230606196510290011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (447, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��ά��', null, '18945602175', 'A1000012B82C84', '230606195410150017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (448, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602176', 'A1000012B82C90', '230606195409250715', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (449, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�Բ�', null, '18945602177', 'A1000012B82C97', '230606195603295415', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (450, '���칫���ִ�ͬ�־�', '��ͬ�־�', '֣־ǿ', null, '18945602178', 'A1000012B82C99', '230606196812112616', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (451, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���ǳ�', null, '18945602179', 'A1000012B82C9B', '230606196212140031', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (452, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��ϲ��', null, '18945602180', 'A1000012B82C9F', '230606196603200230', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (453, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�޺�ѧ', null, '18945602181', 'A1000012B82CA4', '230606195202100015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (454, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ż̲�', null, '18945602185', 'A1000012B82CA5', '230606195912150033', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (455, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602186', 'A1000012B82CA6', '230606195807091756', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (456, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�', null, '18945602187', 'A1000012B82CAF', '230606195408252057', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (457, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���ʤ', null, '18945602188', 'A1000012B82CB8', '230606196310201619', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (458, '���칫���ִ�ͬ�־�', '��ͬ�־�', 'Ѧ�ﺣ', null, '18945602189', 'A1000012B82CC7', '230606197112252815', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (460, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602191', 'A1000012B82CCD', '230606196509021316', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (461, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���', null, '18945602193', 'A1000012B82CD8', '230606195705190059', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (459, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��ҫ��', null, '18945602190', 'A1000012B82CC9', '230606196811013413', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (462, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602195', 'A1000012B82CDC', '230604196405053812', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (463, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602196', 'A1000012B82CE0', '230606195702195022', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (464, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602197', 'A1000012B82D57', '230606195508200019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (465, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��һ��', null, '18945602198', 'A1000012B82D9D', '230606195804060049', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (466, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602199', 'A1000012B82D9F', '230606196507130017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (467, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��÷�', null, '18945602200', 'A1000012B82DA2', '23060219770109213X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (468, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602201', 'A1000012B82DA6', '230606195704010036', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (469, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�����', null, '18945602202', 'A1000012B82DAE', '230606195804190011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (470, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��²�', null, '18945602203', 'A1000012B82DCA', '230606195605140011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (471, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�־�', null, '18945602205', 'A1000012B82DF5', '230606196002193418', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (472, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ռ���', null, '18945602206', 'A1000012B82E15', '230606196411110214', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (473, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602207', 'A1000012B82DCF', '230606196204220015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (474, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602208', 'A1000012B82E61', '230606198303142437', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (475, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�̸���', null, '18945602209', 'A1000012B82E7B', '230606197209180213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (476, '���칫���ִ�ͬ�־�', '��ͬ�־�', 'Ǯ���', null, '18945602210', 'A1000012B82E7C', '230606195610010035', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (477, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602211', 'A1000012B82E87', '230602197510162158', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (478, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���Ĺ�', null, '18945602212', 'A1000012B82ED1', '230226197612272816', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (479, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��Ҿ�', null, '18945602213', 'A1000012B82EE8', '230624197702060218', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (480, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��ʤ��', null, '18945602215', 'A1000012B82F48', '230605197903241817', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (481, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�����', null, '18945602216', 'A1000012B82F52', '230602197701212154', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (482, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�¼Ҳ�', null, '18945602217', 'A1000012B82FA2', '230606197811154018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (483, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�����', null, '18945602218', 'A1000012B82FD7', '230606197706045610', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (484, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602219', 'A1000012B83028', '230602198003055918', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (485, '���칫���ִ�ͬ�־�', '��ͬ�־�', 'ɳ��', null, '18945602220', 'A1000012B83029', '370211197908220018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (486, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602221', 'A1000012B8306B', '230606196509200011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (487, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602223', 'A1000012B8309C', '230604197006080017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (488, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���鶫', null, '18945602225', 'A1000012B8309E', '230606196903120811', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (489, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602226', 'A1000012B830A2', '230606197212244839', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (490, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ﺣȨ', null, '18945602227', 'A1000012B830DA', '230606197508011751', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (491, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602228', 'A1000012B830EE', '230606197309020014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (492, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��ӭ��', null, '18945602229', 'A1000012B830F3', '230103197905154610', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (493, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��͢��', null, '18945602230', 'A1000012B8310E', '230604196407073810', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (494, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�Ƿ�', null, '18945602232', 'A1000012B83110', '230606198101294045', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (495, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602233', 'A1000012B83111', '23060219790903211X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (496, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602234', 'A1000012B83113', '230606196410032816', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (497, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���ĸ�', null, '18945602236', 'A1000012B83116', '230606197511200852', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (498, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�����', null, '18945602238', 'A1000012B8311B', '230606196304101611', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (499, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602239', 'A1000012B8311F', '230606197608090215', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (500, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602246', 'A1000012B83149', '230606197610250230', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1536, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601216', 'A1000012B82BEF', '230602197310087114', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1537, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601217', 'A1000012B82D1E', '230103197510042833', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1538, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601218', 'A1000012B82C59', '23060219570516084X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1539, '���칫���ֶ����־�', '֧��һ', '�����', null, '18945601220', 'A1000012B82DCC', '230602197203062333', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1540, '���칫���ֶ����־�', '֧��һ', '�����', null, '18945601221', 'A1000012B82BC1', '230602196711111029', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1541, '���칫���ֶ����־�', '֧��һ', '�ζ�÷', null, '18945601223', 'A1000012B82F95', '230602197111283825', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1542, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601227', 'A1000012B82C6D', '230603197806290219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1543, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601228', 'A1000012B82C64', '23060219620915041X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1544, '���칫���ֶ����־�', '֧��һ', 'ȫ��', null, '18945601229', 'A1000012B83025', '230603197704021739', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1545, '���칫���ֶ����־�', '֧��һ', '����Ӣ', null, '18945601230', 'A1000012B82CC6', '230506198107080448', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1546, '���칫���ֶ����־�', '֧��һ', '���ܾ�', null, '18945601231', 'A1000012B82D19', '230602196206170810', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1547, '���칫���ֶ����־�', '֧��һ', '�ֿ���', null, '18945601232', 'A1000012B8302C', '230602197212271727', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1548, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601233', 'A1000012B82CB6', '230602197106010419', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1549, '���칫���ֶ����־�', '֧��һ', '����Ⱥ', null, '18945601235', 'A1000012B82CA2', '230602197308297120', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1550, '���칫���ֶ����־�', '֧��һ', '�ں���', null, '18945601236', 'A1000012B815CF', '230602197703092117', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1551, '���칫���ֶ����־�', '֧��һ', '��˫��', null, '18945601237', 'A1000012B81643', '230602197304244419', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1552, '���칫���ֶ����־�', '֧��һ', 'ս����', null, '18945601238', 'A1000012B815FF', '230602195601240212', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1553, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601239', 'A1000012B81631', '230602196407200844', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1554, '���칫���ֶ����־�', '֧��һ', '���Ȩ', null, '18945601252', 'A1000012B81612', '230603196810071516', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1555, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601255', 'A1000012B83184', '230602196904301013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1556, '���칫���ֶ����־�', '֧��һ', '�����', null, '18945601256', 'A1000012B831A7', '23060219771026591X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1557, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601257', 'A1000012B83112', '230602196402247117', '0', '0', null, null, 0, '0001');
commit;
prompt 801 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1558, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601259', 'A1000012B831AA', '230602196712070214', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1559, '���칫���ֶ����־�', '֧��һ', 'ʯ��ƽ', null, '18945601260', 'A1000012B81610', '23060219600220621X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1560, '���칫���ֶ����־�', '֧��һ', '���»�', null, '18945601261', 'A1000012B82997', '230602196410043827', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1561, '���칫���ֶ����־�', '֧��һ', '�����', null, '18945601263', 'A1000012B829A3', '230602198109225719', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1562, '���칫���ֶ����־�', '֧��һ', 'Ǯ����', null, '18945601265', 'A1000012B8287A', '232325196506150213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1563, '���칫���ֶ����־�', '֧��һ', '�ﶬѩ', null, '18945601266', 'A1000012B8293F', '232126197701060168', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1564, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601267', 'A1000012B824CC', '230602196812252138', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1565, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601268', 'A1000012B82819', '230605197105252431', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1566, '���칫���ֶ����־�', '֧��һ', '�봺ΰ', null, '18945601269', 'A1000012B8294D', '230604196909290053', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1567, '���칫���ֶ����־�', '֧��һ', '�ܾ�', null, '18945601270', 'A1000012B8288F', '230602197408141018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1568, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601271', 'A1000012B82945', '230602196310107512', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1569, '���칫���ֶ����־�', '֧��һ', '���ʷ�', null, '18945601272', 'A1000012B8295C', '230602197903245923', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1570, '���칫���ֶ����־�', '֧��һ', '���˽�', null, '18945601275', 'A1000012B79D2D', '230605197408141018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1571, '���칫���ֶ����־�', '֧��һ', '�ز��', null, '18945601276', 'A1000012B7B552', '230602196506184413', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1572, '���칫���ֶ����־�', '֧��һ', '���', null, '18945601277', 'A1000012B7B791', '23060219681005201X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1573, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601278', 'A1000012B75769', '230602196509183811', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1574, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601117', 'A1000012B76B2A', '230122196209250371', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1575, '���칫���ֶ����־�', '֧��һ', '������', null, '18945601280', 'A1000012B75DD4', '230602198611014431', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1576, '���칫���ֶ����־�', '֧��һ', '��־��', null, '18945601281', 'A1000012B75BBC', '230602197209222131', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1577, '���칫���ֶ����־�', '֧��һ', '��ƽӢ', null, '18945601286', 'A1000012B76B08', '230602196009282725', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1578, '���칫���ֶ����־�', '֧��һ', '����', null, '18945601287', 'A1000012B754E0', '230602197602160643', '0', '0', '1', '1', 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601301', 'A1000012B82904', '230604196809170214', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (2, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601303', 'A1000012B82411', '230605197205200014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (3, '���칫���ֻ�ս�־�', '��ս�־�', '��ѧ��', null, '18945601305', 'A1000012B7D11F', '230604196402242036', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (4, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601306', 'A1000012B823E3', '23060519701207121X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (5, '���칫���ֻ�ս�־�', '��ս�־�', '³�¾�', null, '18945601307', 'A1000012B7F62F', '230604196208270412', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (6, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601308', 'A1000012B828EF', '230603196411022311', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (7, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601309', 'A1000012B82434', '230602196401213011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (8, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601310', 'A1000012B7D1A8', '23210119730626063X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (9, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601312', 'A1000012B82A45', '230603198112121722', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (10, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601313', 'A1000012B82A8B', '230602196607260622', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (11, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601314', 'A1000012B7C4D4', '230604198112210607', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (12, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601315', 'A1000012B7D1C8', '230602197008031013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (13, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601316', 'A1000012B7C4BA', '230605197705252216', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (14, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601317', 'A1000012B7C2E5', '230407197005040011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (15, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601318', 'A1000012B7D1DE', '230602198006096512', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (16, '���칫���ֻ�ս�־�', '��ս�־�', '����־', null, '18945601319', 'A1000012B7C4DA', '230602196311200831', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (17, '���칫���ֻ�ս�־�', '��ս�־�', '�ƾ���', null, '18945601320', 'A1000012B7C528', '230602197411062119', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (18, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601321', 'A1000012B7C4A0', '230103197409022811', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (19, '���칫���ֻ�ս�־�', '��ս�־�', 'Ѧ����', null, '18945601323', 'A1000012B7C4F0', '230604198105194137', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (20, '���칫���ֻ�ս�־�', '��ս�־�', '�����', null, '18945601325', 'A1000012B7C49B', '230602196208287510', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (21, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601326', 'A1000012B82220', '230602197010031717', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (22, '���칫���ֻ�ս�־�', '��ս�־�', '��־��', null, '18945601327', 'A1000012B82245', '230103197307014634', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (23, '���칫���ֻ�ս�־�', '��ս�־�', '�ﳬ', null, '18945601328', 'A1000012B82255', '230103197408024612', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (24, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601329', 'A1000012B8223C', '230603198309012116', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (25, '���칫���ֻ�ս�־�', '��ս�־�', '���Ʒ�', null, '18945601331', 'A1000012B8221F', '230602197311120617', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (26, '���칫���ֻ�ս�־�', '��ս�־�', '���Ȩ', null, '18945601335', 'A1000012B8224E', '230602196404252315', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (27, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601336', 'A1000012B82252', '23062119770413041X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (28, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601337', 'A1000012B82210', '230602197909152541', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (29, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601339', 'A1000012B82253', '232301197609280014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (30, '���칫���ֻ�ս�־�', '��ս�־�', '��־��', null, '18945601340', 'A1000012B82240', '230302197805204232', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (31, '���칫���ֻ�ս�־�', '��ս�־�', '���ӹ�', null, '18945601341', 'A1000012B7D7B4', '230602196405303815', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (32, '���칫���ֻ�ս�־�', '��ս�־�', '�ܺ���', null, '18945601342', 'A1000012B7D773', '230602198003192138', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (33, '���칫���ֻ�ս�־�', '��ս�־�', '���ƽ�', null, '18945601343', 'A1000012B7D788', '230602195508061519', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (34, '���칫���ֻ�ս�־�', '��ս�־�', '�����', null, '18945601345', 'A1000012B7D7DA', '230602197411213618', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (35, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601346', 'A1000012B7D7E5', '230602196704013412', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (36, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601347', 'A1000012B7D782', '230602197608281016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (37, '���칫���ֻ�ս�־�', '��ս�־�', '�ε���', null, '18945601348', 'A1000012B7D7AE', '230602197305121015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (38, '���칫���ֻ�ս�־�', '��ս�־�', '���գ�С��', null, '18945601349', 'A1000012B7D7E0', '230221198402062012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (39, '���칫���ֻ�ս�־�', '��ս�־�', '�Ե�', null, '18945601350', 'A1000012B81DF6', '230603197803243169', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (40, '���칫���ֻ�ս�־�', '��ս�־�', '���ٽ�', null, '18945601351', 'A1000012B7D7E1', '230602195904270814', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (41, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601352', 'A1000012B81EF2', '230602197812230216', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (42, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601353', 'A1000012B7D7E2', '230602198204120210', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (43, '���칫���ֻ�ս�־�', '��ս�־�', 'Ѧ�ľ�', null, '18945601356', 'A1000012B81EF3', '230602196908013019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (44, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601357', 'A1000012B81CC0', '230602197405070614', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (45, '���칫���ֻ�ս�־�', '��ս�־�', '����ǿ', null, '18945601358', 'A1000012B820B0', '23230219730625101X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (46, '���칫���ֻ�ս�־�', '��ս�־�', '����ǿ', null, '18945601359', 'A1000012B81E3D', '230602197603106518', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (47, '���칫���ֻ�ս�־�', '��ս�־�', '���', null, '18945601360', 'A1000012B81E47', '231026197008106133', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (48, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601361', 'A1000012B75D8F', '230602197412201715', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (49, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601362', 'A1000012B81EB7', '230226198107022810', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (50, '���칫���ֻ�ս�־�', '��ս�־�', '�����', null, '18945601363', 'A1000012B7A576', '230604197203101630', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (51, '���칫���ֻ�ս�־�', '��ս�־�', '�����', null, '18945601365', 'A1000012B81D78', '230602196410150016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (52, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601367', 'A1000012B81E6F', '230604197009104416', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (53, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601368', 'A1000012B78BDB', '230602196604191211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (54, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601369', 'A1000012B7BB7B', '230602197011144414', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (55, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601370', 'A1000012B78C33', '230602197012310410', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (56, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601371', 'A1000012B7A568', '230602195706130810', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (57, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601372', 'A1000012B7B92B', '23060219750511651X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (58, '���칫���ֻ�ս�־�', '��ս�־�', '�����', null, '18945601373', 'A1000012B7B6FE', '232302197309053270', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (59, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601375', 'A1000012B7CC40', '232328197504120014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (60, '���칫���ֻ�ս�־�', '��ս�־�', '��ռ��', null, '18945601376', 'A1000012B7CA72', '230602196305283310', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (61, '���칫���ֻ�ս�־�', '��ս�־�', '����ɽ', null, '18945601378', 'A1000012B7CA7E', '230604196504200419', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (62, '���칫���ֻ�ս�־�', '��ս�־�', '�ǲ�', null, '18945601379', 'A1000012B7B938', '23060219740309411X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (63, '���칫���ֻ�ս�־�', '��ս�־�', '����Ȩ', null, '18945601380', 'A1000012B7CA76', '230604197209033659', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (64, '���칫���ֻ�ս�־�', '��ս�־�', 'ׯ����', null, '18945601381', 'A1000012B7BA7A', '230602197510142114', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (65, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601382', 'A1000012B7CC38', '230602196412142319', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (66, '���칫���ֻ�ս�־�', '��ս�־�', '���', null, '18945601383', 'A1000012B7CA71', '23060219750612401X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (67, '���칫���ֻ�ս�־�', '��ս�־�', '����Ӱ', null, '18945601385', 'A1000012B7CA77', '230602196806162136', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (68, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601386', 'A1000012B7CC39', '230602197810162133', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (69, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601387', 'A1000012B7CA83', '230602198110250612', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (70, '���칫���ֻ�ս�־�', '��ս�־�', '�ִ�', null, '18945601389', 'A1000012B7ECE6', '230602196906062319', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (71, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601390', 'A1000012BE238A', '230602196403080814', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (72, '���칫���ֻ�ս�־�', '��ս�־�', '�ڵ�ѧ', null, '18945601391', 'A1000012B7ECF5', '23060319720413151X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (73, '���칫���ֻ�ս�־�', '��ս�־�', '����ʤ', null, '18945601392', 'A1000012B7CA79', '230602196804055011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (74, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601393', 'A1000012B7EA64', '230602198205020617', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (75, '���칫���ֻ�ս�־�', '��ս�־�', '��Ⱥ', null, '18945601395', 'A1000012B7EBF8', '230231197609035431', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (76, '���칫���ֻ�ս�־�', '��ս�־�', '���', null, '18945601396', 'A1000012B7ECEF', '230602197212260016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (77, '���칫���ֻ�ս�־�', '��ս�־�', '�����', null, '18945601397', 'A1000012B7E8EB', '230602196402222710', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1052, '���칫����', '֧��һ', '֣�', null, '18945600083', 'A1000012B7D065', '230602197609302122', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1053, '���칫����', '֧��һ', '������', null, '18945600085', 'A1000012B83148', '232332196909235418', '0', '0', null, null, 0, '0001');
commit;
prompt 901 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1054, '���칫����', '֧��һ', '�Ż���', null, '18945600086', 'A1000012B831AD', '230602196909076214', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1055, '���칫����', '֧��һ', '���', null, '18945600087', 'A1000012B830BB', '230604197608112610', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1056, '���칫����', '֧��һ', '����', null, '18945600088', 'A1000012B830EA', '232127197305012013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1057, '���칫����', '֧��һ', '�뾰��', null, '18945600089', 'A1000012B815FA', '230603198212223152', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1058, '���칫����', '֧��һ', '����', null, '18945600090', 'A1000012B8160D', '230603196603080217', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1059, '���칫����', '֧��һ', '������', null, '18945600091', 'A1000012B82FFD', '230602197401124443', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1060, '���칫����', '֧��һ', '����', null, '18945600092', 'A1000012B82F73', '230602198207175911', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1061, '���칫����', '֧��һ', '������', null, '18945600093', 'A1000012B8163E', '230602198206151010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1062, '���칫����', '֧��һ', '����', null, '18945600095', 'A1000012B82FEA', '230602197809236000', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1063, '���칫����', '֧��һ', '����', null, '18945600096', 'A1000012B7F714', '230604198006301013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1064, '���칫����', '֧��һ', '���Ŀ�', null, '18945600097', 'A1000012B7DDAF', '230602197805304459', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1065, '���칫����', '֧��һ', '��ʯ', null, '18945600098', 'A1000012B7F80B', '23060219830110591X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1066, '���칫����', '֧��һ', '������', null, '18945600099', 'A1000012B7F7DC', '230602195404194413', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1067, '���칫����', '֧��һ', '����', null, '18945600100', 'A1000012B7F78D', '230602197908181025', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1068, '���칫����', '֧��һ', '��ΰ', null, '18945600517', 'A1000012B7F7C0', '230605197906110230', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1069, '���칫����', '֧��һ', '�μ�ȫ', null, '18945600351', 'A1000012B7F6F2', '230604197008161216', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1070, '���칫����', '֧��һ', '������', null, '18945600353', 'A1000012B7F7CC', '230602195808243832', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1071, '���칫����', '֧��һ', '��־ΰ', null, '18945600355', 'A1000012B7F782', '230602196506060832', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1072, '���칫����', '֧��һ', '��Ӣ��', null, '18945600356', 'A1000012B7F795', '230602196206270010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1073, '���칫����', '֧��һ', '���ܹ�', null, '18945600357', 'A1000012B7D35A', '230602197609102139', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1074, '���칫����', '֧��һ', '����', null, '18945600358', 'A1000012B7D369', '230602198011172110', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1075, '���칫����', '֧��һ', '����Ƽ', null, '18945600359', 'A1000012B7D365', '230602196401280046', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1076, '���칫����', '֧��һ', '��ά��', null, '18945600360', 'A1000012B7D392', '230602197307024411', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1077, '���칫����', '֧��һ', '���ɰ�', null, '18945600363', 'A1000012B7D322', '230624197908121514', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1078, '���칫����', '֧��һ', '�ž���', null, '18945600365', 'A1000012B7D396', '230603197710291372', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1079, '���칫����', '֧��һ', '����', null, '18945600367', 'A1000012B7D2FF', '230602196503070461', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1080, '���칫����', '֧��һ', '������', null, '18945600368', 'A1000012B7D393', '230604196305221647', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1081, '���칫����', '֧��һ', '����ƽ', null, '18945600369', 'A1000012B7D390', '230602195702180810', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1082, '���칫����', '֧��һ', '�Ż�', null, '18945600373', 'A1000012B82282', '230604198209100211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1083, '���칫����', '֧��һ', '����ѧ', null, '18945600377', 'A1000012B82272', '230606196305100039', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1084, '���칫����', '֧��һ', '�ܿ�', null, '18945600379', 'A1000012B8227E', '230602196003010411', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1085, '���칫����', '֧��һ', '���ҹ�', null, '18945600122', 'A1000012B82283', '230602197610196224', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1086, '���칫����', '֧��һ', '�ž���', null, '18945600201', 'A1000012B821EF', '230404197504160510', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1087, '���칫����', '֧��һ', '���', null, '18945600202', 'A1000012B82278', '230606197912260223', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1088, '���칫����', '֧��һ', '������', null, '18945600203', 'A1000012B82276', '51021219700218165X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1089, '���칫����', '֧��һ', '��̶�', null, '18945600206', 'A1000012B8224B', '110102196711242358', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1090, '���칫����', '֧��һ', '��ѩ÷', null, '18945600208', 'A1000012B82286', '230604781014022', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1091, '���칫����', '֧��һ', '������', null, '18945600211', 'A1000012B82284', '230603197212123165', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1092, '���칫����', '֧��һ', '������', null, '18945600215', 'A1000012B75DA2', '230602195411010416', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1093, '���칫����', '֧��һ', '��ϲ', null, '18945600227', 'A1000012B7673C', '230603197512304013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1094, '���칫����', '֧��һ', '����', null, '18945600228', 'A1000012B7B5E2', '230602197702200622', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1095, '���칫����', '֧��һ', '�ܽ���', null, '18945600233', 'A1000012B763FE', '230602700117515', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1096, '���칫����', '֧��һ', '�����', null, '18945600234', 'A1000012B75CD1', '232301197902260813', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1097, '���칫����', '֧��һ', '�⽨��', null, '18945600383', 'A1000012B757FD', '232604196210110022', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1098, '���칫����', '֧��һ', '֣��ƽ', null, '18945600387', 'A1000012B7B602', '230604196309060211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1099, '���칫����', '֧��һ', '���Ƿ�', null, '18945600393', 'A1000012B74E91', '23060519730504002X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1100, '���칫����', '֧��һ', '�ŵ��', null, '18945600808', 'A1000012B753E7', '230606198102032071', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1101, '���칫����', '֧��һ', '��ïɽ', null, '18945600132', 'A1000012B75761', '230604196303190816', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1102, '���칫����', '֧��һ', '�ź���', null, '18945600133', 'A1000012B7C34E', '232301197212030236', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1103, '���칫����', '֧��һ', '���Զ�', null, '18945600135', 'A1000012B7C333', '230602196308073413', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1104, '���칫����', '֧��һ', '������', null, '18945600136', 'A1000012B7C2D4', '230605196711072425', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1105, '���칫����', '֧��һ', '������', null, '18945600137', 'A1000012B7C350', '230602196603291915', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1106, '���칫����', '֧��һ', '��־��', null, '18945600138', 'A1000012B7C346', '230604195505100079', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1107, '���칫����', '֧��һ', '��ٲ', null, '18945600150', 'A1000012B7C338', '230602196805160411', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1108, '���칫����', '֧��һ', '���컪', null, '18945600155', 'A1000012B7C32F', '230602197009180416', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1109, '���칫����', '֧��һ', '������', null, '18945600156', 'A1000012B7C1DF', '230602196701246237', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1110, '���칫����', '֧��һ', '�ڴ���', null, '18945600157', 'A1000012B7C340', '230602196807184011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1111, '���칫����', '֧��һ', '��Ӣ�', null, '18945600158', 'A1000012B7C2C2', '230602196409080014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1112, '���칫����', '֧��һ', '�߰�ɭ', null, '18945600159', 'A1000012B82990', '230602196804081017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1113, '���칫����', '֧��һ', '�߿�', null, '18945600160', 'A1000012B82510', '230602196908250815', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1114, '���칫����', '֧��һ', '������', null, '18945600161', 'A1000012B82988', '230604197206190077', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1115, '���칫����', '֧��һ', '�����', null, '18945600163', 'A1000012B829A4', '230102196208143413', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1116, '���칫����', '֧��һ', '�����', null, '18945600166', 'A1000012B82927', '230602196406150871', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1117, '���칫����', '֧��һ', 'ë��', null, '18945600168', 'A1000012B8296B', '230602196309123814', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1118, '���칫����', '֧��һ', '��ѩ÷', null, '18945600169', 'A1000012B82961', '230602196604160423', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1119, '���칫����', '֧��һ', '���Ʋ�', null, '18945600171', 'A1000012B824F3', '230602196112213824', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1120, '���칫����', '֧��һ', '���', null, '18945600177', 'A1000012B75D96', '230602196302060259', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1121, '���칫����', '֧��һ', '������', null, '18945600178', 'A1000012B8292A', '230602195212260412', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1122, '���칫����', '֧��һ', '������', null, '18945600179', 'A1000012B7B379', '310109197103054018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1123, '���칫����', '֧��һ', '��', null, '18945600180', 'A1000012B7B95C', '230606197609030222', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1124, '���칫����', '֧��һ', '��־��', null, '18945600181', 'A1000012B78DAF', '230602197204111512', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1125, '���칫����', '֧��һ', '����', null, '18945600182', 'A1000012B7772C', '230603197405201334', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (80, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601432', 'A1000012B822BC', '230228197802280211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (81, '���칫���ֻ�ս�־�', '��ս�־�', '�Ž��', null, '18945601456', 'A1000012B822B5', '230226197408020013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (78, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601398', 'A1000012B7ECFF', '230606197805255613', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (79, '���칫���ֻ�ս�־�', '��ս�־�', '�ڳ���', null, '18945601403', 'A1000012B7ECDF', '230602196901106212', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (82, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601459', 'A1000012B822B4', '230602196304020816', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (83, '���칫���ֻ�ս�־�', '��ս�־�', '���', null, '18945601497', 'A1000012B7E8DC', '23060219640909191X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (84, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601498', 'A1000012B8228B', '230602197207183618', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (85, '���칫���ֻ�ս�־�', '��ս�־�', '��ϣ��', null, '18945601501', 'A1000012B8228E', '230602196501101914', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (86, '���칫���ֻ�ս�־�', '��ս�־�', '��ɱ�', null, '18945601502', 'A1000012B822AC', '230225197208010551', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (87, '���칫���ֻ�ս�־�', '��ս�־�', '��ɺɺ', null, '18945601503', 'A1000012B8226B', '230602198111146526', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (88, '���칫���ֻ�ս�־�', '��ս�־�', '�ڱ���', null, '18945601505', 'A1000012B8228A', '230602196411070034', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (89, '���칫���ֻ�ս�־�', '��ս�־�', '��ʿ��', null, '18945601506', 'A1000012B822BD', '230604196407101670', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (90, '���칫���ֻ�ս�־�', '��ս�־�', '�Ŵ���', null, '18945601507', 'A1000012B829E3', '230602196401270243', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (91, '���칫���ֻ�ս�־�', '��ս�־�', '��ȫ��', null, '18945601508', 'A1000012B82E3D', '230602196101011020', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (92, '���칫���ֻ�ս�־�', '��ս�־�', '���л�', null, '18945601509', 'A1000012B822B2', '230602197605023660', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (93, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601510', 'A1000012B7A440', '230604196511084719', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (94, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601512', 'A1000012B81A92', '230602195504090830', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (95, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601513', 'A1000012B82C5D', '230602196405303815', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (96, '���칫���ֻ�ս�־�', '��ս�־�', '�޺���', null, '18945601515', 'A1000012B82E57', '232302197006100711', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (97, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601516', 'A1000012B82AD0', '230602196908241046', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (98, '���칫���ֻ�ս�־�', '��ս�־�', '��־��', null, '18945601517', 'A1000012B82DDD', '230602197206214419', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (99, '���칫���ֻ�ս�־�', '��ս�־�', '���գ���', null, '18945601518', 'A1000012B7B8EF', '230602197302285153', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (100, '���칫���ֻ�ս�־�', '��ս�־�', '������', null, '18945601519', 'A1000012B7B9EE', '230602195911060428', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (101, '���칫���ֻ�ս�־�', '��ս�־�', '����', null, '18945601520', 'A1000012B7BBAA', '230602196510151016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (683, '����־�', '����־�', '����', null, '18945601800', 'A1000012B7CF91', '230603196210170027', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (684, '����־�', '����־�', '����ʵ', null, '18945601801', 'A1000012B7CFAD', '230603195702071119', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (685, '����־�', '����־�', '�����', null, '18945601802', 'A1000012B7CFA7', '230603196203050019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (686, '����־�', '����־�', '֣��', null, '18945601803', 'A1000012B7CFAB', '230603196407160711', '0', '0', null, null, 0, '0001');
commit;
prompt 1001 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (687, '����־�', '����־�', '����ʤ', null, '18945601805', 'A1000012B7D073', '230603197007201734', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (688, '����־�', '����־�', '����Ԫ', null, '18945601806', 'A1000012B82D7D', '230603196102051119', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (689, '����־�', '����־�', '������', null, '18945601807', 'A1000012B82C34', '23010319680529462X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (690, '����־�', '����־�', '����', null, '18945601808', 'A1000012B82DCD', '230603195705040713', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (691, '����־�', '����־�', '���Ʒ�', null, '18945601809', 'A1000012B82D78', '230603196407010019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (692, '����־�', '����־�', '����˫', null, '18945601810', 'A1000012B82D85', '230603196412210736', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (693, '����־�', '����־�', '������', null, '18945601811', 'A1000012B82D82', '230603195302200030', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (694, '����־�', '����־�', '����ǿ', null, '18945601812', 'A1000012B82DD3', '230602196411083417', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (695, '����־�', '����־�', '�ι���', null, '18945601815', 'A1000012B82C86', '230604196503112011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (696, '����־�', '����־�', '������', null, '18945601816', 'A1000012B82CAE', '230606196502220013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (697, '����־�', '����־�', '��ɭ', null, '18945601817', 'A1000012B82DF4', '230603196311261139', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (698, '����־�', '����־�', '����', null, '18945601818', 'A1000012B75C58', '230721197104293114', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (699, '����־�', '����־�', '����', null, '18945601819', 'A1000012B76B2F', '230603196802161140', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (700, '����־�', '����־�', '«����', null, '18945601820', 'A1000012B76B01', '230603195204130016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (701, '����־�', '����־�', '����', null, '18945601821', 'A1000012B78C12', '230603197710210245', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (702, '����־�', '����־�', 'ξ����', null, '18945601823', 'A1000012B78CBF', '230603196509231314', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (703, '����־�', '����־�', 'Ѧ����', null, '18945601825', 'A1000012B7B61A', '230603197207200015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (704, '����־�', '����־�', '����', null, '18945601827', 'A1000012B7B228', '230603196103180019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (705, '����־�', '����־�', '������', null, '18945601828', 'A1000012B7BA1F', '230603196303081111', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (706, '����־�', '����־�', '�캣', null, '18945601829', 'A1000012B78BA4', '230603195111100010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (707, '����־�', '����־�', '����', null, '18945601833', 'A1000012B7B6AC', '230603196408240422', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (708, '����־�', '����־�', '�˴���', null, '18945601835', 'A1000012B7F258', '230602196303020419', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (709, '����־�', '����־�', '������', null, '18945601836', 'A1000012B7F10F', '230602198111024019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (710, '����־�', '����־�', '������', null, '18945601837', 'A1000012B7F3C6', '230603196007242312', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (711, '����־�', '����־�', 'ţ��ƽ', null, '18945600050', 'A1000012B7F1CA', '230603196905072319', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (712, '����־�', '����־�', '�Ͻ�', null, '18945601842', 'A1000012B7F226', '230603196309031932', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (713, '����־�', '����־�', '����У', null, '18945601845', 'A1000012B7F03D', '230603196307031373', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (714, '����־�', '����־�', '������', null, '18945601846', 'A1000012B7F1D8', '230604195807050812', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (715, '����־�', '����־�', '١����', null, '18945601849', 'A1000012B7F240', '230603196201163419', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (716, '����־�', '����־�', 'ʷ����', null, '18945601850', 'A1000012B7F036', '230621198107140016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (717, '����־�', '����־�', '�ܾ���', null, '18945601851', 'A1000012B7F1E4', '230603196503091920', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (718, '����־�', '����־�', '�����', null, '18945601852', 'A1000012B82B58', '23060419720825381X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (719, '����־�', '����־�', '������', null, '18945601853', 'A1000012B82C79', '230604196706100010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (720, '����־�', '����־�', '����ҵ', null, '18945601855', 'A1000012B82C6E', '230604196312090817', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (721, '����־�', '����־�', '���', null, '18945601856', 'A1000012B82C31', '230603196411230014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (722, '����־�', '����־�', '��ʤ��', null, '18945601858', 'A1000012B82DC2', '230603197301120919', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (723, '����־�', '����־�', '����', null, '18945601859', 'A1000012B82DBD', '23060319600307055X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (724, '����־�', '����־�', '���ٵ�', null, '18945601860', 'A1000012B82D0F', '230602196203230013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (725, '����־�', '����־�', '����', null, '18945601861', 'A1000012B82BD7', '230603197808013522', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (726, '����־�', '����־�', '����', null, '18945601862', 'A1000012B82B80', '230603195601301114', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (727, '����־�', '����־�', '��ƽ', null, '18945601863', 'A1000012B82B82', '230604197605050231', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (728, '����־�', '����־�', '������', null, '18945601866', 'A1000012B7A8FC', '230603196303042323', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (729, '����־�', '����־�', '������', null, '18945601867', 'A1000012B7A60F', '230603196611160428', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (730, '����־�', '����־�', '˾����', null, '18945601868', 'A1000012B7AE49', '230603196103160026', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (731, '����־�', '����־�', '������', null, '18945601869', 'A1000012B7AE1E', '230603197011231311', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (732, '����־�', '����־�', '������', null, '18945601870', 'A1000012B7ACA2', '230603196209171313', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (733, '����־�', '����־�', '������', null, '18945601871', 'A1000012B77DDA', '230603196306050011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (734, '����־�', '����־�', '��ɾ�', null, '18945601872', 'A1000012B7A8ED', '230603196309042519', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (735, '����־�', '����־�', '������', null, '18945601873', 'A1000012B7A837', '230603196212310011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (736, '����־�', '����־�', '���¸�', null, '18945601876', 'A1000012B7A934', '230603197408100918', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (737, '����־�', '����־�', '���', null, '18945601877', 'A1000012B7AA22', '230605195402011256', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (738, '����־�', '����־�', '����ΰ', null, '18945601878', 'A1000012B82CBA', '230603196702220916', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (739, '����־�', '����־�', '������', null, '18945601879', 'A1000012B82C82', '230603196404060723', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (740, '����־�', '����־�', '�ε���', null, '18945601880', 'A1000012B82C8C', '230603195708170716', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (741, '����־�', '����־�', '������', null, '18945601881', 'A1000012B82C5B', '230603197603312115', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (742, '����־�', '����־�', '����Ǩ', null, '18945601882', 'A1000012B82965', '230603195503080055', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (743, '����־�', '����־�', '������', null, '18945601883', 'A1000012B82CD6', '230603195505200014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (744, '����־�', '����־�', '����', null, '18945601885', 'A1000012B82C71', '230605197211070826', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (745, '����־�', '����־�', '����', null, '18945601886', 'A1000012B82C12', '230602196501011919', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (746, '����־�', '����־�', '����', null, '18945601887', 'A1000012B82F5D', '230602196212101918', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (747, '����־�', '����־�', '����ʤ', null, '18945601889', 'A1000012B82F25', '230602196410220811', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (748, '����־�', '����־�', '������', null, '18945601890', 'A1000012B8310F', '230603196109030716', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (749, '����־�', '����־�', '����', null, '18945601891', 'A1000012B830D7', '230603197107181128', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (750, '����־�', '����־�', '������', null, '18945601892', 'A1000012B830B6', '230603196411061943', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (751, '����־�', '����־�', '�ܰ�ƽ', null, '18945601895', 'A1000012B815CD', '230228197804180046', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (752, '����־�', '����־�', '����', null, '18945601896', 'A1000012B8160B', '230603195201210213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (753, '����־�', '����־�', '�º��', null, '18945601897', 'A1000012B81641', '230603195611170023', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (754, '����־�', '����־�', '�����', null, '18945601898', 'A1000012B7DD37', '23060319620623071X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (755, '����־�', '����־�', '�Ե¿�', null, '18945601899', 'A1000012B81623', '230603196204143313', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (756, '����־�', '����־�', '�ű���', null, '18945601900', 'A1000012B7DA2C', '230602196511013838', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (757, '����־�', '����־�', '������', null, '18945601901', 'A1000012B815FE', '230603196304051117', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (758, '����־�', '����־�', '�����', null, '18945601902', 'A1000012B8161A', '230603195411250731', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (759, '����־�', '����־�', '�Ƴɷ�', null, '18945601903', 'A1000012B81624', '230603196902070932', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (760, '����־�', '����־�', '�Ⲩ', null, '18945601905', 'A1000012B81638', '230602196607190011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (761, '����־�', '����־�', '������', null, '18945601906', 'A1000012B8160E', '230603196302231114', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (762, '����־�', '����־�', '�����', null, '18945601907', 'A1000012B815F9', '230602195605011919', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (763, '����־�', '����־�', '�����', null, '18945601908', 'A1000012B8162C', '230603197403281713', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (394, '���칫���ִ�ͬ�־�', '��ͬ�־�', 'Ф����', null, '18945602093', 'A1000012B7D1C7', '230606197806040219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (863, '���칫���������ͷ־�', '֧��һ', '�־�', null, '18945602585', 'A1000012B7C455', '230603196310112350', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (864, '���칫���������ͷ־�', '֧��һ', '��ΰ', null, '18945602586', 'A1000012B7C41F', '230603197003030034', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (865, '���칫���������ͷ־�', '֧��һ', '�����', null, '18945602589', 'A1000012B7C329', '23060319650507231X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (866, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602590', 'A1000012B7C45B', '230603196602092312', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (867, '���칫���������ͷ־�', '֧��һ', '��Ӣ��', null, '18945602591', 'A1000012B7C452', '230603197508040916', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (868, '���칫���������ͷ־�', '֧��һ', '���ı�', null, '18945602592', 'A1000012B8225A', '230603195812102334', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (869, '���칫���������ͷ־�', '֧��һ', '�Ż�', null, '18945602593', 'A1000012B82259', '230603196310142322', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (870, '���칫���������ͷ־�', '֧��һ', '���Ҿ�', null, '18945602595', 'A1000012B8224A', '230603196212272318', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (871, '���칫���������ͷ־�', '֧��һ', '�Ƚ�ΰ', null, '18945602596', 'A1000012B82235', '230603197206060719', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (872, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602597', 'A1000012B82221', '230603196706111127', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (873, '���칫���������ͷ־�', '֧��һ', '���ٻ�', null, '18945602598', 'A1000012B82216', '230603196306042310', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (874, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602601', 'A1000012B82234', '230603196504180212', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (875, '���칫���������ͷ־�', '֧��һ', '���', null, '18945602602', 'A1000012B8220D', '230603195405042354', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (876, '���칫���������ͷ־�', '֧��һ', '�ŷ���', null, '18945602603', 'A1000012B8221A', '230603196501071918', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (877, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602605', 'A1000012B8223B', '230603196501142122', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (878, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602606', 'A1000012B7D77A', '230603197705290930', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (879, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602607', 'A1000012B7D76F', '230603196301171914', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (880, '���칫���������ͷ־�', '֧��һ', '�ƫ�', null, '18945602608', 'A1000012B7D76B', '230603196312052515', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (881, '���칫���������ͷ־�', '֧��һ', '���', null, '18945602609', 'A1000012B7D763', '230603197205082342', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (882, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602610', 'A1000012B7D76E', '230603196604141915', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (883, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602612', 'A1000012B7D76D', '230603195811292316', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (884, '���칫���������ͷ־�', '֧��һ', '����ɽ', null, '18945602613', 'A1000012B7D764', '230603197302160939', '0', '0', null, null, 0, '0001');
commit;
prompt 1101 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (885, '���칫���������ͷ־�', '֧��һ', '��ʫ��', null, '18945602615', 'A1000012B7D767', '230603195306062317', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (886, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602616', 'A1000012B7D711', '230603196408082356', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (887, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602617', 'A1000012B7D6FC', '230602196308083013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (888, '���칫���������ͷ־�', '֧��һ', '�Źھ�', null, '18945602618', 'A1000012B7C32A', '230602196408203015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (889, '���칫���������ͷ־�', '֧��һ', '���', null, '18945602619', 'A1000012B7C4A2', '230603196308302358', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (890, '���칫���������ͷ־�', '֧��һ', '���Ƴ�', null, '18945602620', 'A1000012B7C500', '230603196307291917', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (891, '���칫���������ͷ־�', '֧��һ', '�ŵ���', null, '18945602621', 'A1000012B7C326', '230603196310300415', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (892, '���칫���������ͷ־�', '֧��һ', '�', null, '18945602623', 'A1000012B7C4B9', '230605196208260819', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (893, '���칫���������ͷ־�', '֧��һ', '���׷�', null, '18945602625', 'A1000012B7BEF6', '230603197507092511', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (894, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602627', 'A1000012B7C4E1', '23060519640618241X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (895, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602628', 'A1000012B7C4DD', '230603196403132334', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (896, '���칫���������ͷ־�', '֧��һ', '�ϰ�ʯ', null, '18945602629', 'A1000012B7C4EE', '230602196703211978', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (897, '���칫���������ͷ־�', '֧��һ', '���ܾ�', null, '18945602630', 'A1000012B7C4AA', '230603196208013516', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (898, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602631', 'A1000012B7F244', '230603197209222314', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (899, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602632', 'A1000012B7F247', '230603196802071110', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (900, '���칫���������ͷ־�', '֧��һ', '���ľ�', null, '18945602635', 'A1000012B7F14E', '230603196006022393', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (901, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602636', 'A1000012B7F254', '230603197409020231', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (902, '���칫���������ͷ־�', '֧��һ', '���', null, '18945602637', 'A1000012B7F22C', '230603196308302331', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (903, '���칫���������ͷ־�', '֧��һ', '�Ͽ˱�', null, '18945602638', 'A1000012B7F246', '230602196311301516', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (904, '���칫���������ͷ־�', '֧��һ', '��ϲ��', null, '18945602639', 'A1000012B7F21D', '230603195302011918', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (905, '���칫���������ͷ־�', '֧��һ', '����ȫ', null, '18945602648', 'A1000012B7F12F', '230603196303052310', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (906, '���칫���������ͷ־�', '֧��һ', '��Ӣ��', null, '18945602650', 'A1000012B7F245', '230603195812011918', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (907, '���칫���������ͷ־�', '֧��һ', '¦����', null, '18945602651', 'A1000012B7F24E', '230603197405062119', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (908, '���칫���������ͷ־�', '֧��һ', '��С��', null, '18945602652', 'A1000012B8205E', '230603196305030019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (909, '���칫���������ͷ־�', '֧��һ', 'κ����', null, '18945602653', 'A1000012B81FCF', '230603196402241934', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (910, '���칫���������ͷ־�', '֧��һ', '�����', null, '18945602656', 'A1000012B820D0', '230603195406203332', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (911, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602657', 'A1000012B8299D', '230603196405212397', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (912, '���칫���������ͷ־�', '֧��һ', '�׽���', null, '18945602658', 'A1000012B81E74', '230603196410072395', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (913, '���칫���������ͷ־�', '֧��һ', '��־��', null, '18945602659', 'A1000012B81F73', '230603196104202339', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (914, '���칫���������ͷ־�', '֧��һ', '�Ա���', null, '18945602660', 'A1000012B82129', '230603196604141931', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (915, '���칫���������ͷ־�', '֧��һ', '��Ҫ��', null, '18945602661', 'A1000012B82114', '230603196504022353', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (916, '���칫���������ͷ־�', '֧��һ', '�����', null, '18945602662', 'A1000012B81E87', '230603196010011910', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (917, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602663', 'A1000012B8297D', '230603195109272331', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (918, '���칫���������ͷ־�', '֧��һ', '����ϲ', null, '18945602665', 'A1000012B822A0', '230603196405181914', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (919, '���칫���������ͷ־�', '֧��һ', '¬Ҷ��', null, '18945602667', 'A1000012B8229C', '230604196506080019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (920, '���칫���������ͷ־�', '֧��һ', '�����', null, '18945602668', 'A1000012B822A4', '230603197704172131', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (921, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602669', 'A1000012B82247', '230603196404100019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (922, '���칫���������ͷ־�', '֧��һ', '�����', null, '18945602670', 'A1000012B82299', '230603196309052311', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (923, '���칫���������ͷ־�', '֧��һ', 'л����', null, '18945602671', 'A1000012B8229F', '230604197010040034', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (924, '���칫���������ͷ־�', '֧��һ', '�ڹ���', null, '18945602672', 'A1000012B822A8', '230603196407062310', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (925, '���칫���������ͷ־�', '֧��һ', '���Ƹ�', null, '18945602673', 'A1000012B82239', '230603195403052313', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (926, '���칫���������ͷ־�', '֧��һ', '�ŕd', null, '18945602675', 'A1000012B822A1', '230603197608123727', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (927, '���칫���������ͷ־�', '֧��һ', '�����', null, '18945602676', 'A1000012B822AD', '230603195609023315', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (928, '���칫���������ͷ־�', '֧��һ', '���', null, '18945602679', 'A1000012B7D1D6', '230603196401243516', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (929, '���칫���������ͷ־�', '֧��һ', '���', null, '18945602680', 'A1000012B7D1EA', '230603196703082316', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (930, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602681', 'A1000012B7D1E4', '230603197306262510', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (931, '���칫���������ͷ־�', '֧��һ', 'ʯ����', null, '18945602682', 'A1000012B7D1F1', '230603196401231910', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (932, '���칫���������ͷ־�', '֧��һ', '�Խ���', null, '18945602683', 'A1000012B7D1EE', '230603196505061119', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (933, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602685', 'A1000012B7D1F4', '230603195309210012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (934, '���칫���������ͷ־�', '֧��һ', '�˳', null, '18945602686', 'A1000012B7D103', '230603195506080018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (935, '���칫���������ͷ־�', '֧��һ', '�ű�̫', null, '18945602687', 'A1000012B7D0F5', '230603195309251957', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (936, '���칫���������ͷ־�', '֧��һ', '�����', null, '18945602689', 'A1000012B7D0F6', '230603196310233312', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (937, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602690', 'A1000012B7D1F0', '230603195611052318', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (938, '���칫���������ͷ־�', '֧��һ', '����Ⱥ', null, '18945602691', 'A1000012B83014', '230603196304133315', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (939, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602692', 'A1000012B83013', '230603196409091916', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (940, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602693', 'A1000012B82C9C', '230603197308272544', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (941, '���칫���������ͷ־�', '֧��һ', '�ﰮ��', null, '18945602695', 'A1000012B82C73', '23060319731018253X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (942, '���칫���������ͷ־�', '֧��һ', '١����', null, '18945602696', 'A1000012B82C9D', '230603196510032312', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (943, '���칫���������ͷ־�', '֧��һ', '���̫', null, '18945602697', 'A1000012B83006', '230603196304152313', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (944, '���칫���������ͷ־�', '֧��һ', '̷����', null, '18945602698', 'A1000012B82CA3', '230603195810082317', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (945, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602701', 'A1000012B82C94', '230603196107292333', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (946, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602702', 'A1000012B82C8D', '230603195404080033', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (947, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602703', 'A1000012B82C7D', '23060219650718081X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (948, '���칫���������ͷ־�', '֧��һ', '����ѧ', null, '18945602705', 'A1000012B829A8', '230603196504161919', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (949, '���칫���������ͷ־�', '֧��һ', '����Т', null, '18945602706', 'A1000012B829BD', '230603195503082333', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (950, '���칫���������ͷ־�', '֧��һ', '���', null, '18945602707', 'A1000012B824F6', '230603195310060015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (951, '���칫���������ͷ־�', '֧��һ', '�Ծ���', null, '18945602708', 'A1000012B82814', '230603195910233514', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (952, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602709', 'A1000012B829C8', '230603196101302318', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (953, '���칫���������ͷ־�', '֧��һ', '��ˬ', null, '18945602710', 'A1000012B829BF', '230603197506203726', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (954, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602713', 'A1000012B8283C', '230603196509162515', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (955, '���칫���������ͷ־�', '֧��һ', '��־ǿ', null, '18945602715', 'A1000012B82823', '230603197207012516', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (956, '���칫���������ͷ־�', '֧��һ', '�η���', null, '18945602716', 'A1000012B829BA', '230603196107022536', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (957, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602717', 'A1000012B827F8', '230603195612100916', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (958, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602718', 'A1000012B7D39A', '230603196310073515', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (959, '���칫���������ͷ־�', '֧��һ', '����Ƽ', null, '18945602719', 'A1000012B7D36B', '230603196803180028', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (960, '���칫���������ͷ־�', '֧��һ', '���ľ�', null, '18945602720', 'A1000012B7D353', '230603196507150019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (961, '���칫���������ͷ־�', '֧��һ', '��Ұ', null, '18945602721', 'A1000012B7D39D', '230603197102221119', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (962, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602723', 'A1000012B7D355', '230603195810092312', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (963, '���칫���������ͷ־�', '֧��һ', '����ΰ', null, '18945602725', 'A1000012B7D32B', '230603196205090719', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (964, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602726', 'A1000012B7D37F', '230603196508082513', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (965, '���칫���������ͷ־�', '֧��һ', '��ΰ��', null, '18945602728', 'A1000012B7D379', '230603198105023315', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (966, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602729', 'A1000012B7D354', '230603195608142515', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (967, '���칫���������ͷ־�', '֧��һ', '�Ű���', null, '18945602730', 'A1000012B7D36F', '230603196210122316', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (968, '���칫���������ͷ־�', '֧��һ', '��ƽ', null, '18945602731', 'A1000012B82B7C', '230603196404082324', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (969, '���칫���������ͷ־�', '֧��һ', '����Ƽ', null, '18945602732', 'A1000012B82B45', '230603195911022321', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (970, '���칫���������ͷ־�', '֧��һ', 'ף����', null, '18945602735', 'A1000012B82BA6', '230603197403193721', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (971, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602736', 'A1000012B82B5B', '230603196303182326', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (972, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602737', 'A1000012B82B2E', '23060319711111194X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (973, '���칫���������ͷ־�', '֧��һ', '��Ƽ', null, '18945602738', 'A1000012B82B53', '230603197101210020', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (974, '���칫���������ͷ־�', '֧��һ', '����ΰ', null, '18945602739', 'A1000012B82A9A', '230603196207082317', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (975, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602750', 'A1000012B82B8A', '230602196404260059', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (976, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602751', 'A1000012B82B4E', '230603195012272319', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (977, '���칫���������ͷ־�', '֧��һ', '�����', null, '18945602752', 'A1000012B82B4B', '230603195302020013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (978, '���칫���������ͷ־�', '֧��һ', '��㽭', null, '18945602753', 'A1000012B829AF', '230603195405191915', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (981, '���칫���������ͷ־�', '֧��һ', '�ź��', null, '18945602758', 'A1000012B8282A', '230603195410052311', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (982, '���칫���������ͷ־�', '֧��һ', 'ף��', null, '18945602759', 'A1000012B82635', '230603195708141915', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (983, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602760', 'A1000012B829E2', '230603195304212334', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (984, '���칫����', '֧��һ', '��ϣ��', null, '18945600011', 'A1000012B7C42C', '230602195112200615', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (985, '���칫����', '֧��һ', '��Ӣ��', null, '18945600012', 'A1000012B7C409', '230602195108230010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (986, '���칫����', '֧��һ', '������', null, '18945600013', 'A1000012B7C40B', '23060219520308383X', '0', '0', null, null, 0, '0001');
commit;
prompt 1201 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (987, '���칫����', '֧��һ', '������', null, '18945600015', 'A1000012B7C3DC', '230606195304165813', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (988, '���칫����', '֧��һ', '������', null, '18945600016', 'A1000012B7C446', '230602195502170415', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (989, '���칫����', '֧��һ', '������', null, '18945600017', 'A1000012B7C34A', '230602196311270012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (990, '���칫����', '֧��һ', '�˳���', null, '18945600018', 'A1000012B7C3F0', '230602195302263852', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (991, '���칫����', '֧��һ', '������', null, '18945600019', 'A1000012B7C3DB', '230602195803013835', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (992, '���칫����', '֧��һ', '���־', null, '18945600020', 'A1000012B7C408', '230606195112240030', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (993, '���칫����', '֧��һ', '����', null, '18945600021', 'A1000012B7C42F', '23060319520209113X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (994, '���칫����', '֧��һ', '������', null, '18945600022', 'A1000012B7C8C5', '230602195205313811', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (995, '���칫����', '֧��һ', '���˱�', null, '18945600023', 'A1000012B7C8CB', '230602195211113859', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (996, '���칫����', '֧��һ', '������', null, '18945600025', 'A1000012B7C787', '230602195208240013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (979, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602756', 'A1000012B829BB', '230603196408041917', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (980, '���칫���������ͷ־�', '֧��һ', '���', null, '18945602757', 'A1000012B825A6', '230603196904101915', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (997, '���칫����', '֧��һ', '���־', null, '18945600026', 'A1000012B7C789', '230605195301200410', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (998, '���칫����', '֧��һ', '������', null, '18945600027', 'A1000012B7C8B2', '230623195311150034', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (999, '���칫����', '֧��һ', '�����', null, '18945600028', 'A1000012B7C795', '230226195402220031', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1000, '���칫����', '֧��һ', '�����', null, '18945600029', 'A1000012B7C94C', '230602195602106218', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1001, '���칫����', '֧��һ', '����', null, '18945600030', 'A1000012B7C893', '232329195512260217', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1002, '���칫����', '֧��һ', '��Ӣѧ', null, '18945600031', 'A1000012B7C93F', '230602195206100412', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1003, '���칫����', '֧��һ', '����', null, '18945600103', 'A1000012B7C92C', '230602730607023', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1004, '���칫����', '֧��һ', '�Ż���', null, '18945600105', 'A1000012B7FEC1', '232126197109090376', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1005, '���칫����', '֧��һ', '١��ΰ', null, '18945600106', 'A1000012B82BF5', '23060219770314022X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1006, '���칫����', '֧��һ', '��ӭ��', null, '18945600107', 'A1000012B82C6C', '232328760201812', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1007, '���칫����', '֧��һ', '��ƽ', null, '18945600108', 'A1000012B82C5C', '230602197003231921', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1008, '���칫����', '֧��һ', '����', null, '18945600109', 'A1000012B82F4C', '230602781202215', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1009, '���칫����', '֧��һ', 'Ԭ����', null, '18945600110', 'A1000012B82F4A', '230603198107170554', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1010, '���칫����', '֧��һ', '��ӱ', null, '18945600116', 'A1000012B82F06', '230602196004241924', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1011, '���칫����', '֧��һ', '��ѩ��', null, '18945611117', 'A1000012B82F1A', '230603197706130584', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1012, '���칫����', '֧��һ', '������', null, '18945600118', 'A1000012B82F02', '23060219691021192X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1013, '���칫����', '֧��һ', '������', null, '18945600119', 'A1000012B82F33', '222302690227053', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1014, '���칫����', '֧��һ', '�����', null, '18945611118', 'A1000012B7D35C', '232321197309059014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1015, '���칫����', '֧��һ', '����', null, '18945600167', 'A1000012B7D359', '230602197803300219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1016, '���칫����', '֧��һ', '������', null, '18945600456', 'A1000012B7D380', '230602601111044', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1017, '���칫����', '֧��һ', '��ΰ', null, '18945600301', 'A1000012B7D39E', '230604196402270053', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1018, '���칫����', '֧��һ', '����', null, '18945600302', 'A1000012B7D3D2', '230604198002154116', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1019, '���칫����', '֧��һ', '������', null, '18945600305', 'A1000012B7D37A', '230602196601221016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1020, '���칫����', '֧��һ', '���', null, '18945600306', 'A1000012B7D385', '230604197412243037', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1021, '���칫����', '֧��һ', '������', null, '18945600308', 'A1000012B7D35D', '230602197212220014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1022, '���칫����', '֧��һ', '��ΰ', null, '18945600309', 'A1000012B7D37D', '23060219710917251X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1023, '���칫����', '֧��һ', '������', null, '18945600315', 'A1000012B7E8E6', '230105197406070511', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1024, '���칫����', '֧��һ', '������', null, '18945600317', 'A1000012B7EAA0', '230107197312212470', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1025, '���칫����', '֧��һ', '�Ž���', null, '18945600319', 'A1000012B7EC7D', '230606197401115956', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1026, '���칫����', '֧��һ', '��һ', null, '18945600321', 'A1000012B7E8DD', '230602197205011613', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1027, '���칫����', '֧��һ', '������', null, '18945600330', 'A1000012B7E8E7', '230229197208080037', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1028, '���칫����', '֧��һ', '����', null, '18945600335', 'A1000012B7ECFD', '230602197505184010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1029, '���칫����', '֧��һ', 'ʷ����', null, '18945600336', 'A1000012B7ECEB', '230602197006021014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1030, '���칫����', '֧��һ', '������', null, '18945600338', 'A1000012B7E8DF', '23060219780227213X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1031, '���칫����', '֧��һ', '����', null, '18945600339', 'A1000012B7ED21', '230602197601242110', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1032, '���칫����', '֧��һ', '����÷', null, '18945600056', 'A1000012B7EA5D', '230621198104260282', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1033, '���칫����', '֧��һ', '������', null, '18945600058', 'A1000012B82C96', '23022219700305181X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1034, '���칫����', '֧��һ', '��ˬ', null, '18945600059', 'A1000012B82CF9', '239005198109043143', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1035, '���칫����', '֧��һ', '�ܰ�Ӣ', null, '18945600060', 'A1000012B82BC8', '230603196109021123', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1036, '���칫����', '֧��һ', '�ⳤ��', null, '18945600063', 'A1000012B82D27', '230602196707061938', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1037, '���칫����', '֧��һ', '���Ǭ', null, '18945600065', 'A1000012B82C6A', '230602196903274017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1038, '���칫����', '֧��һ', '��־��', null, '18945600066', 'A1000012B82D74', '230602197410175736', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1039, '���칫����', '֧��һ', '�Թ��', null, '18945600067', 'A1000012B82DB5', '230604196410070828', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1040, '���칫����', '֧��һ', '�Ѻ���', null, '18945600068', 'A1000012B82C87', '230602197809102512', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1041, '���칫����', '֧��һ', '��ѩ��', null, '18945600069', 'A1000012B82D0B', '230823197904040417', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1042, '���칫����', '֧��һ', '�Գ���', null, '18945600070', 'A1000012B82D5B', '230602197403244457', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1043, '���칫����', '֧��һ', '��˫', null, '18945600071', 'A1000012B7CFB2', '23060219540909231X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1044, '���칫����', '֧��һ', '³��', null, '18945600073', 'A1000012B7CFAE', '230203196909022333', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1045, '���칫����', '֧��һ', '������', null, '18945600076', 'A1000012B7D000', '230604197408080212', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1046, '���칫����', '֧��һ', '��死�', null, '18945600077', 'A1000012B7D001', '230604197011154121', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1047, '���칫����', '֧��һ', '����', null, '18945600078', 'A1000012B7D067', '230603197901211371', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1048, '���칫����', '֧��һ', '���±�', null, '18945600079', 'A1000012B7D05F', '230602197912283630', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1049, '���칫����', '֧��һ', '������', null, '18945600080', 'A1000012B7CF98', '230602197311217523', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1050, '���칫����', '֧��һ', '����', null, '18945600081', 'A1000012B7D006', '230602197311060618', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1051, '���칫����', '֧��һ', '����', null, '18945600082', 'A1000012B7CFB9', '230602195201023411', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1583, '���칫����', '�־�һ', 'ning', '010029', '13311510282', 'A1000012B74DB1', '123456789098766554', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1584, '���·־�', '�־�һ', 'yangfei', '010028', '13311510286', '000000000000001', '123456789088777777', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (501, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602248', 'A1000012B7C378', '230606197605032052', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (502, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�̹���', null, '18945602255', 'A1000012B7E8EE', '230604197610070210', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (503, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�߲�', null, '18945602256', 'A1000012B7EA66', '23060619750928521X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (504, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602257', 'A1000012B7EA67', '230606197308202051', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (505, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����ȫ', null, '18945602258', 'A1000012B7EAAC', '230606197203071753', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (506, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��־��', null, '18945602259', 'A1000012B7EC86', '230622197711050051', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (507, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���ľ�', null, '18945602260', 'A1000012B7ECA3', '230604198208254120', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (508, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����ѧ', null, '18945601999', 'A1000012B7ECDD', '230606195903290034', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (509, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602000', 'A1000012B7ECE1', '230602196712241917', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (510, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�����', null, '18945602111', 'A1000012B7ECE5', '230604196510271635', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (511, '���칫���ָ������־�', '�������־�', 'κ����', null, '18945602265', 'A1000012B7D71F', '230602197311297527', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (512, '���칫���ָ������־�', '�������־�', '�����', null, '18945602266', 'A1000012B7D717', '230602196612085697', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (513, '���칫���ָ������־�', '�������־�', '��Խ', null, '18945602269', 'A1000012B7BACE', '230605197209060223', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (514, '���칫���ָ������־�', '�������־�', '����', null, '18945602271', 'A1000012B7D73C', '230602197210093410', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (515, '���칫���ָ������־�', '�������־�', '���', null, '18945602272', 'A1000012B7D71E', '230605820421101', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (516, '���칫���ָ������־�', '�������־�', '���վ�', null, '18945602277', 'A1000012B7D716', '230604197005134116', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (517, '���칫���ָ������־�', '�������־�', '��ϣ�', null, '18945602278', 'A1000012B7D6BB', '230605196706182825', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (518, '���칫���ָ������־�', '�������־�', '���ĺ�', null, '18945602279', 'A1000012B7D719', '230602197003133424', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (519, '���칫���ָ������־�', '�������־�', 'ս����', null, '18945602281', 'A1000012B8220E', '230828198105220026', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (520, '���칫���ָ������־�', '�������־�', '������', null, '18945602287', 'A1000012B821FD', '230602196204083019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (521, '���칫���ָ������־�', '�������־�', '��ϣ��', null, '18945602288', 'A1000012B82269', '370205195912089175', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (522, '���칫���ָ������־�', '�������־�', '������', null, '18945602289', 'A1000012B821FB', '230604196301114414', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (523, '���칫���ָ������־�', '�������־�', '���Ӹ�', null, '18945602292', 'A1000012B82256', '230604197209170055', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (524, '���칫���ָ������־�', '�������־�', '����˫', null, '18945602296', 'A1000012B82226', '230103720306461', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (525, '���칫���ָ������־�', '�������־�', '������', null, '18945602297', 'A1000012B821F7', '230226197908241912', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (526, '���칫���ָ������־�', '�������־�', '����', null, '18945602298', 'A1000012B821FF', '230604198003260631', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (527, '���칫���ָ������־�', '�������־�', '����', null, '18945602299', 'A1000012B82205', '230603197106081117', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (528, '���칫���ָ������־�', '�������־�', '�����', null, '18945602300', 'A1000012B82267', '23060219730108021X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (529, '���칫���ָ������־�', '�������־�', '��ΰ', null, '18945602301', 'A1000012B7F6E9', '230604197401093010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (530, '���칫���ָ������־�', '�������־�', '����', null, '18945602303', 'A1000012B7F7F0', '230602197901224010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (531, '���칫���ָ������־�', '�������־�', '���̹�', null, '18945602305', 'A1000012B7FDBF', '230281197407154911', '0', '0', null, null, 0, '0001');
commit;
prompt 1301 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (532, '���칫���ָ������־�', '�������־�', '����', null, '18945602306', 'A1000012B7F6E0', '230605197404231016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (533, '���칫���ָ������־�', '�������־�', '������', null, '18945602307', 'A1000012B7F7CB', '230602750921441', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (534, '���칫���ָ������־�', '�������־�', '������', null, '18945602309', 'A1000012B8226A', '230203197811092135', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (535, '���칫���ָ������־�', '�������־�', '�η���', null, '18945602311', 'A1000012B82265', '230605640615205', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (536, '���칫���ָ������־�', '�������־�', '����', null, '18945602313', 'A1000012B82264', '230602198205126219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (537, '���칫���ָ������־�', '�������־�', '������', null, '18945602322', 'A1000012B8221D', '230602821025101', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (538, '���칫���ָ������־�', '�������־�', '�½���', null, '18945602323', 'A1000012B821F5', '230602196307111211', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (539, '���칫���ָ������־�', '�������־�', '���', null, '18945602332', 'A1000012B82229', '230602631203381', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (540, '���칫���ָ������־�', '�������־�', '�϶�', null, '18945602336', 'A1000012B821F6', '230604780907101', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (541, '���칫���ָ������־�', '�������־�', '����', null, '18945602337', 'A1000012B8227C', '230602197911034026', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (542, '���칫���ָ������־�', '�������־�', '������', null, '18945602339', 'A1000012B821F0', '230602197812025925', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (543, '���칫���ָ������־�', '�������־�', '��ѧΰ', null, '18945602341', 'A1000012B821FA', '230602197307274015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (544, '���칫���ָ������־�', '�������־�', '��־��', null, '18945602342', 'A1000012B8227F', '230602790316061', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (545, '���칫���ָ������־�', '�������־�', '������', null, '18945602343', 'A1000012B82F15', '230602197211210412', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (546, '���칫���ָ������־�', '�������־�', '���Ӷ�', null, '18945602345', 'A1000012B82EDE', '230603760721401', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (547, '���칫���ָ������־�', '�������־�', '����', null, '18945602346', 'A1000012B82D1A', '230103820214393', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (548, '���칫���ָ������־�', '�������־�', '��͢��', null, '18945602347', 'A1000012B82F05', '230602630615041', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (549, '���칫���ָ������־�', '�������־�', '����', null, '18945602350', 'A1000012B82273', '230603780122401', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (550, '���칫���ָ������־�', '�������־�', '����', null, '18945602351', 'A1000012B82258', '210105690630533', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (551, '���칫���ָ������־�', '�������־�', '�ܲ�', null, '18945602353', 'A1000012B82279', '230602197709204415', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (552, '���칫���ָ������־�', '�������־�', '�Ž���', null, '18945602355', 'A1000012B82E3B', '230602196712271956', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (553, '���칫���ָ������־�', '�������־�', '������', null, '18945602357', 'A1000012B7B786', '230603790903371', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (554, '���칫���ָ������־�', '�������־�', '�ž���', null, '18945602358', 'A1000012B78C98', '230602197301240615', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (555, '���칫���ָ������־�', '�������־�', 'Ĳ����', null, '18945602359', 'A1000012B7AFA4', '232622690226491', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (556, '���칫���ָ������־�', '�������־�', '������', null, '18945602366', 'A1000012B79C58', '230606610901001', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (557, '���칫���ָ������־�', '�������־�', '����˫', null, '18945602367', 'A1000012B74B71', '230602790430625', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (558, '���칫���ָ������־�', '�������־�', '������', null, '18945602368', 'A1000012B7B9F3', '230226196407260045', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (559, '���칫���ָ������־�', '�������־�', '�����', null, '18945602369', 'A1000012B78D26', '230603195212122518', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (560, '���칫���ָ������־�', '�������־�', '��ɭ��', null, '18945602370', 'A1000012B7B82D', '230602640126151', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (561, '���칫���ָ������־�', '�������־�', '�ֿ�', null, '18945602371', 'A1000012B80609', '230602197108270812', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (562, '���칫���ָ������־�', '�������־�', '֣����', null, '18945602372', 'A1000012B82F13', '230603740714315', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (563, '���칫���ָ������־�', '�������־�', '����', null, '18945602373', 'A1000012B82964', '230602198109116213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (564, '���칫���ָ������־�', '�������־�', '�����', null, '18945602375', 'A1000012B7D47C', '230602197706286216', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (565, '���칫���ָ������־�', '�������־�', '���Ԫ', null, '18945602376', 'A1000012B82EE0', '230603196112011111', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (566, '���칫���ָ������־�', '�������־�', '��鸣', null, '18945602377', 'A1000012B82EBC', '230604197310300299', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (567, '���칫���ָ������־�', '�������־�', '����', null, '18945602378', 'A1000012B82F0F', '230602196509250818', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (568, '���칫���ָ������־�', '�������־�', '������', null, '18945602379', 'A1000012B7F78F', '230606197805042431', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (569, '���칫���ָ������־�', '�������־�', '������', null, '18945602380', 'A1000012B82FF0', '230602780801061', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (570, '���칫���ָ������־�', '�������־�', '����', null, '18945602381', 'A1000012B83244', '230602781011361', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (571, '���칫���ָ������־�', '�������־�', '���', null, '18945602382', 'A1000012B7C3C2', '230602197004182316', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (572, '���칫���ָ������־�', '�������־�', '����ƽ', null, '18945602383', 'A1000012B82FF6', '230602196403163011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (573, '���칫���ָ������־�', '�������־�', '��ҵ��', null, '18945602385', 'A1000012B805DE', '230603195708153019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (574, '���칫���ָ������־�', '�������־�', '���·�', null, '18945602387', 'A1000012B82FEE', '230105720701051', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (575, '���칫���ָ������־�', '�������־�', '���', null, '18945602388', 'A1000012B83249', '230605640408201', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (576, '���칫���ָ������־�', '�������־�', '������', null, '18945602389', 'A1000012B8239F', '230602730303021', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (577, '���칫���ָ������־�', '�������־�', '����ΰ', null, '18945602390', 'A1000012B83253', '230602811015403', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (578, '���칫���ָ������־�', '�������־�', '�¹�', null, '18945602391', 'A1000012B82F4B', '232328740902007', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (579, '���칫���ָ������־�', '�������־�', '������', null, '18945602392', 'A1000012B82D08', '230602197207110419', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (580, '���칫���ָ������־�', '�������־�', '��ΰ��', null, '18945602393', 'A1000012B82F8C', '230602197012110013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (581, '���칫���ָ������־�', '�������־�', '���', null, '18945602398', 'A1000012B82F5A', '230605780801101', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (582, '���칫���ָ������־�', '�������־�', 'Ԭ����', null, '18945602399', 'A1000012B82F47', '230606197809222050', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (583, '���칫���ָ������־�', '�������־�', '�����', null, '18945602400', 'A1000012B82F32', '230602196103190026', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (584, '���칫���ָ������־�', '�������־�', 'ʯ��', null, '18945602402', 'A1000012B82F55', '230602197302137150', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (585, '���칫���ָ������־�', '�������־�', '���ǿ', null, '18945602403', 'A1000012B7F9B3', '230602197503204014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (586, '���칫���ָ������־�', '�������־�', '֣�̹�', null, '18945602405', 'A1000012B82F5C', '230605195609050412', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (587, '���칫���ָ������־�', '�������־�', '��ϲ��', null, '18945602407', 'A1000012B7F78E', '230107197611262478', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (588, '���칫���ָ������־�', '�������־�', '����', null, '18945602408', 'A1000012B7D727', '230602196911151957', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (589, '���칫���ָ������־�', '�������־�', '������', null, '18945602409', 'A1000012B7C499', '232301701027031', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (590, '���칫���ָ������־�', '�������־�', '��־��', null, '18945602410', 'A1000012B7C530', '230602197003283019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (591, '���칫���ָ������־�', '�������־�', '������', null, '18945600848', 'A1000012B8226D', '230602196601010817', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (592, '���칫���ָ������־�', '�������־�', '������', null, '18945602412', 'A1000012B7C515', '230605681007243', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (593, '���칫���ָ������־�', '�������־�', '��ҫ��', null, '18945602413', 'A1000012B7BA96', '230602197204013212', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (594, '���칫���ָ������־�', '�������־�', '����', null, '18945602415', 'A1000012B7495D', '23060219770726211X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (595, '���칫���ָ������־�', '�������־�', '�׳���', null, '18945602416', 'A1000012B7C4F2', '230604196203231625', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (596, '���칫���ָ������־�', '�������־�', '���', null, '18945602417', 'A1000012B7C52A', '230603196106020010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (597, '���칫���ָ������־�', '�������־�', '����', null, '18945602436', 'A1000012B7C516', '152104195509110615', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (598, '���칫���ָ������־�', '�������־�', '�ﺣ��', null, '18945602437', 'A1000012B7C4D9', '230602197906204019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (599, '���칫���ָ������־�', '�������־�', '������', null, '18945602438', 'A1000012B7C50E', '230602196508250816', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (600, '���칫���ָ������־�', '�������־�', '����', null, '18945600850', 'A1000012B7C4D2', '230602197511173617', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (601, '���칫���ָ������־�', '�������־�', '����˳', null, '18945602451', 'A1000012B7F7FA', '230602195612290813', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (602, '���칫���ָ������־�', '�������־�', '�߷ﻩ', null, '18945602453', 'A1000012B7F77D', '230602670912194', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (603, '���칫���ָ������־�', '�������־�', '��־��', null, '18945602455', 'A1000012B8312E', '230602197105046217', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (604, '���칫���ָ������־�', '�������־�', '��ѩ��', null, '18945602456', 'A1000012B8323B', '230606197812010219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (605, '���칫���ָ������־�', '�������־�', '�δ���', null, '18945602458', 'A1000012B807AE', '230602720812545', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (606, '���칫���ָ������־�', '�������־�', '��ռɽ', null, '18945602459', 'A1000012B7C10D', '230602571031341', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (607, '���칫���ָ������־�', '�������־�', 'ף�̾�', null, '18945602460', 'A1000012B8312D', '230604197008262017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (608, '���칫���ָ������־�', '�������־�', '����', null, '18945602461', 'A1000012B83125', '230602621211191', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (609, '���칫���ָ������־�', '�������־�', 'ף��ϣ', null, '18945602462', 'A1000012B83117', '230603195711283017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (610, '���칫���ָ������־�', '�������־�', '��ҫ��', null, '18945602463', 'A1000012B831FF', '230602810525545', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (611, '���칫���ָ������־�', '�������־�', '�ߺ���', null, '18945602465', 'A1000012B83250', '230604197308144717', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (612, '���칫���ָ������־�', '�������־�', '�λ۾�', null, '18945602466', 'A1000012B83129', '23232619691023102X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (613, '���칫���ָ������־�', '�������־�', '����Ӣ', null, '18945602467', 'A1000012B82D8D', '230605196212140027', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (614, '���칫���ָ������־�', '�������־�', '������', null, '18945602468', 'A1000012B82C75', '230604198306040230', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (615, '���칫���ָ������־�', '�������־�', '����', null, '18945602469', 'A1000012B820F0', '230603196409101117', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (616, '���칫���ָ������־�', '�������־�', '����', null, '18945602470', 'A1000012B820BF', '230602790206171', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (617, '���칫���ָ������־�', '�������־�', '������', null, '18945602471', 'A1000012B81E4B', '230603551101301', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (618, '���칫���ָ������־�', '�������־�', '������', null, '18945602472', 'A1000012B829AD', '230603600523301', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (619, '���칫���ָ������־�', '�������־�', '������', null, '18945602473', 'A1000012B81F3A', '230602661207191', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (620, '���칫���ָ������־�', '�������־�', '�ι���', null, '18945602475', 'A1000012B81CCC', '230606197407140853', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (621, '���칫���ָ������־�', '�������־�', '�ź���', null, '18945602386', 'A1000012B81C2A', '230602661030361', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (622, '���칫���ָ������־�', '�������־�', '�Ǵ���', null, '18945602478', 'A1000012B829A2', '230226780120201', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (623, '���칫���ָ������־�', '�������־�', '���Ż�', null, '18945602479', 'A1000012B82B7B', '230602197401205710', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (624, '���칫���ָ������־�', '�������־�', '�', null, '18945602480', 'A1000012B82B3F', '230602195205120016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (625, '���칫���ָ������־�', '�������־�', '������', null, '18945602481', 'A1000012B82B76', '230602195903023033', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (626, '���칫���ָ������־�', '�������־�', '����', null, '18945602482', 'A1000012B82B83', '230602660818402', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (627, '���칫���ָ������־�', '�������־�', '�ﾰ��', null, '18945602483', 'A1000012B82B59', '230604197309173042', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (628, '���칫���ָ������־�', '�������־�', '��ΡΡ', null, '18945602485', 'A1000012B82B28', '230602197806040627', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (629, '���칫���ָ������־�', '�������־�', '������', null, '18945602486', 'A1000012B82B3D', '230602810710712', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (630, '���칫���ָ������־�', '�������־�', '�ž���', null, '18945602487', 'A1000012B82B19', '23060219790125624X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (631, '���칫���ָ������־�', '�������־�', '����', null, '18945602488', 'A1000012B82B6B', '23060519681022022X', '0', '0', null, null, 0, '0001');
commit;
prompt 1401 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (632, '���칫���ָ������־�', '�������־�', '�쵤', null, '18945602489', 'A1000012B82B55', '230602790731444', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (633, '���칫���ָ������־�', '�������־�', '���ĸ�', null, '18945602499', 'A1000012B82C91', '23060219650303441X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (634, '���칫���ָ������־�', '�������־�', '����Ƽ', null, '18945602500', 'A1000012B82F3B', '23212519720302364X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (635, '���칫���ָ������־�', '�������־�', '�ﻯ��', null, '18945602333', 'A1000012B824D1', '230603196509040411', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (636, '���칫���ָ������־�', '�������־�', '����', null, '18945602262', 'A1000012B7D725', '230604198109052259', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (637, '���칫���ָ������־�', '�������־�', '����ԣ', null, '18945602308', 'A1000012B7F809', '230602670314081', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (638, '����־�', '����־�', '������', null, '18945600113', 'A1000012B7D1E0', '23060219751216021X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (639, '����־�', '����־�', '��־��', null, '18945601735', 'A1000012B7D1D7', '230603196401260017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (640, '����־�', '����־�', '�ں���', null, '18945601737', 'A1000012B7D1D1', '232623197010266018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (641, '����־�', '����־�', '����ʤ', null, '18945601738', 'A1000012B7D0EE', '23060219700712383X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (642, '����־�', '����־�', '��Ⱥʫ', null, '18945601739', 'A1000012B7D1DF', '230603197205300012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (643, '����־�', '����־�', 'Ԭʿ��', null, '18945601750', 'A1000012B7D200', '230602197409094453', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (644, '����־�', '����־�', '�Ž�ΰ', null, '18945601751', 'A1000012B7D1E3', '230605197502091037', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (645, '����־�', '����־�', '�����', null, '18945601752', 'A1000012B7D1DC', '230603197111051115', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (646, '����־�', '����־�', '������', null, '18945601753', 'A1000012B7D1DD', '230603197912270916', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (647, '����־�', '����־�', '�ױ�', null, '18945601755', 'A1000012B7D1BC', '230603197911290210', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (648, '����־�', '����־�', '����', null, '18945601756', 'A1000012B8292E', '230602196812121971', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (649, '����־�', '����־�', 'ǿΰ', null, '18945601757', 'A1000012B82996', '230603198203092111', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (650, '����־�', '����־�', '������', null, '18945601758', 'A1000012B82998', '230603196505011111', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (651, '����־�', '����־�', '�����', null, '18945601759', 'A1000012B8298A', '23060219680722591X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (652, '����־�', '����־�', '�����', null, '18945601760', 'A1000012B8292D', '230603196406280017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (653, '����־�', '����־�', '����', null, '18945601761', 'A1000012B82962', '232325196710110614', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (654, '����־�', '����־�', '���ΰ', null, '18945601762', 'A1000012B82995', '230604197104020034', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (655, '����־�', '����־�', '����', null, '18945601763', 'A1000012B82597', '230603198405070914', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (656, '����־�', '����־�', '������', null, '18945601765', 'A1000012B829AA', '230603197701043721', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (657, '����־�', '����־�', '������', null, '18945601766', 'A1000012B8298D', '230603197710162511', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (658, '����־�', '����־�', '��һ��', null, '18945601767', 'A1000012B7BEFB', '230603197711052146', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (659, '����־�', '����־�', '������', null, '18945601768', 'A1000012B7C4B5', '23060319780702254X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (660, '����־�', '����־�', '���岨', null, '18945601769', 'A1000012B7C363', '230602196603233630', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (661, '����־�', '����־�', '������', null, '18945601770', 'A1000012B7C4A4', '230604197104020034', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (662, '����־�', '����־�', '�ξ���', null, '18945601771', 'A1000012B7C514', '230103197307102925', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (663, '����־�', '����־�', '������', null, '18945601772', 'A1000012B7D10A', '230603196404050736', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (664, '����־�', '����־�', '���Ӣ', null, '18945601773', 'A1000012B7D204', '230602196805091962', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (665, '����־�', '����־�', '����', null, '18945601775', 'A1000012B7D207', '230603197804123716', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (666, '����־�', '����־�', '�Ź���', null, '18945601776', 'A1000012B7D175', '230503196712180051', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (667, '����־�', '����־�', '�����', null, '18945600038', 'A1000012B7C4B6', '230602196604191916', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (668, '����־�', '����־�', '����', null, '18945601779', 'A1000012B8227B', '230603195304091114', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (669, '����־�', '����־�', '�����', null, '18945601780', 'A1000012B82274', '230603196911150213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (670, '����־�', '����־�', '��Ρ', null, '18945601781', 'A1000012B822BF', '230603197505253318', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (671, '����־�', '����־�', '������', null, '18945601782', 'A1000012B822C3', '230603195408241113', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (672, '����־�', '����־�', '�⺣��', null, '18945601783', 'A1000012B82271', '23062119771215215X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (673, '����־�', '����־�', '�߹�Ȩ', null, '18945601785', 'A1000012B8225F', '23060319550128111X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (674, '����־�', '����־�', '�ް���', null, '18945601786', 'A1000012B82281', '23060319640828111X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (675, '����־�', '����־�', '���ɺ�', null, '18945601787', 'A1000012B822C6', '230603196306240712', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (676, '����־�', '����־�', '������', null, '18945601788', 'A1000012B822C9', '230602196002204214', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (677, '����־�', '����־�', '����Ө', null, '18945601789', 'A1000012B822B1', '230602196802151931', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (678, '����־�', '����־�', '������', null, '18945601790', 'A1000012B7CFB6', '230603197607124314', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (679, '����־�', '����־�', '����', null, '18945601796', 'A1000012B7D002', '230603197910092116', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (680, '����־�', '����־�', '�Ŵ���', null, '18945601797', 'A1000012B7D00C', '230602196403241243', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (681, '����־�', '����־�', '�����', null, '18945601798', 'A1000012B7D003', '230602196808141937', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (682, '����־�', '����־�', '֣����', null, '18945601799', 'A1000012B7D087', '230603197411101313', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (395, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602096', 'A1000012B7D1C9', '230606196805052619', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (396, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ž���', null, '18945602097', 'A1000012B7D1CA', '230606196502280016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (397, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���ο�', null, '18945602098', 'A1000012B7D1CC', '230606196003213812', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (398, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602099', 'A1000012B7D1CF', '23060619701215541X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (399, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602100', 'A1000012B7D1E1', '230606195605200010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (400, '���칫���ִ�ͬ�־�', '��ͬ�־�', '١��˫', null, '18945602101', 'A1000012B7D298', '230602197609272138', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (401, '���칫���ִ�ͬ�־�', '��ͬ�־�', '֣����', null, '18945602102', 'A1000012B81605', '232325198408030030', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (402, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602105', 'A1000012B81628', '230606196402231647', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (403, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����˫', null, '18945602106', 'A1000012B8162F', '230606196307301774', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (404, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�޵���', null, '18945602107', 'A1000012B81632', '230606196308143018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (405, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602108', 'A1000012B8222E', '230602197808042175', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (406, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ſ�ѧ', null, '18945602110', 'A1000012B82242', '230606197909294414', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (407, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602112', 'A1000012B82268', '230606196010101616', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (408, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ι��', null, '18945602117', 'A1000012B82270', '230602197504082178', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (409, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602118', 'A1000012B8227D', '230606196407010034', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (410, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�Ÿ���', null, '18945602119', 'A1000012B82294', '230604196909280832', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (411, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����Ծ', null, '18945602120', 'A1000012B82295', '230606196212161617', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (412, '���칫���ִ�ͬ�־�', '��ͬ�־�', '���ķ�', null, '18945602121', 'A1000012B82297', '23060219760306213X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (413, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602122', 'A1000012B82298', '230605196905222615', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (414, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602123', 'A1000012B8229A', '230605196203131612', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (415, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602125', 'A1000012B8229D', '230606196204280018', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (416, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�����', null, '18945602126', 'A1000012B824DE', '230606197207011758', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (417, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����', null, '18945602127', 'A1000012B8250E', '23060619620809161X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (418, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602128', 'A1000012B8295A', '230606198101074819', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (419, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�Ŵ���', null, '18945602130', 'A1000012B82967', '23060219761213211X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (420, '���칫���ִ�ͬ�־�', '��ͬ�־�', '����ȫ', null, '18945602131', 'A1000012B82969', '230606195612070031', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (421, '���칫���ִ�ͬ�־�', '��ͬ�־�', '������', null, '18945602133', 'A1000012B82981', '230606196308010012', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (422, '���칫���ִ�ͬ�־�', '��ͬ�־�', '��־ȫ', null, '18945602134', 'A1000012B82984', '230602197707092130', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (423, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�Ŵ���', null, '18945602135', 'A1000012B8298E', '230606197410260231', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (424, '���칫���ִ�ͬ�־�', '��ͬ�־�', '�ȳ���', null, '18945602137', 'A1000012B82994', '230602195211203838', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (820, '���칫���������ͷ־�', '֧��һ', '���ľ�', null, '18945602519', 'A1000012B7AC9C', '230603196509192546', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (821, '���칫���������ͷ־�', '֧��һ', '�쵤', null, '18945602520', 'A1000012B7AE97', '23060319771024252X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (822, '���칫���������ͷ־�', '֧��һ', 'κ�緼', null, '18945602521', 'A1000012B7ACAF', '230603196304162327', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (823, '���칫���������ͷ־�', '֧��һ', '��־��', null, '18945602523', 'A1000012B7AC3E', '230603195911272312', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (824, '���칫���������ͷ־�', '֧��һ', '�Ž���', null, '18945602526', 'A1000012B7AF8A', '23060319540510237X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (825, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602527', 'A1000012B7AFAA', '230603195401100713', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (826, '���칫���������ͷ־�', '֧��һ', '�����', null, '18945602528', 'A1000012B7AF5D', '230603196511201122', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (827, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602529', 'A1000012B7AEE9', '230603195304152335', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (828, '���칫���������ͷ־�', '֧��һ', '�ڱ�', null, '18945602530', 'A1000012B83008', '230603197209131949', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (829, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602531', 'A1000012B8300E', '230603197108080011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (830, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602532', 'A1000012B82F24', '230606196303045814', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (831, '���칫���������ͷ־�', '֧��һ', '��־��', null, '18945602535', 'A1000012B83010', '230521196512030027', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (832, '���칫���������ͷ־�', '֧��һ', '����ϼ', null, '18945602536', 'A1000012B82F0C', '230603196509182321', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (833, '���칫���������ͷ־�', '֧��һ', '����÷', null, '18945602537', 'A1000012B82F18', '230603197610113341', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (834, '���칫���������ͷ־�', '֧��һ', '�챦��', null, '18945602538', 'A1000012B83016', '230603195608232326', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (835, '���칫���������ͷ־�', '֧��һ', '�Ż�', null, '18945602539', 'A1000012B82F84', '230603196406012127', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (836, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602550', 'A1000012B8301B', '230603196311232338', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (837, '���칫���������ͷ־�', '֧��һ', 'Ѧ��ΰ', null, '18945602551', 'A1000012B82F60', '230603196808220017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (838, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602552', 'A1000012B82238', '230603197410110939', '0', '0', null, null, 0, '0001');
commit;
prompt 1501 records committed...
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (839, '���칫���������ͷ־�', '֧��һ', '��ϣ��', null, '18945602553', 'A1000012B8222D', '230603195507022338', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (840, '���칫���������ͷ־�', '֧��һ', '�����', null, '18945602556', 'A1000012B82202', '230603197307082511', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (841, '���칫���������ͷ־�', '֧��һ', '�Ź�', null, '18945602557', 'A1000012B82231', '23060319680503231X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (842, '���칫���������ͷ־�', '֧��һ', '�ε���', null, '18945602558', 'A1000012B8222A', '230603195408262694', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (843, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602559', 'A1000012B821F9', '230603197308102510', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (844, '���칫���������ͷ־�', '֧��һ', '��ͮ', null, '18945602560', 'A1000012B8222F', '230603197507110214', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (845, '���칫���������ͷ־�', '֧��һ', '���', null, '18945602561', 'A1000012B8220C', '230603196106260911', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (846, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602562', 'A1000012B82260', '230602197611012116', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (847, '���칫���������ͷ־�', '֧��һ', '��ӭ��', null, '18945602563', 'A1000012B82208', '230603196402132519', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (848, '���칫���������ͷ־�', '֧��һ', '�ΰ', null, '18945602565', 'A1000012B7D1B9', '230603196311270035', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (849, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602568', 'A1000012B7D1BA', '230603197609102119', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (850, '���칫���������ͷ־�', '֧��һ', '³�³�', null, '18945602569', 'A1000012B7D1D4', '230603196511221916', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (851, '���칫���������ͷ־�', '֧��һ', '��Ӣ��', null, '18945602570', 'A1000012B7D1D2', '230603196512282518', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (852, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602571', 'A1000012B7D1B8', '230605196906102017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (853, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602572', 'A1000012B7D1BB', '230603197611180212', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (854, '���칫���������ͷ־�', '֧��һ', '��Ө', null, '18945602573', 'A1000012B7D1B6', '230603197708240015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (855, '���칫���������ͷ־�', '֧��һ', '��͢ΰ', null, '18945602575', 'A1000012B7D1B4', '230603196502281917', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (856, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602576', 'A1000012B7D1E2', '230603197404150977', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (857, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602578', 'A1000012B7C327', '230603196004162317', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (858, '���칫���������ͷ־�', '֧��һ', '֣����', null, '18945602579', 'A1000012B7C445', '230603196609042318', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (859, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602580', 'A1000012B7C45A', '230603197412010210', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (860, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602581', 'A1000012B7C403', '230603196501060215', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (861, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602582', 'A1000012B7C478', '230603197209212538', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (862, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602583', 'A1000012B7C459', '230603196412080011', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (764, '����־�', '����־�', '����ǿ', null, '18945601909', 'A1000012B81647', '230603197304141352', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (765, '����־�', '����־�', '�ν���', null, '18945601910', 'A1000012B815C8', '230603196212280713', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (766, '����־�', '����־�', '����', null, '18945601911', 'A1000012B815DF', '230603196905101116', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (767, '����־�', '����־�', '�޷���', null, '18945601913', 'A1000012B815CE', '230603195307060030', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (768, '����־�', '����־�', '�ۺ�ϲ', null, '18945601915', 'A1000012B81DEC', '230603195505021112', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (769, '����־�', '����־�', '�ź��', null, '18945601916', 'A1000012B81CA5', '230602195804013810', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (770, '����־�', '����־�', '������', null, '18945601917', 'A1000012B820EC', '230603196001130723', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (771, '����־�', '����־�', '���±�', null, '18945601918', 'A1000012B820D7', '230603196601291117', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (772, '����־�', '����־�', '�����', null, '18945601919', 'A1000012B7E877', '230604196308040219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (773, '����־�', '����־�', '���鷼', null, '18945601920', 'A1000012B820EA', '230604197502050220', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (774, '����־�', '����־�', '������', null, '18945601921', 'A1000012B81EF4', '230603196301110716', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (775, '����־�', '����־�', '���', null, '18945601922', 'A1000012B81DFC', '230602196701230219', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (776, '����־�', '����־�', '����', null, '18945601923', 'A1000012B82CE2', '230603196104190016', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (777, '����־�', '����־�', '���', null, '18945601925', 'A1000012B81D42', '230603197408052127', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (778, '����־�', '����־�', '���Һ�', null, '18945601926', 'A1000012B75E0D', '230805197510270036', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (779, '����־�', '����־�', '��־��', null, '18945601927', 'A1000012B7546C', '230603196507071118', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (780, '����־�', '����־�', '�Ӹ�', null, '18945601928', 'A1000012B7B954', '230602197812096213', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (781, '����־�', '����־�', '���', null, '18945601930', 'A1000012B7BA1B', '230603197102024019', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (782, '����־�', '����־�', '������', null, '18945601932', 'A1000012B78B5F', '23060319571120071X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (783, '����־�', '����־�', '���ף', null, '18945601933', 'A1000012B78D25', '230603196501231117', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (784, '����־�', '����־�', '�����', null, '18945601936', 'A1000012B7595D', '230603196312230027', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (785, '����־�', '����־�', '���', null, '18945601939', 'A1000012B7588B', '230602196207150010', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (786, '����־�', '����־�', '����ɽ', null, '18945601949', 'A1000012B7B2C8', '230603196102260017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (787, '����־�', '����־�', '��ѧ��', null, '18945601950', 'A1000012B74CDA', '230603195108081314', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (788, '����־�', '����־�', '������', null, '18945601951', 'A1000012B7B19E', '230603195407180013', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (789, '����־�', '����־�', '�º���', null, '18945601955', 'A1000012B7B697', '232321197403299014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (790, '����־�', '����־�', '������', null, '18945601956', 'A1000012B7B046', '230603195610020015', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (791, '����־�', '����־�', '��־��', null, '18945601958', 'A1000012B7B6BF', '230603195811080014', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (792, '����־�', '����־�', '���Ӿ�', null, '18945601959', 'A1000012B7B331', '230603196303101119', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (793, '����־�', '����־�', '����', null, '18945601965', 'A1000012B7B5FB', '230603196507150027', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (794, '����־�', '����־�', '����', null, '18945601966', 'A1000012B7B742', '230602197404284020', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (795, '����־�', '����־�', '���ǻ�', null, '18945601967', 'A1000012B7B341', '230603197112041111', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (796, '����־�', '����־�', '�־�', null, '18945601968', 'A1000012B7B2EB', '230204197305172120', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (797, '����־�', '����־�', '���', null, '18945601969', 'A1000012B7B3DC', '230603196206290712', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (798, '����־�', '����־�', '��³��', null, '18945601970', 'A1000012B7D0F3', '230603195205110711', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (799, '����־�', '����־�', '������', null, '18945601971', 'A1000012B7C4D6', '230603197103032328', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (800, '����־�', '����־�', '�����', null, '18945601975', 'A1000012B7C2E1', '230103197506064626', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (801, '����־�', '����־�', '����ǿ', null, '18945601976', 'A1000012B7BF03', '230602197601182111', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (802, '����־�', '����־�', '������', null, '18945601977', 'A1000012B7D1A1', '232622197306134616', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (803, '����־�', '����־�', '֣����', null, '18945601978', 'A1000012B7C43E', '23010719780910247X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (804, '����־�', '����־�', '��', null, '18945601980', 'A1000012B7D1A4', '230603196105011139', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (805, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602501', 'A1000012B7D1A5', '230603195508052336', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (806, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602502', 'A1000012B7D174', '230606195702035811', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (807, '���칫���������ͷ־�', '֧��һ', '��Ϊ��', null, '18945602503', 'A1000012B7D172', '230602196402210058', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (808, '���칫���������ͷ־�', '֧��һ', '��º�', null, '18945602505', 'A1000012B823D0', '230603196508242310', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (809, '���칫���������ͷ־�', '֧��һ', '�����', null, '18945602506', 'A1000012B831F2', '230603196412042533', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (810, '���칫���������ͷ־�', '֧��һ', '��Т��', null, '18945602507', 'A1000012B829F6', '230603195509243513', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (811, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602508', 'A1000012B7F64E', '230602196505090239', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (812, '���칫���������ͷ־�', '֧��һ', '��ά��', null, '18945602509', 'A1000012B82A7E', '230602195703190033', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (813, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602510', 'A1000012B82870', '230602196212174017', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (814, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602512', 'A1000012B82A92', '230603197311182531', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (815, '���칫���������ͷ־�', '֧��һ', '����', null, '18945602513', 'A1000012B82A84', '230603197702150932', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (816, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602515', 'A1000012B8281E', '23060319781129373X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (817, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602516', 'A1000012B8286C', '230603196310262527', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (818, '���칫���������ͷ־�', '֧��һ', '������', null, '18945602517', 'A1000012B7AF6B', '23060319630913232X', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (819, '���칫���������ͷ־�', '֧��һ', '��־��', null, '18945602518', 'A1000012B7AEFE', '230603196110122335', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1600, '�����־�', '֧�Ӷ�', '����', '11', '11', 'A0000020E682CB', '11', '0', '0', '2', '2', 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1588, '�־�һ', '�־�һ', '���ΰ', '939390', '13382938348', 'A00000177F5455', '610392198404240414', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1589, '���·־�', '�־�һ', 'sch-w899', '010030', '13311322345', 'A0000024DBEF1F', '123456789008766554', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1590, '���·־�', '�־�һ', 'moto-air', '010088', '13621738376', 'A0000022887B36', '163646363664647474', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1594, '�����־�', '֧�Ӷ�', '����', '11', '11', '00000000000000', '11', '0', '0', '2', '1', 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1595, '�����־�', '֧�Ӷ�', '�º�', '11', '13139917511', 'A1000012B74DB5', '111', '0', '0', '2', '2', 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1597, '���칫����', '�����־�', '����', '111', '18729572026', '1212', '610324198502240555', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1596, '���칫����', '�����־�', '11111', '111', '111111111111', 'A1000012B11111', '11111111111111111', '0', '0', '1', '1', 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1602, '�����־�', '֧�Ӷ�', '����2', '111', '1234', 'a100000e192864', '123', '0', '0', '2', '2', 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1601, '�����־�', '֧�Ӷ�', '�º�2', '11', '13139917512', 'A1000012B74DA0', '111', '0', '0', '2', '2', 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1593, '�����־�', '֧�Ӷ�', '�ո�', '33', '15002904890', 'A1000012B74DA0D', '33', '2', '1', '2', '2', 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1603, '�����־�', '֧�Ӷ�', 'ʵʵ', '111', '111', 'A0000020921F1C', '111', '0', '0', '2', '1', 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1598, '�����־�', '�����־�', '�º�2', '1231', '222222222222', '222222222', '222222222222222222', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1599, '�����־�', '�����־�', '�º�3', '1233', '333333333333333', '3333333', '333333333333333333', '0', '0', '1', '1', 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1585, '���·־�', '�־�һ', 'ʯ��ɽ����', '111111', '13111111111', 'A0000022889BAC', '111111111111111111', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1587, '���·־�', '�־�һ', 'sony ERI', '010026', '13311426578', '012682002801653', '367711223456789098', '0', '0', null, null, 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1591, '�����־�', '֧�Ӷ�', '����', '111', '1234', '12345678901233', '123', '0', '0', '2', '2', 0, '0001');
insert into T_SJSB (ID, DW, BM, XM, JH, SJH, DEVICE_ID, SFZHM, JZ, PWD, ZQZT, DDJB, DELFLAG, XZQH)
values (1592, '�����־�', '�����־�', '����', '1', '1122', '1122', '1122', '0', '0', '1', '2', 0, '0001');
commit;
prompt 1598 records loaded
prompt Loading T_SJSB_SUB...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (719, 'A1000012B82D85', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (720, 'A1000012B82D82', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (721, 'A1000012B82DD3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (722, 'A1000012B82C86', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (723, 'A1000012B82CAE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (724, 'A1000012B82DF4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (725, 'A1000012B75C58', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (726, 'A1000012B76B2F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (727, 'A1000012B76B01', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (728, 'A1000012B78C12', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (729, 'A1000012B78CBF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (730, 'A1000012B7B61A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (731, 'A1000012B7B228', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (732, 'A1000012B7BA1F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (733, 'A1000012B78BA4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (735, 'A1000012B7F258', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (736, 'A1000012B7F10F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (734, 'A1000012B7B6AC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (737, 'A1000012B7F3C6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (738, 'A1000012B7F1CA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (739, 'A1000012B7F226', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (740, 'A1000012B7F03D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (741, 'A1000012B7F1D8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (742, 'A1000012B7F240', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (743, 'A1000012B7F036', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (744, 'A1000012B7F1E4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (745, 'A1000012B82B58', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (746, 'A1000012B82C79', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (747, 'A1000012B82C6E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (748, 'A1000012B82C31', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (749, 'A1000012B82DC2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (750, 'A1000012B82DBD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (751, 'A1000012B82D0F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (752, 'A1000012B82BD7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (753, 'A1000012B82B80', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (754, 'A1000012B82B82', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (755, 'A1000012B7A8FC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (756, 'A1000012B7A60F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (757, 'A1000012B7AE49', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (758, 'A1000012B7AE1E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (759, 'A1000012B7ACA2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (760, 'A1000012B77DDA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (761, 'A1000012B7A8ED', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (762, 'A1000012B7A837', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (763, 'A1000012B7A934', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (764, 'A1000012B7AA22', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (765, 'A1000012B82CBA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (766, 'A1000012B82C82', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (767, 'A1000012B82C8C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (768, 'A1000012B82C5B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (769, 'A1000012B82965', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (770, 'A1000012B82CD6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (771, 'A1000012B82C71', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (772, 'A1000012B82C12', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (773, 'A1000012B82F5D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (774, 'A1000012B82F25', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (775, 'A1000012B8310F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (776, 'A1000012B830D7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (777, 'A1000012B830B6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (778, 'A1000012B815CD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (779, 'A1000012B8160B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (780, 'A1000012B81641', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (781, 'A1000012B7DD37', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (782, 'A1000012B81623', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (783, 'A1000012B7DA2C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (784, 'A1000012B815FE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (785, 'A1000012B8161A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (786, 'A1000012B81624', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (787, 'A1000012B81638', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (788, 'A1000012B8160E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (789, 'A1000012B815F9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (790, 'A1000012B8162C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (791, 'A1000012B81647', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (792, 'A1000012B815C8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (793, 'A1000012B815DF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (794, 'A1000012B815CE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (795, 'A1000012B81DEC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (796, 'A1000012B81CA5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (797, 'A1000012B820EC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (798, 'A1000012B820D7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (799, 'A1000012B7E877', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (800, 'A1000012B820EA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (801, 'A1000012B81EF4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (802, 'A1000012B81DFC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (803, 'A1000012B82CE2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (804, 'A1000012B81D42', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (805, 'A1000012B75E0D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (806, 'A1000012B7546C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (807, 'A1000012B7B954', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (808, 'A1000012B7BA1B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (809, 'A1000012B78B5F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (810, 'A1000012B78D25', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (811, 'A1000012B7595D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (812, 'A1000012B7588B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (813, 'A1000012B7B2C8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (814, 'A1000012B74CDA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (815, 'A1000012B7B19E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (816, 'A1000012B7B697', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (817, 'A1000012B7B046', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (818, 'A1000012B7B6BF', '05:00', '14:00', 15, 1, null);
commit;
prompt 101 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (819, 'A1000012B7B331', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (820, 'A1000012B7B5FB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (821, 'A1000012B7B742', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (822, 'A1000012B7B341', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (823, 'A1000012B7B2EB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (824, 'A1000012B7B3DC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (825, 'A1000012B7D0F3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (826, 'A1000012B7C4D6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (827, 'A1000012B7C2E1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (828, 'A1000012B7BF03', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (829, 'A1000012B7D1A1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (830, 'A1000012B7C43E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (831, 'A1000012B7D1A4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (832, 'A1000012B7D1A5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (833, 'A1000012B7D174', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (834, 'A1000012B7D172', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (835, 'A1000012B823D0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (836, 'A1000012B831F2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (837, 'A1000012B829F6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (838, 'A1000012B7F64E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (839, 'A1000012B82A7E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (840, 'A1000012B82870', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (841, 'A1000012B82A92', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (842, 'A1000012B82A84', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (843, 'A1000012B8281E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (844, 'A1000012B8286C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (845, 'A1000012B7AF6B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (846, 'A1000012B7AEFE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (847, 'A1000012B7AC9C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (848, 'A1000012B7AE97', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (849, 'A1000012B7ACAF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (850, 'A1000012B7AC3E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (851, 'A1000012B7AF8A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (852, 'A1000012B7AFAA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (853, 'A1000012B7AF5D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (854, 'A1000012B7AEE9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (855, 'A1000012B83008', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (856, 'A1000012B8300E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (857, 'A1000012B82F24', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (858, 'A1000012B83010', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (859, 'A1000012B82F0C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (860, 'A1000012B82F18', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (861, 'A1000012B83016', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (862, 'A1000012B82F84', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (863, 'A1000012B8301B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (864, 'A1000012B82F60', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (865, 'A1000012B82238', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (866, 'A1000012B8222D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (867, 'A1000012B82202', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (868, 'A1000012B82231', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (869, 'A1000012B8222A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (870, 'A1000012B821F9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (871, 'A1000012B8222F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (872, 'A1000012B8220C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (873, 'A1000012B82260', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (874, 'A1000012B82208', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (875, 'A1000012B7D1B9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (876, 'A1000012B7D1BA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (877, 'A1000012B7D1D4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (878, 'A1000012B7D1D2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (879, 'A1000012B7D1B8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (880, 'A1000012B7D1BB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (881, 'A1000012B7D1B6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (882, 'A1000012B7D1B4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (883, 'A1000012B7D1E2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (884, 'A1000012B7C327', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (885, 'A1000012B7C445', '04:00', '14:00', 25, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (886, 'A1000012B7C45A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (887, 'A1000012B7C403', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (888, 'A1000012B7C478', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (889, 'A1000012B7C459', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (28, 'A1000012B82904', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (29, 'A1000012B82411', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (204, 'A1000012B7D834', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (377, 'A1000012B7C27A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (378, 'A1000012B7C2AD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (379, 'A1000012B7C2DB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (2, 'A1000012B829E3A', '8:00', '18:00', 20, null, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (380, 'A1000012B7C2EA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (381, 'A1000012B7C2EE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (382, 'A1000012B7C33A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (383, 'A1000012B7C375', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (384, 'A1000012B7C380', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (385, 'A1000012B7C383', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (386, 'A1000012B7C388', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (387, 'A1000012B7C38E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (388, 'A1000012B7C394', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (389, 'A1000012B7C395', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (390, 'A1000012B7C3BB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (391, 'A1000012B7C3C1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (392, 'A1000012B7C3CA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (393, 'A1000012B7C3CD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (394, 'A1000012B7C3D1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (395, 'A1000012B7C3D5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (396, 'A1000012B7C3E8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (397, 'A1000012B7C3EC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (398, 'A1000012B7C401', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (399, 'A1000012B7C41B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (400, 'A1000012B7C426', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (401, 'A1000012B7C42D', '05:00', '14:00', 15, 1, null);
commit;
prompt 201 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (402, 'A1000012B7C444', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (403, 'A1000012B7C447', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (404, 'A1000012B7C44B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (405, 'A1000012B7C44D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (406, 'A1000012B7C44F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (407, 'A1000012B7B877', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (408, 'A1000012B7C480', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (409, 'A1000012B7C4B3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (410, 'A1000012B7C4C5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (411, 'A1000012B7C4D5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (412, 'A1000012B7C4D7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (413, 'A1000012B7C4E4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (414, 'A1000012B7C4EB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (415, 'A1000012B7C50D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (416, 'A1000012B7C527', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (417, 'A1000012B7D0EC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (418, 'A1000012B7D0FA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (419, 'A1000012B7D161', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (420, 'A1000012B7D1A3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (421, 'A1000012B7D1C7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (422, 'A1000012B7D1C9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (423, 'A1000012B7D1CA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (424, 'A1000012B7D1CC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (425, 'A1000012B7D1CF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (426, 'A1000012B7D1E1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (427, 'A1000012B7D298', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (428, 'A1000012B81605', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (429, 'A1000012B81628', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (430, 'A1000012B8162F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (431, 'A1000012B81632', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (432, 'A1000012B8222E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (433, 'A1000012B82242', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (434, 'A1000012B82268', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (435, 'A1000012B82270', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (436, 'A1000012B8227D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (437, 'A1000012B82294', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (438, 'A1000012B82295', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (439, 'A1000012B82297', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (440, 'A1000012B82298', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (441, 'A1000012B8229A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (442, 'A1000012B8229D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (443, 'A1000012B824DE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (444, 'A1000012B8250E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (445, 'A1000012B8295A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (446, 'A1000012B82967', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (447, 'A1000012B82969', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (448, 'A1000012B82981', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (449, 'A1000012B82984', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (450, 'A1000012B8298E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (451, 'A1000012B82994', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (452, 'A1000012B829A1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (453, 'A1000012B82B4A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (454, 'A1000012B82BB7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (455, 'A1000012B82BC7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (456, 'A1000012B82BD1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (457, 'A1000012B82BD3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (458, 'A1000012B82BF1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (459, 'A1000012B82C2E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (460, 'A1000012B82C3A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (461, 'A1000012B82C47', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (462, 'A1000012B82C49', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (463, 'A1000012B82C4E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (464, 'A1000012B82C50', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (465, 'A1000012B82C52', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (466, 'A1000012B82C56', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (467, 'A1000012B82C58', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (468, 'A1000012B82C69', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (469, 'A1000012B82C6F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (470, 'A1000012B82C77', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (471, 'A1000012B82C78', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (472, 'A1000012B82C80', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (473, 'A1000012B82C81', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (474, 'A1000012B82C84', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (475, 'A1000012B82C90', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (476, 'A1000012B82C97', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (477, 'A1000012B82C99', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (478, 'A1000012B82C9B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (479, 'A1000012B82C9F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (480, 'A1000012B82CA4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (481, 'A1000012B82CA5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (482, 'A1000012B82CA6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (483, 'A1000012B82CAF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (484, 'A1000012B82CB8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (485, 'A1000012B82CC7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (486, 'A1000012B82CC9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (487, 'A1000012B82CCD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (488, 'A1000012B82CD8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (489, 'A1000012B82CDC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (490, 'A1000012B82CE0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (491, 'A1000012B82D57', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (492, 'A1000012B82D9D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (493, 'A1000012B82D9F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (494, 'A1000012B82DA2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (495, 'A1000012B82DA6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (496, 'A1000012B82DAE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (497, 'A1000012B82DCA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (498, 'A1000012B82DF5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (499, 'A1000012B82E15', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (500, 'A1000012B82DCF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (501, 'A1000012B82E61', '05:00', '14:00', 15, 1, null);
commit;
prompt 301 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (502, 'A1000012B82E7B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (503, 'A1000012B82E7C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (504, 'A1000012B82E87', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (505, 'A1000012B82ED1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (506, 'A1000012B82EE8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (507, 'A1000012B82F48', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (508, 'A1000012B82F52', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (509, 'A1000012B82FA2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (510, 'A1000012B82FD7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (511, 'A1000012B83028', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (512, 'A1000012B83029', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (513, 'A1000012B8306B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (514, 'A1000012B8309C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (515, 'A1000012B8309E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (516, 'A1000012B830A2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (517, 'A1000012B830DA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (518, 'A1000012B830EE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (519, 'A1000012B830F3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (520, 'A1000012B8310E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (521, 'A1000012B83110', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (522, 'A1000012B83111', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (523, 'A1000012B83113', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (524, 'A1000012B83116', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (525, 'A1000012B8311B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (526, 'A1000012B8311F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (527, 'A1000012B83149', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (528, 'A1000012B7C378', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (529, 'A1000012B7E8EE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (530, 'A1000012B7EA66', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (531, 'A1000012B7EA67', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (532, 'A1000012B7EAAC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (533, 'A1000012B7EC86', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (534, 'A1000012B7ECA3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (535, 'A1000012B7ECDD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (536, 'A1000012B7ECE1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (537, 'A1000012B7ECE5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (538, 'A1000012B7D71F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (539, 'A1000012B7D717', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (540, 'A1000012B7BACE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (541, 'A1000012B7D73C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (542, 'A1000012B7D71E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (543, 'A1000012B7D716', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (544, 'A1000012B7D6BB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (545, 'A1000012B7D719', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1651, '22', '08:00', '19:00', 10, 0, '6');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1650, '22', '08:00', '13:00', 10, 0, '7');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (30, 'A1000012B7D11F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (31, 'A1000012B823E3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (32, 'A1000012B7F62F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (33, 'A1000012B828EF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (34, 'A1000012B82434', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (35, 'A1000012B7D1A8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (36, 'A1000012B82A45', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (37, 'A1000012B82A8B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (38, 'A1000012B7C4D4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (39, 'A1000012B7D1C8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (40, 'A1000012B7C4BA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (41, 'A1000012B7C2E5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (42, 'A1000012B7D1DE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (43, 'A1000012B7C4DA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (44, 'A1000012B7C528', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (45, 'A1000012B7C4A0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (46, 'A1000012B7C4F0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (47, 'A1000012B7C49B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (48, 'A1000012B82220', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (49, 'A1000012B82245', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (50, 'A1000012B82255', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (51, 'A1000012B8223C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (52, 'A1000012B8221F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (53, 'A1000012B8224E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (54, 'A1000012B82252', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (55, 'A1000012B82210', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (56, 'A1000012B82253', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (57, 'A1000012B82240', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (58, 'A1000012B7D7B4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (59, 'A1000012B7D773', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (60, 'A1000012B7D788', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (61, 'A1000012B7D7DA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (62, 'A1000012B7D7E5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (63, 'A1000012B7D782', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (64, 'A1000012B7D7AE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (65, 'A1000012B7D7E0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (66, 'A1000012B81DF6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (67, 'A1000012B7D7E1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (68, 'A1000012B81EF2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (69, 'A1000012B7D7E2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (70, 'A1000012B81EF3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (71, 'A1000012B81CC0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (72, 'A1000012B820B0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (73, 'A1000012B81E3D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (74, 'A1000012B81E47', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (75, 'A1000012B75D8F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (76, 'A1000012B81EB7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (77, 'A1000012B7A576', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (78, 'A1000012B81D78', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (79, 'A1000012B81E6F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (80, 'A1000012B78BDB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (81, 'A1000012B7BB7B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (82, 'A1000012B78C33', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (83, 'A1000012B7A568', '05:00', '14:00', 15, 1, null);
commit;
prompt 401 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (84, 'A1000012B7B92B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (85, 'A1000012B7B6FE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (86, 'A1000012B7CC40', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (87, 'A1000012B7CA72', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (88, 'A1000012B7CA7E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (89, 'A1000012B7B938', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (90, 'A1000012B7CA76', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (91, 'A1000012B7BA7A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (92, 'A1000012B7CC38', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (93, 'A1000012B7CA71', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (94, 'A1000012B7CA77', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (95, 'A1000012B7CC39', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (96, 'A1000012B7CA83', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (97, 'A1000012B7ECE6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (98, 'A1000012BE238A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (99, 'A1000012B7ECF5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (100, 'A1000012B7CA79', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (101, 'A1000012B7EA64', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (102, 'A1000012B7EBF8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (103, 'A1000012B7ECEF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (104, 'A1000012B7E8EB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (105, 'A1000012B7ECFF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (106, 'A1000012B7ECDF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (107, 'A1000012B822BC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (108, 'A1000012B822B5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (109, 'A1000012B822B4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (110, 'A1000012B7E8DC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (111, 'A1000012B8228B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (112, 'A1000012B8228E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (113, 'A1000012B822AC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (114, 'A1000012B8226B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (115, 'A1000012B8228A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (116, 'A1000012B822BD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (117, 'A1000012B829E3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (118, 'A1000012B82E3D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (119, 'A1000012B822B2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (120, 'A1000012B7A440', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (121, 'A1000012B81A92', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (122, 'A1000012B82C5D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (123, 'A1000012B82E57', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (124, 'A1000012B82AD0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (125, 'A1000012B82DDD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (126, 'A1000012B7B8EF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (127, 'A1000012B7B9EE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (128, 'A1000012B7BBAA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (129, 'A1000012B7B8D4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (130, 'A1000012B7B7F6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (131, 'A1000012B7B99E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (132, 'A1000012B82E3A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (133, 'A1000012B82DE3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (134, 'A1000012B829CC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (135, 'A1000012B822A6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (136, 'A1000012B8223F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (137, 'A1000012 BE238', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (138, 'A1000012B7BBB7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (139, 'A1000012B7BAC4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (140, 'A1000012B82261', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (141, 'A1000012B822AE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (142, 'A1000012B822A7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (143, 'A1000012B8228D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (144, 'A1000012B822B8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (145, 'A1000012B822AB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (146, 'A1000012B822B3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (147, 'A1000012B7F85D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (148, 'A1000012B7F869', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (149, 'A1000012B7F6CE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (150, 'A1000012B7F863', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (151, 'A1000012B7F82D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (152, 'A1000012B7F84A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (153, 'A1000012B7F791', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (154, 'A1000012B822B7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (155, 'A1000012B7F36E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (156, 'A1000012B7F6CF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (157, 'A1000012B8163B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (158, 'A1000012B7F819', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (159, 'A1000012B81602', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (160, 'A1000012B815EE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (161, 'A1000012B81611', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (162, 'A1000012B7D00E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (163, 'A1000012B81618', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (164, 'A1000012B815D0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (165, 'A1000012B81637', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (166, 'A1000012B815CB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (167, 'A1000012B81629', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (168, 'A1000012B7D076', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (169, 'A1000012B7D00D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (170, 'A1000012B7C90E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (171, 'A1000012B815EB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (172, 'A1000012B7CF9C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (173, 'A1000012B7D063', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (174, 'A1000012B82C66', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (175, 'A1000012B7CF97', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (176, 'A1000012B82C44', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (177, 'A1000012B7CFA9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (178, 'A1000012B7D00F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (179, 'A1000012B82CA8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (180, 'A1000012B82C32', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (181, 'A1000012B82BC5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (182, 'A1000012B7CF9B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (183, 'A1000012B82BF4', '05:00', '14:00', 15, 1, null);
commit;
prompt 501 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (184, 'A1000012B82C5A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (185, 'A1000012B82C61', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (186, 'A1000012B82C46', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (187, 'A1000012B82C4D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (188, 'A1000012B82963', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (189, 'A1000012B829D6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (190, 'A1000012B8294E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (191, 'A1000012B8295F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (192, 'A1000012B82C85', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (193, 'A1000012B825ED', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (194, 'A1000012B8280E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (195, 'A1000012B829AB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (196, 'A1000012B82571', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (197, 'A1000012B82598', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (198, 'A1000012B7D8B4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (199, 'A1000012B7D880', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (200, 'A1000012B7D9FD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (201, 'A1000012B7D89D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (202, 'A1000012B7D6D0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (203, 'A1000012B7D9FF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (546, 'A1000012B8220E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (548, 'A1000012B82269', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (549, 'A1000012B821FB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (550, 'A1000012B82256', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (551, 'A1000012B82226', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (552, 'A1000012B821F7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (553, 'A1000012B821FF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (554, 'A1000012B82205', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (555, 'A1000012B82267', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (556, 'A1000012B7F6E9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (559, 'A1000012B7F6E0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (560, 'A1000012B7F7CB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (561, 'A1000012B8226A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (562, 'A1000012B82265', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (563, 'A1000012B82264', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (564, 'A1000012B8221D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (565, 'A1000012B821F5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (566, 'A1000012B82229', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (567, 'A1000012B821F6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (568, 'A1000012B8227C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (569, 'A1000012B821F0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (570, 'A1000012B821FA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (571, 'A1000012B8227F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (572, 'A1000012B82F15', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (573, 'A1000012B82EDE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (574, 'A1000012B82D1A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (575, 'A1000012B82F05', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (576, 'A1000012B82273', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (577, 'A1000012B82258', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (578, 'A1000012B82279', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (579, 'A1000012B82E3B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (580, 'A1000012B7B786', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (581, 'A1000012B78C98', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (582, 'A1000012B7AFA4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (583, 'A1000012B79C58', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (584, 'A1000012B74B71', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (585, 'A1000012B7B9F3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (586, 'A1000012B78D26', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (587, 'A1000012B7B82D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (588, 'A1000012B80609', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (589, 'A1000012B82F13', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (590, 'A1000012B82964', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (591, 'A1000012B7D47C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (592, 'A1000012B82EE0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (593, 'A1000012B82EBC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (594, 'A1000012B82F0F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (595, 'A1000012B7F78F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (596, 'A1000012B82FF0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (597, 'A1000012B83244', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (598, 'A1000012B7C3C2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (599, 'A1000012B82FF6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (600, 'A1000012B805DE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (601, 'A1000012B82FEE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (602, 'A1000012B83249', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (603, 'A1000012B8239F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (604, 'A1000012B83253', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (605, 'A1000012B82F4B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (606, 'A1000012B82D08', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (607, 'A1000012B82F8C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (608, 'A1000012B82F5A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (609, 'A1000012B82F47', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (610, 'A1000012B82F32', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (611, 'A1000012B82F55', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (612, 'A1000012B7F9B3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (613, 'A1000012B82F5C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (614, 'A1000012B7F78E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (615, 'A1000012B7D727', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (616, 'A1000012B7C499', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (617, 'A1000012B7C530', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (618, 'A1000012B8226D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (619, 'A1000012B7C515', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (620, 'A1000012B7BA96', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (621, 'A1000012B7495D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (622, 'A1000012B7C4F2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (623, 'A1000012B7C52A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (624, 'A1000012B7C516', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (625, 'A1000012B7C4D9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (626, 'A1000012B7C50E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (627, 'A1000012B7C4D2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (628, 'A1000012B7F7FA', '05:00', '14:00', 15, 1, null);
commit;
prompt 601 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (629, 'A1000012B7F77D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (630, 'A1000012B8312E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (631, 'A1000012B8323B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (632, 'A1000012B807AE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (633, 'A1000012B7C10D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (634, 'A1000012B8312D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (635, 'A1000012B83125', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (636, 'A1000012B83117', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (637, 'A1000012B831FF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (638, 'A1000012B83250', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (639, 'A1000012B83129', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (640, 'A1000012B82D8D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (641, 'A1000012B82C75', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (642, 'A1000012B820F0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (643, 'A1000012B820BF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (644, 'A1000012B81E4B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (645, 'A1000012B829AD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (646, 'A1000012B81F3A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (647, 'A1000012B81CCC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (648, 'A1000012B81C2A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (649, 'A1000012B829A2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (650, 'A1000012B82B7B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (651, 'A1000012B82B3F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (652, 'A1000012B82B76', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (653, 'A1000012B82B83', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (654, 'A1000012B82B59', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (655, 'A1000012B82B28', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (656, 'A1000012B82B3D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (657, 'A1000012B82B19', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (658, 'A1000012B82B6B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (659, 'A1000012B82B55', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (660, 'A1000012B82C91', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (661, 'A1000012B82F3B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (662, 'A1000012B824D1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (663, 'A1000012B7D725', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (664, 'A1000012B7F809', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (665, 'A1000012B7D1E0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (666, 'A1000012B7D1D7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (667, 'A1000012B7D1D1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (668, 'A1000012B7D0EE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (669, 'A1000012B7D1DF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (670, 'A1000012B7D200', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (671, 'A1000012B7D1E3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (672, 'A1000012B7D1DC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (673, 'A1000012B7D1DD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (674, 'A1000012B7D1BC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (675, 'A1000012B8292E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (676, 'A1000012B82996', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (677, 'A1000012B82998', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (678, 'A1000012B8298A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (679, 'A1000012B8292D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (680, 'A1000012B82962', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (681, 'A1000012B82995', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (682, 'A1000012B82597', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (683, 'A1000012B829AA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (684, 'A1000012B8298D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (685, 'A1000012B7BEFB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (686, 'A1000012B7C4B5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (687, 'A1000012B7C363', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (688, 'A1000012B7C4A4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (689, 'A1000012B7C514', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (690, 'A1000012B7D10A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (691, 'A1000012B7D204', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (692, 'A1000012B7D207', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (693, 'A1000012B7D175', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (694, 'A1000012B7C4B6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (695, 'A1000012B8227B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (696, 'A1000012B82274', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (697, 'A1000012B822BF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (698, 'A1000012B822C3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (699, 'A1000012B82271', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (700, 'A1000012B8225F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (701, 'A1000012B82281', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (702, 'A1000012B822C6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (703, 'A1000012B822C9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (704, 'A1000012B822B1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (705, 'A1000012B7CFB6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (706, 'A1000012B7D002', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (707, 'A1000012B7D00C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (708, 'A1000012B7D003', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (709, 'A1000012B7D087', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (557, 'A1000012B7F7F0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (558, 'A1000012B7FDBF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (710, 'A1000012B7CF91', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (711, 'A1000012B7CFAD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (712, 'A1000012B7CFA7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (713, 'A1000012B7CFAB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (714, 'A1000012B7D073', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (715, 'A1000012B82D7D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (716, 'A1000012B82C34', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (717, 'A1000012B82DCD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (718, 'A1000012B82D78', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (205, 'A1000012B7D89A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1, 'A1000012B74D99', '8:00', '18:00', 20, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (206, 'A1000012B7D875', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (207, 'A1000012B7D89E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (208, 'A1000012B7C442', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (209, 'A1000012B7C41E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (210, 'A1000012B7C448', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (211, 'A1000012B7C3F7', '05:00', '14:00', 15, 1, null);
commit;
prompt 701 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (212, 'A1000012B7C453', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (213, 'A1000012BF227D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (214, 'A1000012B7C460', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (215, 'A1000012B75D85', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (216, 'A1000012B7B9F7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (217, 'A1000012B7BB28', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (218, 'A1000012B7C429', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (219, 'A1000012B75D70', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (220, 'A1000012B75B36', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (221, 'A1000012B758A3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (222, 'A1000012B7B9ED', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (223, 'A1000012B7BA7F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (224, 'A1000012B78B91', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (225, 'A1000012B7C420', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (226, 'A1000012B7C449', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (227, 'A1000012B7BDE3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (228, 'A1000012B7D318', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (229, 'A1000012B7D2E9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (230, 'A1000012B7D2C5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (231, 'A1000012B7D30B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (232, 'A1000012B7D2F6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (233, 'A1000012B7D2D9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (234, 'A1000012B7C42B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (235, 'A1000012B7D2D3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (236, 'A1000012B7D31F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (237, 'A1000012B7D2D1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (238, 'A1000012B7C3D0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (239, 'A1000012B80155', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (240, 'A1000012B82B6D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (241, 'A1000012B829E4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (242, 'A1000012B7C441', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (243, 'A1000012B829C3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (244, 'A1000012B7C40C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (245, 'A1000012B7C3F4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (246, 'A1000012B7D317', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (247, 'A1000012B7C430', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (248, 'A1000012B7C3D3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (249, 'A1000012B7C3F3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (250, 'A1000012B82952', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (251, 'A1000012B829EB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (252, 'A1000012B7C3F9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (253, 'A1000012B7C413', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (254, 'A1000012B829DC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (255, 'A1000012B8297C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (256, 'A1000012B829C1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (257, 'A1000012B82A41', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (258, 'A1000012B82FA1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (259, 'A1000012B82F23', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (260, 'A1000012B825AA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (261, 'A1000012B82F2B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (262, 'A1000012B82F8D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (263, 'A1000012B82973', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (264, 'A1000012B824D5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (265, 'A1000012B829B3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (266, 'A1000012B829D1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (267, 'A1000012B7E9CE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (268, 'A1000012B7EB0C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (269, 'A1000012B82F1F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (270, 'A1000012B7E37B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (271, 'A1000012B7EADF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (272, 'A1000012B7EB56', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (273, 'A1000012B82816', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (274, 'A1000012B7EA4C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (275, 'A1000012B7EAE2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (276, 'A1000012B82F42', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (277, 'A1000012B829A6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (278, 'A1000012B7D2D2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (279, 'A1000012B7D316', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (280, 'A1000012B829D3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (281, 'A1000012B7D2FE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (282, 'A1000012B82F5F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (283, 'A1000012B824A4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (284, 'A1000012B7E2E7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (285, 'A1000012B7C440', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (286, 'A1000012B82820', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (287, 'A1000012B829B0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (288, 'A1000012B82565', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (289, 'A1000012B7D3F3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (290, 'A1000012B7D2DC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (291, 'A1000012B7D2C4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (292, 'A1000012B82F8F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (293, 'A1000012B829AE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (294, 'A1000012B7D325', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (295, 'A1000012B829B4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (296, 'A1000012B82971', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (297, 'A1000012B7D13C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (298, 'A1000012B82841', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (299, 'A1000012B829B8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (300, 'A1000012B7D14C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (301, 'A1000012B7D147', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (302, 'A1000012B7CF95', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (303, 'A1000012B7D2EA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (304, 'A1000012B7D13D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (305, 'A1000012B7B645', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (306, 'A1000012B829C7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (307, 'A1000012B7D141', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (308, 'A1000012B7B676', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (309, 'A1000012B7B2E5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (310, 'A1000012B7D13E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (311, 'A1000012B7D008', '05:00', '14:00', 15, 1, null);
commit;
prompt 801 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (312, 'A1000012B829DE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (313, 'A1000012B7CFAC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (314, 'A1000012B7D14B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (315, 'A1000012B7CFB0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (316, 'A1000012B7D05C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (317, 'A1000012B7D143', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (318, 'A1000012B7CF69', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (319, 'A1000012B7B6B8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (320, 'A1000012B7CFA5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (321, 'A1000012B82661', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (322, 'A1000012B7D059', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (323, 'A1000012B7E8E8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (324, 'A1000012B82983', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (325, 'A1000012B7B687', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (326, 'A1000012B7EC97', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (327, 'A1000012B7ECC8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (328, 'A1000012B7B388', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (329, 'A1000012B7D0BC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (330, 'A1000012B7CFB3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (331, 'A1000012B7EC8F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (332, 'A1000012B7ECA7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (333, 'A1000012B7EABD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (334, 'A1000012B7E8DE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (335, 'A1000012B7EA6A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (336, 'A1000012B82F5B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (337, 'A1000012B7CF99', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (338, 'A1000012B7E970', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (339, 'A1000012B7B705', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (340, 'A1000012B7ECEA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (341, 'A1000012B7CFA4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (342, 'A1000012B7B359', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (343, 'A1000012B7D2FA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (344, 'A1000012B7B286', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (345, 'A1000012B7B72D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (346, 'A1000012B7EACB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (347, 'A1000012BE240B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (348, 'A1000012B82F45', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (349, 'A1000012B825AB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (350, 'A1000012B75975', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (351, 'A1000012B75B47', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (352, 'A1000012B75B74', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (353, 'A1000012B75BE5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (354, 'A1000012B75D1A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (355, 'A1000012B75D7E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (356, 'A1000012B75D86', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (357, 'A1000012B75DA6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (358, 'A1000012B75DBA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (359, 'A1000012B76B17', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (360, 'A1000012B76B19', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (361, 'A1000012B76B27', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (362, 'A1000012B76B2E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (363, 'A1000012B78B7E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (364, 'A1000012B78B81', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (365, 'A1000012B78BA8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (366, 'A1000012B78C2B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (367, 'A1000012B7B6C7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (368, 'A1000012B7B9B1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (369, 'A1000012B7BD86', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (370, 'A1000012B7BEFA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (371, 'A1000012B7BF02', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (372, 'A1000012B7C182', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (373, 'A1000012B7C21A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (374, 'A1000012B7C230', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (375, 'A1000012B7C26A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (376, 'A1000012B7C26D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1228, 'A1000012B7B2CC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1229, 'A1000012B7B710', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1230, 'A1000012B7B6DD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1231, 'A1000012B7B6A6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1232, 'A1000012B831A4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1233, 'A1000012B826BC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1234, 'A1000012B8309D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1235, 'A1000012B830C1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1236, 'A1000012B831AB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1237, 'A1000012B830A0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1238, 'A1000012B815E2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1239, 'A1000012B831C2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1240, 'A1000012B815D4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1241, 'A1000012B815EA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1242, 'A1000012B7C9A3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1243, 'A1000012B7C997', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1244, 'A1000012B7C84A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1245, 'A1000012B7C97A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1246, 'A1000012B7C940', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1247, 'A1000012B7C89A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1248, 'A1000012B7C996', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1249, 'A1000012B7C8D4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1250, 'A1000012B7C8D0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1251, 'A1000012B7C86C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1252, 'A1000012B82CB0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1253, 'A1000012B82C98', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1254, 'A1000012B82CAA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1255, 'A1000012B82C88', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1256, 'A1000012B82CC0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1257, 'A1000012B82C95', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1258, 'A1000012B82CAB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1259, 'A1000012B82CB1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1260, 'A1000012B82CA0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1261, 'A1000012B82C7A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1262, 'A1000012B82292', '05:00', '14:00', 15, 1, null);
commit;
prompt 901 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1263, 'A1000012B822BE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1264, 'A1000012B82288', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1265, 'A1000012B82230', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1266, 'A1000012B8224C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1267, 'A1000012B82266', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1268, 'A1000012B82232', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1269, 'A1000012B8225B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1270, 'A1000012B82249', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1271, 'A1000012B8228C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1272, 'A1000012B7D202', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1273, 'A1000012B7D0F2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1274, 'A1000012B7D101', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1275, 'A1000012B7D16F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1276, 'A1000012B7D170', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1277, 'A1000012B7D1F8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1278, 'A1000012B7D203', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1279, 'A1000012B7D173', '04:00', '14:00', 25, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1280, 'A1000012B7D1DB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1281, 'A1000012B7D1FC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1282, 'A1000012B79D60', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1283, 'A1000012B76B1E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1284, 'A1000012B7B593', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1285, 'A1000012B763A0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1286, 'A1000012B7B382', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1287, 'A1000012B7B28B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1288, 'A1000012B75BB7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1289, 'A1000012B758F3', '04:00', '14:00', 25, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1290, 'A1000012B75D58', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1291, 'A1000012B7B3D6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1292, 'A1000012B7DDB1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1293, 'A1000012B7F81A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1294, 'A1000012B7F810', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1295, 'A1000012B7F844', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1296, 'A1000012B7BF05', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1297, 'A1000012B7F840', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1298, 'A1000012B7C2F9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1299, 'A1000012B7C2F3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1300, 'A1000012B7C2FB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1301, 'A1000012B7C2A8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1302, 'A1000012B7F824', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1303, 'A1000012B7F7AD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1304, 'A1000012B7F857', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1305, 'A1000012B7F867', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1306, 'A1000012B7F849', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1307, 'A1000012B7C2B5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1308, 'A1000012B7C2BF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1309, 'A1000012B7C2D6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1310, 'A1000012B7C0A0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1311, 'A1000012B7C2A7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1312, 'A1000012B82FEB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1313, 'A1000012B815FC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1314, 'A1000012B8161C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1315, 'A1000012B82CAC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1316, 'A1000012B82C8F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1317, 'A1000012B82C67', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1318, 'A1000012B82CBC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1319, 'A1000012B82C48', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1320, 'A1000012B82956', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1321, 'A1000012B82C7F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1322, 'A1000012B82B6A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1323, 'A1000012B82CBE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1324, 'A1000012B82C72', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1325, 'A1000012B820DD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1326, 'A1000012B81C92', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1327, 'A1000012B82120', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1328, 'A1000012B820E7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1329, 'A1000012B8208D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1330, 'A1000012B81E0F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1331, 'A1000012B820ED', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1332, 'A1000012B83020', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1333, 'A1000012B820CD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1334, 'A1000012B820D8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1335, 'A1000012B820BE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1336, 'A1000012B7D7D2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1337, 'A1000012B7D718', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1338, 'A1000012B7D7D3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1339, 'A1000012B7D71A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1340, 'A1000012B7D740', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1341, 'A1000012B7D7D5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1342, 'A1000012B7D741', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1343, 'A1000012B7D74A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1344, 'A1000012B7D724', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1345, 'A1000012B7D721', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1346, 'A1000012B8162D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1347, 'A1000012B81630', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1348, 'A1000012B815FD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1349, 'A1000012B822C0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1350, 'A1000012B822C7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1351, 'A1000012B815D1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1352, 'A1000012B822C1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1353, 'A1000012B82285', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1354, 'A1000012B81606', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1355, 'A1000012B815FB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1356, 'A1000012B82225', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1357, 'A1000012B82228', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1358, 'A1000012B82214', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1359, 'A1000012B821FE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1360, 'A1000012B82201', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1361, 'A1000012B8221E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1362, 'A1000012B8222C', '05:00', '14:00', 15, 1, null);
commit;
prompt 1001 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1363, 'A1000012B82241', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1364, 'A1000012B821F2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1365, 'A1000012B82215', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1366, 'A1000012B7C425', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1367, 'A1000012B7C3CF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1368, 'A1000012B7C38F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1369, 'A1000012B7C41D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1370, 'A1000012B7C415', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1371, 'A1000012B7C434', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1372, 'A1000012B7C391', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1373, 'A1000012B7C432', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1374, 'A1000012B7C42A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1375, 'A1000012B7C38D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1376, 'A1000012B7590C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1377, 'A1000012B78C82', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1378, 'A1000012B7BB5A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1379, 'A1000012B76B3F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1380, 'A1000012B7A565', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1381, 'A1000012B82F92', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1382, 'A1000012B7B835', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1383, 'A1000012B78CA9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1384, 'A1000012B7591B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1385, 'A1000012B7594E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1386, 'A1000012B7D504', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1387, 'A1000012B7D58B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1388, 'A1000012B7D4D3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1389, 'A1000012B7D59B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1390, 'A1000012B7D52F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1391, 'A1000012B7D57E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1392, 'A1000012B7D536', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1393, 'A1000012B7D4FC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1394, 'A1000012B7D58E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1395, 'A1000012B7D589', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1396, 'A1000012B82211', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1397, 'A1000012B82236', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1398, 'A1000012B82224', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1399, 'A1000012B82257', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1400, 'A1000012B82251', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1401, 'A1000012B8224F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1402, 'A1000012B8223E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1403, 'A1000012B82219', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1404, 'A1000012B82248', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1405, 'A1000012B82233', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1406, 'A1000012B81604', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1407, 'A1000012B81544', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1408, 'A1000012B81620', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1409, 'A1000012B831BD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1410, 'A1000012B8163C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1411, 'A1000012B81616', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1412, 'A1000012B81617', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1413, 'A1000012B815DD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1414, 'A1000012B81608', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1415, 'A1000012B8162E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1416, 'A1000012B7C443', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1417, 'A1000012B7C431', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1418, 'A1000012B7C33D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1419, 'A1000012B7C418', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1420, 'A1000012B7C3D8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1421, 'A1000012B7C433', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1422, 'A1000012B7C404', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1423, 'A1000012B7C428', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1424, 'A1000012B7C471', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1425, 'A1000012B7C3DF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1426, 'A1000012B7B1EE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1427, 'A1000012B78CD4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1428, 'A1000012B7BA6A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1429, 'A1000012B78CB6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1430, 'A1000012B79D71', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1431, 'A1000012B7B60C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1432, 'A1000012B758D2', '04:00', '14:00', 25, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1433, 'A1000012B7B7CD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1434, 'A1000012B7589C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1435, 'A1000012B78C51', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1436, 'A1000012B7D8FB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1437, 'A1000012B7D83E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1438, 'A1000012B7D96F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1439, 'A1000012B7D9A2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1440, 'A1000012B7D80F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1441, 'A1000012B7D8F1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1442, 'A1000012B7D884', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1443, 'A1000012B7DA00', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1444, 'A1000012B7D9FE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1445, 'A1000012B7D91C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1446, 'A1000012B7DD77', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1447, 'A1000012B7F7CF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1448, 'A1000012B7F7C3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1449, 'A1000012B7F7F4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1450, 'A1000012B7F7D9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1451, 'A1000012B7DE0F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1452, 'A1000012B7F7B1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1453, 'A1000012B7FDBB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1454, 'A1000012B7F7EE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1455, 'A1000012B7F7A4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1456, 'A1000012B7F710', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1457, 'A1000012B7FDB0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1458, 'A1000012B7FDAD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1459, 'A1000012B7F73A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1460, 'A1000012B7F75E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1461, 'A1000012B7F747', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1462, 'A1000012B7F767', '05:00', '14:00', 15, 1, null);
commit;
prompt 1101 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1463, 'A1000012B7FDB7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1464, 'A1000012B7F76B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1465, 'A1000012B7F67F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1466, 'A1000012B83026', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1467, 'A1000012B81D3C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1468, 'A1000012B81E75', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1469, 'A1000012B81C9F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1470, 'A1000012B82071', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1471, 'A1000012B8250B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1472, 'A1000012B820E5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1473, 'A1000012B81E81', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1474, 'A1000012B81EB6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1475, 'A1000012B82079', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1476, 'A1000012B81C86', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1477, 'A1000012B7F7BE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1478, 'A1000012B7F7BB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1479, 'A1000012B7F796', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1480, 'A1000012B7F81F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1481, 'A1000012B7F7E9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1482, 'A1000012B7F7BA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1483, 'A1000012B7F7E5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1484, 'A1000012B7F7E0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1485, 'A1000012B7C891', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1486, 'A1000012B7C934', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1487, 'A1000012B7D071', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1488, 'A1000012B7D04C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1489, 'A1000012B7CF8F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1490, 'A1000012B7D052', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1491, 'A1000012B7D055', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1492, 'A1000012B7D05E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1493, 'A1000012B7D050', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1494, 'A1000012B7D09E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1495, 'A1000012B7CFB1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1496, 'A1000012B7D06E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1497, 'A1000012B7C9B3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1498, 'A1000012B7CA57', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1499, 'A1000012B7C9AE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1500, 'A1000012B7CA51', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1501, 'A1000012B7CA48', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1502, 'A1000012B7CA54', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1503, 'A1000012B7C96D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1504, 'A1000012B7CA2A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1505, 'A1000012B7CA21', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1506, 'A1000012B7CA39', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1507, 'A1000012B8226C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1508, 'A1000012B82277', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1509, 'A1000012B82296', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1510, 'A1000012B822A9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1511, 'A1000012B8223A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1512, 'A1000012B82287', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1513, 'A1000012B82280', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1514, 'A1000012B8229B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1515, 'A1000012B82293', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1516, 'A1000012B8228F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1517, 'A1000012B7D056', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1518, 'A1000012B7D044', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1519, 'A1000012B7D04B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1520, 'A1000012B7D004', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1521, 'A1000012B7CF90', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1522, 'A1000012B7D054', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1523, 'A1000012B7D05D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1524, 'A1000012B7CFB4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1525, 'A1000012B7D053', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1526, 'A1000012B7D048', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1527, 'A1000012B7D4D6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1528, 'A1000012B7D3CE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1529, 'A1000012B7D4D7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1530, 'A1000012B7D342', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1531, 'A1000012B7D4D5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1532, 'A1000012B7D395', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1533, 'A1000012B7D4D8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1534, 'A1000012B7D37B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1535, 'A1000012B7CE52', '04:00', '14:00', 25, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1536, 'A1000012B7CE79', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1537, 'A1000012B7B18C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1538, 'A1000012B7B276', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1539, 'A1000012B7B667', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1540, 'A1000012B7B701', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1541, 'A1000012B7B3AB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1542, 'A1000012B7B3B4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1543, 'A1000012B7B6B2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1544, 'A1000012B7B399', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1545, 'A1000012B7B72F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1546, 'A1000012B7B2F5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1547, 'A1000012B7D04F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1548, 'A1000012B7CFA1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1549, 'A1000012B7D072', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1550, 'A1000012B7D090', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1551, 'A1000012B7D06A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1552, 'A1000012B7CFB8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1553, 'A1000012B7CFBB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1554, 'A1000012B7D060', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1555, 'A1000012B7D068', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1556, 'A1000012B7D00B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1557, 'A1000012B82C74', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1558, 'A1000012B82D38', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1559, 'A1000012B82DC5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1560, 'A1000012B82D1B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1561, 'A1000012B82D5A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1562, 'A1000012B82DC9', '05:00', '14:00', 15, 1, null);
commit;
prompt 1201 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1563, 'A1000012B82BEF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1564, 'A1000012B82D1E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1565, 'A1000012B82C59', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1566, 'A1000012B82DCC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1567, 'A1000012B82BC1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1568, 'A1000012B82F95', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1569, 'A1000012B82C6D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1570, 'A1000012B82C64', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1571, 'A1000012B83025', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1572, 'A1000012B82CC6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1573, 'A1000012B82D19', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1574, 'A1000012B8302C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1575, 'A1000012B82CB6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1576, 'A1000012B82CA2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1577, 'A1000012B815CF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1578, 'A1000012B81643', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1579, 'A1000012B815FF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1580, 'A1000012B81631', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1581, 'A1000012B81612', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1582, 'A1000012B83184', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1583, 'A1000012B831A7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1584, 'A1000012B83112', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1585, 'A1000012B831AA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1586, 'A1000012B81610', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1587, 'A1000012B82997', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1588, 'A1000012B829A3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1589, 'A1000012B8287A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1590, 'A1000012B8293F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1591, 'A1000012B824CC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1592, 'A1000012B82819', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1593, 'A1000012B8294D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1594, 'A1000012B8288F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1595, 'A1000012B82945', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1596, 'A1000012B8295C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1597, 'A1000012B79D2D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1598, 'A1000012B7B552', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1599, 'A1000012B7B791', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1600, 'A1000012B75769', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1601, 'A1000012B76B2A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1602, 'A1000012B75DD4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1603, 'A1000012B75BBC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1604, 'A1000012B76B08', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1668, 'A1000012B754E0', '08:00', '19:00', 10, 0, '2');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (7, '23', '8:00', '18:00', 20, null, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (8, '24', '8:00', '18:00', 20, null, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (9, '25', '8:00', '18:00', 20, null, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (10, '26', '8:00', '18:00', 20, null, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (11, '27', '8:00', '18:00', 20, null, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (12, '28', '8:00', '18:00', 20, null, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (13, '29', '8:00', '18:00', 20, null, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (14, '30', '8:00', '18:00', 20, null, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (15, '31', '8:00', '18:00', 20, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (16, '32', '8:00', '18:00', 20, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (17, '211', '8:00', '18:00', 20, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (18, '221', '8:00', '18:00', 20, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (19, '231', '8:00', '18:00', 20, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (20, '241', '8:00', '18:00', 20, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (21, '251', '8:00', '18:00', 20, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (22, '261', '8:00', '18:00', 20, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (23, '271', '08:00', '18:00', 20, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (24, '281', '08:00', '18:00', 20, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1621, 'A1000012B74DB5', '8:00', '22:00', 1, 0, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1622, '1212', '08:00', '18:00', 10, 0, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (27, '311', '8:00', '18:00', 20, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1636, '00000000000000', '01:00', '21:00', 2, 0, '3');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (5, '21', '8:00', '18:00', 20, null, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (6, '22', '8:00', '18:00', 20, null, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1625, '3333333', '02:00', '10:00', 10, 0, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1612, 'A0000022889BAC', '08:00', '23:00', 3, 0, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1623, '22222', '8:00', '22:00', 1, 0, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1614, '012682002801653', '10:00', '10:10', 2, 0, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1624, '222222222', '8:00', '22:00', 1, 0, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1637, '00000000000000', '01:00', '21:00', 2, 0, '4');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1638, '00000000000000', '01:00', '21:00', 2, 0, '5');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1639, '00000000000000', '01:00', '21:00', 2, 0, '6');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1681, '12345678901233', '08:00', '21:00', 10, 0, '1');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1634, '00000000000000', '01:00', '21:00', 2, 0, '1');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1635, '00000000000000', '01:00', '21:00', 2, 0, '2');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1682, '12345678901233', '08:00', '21:00', 10, 0, '5');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1688, 'A1000012B74DA0', '07:00', '21:00', 2, 0, '2');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1684, '12345678901233', '08:00', '21:00', 10, 0, '3');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1685, '12345678901233', '08:00', '21:00', 10, 0, '4');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1689, 'A1000012B74DA0', '07:00', '21:00', 2, 0, '4');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1646, '11', '07:00', '13:00', 5, 0, '1');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1687, '12345678901233', '08:00', '21:00', 10, 0, '7');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1690, 'A1000012B74DA0', '07:00', '21:00', 2, 0, '5');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1691, 'A1000012B74DA0', '07:00', '21:00', 2, 0, '6');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1692, 'A0000020921F1C', '08:00', '21:00', 2, 0, '1');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1693, 'A0000020921F1C', '08:00', '21:00', 2, 0, '2');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1694, 'A0000020921F1C', '08:00', '21:00', 2, 0, '3');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1695, 'A0000020921F1C', '08:00', '21:00', 2, 0, '4');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1673, 'A0000020E682CB', '07:00', '21:00', 2, 0, '2');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1674, 'A0000020E682CB', '07:00', '21:00', 2, 0, '4');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1675, 'A0000020E682CB', '07:00', '21:00', 2, 0, '5');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1676, 'A0000020E682CB', '07:00', '21:00', 2, 0, '6');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1678, 'A1000012B11111', '08:00', '19:00', 10, 0, '1');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1679, 'A1000012B74DA0D', '08:00', '21:00', 2, 0, '1');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1680, 'A1000012B74DA0D', '08:00', '21:00', 2, 0, '5');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1696, 'A0000020921F1C', '08:00', '21:00', 2, 0, '5');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1697, 'A0000020921F1C', '08:00', '21:00', 2, 0, '6');
commit;
prompt 1301 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1698, 'A0000020921F1C', '08:00', '21:00', 2, 0, '7');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1699, '00000000000000', '01:00', '21:00', 2, 0, '7');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1616, 'A0000024DBEF1F', '14:30', '15:00', 2, 0, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1615, 'A00000177F5455', '08:00', '10:00', 100, 0, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1617, 'A0000022887B36', '12:00', '12:30', 5, 0, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1619, '1122', '05:00', '12:00', 30, 0, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1656, 'A1000012B74DA0', '07:00', '21:00', 2, 0, '1');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1658, 'A1000012B74DA0', '07:00', '21:00', 2, 0, '7');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1657, 'A1000012B74DA0', '07:00', '21:00', 2, 0, '3');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1659, 'A0000020E682CB', '07:00', '21:00', 2, 0, '1');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1660, 'A0000020E682CB', '07:00', '21:00', 2, 0, '3');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1661, 'A0000020E682CB', '07:00', '21:00', 2, 0, '7');
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (890, 'A1000012B7C455', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (891, 'A1000012B7C41F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (892, 'A1000012B7C329', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (893, 'A1000012B7C45B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (894, 'A1000012B7C452', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (895, 'A1000012B8225A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (896, 'A1000012B82259', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (897, 'A1000012B8224A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (898, 'A1000012B82235', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (899, 'A1000012B82221', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (900, 'A1000012B82216', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (901, 'A1000012B82234', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (902, 'A1000012B8220D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (903, 'A1000012B8221A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (904, 'A1000012B8223B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (905, 'A1000012B7D77A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (906, 'A1000012B7D76F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (907, 'A1000012B7D76B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (908, 'A1000012B7D763', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (909, 'A1000012B7D76E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (910, 'A1000012B7D76D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (911, 'A1000012B7D764', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (912, 'A1000012B7D767', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (913, 'A1000012B7D711', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (914, 'A1000012B7D6FC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (915, 'A1000012B7C32A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (916, 'A1000012B7C4A2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (917, 'A1000012B7C500', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (918, 'A1000012B7C326', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (919, 'A1000012B7C4B9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (920, 'A1000012B7BEF6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (921, 'A1000012B7C4E1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (922, 'A1000012B7C4DD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (923, 'A1000012B7C4EE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (924, 'A1000012B7C4AA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (925, 'A1000012B7F244', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (926, 'A1000012B7F247', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (927, 'A1000012B7F14E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (928, 'A1000012B7F254', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (929, 'A1000012B7F22C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (930, 'A1000012B7F246', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (931, 'A1000012B7F21D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (932, 'A1000012B7F12F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (933, 'A1000012B7F245', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (934, 'A1000012B7F24E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (935, 'A1000012B8205E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (936, 'A1000012B81FCF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (937, 'A1000012B820D0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (938, 'A1000012B8299D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (939, 'A1000012B81E74', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (940, 'A1000012B81F73', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (941, 'A1000012B82129', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (942, 'A1000012B82114', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (943, 'A1000012B81E87', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (944, 'A1000012B8297D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (945, 'A1000012B822A0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (946, 'A1000012B8229C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (947, 'A1000012B822A4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (948, 'A1000012B82247', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (949, 'A1000012B82299', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (950, 'A1000012B8229F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (951, 'A1000012B822A8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (952, 'A1000012B82239', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (953, 'A1000012B822A1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (954, 'A1000012B822AD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (955, 'A1000012B7D1D6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (956, 'A1000012B7D1EA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (957, 'A1000012B7D1E4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (958, 'A1000012B7D1F1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (959, 'A1000012B7D1EE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (960, 'A1000012B7D1F4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (961, 'A1000012B7D103', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (962, 'A1000012B7D0F5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (963, 'A1000012B7D0F6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (964, 'A1000012B7D1F0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (965, 'A1000012B83014', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (966, 'A1000012B83013', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (967, 'A1000012B82C9C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (968, 'A1000012B82C73', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (969, 'A1000012B82C9D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (970, 'A1000012B83006', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (971, 'A1000012B82CA3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (972, 'A1000012B82C94', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (973, 'A1000012B82C8D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (974, 'A1000012B82C7D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (975, 'A1000012B829A8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (976, 'A1000012B829BD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (977, 'A1000012B824F6', '05:00', '14:00', 15, 1, null);
commit;
prompt 1401 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (978, 'A1000012B82814', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (979, 'A1000012B829C8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (980, 'A1000012B829BF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (981, 'A1000012B8283C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (982, 'A1000012B82823', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (983, 'A1000012B829BA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (984, 'A1000012B827F8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (985, 'A1000012B7D39A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (986, 'A1000012B7D36B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (987, 'A1000012B7D353', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (988, 'A1000012B7D39D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (989, 'A1000012B7D355', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (990, 'A1000012B7D32B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (991, 'A1000012B7D37F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (992, 'A1000012B7D379', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (993, 'A1000012B7D354', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (994, 'A1000012B7D36F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (995, 'A1000012B82B7C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (996, 'A1000012B82B45', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (997, 'A1000012B82BA6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (998, 'A1000012B82B5B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (999, 'A1000012B82B2E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1000, 'A1000012B82B53', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1001, 'A1000012B82A9A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1002, 'A1000012B82B8A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1003, 'A1000012B82B4E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1004, 'A1000012B82B4B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1005, 'A1000012B829AF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1006, 'A1000012B829BB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1007, 'A1000012B825A6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1008, 'A1000012B8282A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1009, 'A1000012B82635', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1010, 'A1000012B829E2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1011, 'A1000012B7C42C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1012, 'A1000012B7C409', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1013, 'A1000012B7C40B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1014, 'A1000012B7C3DC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1015, 'A1000012B7C446', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1016, 'A1000012B7C34A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1017, 'A1000012B7C3F0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1018, 'A1000012B7C3DB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1019, 'A1000012B7C408', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1020, 'A1000012B7C42F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1021, 'A1000012B7C8C5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1022, 'A1000012B7C8CB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1023, 'A1000012B7C787', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1024, 'A1000012B7C789', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1025, 'A1000012B7C8B2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1026, 'A1000012B7C795', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1027, 'A1000012B7C94C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1028, 'A1000012B7C893', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1029, 'A1000012B7C93F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1030, 'A1000012B7C92C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1031, 'A1000012B7FEC1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1032, 'A1000012B82BF5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1033, 'A1000012B82C6C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1034, 'A1000012B82C5C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1035, 'A1000012B82F4C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1036, 'A1000012B82F4A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1037, 'A1000012B82F06', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1038, 'A1000012B82F1A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1039, 'A1000012B82F02', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1040, 'A1000012B82F33', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1041, 'A1000012B7D35C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1042, 'A1000012B7D359', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1043, 'A1000012B7D380', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1044, 'A1000012B7D39E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1045, 'A1000012B7D3D2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1046, 'A1000012B7D37A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1047, 'A1000012B7D385', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1048, 'A1000012B7D35D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1049, 'A1000012B7D37D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1050, 'A1000012B7E8E6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1051, 'A1000012B7EAA0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1052, 'A1000012B7EC7D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1053, 'A1000012B7E8DD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1054, 'A1000012B7E8E7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1055, 'A1000012B7ECFD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1056, 'A1000012B7ECEB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1057, 'A1000012B7E8DF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1058, 'A1000012B7ED21', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1059, 'A1000012B7EA5D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1060, 'A1000012B82C96', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1061, 'A1000012B82CF9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1062, 'A1000012B82BC8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1063, 'A1000012B82D27', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1064, 'A1000012B82C6A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1065, 'A1000012B82D74', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1066, 'A1000012B82DB5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1067, 'A1000012B82C87', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1068, 'A1000012B82D0B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1069, 'A1000012B82D5B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1070, 'A1000012B7CFB2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1071, 'A1000012B7CFAE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1072, 'A1000012B7D000', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1073, 'A1000012B7D001', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1074, 'A1000012B7D067', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1075, 'A1000012B7D05F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1076, 'A1000012B7CF98', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1077, 'A1000012B7D006', '05:00', '14:00', 15, 1, null);
commit;
prompt 1501 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1078, 'A1000012B7CFB9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1079, 'A1000012B7D065', '04:00', '14:00', 25, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1080, 'A1000012B83148', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1081, 'A1000012B831AD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1082, 'A1000012B830BB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1083, 'A1000012B830EA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1084, 'A1000012B815FA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1085, 'A1000012B8160D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1086, 'A1000012B82FFD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1087, 'A1000012B82F73', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1090, 'A1000012B7F714', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1088, 'A1000012B8163E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1089, 'A1000012B82FEA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1091, 'A1000012B7DDAF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1092, 'A1000012B7F80B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1093, 'A1000012B7F7DC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1094, 'A1000012B7F78D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1095, 'A1000012B7F7C0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1096, 'A1000012B7F6F2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1097, 'A1000012B7F7CC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1098, 'A1000012B7F782', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1099, 'A1000012B7F795', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1100, 'A1000012B7D35A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1101, 'A1000012B7D369', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1102, 'A1000012B7D365', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1103, 'A1000012B7D392', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1104, 'A1000012B7D322', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1105, 'A1000012B7D396', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1106, 'A1000012B7D2FF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1107, 'A1000012B7D393', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1108, 'A1000012B7D390', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1109, 'A1000012B82282', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1110, 'A1000012B82272', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1111, 'A1000012B8227E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1112, 'A1000012B82283', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1113, 'A1000012B821EF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1114, 'A1000012B82278', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1115, 'A1000012B82276', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1116, 'A1000012B8224B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1117, 'A1000012B82286', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1118, 'A1000012B82284', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1119, 'A1000012B75DA2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1120, 'A1000012B7673C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1121, 'A1000012B7B5E2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1122, 'A1000012B763FE', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1123, 'A1000012B75CD1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1124, 'A1000012B757FD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1125, 'A1000012B7B602', '04:00', '14:00', 25, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1126, 'A1000012B74E91', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1127, 'A1000012B753E7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1128, 'A1000012B75761', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1129, 'A1000012B7C34E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1130, 'A1000012B7C333', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1131, 'A1000012B7C2D4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1132, 'A1000012B7C350', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1133, 'A1000012B7C346', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1134, 'A1000012B7C338', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1135, 'A1000012B7C32F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1136, 'A1000012B7C1DF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1137, 'A1000012B7C340', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1138, 'A1000012B7C2C2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1139, 'A1000012B82990', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1140, 'A1000012B82510', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1141, 'A1000012B82988', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1142, 'A1000012B829A4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1143, 'A1000012B82927', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1144, 'A1000012B8296B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1145, 'A1000012B82961', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1146, 'A1000012B824F3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1147, 'A1000012B75D96', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1148, 'A1000012B8292A', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1149, 'A1000012B7B379', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1150, 'A1000012B7B95C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1151, 'A1000012B78DAF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1152, 'A1000012B7772C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1153, 'A1000012B78C05', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1154, 'A1000012B7A87F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1155, 'A1000012B757A5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1156, 'A1000012B7BDB6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1157, 'A1000012B82982', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1158, 'A1000012B7B38E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1159, 'A1000012B82F94', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1160, 'A1000012B82F9F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1161, 'A1000012B83027', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1162, 'A1000012B7F2AC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1163, 'A1000012B7F2A1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1164, 'A1000012B7F2D1', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1165, 'A1000012B7F283', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1166, 'A1000012B7F2E8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1167, 'A1000012B7F168', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1168, 'A1000012B7F2DC', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1169, 'A1000012B7F2D7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1170, 'A1000012B7F2D3', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1171, 'A1000012B7F234', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1172, 'A1000012B830F5', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1173, 'A1000012B82FF4', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1174, 'A1000012B831EF', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1175, 'A1000012B8324B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1176, 'A1000012B831E7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1177, 'A1000012B83247', '05:00', '14:00', 15, 1, null);
commit;
prompt 1601 records committed...
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1178, 'A1000012B83093', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1179, 'A1000012B83251', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1180, 'A1000012B83127', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1181, 'A1000012B823E8', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1182, 'A1000012B82992', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1183, 'A1000012B8299B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1184, 'A1000012B8296C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1185, 'A1000012B82926', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1186, 'A1000012B82C89', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1187, 'A1000012B82940', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1188, 'A1000012B8299C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1189, 'A1000012B82986', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1190, 'A1000012B8290B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1191, 'A1000012B824DB', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1192, 'A1000012B7D062', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1193, 'A1000012B7CFFD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1194, 'A1000012B7CFB7', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1195, 'A1000012B7CF9D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1196, 'A1000012B7D007', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1197, 'A1000012B7CF96', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1198, 'A1000012B7CFBD', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1199, 'A1000012B7CF9E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1200, 'A1000012B7CFA6', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1201, 'A1000012B7CFA2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1202, 'A1000012B83023', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1203, 'A1000012B82F22', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1204, 'A1000012B82F1D', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1205, 'A1000012B82F3C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1206, 'A1000012B82F21', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1207, 'A1000012B82F2E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1208, 'A1000012B82F3F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1209, 'A1000012B82F04', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1210, 'A1000012B82F93', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1211, 'A1000012B82F1B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1212, 'A1000012B7F82C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1213, 'A1000012B7F84F', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1214, 'A1000012B7F854', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1215, 'A1000012B7F85B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1216, 'A1000012B7F6D2', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1217, 'A1000012B7F817', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1218, 'A1000012B7F80C', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1219, 'A1000012B7F6D0', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1220, 'A1000012B7F85E', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1221, 'A1000012B7F823', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1222, 'A1000012B7B64B', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1223, 'A1000012B7B252', '04:00', '14:00', 25, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1224, 'A1000012B7B651', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1225, 'A1000012B7B2BA', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1226, 'A1000012B7B2C9', '05:00', '14:00', 15, 1, null);
insert into T_SJSB_SUB (ID, DEVICE_ID, BEGINTIME, ENDTIME, INTERVALTIME, FLAG, WEEKFLAG)
values (1227, 'A1000012B7B589', '05:00', '14:00', 15, 1, null);
commit;
prompt 1650 records loaded
prompt Loading T_SPCJ...
insert into T_SPCJ (ID, DESCRIPTION, VIDEONAME, CREATETIME, DEVICE_ID, LENGTH)
values (202, '����android �ն˵���Ƶ', 'video_1308114367659.3gp', to_date('15-06-2011 13:05:45', 'dd-mm-yyyy hh24:mi:ss'), 'A1000012B74DA0D', '46.92K');
insert into T_SPCJ (ID, DESCRIPTION, VIDEONAME, CREATETIME, DEVICE_ID, LENGTH)
values (221, '����android �ն˵���Ƶ', 'video_1308555686529.3gp', to_date('20-06-2011 15:41:25', 'dd-mm-yyyy hh24:mi:ss'), 'A1000012B74DA0D', '146.943K');
insert into T_SPCJ (ID, DESCRIPTION, VIDEONAME, CREATETIME, DEVICE_ID, LENGTH)
values (282, '����android �ն˵���Ƶ', 'video_1309849492352.3gp', to_date('05-07-2011 15:05:09', 'dd-mm-yyyy hh24:mi:ss'), 'A0000024DBEF1F', '25.62K');
insert into T_SPCJ (ID, DESCRIPTION, VIDEONAME, CREATETIME, DEVICE_ID, LENGTH)
values (201, '����android �ն˵���Ƶ', 'video_1308106765753.3gp', to_date('15-06-2011 10:59:05', 'dd-mm-yyyy hh24:mi:ss'), 'A1000012B74DA0D', '46.139K');
insert into T_SPCJ (ID, DESCRIPTION, VIDEONAME, CREATETIME, DEVICE_ID, LENGTH)
values (203, '����android �ն˵���Ƶ', 'video_1308115281450.3gp', to_date('15-06-2011 13:20:56', 'dd-mm-yyyy hh24:mi:ss'), 'A1000012B74DA0D', '30.897K');
insert into T_SPCJ (ID, DESCRIPTION, VIDEONAME, CREATETIME, DEVICE_ID, LENGTH)
values (241, '����android �ն˵���Ƶ', 'video_1308739154626.3gp', to_date('22-06-2011 18:39:25', 'dd-mm-yyyy hh24:mi:ss'), 'A1000012B74DA0D', '80.842K');
insert into T_SPCJ (ID, DESCRIPTION, VIDEONAME, CREATETIME, DEVICE_ID, LENGTH)
values (321, '����android �ն˵���Ƶ', 'video_1311660502293.3gp', to_date('26-07-2011 14:08:27', 'dd-mm-yyyy hh24:mi:ss'), '866153000355768', '91.273K');
commit;
prompt 7 records loaded
set feedback on
set define on
prompt Done.

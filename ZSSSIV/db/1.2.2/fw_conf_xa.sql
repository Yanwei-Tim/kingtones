prompt PL/SQL Developer import file
prompt Created on 2011年11月21日 星期一 by Administrator
set feedback off
set define off
prompt Creating BUSINESS_CONFIG...
create table BUSINESS_CONFIG
(
  B_ID           VARCHAR2(50) not null,
  B_NAME         VARCHAR2(50) not null,
  B_TYPE         VARCHAR2(1) not null,
  IMG_NAME       VARCHAR2(30),
  L_SIMPLE_ITEMS VARCHAR2(100),
  D_SIMPLE_ITEMS VARCHAR2(1000),
  D_SQL          VARCHAR2(1000),
  FATHER_ID      VARCHAR2(50) not null,
  FINAL_NODE     VARCHAR2(1) default '1' not null,
  EDIT_RES_DATE  VARCHAR2(14) not null,
  L_SQL          VARCHAR2(1000),
  B_ORDERS       NUMBER,
  DS             VARCHAR2(100),
  VALIDATE_RES   VARCHAR2(1000),
  VALIDATE_DES   VARCHAR2(1000),
  SHORTCUT       NUMBER default 0
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on table BUSINESS_CONFIG
  is '顶级节点0  到 九宫格菜单 到子菜单 到 增/查 页面  都作为业务注册在此表中；
（查询业务 =  查询页面 -结果list页面- 查看详细页面） 整体为一个业务';
alter table BUSINESS_CONFIG
  add constraint B_ID_KEY primary key (B_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating BUSINESS_RELATED...
create table BUSINESS_RELATED
(
  B_ID     VARCHAR2(50),
  R_ID     VARCHAR2(50),
  R_COLUMN VARCHAR2(50),
  R_TYPE   VARCHAR2(1)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on table BUSINESS_RELATED
  is '详细页面 关联项 -- 有两种选择：
1、关联list -查看detail
2、关联detail';
comment on column BUSINESS_RELATED.B_ID
  is '业务标记';
comment on column BUSINESS_RELATED.R_ID
  is '关联业务标记';
comment on column BUSINESS_RELATED.R_COLUMN
  is '关联字段（客户字段）';
comment on column BUSINESS_RELATED.R_TYPE
  is '关联到详细，还是列表(0：详细信息；1、列表信息)';

prompt Creating BUSINESS_RES_CONFIG...
create table BUSINESS_RES_CONFIG
(
  W_ID          NUMBER not null,
  B_ID          VARCHAR2(50) not null,
  NAME          VARCHAR2(50) not null,
  TYPE          VARCHAR2(30) not null,
  RES_ID        VARCHAR2(30),
  VISIBLE       NUMBER not null,
  VALIDATE_TYPE VARCHAR2(2),
  VALIDATE_DES  VARCHAR2(255),
  CODE          VARCHAR2(30) not null,
  DATATYPE      VARCHAR2(50),
  ISBENULL      NUMBER not null,
  ORDERS        NUMBER not null,
  TABGROUP      NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on table BUSINESS_RES_CONFIG
  is '根据业务ID判断 要展现的数据项 （针对查询、录入业务）
';
comment on column BUSINESS_RES_CONFIG.W_ID
  is '组件标记(复合主键)';
comment on column BUSINESS_RES_CONFIG.B_ID
  is '业务标记，用于服务器端进行业务处理的标示(复合主键)';
comment on column BUSINESS_RES_CONFIG.NAME
  is '组件标题，组件说明';
comment on column BUSINESS_RES_CONFIG.TYPE
  is '组件类型  详见《组件说明》';
comment on column BUSINESS_RES_CONFIG.RES_ID
  is '组件数据来源';
comment on column BUSINESS_RES_CONFIG.VISIBLE
  is '组件是否显示，0表示显示，1表示不显示';
comment on column BUSINESS_RES_CONFIG.VALIDATE_TYPE
  is '验证类型';
comment on column BUSINESS_RES_CONFIG.VALIDATE_DES
  is '验证失败后的验证说明';
comment on column BUSINESS_RES_CONFIG.CODE
  is '系统字段';
comment on column BUSINESS_RES_CONFIG.DATATYPE
  is '用于验证数据类型;*后面数字为类型的大小 ';
comment on column BUSINESS_RES_CONFIG.ISBENULL
  is '是否可以为空;默认0可以为空;1不能为空';
comment on column BUSINESS_RES_CONFIG.ORDERS
  is '用于排序显示字段顺序';
comment on column BUSINESS_RES_CONFIG.TABGROUP
  is '选项卡(0为无选项卡)';
alter table BUSINESS_RES_CONFIG
  add constraint W_ID_KEY primary key (W_ID, B_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index B_ID_IND on BUSINESS_RES_CONFIG (B_ID)
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating COLUMN_MAP...
create table COLUMN_MAP
(
  COLUMNS    VARCHAR2(20) not null,
  B_ID       VARCHAR2(50) not null,
  CNAME      VARCHAR2(30) not null,
  TABLE_NAME VARCHAR2(30),
  C_COLUMN   VARCHAR2(500),
  CNAME_TYPE VARCHAR2(30),
  IS_RES     VARCHAR2(1),
  RES_ID     VARCHAR2(20),
  OP         VARCHAR2(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on table COLUMN_MAP
  is '字段映射表';
comment on column COLUMN_MAP.COLUMNS
  is '系统字段(复合主键)';
comment on column COLUMN_MAP.B_ID
  is '业务标记(复合主键)';
comment on column COLUMN_MAP.CNAME
  is '系统字段名称';
comment on column COLUMN_MAP.TABLE_NAME
  is '否	相对应客户表的表名';
comment on column COLUMN_MAP.C_COLUMN
  is '对应客户字段';
comment on column COLUMN_MAP.CNAME_TYPE
  is '关联字段数据类型';
comment on column COLUMN_MAP.IS_RES
  is '是否有资源';
comment on column COLUMN_MAP.RES_ID
  is '资源分类ID';
comment on column COLUMN_MAP.OP
  is '符号';
alter table COLUMN_MAP
  add constraint COLUMN_KEY primary key (COLUMNS, B_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating IMG_INFO...
create table IMG_INFO
(
  IMG_NAME VARCHAR2(30) not null,
  IMG_PATH VARCHAR2(255) not null,
  IMG_DES  VARCHAR2(255) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on table IMG_INFO
  is '图片信息表';
comment on column IMG_INFO.IMG_NAME
  is '图片名称(不含后缀) (主键)';
comment on column IMG_INFO.IMG_PATH
  is '图片路径（使用与后台管理系统）';
comment on column IMG_INFO.IMG_DES
  is '图片说明';
alter table IMG_INFO
  add constraint IMG_NAME_KEY primary key (IMG_NAME)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating JW_ADDRESS...
create table JW_ADDRESS
(
  ADDID     NUMBER not null,
  NAME      VARCHAR2(10),
  DEPTID    NUMBER,
  MOBILE    VARCHAR2(20),
  UNITTEL   VARCHAR2(20),
  HOMETEL   VARCHAR2(20),
  REMARK    VARCHAR2(100),
  DUTY      VARCHAR2(60),
  SORT      NUMBER,
  MOBILE2   VARCHAR2(20),
  UNITTEL2  VARCHAR2(20),
  DEPTNAMES VARCHAR2(200),
  EMAIL     VARCHAR2(60)
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
comment on column JW_ADDRESS.ADDID
  is '通讯录编号';
comment on column JW_ADDRESS.NAME
  is '人员姓名';
comment on column JW_ADDRESS.DEPTID
  is '所在单位编号';
comment on column JW_ADDRESS.MOBILE
  is '手机';
comment on column JW_ADDRESS.UNITTEL
  is '单位电话';
comment on column JW_ADDRESS.HOMETEL
  is '家庭电话';
comment on column JW_ADDRESS.REMARK
  is '备注';
comment on column JW_ADDRESS.DUTY
  is '职务';
comment on column JW_ADDRESS.SORT
  is '排序号';
comment on column JW_ADDRESS.MOBILE2
  is '手机号2';
comment on column JW_ADDRESS.UNITTEL2
  is '单位电话2';
comment on column JW_ADDRESS.DEPTNAMES
  is '机构名称';
comment on column JW_ADDRESS.EMAIL
  is '邮件';

prompt Creating JW_FILE_INFO...
create table JW_FILE_INFO
(
  FILENAME   VARCHAR2(100) not null,
  USERNAME   VARCHAR2(50),
  UPLOADDATE DATE
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
comment on column JW_FILE_INFO.FILENAME
  is '文件名称';
comment on column JW_FILE_INFO.USERNAME
  is '上传用户';
comment on column JW_FILE_INFO.UPLOADDATE
  is '上传时间';
alter table JW_FILE_INFO
  add constraint PK_FILENAME primary key (FILENAME)
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

prompt Creating JW_GPS_CONFIG...
create table JW_GPS_CONFIG
(
  USERID   VARCHAR2(32),
  STATE    NUMBER default 1,
  INTERVAL NUMBER default 5
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
comment on table JW_GPS_CONFIG
  is 'gps策略配置';
comment on column JW_GPS_CONFIG.USERID
  is '用户名';
comment on column JW_GPS_CONFIG.STATE
  is '开关0=关闭，1=开启';
comment on column JW_GPS_CONFIG.INTERVAL
  is 'gps上报时间间隔单位（秒）';

prompt Creating JW_GPS_DATA...
create table JW_GPS_DATA
(
  DEVICEID  VARCHAR2(16),
  X         VARCHAR2(32),
  Y         VARCHAR2(32),
  DATETIME  DATE default sysdate,
  SPEED     VARCHAR2(32),
  DIRECTION VARCHAR2(32),
  IMSI      VARCHAR2(16),
  USERID    VARCHAR2(32)
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
comment on table JW_GPS_DATA
  is 'gps数据';
comment on column JW_GPS_DATA.DEVICEID
  is '设备串号';
comment on column JW_GPS_DATA.X
  is '维度';
comment on column JW_GPS_DATA.Y
  is '精度';
comment on column JW_GPS_DATA.DATETIME
  is '时间';
comment on column JW_GPS_DATA.SPEED
  is '速度';
comment on column JW_GPS_DATA.DIRECTION
  is '方向';
comment on column JW_GPS_DATA.IMSI
  is 'imsi码';
comment on column JW_GPS_DATA.USERID
  is '用户ID';

prompt Creating JW_JZ...
create table JW_JZ
(
  ID          VARCHAR2(50) not null,
  NAME        VARCHAR2(50) not null,
  DESCRIPTION VARCHAR2(1024) not null
)
tablespace XASGAJ
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column JW_JZ.ID
  is '警种编号';
comment on column JW_JZ.NAME
  is '警种名称';
comment on column JW_JZ.DESCRIPTION
  is '警种描述';

prompt Creating JW_LAW...
create table JW_LAW
(
  LAW_ID             NUMBER not null,
  LAW_CODE           VARCHAR2(50),
  LAW_NAME           VARCHAR2(50),
  ADMINISTRATION     VARCHAR2(200),
  IRREGULARITYACTION VARCHAR2(200),
  LAW_TYPE           CHAR(4)
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
comment on column JW_LAW.LAW_ID
  is '法规ID';
comment on column JW_LAW.LAW_CODE
  is '法规代码';
comment on column JW_LAW.LAW_NAME
  is '法规名称';
comment on column JW_LAW.ADMINISTRATION
  is '颁布事件';
comment on column JW_LAW.IRREGULARITYACTION
  is '法规内容';
comment on column JW_LAW.LAW_TYPE
  is '法规类型';

prompt Creating JW_LOG...
create table JW_LOG
(
  ID          VARCHAR2(50) not null,
  USER_ID     VARCHAR2(50),
  BIZ_ID      VARCHAR2(50),
  OP_STATUS   VARCHAR2(50),
  OP_TIME     TIMESTAMP(6),
  DESCRIPTION VARCHAR2(50),
  DAYS        NUMBER
)
tablespace XASGAJ
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column JW_LOG.ID
  is '日志ID';
comment on column JW_LOG.USER_ID
  is '用户账号';
comment on column JW_LOG.BIZ_ID
  is '业务ID';
comment on column JW_LOG.OP_STATUS
  is '操作状态';
comment on column JW_LOG.OP_TIME
  is '操作时间';
comment on column JW_LOG.DESCRIPTION
  is '备注';
comment on column JW_LOG.DAYS
  is '操作天数';
alter table JW_LOG
  add primary key (ID)
  using index 
  tablespace XASGAJ
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating JW_M_ROLE_BIZ...
create table JW_M_ROLE_BIZ
(
  ROLE_ID VARCHAR2(50) not null,
  BIZ_ID  VARCHAR2(50) not null
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

prompt Creating JW_M_ROLE_RES...
create table JW_M_ROLE_RES
(
  ROLE_ID VARCHAR2(50) not null,
  RES_ID  VARCHAR2(50) not null,
  BIZ_ID  VARCHAR2(50) not null
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

prompt Creating JW_ROLE...
create table JW_ROLE
(
  ROLE_ID     VARCHAR2(50) not null,
  ROLE_NAME   VARCHAR2(50) not null,
  ROLE_DESC   VARCHAR2(200),
  CHANGE_DATE VARCHAR2(30) not null
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

prompt Creating JW_SPCJ...
create table JW_SPCJ
(
  ID          NUMBER not null,
  DESCRIPTION VARCHAR2(500),
  VIDEONAME   VARCHAR2(50) not null,
  CREATETIME  DATE not null,
  DEVICE_ID   VARCHAR2(30) not null,
  LENGTH      VARCHAR2(10)
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
comment on table JW_SPCJ
  is '视频采集';
comment on column JW_SPCJ.ID
  is '主键ID';
comment on column JW_SPCJ.DESCRIPTION
  is '消息内容';
comment on column JW_SPCJ.VIDEONAME
  is '视频名称';
comment on column JW_SPCJ.CREATETIME
  is '创建时间';
comment on column JW_SPCJ.DEVICE_ID
  is '手机串号';
comment on column JW_SPCJ.LENGTH
  is '长度';
alter table JW_SPCJ
  add constraint PK_T_SPCJ primary key (ID)
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

prompt Creating JW_TPCJ...
create table JW_TPCJ
(
  ID           NUMBER not null,
  DESCRIPTION  VARCHAR2(500),
  PICTURENAME  VARCHAR2(50) not null,
  CREATEUSERID NUMBER,
  CREATETIME   DATE,
  DEVICE_ID    VARCHAR2(30)
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
comment on table JW_TPCJ
  is '图片采集';
comment on column JW_TPCJ.ID
  is '主键ID';
comment on column JW_TPCJ.DESCRIPTION
  is '消息内容';
comment on column JW_TPCJ.PICTURENAME
  is '图片名称';
comment on column JW_TPCJ.CREATEUSERID
  is '创建人';
comment on column JW_TPCJ.CREATETIME
  is '创建时间';
comment on column JW_TPCJ.DEVICE_ID
  is '创建者的手机串号';
alter table JW_TPCJ
  add constraint PK_T_TPCJ primary key (ID)
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

prompt Creating JW_TZTG...
create table JW_TZTG
(
  ID             NUMBER not null,
  TITLE          VARCHAR2(100) not null,
  TYPE           VARCHAR2(10) not null,
  CONTENT        VARCHAR2(2000) not null,
  SENDUSERID     VARCHAR2(50),
  SENDTIME       DATE,
  SENDSTATUS     VARCHAR2(50) default 0 not null,
  SENDDEPTID     VARCHAR2(50),
  UPLOADFILENAME VARCHAR2(4000),
  REQDEVICE_ID   VARCHAR2(2000),
  REQUSERNAME    VARCHAR2(2000),
  REQDEPTID      VARCHAR2(2000),
  REQDEPTNAME    VARCHAR2(2000),
  SENDUSERNAME   VARCHAR2(100),
  SENDDEPTNAME   VARCHAR2(100)
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
comment on table JW_TZTG
  is '通知通报管理主表';
comment on column JW_TZTG.ID
  is '主键ID';
comment on column JW_TZTG.TITLE
  is '消息标题';
comment on column JW_TZTG.TYPE
  is '消息类型（协查通报=1，通知通告=2，会议通知=3）';
comment on column JW_TZTG.CONTENT
  is '消息具体内容';
comment on column JW_TZTG.SENDUSERID
  is '发送人（登录用户名ID）';
comment on column JW_TZTG.SENDTIME
  is '发送时间是系统默认时间';
comment on column JW_TZTG.SENDSTATUS
  is '发送状态。0=未发送,1=已发送';
comment on column JW_TZTG.SENDDEPTID
  is '发送单位（登录用户所属单元ID）';
comment on column JW_TZTG.UPLOADFILENAME
  is '上传文件的名字';
comment on column JW_TZTG.REQDEVICE_ID
  is '接收方手机串码字符集';
comment on column JW_TZTG.REQUSERNAME
  is '接收方姓名字符集';
comment on column JW_TZTG.REQDEPTID
  is '接收方单位行政区划字符集';
comment on column JW_TZTG.REQDEPTNAME
  is '接收方单位名称字符集';
comment on column JW_TZTG.SENDUSERNAME
  is '发送用户姓名';
comment on column JW_TZTG.SENDDEPTNAME
  is '发送用户单位';
alter table JW_TZTG
  add constraint PK_T_TZTG primary key (ID)
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

prompt Creating JW_TZTGUSER...
create table JW_TZTGUSER
(
  ID          NUMBER not null,
  READSTATUS  NUMBER default 0,
  NOTICEID    NUMBER not null,
  DEVICE_ID   VARCHAR2(30),
  RECEIVETIME DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 448K
    minextents 1
    maxextents unlimited
  );
comment on table JW_TZTGUSER
  is '通知通报管理子表';
comment on column JW_TZTGUSER.ID
  is '主键ID';
comment on column JW_TZTGUSER.READSTATUS
  is '是否已阅状态0=未阅读;1=已阅读';
comment on column JW_TZTGUSER.NOTICEID
  is 'NOTICE外键';
comment on column JW_TZTGUSER.DEVICE_ID
  is '手机串号';
comment on column JW_TZTGUSER.RECEIVETIME
  is '签收时间';
alter table JW_TZTGUSER
  add constraint PK_T_TZTGUSER primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 320K
    minextents 1
    maxextents unlimited
  );

prompt Creating JW_UPDATE...
create table JW_UPDATE
(
  ID          VARCHAR2(50) not null,
  NAME        VARCHAR2(50) not null,
  NAME_COPY   VARCHAR2(50) not null,
  TIME        DATE not null,
  DESCRIPTION VARCHAR2(200) not null,
  VERSION     VARCHAR2(200),
  STATE       VARCHAR2(10)
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
comment on column JW_UPDATE.ID
  is '主键ID';
comment on column JW_UPDATE.NAME
  is '本地文件名';
comment on column JW_UPDATE.NAME_COPY
  is '更新后的文件名';
comment on column JW_UPDATE.TIME
  is '更新时间';
comment on column JW_UPDATE.DESCRIPTION
  is '备注';
comment on column JW_UPDATE.VERSION
  is '版本号';
comment on column JW_UPDATE.STATE
  is '是否置为当前版本';
alter table JW_UPDATE
  add primary key (ID)
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

prompt Creating JW_USER...
create table JW_USER
(
  ID          VARCHAR2(50) not null,
  NAME        VARCHAR2(50) not null,
  PSW         VARCHAR2(50) not null,
  SJHM        VARCHAR2(100) not null,
  SJCM        VARCHAR2(100) not null,
  JMKH        VARCHAR2(100) not null,
  JZ          VARCHAR2(100) not null,
  XZQH        VARCHAR2(50) not null,
  ACCOUNT     VARCHAR2(50) not null,
  XB          VARCHAR2(50) not null,
  DESCRIPTION VARCHAR2(300),
  JW_ROLE_ID  VARCHAR2(50),
  LOADTIME    DATE,
  ISLOCKED    VARCHAR2(1)
)
tablespace XASGAJ
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column JW_USER.ID
  is '主键ID';
comment on column JW_USER.NAME
  is '用户名(中文)';
comment on column JW_USER.PSW
  is '密码';
comment on column JW_USER.SJHM
  is '手机号码';
comment on column JW_USER.SJCM
  is '手机串号';
comment on column JW_USER.JMKH
  is '加密卡号';
comment on column JW_USER.JZ
  is '警种';
comment on column JW_USER.XZQH
  is '行政区划';
comment on column JW_USER.ACCOUNT
  is '登录账户';
comment on column JW_USER.XB
  is '性别';
comment on column JW_USER.DESCRIPTION
  is '描述信息';
comment on column JW_USER.JW_ROLE_ID
  is '警务角色id';
comment on column JW_USER.LOADTIME
  is '是否在线';
comment on column JW_USER.ISLOCKED
  is '是否锁定';

prompt Creating SYSTEM_MAP...
create table SYSTEM_MAP
(
  KEY   VARCHAR2(50) not null,
  VALUE VARCHAR2(50) not null,
  TYPE  VARCHAR2(30) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on column SYSTEM_MAP.KEY
  is '类型标示';
comment on column SYSTEM_MAP.VALUE
  is '类型说明';
comment on column SYSTEM_MAP.TYPE
  is '所属类别';

prompt Creating SYSTEM_RES_CONFIG...
create table SYSTEM_RES_CONFIG
(
  RES_ID      VARCHAR2(50) not null,
  RES_NAME    VARCHAR2(30) not null,
  SOURCE      VARCHAR2(400) not null,
  CHANGE_DATE VARCHAR2(30) not null,
  DS          VARCHAR2(100)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on table SYSTEM_RES_CONFIG
  is '系统资源配置表';
comment on column SYSTEM_RES_CONFIG.RES_ID
  is '资源分类标识(主键)';
comment on column SYSTEM_RES_CONFIG.RES_NAME
  is '资源分类名称';
comment on column SYSTEM_RES_CONFIG.SOURCE
  is '系统的数据来源，可以写sql';
comment on column SYSTEM_RES_CONFIG.CHANGE_DATE
  is '更新日期';
alter table SYSTEM_RES_CONFIG
  add constraint RES_ID_KEY primary key (RES_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating TAB_INFO...
create table TAB_INFO
(
  TAB_ID   NUMBER not null,
  B_ID     VARCHAR2(50) not null,
  TAB_NAME VARCHAR2(30) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on table TAB_INFO
  is '选项卡信息表';
comment on column TAB_INFO.TAB_ID
  is '选项卡标识(复合主键)';
comment on column TAB_INFO.B_ID
  is '业务标记 (复合主键)';
comment on column TAB_INFO.TAB_NAME
  is '选项卡名称';
alter table TAB_INFO
  add constraint B_TAB_KEY primary key (TAB_ID, B_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for BUSINESS_CONFIG...
alter table BUSINESS_CONFIG disable all triggers;
prompt Disabling triggers for BUSINESS_RELATED...
alter table BUSINESS_RELATED disable all triggers;
prompt Disabling triggers for BUSINESS_RES_CONFIG...
alter table BUSINESS_RES_CONFIG disable all triggers;
prompt Disabling triggers for COLUMN_MAP...
alter table COLUMN_MAP disable all triggers;
prompt Disabling triggers for IMG_INFO...
alter table IMG_INFO disable all triggers;
prompt Disabling triggers for JW_ADDRESS...
alter table JW_ADDRESS disable all triggers;
prompt Disabling triggers for JW_FILE_INFO...
alter table JW_FILE_INFO disable all triggers;
prompt Disabling triggers for JW_GPS_CONFIG...
alter table JW_GPS_CONFIG disable all triggers;
prompt Disabling triggers for JW_GPS_DATA...
alter table JW_GPS_DATA disable all triggers;
prompt Disabling triggers for JW_JZ...
alter table JW_JZ disable all triggers;
prompt Disabling triggers for JW_LAW...
alter table JW_LAW disable all triggers;
prompt Disabling triggers for JW_LOG...
alter table JW_LOG disable all triggers;
prompt Disabling triggers for JW_M_ROLE_BIZ...
alter table JW_M_ROLE_BIZ disable all triggers;
prompt Disabling triggers for JW_M_ROLE_RES...
alter table JW_M_ROLE_RES disable all triggers;
prompt Disabling triggers for JW_ROLE...
alter table JW_ROLE disable all triggers;
prompt Disabling triggers for JW_SPCJ...
alter table JW_SPCJ disable all triggers;
prompt Disabling triggers for JW_TPCJ...
alter table JW_TPCJ disable all triggers;
prompt Disabling triggers for JW_TZTG...
alter table JW_TZTG disable all triggers;
prompt Disabling triggers for JW_TZTGUSER...
alter table JW_TZTGUSER disable all triggers;
prompt Disabling triggers for JW_UPDATE...
alter table JW_UPDATE disable all triggers;
prompt Disabling triggers for JW_USER...
alter table JW_USER disable all triggers;
prompt Disabling triggers for SYSTEM_MAP...
alter table SYSTEM_MAP disable all triggers;
prompt Disabling triggers for SYSTEM_RES_CONFIG...
alter table SYSTEM_RES_CONFIG disable all triggers;
prompt Disabling triggers for TAB_INFO...
alter table TAB_INFO disable all triggers;
prompt Deleting TAB_INFO...
delete from TAB_INFO;
commit;
prompt Deleting SYSTEM_RES_CONFIG...
delete from SYSTEM_RES_CONFIG;
commit;
prompt Deleting SYSTEM_MAP...
delete from SYSTEM_MAP;
commit;
prompt Deleting JW_USER...
delete from JW_USER;
commit;
prompt Deleting JW_UPDATE...
delete from JW_UPDATE;
commit;
prompt Deleting JW_TZTGUSER...
delete from JW_TZTGUSER;
commit;
prompt Deleting JW_TZTG...
delete from JW_TZTG;
commit;
prompt Deleting JW_TPCJ...
delete from JW_TPCJ;
commit;
prompt Deleting JW_SPCJ...
delete from JW_SPCJ;
commit;
prompt Deleting JW_ROLE...
delete from JW_ROLE;
commit;
prompt Deleting JW_M_ROLE_RES...
delete from JW_M_ROLE_RES;
commit;
prompt Deleting JW_M_ROLE_BIZ...
delete from JW_M_ROLE_BIZ;
commit;
prompt Deleting JW_LOG...
delete from JW_LOG;
commit;
prompt Deleting JW_LAW...
delete from JW_LAW;
commit;
prompt Deleting JW_JZ...
delete from JW_JZ;
commit;
prompt Deleting JW_GPS_DATA...
delete from JW_GPS_DATA;
commit;
prompt Deleting JW_GPS_CONFIG...
delete from JW_GPS_CONFIG;
commit;
prompt Deleting JW_FILE_INFO...
delete from JW_FILE_INFO;
commit;
prompt Deleting JW_ADDRESS...
delete from JW_ADDRESS;
commit;
prompt Deleting IMG_INFO...
delete from IMG_INFO;
commit;
prompt Deleting COLUMN_MAP...
delete from COLUMN_MAP;
commit;
prompt Deleting BUSINESS_RES_CONFIG...
delete from BUSINESS_RES_CONFIG;
commit;
prompt Deleting BUSINESS_RELATED...
delete from BUSINESS_RELATED;
commit;
prompt Deleting BUSINESS_CONFIG...
delete from BUSINESS_CONFIG;
commit;
prompt Loading BUSINESS_CONFIG...
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100000', '西安警务通', '1', null, null, null, null, '0', '0', '20111118094328', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100001', '综合查询', '1', 'zhcx', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100002', '交通管理', '1', 'jtgl', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100003', '社区警务', '1', 'sqjw', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100004', '治安管理', '1', 'zagl', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100005', '盘查', '1', 'pc', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100006', '移动办公', '1', 'ydbg', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100007', '指挥调度', '1', 'zhdd', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100008', '系统设置', '1', 'xtsz1', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100010', '人口信息', '1', 'rkxx', null, null, null, 'B201100001', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100011', '案件信息', '1', 'ajxx', null, null, null, 'B201100001', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100012', '物品查询', '1', 'wpcx', null, null, null, 'B201100001', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100013', '机构查询', '1', 'jgcx', null, null, null, 'B201100001', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100014', '单位信息', '1', 'dwxx', null, null, null, 'B201100001', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100015', '常住人口', '2', 'aa', 'XM,XB,GMSFHM,CSRQ', 'RYBH,RYZZBH,GMSFHM,JWSFZH,XM,XMPY,CYM,ZJZL,ZJHM,BMCH,XB,MZ,CSRQ,CSSJ,CSDQ,CSQX,CSXZ,JHRYSFZH,JHRYXM,JHGXY,JHRESFZH,JHREXM,JHGXE,FQSFZH,FQXM,MQSFZH,MQXM,POSFZH,POXM,JGDQ,JGQX,JGXZ,YXQX,ZJXY,ZZMM,WHCD,HYZK,BYZK,SG,XX,LXDH,BZ,HH,HKLB,TSHK,YHZGX', 'select @ from xasgaj.RY_JBXX t where 1=1 #GMSFHM# #RYBH#', 'B201100010', '1', '20111017102132', 'select @ from xasgaj.RY_JBXX t where 1=1 #CSRQ# #XB# #GMSFHM# #XM# #NLD#', 1, 'bizDS', null, null, 1);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100016', '暂住人口', '2', 'aa', 'XM,XB,GMSFHM,CSRQ', 'RYBH,ZZRY_BDBH,ZZRY_ZZBH,ZZRY_QTZZBH,ZZZBH,GMSFHM,XM,ZZRY_CYM,XB,ZZRY_MZ,CSRQ,ZZRY_WHCD,ZZRY_ZZMM,ZZRY_HYZK,ZZRY_HJDQH,ZZRY_HJXZ,ZZRY_ZRQ,ZZRY_DDSJ,ZZRY_ZZSY,ZZRY_YZY,ZZRY_YZYLB,ZZRY_XZY,ZZRY_ZYLB,ZZRY_ZZCS,ZZRY_FWCS,ZZRY_JYZM,ZZRY_GZDZAZRRXM,ZZRY_FZRGDDH,ZZRY_FZRYDDH,ZZRY_JZZBL,ZZRY_QFRQ,ZZRY_YXQX,ZZRY_ZZZYXJZSJ,ZZRY_DJDW,ZZRY_DJR,ZZRY_DJSJ', 'select @ from xasgaj.RY_JBXX c,xasgaj.RY_ZKBD z where 1=1 #GMSFHM#', 'B201100010', '1', '20111102144429', 'select @ from xasgaj.RY_JBXX c,xasgaj.RY_ZKBD z where  1=1 and z.zzry_rybh=c.rybh   #ZZRY_GMSFHM# #ZZRY_XM# #ZZRY_XB# #ZZRY_CSRQ# #NLD#', 2, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100017', '驾驶员', '2', ' jsy', 'XM,XB,CSRQ,SFZMHM', 'ZT,CCLZRQ,YXQZ,YXQS,JZQX,ZJCX,FZRQ,LXZSXXDZ,LXZSXZQH,LXDH,CSRQ,XB,XM,SFZMHM,SFZMMC,BZCS,FZJG,LJJF,WFCS,SYRQ,CFRQ,SGCS', 'select @ from driver_bak t where 1=1 #SFZMHM# ', 'B201100010', '1', '20111027163257', 'select @ from driver_bak t where 1=1 #ZJCX# #SFZMHM# #XM#', 1, 'confDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100018', '人员住宿信息', '2', 'ryzsxx', 'NAME,NOHOTEL,IDCODE,BDATE', 'CCODE,XM,NAMEPY,XB,CSRQ,NATION,IDTYPE,GMSFHM,XZQH,ADDRESS,LTIME,NOROOM,ETIME,STIME,CARDTYPE,CARDNO,RTIME,PICTURE,GCODE,NOHOTEL,CREATETIME,LWAITER,EWAITER,FLAG', 'select @ from xasgaj.T_CHREC t where 1=1 #GMSFHM# ', 'B201100010', '1', '20110916161449', 'select @ from xasgaj.T_CHREC t where 1=1 #IDTYPE# #IDCODE# #NOHOTEL# #NAME# #LTIME#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100019', '寄住人口', '2', 'jzrk', 'XM,XB,GMSFHM,CSRQ', 'JZ_BH,RYBH,JZ_QTZZBH,JZ_YHZGX,JZ_GMSFHM,JZ_XM,JZ_CSRQ,JZ_ZZBH,JZ_JZDQH,JZ_JZDXZ,JZ_HSJZBZ,JZ_HYJZBZ,JZ_BZ,JZ_DJR,JZ_DJSJ,c.XB', 'select @ from xasgaj.RY_JBXX c,xasgaj.RY_JZXX t where  1=1 and t.JZ_RYBH=c.RYBH #GMSFHM# #RYBH#', 'B201100010', '1', '20111017101851', 'select @ from xasgaj.RY_JBXX c,xasgaj.RY_JZXX t where  1=1 and t.JZ_RYBH=c.RYBH #GMSFHM# #XM# #XB# #CSRQ# #NLD#', 1, 'bizDS', null, null, 1);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100020', '单位从业人员', '2', 'dwcyry', 'XM,XB,GMSFHM,CSRQ', 'RYBH,CYRY_JGBH,CYRY_ZZBH,CYRY_XZZ,CYRY_SX,CYRY_BMMC,CYRY_ZW,CYRY_YM,CYRY_SJ,CYRY_QTLXDH,RYBH,RAS,CYRY_ZSQK,CYRY_PCSYJ,CYRY_PXZH,CYRY_PXZS,CYRY_ZXYY,CYRY_ZXBS,CYRY_ZXRQ,CYRY_ZDFWDXLB,CYRY_BWCS,CYRY_ZYGX,CYRY_ZDRTLB,CYRY_KZCS,CYRY_ZYWT,CYRY_BZ,CYRY_DJRQ,CYRY_SHYX,CYRY_SHXJ,c.XM,c.XB,c.GMSFHM,c.CSRQ', 'select @ from xasgaj.RY_JBXX c,xasgaj.JG_CYRY t where  1=1 and t.CYRY_RYBH=c.RYBH  #GMSFHM# #RYBH# ', 'B201100010', '1', '20111017101851', 'select @ from  xasgaj.RY_JBXX c,xasgaj.JG_CYRY t where  1=1 and t.CYRY_RYBH=c.RYBH #GMSFHM# #XM# #XB# #CSRQ# #NLD#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100021', '境外临时住宿人员', '2', 'jwlszsry', 'XM,XB,ZJHM,CSRQ', 'LSZS_ZSBH,RYBH,LSZS_ZZGLBH,LSZS_DDRQ,LSZS_LKRQ,LSZS_RYSF,LSZS_LXDH,LSZS_HCLGL,LSZS_HCQGL,LSZS_HCLGW,LSZS_HCQGW,LSZS_ZSDW,LSZS_FH,LSZS_DJDWXZQH,LSZS_DJDWDM,LSZS_DJDWMC,LSZS_ZXSJ,LSZS_ZXYY,LSZS_BZ,LSZS_LZSHGW,LSZS_LZSHGL,LSZS_LSZSXZZ,LSZS_JDDW,LSZS_LSDWDH,LSZS_LSDW,LSZS_QQGX,LSZS_SHZSBG,LSZS_DJDWLX,LSZS_ZHGZDM,LSZS_ZHGZMC,LSZS_ZFLX,LSZS_FZGMSFHM,LSZS_FZDH,LSZS_JJLXR,LSZS_JJLXDH,LSZS_DJSJ,XM,XB,CSRQ,YWX,YWM,ZJZL,GMSFHM,QZZL', 'select @ from xasgaj.RY_JBXX c,xasgaj.RY_JWLSZS l where  1=1  #ZJHM#  #RYBH# ', 'B201100010', '1', '20111017101851', 'select @ from xasgaj.RY_JBXX c,xasgaj.RY_JWLSZS t where 1=1 and t.LSZS_RYGLBH=c.RYBH #ZJHM# #XM# #XB# #CSRQ# #YWX# #YWM# #ZJZL# #QZZL#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100022', '在逃人员', '2', 'ztry', 'ZTXM,ZTXB,ZTCSRQ,SFZHSB', 'ZTRYBH,ZTXM,ZTXB,ZTCSRQ,SFZHSB,HJDQH,HJDXZ,ZTJYAQ,LADQ,LADW,ZTXZQX,ZTXZXZ,ZTZC,ZTJYJL,ZTRQ', 'select @ from xasgaj.ZTRYXX t where 1=1 #SFZHSB# ', 'B201100010', '1', '20110813103958', 'select @ from xasgaj.ZTRYXX t where 1=1 #SFZHSB# #ZTXM# #ZTXB# #ZTCSRQ# #NLD#', 1, 'bizDS', null, null, 1);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100023', '房屋出租户房主', '2', 'fwczhfz', 'XM,XB,CSRQ,RYBH', 'CZFW_BH,CZFW_ZZBH,RYBH,CZFW_DJBH,CZFW_SZQX,CZFW_SZXZ,CZFW_SYR,CZFW_SYRPY,CZFW_SYRCSRQ,CZFW_SYRZH,CZFW_CQDW,CZFW_LXDH,CZFW_DLR,CZFW_DLRLXFS,CZFW_CQXZ,CZFW_GLJB,CZFW_SFXXY,CZFW_CZYT,CZFW_FWLX,CZFW_CZJS,CZFW_CZMJ,CZFW_CZSJ,CZFW_CZZZSJ,CZFW_ZXYY,CZFW_BZ,CZFW_FWZT,CSRQ,XB,XM,GMSFHM', 'select @ from xasgaj.DZ_CZFW t,xasgaj.RY_JBXX d where t.czfw_ryjgbh=d.rybh and 1=1 #RYBH# #RYBH# ', 'B201100010', '1', '20111017101851', 'select @ from xasgaj.RY_JBXX d ,xasgaj.DZ_CZFW t  where t.czfw_ryjgbh=d.rybh and 1=1 #RYBH# #XM# #XB# #CSRQ# #NLD#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100024', '保安人员信息', '2', 'baryxx', 'XM,XB,CSRQ,RYBH', 'RYBH,XM,XB,GMSFHM,CSRQ,BARY_BH,BARY_GSBH,RYBH,ZZBH,XZZ,BARY_CZPX,BARY_ZGZBH,BARY_SGZBH,BARY_XHPBH,BARY_GJZC,BARY_HSPX,BARY_HCPX,BARY_PZGW,BARY_PZDW,BARY_SSXQ,BARY_JLX,BARY_DWDZ,BARY_PZDW,BARY_RYXZ,BARY_ZYGZQK', 'select @ from xasgaj.ZA_BARY t,xasgaj.RY_JBXX d where 1=1 and t.bary_rybh=d.rybh  #RYBH# ', 'B201100010', '1', '20111017101851', 'select @ from  xasgaj.RY_JBXX d,xasgaj.ZA_BARY t  where  t.bary_rybh=d.rybh and 1=1 #RYBH# #XM# #XB# #CSRQ# #NLD#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100025', '上网人员信息', '2', 'swryxx', 'SWRYXM,YYCSDM,YYCSMC,ZJHM,DWMC', 'YYCSDM,YYCSMC,DZQH,DZ,SWRYXM,ZJLX,ZJHM,FZJGMC,SWKSSJ,XWSJ,SWZDH', 'select @ from xasgaj.JG_WBSWRYXX t,xasgaj.JG_WBXX d where 1=1 and t.yycsdm=d.yycsdm #YYCSDM# #YYCSDM#', 'B201100010', '1', '20110919132517', 'select @ from xasgaj.JG_WBSWRYXX t,xasgaj.JG_WBXX d where 1=1 and t.yycsdm=d.yycsdm #YYCSDM# #ZJHM# #SWRYXM# #DZ#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100027', '巡逻盘查车辆信息', '2', 'xlpcclxx', 'CLPC_CPH,CLPC_XXBH,CLPC_CLLX,CLPC_CLYS', 'CLPC_XXBH,CLPC_CPH,CLPC_CJH,CLPC_FDJH,CLPC_XSZH,CLPC_CLLX,CLPC_CLYS,CLPC_CLPP,CLPC_TBBS,CLPC_CZRS,CLPC_CLJG,CLPC_BZ,CLPC_BH,CLPC_FLLX', 'select @ from xasgaj.ZA_PCCLXX where 1=1 #CLPC_XXBH#', 'B201100010', '1', '20110813103958', 'select @ from xasgaj.ZA_PCCLXX where 1=1 #CLPC_CPH# #CLPC_XXBH# #CLPC_CLLX# #CLPC_CLYS#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100028', '接处警信息', '2', 'jcjxx', 'JJ_JJSJ,JJBH,JJ_JJR,JJ_JJDW', 'JJBH,JJ_AJBH,JJ_JJSJ,JJ_JJDW,JJ_JJR,JJ_CJR,JJ_CJSJ,JJ_CFBJ,JJ_BJDZRQ,JJ_BJRZZQH,JJ_BJRZZJX,JJ_BJRZZXZ,JJ_BJR,JJ_BJRXB,JJ_FXSJ,JJ_FXDD,JJ_AFDZLB,JJ_JQBT,JJ_BJXQDW,JJ_BJRCSRQ,JJ_BJRZJZL,JJ_BJRZH,JJ_LXDH,JJ_BJRDW,JJ_BJXS,JJ_BJJB,JJ_BJNR,JJ_ZXDZBZ,JJ_CLLX,JJ_BJAJZT,BJCZSJ,JJ_AJFSDZ,JJ_CJBS,JJ_CJDDDSJ,JJ_CJDJSSJ,JJ_CJDPJSJ,JJ_YJDW,JJ_YJR,JJ_YJSJ,JJ_YJSM', 'select @ from xasgaj.jcj_cjxx c,xasgaj.jcj_jjxx j where 1=1 #JJBH# #JJBH#', 'B201100011', '1', '20110916160009', 'select @ from xasgaj.jcj_cjxx c,xasgaj.jcj_jjxx j where 1=1 and c.cj_jjbh=j.jj_jjbh #JJ_BJXS# #JJ_BJR# #JJ_JJSJ# #JJ_JJDW# #JJ_JJR# #JJ_JJBH# #CJ_CJDW# #CJ_CJR# #CJ_CJBH# #CJ_CJLB#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100029', '刑事案件信息', '2', 'xsajxx', 'SLSJ,AJBH,AJLB,SLDW', 'AJBH,BARXM,BARXB,BARCSRQ,BARZJZL,BARZJHM,BARDW,BARLXFS,BARZZ,BARBMJB,AJZT,AJMC,MJ,AJLB,AJWAB,AJXZ,AJSX,AJLY,BASJ,ZBR,SLR,SLDW,PADW,LADW,XBR,ZBDW', 'select @ from xasgaj.aj_jbxx where ajlb <''200000'' and 1=1 #AJBH#', 'B201100011', '1', '20110916160021', 'select @ from xasgaj.aj_jbxx where  ajlb <''200000'' and 1=1 #AJBH# #BARXM# #BARXB# #BARCSRQ# #BARZJHM# #SLDW# #SLR# #ZBR# #XBR# #AJZT# ', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100030', '行政案件信息', '2', 'xzajxx', 'SLSJ,AJBH,AJLB,SLDW', 'AJBH,BARXM,BARXB,BARCSRQ,BARZJZL,BARZJHM,BARDW,BARLXFS,BARZZ,BARBMJB,AJZT,AJMC,MJ,AJLB,AJWAB,AJXZ,AJSX,AJLY,BASJ,ZBR,SLR,SLDW,PADW,LADW,XBR,ZBDW', 'select @ from xasgaj.aj_jbxx where ajlb >=''200000'' and 1=1 #AJBH#', 'B201100011', '1', '20110916160030', 'select @ from xasgaj.aj_jbxx where ajlb >=''200000'' and 1=1 #AJBH# #BARXM# #BARXB# #BARCSRQ# #BARZJHM# #SLDW# #SLR# #ZBR# #XBR# #AJZT# ', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100031', '车辆信息', '2', 'clxx', 'SAWP_CPH,SAWP_CJH,SAWP_FDJH,SAWP_CZSFZH', 'SAWP_BH,SAWP_AJBH,SAWP_RYBH,SAWP_CJH,SAWP_FDJH,SAWP_CPH,HPZL,SAWP_CZSFZH,SAWP_CZLXDH,SAWP_CZDZ,SAWP_SFBX,SAWP_BXQK,SAWP_BZ', 'select @ from xasgaj.aj_sawp where 1=1 #SAWP_CZSFZH#', 'B201100012', '1', '20110813103958', 'select @ from xasgaj.aj_sawp where 1=1 #SAWP_CPH# #SAWP_HPZL# #SAWP_FDJH# #SAWP_CJH# #SAWP_CZSFZH#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100032', '网吧信息', '2', 'wbxx', 'YYCSDM,YYCSMC,DZ,CKIPDZ', 'YYCSDM,YYCSMC,DZQH,DZ,CKIPDZ,ENTERDB_TIME', 'select @ from xasgaj.JG_WBXX t,xasgaj.JG_WBSWRYXX w  where t.yycsdm=w.yycsdm and 1=1 #YYCSDM#', 'B201100013', '1', '20110922155029', 'select @ from xasgaj.JG_WBXX t,xasgaj.JG_WBSWRYXX w  where t.yycsdm=w.yycsdm and 1=1 #YYCSDM# #DZ# #SWRYXM# #ZJHM#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100033', '特种行业', '2', 'tzhy', 'FRDB,JGBH,MC,THBH', 'DWMC,THBH,JGBH,MC,XKZH,THBM,THLB,JZZMJ,KFMJ,MTMJ,HKSMJ,JCSMJ,TCCZMJ,YLCSMJ,TDKD,XJDJ,FJS,CWS,FZJG,FZRQ,HFR,LZR,ZBZZMC,ZRMJ,ZRMJDH,ZXBS,ZXRQ,ZXYY,BGQK,BZ', 'select @ from xasgaj.za_tzhy t,xasgaj.jg_jbxx j where t.tzhy_jgthbh=j.jgbh and 1=1 #JGBH#', 'B201100014', '1', '20110813103958', 'select @ from xasgaj.za_tzhy t,xasgaj.jg_jbxx j where t.tzhy_jgthbh=j.jgbh and 1=1 #DWMC# #FRDB# #LXDH# #FRZZ#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100034', '公共场所', '2', 'ggcs', 'FRDB,GGCS_BH,GGCS_MC,JGBH', 'DWMC,GGCS_TDK,GGCS_QT,GGCS_NBJG,GGCS_JZWJG,GGCS_GGCSDJ,GGCS_CSLB,GGCS_MC,GGCS_BADJHM,JGBH,GGCS_BH,GGCS_TDKSL,GGCS_YWXJJCC,GGCS_CSZMJ,GGCS_YYMJ,GGCS_ZWHJ', 'select @ from  xasgaj.za_ggcsxx t,xasgaj.jg_jbxx j where t.ggcs_jgbh=j.jgbh and 1=1 #JGBH#', 'B201100014', '1', '20110813103958', 'select @ from  xasgaj.za_ggcsxx t,xasgaj.jg_jbxx j where t.ggcs_jgbh=j.jgbh and 1=1 #DWMC# #FRDB# #LXDH# #FRZZ#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100035', '保安公司', '2', 'bags', 'BAGS_FRDB,BAGS_JGBH,BAGS_DWMC,BAGS_FRSFZHM', 'BAGS_JGBH,BAGS_DWMC,BAGS_GSDM,BAGS_DWCZ,BAGS_DWDH,BAGS_DWDZYX,BAGS_GLFW,BAGS_FRDB,BAGS_FRSFZHM,BAGS_FRLXDH,BAGS_FRZZ,BAGS_ZGBM,BAGS_FZR,BAGS_ZW,BAGS_FZRDH,BAGS_GLRYS,BAGS_ZBFBQ,BAGS_ZBXJG,BAGS_ZBYCC,BAGS_ZPRY,BAGS_JGZCH,BAGS_BAGS_ZCRQ,BAGS_ZCQH,BAGS_ZCDZ,BAGS_YXQX,BAGS_JGSSXQ,BAGS_JGJLX,BAGS_JGMLPH,BAGS_JGMLXZ,BAGS_JGMPHZ,BAGS_YZBH,BAGS_SZZRQ,BAGS_XFDJ,BAGS_DWXZ,BAGS_BGQK,BAGS_BZ', 'select @ from xasgaj.za_bags where 1=1 #BAGS_JGBH#', 'B201100014', '1', '20110813103958', 'select @ from xasgaj.za_bags where 1=1 #BAGS_FRDB# #BAGS_JGBH# #BAGS_DWMC# #BAGS_FRSFZHM# ', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100036', '涉外单位', '2', 'swdw', 'FRDB,JGBH,DWMC,SWDW_BH', 'DWMC,SWDW_BH,JGBH,SWDW_LXR,SWDW_SJBGDZ,SWDW_ZFZB,SWDW_WFZB,SWDW_ZFTZDW,SWDW_WFTZDW,SWDW_TZGJDQ,SWDW_QYQKJZ,SWDW_ZXBS,SWDW_ZXYY,SWDW_ZXRQ,SWDW_BZ', 'select @ from xasgaj.za_swdw t ,xasgaj.jg_jbxx j where t.swdw_jgbh=j.jgbh and 1=1 #JGBH#', 'B201100014', '1', '20110813103958', 'select @ from xasgaj.za_swdw t ,xasgaj.jg_jbxx j where t.swdw_jgbh=j.jgbh and 1=1 #DWMC# #FRDB# #LXDH# #FRZZ#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100037', '内保单位', '2', 'nbdw', 'FRDB,JGBH,DWMC,NBDW_BH', 'DWMC,NBDW_BH,JGBH,NBDW_DWXZ,NBDW_DWLLR,NBDW_JFQK,NBDW_ZDGAJG,NBDW_WWXX,NBDW_GLBM,NBDW_BWJGSZ,NBDW_SCJYZK,NBDW_ZYBWS,NBDW_YHBWS,NBDW_ZDDJ,NBDW_PDYJ,NBDW_NLR,NBDW_NXSE,NBDW_ZGZGS,NBDW_XGZGS,NBDW_WYGS,NBDW_WJSSYGS,NBDW_ZGXSRS,NBDW_GATSSYGS,NBDW_JCSSMZSSYGS,NBDW_BWZZLB,NBDW_BWBMFZR,NBDW_ZZBWGBS,NBDW_JZBWGBS,NBDW_JJS,NBDW_BAS,NBDW_HWLL,NBDW_HWQS,NBDW_QDZAZRSSJ,NBDW_YWYJZB,NBDW_ZBDTS,NBDW_ZBJGS,NBDW_ZBMTCS,NBDW_ZBQCS', 'select @ from xasgaj.za_nbdw t,xasgaj.jg_jbxx j where  t.nbdw_jgbh=j.jgbh and 1=1 #NBDW_BH# #JGBH#', 'B201100014', '1', '20110813103958', 'select @ from xasgaj.za_nbdw t,xasgaj.jg_jbxx j where t.nbdw_jgbh=j.jgbh and 1=1 #DWMC# #FRDB# #LXDH# #FRZZ#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('S000000001', '密码设置', '9', 'mmsz', null, null, null, 'B201100008', '0', '20110921112451', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('S000000002', '版本更新', '9', 'bbgx', null, null, null, 'B201100008', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('S000000003', '系统设置', '9', 'xtsz2', null, null, null, 'B201100008', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100041', '巡逻盘查人员信息', '2', 'xlpcryxx', 'RYPC_XM,XB,RYPC_CSRQ,RYPC_GMSFHM', 'RYPC_XXBH,RYPC_BH,RYPC_RYBH,RYPC_XM,XB,RYPC_MZ,RYPC_CSRQ,RYPC_GMSFHM,RYPC_ZJZL,RYPC_ZJHM,RYPC_JSZH,RYPC_XZZ,RYPC_RYLB,RYPC_CLJG,RYPC_BZ', 'select @ from xasgaj.ZA_PCRYXX where 1=1 #RYPC_GMSFHM#', 'B201100010', '1', '20110813103958', 'select @ from xasgaj.ZA_PCRYXX where 1=1 #RYPC_GMSFHM# #RYPC_XM# #XB# #RYPC_CSRQ# #NLD#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100042', '机构信息', '0', 'jgcx', null, 'DWMC,FRDB,FRZZ,FRSFZH,JGBH,WWM,DSZ,ZJL,DWCZ,DWDZYX,DWSX,FRLXDH,JJXZ,XYLB,JYFW_ZY,JYFW_JY,KYRQ,YYZZBH,SWDJH,JGZCH,ZCRQ,ZCZB,ZCQH,ZCDZ,FZRQ,YXQX,FHDJ,CYRS,FZJG,DWDM,GYDWLX,YZBM,JGJLX,JGMLPH,JGMLXZ,JGMPHZ,JGSSXQ,SZZRQ,TZGJ,DWDH', 'select @ from xasgaj.jg_jbxx j where 1=1 #JGBH#', '9999999999', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100043', '处警信息', '0', 'jcjxx', null, 'JJBH,CJ_CJSJ,CJ_ZBLD,CJ_DDXCSJ,CJ_CJJG,CJ_BCCLJG,CJ_SFSW,CJ_XXQK,CJ_SSXXQK,CJ_FSCS,CJ_PHXXAJ,CJ_ZHZACY,CJ_CDJL,CJ_CDJDC,CJ_CDCZ,CJ_ZJJJSS,CJ_WHSS,CJ_JZQZ,CJ_JZSY,CJ_JJFNS,CJ_JJETS,CJ_JJRZS,CJ_RYSWS,CJ_RYSSS,CJ_TPRF,CJ_LZSCRS,CJ_CJCZSJ,CJ_AJSLR,CJ_AJSLDW,CJ_CJDW,CJ_CJR,CJ_CJBH,CJ_CJLB', 'select @ from xasgaj.jcj_cjxx c where 1=1 #JJBH#', '9999999999', '0', '20110813103958', null, 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('31171d2c:132b99423bf:-8000', 'cc', '0', 'Windows XP', null, null, null, 'B201100010', '0', '20111115130005', null, 7, 'bizDS', '4', '5', 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100044', '通知通告', '9', 'aa', 'ID,TITLE,CONTENT,SENDTIME', 'ID,TITLE,TYPE,CONTENT,SENDUSERID,SENDTIME,SENDSTATUS,SENDDEPTID,UPLOADFILENAME,REQDEVICE_ID,REQUSERNAME,REQDEPTID,REQDEPTNAME,SENDUSERNAME,SENDDEPTNAME', 'select @ from fw_conf_xa.jw_tztg t where 1=1 #ID#', 'B201100006', '1', '20111107110714', 'select @ from fw_conf_xa.jw_tztg t where 1=1 ', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B20110052', '强制措施', '3', 'qzcs', null, null, null, '9999999999', '0', '20110813103958', 'insert into test_add(jysbh,zqmj,jzzl,zjhm) values(#JDSBH#,#ZQMJ#,#JZJL#,#ZJHM#)', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('7adf59e3:132f0f4cce8:-8000', 'aabcc', '0', 'bags', null, null, null, 'B201100010', '0', '20111115144521', null, 6, 'bizDS', '6', '6', 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100045', '通讯录', '2', 'aa', 'NAME,DEPTID,MOBILE,EMAIL', 'ADDID,NAME,DEPTID,MOBILE,UNITTEL,REMARK,DUTY,SORT,MOBILE2,UNITTEL2,DEPTNAMES,EMAIL', 'select @ from fw_conf_xa.jw_address t where 1=1 #ADDID# ', 'B201100006', '1', '20111107110714', 'select @ from fw_conf_xa.jw_address t where 1=1 #NAME# #DEPTID#', 1, 'bizDS', null, null, 0);
insert into BUSINESS_CONFIG (B_ID, B_NAME, B_TYPE, IMG_NAME, L_SIMPLE_ITEMS, D_SIMPLE_ITEMS, D_SQL, FATHER_ID, FINAL_NODE, EDIT_RES_DATE, L_SQL, B_ORDERS, DS, VALIDATE_RES, VALIDATE_DES, SHORTCUT)
values ('B201100046', '法律法规', '2', 'aa', 'LAW_ID,LAW_CODE,LAW_NAME,LAW_TYPE', 'LAW_ID,LAW_CODE,LAW_NAME,ADMINISTRATION,IRREGULARITYACTION,LAW_TYPE', 'select @ from fw_conf_xa.jw_law t where 1=1  #LAW_CODE# ', 'B201100006', '1', '20111107110714', 'select @ from fw_conf_xa.jw_law t where 1=1 #LAW_CODE# #LAW_NAME# #LAW_TYPE#', 1, 'bizDS', null, null, 0);
commit;
prompt 48 records loaded
prompt Loading BUSINESS_RELATED...
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100023', 'B201100015', 'RYBH', '0');
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100025', 'B201100032', 'YYCSDM', '0');
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100016', 'B201100015', 'RYBH', '0');
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100024', 'B201100015', 'RYBH', '0');
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100020', 'B201100015', 'RYBH', '0');
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100037', 'B201100042', 'JGBH', '0');
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100036', 'B201100042', 'JGBH', '0');
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100034', 'B201100042', 'JGBH', '0');
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100033', 'B201100042', 'JGBH', '0');
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100032', 'B201100025', 'YYCSDM', '0');
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100019', 'B201100015', 'RYBH', '0');
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100021', 'B201100015', 'RYBH', '0');
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100028', 'B201100043', 'JJBH', '0');
insert into BUSINESS_RELATED (B_ID, R_ID, R_COLUMN, R_TYPE)
values ('B201100017', 'B201100015', 'GMSFHM', '1');
commit;
prompt 14 records loaded
prompt Loading BUSINESS_RES_CONFIG...
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100015', '出生日期', 'EditDate', null, 0, '6', '日期输入不合法', 'CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100015', '年  龄 段', 'TextAge', null, 1, '5', '年龄必须是数字', 'NLD', 'CHAR_DATE', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100015', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100015', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XM', 'VARCHAR', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100015', '身份号码', 'TextEdit', null, 1, '2', '身份证输入不合法', 'GMSFHM', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100031', '发动机号', 'TextEdit', null, 1, '0', null, 'SAWP_FDJH', null, 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100031', '车  架  号', 'TextEdit', null, 1, '0', null, 'SAWP_CJH', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100031', '号牌种类', 'TextSpinner', 'HPZL', 1, '0', null, 'SAWP_HPZL', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100031', '车  牌  号', 'TextEdit', null, 1, '0', null, 'SAWP_CPH', null, 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100033', '单位名称', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'DWMC', 'VERCHAR*50', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100033', '联系电话', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'LXDH', 'VERCHAR*20', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100033', '法人住址', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRZZ', 'VERCHAR*50', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100017', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', ' XM', 'VARCHAR*50', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100017', '准驾车型', 'TextSpinner', 'ZJCX', 1, '0', null, 'ZJCX', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100032', '地       址', 'TextEdit', null, 1, '0', null, 'DZ', null, 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100032', '网吧名称', 'TextSpinner', 'WBMC', 1, '0', null, 'YYCSDM', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100034', '法人代表', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRDB', 'VERCHAR*20', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100034', '联系电话', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'LXDH', 'VERCHAR*20', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100023', '身份号码', 'TextEdit', null, 1, '2', '身份证输入不合法', 'GMSFHM', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100023', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XM', 'VARCHAR', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100023', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100017', '身份号码 ', 'TextEdit', null, 1, '2', '身份证输入不合法', 'SFZMHM', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100018', '证件类型', 'TextSpinner', 'LKZJLX', 1, '0', null, 'IDTYPE', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100018', '证件号码', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'IDCODE', 'VARCHAR*50', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100018', '旅馆名称', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'NOHOTEL', 'VARCHAR', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100018', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'NAME', 'VARCHAR*50', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100018', '入住时间', 'EditDate', null, 1, '6', '日期格式不正确', 'LTIME', 'CHAR_DATE*50', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100019', '身份号码', 'TextEdit', null, 1, '2', '身份证输入不合法', 'GMSFHM', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100019', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XM', 'VARCHAR', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100019', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100019', '年  龄 段', 'TextAge', null, 1, '5', '年龄必须是数字', 'NLD', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100019', '出生日期', 'EditDate', null, 1, '6', '日期输入不合法', 'CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100035', '法人代表', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BAGS_FRDB', 'VERCHAR*20', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100035', '联系电话', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BAGS_FRLXDH', 'VERCHAR*20', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100037', '单位名称', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'DWMC', 'VERCHAR*50', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100037', '联系电话', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'LXDH', 'VERCHAR*20', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100037', '法人住址', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRZZ', 'VERCHAR*50', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100016', '身份号码', 'TextEdit', null, 1, '2', '身份证输入不合法', 'ZZRY_BDBH', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100016', '姓       名 ', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'ZZRY_XM', 'VARCHAR*18', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100016', '性       别 ', 'TextSpinner', 'XB', 1, '0', null, 'ZZRY_XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100016', '出生日期', 'EditDate', null, 1, '6', '日期格式不正确', 'ZZRY_CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100024', '出生日期', 'EditDate', null, 1, '6', '日期输入不合法', 'CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100024', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100024', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XM', 'VARCHAR', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100036', '法人代表', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRDB', 'VERCHAR*20', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100036', '联系电话', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'LXDH', 'VERCHAR*20', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100036', '法人住址', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRZZ', 'VERCHAR*50', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100035', '身份证号', 'TextEdit', null, 1, '2', '身份证输入不合法', 'BAGS_FRSFZHM', 'VERCHAR*18', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100025', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'SWRYXM', 'VARCHAR*50', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100025', '人员地址', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'DZ', 'VARCHAR*50', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100041', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'RYPC_XM', 'VERCHAR*18', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100041', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100041', '年  龄  段', 'TextAge', null, 1, '5', '年龄输入是数字', 'NLD', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100041', '出生日期', 'EditDate', null, 1, '6', '日期格式不正确', 'RYPC_CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100020', '身份号码', 'TextEdit', null, 1, '2', '身份证输入不合法', 'GMSFHM', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100020', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XM', 'VARCHAR*50', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100020', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100020', '年  龄 段', 'TextAge', null, 1, '5', '年龄必须是数字', 'NLD', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100020', '出生日期', 'EditDate', null, 1, '6', '日期输入不合法', 'CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100027', '车 牌 号', 'TextEdit', null, 1, '0', null, 'CLPC_CPH', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100027', '车 架 号', 'TextEdit', null, 1, '0', null, 'CLPC_CJH', null, 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100027', '发动机号', 'TextEdit', null, 1, '0', null, 'CLPC_FDJH', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100027', '行驶证号', 'TextEdit', null, 1, '0', null, 'CLPC_XSZH', null, 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100027', '车辆类型', 'TextSpinner', 'CLLX', 1, '0', null, 'CLPC_CLLX', null, 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100021', '中文姓名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XM', 'VARCHAR*20', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100021', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100021', '出生日期', 'EditDate', null, 1, '6', '输入日期格式不正确', 'CSRQ', 'CHAR_DATE*20', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100021', '英  文  姓', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'YWX', 'VARCHAR*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100021', '英  文  名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'YWM', 'VARCHAR*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (6, 'B201100021', '证件种类', 'TextSpinner', 'ZJZL', 1, '0', null, 'ZJZL', null, 0, 6, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (7, 'B201100021', '证件号码', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'ZJHM', 'VARCHAR*50', 0, 7, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (8, 'B201100021', '签证种类', 'TextSpinner', 'QZZL', 1, '0', null, 'QZZL', null, 0, 8, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100022', '身份证号', 'TextEdit', null, 1, '2', '身份证输入不合法', 'SFZHSB', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100022', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'ZTXM', 'VARCHAR*50', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100022', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'ZTXB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100022', '年  龄 段', 'TextAge', null, 1, '5', '年龄必须是数字', 'NLD', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100029', '案件编号', 'TextEdit', null, 1, '0', null, 'AJBH', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100029', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'BARXB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100029', '出生日期', 'TextEdit', null, 1, '6', '日期输入不合法', 'BARCSRQ', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100029', '证件号码', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BARZJHM', 'VARCHAR*50', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (6, 'B201100029', '受理单位', 'TextSpinner', 'DW', 1, '0', null, 'SLDW', null, 0, 6, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (7, 'B201100029', '受  理 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'SLR', 'VARCHAR*50', 0, 7, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (8, 'B201100029', '主  办 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'ZBR', 'VARCHAR*20', 0, 8, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (12, 'B201100029', '案件状态', 'TextSpinner', 'AJZT', 1, '0', null, 'AJZT', null, 0, 12, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100030', '姓      名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BARXM', 'VARCHAR*20', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100030', '性      别', 'TextSpinner', 'XB', 1, null, null, 'BARXB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100030', '出生日期', 'TextEdit', null, 1, '6', '日期格式不正确', 'BARCSRQ', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100030', '证件号码', 'TextEdit', null, 1, '0', null, 'BARZJHM', null, 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (6, 'B201100030', '受理单位', 'TextSpinner', 'DW', 1, '0', null, 'SLDW', null, 0, 6, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (7, 'B201100030', '受  理 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'SLR', 'VARCHAR*20', 0, 7, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (8, 'B201100030', '主  办 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'ZBR', 'VARCHAR*20', 0, 8, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (10, 'B201100030', '案件状态', 'TextSpinner', 'AJZT', 1, '0', null, 'AJZT', null, 0, 10, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (9, 'B201100029', '主办单位', 'TextSpinner', 'DW', 1, '0', null, 'ZBDW', null, 0, 9, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (11, 'B201100029', '立案单位', 'TextSpinner', 'DW', 1, '0', null, 'LADW', null, 0, 11, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (13, 'B201100029', '破案单位', 'TextSpinner', 'DW', 1, '0', null, 'PADW', null, 0, 13, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100028', '报警形式', 'TextSpinner', 'BJLX', 1, '0', null, 'JJ_BJXS', null, 0, 1, null);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100028', '报  警 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'JJ_BJR', 'VARCHAR*20', 0, 2, null);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100028', '接警时间', 'TextEdit', null, 1, '0', null, 'JJ_JJSJ', 'CHAR_DATE*20', 0, 3, null);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100028', '接警单位', 'TextSpinner', 'DW', 1, '0', null, 'JJ_JJDW', null, 0, 4, null);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100028', '接  警 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'JJ_JJR', 'VARCHAR*20', 0, 5, null);
commit;
prompt 101 records committed...
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (7, 'B201100028', '处警单位', 'TextSpinner', 'DW', 1, '0', null, 'CJ_CJDW', null, 0, 7, null);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (9, 'B201100028', '处警编号', 'TextEdit', null, 1, '0', null, 'CJ_CJBH', null, 0, 9, null);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (10, 'B201100028', '处警类别', 'TextSpinner', 'CJLB', 1, '0', null, 'CJ_CJLB', null, 0, 10, null);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100032', '姓       名', 'TextEdit', null, 1, '7', null, 'SWRYXM', 'VARCHAR*18', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100032', '证件号码', 'TextEdit', null, 1, '0', null, 'ZJHM', null, 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100030', '案件编号', 'TextEdit', null, 1, '0', null, 'AJBH', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100022', '出生日期', 'EditDate', null, 1, '6', '日期输入不合法', 'ZTCSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100023', '出生日期', 'EditDate', null, 1, '6', '日期输入不合法', 'CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100024', '身份号码', 'TextEdit', null, 1, '2', '身份证输入不合法', 'GMSFHM', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100025', '证件号码', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'ZJHM', 'VARCHAR*50', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (8, 'B201100028', '处  警 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'CJ_CJR', 'VARCHAR*20', 0, 8, null);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100029', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BARXM', 'VARCHAR*20', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (10, 'B201100029', '协 办  人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XBR', 'VARCHAR*20', 0, 10, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100041', '身份证号', 'TextEdit', null, 1, '2', '身份证输入不合法', 'RYPC_GMSFHM', 'VERCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (9, 'B201100030', '协  办 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XBR', 'VARCHAR*20', 0, 9, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (5, 'B201100031', '身份证号', 'TextEdit', null, 1, '2', '身份证输入不合法', 'SAWP_CZSFZH', 'VARCHAR*18', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100033', '法人代表', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRDB', 'VERCHAR*20', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100034', '单位名称', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'DWMC', 'VERCHAR*50', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100034', '法人住址', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRZZ', 'VERCHAR*50', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100035', '单位名称', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BAGS_DWMC', 'VERCHAR*50', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100035', '法人住址', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BAGS_FRZZ', 'VERCHAR*50', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100036', '单位名称', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'DWMC', 'VERCHAR*50', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100037', '法人代表', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRDB', 'VERCHAR*20', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (4, 'B201100016', '年  龄  段', 'TextAge', null, 1, '5', '年龄必须是数字', 'NLD', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (6, 'B201100028', '接警编号', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'JJ_JJBH', 'VARCHAR*20', 0, 6, null);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'S000000001', '旧  密  码', 'TextPwd', null, 1, '0', null, 'OLD_PWD', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'S000000001', '新  密  码', 'TextPwd', null, 1, '0', null, 'NEW_PWD', null, 0, 2, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'S000000001', '确认密码', 'TextPwd', null, 1, '0', null, 'CONFIRM_PWD', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, '2879d6f8:131fa4a7057:-8000', '2', 'EditDate', 'CLLX', 1, '0', '2', '11', '2', 0, 2, 1);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, '3cfebef3:1328edc98f8:-7fed', '性       别', 'TextSpinner', 'XB', 0, '0', null, 'XB', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (6, '7adf59e3:132f0f4cce8:-8000', '6', 'EditDate', 'XB', 0, '0', '6', '61', '6', 0, 6, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100045', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'NAME', 'VARCHAR*20', 0, 6, null);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (9, '31171d2c:132b99423bf:-8000', '9', 'EditDate', 'XB', 0, '0', '9', '7', '9', 0, 9, 0);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100045', '手机号码', 'TextEdit', null, 1, '7', '手机号码输入不合法', 'MOBILE', 'VARCHAR*13', 0, 4, null);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (3, 'B201100045', 'E-Mail', 'TextEdit', null, 1, '7', 'E-Mail输入不正确', 'EMAIL', 'VARCHAR*30', 0, 4, null);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (1, 'B201100046', '法规代码', 'TextEdit', null, 1, '7', '法规代码输入不合法', 'LAW_CODE', 'VARCHAR*50', 0, 4, null);
insert into BUSINESS_RES_CONFIG (W_ID, B_ID, NAME, TYPE, RES_ID, VISIBLE, VALIDATE_TYPE, VALIDATE_DES, CODE, DATATYPE, ISBENULL, ORDERS, TABGROUP)
values (2, 'B201100046', '法规名称', 'TextEdit', null, 1, '7', '法规名称输入不合法', 'LAW_NAME', 'VARCHAR*50', 0, 4, null);
commit;
prompt 137 records loaded
prompt Loading COLUMN_MAP...
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('THBH', 'B201100033', '特行编号', 'XASGAJ.ZA_TZHY t', 't.TZHY_JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGBH', 'B201100033', '机构特行编号', 'XASGAJ.ZA_TZHY t', 't.TZHY_JGTHBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('MC', 'B201100033', '名称', 'XASGAJ.ZA_TZHY t', 't.TZHY_MC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XKZH', 'B201100033', '许可证号', 'XASGAJ.ZA_TZHY t', 't.TZHY_TZHYXKZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('THBM', 'B201100033', '特行编码', 'XASGAJ.ZA_TZHY t', 't.TZHY_THBM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('THLB', 'B201100033', '特行类别', 'XASGAJ.ZA_TZHY t', 't.TZHY_THLB', 'CHAR', '1', 'THLB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZZMJ', 'B201100033', '建筑总面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_JZZMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('KFMJ', 'B201100033', '库房面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_KFMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('MTMJ', 'B201100033', '门庭面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_MTMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('HKSMJ', 'B201100033', '会客室面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_HKSMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JCSMJ', 'B201100033', '寄存室面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_JCSMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('TCCZMJ', 'B201100033', '停车场总面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_TCCZMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YLCSMJ', 'B201100033', '娱乐场所面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_YLCSMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('TDKD', 'B201100033', '通道宽度', 'XASGAJ.ZA_TZHY t', 't.TZHY_TDKD', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XJDJ', 'B201100033', '星级等级', 'XASGAJ.ZA_TZHY t', 't.TZHY_XJDJ', 'CHAR', '1', 'XJDJ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FJS', 'B201100033', '房间数', 'XASGAJ.ZA_TZHY t', 't.TZHY_FJS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CWS', 'B201100033', '床位数', 'XASGAJ.ZA_TZHY t', 't.TZHY_CWS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FZJG', 'B201100033', '发证机关', 'XASGAJ.ZA_TZHY t', 't.TZHY_FZJG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FZRQ', 'B201100033', '发证日期', 'XASGAJ.ZA_TZHY t', 't.TZHY_FZRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('HFR', 'B201100033', '核发人', 'XASGAJ.ZA_TZHY t', 't.TZHY_HFR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LZR', 'B201100033', '领证人', 'XASGAJ.ZA_TZHY t', 't.TZHY_LZR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZBZZMC', 'B201100033', '治保组织名称', 'XASGAJ.ZA_TZHY t', 't.TZHY_ZBZZMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZRMJ', 'B201100033', '责任民警', 'XASGAJ.ZA_TZHY t', 't.TZHY_ZRMJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZRMJDH', 'B201100033', '责任民警电话', 'XASGAJ.ZA_TZHY t', 't.TZHY_MJDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZXBS', 'B201100033', '注销标识', 'XASGAJ.ZA_TZHY t', 't.TZHY_ZXBS', 'CHAR', '1', 'ZXBS', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZXRQ', 'B201100033', '注销日期', 'XASGAJ.ZA_TZHY t', 't.TZHY_ZXRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZXYY', 'B201100033', '注销原因', 'XASGAJ.ZA_TZHY t', 't.TZHY_ZXYY', 'VARCHAR', '1', 'ZXYY', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BGQK', 'B201100033', '变更情况', 'XASGAJ.ZA_TZHY t', 't.TZHY_BGQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BZ', 'B201100033', '备注', 'XASGAJ.ZA_TZHY t', 't.TZHY_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DWMC', 'B201100033', '单位名称', 'XASGAJ.JG_JBXX j', 'j.DWMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRDB', 'B201100033', '法人代表', 'XASGAJ.JG_JBXX j', 'j.FRDB', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LXDH', 'B201100033', '联系电话', 'XASGAJ.JG_JBXX j', 'j.DWDH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRZZ', 'B201100033', '法人住址', 'XASGAJ.JG_JBXX j', 'j.FRZZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRSFZH', 'B201100033', '法人身份证号', 'XASGAJ.JG_JBXX j', 'j.FRSFZHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SAWP_BH', 'B201100031', '品编号', 'xasgaj.aj_sawp', 'SAWP_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SAWP_AJBH', 'B201100031', '物品案件编号', 'xasgaj.aj_sawp', 'SAWP_AJBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SAWP_RYBH', 'B201100031', '物品人员编号', 'xasgaj.aj_sawp', 'SAWP_RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SAWP_CJH', 'B201100031', '物品车架号', 'xasgaj.aj_sawp', 'SAWP_CJH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SAWP_FDJH', 'B201100031', '物品发动机号', 'xasgaj.aj_sawp', 'SAWP_FDJH', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SAWP_CPH', 'B201100031', '物品车牌号', 'xasgaj.aj_sawp', 'SAWP_CPH', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('HPZL', 'B201100031', '物品号牌种类', 'xasgaj.aj_sawp', 'SAWP_HPZL', 'CHAR', '1', 'HPZL', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SAWP_CZSFZH', 'B201100031', '物品车主身份证号', 'xasgaj.aj_sawp', 'SAWP_CZSFZH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SAWP_CZLXDH', 'B201100031', '物品车主联系电话', 'xasgaj.aj_sawp', 'SAWP_CZLXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SAWP_CZDZ', 'B201100031', '物品车主地址', 'xasgaj.aj_sawp', 'SAWP_CZDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SAWP_SFBX', 'B201100031', '物品是否参加被盗抢保险', 'xasgaj.aj_sawp', 'SAWP_SFBX', 'CHAR', '1', 'SF', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SAWP_BXQK', 'B201100031', '物品保险情况', 'xasgaj.aj_sawp', 'SAWP_BXQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SAWP_BZ', 'B201100031', '物品备注', 'xasgaj.aj_sawp', 'SAWP_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YYCSDM', 'B201100032', '网吧单位代码', 'xasgaj.JG_WBXX t', 't.YYCSDM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YYCSMC', 'B201100032', '单位名称', 'xasgaj.JG_WBXX t', 't.YYCSMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DZQH', 'B201100032', '地址区划', 'xasgaj.JG_WBXX t', 't.DZQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DZ', 'B201100032', '地        址', 'xasgaj.JG_WBXX t', 't.DZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CKIPDZ', 'B201100032', '主机IP地址', 'xasgaj.JG_WBXX t', 't.CKIPDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ENTERDB_TIME', 'B201100032', '录入时间', 'xasgaj.JG_WBXX t', 't.ENTERDB_TIME', 'DATE', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_TDK', 'B201100034', '公共场所通道口', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_TDK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_QT', 'B201100034', '公共场所其它', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_QT', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_NBJG', 'B201100034', '公共场所内部结构', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_NBJG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_JZWJG', 'B201100034', '公共场所建筑物结构', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_JZWJG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_GGCSDJ', 'B201100034', '公共场所等级', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_GGCSDJ', 'CHAR', '1', 'GGCSDJ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_CSLB', 'B201100034', '公共场所类别', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_CSLB', 'CHAR', '1', 'CSLB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_MC', 'B201100034', '公共场所名称', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_MC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_BADJHM', 'B201100034', '公共场所备案登记号码', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_BADJHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGBH', 'B201100034', '公共场所关联机构编号', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_BH', 'B201100034', '公共场所编号', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_TDKSL', 'B201100034', '公共场所通道口数量', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_TDKSL', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_YWXJJCC', 'B201100034', '公共场所有无小件寄存处', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_YWXJJCC', 'CHAR', '1', 'YW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_CSZMJ', 'B201100034', '公共场所总面积', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_CSZMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_YYMJ', 'B201100034', '公共场所营业面积', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_YYMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GGCS_ZWHJ', 'B201100034', '公共场所周围环境', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_ZWHJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZT', 'B201100017', '驾驶证状态', 'XASGAJ.DRIVER', 'ZT', 'VARCHAR', '1', 'JSZZT', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CCLZRQ', 'B201100017', '初次领证日期', 'XASGAJ.DRIVER', 'CCLZRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YXQZ', 'B201100017', '有效期止', 'XASGAJ.DRIVER', 'YXQZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YXQS', 'B201100017', '有效期始', 'XASGAJ.DRIVER', 'YXQS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZQX', 'B201100017', '驾证期限', 'XASGAJ.DRIVER', 'JZQX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZJCX', 'B201100017', '准驾车型', 'XASGAJ.DRIVER', 'ZJCX', 'VARCHAR', '1', 'ZJCX', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FZRQ', 'B201100017', '发证日期', 'XASGAJ.DRIVER', 'FZRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LXZSXXDZ', 'B201100017', '联系住所详细地址', 'XASGAJ.DRIVER', 'LXZSXXDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LXZSXZQH', 'B201100017', '联系住所行政区划', 'XASGAJ.DRIVER', 'LXZSXZQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LXDH', 'B201100017', '联系电话', 'XASGAJ.DRIVER', 'LXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CSRQ', 'B201100017', '出生日期', 'XASGAJ.DRIVER', 'CSRQ', 'CHAR_DATE', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XB', 'B201100017', '性别', 'XASGAJ.DRIVER', 'XB', 'VARCHAR', '1', 'XB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XM', 'B201100017', '姓名', 'XASGAJ.DRIVER', 'XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SFZMHM', 'B201100017', '身份证号', 'XASGAJ.DRIVER', 'SFZMHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SFZMMC', 'B201100017', '身份证明名称', 'XASGAJ.DRIVER', 'SFZMMC', 'VARCHAR', '1', 'SFZZL', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BZCS', 'B201100017', '补证次数', 'XASGAJ.DRIVER', 'BZCS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FZJG', 'B201100017', '发证机关', 'XASGAJ.DRIVER', 'FZJG', 'VARCHAR', '1', 'FZJG', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LJJF', 'B201100017', '累积记分', 'XASGAJ.DRIVER', 'LJJF', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('WFCS', 'B201100017', '违法次数', 'XASGAJ.DRIVER', 'WFCS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SYRQ', 'B201100017', '下一审验日期', 'XASGAJ.DRIVER', 'SYRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CFRQ', 'B201100017', '超分日期', 'XASGAJ.DRIVER', 'CFRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SGCS', 'B201100017', '事故次数', 'XASGAJ.DRIVER', 'SGCS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRSFZH', 'B201100034', '法人身份证号', 'XASGAJ.JG_JBXX j', 'j.FRSFZHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRZZ', 'B201100034', '法人住址', 'XASGAJ.JG_JBXX j', 'j.FRZZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LXDH', 'B201100034', '联系电话', 'XASGAJ.JG_JBXX j', 'j.DWDH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRDB', 'B201100034', '法人代表', 'XASGAJ.JG_JBXX j', 'j.FRDB', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DWMC', 'B201100034', '单位名称', 'XASGAJ.JG_JBXX j', 'j.DWMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_BH', 'B201100023', '房屋编号', 'XASGAJ.DZ_CZFW t', 't.CZFW_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_ZZBH', 'B201100023', '房屋住址编号', 'XASGAJ.DZ_CZFW t', 't.CZFW_ZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYBH', 'B201100023', '房屋房主编号', 'XASGAJ.DZ_CZFW t', 't.CZFW_RYJGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_DJBH', 'B201100023', '房屋登记编号', 'XASGAJ.DZ_CZFW t', 't.CZFW_DJBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_SZQX', 'B201100023', '房屋所在区县', 'XASGAJ.DZ_CZFW t', 't.CZFW_SZQX', 'CHAR', '1', 'XZQH', null);
commit;
prompt 101 records committed...
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_SZXZ', 'B201100023', '房屋所在详址', 'XASGAJ.DZ_CZFW t', 't.CZFW_SZXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_SYR', 'B201100023', '房屋所有人', 'XASGAJ.DZ_CZFW t', 't.CZFW_SYR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_SYRPY', 'B201100023', '房屋所有人拼音', 'XASGAJ.DZ_CZFW t', 't.CZFW_SYRPY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_SYRCSRQ', 'B201100023', '房屋所有人出生日期', 'XASGAJ.DZ_CZFW t', 't.CZFW_SYRCSRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_SYRZH', 'B201100023', '房屋所有人证号', 'XASGAJ.DZ_CZFW t', 't.CZFW_SYRZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_CQDW', 'B201100023', '房屋产权单位', 'XASGAJ.DZ_CZFW t', 't.CZFW_CQDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_LXDH', 'B201100023', '房主联系电话', 'XASGAJ.DZ_CZFW t', 't.CZFW_LXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_DLR', 'B201100023', '房屋代理人', 'XASGAJ.DZ_CZFW t', 't.CZFW_DLR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_DLRLXFS', 'B201100023', '代理人联系方式', 'XASGAJ.DZ_CZFW t', 't.CZFW_DLRLXFS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_CQXZ', 'B201100023', '房屋产权性质', 'XASGAJ.DZ_CZFW t', 't.CZFW_CQXZ', 'CHAR', '1', 'FWCQXZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_GLJB', 'B201100023', '管理级别', 'XASGAJ.DZ_CZFW t', 't.CZFW_GLJB', 'CHAR', '1', 'GLJB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_SFXXY', 'B201100023', '是否信息员', 'XASGAJ.DZ_CZFW t', 't.CZFW_SFXXY', 'CHAR', '1', 'SFXXY', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_CZYT', 'B201100023', '出租用途', 'XASGAJ.DZ_CZFW t', 't.CZFW_CZYT', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_FWLX', 'B201100023', '房屋类型', 'XASGAJ.DZ_CZFW t', 't.CZFW_FWLX', 'CHAR', '1', 'FWLX', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_CZJS', 'B201100023', '出租间数', 'XASGAJ.DZ_CZFW t', 't.CZFW_CZJS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_CZMJ', 'B201100023', '出租面积', 'XASGAJ.DZ_CZFW t', 't.CZFW_CZMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_CZSJ', 'B201100023', '出租时间', 'XASGAJ.DZ_CZFW t', 't.CZFW_CZSJ', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_CZZZSJ', 'B201100023', '出租终止时间', 'XASGAJ.DZ_CZFW t', 't.CZFW_CZZZSJ', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_ZXYY', 'B201100023', '注销原因', 'XASGAJ.DZ_CZFW t', 't.CZFW_ZXYY', 'CHAR', '1', 'ZXYY', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_BZ', 'B201100023', '备注', 'XASGAJ.DZ_CZFW t', 't.CZFW_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CZFW_FWZT', 'B201100023', '房屋状态', 'XASGAJ.DZ_CZFW t', 't.CZFW_FWZT', 'CHAR', '1', 'FWZT', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CCODE', 'B201100018', '旅客编码', 'XASGAJ.T_CHREC', 'CCODE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XM', 'B201100018', '姓名', 'XASGAJ.T_CHREC', 'NAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NAMEPY', 'B201100018', '姓名拼音', 'XASGAJ.T_CHREC', 'NAMEPY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XB', 'B201100018', '性别', 'XASGAJ.T_CHREC', 'SEX', 'VARCHAR', '1', 'XB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CSRQ', 'B201100018', '出生日期', 'XASGAJ.T_CHREC', 'BDATE', 'CHAR_DATE', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NATION', 'B201100018', '民族', 'XASGAJ.T_CHREC', 'NATION', 'VARCHAR', '1', 'MZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('IDTYPE', 'B201100018', '证件类型', 'XASGAJ.T_CHREC', 'IDTYPE', 'VARCHAR', '1', 'GNZJ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GMSFHM', 'B201100018', '证件号码', 'XASGAJ.T_CHREC', 'IDCODE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XZQH', 'B201100018', '旅客省市县', 'XASGAJ.T_CHREC', 'XZQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ADDRESS', 'B201100018', '旅客详址', 'XASGAJ.T_CHREC', 'ADDRESS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LTIME', 'B201100018', '入住时间', 'XASGAJ.T_CHREC', 'LTIME', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NOROOM', 'B201100018', '入住房号', 'XASGAJ.T_CHREC', 'NOROOM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ETIME', 'B201100018', '退房时间', 'XASGAJ.T_CHREC', 'ETIME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('STIME', 'B201100018', '传送时间', 'XASGAJ.T_CHREC', 'STIME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CARDTYPE', 'B201100018', '信用卡类型', 'XASGAJ.T_CHREC', 'CARDTYPE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CARDNO', 'B201100018', '信用卡号码', 'XASGAJ.T_CHREC', 'CARDNO', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RTIME', 'B201100018', '接收时间', 'XASGAJ.T_CHREC', 'RTIME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('PICTURE', 'B201100018', '照片', 'XASGAJ.T_CHREC', 'PICTURE', 'BLOB', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GCODE', 'B201100018', '团队编码', 'XASGAJ.T_CHREC', 'GCODE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NOHOTEL', 'B201100018', '旅馆名称', 'XASGAJ.T_CHREC', 'NOHOTEL', 'VARCHAR', '1', 'LGMC', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CREATETIME', 'B201100018', '录入时间', 'XASGAJ.T_CHREC', 'CREATETIME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LWAITER', 'B201100018', '入住当班人', 'XASGAJ.T_CHREC', 'LWAITER', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('EWAITER', 'B201100018', '退房当班人', 'XASGAJ.T_CHREC', 'EWAITER', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FLAG', 'B201100018', '标识', 'XASGAJ.T_CHREC', 'FLAG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CSRQ', 'B201100023', '出生日期', 'XASGAJ.RY_JBXX d', 'd.CSRQ', 'CHAR_DATE', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XB', 'B201100023', '性       别', 'XASGAJ.RY_JBXX d', 'd.XB', 'CHAR', '1', 'XB', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XM', 'B201100023', '姓       名', 'XASGAJ.RY_JBXX d', 'd.XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GMSFHM', 'B201100023', '身份证号', 'XASGAJ.RY_JBXX d', 'd.GMSFHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_BH', 'B201100019', '寄住编号', 'XASGAJ.RY_JZXX', 'JZ_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYBH', 'B201100019', '人员编号', 'XASGAJ.RY_JZXX', 'JZ_RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_QTZZBH', 'B201100019', '其他住址编号', 'XASGAJ.RY_JZXX', 'JZ_QTZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_YHZGX', 'B201100019', '与户主关系', 'XASGAJ.RY_JZXX', 'JZ_YHZGX', 'VARCHAR', '1', 'RYGX', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_GMSFHM', 'B201100019', '公民身份号码', 'XASGAJ.RY_JZXX', 'JZ_GMSFHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_XM', 'B201100019', '姓名', 'XASGAJ.RY_JZXX', 'JZ_XM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_CSRQ', 'B201100019', '出生日期', 'XASGAJ.RY_JZXX', 'JZ_CSRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_ZZBH', 'B201100019', '住址编号', 'XASGAJ.RY_JZXX', 'JZ_ZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_JZDQH', 'B201100019', '住地区划', 'XASGAJ.RY_JZXX', 'JZ_JZDQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_JZDXZ', 'B201100019', '居住地详址', 'XASGAJ.RY_JZXX', 'JZ_JZDXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_HSJZBZ', 'B201100019', '何时寄住本址', 'XASGAJ.RY_JZXX', 'JZ_HSJZBZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_HYJZBZ', 'B201100019', '何因寄住本址', 'XASGAJ.RY_JZXX', 'JZ_HYJZBZ', 'VARCHAR', '1', 'JZYY', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_BZ', 'B201100019', '备注', 'XASGAJ.RY_JZXX', 'JZ_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_DJR', 'B201100019', '登记人', 'XASGAJ.RY_JZXX', 'JZ_DJR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JZ_DJSJ', 'B201100019', '登记日期', 'XASGAJ.RY_JZXX', 'JZ_DJSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDW_BH', 'B201100036', '机构编号', 'XASGAJ.ZA_SWDW t', 't.SWDW_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGBH', 'B201100036', '关联机构编号', 'XASGAJ.ZA_SWDW t', 't.SWDW_JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDW_LXR', 'B201100036', '机构联系人', 'XASGAJ.ZA_SWDW t', 't.SWDW_LXR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDW_SJBGDZ', 'B201100036', '实际办公地址', 'XASGAJ.ZA_SWDW t', 't.SWDW_SJBGDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDW_ZFZB', 'B201100036', '中方资本', 'XASGAJ.ZA_SWDW t', 't.SWDW_ZFZB', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDW_WFZB', 'B201100036', '外方资本', 'XASGAJ.ZA_SWDW t', 't.SWDW_WFZB', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDW_ZFTZDW', 'B201100036', '中方投资单位', 'XASGAJ.ZA_SWDW t', 't.SWDW_ZFTZDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDW_WFTZDW', 'B201100036', '外方投资单位', 'XASGAJ.ZA_SWDW t', 't.SWDW_WFTZDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDW_TZGJDQ', 'B201100036', '投资国家地区', 'XASGAJ.ZA_SWDW t', 't.SWDW_TZGJDQ', 'CHAR', '1', 'JGDQ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDW_QYQKJZ', 'B201100036', '企业情况记载', 'XASGAJ.ZA_SWDW t', 't.SWDW_QYQKJZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDW_ZXBS', 'B201100036', '注销标识', 'XASGAJ.ZA_SWDW t', 't.SWDW_ZXBS', 'CHAR', '1', 'ZXBS', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDW_ZXYY', 'B201100036', '注销原因', 'XASGAJ.ZA_SWDW t', 't.SWDW_ZXYY', 'VARCHAR', '1', 'ZXYY', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDW_ZXRQ', 'B201100036', '注销日期', 'XASGAJ.ZA_SWDW t', 't.SWDW_ZXRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDW_BZ', 'B201100036', '备注', 'XASGAJ.ZA_SWDW t', 't.SWDW_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRZZ', 'B201100036', '法人住址', 'XASGAJ.JG_JBXX j', 'j.FRZZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LXDH', 'B201100036', '联系电话', 'XASGAJ.JG_JBXX j', 'j.DWDH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRDB', 'B201100036', '法人代表', 'XASGAJ.JG_JBXX j', 'j.FRDB', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DWMC', 'B201100036', '单位名称', 'XASGAJ.JG_JBXX j', 'j.DWMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_BDBH', 'B201100016', '变动编号', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_BDBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYBH', 'B201100016', '人员编号', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_ZZBH', 'B201100016', '住址编号', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_QTZZBH', 'B201100016', '其他住址', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_QTZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZZBH', 'B201100016', '暂住证编号', 'XASGAJ.RY_ZKBD  z', 'z.ZZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GMSFHM', 'B201100016', '身份号码', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_GMSFHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XM', 'B201100016', '姓名', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_XM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_CYM', 'B201100016', '曾用名', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_CYM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XB', 'B201100016', '性别', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_XB', 'VARCHAR', '1', 'XB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_MZ', 'B201100016', '民族', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_MZ', 'VARCHAR', '1', 'MZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CSRQ', 'B201100016', '出生日期', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_CSRQ', 'CHAR_DATE', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_WHCD', 'B201100016', '文化程度', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_WHCD', 'VARCHAR', '1', 'WHCD', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_ZZMM', 'B201100016', '政治面貌', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZZMM', 'VARCHAR', '1', 'ZZMM', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_HYZK', 'B201100016', '婚姻状况', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_HYZK', 'VARCHAR', '1', 'HYZK', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_HJDQH', 'B201100016', '户籍省市县', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_HJDQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_HJXZ', 'B201100016', '户籍详址', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_HJXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_ZRQ', 'B201100016', '责任区', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_DDSJ', 'B201100016', '到达时间', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_DDSJ', 'VARCHAR', null, null, null);
commit;
prompt 201 records committed...
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_ZZSY', 'B201100016', '暂住事由', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZZSY', 'VARCHAR', '1', 'ZZSY', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_YZY', 'B201100016', '原职业', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_YZY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_YZYLB', 'B201100016', '原职业类别', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_YZYLB', 'VARCHAR', '1', 'ZYLB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_XZY', 'B201100016', '现职业', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_XZY', 'VARCHAR', '1', 'ZYLB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_ZYLB', 'B201100016', '职业类别', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZYLB', 'VARCHAR', '1', 'ZYLB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_ZZCS', 'B201100016', '暂住处所', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZZCS', 'VARCHAR', '1', 'ZZCS', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_FWCS', 'B201100016', '服务处所', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_FWCS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_JYZM', 'B201100016', '就业证明', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_JYZM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_ZZDZAZRRXM', 'B201100016', '暂住地治安责任人姓名', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZZDZAZRRXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_GZDZAZRRXM', 'B201100016', '工作地治安责任人姓名', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_GZDZAZRRXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_FZRGDDH', 'B201100016', '工作地负责人固定电话', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_FZRGDDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_FZRYDDH', 'B201100016', '工作地负责人移动电话', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_FZRYDDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_JZZBL', 'B201100016', '居住证办理情况', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_JZZBL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_QFRQ', 'B201100016', '签发日期', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_QFRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_YXQX', 'B201100016', '有效期限', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_YXQX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_ZZZYXJZSJ', 'B201100016', '有效期截止日期', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZZZYXJZSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_DJDW', 'B201100016', '暂住人员登记单位', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_DJDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_DJR', 'B201100016', '暂住人员登记人', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_DJR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZRY_DJSJ', 'B201100016', '暂住人员登记日期', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_DJSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_JGBH', 'B201100035', '公司编号', 'XASGAJ.ZA_BAGS', 'BAGS_JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_DWMC', 'B201100035', '公司名称', 'XASGAJ.ZA_BAGS', 'BAGS_DWMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_GSDM', 'B201100035', '公司代码', 'XASGAJ.ZA_BAGS', 'BAGS_GSDM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_DWCZ', 'B201100035', '公司传真', 'XASGAJ.ZA_BAGS', 'BAGS_DWCZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_DWDH', 'B201100035', '公司电话', 'XASGAJ.ZA_BAGS', 'BAGS_DWDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_DWDZYX', 'B201100035', '公司电子邮箱', 'XASGAJ.ZA_BAGS', 'BAGS_DWDZYX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_GLFW', 'B201100035', '管理范围', 'XASGAJ.ZA_BAGS', 'BAGS_GLFW', 'VARCHAR', '1', 'PZGW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_FRDB', 'B201100035', '代表人', 'XASGAJ.ZA_BAGS', 'BAGS_FRDB', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_FRSFZHM', 'B201100035', '法定代表人身份证号', 'XASGAJ.ZA_BAGS', 'BAGS_FRSFZHM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_FRLXDH', 'B201100035', '法定代表人联系电话', 'XASGAJ.ZA_BAGS', 'BAGS_FRLXDH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_FRZZ', 'B201100035', '法定代表人住址', 'XASGAJ.ZA_BAGS', 'BAGS_FRZZ', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_ZGBM', 'B201100035', '主管部门名称', 'XASGAJ.ZA_BAGS', 'BAGS_ZGBM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_FZR', 'B201100035', '主管部门负责人', 'XASGAJ.ZA_BAGS', 'BAGS_FZR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_ZW', 'B201100035', '主管部门负责职务', 'XASGAJ.ZA_BAGS', 'BAGS_ZW', 'CHAR', '1', 'BAZGZW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_FZRDH', 'B201100035', '主管部门负责人电话', 'XASGAJ.ZA_BAGS', 'BAGS_FZRDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_GLRYS', 'B201100035', '管理人员数', 'XASGAJ.ZA_BAGS', 'BAGS_GLRYS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_ZBFBQ', 'B201100035', '装备防暴枪', 'XASGAJ.ZA_BAGS', 'BAGS_ZBFBQ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_ZBXJG', 'B201100035', '装备橡胶棍', 'XASGAJ.ZA_BAGS', 'BAGS_ZBXJG', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_ZBYCC', 'B201100035', '装备运钞车', 'XASGAJ.ZA_BAGS', 'BAGS_ZBYCC', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_ZPRY', 'B201100035', '招聘保安人数', 'XASGAJ.ZA_BAGS', 'BAGS_ZPRY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_JGZCH', 'B201100035', '注册号', 'XASGAJ.ZA_BAGS', 'BAGS_JGZCH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_BAGS_ZCRQ', 'B201100035', '注册日期', 'XASGAJ.ZA_BAGS', 'BAGS_BAGS_ZCRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_ZCQH', 'B201100035', '注册区划', 'XASGAJ.ZA_BAGS', 'BAGS_ZCQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_ZCDZ', 'B201100035', '注册地址', 'XASGAJ.ZA_BAGS', 'BAGS_ZCDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_JGZCXZ', 'B201100035', '注册详址', 'XASGAJ.ZA_BAGS', 'BAGS_JGZCXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_YXQX', 'B201100035', '有效期限', 'XASGAJ.ZA_BAGS', 'BAGS_YXQX', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_JGSSXQ', 'B201100035', '省市县区', 'XASGAJ.ZA_BAGS', 'BAGS_JGSSXQ', 'CHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_JGJLX', 'B201100035', '街路巷', 'XASGAJ.ZA_BAGS', 'BAGS_JGJLX', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_JGMLPH', 'B201100035', '门楼牌号', 'XASGAJ.ZA_BAGS', 'BAGS_JGMLPH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_JGMLXZ', 'B201100035', '门楼详址', 'XASGAJ.ZA_BAGS', 'BAGS_JGMLXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_JGMPHZ', 'B201100035', '门牌后缀', 'XASGAJ.ZA_BAGS', 'BAGS_JGMPHZ', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_JGDZ', 'B201100035', '详细地址', 'XASGAJ.ZA_BAGS', 'BAGS_JGDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_YZBH', 'B201100035', '邮政编码', 'XASGAJ.ZA_BAGS', 'BAGS_YZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_SZZRQ', 'B201100035', '所属责任区', 'XASGAJ.ZA_BAGS', 'BAGS_SZZRQ', 'CHAR', '1', 'DW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_XFDJ', 'B201100035', '消防等级 ', 'XASGAJ.ZA_BAGS', 'BAGS_XFDJ', 'CHAR', '1', 'XFDJ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_DWXZ', 'B201100035', '单位性质 ', 'XASGAJ.ZA_BAGS', 'BAGS_DWXZ', 'CHAR', '1', 'DWXZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_BGQK', 'B201100035', '变更情况 ', 'XASGAJ.ZA_BAGS', 'BAGS_BGQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BAGS_BZ', 'B201100035', '备注', 'XASGAJ.ZA_BAGS', 'BAGS_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_ZYGZQK', 'B201100024', '主要工作情况', 'XASGAJ.ZA_BARY t', 't.BARY_ZYGZQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_RYXZ', 'B201100024', '人员性质', 'XASGAJ.ZA_BARY t', 't.BARY_RYXZ', 'CHAR', '1', 'BARYXZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_DWDZ', 'B201100024', '派驻单位地址', 'XASGAJ.ZA_BARY t', 't.BARY_DWDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_JLX', 'B201100024', '派驻单位街路巷', 'XASGAJ.ZA_BARY t', 't.BARY_JLX', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_SSXQ', 'B201100024', '派驻单位省市县区', 'XASGAJ.ZA_BARY t', 't.BARY_SSXQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_PZDW', 'B201100024', '派驻单位', 'XASGAJ.ZA_BARY t', 't.BARY_PZDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_PZGW', 'B201100024', '派驻岗位', 'XASGAJ.ZA_BARY t', 't.BARY_PZGW', 'CHAR', '1', 'PZGW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_HCPX', 'B201100024', '在何处培训', 'XASGAJ.ZA_BARY t', 't.BARY_HCPX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_HSPX', 'B201100024', '在何时培训', 'XASGAJ.ZA_BARY t', 't.BARY_HSPX', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_GJZC', 'B201100024', '国家职业标准职称', 'XASGAJ.ZA_BARY t', 't.BARY_GJZC', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_XHPBH', 'B201100024', '胸号牌编号', 'XASGAJ.ZA_BARY t', 't.BARY_XHPBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_SGZBH', 'B201100024', '上岗证编号', 'XASGAJ.ZA_BARY t', 't.BARY_SGZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_ZGZBH', 'B201100024', '资格证编号', 'XASGAJ.ZA_BARY t', 't.BARY_ZGZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_CZPX', 'B201100024', '人员持证培训', 'XASGAJ.ZA_BARY t', 't.BARY_CZPX', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZBH', 'B201100024', '住址编号', 'XASGAJ.ZA_BARY t', 't.ZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYBH', 'B201100024', '人员编号', 'XASGAJ.ZA_BARY t', 't.BARY_RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_GSBH', 'B201100024', '公司编号', 'XASGAJ.ZA_BARY t', 't.BARY_GSBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARY_BH', 'B201100024', '人员编号', 'XASGAJ.ZA_BARY t', 't.BARY_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XZZ', 'B201100024', '现住址', 'XASGAJ.ZA_BARY t', 't.XZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XB', 'B201100024', '性       别', 'XASGAJ.RY_JBXX d', 'd.XB', 'CHAR', '1', 'XB', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XM', 'B201100024', '姓       名', 'XASGAJ.RY_JBXX d', 'd.XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GMSFHM', 'B201100024', '身份证号', 'XASGAJ.RY_JBXX d', 'd.GMSFHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CSRQ', 'B201100024', '出生日期', 'XASGAJ.RY_JBXX d', 'd.CSRQ', 'CHAR_DATE', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_BH', 'B201100037', '内保编号', 'XASGAJ.ZA_NBDW t', 't.NBDW_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGBH', 'B201100037', '内保机构编号', 'XASGAJ.ZA_NBDW t', 't.NBDW_JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_DWXZ', 'B201100037', '单位性质', 'XASGAJ.ZA_NBDW t', 't.NBDW_DWXZ', 'CHAR', '1', 'NBJGXZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_DWLLR', 'B201100037', '单位联络人', 'XASGAJ.ZA_NBDW t', 't.NBDW_DWLLR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_JFQK', 'B201100037', '技防情况', 'XASGAJ.ZA_NBDW t', 't.NBDW_JFQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_ZDGAJG', 'B201100037', '驻地公安机关', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZDGAJG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_WWXX', 'B201100037', '维稳信息', 'XASGAJ.ZA_NBDW t', 't.NBDW_WWXX', 'CHAR', '1', 'WWXX', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_GLBM', 'B201100037', '管理部门', 'XASGAJ.ZA_NBDW t', 't.NBDW_GLBM', 'CHAR', '1', 'NBGLBM', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_BWJGSZ', 'B201100037', '保卫机构设置', 'XASGAJ.ZA_NBDW t', 't.NBDW_BWJGSZ', 'CHAR', '1', 'BWJGSZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_SCJYZK', 'B201100037', '生产经营状况', 'XASGAJ.ZA_NBDW t', 't.NBDW_SCJYZK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_ZYBWS', 'B201100037', '重要部位级别', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZYBWS', 'CHAR', '1', 'ZYBWJB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_YHBWS', 'B201100037', '要害部位数', 'XASGAJ.ZA_NBDW t', 't.NBDW_YHBWS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_ZDDJ', 'B201100037', '重点等级', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZDDJ', 'CHAR', '1', 'ZDDJ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_PDYJ', 'B201100037', '判定依据', 'XASGAJ.ZA_NBDW t', 't.NBDW_PDYJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_NLR', 'B201100037', '年利润', 'XASGAJ.ZA_NBDW t', 't.NBDW_NLR', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_NXSE', 'B201100037', '年销售额', 'XASGAJ.ZA_NBDW t', 't.NBDW_NXSE', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_ZGZGS', 'B201100037', '在岗职工数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZGZGS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_XGZGS', 'B201100037', '下岗职工数', 'XASGAJ.ZA_NBDW t', 't.NBDW_XGZGS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_WYGS', 'B201100037', '外用工数', 'XASGAJ.ZA_NBDW t', 't.NBDW_WYGS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_WJSSYGS', 'B201100037', '外籍师生员工数', 'XASGAJ.ZA_NBDW t', 't.NBDW_WJSSYGS', 'NUMBER', null, null, null);
commit;
prompt 301 records committed...
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_ZGXSRS', 'B201100037', '职工学生人数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZGXSRS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_GATSSYGS', 'B201100037', '港澳台师生员工数', 'XASGAJ.ZA_NBDW t', 't.NBDW_GATSSYGS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_JCSSMZSSYGS', 'B201100037', '疆藏少数民族师生员工数', 'XASGAJ.ZA_NBDW t', 't.NBDW_JCSSMZSSYGS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_BWZZLB', 'B201100037', '保卫组织类别', 'XASGAJ.ZA_NBDW t', 't.NBDW_BWZZLB', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_BWBMFZR', 'B201100037', '保卫部门负责人', 'XASGAJ.ZA_NBDW t', 't.NBDW_BWBMFZR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_ZZBWGBS', 'B201100037', '专职保卫干部数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZZBWGBS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_JZBWGBS', 'B201100037', '兼职保卫干部数', 'XASGAJ.ZA_NBDW t', 't.NBDW_JZBWGBS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_JJS', 'B201100037', '经警数', 'XASGAJ.ZA_NBDW t', 't.NBDW_JJS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_BAS', 'B201100037', '保安数', 'XASGAJ.ZA_NBDW t', 't.NBDW_BAS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_HWLL', 'B201100037', '护卫力量', 'XASGAJ.ZA_NBDW t', 't.NBDW_HWLL', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_HWQS', 'B201100037', '护卫犬数', 'XASGAJ.ZA_NBDW t', 't.NBDW_HWQS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_QDZAZRSSJ', 'B201100037', '签订治安责任书日期', 'XASGAJ.ZA_NBDW t', 't.NBDW_QDZAZRSSJ', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_YWYJZB', 'B201100037', '有无夜间值班', 'XASGAJ.ZA_NBDW t', 't.NBDW_YWYJZB', 'CHAR', '1', 'YW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_ZBDTS', 'B201100037', '装备电台数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZBDTS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_ZBJGS', 'B201100037', '装备警棍数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZBJGS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_ZBMTCS', 'B201100037', '装备摩托车数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZBMTCS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NBDW_ZBQCS', 'B201100037', '装备汽车数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZBQCS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRSFZH', 'B201100037', '法人身份证号', 'XASGAJ.JG_JBXX j', 'j.FRSFZHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRZZ', 'B201100037', '法人住址', 'XASGAJ.JG_JBXX j', 'j.FRZZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LXDH', 'B201100037', '联系电话', 'XASGAJ.JG_JBXX j', 'j.DWDH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRDB', 'B201100037', '法人代表', 'XASGAJ.JG_JBXX j', 'j.FRDB', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DWMC', 'B201100037', '单位名称', 'XASGAJ.JG_JBXX j', 'j.DWMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YYCSDM', 'B201100025', '单位代码', 'XASGAJ.JG_WBSWRYXX t', 't.YYCSDM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YYCSMC', 'B201100025', '网吧名称', 'XASGAJ.JG_WBSWRYXX t', 't.YYCSMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DZQH', 'B201100025', '地址区划', 'XASGAJ.JG_WBSWRYXX t', 't.DZQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DZ', 'B201100025', '人员地址', 'XASGAJ.JG_WBSWRYXX t', 't.DZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWRYXM', 'B201100025', '姓名', 'XASGAJ.JG_WBSWRYXX t', 't.SWRYXM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZJLX', 'B201100025', '证件类型', 'XASGAJ.JG_WBSWRYXX t', 't.ZJLX', 'VARCHAR', '1', 'LKZJLX', 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZJHM', 'B201100025', '证件号码', 'XASGAJ.JG_WBSWRYXX t', 't.ZJHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FZJGMC', 'B201100025', '发证机构名称', 'XASGAJ.JG_WBSWRYXX t', 't.FZJGMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWKSSJ', 'B201100025', '上网开始时间', 'XASGAJ.JG_WBSWRYXX t', 't.SWKSSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XWSJ', 'B201100025', '下网时间', 'XASGAJ.JG_WBSWRYXX t', 't.XWSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWZDH', 'B201100025', '上网座位号', 'XASGAJ.JG_WBSWRYXX t', 't.SWZDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DWMC', 'B201100025', '单位名称', 'XASGAJ.JG_WBXX d', 'd.YYCSMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJBH', 'B201100029', '案件编号', 'XASGAJ.AJ_JBXX', 'AJBH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARXM', 'B201100029', '报案人姓名', 'XASGAJ.AJ_JBXX', 'BARXM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARXB', 'B201100029', '报案人性别', 'XASGAJ.AJ_JBXX', 'BARXB', 'CHAR', '1', 'XB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARCSRQ', 'B201100029', '报案人出生日期', 'XASGAJ.AJ_JBXX', 'BARCSRQ', 'CHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARZJZL', 'B201100029', '报案人证件种类', 'XASGAJ.AJ_JBXX', 'BARZJZL', 'CHAR', '1', 'ZJZL', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARZJHM', 'B201100029', '报案人证件号码', 'XASGAJ.AJ_JBXX', 'BARZJHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARDW', 'B201100029', '报案人单位', 'XASGAJ.AJ_JBXX', 'BARDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARLXFS', 'B201100029', '报案人联系方式', 'XASGAJ.AJ_JBXX', 'BARLXFS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARZZ', 'B201100029', '报案人住址', 'XASGAJ.AJ_JBXX', 'BARZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARBMJB', 'B201100029', '报案人保密级别', 'XASGAJ.AJ_JBXX', 'BARBMJB', 'CHAR', '1', 'BMJB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJZT', 'B201100029', '案件状态', 'XASGAJ.AJ_JBXX', 'AJZT', 'CHAR', '1', 'AJZT', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJMC', 'B201100029', '案件名称', 'XASGAJ.AJ_JBXX', 'AJMC', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('MJ', 'B201100029', '案件密级', 'XASGAJ.AJ_JBXX', 'MJ', 'CHAR', '1', 'MJ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJLB', 'B201100029', '案件类别', 'XASGAJ.AJ_JBXX', 'AJLB', 'CHAR', '1', 'AJLB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJWAB', 'B201100029', '案件副案别', 'XASGAJ.AJ_JBXX', 'AJWAB', 'CHAR', '1', 'FAB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJXZ', 'B201100029', '案件性质', 'XASGAJ.AJ_JBXX', 'AJXZ', 'CHAR', '1', 'AJXZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJSX', 'B201100029', '案件属性', 'XASGAJ.AJ_JBXX', 'AJSX', 'CHAR', '1', 'AJSX', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJLY', 'B201100029', '案件来源', 'XASGAJ.AJ_JBXX', 'AJLY', 'CHAR', '1', 'AJLY', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BASJ', 'B201100029', '报案时间', 'XASGAJ.AJ_JBXX', 'BASJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_XXBH', 'B201100041', '信息编号', 'XASGAJ.ZA_PCRYXX', 'RYPC_XXBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_BH', 'B201100041', '盘查编号', 'XASGAJ.ZA_PCRYXX', 'RYPC_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_RYBH', 'B201100041', '人员编号', 'XASGAJ.ZA_PCRYXX', 'RYPC_RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_XM', 'B201100041', '姓名', 'XASGAJ.ZA_PCRYXX', 'RYPC_XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XB', 'B201100041', '性别', 'XASGAJ.ZA_PCRYXX', 'RYPC_XB', 'CHAR', '1', 'XB', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_MZ', 'B201100041', '民族', 'XASGAJ.ZA_PCRYXX', 'RYPC_MZ', 'CHAR', '1', 'MZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_CSRQ', 'B201100041', '出生日期', 'XASGAJ.ZA_PCRYXX', 'RYPC_CSRQ', 'CHAR_DATE', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_GMSFHM', 'B201100041', '身份证号', 'XASGAJ.ZA_PCRYXX', 'RYPC_GMSFHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_ZJZL', 'B201100041', '证件种类', 'XASGAJ.ZA_PCRYXX', 'RYPC_ZJZL', 'CHAR', '1', 'ZJZL', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_ZJHM', 'B201100041', '证件号码', 'XASGAJ.ZA_PCRYXX', 'RYPC_ZJHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_JSZH', 'B201100041', '驾驶证号', 'XASGAJ.ZA_PCRYXX', 'RYPC_JSZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_XZZ', 'B201100041', '现住址', 'XASGAJ.ZA_PCRYXX', 'RYPC_XZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_JGBH', 'B201100020', '关联机构编号', 'XASGAJ.JG_CYRY  t', 't.CYRY_JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_ZZBH', 'B201100020', '住址编号', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_XZZ', 'B201100020', '现住址', 'XASGAJ.JG_CYRY  t', 't.CYRY_XZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_SX', 'B201100020', '人员属性', 'XASGAJ.JG_CYRY  t', 't.CYRY_SX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_BMMC', 'B201100020', '部门名称', 'XASGAJ.JG_CYRY  t', 't.CYRY_BMMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_ZW', 'B201100020', '人员职务', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZW', 'VARCHAR', '1', 'ZW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_YM', 'B201100020', '人员艺名', 'XASGAJ.JG_CYRY  t', 't.CYRY_YM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_SJ', 'B201100020', '人员手机', 'XASGAJ.JG_CYRY  t', 't.CYRY_SJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_QTLXDH', 'B201100020', '其他联系电话', 'XASGAJ.JG_CYRY  t', 't.CYRY_QTLXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_RYLB', 'B201100041', '人员类别', 'XASGAJ.ZA_PCRYXX', 'RYPC_RYLB', 'CHAR', '1', 'RYLB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_XXBH', 'B201100027', '车信息编号', 'XASGAJ.ZA_PCRYXX', 'CLPC_XXBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_CLJG', 'B201100041', '处理结果', 'XASGAJ.ZA_PCRYXX', 'RYPC_CLJG', 'CHAR', '1', 'CLJG', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_CPH', 'B201100027', '车牌号', 'XASGAJ.ZA_PCCLXX', 'CLPC_CPH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_CJH', 'B201100027', '车辆车架号', 'XASGAJ.ZA_PCCLXX', 'CLPC_CJH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_FDJH', 'B201100027', '发动机号', 'XASGAJ.ZA_PCCLXX', 'CLPC_FDJH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_XSZH', 'B201100027', '行驶证号', 'XASGAJ.ZA_PCCLXX', 'CLPC_XSZH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_CLLX', 'B201100027', '车辆类型', 'XASGAJ.ZA_PCCLXX', 'CLPC_CLLX', 'CHAR', '1', 'CLLX', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_CLYS', 'B201100027', '车辆颜色', 'XASGAJ.ZA_PCCLXX', 'CLPC_CLYS', 'CHAR', '1', 'CLYS', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_CLPP', 'B201100027', '车辆品牌', 'XASGAJ.ZA_PCCLXX', 'CLPC_CLPP', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_TBBS', 'B201100027', '图标标识', 'XASGAJ.ZA_PCCLXX', 'CLPC_TBBS', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_CZRS', 'B201100027', '车载人数', 'XASGAJ.ZA_PCCLXX', 'CLPC_CZRS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_CLJG', 'B201100027', '处理结果', 'XASGAJ.ZA_PCCLXX', 'CLPC_CLJG', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_BZ', 'B201100027', '车辆备注', 'XASGAJ.ZA_PCCLXX', 'CLPC_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYPC_BZ', 'B201100041', '备注', 'XASGAJ.ZA_PCRYXX', 'RYPC_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJBH', 'B201100030', '案件编号', 'XASGAJ.AJ_JBXX', 'AJBH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARXM', 'B201100030', '报案人姓名', 'XASGAJ.AJ_JBXX', 'BARXM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARXB', 'B201100030', '报案人性别', 'XASGAJ.AJ_JBXX', 'BARXB', 'CHAR', '1', 'XB', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARCSRQ', 'B201100030', '报案人出生日期', 'XASGAJ.AJ_JBXX', 'BARCSRQ', 'CHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARZJZL', 'B201100030', '报案人证件种类', 'XASGAJ.AJ_JBXX', 'BARZJZL', 'CHAR', '1', 'ZJZL', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARZJHM', 'B201100030', '报案人证件号码', 'XASGAJ.AJ_JBXX', 'BARZJHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARDW', 'B201100030', '报案人单位', 'XASGAJ.AJ_JBXX', 'BARDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARLXFS', 'B201100030', '报案人联系方式', 'XASGAJ.AJ_JBXX', 'BARLXFS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARZZ', 'B201100030', '报案人住址', 'XASGAJ.AJ_JBXX', 'BARZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BARBMJB', 'B201100030', '报案人保密级别', 'XASGAJ.AJ_JBXX', 'BARBMJB', 'CHAR', '1', 'BMJB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJZT', 'B201100030', '案件状态', 'XASGAJ.AJ_JBXX', 'AJZT', 'CHAR', '1', 'AJZT', null);
commit;
prompt 401 records committed...
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJMC', 'B201100030', '案件名称', 'XASGAJ.AJ_JBXX', 'AJMC', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('MJ', 'B201100030', '案件密级', 'XASGAJ.AJ_JBXX', 'MJ', 'CHAR', '1', 'MJ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJLB', 'B201100030', '案件类别', 'XASGAJ.AJ_JBXX', 'AJLB', 'CHAR', '1', 'AJLB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJWAB', 'B201100030', '案件副案别', 'XASGAJ.AJ_JBXX', 'AJWAB', 'CHAR', '1', 'FAB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJXZ', 'B201100030', '案件性质', 'XASGAJ.AJ_JBXX', 'AJXZ', 'CHAR', '1', 'AJXZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJSX', 'B201100030', '案件属性', 'XASGAJ.AJ_JBXX', 'AJSX', 'CHAR', '1', 'AJSX', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJLY', 'B201100030', '案件来源', 'XASGAJ.AJ_JBXX', 'AJLY', 'CHAR', '1', 'AJLY', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BASJ', 'B201100030', '报案时间', 'XASGAJ.AJ_JBXX', 'BASJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZTRYBH', 'B201100022', '人员编号', 'XASGAJ.ZTRYXX', 'ZTRYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZTXM', 'B201100022', '姓名', 'XASGAJ.ZTRYXX', 'ZTXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZTXB', 'B201100022', '性别', 'XASGAJ.ZTRYXX', 'ZTXB', 'VARCHAR', '1', 'XB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZTCSRQ', 'B201100022', '出生日期', 'XASGAJ.ZTRYXX', 'ZTCSRQ', 'CHAR_DATE', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SFZHSB', 'B201100022', '身份证号', 'XASGAJ.ZTRYXX', 'SFZHSB', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('HJDQH', 'B201100022', '户籍地区号', 'XASGAJ.ZTRYXX', 'HJDQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('HJDXZ', 'B201100022', '户籍地详址', 'XASGAJ.ZTRYXX', 'HJDXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZTJYAQ', 'B201100022', '简要案情', 'XASGAJ.ZTRYXX', 'ZTJYAQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LADQ', 'B201100022', '立案地区', 'XASGAJ.ZTRYXX', 'LADQ', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LADW', 'B201100022', '立案单位', 'XASGAJ.ZTRYXX', 'LADW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZTXZQX', 'B201100022', '籍贯', 'XASGAJ.ZTRYXX', 'ZTXZQX', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZTXZXZ', 'B201100022', '籍贯详址', 'XASGAJ.ZTRYXX', 'ZTXZXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZTZC', 'B201100022', '专长', 'XASGAJ.ZTRYXX', 'ZTZC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZTJYJL', 'B201100022', '简要经历', 'XASGAJ.ZTRYXX', 'ZTJYJL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZTRQ', 'B201100022', '在逃日期', 'XASGAJ.ZTRYXX', 'ZTRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DBJB', 'B201100022', '督捕级别', 'XASGAJ.ZTRYXX', 'DBJB', 'VARCHAR', '1', 'DBJB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('AJLB', 'B201100022', '案件类别', 'XASGAJ.ZTRYXX', 'AJLB', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_BH', 'B201100020', '从业人员编号', 'XASGAJ.JG_CYRY  t', 't.CYRY_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RAS', 'B201100020', '提取标识', 'XASGAJ.JG_CYRY  t', 't.RAS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_ZSQK', 'B201100020', '政审情况', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZSQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_PCSYJ', 'B201100020', '派出所意见', 'XASGAJ.JG_CYRY  t', 't.CYRY_PCSYJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_PXZH', 'B201100020', '培训证号', 'XASGAJ.JG_CYRY  t', 't.CYRY_PXZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_PXZS', 'B201100020', '培训证书', 'XASGAJ.JG_CYRY  t', 't.CYRY_PXZS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_ZXYY', 'B201100020', '注销原因', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZXYY', 'VARCHAR', '1', 'ZXYY', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_ZXBS', 'B201100020', '注销标识', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZXBS', 'VARCHAR', '1', 'ZXBS', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_ZXRQ', 'B201100020', '注销日期', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZXRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_ZDFWDXLB', 'B201100020', '重点服务对象类别', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZDFWDXLB', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_BWCS', 'B201100020', '重点服务对象保卫措施', 'XASGAJ.JG_CYRY  t', 't.CYRY_BWCS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_ZYGX', 'B201100020', '重点服务对象主要贡献', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZYGX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_ZDRTLB', 'B201100020', '重点人头类别', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZDRTLB', 'VARCHAR', '1', 'ZDRTLB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_KZCS', 'B201100020', '重点人头控制措施', 'XASGAJ.JG_CYRY  t', 't.CYRY_KZCS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_ZYWT', 'B201100020', '重点人头主要问题', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZYWT', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_BZ', 'B201100020', '备注', 'XASGAJ.JG_CYRY  t', 't.CYRY_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_DJRQ', 'B201100020', '登记日期', 'XASGAJ.JG_CYRY  t', 't.CYRY_DJRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_SHYX', 'B201100020', '状态是否有效', 'XASGAJ.JG_CYRY  t', 't.CYRY_SHYX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRY_SHXJ', 'B201100020', '状态是否新建', 'XASGAJ.JG_CYRY  t', 't.CYRY_SHXJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GMSFHM', 'B201100020', '身份号码 ', 'XASGAJ.RY_JBXX  c', 'c.GMSFHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XM', 'B201100020', '姓名', 'XASGAJ.RY_JBXX  c', 'c.XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XB', 'B201100020', '性别', 'XASGAJ.RY_JBXX  c', 'c.XB', 'VARCHAR', '1', 'XB', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NLD', 'B201100020', '年龄段', 'XASGAJ.RY_JBXX  c', 'c.CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CSRQ', 'B201100020', '出生日期', 'XASGAJ.RY_JBXX  c', 'c.CSRQ', 'CHAR_DATE', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GMSFHM', 'B201100019', '身份号码 ', 'XASGAJ.RY_JBXX  c', 'c.GMSFHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XM', 'B201100019', '姓名', 'XASGAJ.RY_JBXX  c', 'c.XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XB', 'B201100019', '性别', 'XASGAJ.RY_JBXX  c', 'c.XB', 'VARCHAR', '1', 'XB', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NLD', 'B201100019', '年龄段', 'XASGAJ.RY_JBXX  c', 'c.CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CSRQ', 'B201100019', '出生日期', 'XASGAJ.RY_JBXX  c', 'c.CSRQ', 'CHAR_DATE', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZBR', 'B201100029', '主办人', 'XASGAJ.AJ_JBXX', 'ZBR', 'CHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SLR', 'B201100029', '受理人', 'XASGAJ.AJ_JBXX', 'SLR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SLDW', 'B201100029', '受理单位', 'XASGAJ.AJ_JBXX', 'SLDW', 'CHAR', '1', 'DW', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('PADW', 'B201100029', '破案单位', 'XASGAJ.AJ_JBXX', 'PADW', 'CHAR', '1', 'DW', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LADW', 'B201100029', '立案单位', 'XASGAJ.AJ_JBXX', 'LADW', 'CHAR', '1', 'DW', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XBR', 'B201100029', '协办人', 'XASGAJ.AJ_JBXX', 'XBR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZBDW', 'B201100029', '主办单位', 'XASGAJ.AJ_JBXX', 'ZBDW', 'CHAR', '1', 'DW', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('PADW', 'B201100030', '破案单位', 'XASGAJ.AJ_JBXX', 'PADW', 'CHAR', '1', 'DW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LADW', 'B201100030', '立案单位', 'XASGAJ.AJ_JBXX', 'LADW', 'CHAR', '1', 'DW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XBR', 'B201100030', '协办人', 'XASGAJ.AJ_JBXX', 'XBR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZBDW', 'B201100030', '主办单位', 'XASGAJ.AJ_JBXX', 'ZBDW', 'CHAR', '1', 'DW', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZBR', 'B201100030', '主办人', 'XASGAJ.AJ_JBXX', 'ZBR', 'CHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SLR', 'B201100030', '受理人', 'XASGAJ.AJ_JBXX', 'SLR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SLDW', 'B201100030', '受理单位', 'XASGAJ.AJ_JBXX', 'SLDW', 'CHAR', '1', 'DW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_ZSBH', 'B201100021', '住宿编号', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZSBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYBH', 'B201100021', '人员编号', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_RYGLBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_ZZGLBH', 'B201100021', '住址编号', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZZGLBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_DDRQ', 'B201100021', '抵达日期', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_DDRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_LKRQ', 'B201100021', '离开日期', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LKRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_RYSF', 'B201100021', '人员身份', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_RYSF', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_LXDH', 'B201100021', '联系电话', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_HCLGL', 'B201100021', '何处来国内', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_HCLGL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_HCQGL', 'B201100021', '何处去国内', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_HCQGL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_HCLGW', 'B201100021', '何处来国外', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_HCLGW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_HCQGW', 'B201100021', '何处去国外', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_HCQGW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_ZSDW', 'B201100021', '住宿单位代码', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZSDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_FH', 'B201100021', '住宿房号', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_FH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_DJDWXZQH', 'B201100021', '登记单位行政区划', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_DJDWXZQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_DJDWDM', 'B201100021', '住宿登记单位代码', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_DJDWDM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_DJDWMC', 'B201100021', '住宿登记单位名称', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_DJDWMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_ZXSJ', 'B201100021', '注销时间', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZXSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_ZXYY', 'B201100021', '注销原因', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZXYY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_BZ', 'B201100021', '备注', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_LZSHGW', 'B201100021', '何处去的地区是否国外', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LZSHGW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_LZSHGL', 'B201100021', '何处来的地区是否国外', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LZSHGL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_LSZSXZZ', 'B201100021', '住宿详细住址', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LSZSXZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_JDDW', 'B201100021', '接待单位l.人', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_JDDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_LSDWDH', 'B201100021', '留宿单位电话', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LSDWDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_LSDW', 'B201100021', '留宿单位l.户主', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LSDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_QQGX', 'B201100021', '亲属关系代码', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_QQGX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_SHZSBG', 'B201100021', '是否住宿宾馆', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_SHZSBG', 'VARCHAR', '1', 'SFZBG', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_DJDWLX', 'B201100021', '登记单位类型', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_DJDWLX', 'VARCHAR', '1', 'DJDWLX', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_ZHGZDM', 'B201100021', '在华工作机构代码', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZHGZDM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_ZHGZMC', 'B201100021', '在华工作机构名称', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZHGZMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_ZFLX', 'B201100021', '住房类型', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZFLX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_FZGMSFHM', 'B201100021', '房主身份证号码', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_FZGMSFHM', 'VARCHAR', null, null, null);
commit;
prompt 501 records committed...
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_FZDH', 'B201100021', '房主电话', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_FZDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_JJLXR', 'B201100021', '紧急情况下联系人', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_JJLXR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_JJLXDH', 'B201100021', '紧急情况下联系电话', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_JJLXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LSZS_DJSJ', 'B201100021', '登记时间', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_DJSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XM', 'B201100021', '中文姓名', 'XASGAJ.RY_JBXX  c', 'c.XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XB', 'B201100021', '性别', 'XASGAJ.RY_JBXX  c', 'c.XB', 'VARCHAR', '1', 'XB', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CSRQ', 'B201100021', '出生日期', 'XASGAJ.RY_JBXX  c', 'c.CSRQ', 'CHAR_DATE', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YWX', 'B201100021', '英文姓', 'XASGAJ.RY_JBXX  c', 'c.YWX', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YWM', 'B201100021', '英文名', 'XASGAJ.RY_JBXX  c', 'c.YWM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZJZL', 'B201100021', '证件种类', 'XASGAJ.RY_JBXX  c', 'c.ZJZL', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GMSFHM', 'B201100021', '证件号码', 'XASGAJ.RY_JBXX  c', 'c.ZJHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('QZZL', 'B201100021', '签证种类', 'XASGAJ.RY_JBXX  c', 'c.QZZL', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NLD', 'B201100016', '年龄段', 'XASGAJ.RY_JBXX  z', 'z.ZZRY_CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJBH', 'B201100028', '接警编号', 'XASGAJ.JCJ_JJXX j', 'j.JJ_JJBH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_AJBH', 'B201100028', '案件编号', 'XASGAJ.JCJ_JJXX j', 'j.JJ_AJBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_JJSJ', 'B201100028', '接警时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_JJSJ', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_JJDW', 'B201100028', '接警单位', 'XASGAJ.JCJ_JJXX j', 'j.JJ_JJDW', 'VARCHAR', '1', 'DW', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_JJR', 'B201100028', '接警人', 'XASGAJ.JCJ_JJXX j', 'j.JJ_JJR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_CJR', 'B201100028', '处警人', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CJR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_CJSJ', 'B201100028', '处警时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CJSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_CFBJ', 'B201100028', '是否重复报警', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CFBJ', 'VARCHAR', '1', 'SF', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJDZRQ', 'B201100028', '报警地责任区', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJDZRQ', 'VARCHAR', '1', 'DW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJRZZQH', 'B201100028', '报警人住址区划', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRZZQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJRZZJX', 'B201100028', '报警人住址街巷', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRZZJX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJRZZXZ', 'B201100028', '报警人住址详址', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRZZXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJR', 'B201100028', '报警人', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJRXB', 'B201100028', '报警人性别', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRXB', 'VARCHAR', '1', 'XB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_FXSJ', 'B201100028', '发现时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_FXSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_FXDD', 'B201100028', '发现地点', 'XASGAJ.JCJ_JJXX j', 'j.JJ_FXDD', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_AFDZLB', 'B201100028', '案发地址类别', 'XASGAJ.JCJ_JJXX j', 'j.JJ_AFDZLB', 'VARCHAR', '1', 'AFDZLB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_JQBT', 'B201100028', '警情标题', 'XASGAJ.JCJ_JJXX j', 'j.JJ_JQBT', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJXQDW', 'B201100028', '报警辖区单位', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJXQDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJRCSRQ', 'B201100028', '报警人出生日期', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRCSRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJRZJZL', 'B201100028', '报警人证件种类', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRZJZL', 'VARCHAR', '1', 'ZJZL', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJRZH', 'B201100028', '报警人证号', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_LXDH', 'B201100028', '联系电话', 'XASGAJ.JCJ_JJXX j', 'j.JJ_LXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJRDW', 'B201100028', '报警人单位', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJXS', 'B201100028', '报警形式', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJXS', 'VARCHAR', '1', 'BJLX', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJJB', 'B201100028', '报警级别', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJJB', 'VARCHAR', '1', 'BJJB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJNR', 'B201100028', '报警内容', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJNR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_ZXDZBZ', 'B201100028', '专项斗争标志', 'XASGAJ.JCJ_JJXX j', 'j.JJ_ZXDZBZ', 'VARCHAR', '1', 'ZXDZBZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_CLLX', 'B201100028', '处理类型', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CLLX', 'VARCHAR', '1', 'JCJ_CLLX', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJAJZT', 'B201100028', '报警案件状态', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJAJZT', 'VARCHAR', '1', 'AJZT', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_BJRZZ', 'B201100028', '报警人住址', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BJCZSJ', 'B201100028', '报警操作时间', 'XASGAJ.JCJ_JJXX j', 'j.BJCZSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_AJFSDZ', 'B201100028', '案件发生地址', 'XASGAJ.JCJ_JJXX j', 'j.JJ_AJFSDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_CJBS', 'B201100028', '处警标识', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CJBS', 'VARCHAR', '1', 'CJBS', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_CJDDDSJ', 'B201100028', '处警单到达时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CJDDDSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_CJDJSSJ', 'B201100028', '处警单接收时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CJDJSSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_CJDPJSJ', 'B201100028', '处警单二次派警时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CJDPJSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_YJDW', 'B201100028', '移交单位', 'XASGAJ.JCJ_JJXX j', 'j.JJ_YJDW', 'VARCHAR', '1', 'DW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_YJR', 'B201100028', '移交人', 'XASGAJ.JCJ_JJXX j', 'j.JJ_YJR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_YJSJ', 'B201100028', '移交时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_YJSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJ_YJSM', 'B201100028', '移交说明', 'XASGAJ.JCJ_JJXX j', 'j.JJ_YJSM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CJDW', 'B201100028', '处警单位', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJDW', 'VARCHAR', '1', 'DW', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CJR', 'B201100028', '处警人', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CJBH', 'B201100028', '处警编号', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJBH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CJLB', 'B201100028', '处警类别', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJLB', 'VARCHAR', '1', 'CJLB', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJBH', 'B201100043', '处警接警编号', 'XASGAJ.JCJ_CJXX c', 'c.CJ_JJBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CJSJ', 'B201100043', '填写时间', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_ZBLD', 'B201100043', '处警值班领导', 'XASGAJ.JCJ_CJXX c', 'c.CJ_ZBLD', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_DDXCSJ', 'B201100043', '处警到达现场时间', 'XASGAJ.JCJ_CJXX c', 'c.CJ_DDXCSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CJJG', 'B201100043', '处警结果', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJJG', 'CHAR', '1', 'CJJG', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_BCCLJG', 'B201100043', '处警补充处理结果', 'XASGAJ.JCJ_CJXX c', 'c.CJ_BCCLJG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_SFSW', 'B201100043', '处警是否涉外', 'XASGAJ.JCJ_CJXX c', 'c.CJ_SFSW', 'CHAR', '1', 'SFSW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_XXQK', 'B201100043', '处警详细情况', 'XASGAJ.JCJ_CJXX c', 'c.CJ_XXQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_SSXXQK', 'B201100043', '处警损失详细情况', 'XASGAJ.JCJ_CJXX c', 'c.CJ_SSXXQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_FSCS', 'B201100043', '处警案事件发生场所', 'XASGAJ.JCJ_CJXX c', 'c.CJ_FSCS', 'CHAR', '1', 'FSCS', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_PHXXAJ', 'B201100043', '处警破获现行案件', 'XASGAJ.JCJ_CJXX c', 'c.CJ_PHXXAJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_ZHZACY', 'B201100043', '处警抓获作案成员', 'XASGAJ.JCJ_CJXX c', 'c.CJ_ZHZACY', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CDJL', 'B201100043', '处警出动警力', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CDJL', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CDJDC', 'B201100043', '处警出动机动车', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CDJDC', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CDCZ', 'B201100043', '处警出动船只', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CDCZ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_ZJJJSS', 'B201100043', '处警直接经济损失', 'XASGAJ.JCJ_CJXX c', 'c.CJ_ZJJJSS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_WHSS', 'B201100043', '处警挽回损失', 'XASGAJ.JCJ_CJXX c', 'c.CJ_WHSS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_JZQZ', 'B201100043', '处警救助群众', 'XASGAJ.JCJ_CJXX c', 'c.CJ_JZQZ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_JZSY', 'B201100043', '处警救助伤员', 'XASGAJ.JCJ_CJXX c', 'c.CJ_JZSY', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_JJFNS', 'B201100043', '处警解救妇女数', 'XASGAJ.JCJ_CJXX c', 'c.CJ_JJFNS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_JJETS', 'B201100043', '处警解救儿童数', 'XASGAJ.JCJ_CJXX c', 'c.CJ_JJETS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_JJRZS', 'B201100043', '处警解救人质数', 'XASGAJ.JCJ_CJXX c', 'c.CJ_JJRZS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_RYSWS', 'B201100043', '处警人员死亡数', 'XASGAJ.JCJ_CJXX c', 'c.CJ_RYSWS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_RYSSS', 'B201100043', '处警人员受伤数', 'XASGAJ.JCJ_CJXX c', 'c.CJ_RYSSS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_TPRF', 'B201100043', '处警逃跑人犯', 'XASGAJ.JCJ_CJXX c', 'c.CJ_TPRF', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_LZSCRS', 'B201100043', '处警留置审查人数', 'XASGAJ.JCJ_CJXX c', 'c.CJ_LZSCRS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CJCZSJ', 'B201100043', '处警处警操作时间', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJCZSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_AJSLR', 'B201100043', '处警案件受理人', 'XASGAJ.JCJ_CJXX c', 'c.CJ_AJSLR', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_AJSLDW', 'B201100043', '处警案件受理单位', 'XASGAJ.JCJ_CJXX c', 'c.CJ_AJSLDW', 'CHAR', '1', 'DW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYBH', 'B201100015', '人员编号', 'XASGAJ.RY_JBXX', 'RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYZZBH', 'B201100015', '人员住址编号', 'XASGAJ.RY_JBXX', 'RYZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GMSFHM', 'B201100015', '公民身份号码', 'XASGAJ.RY_JBXX', 'GMSFHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JWSFZH', 'B201100015', '境外身份号码', 'XASGAJ.RY_JBXX', 'JWSFZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XM', 'B201100015', '姓名', 'XASGAJ.RY_JBXX', 'XM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XMPY', 'B201100015', '姓名拼音', 'XASGAJ.RY_JBXX', 'XMPY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYM', 'B201100015', '曾用名', 'XASGAJ.RY_JBXX', 'CYM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZJZL', 'B201100015', '证件种类', 'XASGAJ.RY_JBXX', 'ZJZL', 'VARCHAR', '1', 'ZJZL', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZJHM', 'B201100015', '证件号码', 'XASGAJ.RY_JBXX', 'ZJHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BMCH', 'B201100015', '别名绰号', 'XASGAJ.RY_JBXX', 'BMCH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XB', 'B201100015', '性别', 'XASGAJ.RY_JBXX', 'XB', 'VARCHAR', '1', 'XB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('MZ', 'B201100015', '民族', 'XASGAJ.RY_JBXX', 'MZ', 'VARCHAR', '1', 'MZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CSRQ', 'B201100015', '出生日期', 'XASGAJ.RY_JBXX', 'CSRQ', 'CHAR_DATE', null, null, null);
commit;
prompt 601 records committed...
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CSSJ', 'B201100015', '出生时间', 'XASGAJ.RY_JBXX', 'CSSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CSDQ', 'B201100015', '出生地区', 'XASGAJ.RY_JBXX', 'CSDQ', 'VARCHAR', '1', 'JGDQ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CSQX', 'B201100015', '出生区县', 'XASGAJ.RY_JBXX', 'CSQX', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CSXZ', 'B201100015', '出生详址', 'XASGAJ.RY_JBXX', 'CSXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JHRYSFZH', 'B201100015', '监护人一身份证号', 'XASGAJ.RY_JBXX', 'JHRYSFZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JHRYXM', 'B201100015', '监护人一姓名', 'XASGAJ.RY_JBXX', 'JHRYXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JHGXY', 'B201100015', '监护关系一', 'XASGAJ.RY_JBXX', 'JHGXY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JHRESFZH', 'B201100015', '监护人二身份证号', 'XASGAJ.RY_JBXX', 'JHRESFZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JHREXM', 'B201100015', '监护人二姓名', 'XASGAJ.RY_JBXX', 'JHREXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JHGXE', 'B201100015', '监护关系二', 'XASGAJ.RY_JBXX', 'JHGXE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FQSFZH', 'B201100015', '父亲身份证号', 'XASGAJ.RY_JBXX', 'FQSFZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FQXM', 'B201100015', '父亲姓名', 'XASGAJ.RY_JBXX', 'FQXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('MQSFZH', 'B201100015', '母亲身份证号', 'XASGAJ.RY_JBXX', 'MQSFZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('MQXM', 'B201100015', '母亲姓名', 'XASGAJ.RY_JBXX', 'MQXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('POSFZH', 'B201100015', '配偶身份证号', 'XASGAJ.RY_JBXX', 'POSFZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('POXM', 'B201100015', '配偶姓名', 'XASGAJ.RY_JBXX', 'POXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGDQ', 'B201100015', '籍贯地区', 'XASGAJ.RY_JBXX', 'JGDQ', 'VARCHAR', '1', 'JGDQ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGQX', 'B201100015', '籍贯区县', 'XASGAJ.RY_JBXX', 'JGQX', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGXZ', 'B201100015', '籍贯详址', 'XASGAJ.RY_JBXX', 'JGXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YXQX', 'B201100015', '有效期限', 'XASGAJ.RY_JBXX', 'YXQX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZJXY', 'B201100015', '宗教信仰', 'XASGAJ.RY_JBXX', 'ZJXY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZZMM', 'B201100015', '政治面貌', 'XASGAJ.RY_JBXX', 'ZZMM', 'VARCHAR', '1', 'ZZMM', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('WHCD', 'B201100015', '文化程度', 'XASGAJ.RY_JBXX', 'WHCD', 'VARCHAR', '1', 'WHCD', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('HYZK', 'B201100015', '婚姻状况', 'XASGAJ.RY_JBXX', 'HYZK', 'VARCHAR', '1', 'HYZK', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BYZK', 'B201100015', '兵役状况', 'XASGAJ.RY_JBXX', 'BYZK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SG', 'B201100015', '身高', 'XASGAJ.RY_JBXX', 'SG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XX', 'B201100015', '血型', 'XASGAJ.RY_JBXX', 'XX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LXDH', 'B201100015', '联系电话', 'XASGAJ.RY_JBXX', 'LXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('BZ', 'B201100015', '备注', 'XASGAJ.RY_JBXX', 'BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('HH', 'B201100015', '人员户号', 'XASGAJ.RY_JBXX', 'HH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('HKLB', 'B201100015', '户口类别', 'XASGAJ.RY_JBXX', 'HKLB', 'VARCHAR', '1', 'HKLB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('TSHK', 'B201100015', '特殊户口', 'XASGAJ.RY_JBXX', 'TSHK', 'VARCHAR', '1', 'TSHK', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YHZGX', 'B201100015', '与户主关系', 'XASGAJ.RY_JBXX', 'YHZGX', 'VARCHAR', '1', 'JTGX', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DWMC', 'B201100042', '单位名称', 'XASGAJ.JG_JBXX j', 'j.DWMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRDB', 'B201100042', '法人代表', 'XASGAJ.JG_JBXX j', 'j.FRDB', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRZZ', 'B201100042', '法人住址', 'XASGAJ.JG_JBXX j', 'j.FRZZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRSFZH', 'B201100042', '法人身份证号', 'XASGAJ.JG_JBXX j', 'j.FRSFZHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGBH', 'B201100042', '机构编号', 'XASGAJ.JG_JBXX j', 'j.JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CJDW', 'B201100043', '处警单位', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJDW', 'VARCHAR', '1', 'DW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CJR', 'B201100043', '处警人', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CJBH', 'B201100043', '处警编号', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CJ_CJLB', 'B201100043', '处警类别', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJLB', 'VARCHAR', '1', 'CJLB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('WWM', 'B201100042', '机构外文名', 'XASGAJ.JG_JBXX j', 'j.WWM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DSZ', 'B201100042', '机构董事长', 'XASGAJ.JG_JBXX j', 'j.DSZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZJL', 'B201100042', '机构总经理', 'XASGAJ.JG_JBXX j', 'j.ZJL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DWCZ', 'B201100042', '机构传真', 'XASGAJ.JG_JBXX j', 'j.DWCZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DWDZYX', 'B201100042', '机构Email', 'XASGAJ.JG_JBXX j', 'j.DWDZYX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DWSX', 'B201100042', '机构属性', 'XASGAJ.JG_JBXX j', 'j.DWSX', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FRLXDH', 'B201100042', '法人电话', 'XASGAJ.JG_JBXX j', 'j.FRLXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JJXZ', 'B201100042', '经济性质', 'XASGAJ.JG_JBXX j', 'j.JJXZ', 'CHAR', '1', 'JJXZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XYLB', 'B201100042', '行业类别', 'XASGAJ.JG_JBXX j', 'j.XYLB', 'CHAR', '1', 'HYLB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JYFW_ZY', 'B201100042', '经营范围(主营)', 'XASGAJ.JG_JBXX j', 'j.JYFW_ZY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JYFW_JY', 'B201100042', '经营范围(兼营)', 'XASGAJ.JG_JBXX j', 'j.JYFW_JY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('KYRQ', 'B201100042', '开业日期', 'XASGAJ.JG_JBXX j', 'j.KYRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YYZZBH', 'B201100042', '营业执照号', 'XASGAJ.JG_JBXX j', 'j.YYZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWDJH', 'B201100042', '税务登记号', 'XASGAJ.JG_JBXX j', 'j.SWDJH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGZCH', 'B201100042', '注册号', 'XASGAJ.JG_JBXX j', 'j.JGZCH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZCRQ', 'B201100042', '注册日期', 'XASGAJ.JG_JBXX j', 'j.ZCRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZCZB', 'B201100042', '注册资本', 'XASGAJ.JG_JBXX j', 'j.ZCZB', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZCQH', 'B201100042', '注册区划', 'XASGAJ.JG_JBXX j', 'j.ZCQH', 'CHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZCDZ', 'B201100042', '注册地址', 'XASGAJ.JG_JBXX j', 'j.ZCDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FZRQ', 'B201100042', '发照日期', 'XASGAJ.JG_JBXX j', 'j.FZRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YXQX', 'B201100042', '有效期限', 'XASGAJ.JG_JBXX j', 'j.YXQX', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FHDJ', 'B201100042', '防火等级', 'XASGAJ.JG_JBXX j', 'j.FHDJ', 'CHAR', '1', 'DJ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CYRS', 'B201100042', '从业人数', 'XASGAJ.JG_JBXX j', 'j.CYRS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('FZJG', 'B201100042', '分支机构', 'XASGAJ.JG_JBXX j', 'j.FZJG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DWDM', 'B201100042', '单位代码', 'XASGAJ.JG_JBXX j', 'j.DWDM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GYDWLX', 'B201100042', '雇佣单位类型', 'XASGAJ.JG_JBXX j', 'j.GYDWLX', 'CHAR', '1', 'GYDWLX', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('YZBM', 'B201100042', '邮政编码', 'XASGAJ.JG_JBXX j', 'j.YZBM', 'NUMBER', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGJLX', 'B201100042', '街路巷', 'XASGAJ.JG_JBXX j', 'j.JGJLX', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGMLPH', 'B201100042', '门楼牌号', 'XASGAJ.JG_JBXX j', 'j.JGMLPH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGMLXZ', 'B201100042', '门楼详址', 'XASGAJ.JG_JBXX j', 'j.JGMLXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGMPHZ', 'B201100042', '门牌后缀', 'XASGAJ.JG_JBXX j', 'j.JGMPHZ', 'CHAR', '1', 'MPHZ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('JGSSXQ', 'B201100042', '省市县区', 'XASGAJ.JG_JBXX j', 'j.JGSSXQ', 'CHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SZZRQ', 'B201100042', '所属责任区', 'XASGAJ.JG_JBXX j', 'j.SZZRQ', 'CHAR', '1', 'DW', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('TZGJ', 'B201100042', '涉外投资国', 'XASGAJ.JG_JBXX j', 'j.TZGJ', 'CHAR', '1', 'JGDQ', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DWDH', 'B201100042', '机构电话', 'XASGAJ.JG_JBXX j', 'j.DWDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_BH', 'B201100027', '车辆编号', 'XASGAJ.ZA_PCCLXX', 'CLPC_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CLPC_FLLX', 'B201100027', '车分类类型', 'XASGAJ.ZA_PCCLXX', 'CLPC_FLLX', 'CHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SWRYXM', 'B201100032', '姓        名', 'xasgaj.jg_wbswryxx w', 'w.SWRYXM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ZJHM', 'B201100032', '证件号码', 'xasgaj.jg_wbswryxx w', 'w.ZJHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYBH', 'B201100020', '关联人员编号', 'XASGAJ.JG_CYRY  t', 't.CYRY_RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NLD', 'B201100015', '年龄段', 'XASGAJ.RY_JBXX', 'CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NLD', 'B201100022', '年龄段', 'XASGAJ.RY_JBXX  c', 'c.CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NLD', 'B201100023', '年龄段', 'XASGAJ.RY_JBXX  c', 'CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NLD', 'B201100024', '年龄段', 'XASGAJ.RY_JBXX  c', 'CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NLD', 'B201100026', '年龄段', 'XASGAJ.RY_JBXX  c', 'CSRQ', 'CHARDATE', null, null, 'num_between');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('33', '2879d6f8:131fa4a7057:-8000', '33', '33', '33', 'DATE', '0', null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('a1', '79c8c89a:1323da9d9be:-8000', 'a1', 'a1', 'a1', 'DATE', '0', null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('11', '2879d6f8:131fa4a7057:-8000', '11', '11', '11', 'DATE', '0', 'XB', null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('22', '2879d6f8:131fa4a7057:-8000', '22', '22', '22', 'DATE', '0', null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('44', '2879d6f8:131fa4a7057:-8000', '44', '44', '44', 'DATE', '0', null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('55', '2879d6f8:131fa4a7057:-8000', '55', '55', '55', 'DATE', '1', null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('RYBH', '3cfebef3:1328edc98f8:-7fed', '人员编号', 'RY_JBXX', 'RYBH', 'VARCHAR', '0', null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XM', '3cfebef3:1328edc98f8:-7fed', '姓名', 'RY_JBXX', 'XM', 'VARCHAR', '0', null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('GMSFHM', '3cfebef3:1328edc98f8:-7fed', '公民身份号码', 'RY_JBXX', 'GMSFHM', 'VARCHAR', '0', null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('XB', '3cfebef3:1328edc98f8:-7fed', '性别', 'RY_JBXX', 'XB', 'VARCHAR', '1', 'XB', '=');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('61', '7adf59e3:132f0f4cce8:-8000', '61', '61', '61', 'DATE', '0', 'XB', 'like');
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('8', '31171d2c:132b99423bf:-8000', '8', '8', '8', 'DATE', '0', null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('7', '31171d2c:132b99423bf:-8000', '7', '7', '7', 'DATE', '0', 'MZ', 'like');
commit;
prompt 701 records committed...
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('9', '31171d2c:132b99423bf:-8000', '9', '9', '9', 'DATE', '0', null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ID', 'B201100044', '主键ID', 'fw_conf_xa.jw_tztg t', 'ID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('TITLE', 'B201100044', '消息标题', 'fw_conf_xa.jw_tztg t', 'TITLE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('TYPE', 'B201100044', '消息类型', 'fw_conf_xa.jw_tztg t', 'TYPE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('CONTENT', 'B201100044', '消息具体内容', 'fw_conf_xa.jw_tztg t', 'CONTENT', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SENDUSERID', 'B201100044', '发送人', 'fw_conf_xa.jw_tztg t', 'SENDUSERID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SENDTIME', 'B201100044', '发送时间', 'fw_conf_xa.jw_tztg t', 'SENDTIME', 'CHAR_DATE', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SENDSTATUS', 'B201100044', '发送状态', 'fw_conf_xa.jw_tztg t', 'SENDSTATUS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SENDDEPTID', 'B201100044', '发送单位', 'fw_conf_xa.jw_tztg t', 'SENDDEPTID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('UPLOADFILENAME', 'B201100044', '上传文件的名字', 'fw_conf_xa.jw_tztg t', 'UPLOADFILENAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('REQDEVICE_ID', 'B201100044', '接收方手机串码字符集', 'fw_conf_xa.jw_tztg t', 'REQDEVICE_ID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('REQUSERNAME', 'B201100044', '接收方姓名字符集', 'fw_conf_xa.jw_tztg t', 'REQUSERNAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('REQDEPTID', 'B201100044', '接收方单位行政区划字符集', 'fw_conf_xa.jw_tztg t', 'REQDEPTID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('REQDEPTNAME', 'B201100044', '接收方单位名称字符集', 'fw_conf_xa.jw_tztg t', 'REQDEPTNAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SENDUSERNAME', 'B201100044', '发送用户姓名', 'fw_conf_xa.jw_tztg t', 'SENDUSERNAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SENDDEPTNAME', 'B201100044', '发送用户单位', 'fw_conf_xa.jw_tztg t', 'SENDDEPTNAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ADDID', 'B201100045', '通讯录编号', 'fw_conf_xa.jw_address t', 'ADDID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('NAME', 'B201100045', '人员姓名', 'fw_conf_xa.jw_address t', 'NAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DEPTID', 'B201100045', '所在单位编号', 'fw_conf_xa.jw_address t', 'DEPTID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('MOBILE', 'B201100045', '手机', 'fw_conf_xa.jw_address t', 'MOBILE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('UNITTEL', 'B201100045', '单位电话', 'fw_conf_xa.jw_address t', 'UNITTEL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('HOMETEL', 'B201100045', '家庭电话', 'fw_conf_xa.jw_address t', 'HOMETEL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('REMARK', 'B201100045', '备注', 'fw_conf_xa.jw_address t', 'REMARK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DUTY', 'B201100045', '职务', 'fw_conf_xa.jw_address t', 'DUTY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('SORT', 'B201100045', '排序号', 'fw_conf_xa.jw_address t', 'SORT', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('MOBILE2', 'B201100045', '手机号2', 'fw_conf_xa.jw_address t', 'MOBILE2', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('UNITTEL2', 'B201100045', '单位电话2', 'fw_conf_xa.jw_address t', 'UNITTEL2', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('DEPTNAMES', 'B201100045', '机构名称', 'fw_conf_xa.jw_address t', 'DEPTNAMES', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('EMAIL', 'B201100045', '邮件', 'fw_conf_xa.jw_address t', 'EMAIL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LAW_ID', 'B201100046', '法规ID', 'fw_conf_xa.jw_law t', 'LAW_ID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LAW_CODE', 'B201100046', '法规代码', 'fw_conf_xa.jw_law t', 'LAW_CODE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('LAW_NAME', 'B201100046', '法规名称', 'fw_conf_xa.jw_law t', 'LAW_NAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('ADMINISTRATION', 'B201100046', '颁布事件', 'fw_conf_xa.jw_law t', 'ADMINISTRATION', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (COLUMNS, B_ID, CNAME, TABLE_NAME, C_COLUMN, CNAME_TYPE, IS_RES, RES_ID, OP)
values ('IRREGULARITYACTION', 'B201100046', '法规内容', 'fw_conf_xa.jw_law t', 'IRREGULARITYACTION', 'VARCHAR', null, null, null);
commit;
prompt 734 records loaded
prompt Loading IMG_INFO...
insert into IMG_INFO (IMG_NAME, IMG_PATH, IMG_DES)
values ('Windows XP', '/uploadfile/image/Windows XP.jpg', 'XP');
insert into IMG_INFO (IMG_NAME, IMG_PATH, IMG_DES)
values ('ar', '/uploadfile/image/ar.png', 'ar');
insert into IMG_INFO (IMG_NAME, IMG_PATH, IMG_DES)
values ('font_1', '/uploadfile/image/font_1.png', '用户名');
insert into IMG_INFO (IMG_NAME, IMG_PATH, IMG_DES)
values ('bags', '/uploadfile/image/bags.png', '小屋子');
insert into IMG_INFO (IMG_NAME, IMG_PATH, IMG_DES)
values ('nbdw', '/uploadfile/image/nbdw.png', '楼房');
insert into IMG_INFO (IMG_NAME, IMG_PATH, IMG_DES)
values ('arrow', '/uploadfile/image/arrow.png', '大于');
insert into IMG_INFO (IMG_NAME, IMG_PATH, IMG_DES)
values ('bottom_switcher_collapsed.9', '/uploadfile/image/bottom_switcher_collapsed.9.png', '7');
insert into IMG_INFO (IMG_NAME, IMG_PATH, IMG_DES)
values ('ztry', '/uploadfile/image/ztry.png', '8');
insert into IMG_INFO (IMG_NAME, IMG_PATH, IMG_DES)
values ('wbxx', '/uploadfile/image/wbxx.png', '小图片');
insert into IMG_INFO (IMG_NAME, IMG_PATH, IMG_DES)
values ('photo_takephoto_1', '/uploadfile/image/photo_takephoto_1.png', 'photo');
commit;
prompt 10 records loaded
prompt Loading JW_ADDRESS...
insert into JW_ADDRESS (ADDID, NAME, DEPTID, MOBILE, UNITTEL, HOMETEL, REMARK, DUTY, SORT, MOBILE2, UNITTEL2, DEPTNAMES, EMAIL)
values (1, '1', 1, '1', '1', '1', '1', '1', 1, '1', '1', '1', '1');
insert into JW_ADDRESS (ADDID, NAME, DEPTID, MOBILE, UNITTEL, HOMETEL, REMARK, DUTY, SORT, MOBILE2, UNITTEL2, DEPTNAMES, EMAIL)
values (21, '张三1', 1, '189XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 1, '158XXXXXXXX', '010-XXXXXXXX', 'XX派出所', 'XX@126.com');
insert into JW_ADDRESS (ADDID, NAME, DEPTID, MOBILE, UNITTEL, HOMETEL, REMARK, DUTY, SORT, MOBILE2, UNITTEL2, DEPTNAMES, EMAIL)
values (20, '张三', 1, '189XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 1, '158XXXXXXXX', '010-XXXXXXXX', 'XX派出所', 'XX@126.com');
commit;
prompt 3 records loaded
prompt Loading JW_FILE_INFO...
insert into JW_FILE_INFO (FILENAME, USERNAME, UPLOADDATE)
values ('video_316126763250.3gp', null, to_date('13-10-2011 13:58:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into JW_FILE_INFO (FILENAME, USERNAME, UPLOADDATE)
values ('123.bmp', '456', to_date('13-10-2011', 'dd-mm-yyyy'));
insert into JW_FILE_INFO (FILENAME, USERNAME, UPLOADDATE)
values ('fileName', 'userName', to_date('13-10-2011 13:33:48', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 3 records loaded
prompt Loading JW_GPS_CONFIG...
insert into JW_GPS_CONFIG (USERID, STATE, INTERVAL)
values ('48fe9eb5:132ebb4bb9b:-8000', 1, 5);
commit;
prompt 1 records loaded
prompt Loading JW_GPS_DATA...
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:39:47', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:39:58', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:51:25', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:51:42', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:52:00', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:52:17', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:23:59', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:24:55', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:25:13', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:25:29', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:25:48', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:25:54', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:26:12', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:26:34', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:26:54', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:27:14', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:27:34', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:39:04', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:39:22', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('03-11-2011 17:05:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('03-11-2011 17:05:23', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:39:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:39:52', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:40:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:40:51', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:41:08', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:41:13', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:41:30', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:41:47', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:42:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:43:22', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:43:39', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:44:34', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:44:55', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:45:14', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:45:32', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:45:49', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:46:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:47:03', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:48:04', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:48:24', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:51:03', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:51:19', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:51:37', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:24:12', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:25:07', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:25:37', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:38:02', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:38:26', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:38:37', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:38:51', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:39:05', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:39:11', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:39:22', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:39:41', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:40:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:40:27', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:40:45', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:41:02', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:41:19', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:41:36', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:42:55', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:43:11', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:43:28', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:44:23', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:44:41', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:45:03', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:38:14', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:38:31', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:45:55', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:46:11', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:46:29', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:46:46', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:47:31', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:47:48', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:49:24', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:49:41', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:50:15', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:50:35', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:50:52', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:51:08', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:51:53', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:52:11', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:52:28', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:26:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:26:27', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:27:05', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:27:45', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:38:45', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:39:28', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:39:36', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:40:33', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:41:24', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:41:42', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:41:53', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:42:00', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:42:13', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:42:19', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:42:25', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:42:31', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
commit;
prompt 101 records committed...
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:42:37', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:42:42', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:42:48', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:43:00', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:43:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:43:17', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:43:44', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:43:55', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:44:01', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:44:12', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:44:17', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:44:28', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:44:46', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:45:09', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:45:26', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:45:43', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:46:00', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:46:17', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:46:22', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:46:40', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:46:57', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:47:22', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('03-11-2011 17:05:18', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:38:08', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:47:36', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:47:42', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:47:59', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:48:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:48:39', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:48:45', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:48:56', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:49:02', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:49:19', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:49:35', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:49:52', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:50:03', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:50:09', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:50:24', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:50:29', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:50:40', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:50:46', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:50:57', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:51:14', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:51:31', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:51:48', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:52:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:52:22', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:52:42', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:23:42', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:25:01', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:25:22', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:25:43', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:26:00', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:26:20', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:26:43', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:27:00', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:27:22', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:27:40', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:39:10', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:39:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:39:28', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:38:19', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:39:00', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:40:39', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:40:57', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:43:33', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:43:50', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:44:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:45:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:45:37', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('03-11-2011 17:05:12', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('03-11-2011 17:05:29', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:46:34', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:46:51', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:47:08', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:47:53', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:48:10', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:48:51', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:49:07', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:49:13', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:49:30', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:49:47', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:49:58', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 09:52:33', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:26:48', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
insert into JW_GPS_DATA (DEVICEID, X, Y, DATETIME, SPEED, DIRECTION, IMSI, USERID)
values ('123111230012276', '0.0', '0.0', to_date('04-11-2011 10:27:28', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '48fe9eb5:132ebb4bb9b:-8000');
commit;
prompt 186 records loaded
prompt Loading JW_JZ...
insert into JW_JZ (ID, NAME, DESCRIPTION)
values ('4', '警长', '4');
insert into JW_JZ (ID, NAME, DESCRIPTION)
values ('1', '交警', '1');
insert into JW_JZ (ID, NAME, DESCRIPTION)
values ('2', '协警', '2');
insert into JW_JZ (ID, NAME, DESCRIPTION)
values ('3', '特警', '3');
commit;
prompt 4 records loaded
prompt Loading JW_LAW...
insert into JW_LAW (LAW_ID, LAW_CODE, LAW_NAME, ADMINISTRATION, IRREGULARITYACTION, LAW_TYPE)
values (4, '3', '2', '1', '1', '1   ');
insert into JW_LAW (LAW_ID, LAW_CODE, LAW_NAME, ADMINISTRATION, IRREGULARITYACTION, LAW_TYPE)
values (10, '8', '8', '8', '8', '8   ');
insert into JW_LAW (LAW_ID, LAW_CODE, LAW_NAME, ADMINISTRATION, IRREGULARITYACTION, LAW_TYPE)
values (14, '12', '12', '12', '12', '12  ');
insert into JW_LAW (LAW_ID, LAW_CODE, LAW_NAME, ADMINISTRATION, IRREGULARITYACTION, LAW_TYPE)
values (15, '10', '0123', '00', '0', '0   ');
insert into JW_LAW (LAW_ID, LAW_CODE, LAW_NAME, ADMINISTRATION, IRREGULARITYACTION, LAW_TYPE)
values (11, '9', '9', '9', '9', '9   ');
insert into JW_LAW (LAW_ID, LAW_CODE, LAW_NAME, ADMINISTRATION, IRREGULARITYACTION, LAW_TYPE)
values (8, '6', '6', '6', '6', '6   ');
insert into JW_LAW (LAW_ID, LAW_CODE, LAW_NAME, ADMINISTRATION, IRREGULARITYACTION, LAW_TYPE)
values (9, '7', '7', '7', '7', '7   ');
insert into JW_LAW (LAW_ID, LAW_CODE, LAW_NAME, ADMINISTRATION, IRREGULARITYACTION, LAW_TYPE)
values (5, '2', '2', '3', '1', '1   ');
insert into JW_LAW (LAW_ID, LAW_CODE, LAW_NAME, ADMINISTRATION, IRREGULARITYACTION, LAW_TYPE)
values (6, '4', '5', '6', '7', '8   ');
insert into JW_LAW (LAW_ID, LAW_CODE, LAW_NAME, ADMINISTRATION, IRREGULARITYACTION, LAW_TYPE)
values (7, '5', '5', '5', '5', '5   ');
insert into JW_LAW (LAW_ID, LAW_CODE, LAW_NAME, ADMINISTRATION, IRREGULARITYACTION, LAW_TYPE)
values (13, '11', '11', '11', '11', '11  ');
insert into JW_LAW (LAW_ID, LAW_CODE, LAW_NAME, ADMINISTRATION, IRREGULARITYACTION, LAW_TYPE)
values (2, '1', '56423', '1', '1', '1   ');
commit;
prompt 12 records loaded
prompt Loading JW_LOG...
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7ffd', '1', 'B201100001', null, to_timestamp('16-09-2011 17:09:02.240000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7ffc', '3', 'B201100020', null, to_timestamp('16-09-2011 17:09:13.037000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7ff9', '3', 'B201100020', null, to_timestamp('16-09-2011 17:09:35.396000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7ff4', '3', 'B201100020', null, to_timestamp('16-09-2011 17:10:40.599000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-7ff8', '3', 'B201100020', null, to_timestamp('19-09-2011 10:30:04.662000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fc0', '3', 'B201100020', null, to_timestamp('19-09-2011 17:33:10.474000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fbe', '3', 'B201100020', null, to_timestamp('19-09-2011 17:33:26.834000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fbd', '3', 'B201100020', null, to_timestamp('19-09-2011 17:34:32.755000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fbc', '3', 'B201100020', null, to_timestamp('19-09-2011 17:34:35.099000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ffc', '1', 'B201100015', null, to_timestamp('27-09-2011 15:21:18.390000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-7ffe', 'admin', 'B201100045', null, to_timestamp('12-10-2011 15:51:26.734000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-7ffd', 'admin', 'B201100045', null, to_timestamp('12-10-2011 15:51:47.015000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ffa', '1', 'B201100019', null, to_timestamp('19-10-2011 16:54:10.406000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ff7', '1', 'B201100015', null, to_timestamp('19-10-2011 16:55:18.781000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ff6', '1', 'B201100022', null, to_timestamp('19-10-2011 16:55:33.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ff2', '1', 'B201100019', null, to_timestamp('19-10-2011 16:56:17.562000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ff0', '1', 'B201100027', null, to_timestamp('19-10-2011 16:57:24.734000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fea', '1', 'B201100027', null, to_timestamp('19-10-2011 16:58:03.640000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fe5', '1', 'B201100027', null, to_timestamp('19-10-2011 16:58:19.203000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fe2', '1', 'B201100027', null, to_timestamp('19-10-2011 16:58:25.812000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fdf', '1', 'B201100027', null, to_timestamp('19-10-2011 16:58:50.546000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fdb', '1', 'B201100027', null, to_timestamp('19-10-2011 16:59:23.859000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fd4', '1', 'B201100018', null, to_timestamp('19-10-2011 16:59:45.468000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fc5', '1', 'B201100022', null, to_timestamp('19-10-2011 17:41:31.859000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fc2', '1', 'B201100022', null, to_timestamp('19-10-2011 17:41:45.609000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fbf', '1', 'B201100027', null, to_timestamp('19-10-2011 17:41:59.375000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fbc', '1', 'B201100041', null, to_timestamp('19-10-2011 17:42:09.156000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fb9', '1', 'B201100015', null, to_timestamp('19-10-2011 17:42:31.140000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-244f3b10:13343e56b81:-7fff', '1', 'B201100017', null, to_timestamp('27-10-2011 13:41:28.750000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fff', '1', 'B201100031', null, to_timestamp('27-10-2011 15:44:14.578000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ffa', '1', 'B201100031', null, to_timestamp('27-10-2011 15:57:40.109000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ff5', '1', 'B201100031', null, to_timestamp('27-10-2011 15:57:55.187000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-383973b2:1336704739b:-8000', '3', 'B201100015', null, to_timestamp('03-11-2011 09:21:45.210000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2019b6a2:133670a9df9:-8000', '3', 'B201100015', null, to_timestamp('03-11-2011 09:28:29.304000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-7ff6', '3', 'B201100022', null, to_timestamp('19-09-2011 10:35:26.537000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ffc', '1', 'B201100022', null, to_timestamp('19-10-2011 16:18:31.687000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fe5', '1', 'B201100017', null, to_timestamp('26-10-2011 14:36:34.281000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fe4', '1', 'B201100017', null, to_timestamp('26-10-2011 14:36:38.328000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fe3', '1', 'B201100017', null, to_timestamp('26-10-2011 14:36:41.453000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fe2', '1', 'B201100017', null, to_timestamp('26-10-2011 14:36:45.500000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fe1', '1', 'B201100017', null, to_timestamp('26-10-2011 14:36:48.843000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fe0', '1', 'B201100017', null, to_timestamp('26-10-2011 14:36:53.578000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fdf', '1', 'B201100017', null, to_timestamp('26-10-2011 14:36:57.093000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fde', '1', 'B201100017', null, to_timestamp('26-10-2011 14:37:53.687000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fdd', 'admin', 'B201100044', null, to_timestamp('04-11-2011 14:25:00.523000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fd9', 'admin', 'B201100045', null, to_timestamp('04-11-2011 16:51:24.288000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fd8', 'admin', 'B201100045', null, to_timestamp('04-11-2011 16:51:27.913000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fd6', 'admin', 'B201100045', null, to_timestamp('04-11-2011 17:01:32.538000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7a89501:133abb5fafa:-7ffc', 'admin', 'B201100045', null, to_timestamp('16-11-2011 17:30:59.849000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7a89501:133abb5fafa:-7ff7', 'admin', 'B201100045', null, to_timestamp('16-11-2011 17:31:08.724000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ff3', 'admin', 'B201100046', null, to_timestamp('17-11-2011 14:42:01.906000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-7ffe', '3', 'B201100022', null, to_timestamp('19-09-2011 10:12:45.896000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-7ffa', '3', 'B201100020', null, to_timestamp('19-09-2011 10:14:45.209000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-7ff9', '3', 'B201100020', null, to_timestamp('19-09-2011 10:15:31.193000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ff3', '3', 'B201100020', null, to_timestamp('19-09-2011 14:28:36.396000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fda', '1', 'B20110052', null, to_timestamp('28-09-2011 17:05:55.015000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fd8', '1', 'B201100016', null, to_timestamp('28-09-2011 17:19:10.484000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fd1', '1', 'B20110052', null, to_timestamp('28-09-2011 17:23:11.812000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('76f258de:13343086114:-7fff', '1', 'B201100019', null, to_timestamp('27-10-2011 09:39:51.218000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ff8', '1', 'B201100031', null, to_timestamp('27-10-2011 15:57:47.015000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ff3', '1', 'B201100031', null, to_timestamp('27-10-2011 15:58:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ff2', '1', 'B201100031', null, to_timestamp('27-10-2011 16:23:49.546000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fed', '1', 'B201100031', null, to_timestamp('27-10-2011 16:24:06.812000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fe8', '1', 'B201100031', null, to_timestamp('27-10-2011 16:24:20.359000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fe2', '1', 'B201100025', null, to_timestamp('27-10-2011 16:24:52.156000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('567c3e75:1336254df81:-8000', 'admin', 'B201100020', null, to_timestamp('02-11-2011 11:31:30.710000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-585d5b7c:1336c66b549:-8000', '11', 'S000000000', '1', to_timestamp('04-11-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('226be879:1336d2bbea9:-8000', 'admin', 'B201100022', null, to_timestamp('04-11-2011 14:02:26.507000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fe2', 'admin', 'B201100022', null, to_timestamp('14-11-2011 15:55:41.237000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fc2', '3', 'B201100020', null, to_timestamp('22-09-2011 15:54:39.625000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3c2795df:132f1ef3e11:-8000', '3', 'B201100015', null, to_timestamp('11-10-2011 15:38:30.500000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-68d3f629:132f6bd55c0:-7fff', '1', 'B201100000', null, to_timestamp('12-10-2011 14:06:40.500000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('4331953d:132f6c5c22f:-7fff', '1', 'B201100000', null, to_timestamp('12-10-2011 14:16:14.437000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ff7', 'admin', 'B201100027', null, to_timestamp('04-11-2011 10:47:56.288000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ff4', 'admin', 'B201100028', null, to_timestamp('04-11-2011 10:48:26.429000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fdc', 'admin', 'B201100022', null, to_timestamp('14-11-2011 16:36:23.909000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3c17c612:133b5e37b9b:-7ffb', 'admin', 'B201100045', null, to_timestamp('18-11-2011 16:56:23.937000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ff8', '3', 'B201100015', null, to_timestamp('16-09-2011 16:18:02.380000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ff4', '3', 'B201100020', null, to_timestamp('16-09-2011 16:27:28.693000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-7ff3', '3', 'B201100020', null, to_timestamp('19-09-2011 11:14:02.005000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-8000', '3', 'B201100015', null, to_timestamp('22-09-2011 09:56:28.656000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7ff3', '3', 'B201100020', null, to_timestamp('22-09-2011 10:48:57.796000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7ff1', '3', 'B201100020', null, to_timestamp('22-09-2011 10:49:16.500000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-8000', 'admin', 'B201100015', null, to_timestamp('11-10-2011 12:30:02.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ff8', 'admin', 'B201100018', null, to_timestamp('11-10-2011 12:30:55.171000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ff3', 'admin', 'B201100018', null, to_timestamp('11-10-2011 12:31:05.296000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fff', '1', 'B201100041', null, to_timestamp('26-10-2011 13:24:04.312000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ff7', '1', 'B201100032', null, to_timestamp('26-10-2011 13:37:51.156000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('4a19aad6:13361fc1c1d:-8000', 'admin', 'B201100017', null, to_timestamp('02-11-2011 09:54:36.194000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-561f73fd:13362055aa1:-8000', 'admin', 'B201100017', null, to_timestamp('02-11-2011 10:04:41.757000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-561f73fd:13362055aa1:-7ffd', 'admin', 'B201100032', null, to_timestamp('02-11-2011 10:06:26.819000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7a54ff97:13367867f99:-7ffe', 'admin', 'B201100017', null, to_timestamp('03-11-2011 13:17:18.648000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7a54ff97:13367867f99:-7ff8', 'admin', 'B201100020', null, to_timestamp('03-11-2011 13:23:23.866000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('50848cc6:1337bcc5665:-7ff7', 'admin', 'B201100046', null, to_timestamp('07-11-2011 13:08:44.634000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7a89501:133abb5fafa:-7ffe', 'admin', 'B201100045', null, to_timestamp('16-11-2011 17:30:24.037000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7a89501:133abb5fafa:-7ff9', 'admin', 'B201100045', null, to_timestamp('16-11-2011 17:31:05.912000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7fee', '3', 'B201100020', null, to_timestamp('16-09-2011 16:52:57.037000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7fed', '3', 'B201100020', null, to_timestamp('16-09-2011 16:55:00.865000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7ff6', '3', 'B201100020', null, to_timestamp('16-09-2011 17:09:53.443000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7ff5', '3', 'B201100020', null, to_timestamp('16-09-2011 17:10:38.240000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 101 records committed...
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-ac520cf:13271974db4:-7ffc', '3', 'B201100020', null, to_timestamp('16-09-2011 17:39:38.146000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-ac520cf:13271974db4:-7ffb', '3', 'B201100020', null, to_timestamp('16-09-2011 17:39:45.849000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ff8', 'admin', 'B201100015', null, to_timestamp('12-10-2011 13:48:23.375000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ff7', 'admin', 'B201100015', null, to_timestamp('12-10-2011 13:48:35.031000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-565e3ab7:132f6a7f42e:-7fff', '1', 'B201100000', null, to_timestamp('12-10-2011 13:48:45.906000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ff3', 'admin', 'B201100015', null, to_timestamp('12-10-2011 13:49:04.312000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ff1', 'admin', 'B201100015', null, to_timestamp('12-10-2011 13:49:30.250000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ff0', 'admin', 'B201100015', null, to_timestamp('12-10-2011 13:49:42.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fcd', '1', 'B201100024', null, to_timestamp('19-10-2011 17:10:29.937000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-125e709e:13358cbcee8:-7ff7', '1', 'B201100020', null, to_timestamp('31-10-2011 15:06:20.476000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ffe', 'admin', 'B201100033', null, to_timestamp('17-11-2011 14:35:01.109000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('16e3c0bd:132711d47ab:-7ffe', '3', 'B201100015', null, to_timestamp('16-09-2011 15:26:10.427000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fc8', '3', 'B201100020', null, to_timestamp('22-09-2011 15:33:14.468000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7ffb', '1', 'B201100016', null, to_timestamp('28-09-2011 16:05:29.265000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fef', '1', 'B201100031', null, to_timestamp('27-10-2011 16:24:01.671000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fea', '1', 'B201100031', null, to_timestamp('27-10-2011 16:24:14.906000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fe5', '1', 'B201100031', null, to_timestamp('27-10-2011 16:24:33.031000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fe4', '1', 'B201100032', null, to_timestamp('27-10-2011 16:24:45.812000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fdf', '1', 'B201100032', null, to_timestamp('27-10-2011 16:25:07.843000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2d33f2e1:1338b1cbad6:-8000', '3', 'B201100015', null, to_timestamp('10-11-2011 09:34:36.333000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-43c81c9c:13289db3ee8:-7ffb', '3', 'B201100020', null, to_timestamp('21-09-2011 11:22:26.754000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-f5d9eb9:132a9972f8b:-8000', '1', 'S000000000', '1', to_timestamp('27-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-8000', '1', 'B201100015', null, to_timestamp('27-09-2011 15:13:30.062000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-60294369:133626006f9:-7ffb', 'admin', 'B201100037', null, to_timestamp('02-11-2011 11:44:15.132000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('50848cc6:1337bcc5665:-7ffe', 'admin', 'B201100046', null, to_timestamp('07-11-2011 10:12:44.686000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('474f93fb:132846c50b8:-7ffe', '3', 'B201100020', null, to_timestamp('20-09-2011 09:26:22.584000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('474f93fb:132846c50b8:-7ff6', '3', 'B201100020', null, to_timestamp('20-09-2011 09:29:58.865000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ffa', '3', 'B201100028', null, to_timestamp('16-09-2011 16:11:15.177000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ff3', '3', 'B201100015', null, to_timestamp('16-09-2011 16:27:49.380000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ff2', '3', 'B201100020', null, to_timestamp('16-09-2011 16:28:06.224000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-7ff7', '3', 'B201100020', null, to_timestamp('19-09-2011 10:30:09.615000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ffc', '1', 'B201100032', null, to_timestamp('26-10-2011 13:29:58.937000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ff6', '1', 'B201100025', null, to_timestamp('26-10-2011 13:39:45.625000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ff4', '1', 'B201100025', null, to_timestamp('26-10-2011 13:45:27.421000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fdb', '1', 'B201100027', null, to_timestamp('26-10-2011 14:57:04.062000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fda', '1', 'B201100027', null, to_timestamp('26-10-2011 14:57:15.328000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fe7', 'admin', 'B201100044', null, to_timestamp('04-11-2011 11:50:20.257000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fe6', '3', 'B201100020', null, to_timestamp('19-09-2011 15:30:40.005000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('474f93fb:132846c50b8:-7ffd', '3', 'B201100015', null, to_timestamp('20-09-2011 09:26:29.552000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('474f93fb:132846c50b8:-7ffc', '3', 'B201100020', null, to_timestamp('20-09-2011 09:26:37.287000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7ff9', '1', 'B201100019', null, to_timestamp('28-09-2011 16:05:39.359000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7ff2', '1', 'B201100018', null, to_timestamp('28-09-2011 16:28:49.296000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fed', '1', 'B201100018', null, to_timestamp('28-09-2011 16:29:36.890000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fe6', '1', 'B201100032', null, to_timestamp('28-09-2011 16:37:39.328000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fda', 'admin', 'B201100045', null, to_timestamp('04-11-2011 16:51:20.148000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fd4', 'admin', 'B201100044', null, to_timestamp('04-11-2011 17:02:15.585000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fd8', 'admin', 'B201100022', null, to_timestamp('14-11-2011 17:06:08.079000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fd7', 'admin', 'B201100022', null, to_timestamp('14-11-2011 17:18:38.139000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-7fff', '3', 'B201100020', null, to_timestamp('19-09-2011 10:04:16.818000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ff8', '3', 'B201100020', null, to_timestamp('19-09-2011 13:52:38.990000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ff6', '3', 'B201100020', null, to_timestamp('19-09-2011 13:53:40.537000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3646e415:132848dacb3:-8000', '3', 'B201100020', null, to_timestamp('20-09-2011 09:58:09.068000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3646e415:132848dacb3:-7ffd', '3', 'B201100020', null, to_timestamp('20-09-2011 10:00:48.177000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fe8', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:16:46.593000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fe0', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:19:56.578000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fdc', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:23:17.593000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fd7', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:30:55.812000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fcf', '3', 'B201100015', null, to_timestamp('22-09-2011 13:36:46.765000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-7ffc', 'admin', 'B201100045', null, to_timestamp('12-10-2011 16:00:49.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('43fc92fb:132849320e0:-7ffc', '3', 'B201100016', null, to_timestamp('20-09-2011 10:16:28.818000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7fe9', '3', 'B201100020', null, to_timestamp('16-09-2011 17:06:27.427000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('4331953d:132f6c5c22f:-8000', '1', 'B201100000', null, to_timestamp('12-10-2011 14:15:48.750000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ff9', '1', 'B201100015', null, to_timestamp('19-10-2011 16:55:09.562000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fec', '1', 'B201100027', null, to_timestamp('19-10-2011 16:57:55.031000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fe7', '1', 'B201100027', null, to_timestamp('19-10-2011 16:58:13.796000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fe3', '1', 'B201100027', null, to_timestamp('19-10-2011 16:58:23.937000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fe0', '1', 'B201100027', null, to_timestamp('19-10-2011 16:58:30.281000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fde', '1', 'B201100027', null, to_timestamp('19-10-2011 16:59:20.031000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fd9', '1', 'B201100017', null, to_timestamp('19-10-2011 16:59:32.718000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fd8', '1', 'B201100017', null, to_timestamp('19-10-2011 16:59:34.781000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fd7', '1', 'B201100018', null, to_timestamp('19-10-2011 16:59:40.625000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fd2', '1', 'B201100024', null, to_timestamp('19-10-2011 16:59:59.750000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fd0', '1', 'B201100015', null, to_timestamp('19-10-2011 17:00:26.218000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-575f6e3:13348573e67:-7fff', '1', 'B201100022', null, to_timestamp('28-10-2011 10:24:04.640000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-60294369:133626006f9:-7ffc', 'admin', 'B201100033', null, to_timestamp('02-11-2011 11:44:08.476000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ff8', 'admin', 'B201100027', null, to_timestamp('04-11-2011 10:47:52.585000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fe9', 'admin', 'B201100044', null, to_timestamp('04-11-2011 11:37:55.351000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fe4', 'admin', 'B201100044', null, to_timestamp('04-11-2011 13:16:09.632000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('226be879:1336d2bbea9:-7fff', 'admin', 'B201100022', null, to_timestamp('04-11-2011 14:02:36.460000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fd3', '3', 'B201100020', null, to_timestamp('19-09-2011 17:19:12.459000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fd0', '3', 'B201100020', null, to_timestamp('19-09-2011 17:21:08.505000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fcd', '3', 'B201100015', null, to_timestamp('19-09-2011 17:21:38.271000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fc4', '3', 'B201100020', null, to_timestamp('19-09-2011 17:29:53.427000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fbf', '3', 'B201100015', null, to_timestamp('19-09-2011 17:33:13.037000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3646e415:132848dacb3:-7ffe', '3', 'B201100020', null, to_timestamp('20-09-2011 10:00:38.787000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fd9', '1', 'B201100027', null, to_timestamp('26-10-2011 14:57:21.562000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('16e3c0bd:132711d47ab:-8000', '3', 'B201100017', null, to_timestamp('16-09-2011 15:22:34.302000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ff4', '3', 'B201100020', null, to_timestamp('19-09-2011 14:18:01.802000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fde', '3', 'B201100020', null, to_timestamp('19-09-2011 17:00:54.896000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fd8', '3', 'B201100015', null, to_timestamp('19-09-2011 17:05:45.021000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fc1', '3', 'B201100015', null, to_timestamp('22-09-2011 15:58:02.218000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7fed', '1', 'B201100019', null, to_timestamp('27-09-2011 16:22:03.828000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7fec', '1', 'B201100015', null, to_timestamp('27-09-2011 16:22:53.156000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7feb', '1', 'B201100019', null, to_timestamp('27-09-2011 16:27:24.515000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7ffa', '1', 'B201100019', null, to_timestamp('28-09-2011 16:05:36.734000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7ff1', '1', 'B201100019', null, to_timestamp('28-09-2011 16:28:56.843000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fec', '1', 'B201100018', null, to_timestamp('28-09-2011 16:29:40.203000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fe9', '1', 'B201100020', null, to_timestamp('28-09-2011 16:33:14.343000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fe5', '1', 'B201100032', null, to_timestamp('28-09-2011 16:37:40.984000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fd7', '1', 'B201100016', null, to_timestamp('28-09-2011 17:19:35.890000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 201 records committed...
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('4a6be2fc:132f6a3923a:-8000', 'admin', 'B201100000', null, to_timestamp('12-10-2011 13:38:32.437000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2f3ab363:13390fc5e0d:-8000', 'admin', 'B201100017', null, to_timestamp('11-11-2011 12:56:48.177000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7feb', '3', 'B201100020', null, to_timestamp('16-09-2011 17:01:59.849000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7fea', '3', 'B201100020', null, to_timestamp('16-09-2011 17:02:23.162000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7fff', '3', 'B201100015', null, to_timestamp('16-09-2011 17:08:37.584000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7ffb', '3', 'B201100020', null, to_timestamp('16-09-2011 17:09:15.412000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7ff8', '3', 'B201100020', null, to_timestamp('16-09-2011 17:09:47.802000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7ff3', '3', 'B201100020', null, to_timestamp('16-09-2011 17:12:01.646000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-ac520cf:13271974db4:-7ffe', '3', 'B201100015', null, to_timestamp('16-09-2011 17:36:12.334000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-ac520cf:13271974db4:-7ffd', '3', 'B201100020', null, to_timestamp('16-09-2011 17:36:33.974000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ffb', 'admin', 'B201100018', null, to_timestamp('11-10-2011 12:30:46.312000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ff6', 'admin', 'B201100018', null, to_timestamp('11-10-2011 12:30:58.750000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ff1', 'admin', 'B201100018', null, to_timestamp('11-10-2011 12:31:17.656000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-244f3b10:13343e56b81:-7ffd', '1', 'B201100031', null, to_timestamp('27-10-2011 13:45:18.296000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('4a19aad6:13361fc1c1d:-7fff', 'admin', 'B201100017', null, to_timestamp('02-11-2011 09:55:20.429000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-561f73fd:13362055aa1:-7ffe', 'admin', 'B201100032', null, to_timestamp('02-11-2011 10:06:17.569000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6084e346:13367effaa6:-7ffc', 'admin', 'B201100015', null, to_timestamp('03-11-2011 13:40:36.101000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ffa', 'admin', 'B201100017', null, to_timestamp('04-11-2011 10:47:34.835000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ff6', 'admin', 'B201100027', null, to_timestamp('04-11-2011 10:47:59.507000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ff1', 'admin', 'B201100044', null, to_timestamp('04-11-2011 10:48:42.038000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ff0', 'admin', 'B201100044', null, to_timestamp('04-11-2011 10:48:47.929000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fde', 'admin', 'B201100044', null, to_timestamp('04-11-2011 14:15:54.866000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7a89501:133abb5fafa:-7ffa', 'admin', 'B201100045', null, to_timestamp('16-11-2011 17:31:04.365000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ffd', 'admin', 'B201100033', null, to_timestamp('17-11-2011 14:35:04.500000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ff6', 'admin', 'B201100045', null, to_timestamp('17-11-2011 14:39:27.046000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fe6', 'admin', 'B201100044', null, to_timestamp('04-11-2011 12:27:55.476000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fd5', 'admin', 'B201100045', null, to_timestamp('04-11-2011 17:01:35.054000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fd3', 'admin', 'B201100044', null, to_timestamp('04-11-2011 17:02:18.444000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4a8f61c4:1328996e950:-7fff', '3', 'B201100020', null, to_timestamp('21-09-2011 09:28:24.512000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ffb', 'admin', 'B201100020', null, to_timestamp('12-10-2011 13:47:28.359000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ffa', 'admin', 'B201100015', null, to_timestamp('12-10-2011 13:48:10.421000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ff6', 'admin', 'B201100015', null, to_timestamp('12-10-2011 13:48:48.015000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7fef', 'admin', 'B201100015', null, to_timestamp('12-10-2011 14:04:15.625000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('33b6e966:132f6d83eca:-8000', '1', 'B201100000', null, to_timestamp('12-10-2011 14:35:59.453000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-7ffa', 'admin', 'B201100045', null, to_timestamp('12-10-2011 17:20:40.468000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-7ff9', 'admin', 'B201100045', null, to_timestamp('12-10-2011 17:28:10.046000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-7ff8', 'admin', 'B201100045', null, to_timestamp('12-10-2011 17:30:08.187000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-7ff7', 'admin', 'B201100045', null, to_timestamp('12-10-2011 17:36:59.828000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-7ff6', 'admin', 'B201100045', null, to_timestamp('12-10-2011 17:55:28.125000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-7ff5', 'admin', 'B201100045', null, to_timestamp('12-10-2011 17:59:44.031000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-7ff4', 'admin', 'B201100045', null, to_timestamp('12-10-2011 18:00:05.671000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-7ff3', 'admin', 'B201100045', null, to_timestamp('12-10-2011 18:04:46.031000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-7ffe', '1', 'B201100022', null, to_timestamp('20-10-2011 15:39:10.343000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-7ff9', '1', 'B201100022', null, to_timestamp('20-10-2011 15:39:56.265000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-7ff4', '1', 'B201100022', null, to_timestamp('20-10-2011 15:40:08.421000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-125e709e:13358cbcee8:-8000', '1', 'B201100017', null, to_timestamp('31-10-2011 15:05:11.523000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-125e709e:13358cbcee8:-7fff', '1', 'B201100020', null, to_timestamp('31-10-2011 15:05:16.257000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-125e709e:13358cbcee8:-7ffe', '1', 'B201100020', null, to_timestamp('31-10-2011 15:05:25.726000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-125e709e:13358cbcee8:-7ffc', '1', 'B201100015', null, to_timestamp('31-10-2011 15:05:56.991000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-125e709e:13358cbcee8:-7ffb', '1', 'B201100022', null, to_timestamp('31-10-2011 15:06:05.054000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-125e709e:13358cbcee8:-7ff9', '1', 'B201100017', null, to_timestamp('31-10-2011 15:06:13.132000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-125e709e:13358cbcee8:-7ff8', '1', 'B201100015', null, to_timestamp('31-10-2011 15:06:14.491000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fdc', 'admin', 'B201100044', null, to_timestamp('04-11-2011 14:25:05.398000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('43fc92fb:132849320e0:-7fff', '3', 'B201100020', null, to_timestamp('20-09-2011 10:05:29.896000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fee', '1', 'B201100018', null, to_timestamp('28-09-2011 16:29:34.671000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fe8', '1', 'B201100020', null, to_timestamp('28-09-2011 16:33:24.015000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-8000', '1', 'B201100022', null, to_timestamp('19-10-2011 16:09:45.843000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ffd', '1', 'B201100022', null, to_timestamp('19-10-2011 16:18:16.921000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7d1fe88b:13363906bd6:-7ffe', 'admin', 'B201100015', null, to_timestamp('02-11-2011 18:15:00.694000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fdb', 'admin', 'B201100045', null, to_timestamp('04-11-2011 16:51:16.835000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2f3ab363:13390fc5e0d:-7fff', 'admin', 'B201100018', null, to_timestamp('11-11-2011 12:56:55.833000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2f3ab363:13390fc5e0d:-7ffe', 'admin', 'B201100018', null, to_timestamp('11-11-2011 12:57:09.958000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fe1', 'admin', 'B201100022', null, to_timestamp('14-11-2011 15:58:27.730000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fd9', 'admin', 'B201100022', null, to_timestamp('14-11-2011 16:48:09.940000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ffc', '3', 'B201100015', null, to_timestamp('16-09-2011 16:08:56.115000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ffb', '3', 'B201100028', null, to_timestamp('16-09-2011 16:11:07.787000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ff9', '3', 'B201100015', null, to_timestamp('16-09-2011 16:17:56.755000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ff6', '3', 'B201100015', null, to_timestamp('16-09-2011 16:20:34.662000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4a8f61c4:1328996e950:-7ff8', '3', 'B201100020', null, to_timestamp('21-09-2011 10:27:45.954000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-183eb9bb:132b4ba7ef8:-7fff', '1', 'B20110052', null, to_timestamp('29-09-2011 18:28:47.303000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-183eb9bb:132b4ba7ef8:-7ffe', '1', 'B20110052', null, to_timestamp('29-09-2011 18:29:07.928000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('23f65a2d:133256ea64b:-8000', '1', 'B201100022', null, to_timestamp('21-10-2011 15:42:50.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('75765fac:133670fa62f:-8000', '3', 'B201100015', null, to_timestamp('03-11-2011 09:33:59.085000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6084e346:13367effaa6:-8000', 'admin', 'B201100017', null, to_timestamp('03-11-2011 13:38:58.710000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6084e346:13367effaa6:-7ffe', 'admin', 'B201100015', null, to_timestamp('03-11-2011 13:40:11.163000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6084e346:13367effaa6:-7ffd', 'admin', 'B201100015', null, to_timestamp('03-11-2011 13:40:22.679000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fed', '3', 'B201100020', null, to_timestamp('19-09-2011 14:52:46.802000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fe2', '3', 'B201100020', null, to_timestamp('19-09-2011 15:48:35.193000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('474f93fb:132846c50b8:-7fff', '3', 'B201100020', null, to_timestamp('20-09-2011 09:26:18.209000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('474f93fb:132846c50b8:-7ff4', '3', 'B201100020', null, to_timestamp('20-09-2011 09:38:58.802000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4a8f61c4:1328996e950:-7ffa', '3', 'B201100016', null, to_timestamp('21-09-2011 09:41:33.153000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('33b6e966:132f6d83eca:-7fff', '1', 'B201100000', null, to_timestamp('12-10-2011 14:38:49.593000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fba', '1', 'B201100023', null, to_timestamp('19-10-2011 17:42:28.500000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ffb', '1', 'B201100031', null, to_timestamp('27-10-2011 15:57:37.828000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ff6', '1', 'B201100031', null, to_timestamp('27-10-2011 15:57:52.343000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fff', '3', 'B201100020', null, to_timestamp('19-09-2011 13:14:31.505000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ff9', '3', 'B201100020', null, to_timestamp('19-09-2011 13:27:21.677000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1d4faf15:132b339a983:-7ff3', '1', 'B20110052', null, to_timestamp('29-09-2011 15:14:44.428000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1d4faf15:132b339a983:-7fb5', '1', 'B20110052', null, to_timestamp('29-09-2011 17:14:28.381000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1d4faf15:132b339a983:-7fb1', '1', 'B20110052', null, to_timestamp('29-09-2011 17:24:21.506000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1d4faf15:132b339a983:-7fad', '1', 'B20110052', null, to_timestamp('29-09-2011 17:49:27.162000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1d4faf15:132b339a983:-7fab', '1', 'B20110052', null, to_timestamp('29-09-2011 17:50:56.584000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1d4faf15:132b339a983:-7fa8', '1', 'B20110052', null, to_timestamp('29-09-2011 18:04:01.116000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1d4faf15:132b339a983:-7fa6', '1', 'B20110052', null, to_timestamp('29-09-2011 18:10:10.287000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1d4faf15:132b339a983:-7fa4', '1', 'B20110052', null, to_timestamp('29-09-2011 18:13:28.241000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1d4faf15:132b339a983:-7f9f', '1', 'B20110052', null, to_timestamp('29-09-2011 18:16:45.850000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1d4faf15:132b339a983:-7f9d', '1', 'B20110052', null, to_timestamp('29-09-2011 18:23:14.006000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1d4faf15:132b339a983:-7f9c', '1', 'B201100016', null, to_timestamp('29-09-2011 18:26:09.725000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ff5', '1', 'B201100015', null, to_timestamp('19-10-2011 16:55:35.171000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ff1', '1', 'B201100019', null, to_timestamp('19-10-2011 16:56:30.015000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 301 records committed...
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fed', '1', 'B201100027', null, to_timestamp('19-10-2011 16:57:49.046000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fe8', '1', 'B201100027', null, to_timestamp('19-10-2011 16:58:08.796000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fcb', '1', 'B201100017', null, to_timestamp('19-10-2011 17:35:08.703000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fca', '1', 'B201100015', null, to_timestamp('19-10-2011 17:35:09.296000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fc6', '1', 'B201100022', null, to_timestamp('19-10-2011 17:41:29.750000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fc3', '1', 'B201100022', null, to_timestamp('19-10-2011 17:41:42.218000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fc0', '1', 'B201100027', null, to_timestamp('19-10-2011 17:41:57.296000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fbd', '1', 'B201100041', null, to_timestamp('19-10-2011 17:42:07.140000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fef', '1', 'B201100017', null, to_timestamp('26-10-2011 14:07:39.156000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fee', '1', 'B201100017', null, to_timestamp('26-10-2011 14:07:43.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fed', '1', 'B201100017', null, to_timestamp('26-10-2011 14:07:47.437000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fec', '1', 'B201100017', null, to_timestamp('26-10-2011 14:20:52.312000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7feb', '1', 'B201100017', null, to_timestamp('26-10-2011 14:35:00.593000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fea', '1', 'B201100017', null, to_timestamp('26-10-2011 14:35:05.859000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fe9', '1', 'B201100017', null, to_timestamp('26-10-2011 14:35:11.796000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fe8', '1', 'B201100017', null, to_timestamp('26-10-2011 14:35:20.390000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fe7', '1', 'B201100017', null, to_timestamp('26-10-2011 14:35:24.109000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fe6', '1', 'B201100017', null, to_timestamp('26-10-2011 14:35:27.140000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-27c73871:13363912255:-7ffe', 'admin', 'B201100015', null, to_timestamp('02-11-2011 17:17:13.304000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-27c73871:13363912255:-7ffd', 'admin', 'B201100015', null, to_timestamp('02-11-2011 17:21:17.319000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fe3', 'admin', 'B201100022', null, to_timestamp('14-11-2011 15:55:07.270000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fe0', 'admin', 'B201100022', null, to_timestamp('14-11-2011 16:08:27.109000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-7ff5', '3', 'B201100020', null, to_timestamp('19-09-2011 10:35:29.349000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4a8f61c4:1328996e950:-7ffd', '3', 'B201100015', null, to_timestamp('21-09-2011 09:41:02.643000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ffb', '1', 'B201100015', null, to_timestamp('27-09-2011 15:28:19.593000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ff7', '1', 'B201100015', null, to_timestamp('27-09-2011 15:29:39.140000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ffe', '1', 'B201100041', null, to_timestamp('26-10-2011 13:24:13.015000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ff9', '1', 'B201100032', null, to_timestamp('26-10-2011 13:30:21.156000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ff2', '1', 'B201100025', null, to_timestamp('26-10-2011 13:46:13.015000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fdd', '1', 'B201100017', null, to_timestamp('26-10-2011 14:42:53.843000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ffd', '1', 'B201100031', null, to_timestamp('27-10-2011 15:56:27.703000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ff9', '1', 'B201100031', null, to_timestamp('27-10-2011 15:57:43.515000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ff4', '1', 'B201100031', null, to_timestamp('27-10-2011 15:57:57.468000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ffe', 'admin', 'B201100044', null, to_timestamp('04-11-2011 10:30:59.523000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('50848cc6:1337bcc5665:-7ffb', 'admin', 'B201100046', null, to_timestamp('07-11-2011 10:43:15.420000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('50848cc6:1337bcc5665:-7ff6', 'admin', 'B201100046', null, to_timestamp('07-11-2011 13:08:57.509000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-8000', 'admin', '3956ed73:133ab71b8fe:-7ffa', null, to_timestamp('17-11-2011 10:40:45.859000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3c17c612:133b5e37b9b:-7fff', 'admin', 'B201100045', null, to_timestamp('18-11-2011 16:55:53.328000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4a8f61c4:1328996e950:-7ffe', '3', 'B201100020', null, to_timestamp('21-09-2011 09:28:29.355000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('435ee129:13333de9430:-8000', '1', 'B201100018', null, to_timestamp('24-10-2011 10:59:51.093000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7d1fe88b:13363906bd6:-7fff', 'admin', 'B201100017', null, to_timestamp('02-11-2011 17:18:00.788000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fe0', 'admin', 'B201100044', null, to_timestamp('04-11-2011 13:23:15.101000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('16e3c0bd:132711d47ab:-7fff', '3', 'B201100015', null, to_timestamp('16-09-2011 15:26:04.037000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7d1fe88b:13363906bd6:-8000', 'admin', 'B201100018', null, to_timestamp('02-11-2011 17:15:43.163000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7ffd', '3', 'B201100019', null, to_timestamp('22-09-2011 10:17:06.687000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7ff8', '3', 'B201100020', null, to_timestamp('22-09-2011 10:25:55.312000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fea', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:16:40.640000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fe5', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:19:15.343000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fe4', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:19:40.500000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fd9', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:30:52.390000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fd3', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:41:11.171000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fd0', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:42:04.921000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fce', '3', 'B201100015', null, to_timestamp('22-09-2011 13:36:59.515000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fcb', '3', 'B201100015', null, to_timestamp('22-09-2011 13:37:38.015000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7fef', '1', 'B201100016', null, to_timestamp('27-09-2011 16:19:40.640000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7ff0', '1', 'B201100019', null, to_timestamp('28-09-2011 16:28:58.968000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7feb', '1', 'B201100021', null, to_timestamp('28-09-2011 16:29:46.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7a54ff97:13367867f99:-7ffd', 'admin', 'B201100017', null, to_timestamp('03-11-2011 13:21:25.226000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fea', 'admin', 'B201100044', null, to_timestamp('04-11-2011 11:37:48.663000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3c17c612:133b5e37b9b:-7ffd', 'admin', 'B201100045', null, to_timestamp('18-11-2011 16:56:04.609000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3c17c612:133b5e37b9b:-7ffc', 'admin', 'B201100045', null, to_timestamp('18-11-2011 16:56:19.921000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ff2', '3', 'B201100020', null, to_timestamp('19-09-2011 14:28:42.209000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ff0', '3', 'B201100020', null, to_timestamp('19-09-2011 14:51:13.834000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fef', '3', 'B201100015', null, to_timestamp('19-09-2011 14:51:21.677000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fec', '3', 'B201100020', null, to_timestamp('19-09-2011 14:52:52.459000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-5fe33082:13289dea321:-8000', '11', 'S000000000', '1', to_timestamp('21-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7ff3', '1', 'B201100018', null, to_timestamp('28-09-2011 16:28:44.078000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fef', '1', 'B201100018', null, to_timestamp('28-09-2011 16:29:32.859000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fea', '1', 'B201100021', null, to_timestamp('28-09-2011 16:29:48.906000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fe4', 'admin', 'B201100022', null, to_timestamp('14-11-2011 15:51:49.513000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fdf', 'admin', 'B201100022', null, to_timestamp('14-11-2011 16:21:20.950000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7fff', 'admin', 'B201100033', null, to_timestamp('17-11-2011 14:34:37.796000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7fff', 'admin', 'B201100015', null, to_timestamp('12-10-2011 11:05:18.750000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ffe', 'admin', 'B201100015', null, to_timestamp('12-10-2011 11:05:32.937000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-244f3b10:13343e56b81:-7ffe', '1', 'B201100031', null, to_timestamp('27-10-2011 13:41:50.187000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-244f3b10:13343e56b81:-7ffc', '1', 'B201100031', null, to_timestamp('27-10-2011 13:45:21.906000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-8000', '1', 'B201100031', null, to_timestamp('27-10-2011 15:44:11.875000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fe8', 'admin', 'B201100044', null, to_timestamp('04-11-2011 11:49:41.788000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fe1', '3', 'B201100020', null, to_timestamp('19-09-2011 15:53:17.943000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ffc', 'admin', 'B201100033', null, to_timestamp('17-11-2011 14:35:06.421000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fc9', '1', 'B201100024', null, to_timestamp('19-10-2011 17:35:11.062000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fc8', '1', 'B201100022', null, to_timestamp('19-10-2011 17:41:20.500000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fc4', '1', 'B201100022', null, to_timestamp('19-10-2011 17:41:33.812000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fc1', '1', 'B201100027', null, to_timestamp('19-10-2011 17:41:55.484000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fbe', '1', 'B201100041', null, to_timestamp('19-10-2011 17:42:05.171000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fbb', '1', 'B201100023', null, to_timestamp('19-10-2011 17:42:26.171000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fb6', '1', 'B201100023', null, to_timestamp('19-10-2011 17:43:57.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ffd', '1', 'B201100041', null, to_timestamp('26-10-2011 13:24:19.125000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ffb', '1', 'B201100032', null, to_timestamp('26-10-2011 13:30:05.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ffa', '1', 'B201100025', null, to_timestamp('26-10-2011 13:30:17.468000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ff5', '1', 'B201100032', null, to_timestamp('26-10-2011 13:39:49.968000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ff3', '1', 'B201100032', null, to_timestamp('26-10-2011 13:45:30.265000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fcf', '3', 'B201100015', null, to_timestamp('19-09-2011 17:21:25.318000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fcc', '3', 'B201100015', null, to_timestamp('19-09-2011 17:21:40.552000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fc8', '3', 'B201100015', null, to_timestamp('19-09-2011 17:26:47.599000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fc7', '3', 'B201100015', null, to_timestamp('19-09-2011 17:29:39.693000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fc2', '3', 'B201100020', null, to_timestamp('19-09-2011 17:30:04.474000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7ffc', '1', 'B201100016', null, to_timestamp('28-09-2011 16:05:26.812000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ff0', '1', 'B201100031', null, to_timestamp('27-10-2011 16:23:56.421000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7feb', '1', 'B201100031', null, to_timestamp('27-10-2011 16:24:12.343000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 401 records committed...
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fe6', '1', 'B201100031', null, to_timestamp('27-10-2011 16:24:27.562000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fe0', '1', 'B201100025', null, to_timestamp('27-10-2011 16:25:06.921000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-575f6e3:13348573e67:-8000', '1', 'B201100022', null, to_timestamp('28-10-2011 10:23:54.890000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-8000', '3', 'B201100015', null, to_timestamp('16-09-2011 17:08:33.584000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7ffe', '3', 'B201100020', null, to_timestamp('16-09-2011 17:08:50.177000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7ffa', '3', 'B201100020', null, to_timestamp('16-09-2011 17:09:33.005000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-ac520cf:13271974db4:-7fff', '3', 'B201100020', null, to_timestamp('16-09-2011 17:36:05.959000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fd8', '1', 'B201100027', null, to_timestamp('26-10-2011 14:57:28.906000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fd7', '1', 'B201100027', null, to_timestamp('26-10-2011 14:57:34.578000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fd5', '1', 'B201100027', null, to_timestamp('26-10-2011 14:58:07.968000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-244f3b10:13343e56b81:-7ffb', '1', 'B201100031', null, to_timestamp('27-10-2011 13:45:29.640000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-561f73fd:13362055aa1:-7ffb', 'admin', 'B201100032', null, to_timestamp('02-11-2011 10:06:32.851000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-60294369:133626006f9:-7fff', 'admin', 'B201100032', null, to_timestamp('02-11-2011 11:43:43.585000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-60294369:133626006f9:-7ff9', 'admin', 'B201100042', null, to_timestamp('02-11-2011 11:44:24.116000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-27c73871:13363912255:-7ffc', 'admin', 'B201100015', null, to_timestamp('02-11-2011 17:21:22.648000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('352fc48d:13366fd324e:-8000', '3', 'B201100015', null, to_timestamp('03-11-2011 09:13:49.741000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6084e346:13367effaa6:-7fff', 'admin', 'B201100015', null, to_timestamp('03-11-2011 13:39:59.976000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fdf', 'admin', 'B201100044', null, to_timestamp('04-11-2011 14:15:51.069000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7a89501:133abb5fafa:-8000', 'admin', 'B201100045', null, to_timestamp('16-11-2011 17:29:50.912000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7a89501:133abb5fafa:-7ffb', 'admin', 'B201100045', null, to_timestamp('16-11-2011 17:31:02.693000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ff8', 'admin', 'B201100046', null, to_timestamp('17-11-2011 14:38:31.687000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-43c81c9c:13289db3ee8:-7ffc', '3', 'B201100020', null, to_timestamp('21-09-2011 11:22:21.208000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ff4', '1', 'B201100015', null, to_timestamp('27-09-2011 15:33:16.546000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ff2', '1', 'B201100015', null, to_timestamp('27-09-2011 15:36:54.328000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ff1', '1', 'B201100015', null, to_timestamp('27-09-2011 15:41:54.062000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4e8137b9:1336231ac07:-7ffd', '1', 'B201100018', null, to_timestamp('02-11-2011 10:53:18.179000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-60294369:133626006f9:-7ffe', 'admin', 'B201100033', null, to_timestamp('02-11-2011 11:43:56.663000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-60294369:133626006f9:-7ffd', 'admin', 'B201100033', null, to_timestamp('02-11-2011 11:44:02.460000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fde', 'admin', 'B201100022', null, to_timestamp('14-11-2011 16:33:16.058000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ffe', '3', 'B201100020', null, to_timestamp('19-09-2011 13:20:54.302000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fee', '3', 'B201100020', null, to_timestamp('19-09-2011 14:51:27.427000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fe9', '3', 'B201100020', null, to_timestamp('19-09-2011 15:15:21.115000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fda', '3', 'B201100015', null, to_timestamp('19-09-2011 17:01:41.380000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fd4', '3', 'B201100020', null, to_timestamp('19-09-2011 17:18:13.334000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fe9', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:16:43.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fe2', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:19:50.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fdb', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:23:20.265000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fda', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:30:50.171000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fd5', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:31:05.468000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fd4', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:41:00.015000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fcc', '3', 'B201100020', null, to_timestamp('22-09-2011 13:37:32.156000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ffc', 'admin', 'B201100020', null, to_timestamp('12-10-2011 13:40:57.859000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ff9', 'admin', 'B201100015', null, to_timestamp('12-10-2011 13:48:11.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ff5', 'admin', 'B201100015', null, to_timestamp('12-10-2011 13:48:57.078000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-7ffb', 'admin', 'B201100045', null, to_timestamp('12-10-2011 16:43:04.640000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-7ffa', '1', 'B201100022', null, to_timestamp('20-10-2011 15:39:54.484000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-7ff5', '1', 'B201100022', null, to_timestamp('20-10-2011 15:40:06.828000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('76f258de:13343086114:-8000', '1', 'B201100019', null, to_timestamp('27-10-2011 09:39:46.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-60294369:133626006f9:-8000', 'admin', 'B201100032', null, to_timestamp('02-11-2011 11:43:39.351000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-60294369:133626006f9:-7ffa', 'admin', 'B201100037', null, to_timestamp('02-11-2011 11:44:19.991000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fed', 'admin', 'B201100044', null, to_timestamp('04-11-2011 11:21:11.976000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3c17c612:133b5e37b9b:-7ffe', 'admin', 'B201100045', null, to_timestamp('18-11-2011 16:55:55.203000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7feb', '3', 'B201100020', null, to_timestamp('19-09-2011 15:13:37.240000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fe0', '3', 'B201100020', null, to_timestamp('19-09-2011 15:53:22.427000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fdd', '3', 'B201100015', null, to_timestamp('19-09-2011 17:01:22.802000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fd6', '3', 'B201100020', null, to_timestamp('19-09-2011 17:13:27.724000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3c2795df:132f1ef3e11:-7fff', '3', 'B201100015', null, to_timestamp('11-10-2011 15:38:33.843000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('567c3e75:1336254df81:-7fff', 'admin', 'B201100020', null, to_timestamp('02-11-2011 11:31:43.429000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('567c3e75:1336254df81:-7ffe', 'admin', 'B201100015', null, to_timestamp('02-11-2011 11:31:58.023000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ff5', 'admin', 'B201100027', null, to_timestamp('04-11-2011 10:48:05.163000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ff3', 'admin', 'B201100028', null, to_timestamp('04-11-2011 10:48:28.569000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-8000', '3', 'B201100015', null, to_timestamp('16-09-2011 15:48:30.959000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-7ffd', '3', 'B201100022', null, to_timestamp('19-09-2011 10:12:51.380000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-7ffb', '3', 'B201100020', null, to_timestamp('19-09-2011 10:13:36.177000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-8000', 'admin', 'B201100045', null, to_timestamp('12-10-2011 15:41:01.468000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4c9a5a11:132f713b53f:-7fff', 'admin', 'B201100015', null, to_timestamp('12-10-2011 15:42:29.593000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ff1', '1', 'B201100031', null, to_timestamp('27-10-2011 16:23:53.390000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fec', '1', 'B201100031', null, to_timestamp('27-10-2011 16:24:09.875000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fe7', '1', 'B201100031', null, to_timestamp('27-10-2011 16:24:21.671000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fe1', '1', 'B201100032', null, to_timestamp('27-10-2011 16:24:53.109000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7aa9b85f:13367189c7e:-8000', '3', 'B201100015', null, to_timestamp('03-11-2011 09:43:46.460000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7a54ff97:13367867f99:-8000', 'admin', 'B201100015', null, to_timestamp('03-11-2011 11:43:52.882000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ff4', 'admin', 'B20110052', null, to_timestamp('16-09-2011 13:18:11.411000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ff7', 'admin', 'B20110052', null, to_timestamp('16-09-2011 13:11:08.208000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ff6', 'admin', 'B20110052', null, to_timestamp('16-09-2011 13:11:17.380000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ff3', 'admin', 'B20110052', null, to_timestamp('16-09-2011 13:18:28.208000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7d026a5d:13265f370cb:-8000', 'admin', 'B201100000', null, to_timestamp('14-09-2011 11:20:44.958000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7d026a5d:13265f370cb:-7fff', 'admin', 'B201100015', null, to_timestamp('14-09-2011 11:22:10.490000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ffb', 'admin', 'B201100000', null, to_timestamp('16-09-2011 11:19:39.646000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-8000', 'admin', 'B201100000', null, to_timestamp('13-09-2011 15:45:04.568000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1b287edf:13265b5460f:-7fff', 'admin', 'B201100015', null, to_timestamp('14-09-2011 10:14:30.615000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ff1', 'admin', 'B20110052', null, to_timestamp('16-09-2011 13:34:22.286000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-77885710:132619165ff:-8000', '11', 'S000000000', '1', to_timestamp('13-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fee', 'admin', 'B20110052', null, to_timestamp('16-09-2011 13:43:52.630000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fec', 'admin', 'B201100000', null, to_timestamp('16-09-2011 14:01:06.927000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7feb', 'admin', 'B201100015', null, to_timestamp('16-09-2011 14:13:14.177000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fea', 'admin', 'B201100016', null, to_timestamp('16-09-2011 14:13:26.693000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fe9', 'admin', 'B201100015', null, to_timestamp('16-09-2011 14:13:34.583000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fe8', 'admin', 'B201100015', null, to_timestamp('16-09-2011 14:13:40.021000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fe7', 'admin', 'B201100015', null, to_timestamp('16-09-2011 14:13:44.411000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fe5', 'admin', 'B201100000', null, to_timestamp('16-09-2011 14:31:59.068000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1b287edf:13265b5460f:-8000', 'admin', 'B201100000', null, to_timestamp('14-09-2011 10:12:50.505000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-33feb0f4:13265d36194:-7fff', 'admin', 'B201100015', null, to_timestamp('14-09-2011 10:45:56.958000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7e91e9dd:13266e09059:-7fff', '67856', 'S000000000', '1', to_timestamp('14-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-6e25638c:1327020db5e:-7ffd', '121', 'S000000000', '1', to_timestamp('16-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ff7', 'admin', 'B201100000', null, to_timestamp('13-09-2011 16:02:21.631000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ff3', 'admin', 'B201100015', null, to_timestamp('13-09-2011 16:04:37.896000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ff1', 'admin', 'B201100025', null, to_timestamp('13-09-2011 16:45:22.553000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ff8', 'admin', 'B201100000', null, to_timestamp('13-09-2011 15:48:29.974000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3b2becb0:1326658b357:-7fff', 'admin', 'B201100000', null, to_timestamp('14-09-2011 13:24:13.115000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 501 records committed...
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7e91e9dd:13266e09059:-7ffd', '678561', 'S000000000', '1', to_timestamp('14-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('46c70efc:1326595a794:-8000', 'admin', 'B201100000', null, to_timestamp('14-09-2011 09:38:18.255000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3fd35805:1326a86736b:-7fff', '888888', 'S000000000', '1', to_timestamp('15-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ffd', 'admin', 'B201100000', null, to_timestamp('16-09-2011 11:08:16.490000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-6e25638c:1327020db5e:-7ffe', '1', 'S000000000', '1', to_timestamp('16-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fe6', 'admin', 'B201100030', null, to_timestamp('16-09-2011 14:14:36.646000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fe4', 'admin', 'B201100015', null, to_timestamp('16-09-2011 14:33:03.083000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fe3', 'admin', 'B201100015', null, to_timestamp('16-09-2011 14:33:11.005000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fe2', 'admin', 'B201100022', null, to_timestamp('16-09-2011 14:33:25.505000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fe1', 'admin', 'B201100015', null, to_timestamp('16-09-2011 14:33:26.349000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fe0', 'admin', 'B201100015', null, to_timestamp('16-09-2011 14:33:33.958000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fdf', 'admin', 'B201100000', null, to_timestamp('16-09-2011 14:50:32.802000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3b2becb0:1326658b357:-7ffd', 'admin', 'B201100015', null, to_timestamp('14-09-2011 13:26:24.802000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3b2becb0:1326658b357:-7ffe', 'admin', 'B201100015', null, to_timestamp('14-09-2011 13:24:31.036000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fef', 'admin', 'B201100000', null, to_timestamp('16-09-2011 13:43:24.177000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3b2becb0:1326658b357:-8000', 'admin', 'B201100000', null, to_timestamp('14-09-2011 13:11:21.146000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1159b90e:132667953b2:-8000', 'admin', 'S000000000', '1', to_timestamp('14-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ff2', 'admin', 'B201100000', null, to_timestamp('13-09-2011 16:44:54.959000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('46c70efc:1326595a794:-7ffe', 'admin', 'B201100015', null, to_timestamp('14-09-2011 09:51:49.568000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1b287edf:13265b5460f:-7ffc', 'admin', 'B201100022', null, to_timestamp('14-09-2011 10:24:52.990000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('46c70efc:1326595a794:-7fff', 'admin', 'B201100015', null, to_timestamp('14-09-2011 09:47:39.036000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1b287edf:13265b5460f:-7ffb', 'admin', 'B201100015', null, to_timestamp('14-09-2011 10:25:15.333000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1b287edf:13265b5460f:-7ffa', 'admin', 'B201100017', null, to_timestamp('14-09-2011 10:25:21.052000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1b287edf:13265b5460f:-7ff9', 'admin', 'B201100015', null, to_timestamp('14-09-2011 10:25:22.271000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1b287edf:13265b5460f:-7ff8', 'admin', 'B201100015', null, to_timestamp('14-09-2011 10:25:29.552000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1b287edf:13265b5460f:-7ff7', 'admin', 'B201100015', null, to_timestamp('14-09-2011 10:25:37.146000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1b287edf:13265b5460f:-7ff6', 'admin', 'B201100015', null, to_timestamp('14-09-2011 10:25:41.943000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ff9', 'admin', 'B201100000', null, to_timestamp('16-09-2011 11:40:47.943000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ff8', 'admin', 'B201100000', null, to_timestamp('16-09-2011 11:44:10.661000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('51176c44:13266a47fe2:-7fff', 'liru', 'S000000000', '1', to_timestamp('14-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('725b80b3:132614f2770:-7ff9', 'albee', 'S000000000', '1', to_timestamp('13-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('725b80b3:132614f2770:-7ff5', 'cys', 'S000000000', '1', to_timestamp('13-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ff0', 'admin', 'B201100000', null, to_timestamp('16-09-2011 13:38:47.802000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-33feb0f4:13265d36194:-7ffd', 'admin', 'B201100015', null, to_timestamp('14-09-2011 11:19:41.458000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ff2', 'admin', 'B201100000', null, to_timestamp('16-09-2011 13:33:34.630000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ff6', 'admin', 'B201100015', null, to_timestamp('13-09-2011 16:02:38.443000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ff5', 'admin', 'B201100015', null, to_timestamp('13-09-2011 16:03:00.818000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ff4', 'admin', 'B201100015', null, to_timestamp('13-09-2011 16:04:16.709000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('36feb301:13265fe2797:-8000', 'admin', 'B201100000', null, to_timestamp('14-09-2011 11:32:27.146000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-8000', 'admin', 'B201100000', null, to_timestamp('16-09-2011 10:41:48.021000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fff', 'admin', 'B201100000', null, to_timestamp('16-09-2011 10:59:48.630000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1b287edf:13265b5460f:-7ffe', 'admin', 'B201100015', null, to_timestamp('14-09-2011 10:15:30.302000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1b287edf:13265b5460f:-7ffd', 'admin', 'B201100015', null, to_timestamp('14-09-2011 10:15:37.068000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7fed', 'admin', 'B201100000', null, to_timestamp('16-09-2011 13:50:09.568000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('36feb301:13265fe2797:-7ffd', 'admin', 'B201100000', null, to_timestamp('14-09-2011 11:45:29.427000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ffa', 'admin', 'B201100000', null, to_timestamp('16-09-2011 11:39:55.646000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ffd', 'admin', 'B201100015', null, to_timestamp('13-09-2011 15:45:48.881000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ffc', 'admin', 'B201100015', null, to_timestamp('13-09-2011 15:46:00.490000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7fff', 'admin', 'B201100015', null, to_timestamp('13-09-2011 15:45:20.521000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ffe', 'admin', 'B201100015', null, to_timestamp('13-09-2011 15:45:45.068000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ffb', 'admin', 'B201100015', null, to_timestamp('13-09-2011 15:46:31.724000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ffa', 'admin', 'B201100015', null, to_timestamp('13-09-2011 15:46:50.099000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-319f4f72:13261bf0ef6:-7ff9', 'admin', 'B201100015', null, to_timestamp('13-09-2011 15:47:04.959000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('36feb301:13265fe2797:-7fff', 'admin', 'B201100000', null, to_timestamp('14-09-2011 11:34:11.052000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('51176c44:13266a47fe2:-7ffe', 'xujingjing', 'S000000000', '1', to_timestamp('14-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-33feb0f4:13265d36194:-7ffe', 'admin', 'B201100000', null, to_timestamp('14-09-2011 11:11:09.052000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('725b80b3:132614f2770:-7ff7', 'liangmucheng', 'S000000000', '1', to_timestamp('13-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('36feb301:13265fe2797:-7ffe', 'admin', 'B201100015', null, to_timestamp('14-09-2011 11:34:42.693000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-33feb0f4:13265d36194:-8000', 'admin', 'B201100000', null, to_timestamp('14-09-2011 10:45:43.865000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-6e25638c:1327020db5e:-7ffc', '123', 'S000000000', '1', to_timestamp('16-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4738f4db:1326aee4f64:-7fff', '11', 'S000000000', '1', to_timestamp('15-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('51176c44:13266a47fe2:-7ffc', 'zhanghui', 'S000000000', '1', to_timestamp('14-09-2011 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '初始化', null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ffe', 'admin', 'B201100000', null, to_timestamp('16-09-2011 11:04:49.302000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ffc', 'admin', 'B201100000', null, to_timestamp('16-09-2011 11:13:54.833000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1ad5551d:132701c67e7:-7ff5', 'admin', 'B201100000', null, to_timestamp('16-09-2011 13:17:39.833000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ffc', '3', 'B201100020', null, to_timestamp('19-09-2011 13:21:36.709000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ff0', '1', 'B201100016', null, to_timestamp('27-09-2011 15:50:27.468000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ff8', '1', 'B201100019', null, to_timestamp('19-10-2011 16:55:15.093000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7feb', '1', 'B201100027', null, to_timestamp('19-10-2011 16:57:59.359000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fe6', '1', 'B201100027', null, to_timestamp('19-10-2011 16:58:16.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fdc', '1', 'B201100027', null, to_timestamp('19-10-2011 16:59:22.765000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fd5', '1', 'B201100018', null, to_timestamp('19-10-2011 16:59:44.140000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fee', 'admin', 'B201100044', null, to_timestamp('04-11-2011 11:16:41.148000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('50848cc6:1337bcc5665:-7ff8', 'admin', 'B201100046', null, to_timestamp('07-11-2011 11:22:57.265000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('474f93fb:132846c50b8:-7ffb', '3', 'B201100015', null, to_timestamp('20-09-2011 09:26:56.459000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('474f93fb:132846c50b8:-7ffa', '3', 'B201100015', null, to_timestamp('20-09-2011 09:27:08.099000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('474f93fb:132846c50b8:-7ff8', '3', 'B201100015', null, to_timestamp('20-09-2011 09:29:40.802000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('474f93fb:132846c50b8:-7ff7', '3', 'B201100020', null, to_timestamp('20-09-2011 09:29:54.130000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('43fc92fb:132849320e0:-7ffe', '3', 'B201100020', null, to_timestamp('20-09-2011 10:05:36.037000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2fa026c4:132a8a79029:-7ff2', '1', 'B201100015', null, to_timestamp('27-09-2011 13:33:05.609000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2fa026c4:132a8a79029:-7ff1', '1', 'B201100015', null, to_timestamp('27-09-2011 13:35:16.875000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2fa026c4:132a8a79029:-7ff0', '1', 'B201100015', null, to_timestamp('27-09-2011 13:36:10.875000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-8000', '1', 'B201100041', null, to_timestamp('26-10-2011 13:23:37.500000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ff8', '1', 'B201100025', null, to_timestamp('26-10-2011 13:37:47.156000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ff1', '1', 'B201100032', null, to_timestamp('26-10-2011 13:46:16.734000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7ff0', '1', 'B201100017', null, to_timestamp('26-10-2011 13:53:36.562000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-125e709e:13358cbcee8:-7ffd', '1', 'B201100020', null, to_timestamp('31-10-2011 15:05:46.851000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7a54ff97:13367867f99:-7ffb', 'admin', 'B201100020', null, to_timestamp('03-11-2011 13:22:14.398000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7a54ff97:13367867f99:-7ffa', 'admin', 'B201100015', null, to_timestamp('03-11-2011 13:22:53.913000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ff7', '3', 'B201100015', null, to_timestamp('16-09-2011 16:20:28.521000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ff0', '3', 'B201100020', null, to_timestamp('16-09-2011 16:34:58.552000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ffd', 'admin', 'B201100015', null, to_timestamp('11-10-2011 12:30:16.250000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ff9', 'admin', 'B201100018', null, to_timestamp('11-10-2011 12:30:52.750000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ff4', 'admin', 'B201100018', null, to_timestamp('11-10-2011 12:31:02.593000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-283b1ef0:13367581c89:-8000', 'admin', 'B201100017', null, to_timestamp('03-11-2011 10:53:11.616000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-283b1ef0:13367581c89:-7fff', 'admin', 'B201100020', null, to_timestamp('03-11-2011 10:53:23.398000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ffb', 'admin', 'B201100033', null, to_timestamp('17-11-2011 14:35:08.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('474f93fb:132846c50b8:-7ff5', '3', 'B201100015', null, to_timestamp('20-09-2011 09:30:05.271000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fff', '3', 'B201100015', null, to_timestamp('22-09-2011 09:56:58.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7ffb', '3', 'B201100020', null, to_timestamp('22-09-2011 10:19:40.156000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 601 records committed...
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7ff6', '3', 'B201100015', null, to_timestamp('22-09-2011 10:37:24.906000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7ff0', '3', 'B201100020', null, to_timestamp('22-09-2011 10:49:41.046000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-a4f98eb:1336259a02e:-8000', 'admin', 'B201100020', null, to_timestamp('02-11-2011 11:36:41.132000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7edbe04c:133671dd317:-8000', '3', 'B201100015', null, to_timestamp('03-11-2011 09:49:28.101000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4ec336f0:132a4e974b5:-8000', '1', 'B201100022', null, to_timestamp('26-09-2011 16:45:56.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-1d4faf15:132b339a983:-7fff', '1', 'B20110052', null, to_timestamp('29-09-2011 11:28:35.511000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ff4', 'admin', 'B201100015', null, to_timestamp('12-10-2011 13:49:01.140000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ff2', 'admin', 'B201100015', null, to_timestamp('12-10-2011 13:49:18.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fe4', '1', 'B201100027', null, to_timestamp('19-10-2011 16:58:20.984000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fe1', '1', 'B201100027', null, to_timestamp('19-10-2011 16:58:28.218000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fdd', '1', 'B201100027', null, to_timestamp('19-10-2011 16:59:21.578000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fd6', '1', 'B201100018', null, to_timestamp('19-10-2011 16:59:42.453000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fd1', '1', 'B201100024', null, to_timestamp('19-10-2011 17:00:01.718000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fcf', '1', 'B201100024', null, to_timestamp('19-10-2011 17:00:28.578000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-8000', '1', 'B201100022', null, to_timestamp('20-10-2011 15:39:02.203000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-7ff7', '1', 'B201100022', null, to_timestamp('20-10-2011 15:40:02.468000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ffe', '3', 'B201100015', null, to_timestamp('16-09-2011 15:51:46.834000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ffd', '3', 'B201100015', null, to_timestamp('16-09-2011 15:52:36.537000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3646e415:132848dacb3:-7fff', '3', 'B201100020', null, to_timestamp('20-09-2011 09:58:13.740000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4a8f61c4:1328996e950:-7ffb', '3', 'B201100016', null, to_timestamp('21-09-2011 09:41:28.575000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4a8f61c4:1328996e950:-7ff9', '3', 'B201100020', null, to_timestamp('21-09-2011 09:41:47.666000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fc0', '3', 'B201100015', null, to_timestamp('22-09-2011 15:58:11.812000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fdc', '1', 'B20110052', null, to_timestamp('28-09-2011 17:04:50.906000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fd4', '1', 'B20110052', null, to_timestamp('28-09-2011 17:20:54.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fd2', '1', 'B20110052', null, to_timestamp('28-09-2011 17:21:36.875000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-7ffd', '1', 'B201100022', null, to_timestamp('20-10-2011 15:39:18.812000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-7ff8', '1', 'B201100022', null, to_timestamp('20-10-2011 15:40:00.062000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-7ff3', '1', 'B201100022', null, to_timestamp('20-10-2011 15:40:09.796000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fe5', 'admin', 'B201100044', null, to_timestamp('04-11-2011 13:16:00.991000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('50848cc6:1337bcc5665:-8000', 'admin', 'B201100045', null, to_timestamp('07-11-2011 10:12:28.795000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('50848cc6:1337bcc5665:-7ffd', 'admin', 'B201100046', null, to_timestamp('07-11-2011 10:17:52.600000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('50848cc6:1337bcc5665:-7ffc', 'admin', 'B201100046', null, to_timestamp('07-11-2011 10:29:19.269000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ff9', 'admin', 'B201100046', null, to_timestamp('17-11-2011 14:38:29.125000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fea', '3', 'B201100020', null, to_timestamp('19-09-2011 15:13:42.599000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fe7', '3', 'B201100020', null, to_timestamp('19-09-2011 15:30:34.162000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fe4', '3', 'B201100020', null, to_timestamp('19-09-2011 15:32:32.959000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fc5', '3', 'B201100020', null, to_timestamp('19-09-2011 17:29:51.709000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fce', '1', 'B201100015', null, to_timestamp('19-10-2011 17:10:27.890000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fcc', '1', 'B201100015', null, to_timestamp('19-10-2011 17:30:09.609000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fc7', '1', 'B201100022', null, to_timestamp('19-10-2011 17:41:24.312000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fb8', '1', 'B201100017', null, to_timestamp('19-10-2011 17:42:35.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fb7', '1', 'B201100015', null, to_timestamp('19-10-2011 17:42:35.609000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ffd', 'admin', 'B201100044', null, to_timestamp('04-11-2011 10:45:01.679000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ffc', 'admin', 'B201100044', null, to_timestamp('04-11-2011 10:45:14.054000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ffb', 'admin', 'B201100044', null, to_timestamp('04-11-2011 10:45:27.429000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ff9', 'admin', 'B201100027', null, to_timestamp('04-11-2011 10:47:49.273000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7ff2', 'admin', 'B201100028', null, to_timestamp('04-11-2011 10:48:31.944000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7a89501:133abb5fafa:-7fff', 'admin', 'B201100045', null, to_timestamp('16-11-2011 17:30:09.709000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7a89501:133abb5fafa:-7ffd', 'admin', 'B201100045', null, to_timestamp('16-11-2011 17:30:57.959000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7a89501:133abb5fafa:-7ff8', 'admin', 'B201100045', null, to_timestamp('16-11-2011 17:31:07.381000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ff1', 'admin', 'B201100046', null, to_timestamp('17-11-2011 14:42:17.125000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ff5', '3', 'B201100020', null, to_timestamp('16-09-2011 16:27:16.677000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7fef', '3', 'B201100020', null, to_timestamp('16-09-2011 16:35:21.802000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7fec', '3', 'B201100020', null, to_timestamp('16-09-2011 16:57:00.537000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7ff7', '3', 'B201100020', null, to_timestamp('16-09-2011 17:09:49.943000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('abf5d0b:132717e5128:-7ff2', '3', 'B201100020', null, to_timestamp('16-09-2011 17:12:25.834000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7feb', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:16:36.015000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fe6', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:16:55.671000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fe3', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:19:42.406000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fdd', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:21:33.390000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fd8', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:30:53.890000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fd1', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:41:59.984000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ffe', 'admin', 'B201100022', null, to_timestamp('11-10-2011 12:30:14.734000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ffa', 'admin', 'B201100018', null, to_timestamp('11-10-2011 12:30:48.500000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ff5', 'admin', 'B201100018', null, to_timestamp('11-10-2011 12:31:00.500000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-244f3b10:13343e56b81:-8000', '1', 'B201100017', null, to_timestamp('27-10-2011 13:41:12.515000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-244f3b10:13343e56b81:-7ffa', '1', 'B201100031', null, to_timestamp('27-10-2011 13:46:03.328000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-125e709e:13358cbcee8:-7ffa', '1', 'B201100015', null, to_timestamp('31-10-2011 15:06:06.257000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7a54ff97:13367867f99:-7ffc', 'admin', 'B201100020', null, to_timestamp('03-11-2011 13:21:56.788000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7a54ff97:13367867f99:-7ff9', 'admin', 'B201100020', null, to_timestamp('03-11-2011 13:23:11.819000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-8000', 'admin', 'B201100044', null, to_timestamp('04-11-2011 10:00:59.554000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fff', 'admin', 'B201100044', null, to_timestamp('04-11-2011 10:05:25.944000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ffd', '3', 'B201100020', null, to_timestamp('19-09-2011 13:20:59.146000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fd5', '3', 'B201100020', null, to_timestamp('19-09-2011 17:18:09.615000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fd1', '3', 'B201100020', null, to_timestamp('19-09-2011 17:20:54.052000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ffb', '1', 'B201100019', null, to_timestamp('19-10-2011 16:54:06.703000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ff4', '1', 'B201100017', null, to_timestamp('19-10-2011 16:55:38.234000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ff3', '1', 'B201100015', null, to_timestamp('19-10-2011 16:55:38.843000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fef', '1', 'B201100027', null, to_timestamp('19-10-2011 16:57:35.109000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fee', '1', 'B201100027', null, to_timestamp('19-10-2011 16:57:43.562000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fe9', '1', 'B201100027', null, to_timestamp('19-10-2011 16:58:07.125000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fda', '1', 'B201100027', null, to_timestamp('19-10-2011 16:59:24.984000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fd3', '1', 'B201100025', null, to_timestamp('19-10-2011 16:59:51.859000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7fff', '3', 'B201100015', null, to_timestamp('16-09-2011 15:48:38.302000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7ffe', '3', 'B201100015', null, to_timestamp('22-09-2011 10:09:00.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fec', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:16:32.328000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fe7', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:16:52.515000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fe1', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:19:54.671000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fdf', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:20:12.671000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fde', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:21:31.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fd6', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:30:56.828000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fd2', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 11:41:55.343000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fcd', '3', 'B201100020', null, to_timestamp('22-09-2011 13:37:26.671000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fca', '3', 'B201100020', null, to_timestamp('22-09-2011 13:38:05.296000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fc9', '3', 'B201100015', null, to_timestamp('22-09-2011 13:44:56.812000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4e8137b9:1336231ac07:-7fff', '1', 'B201100018', null, to_timestamp('02-11-2011 10:53:03.101000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4e8137b9:1336231ac07:-7ffe', '1', 'B201100018', null, to_timestamp('02-11-2011 10:53:10.554000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fef', 'admin', 'B201100044', null, to_timestamp('04-11-2011 11:16:22.757000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-8000', 'admin', 'B201100015', null, to_timestamp('12-10-2011 11:05:08.171000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('50848cc6:1337bcc5665:-7ffa', 'admin', 'B201100046', null, to_timestamp('07-11-2011 10:43:18.451000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 701 records committed...
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('50848cc6:1337bcc5665:-7ff9', 'admin', 'B201100046', null, to_timestamp('07-11-2011 11:22:51.422000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3d35c8ef:132713508f7:-7ff1', '3', 'B201100020', null, to_timestamp('16-09-2011 16:34:52.818000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-ac520cf:13271974db4:-8000', '3', 'B201100020', null, to_timestamp('16-09-2011 17:35:51.115000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ffa', '3', 'B201100020', null, to_timestamp('19-09-2011 13:27:14.880000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ff7', '3', 'B201100020', null, to_timestamp('19-09-2011 13:52:43.505000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-43c81c9c:13289db3ee8:-7ffd', '3', 'B201100020', null, to_timestamp('21-09-2011 11:05:19.133000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ffd', '1', 'B201100015', null, to_timestamp('27-09-2011 15:20:18.656000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ffa', '1', 'B201100015', null, to_timestamp('27-09-2011 15:29:20.140000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ff3', '1', 'B201100015', null, to_timestamp('27-09-2011 15:34:15.046000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7fff', 'admin', 'B201100015', null, to_timestamp('11-10-2011 12:30:07.171000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ffc', 'admin', 'B201100018', null, to_timestamp('11-10-2011 12:30:39.328000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ff7', 'admin', 'B201100018', null, to_timestamp('11-10-2011 12:30:56.671000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-29a8ab04:132f13e369b:-7ff2', 'admin', 'B201100018', null, to_timestamp('11-10-2011 12:31:13.843000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7acaf00f:132f616d482:-7ffd', 'admin', 'B201100015', null, to_timestamp('12-10-2011 11:05:48.515000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-561f73fd:13362055aa1:-7ffc', 'admin', 'B201100025', null, to_timestamp('02-11-2011 10:06:31.663000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-354899f:13367142a40:-8000', '3', 'B201100015', null, to_timestamp('03-11-2011 09:38:55.023000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fe3', 'admin', 'B201100044', null, to_timestamp('04-11-2011 13:17:23.601000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fe1', 'admin', 'B201100044', null, to_timestamp('04-11-2011 13:18:58.413000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fd2', '3', 'B201100020', null, to_timestamp('19-09-2011 17:19:14.787000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fce', '3', 'B201100020', null, to_timestamp('19-09-2011 17:21:27.193000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fcb', '3', 'B201100015', null, to_timestamp('19-09-2011 17:21:56.787000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fca', '3', 'B201100015', null, to_timestamp('19-09-2011 17:22:00.896000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fc9', '3', 'B201100015', null, to_timestamp('19-09-2011 17:26:45.318000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fc6', '3', 'B201100015', null, to_timestamp('19-09-2011 17:29:41.709000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fc1', '3', 'B201100020', null, to_timestamp('19-09-2011 17:33:08.693000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ffe', '1', 'B201100015', null, to_timestamp('27-09-2011 15:19:28.593000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fd9', '3', 'B201100015', null, to_timestamp('19-09-2011 17:05:43.162000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fd7', '3', 'B201100020', null, to_timestamp('19-09-2011 17:13:25.615000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ff9', '1', 'B201100015', null, to_timestamp('27-09-2011 15:29:30.500000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ff8', '1', 'B201100015', null, to_timestamp('27-09-2011 15:29:38.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ff5', '1', 'B201100015', null, to_timestamp('27-09-2011 15:33:16.343000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-68d3f629:132f6bd55c0:-8000', '1', 'B201100000', null, to_timestamp('12-10-2011 14:06:36.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('7657f77d:132f6c33e34:-8000', '1', 'B201100000', null, to_timestamp('12-10-2011 14:13:03.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('613b3df4:13357fe5a3c:-8000', '88', 'B201100017', null, to_timestamp('31-10-2011 11:20:46.882000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fec', 'admin', 'B201100044', null, to_timestamp('04-11-2011 11:21:14.632000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7feb', 'admin', 'B201100044', null, to_timestamp('04-11-2011 11:21:40.194000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fdf', '3', 'B201100020', null, to_timestamp('19-09-2011 17:00:43.302000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fdc', '3', 'B201100015', null, to_timestamp('19-09-2011 17:01:33.459000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fdb', '3', 'B201100015', null, to_timestamp('19-09-2011 17:01:38.209000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('474f93fb:132846c50b8:-7ff9', '3', 'B201100015', null, to_timestamp('20-09-2011 09:29:34.209000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('4331953d:132f6c5c22f:-7ffe', '1', 'B201100000', null, to_timestamp('12-10-2011 14:27:08.890000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7fff', '1', 'B201100022', null, to_timestamp('19-10-2011 16:09:48.484000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-71a0f866:1331b3a9430:-7ffe', '1', 'B201100033', null, to_timestamp('19-10-2011 16:14:07.671000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-7fff', '1', 'B201100022', null, to_timestamp('20-10-2011 15:39:08.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-7ffc', '1', 'B201100022', null, to_timestamp('20-10-2011 15:39:46.468000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-7ffb', '1', 'B201100022', null, to_timestamp('20-10-2011 15:39:51.187000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6c2cfbac:1332044cf5a:-7ff6', '1', 'B201100022', null, to_timestamp('20-10-2011 15:40:05.140000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fdc', '1', 'B201100027', null, to_timestamp('26-10-2011 14:56:57.875000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('e1bb8cf:1333eaf06c4:-7fd6', '1', 'B201100027', null, to_timestamp('26-10-2011 14:57:40.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-27c73871:13363912255:-8000', 'admin', 'B201100017', null, to_timestamp('02-11-2011 17:16:58.710000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-27c73871:13363912255:-7fff', 'admin', 'B201100015', null, to_timestamp('02-11-2011 17:17:10.976000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-8000', '3', 'B201100020', null, to_timestamp('19-09-2011 13:14:27.271000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-7a54ff97:13367867f99:-7fff', 'admin', 'B201100020', null, to_timestamp('03-11-2011 12:28:30.538000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ff7', 'admin', 'B201100045', null, to_timestamp('17-11-2011 14:39:23.234000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ff4', 'admin', 'B201100046', null, to_timestamp('17-11-2011 14:41:59.781000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ff5', '3', 'B201100020', null, to_timestamp('19-09-2011 14:17:57.240000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fc3', '3', 'B201100015', null, to_timestamp('19-09-2011 17:29:56.599000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-183eb9bb:132b4ba7ef8:-7ff9', '1', 'B201100017', null, to_timestamp('29-09-2011 20:42:33.803000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-183eb9bb:132b4ba7ef8:-7ff8', '1', 'B201100020', null, to_timestamp('29-09-2011 20:42:39.944000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-9bbf353:132f6a16fd8:-8000', '1', 'B201100000', null, to_timestamp('12-10-2011 13:36:11.406000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-565e3ab7:132f6a7f42e:-8000', '1', 'B201100000', null, to_timestamp('12-10-2011 13:43:18.078000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-565e3ab7:132f6a7f42e:-7ffe', '1', 'B201100000', null, to_timestamp('12-10-2011 13:49:47.140000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fd7', 'admin', 'B201100045', null, to_timestamp('04-11-2011 16:51:31.413000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('50848cc6:1337bcc5665:-7fff', 'admin', 'B201100046', null, to_timestamp('07-11-2011 10:12:39.951000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-8000', '3', 'B201100020', null, to_timestamp('19-09-2011 10:04:10.537000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('43fc92fb:132849320e0:-7ffd', '3', 'B201100015', null, to_timestamp('20-09-2011 10:16:18.740000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7fea', '1', 'B201100015', null, to_timestamp('27-09-2011 16:55:47.218000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('bacd273:1336c4ebd2d:-7fe2', 'admin', 'B201100044', null, to_timestamp('04-11-2011 13:17:50.819000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-7ff4', '3', 'B201100020', null, to_timestamp('19-09-2011 11:13:50.318000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ff1', '3', 'B201100020', null, to_timestamp('19-09-2011 14:51:09.209000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fe5', '3', 'B201100020', null, to_timestamp('19-09-2011 15:32:26.021000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fe3', '3', 'B201100020', null, to_timestamp('19-09-2011 15:48:29.115000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4a8f61c4:1328996e950:-7ffc', '3', 'B201100015', null, to_timestamp('21-09-2011 09:41:10.251000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fc7', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 15:44:35.687000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7fff', '1', 'B201100016', null, to_timestamp('27-09-2011 15:13:37.765000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7ff6', '1', 'B201100015', null, to_timestamp('27-09-2011 15:32:52.421000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7fee', '1', 'B201100019', null, to_timestamp('27-09-2011 16:20:42.484000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7fe9', '1', 'B201100016', null, to_timestamp('27-09-2011 16:57:12.828000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3543f56a:132a9bc1c8c:-7fe8', '1', 'B201100016', null, to_timestamp('27-09-2011 17:00:13.812000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fde', '1', 'B20110052', null, to_timestamp('28-09-2011 17:03:36.937000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-50738179:132aef6a9ad:-7fd6', '1', 'B201100016', null, to_timestamp('28-09-2011 17:19:54.312000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7ffb', '3', 'B201100020', null, to_timestamp('19-09-2011 13:21:42.115000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-565e3ab7:132f6a7f42e:-7ffd', '1', 'B201100000', null, to_timestamp('12-10-2011 13:59:22.453000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('613b3df4:13357fe5a3c:-7fff', '88', 'B201100025', null, to_timestamp('31-10-2011 11:20:59.819000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('613b3df4:13357fe5a3c:-7ffe', '88', 'B201100025', null, to_timestamp('31-10-2011 11:21:25.413000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-4e8137b9:1336231ac07:-8000', '1', 'B201100018', null, to_timestamp('02-11-2011 10:52:55.991000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ff2', 'admin', 'B201100046', null, to_timestamp('17-11-2011 14:42:10.046000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3c17c612:133b5e37b9b:-8000', 'admin', 'B201100045', null, to_timestamp('18-11-2011 16:55:45.515000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1047da87:132801b07f6:-7fe8', '3', 'B201100020', null, to_timestamp('19-09-2011 15:15:25.615000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ffa', 'admin', 'B201100046', null, to_timestamp('17-11-2011 14:38:25.718000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ff5', 'admin', 'B201100046', null, to_timestamp('17-11-2011 14:41:57.687000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('2046a1c8:133af65d3f4:-7ff0', 'admin', 'B201100046', null, to_timestamp('17-11-2011 14:42:19.171000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('6ba217e6:1327f6cd348:-7ffc', '3', 'B201100020', null, to_timestamp('19-09-2011 10:13:31.693000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fc6', '3', '3cfebef3:1328edc98f8:-7fed', null, to_timestamp('22-09-2011 15:44:47.296000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fc5', '3', 'B201100020', null, to_timestamp('22-09-2011 15:54:13.468000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-3587b61c:132a889e986:-8000', '1', 'B20110052', null, to_timestamp('27-09-2011 09:40:01.546000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ffe', '1', 'B201100031', null, to_timestamp('27-10-2011 15:44:25.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ffc', '1', 'B201100031', null, to_timestamp('27-10-2011 15:56:30.437000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7ff7', '1', 'B201100031', null, to_timestamp('27-10-2011 15:57:49.609000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fee', '1', 'B201100031', null, to_timestamp('27-10-2011 16:24:05.078000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 801 records committed...
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fe9', '1', 'B201100031', null, to_timestamp('27-10-2011 16:24:16.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-2a9cd565:133445606b7:-7fe3', '1', 'B201100032', null, to_timestamp('27-10-2011 16:24:48.218000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-561f73fd:13362055aa1:-7fff', 'admin', 'B201100019', null, to_timestamp('02-11-2011 10:05:07.773000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('-43c81c9c:13289db3ee8:-7ffe', '3', 'B201100020', null, to_timestamp('21-09-2011 11:05:14.602000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7ff9', '3', 'B201100015', null, to_timestamp('22-09-2011 10:19:52.109000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7ff2', '3', 'B201100020', null, to_timestamp('22-09-2011 10:48:59.406000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fef', '3', 'B201100020', null, to_timestamp('22-09-2011 10:49:42.343000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fc4', '3', 'B201100020', null, to_timestamp('22-09-2011 15:54:20.609000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7fc3', '3', 'B201100015', null, to_timestamp('22-09-2011 15:54:29.468000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('50848cc6:1337bcc5665:-7ff5', 'admin', 'B201100046', null, to_timestamp('07-11-2011 13:09:29.086000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7ffc', '3', 'B201100019', null, to_timestamp('22-09-2011 10:17:11.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('3cfebef3:1328edc98f8:-7ffa', '3', 'B201100020', null, to_timestamp('22-09-2011 10:19:46.062000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fdd', 'admin', 'B201100022', null, to_timestamp('14-11-2011 16:34:13.962000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fdb', 'admin', 'B201100022', null, to_timestamp('14-11-2011 16:37:12.157000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (ID, USER_ID, BIZ_ID, OP_STATUS, OP_TIME, DESCRIPTION, DAYS)
values ('1ccd9e68:133a0b65f75:-7fda', 'admin', 'B201100022', null, to_timestamp('14-11-2011 16:39:06.777000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 815 records loaded
prompt Loading JW_M_ROLE_BIZ...
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '598bb5c:132f0a26a93:-8000');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100015');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100001');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', '598bb5c:132f0a26a93:-8000');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100030');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100033');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100037');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '2879d6f8:131fa4a7057:-8000');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100000');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '3cfebef3:1328edc98f8:-7fed');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100016');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100016');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100001');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000003');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100028');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100029');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100032');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100035');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100036');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100000');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100010');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100000');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000001');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000002');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100015');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100010');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100001');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100010');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '31171d2c:132b99423bf:-8000');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100031');
insert into JW_M_ROLE_BIZ (ROLE_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100034');
commit;
prompt 31 records loaded
prompt Loading JW_M_ROLE_RES...
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'B201100029');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'B201100028');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '8', 'B201100028');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '8', 'B201100029');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '13', 'B201100029');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'B201100030');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '6', 'B201100030');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '2', 'B201100016');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '5', 'B201100016');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '1', 'B201100017');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '3', 'B201100017');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '1', '3cfebef3:1328edc98f8:-7fed');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '5', 'B201100028');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '10', 'B201100028');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100016');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '5', 'B201100029');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '10', 'B201100029');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'B201100030');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '8', 'B201100030');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100015');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '9', '31171d2c:132b99423bf:-8000');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100015');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '1', 'B201100016');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '2', 'B201100015');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100015');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '4', 'B201100016');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100017');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'B201100017');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'B201100018');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'B201100018');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '4', 'B201100018');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '2', 'B201100017');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', '598bb5c:132f0a26a93:-8000');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '5', '598bb5c:132f0a26a93:-8000');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100015');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100017');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100016');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100028');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'B201100028');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '4', 'B201100028');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '6', 'B201100028');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '7', 'B201100028');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '9', 'B201100028');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'B201100029');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100029');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '4', 'B201100029');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '6', 'B201100029');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '7', 'B201100029');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '9', 'B201100029');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '11', 'B201100029');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '12', 'B201100029');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100030');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '4', 'B201100030');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '5', 'B201100030');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '7', 'B201100030');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '9', 'B201100030');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '10', 'B201100030');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'S000000001');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'S000000001');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '6', '7adf59e3:132f0f4cce8:-8000');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100016');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'B201100016');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '5', 'B201100018');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100016');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '1', 'B201100015');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100017');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '9', '31171d2c:132b99423bf:-8000');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '3', 'B201100015');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'S000000001');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100016');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100016');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100017');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100015');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'B201100017');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100018');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'B201100020');
insert into JW_M_ROLE_RES (ROLE_ID, RES_ID, BIZ_ID)
values ('3cfebef3:1328edc98f8:-7ff5', '3', 'B201100016');
commit;
prompt 77 records loaded
prompt Loading JW_ROLE...
insert into JW_ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, CHANGE_DATE)
values ('29d4bcde:1326b18d4bf:-7fff', '角色1', '1', '20111118085428');
insert into JW_ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, CHANGE_DATE)
values ('3cfebef3:1328edc98f8:-7ff5', '角色3', '角色3', '20111118113649');
insert into JW_ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, CHANGE_DATE)
values ('29d4bcde:1326b18d4bf:-7ffe', '角色2', '2', '20111118085428');
commit;
prompt 3 records loaded
prompt Loading JW_SPCJ...
insert into JW_SPCJ (ID, DESCRIPTION, VIDEONAME, CREATETIME, DEVICE_ID, LENGTH)
values (202, '来自android 终端的视频', 'video_1308114367659.3gp', to_date('15-06-2011 13:05:45', 'dd-mm-yyyy hh24:mi:ss'), '3', '46.92K');
insert into JW_SPCJ (ID, DESCRIPTION, VIDEONAME, CREATETIME, DEVICE_ID, LENGTH)
values (221, '来自android 终端的视频', 'video_1308555686529.3gp', to_date('20-06-2011 15:41:25', 'dd-mm-yyyy hh24:mi:ss'), '3', '146.943K');
insert into JW_SPCJ (ID, DESCRIPTION, VIDEONAME, CREATETIME, DEVICE_ID, LENGTH)
values (201, '来自android 终端的视频', 'video_1308106765753.3gp', to_date('15-06-2011 10:59:05', 'dd-mm-yyyy hh24:mi:ss'), '3', '46.139K');
insert into JW_SPCJ (ID, DESCRIPTION, VIDEONAME, CREATETIME, DEVICE_ID, LENGTH)
values (203, '来自android 终端的视频', 'video_1308115281450.3gp', to_date('15-06-2011 13:20:56', 'dd-mm-yyyy hh24:mi:ss'), '3', '30.897K');
insert into JW_SPCJ (ID, DESCRIPTION, VIDEONAME, CREATETIME, DEVICE_ID, LENGTH)
values (241, '来自android 终端的视频', 'video_1308739154626.3gp', to_date('22-06-2011 18:39:25', 'dd-mm-yyyy hh24:mi:ss'), '3', '80.842K');
insert into JW_SPCJ (ID, DESCRIPTION, VIDEONAME, CREATETIME, DEVICE_ID, LENGTH)
values (321, '来自android 终端的视频', 'video_1311660502293.3gp', to_date('26-07-2011 14:08:27', 'dd-mm-yyyy hh24:mi:ss'), '3', '91.273K');
commit;
prompt 6 records loaded
prompt Loading JW_TPCJ...
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (3, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (4, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (5, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (6, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (7, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (8, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (9, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (10, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (11, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (12, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (13, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (14, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (15, '13', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (16, '12', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (17, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (18, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (1, '张张张张张张张张在大在在在在在大在在在在在在在在在', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (161, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (162, '1', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (105, '照片', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (106, '小时候车', 'picture_1308104243688.jpg', null, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (ID, DESCRIPTION, PICTURENAME, CREATEUSERID, CREATETIME, DEVICE_ID)
values (101, 'ytest', 'picture_1308104243688.jpg', null, to_date('15-06-2011 10:18:08', 'dd-mm-yyyy hh24:mi:ss'), '3');
commit;
prompt 22 records loaded
prompt Loading JW_TZTG...
insert into JW_TZTG (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME, SENDUSERNAME, SENDDEPTNAME)
values (521, 'TEST1', '1', 'TEST1', 'admin', to_date('24-10-2011 09:33:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', 'D:\', '5split2split1split3split', '警务测试用户0,警务测试用户1,警务测试用户4,警务测试用户5,', '0002split0004split0005split0008split0009split', '市局部门,一科,二科,三科,四科,', '超级管理员', '根组织单元');
insert into JW_TZTG (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME, SENDUSERNAME, SENDDEPTNAME)
values (523, '开会', '1', '任命大会', 'admin', to_date('10-11-2011 09:33:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', 'D:\', '5split2split1split3split', '?ˉ??2aê?ó??§0,?ˉ??2aê?ó??§1,?ˉ??2aê?ó??§4,?ˉ??2aê?ó??§5,', '0002split0004split0005split0008split0009split', 'êD??2???,ò???,?t??,èy??,????,', '3???1üàí?±', '?ù×é?ˉμ￥?a');
insert into JW_TZTG (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME, SENDUSERNAME, SENDDEPTNAME)
values (541, '测试通告', '3', '的发放大方法v', 'admin', to_date('27-10-2011 17:10:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', null, '6split4split5split2split1split3split', '警务测试用户2,警务测试用户3,警务测试用户0,警务测试用户1,警务测试用户4,警务测试用户5,', '0002split0004split0005split0008split0009split', '市局部门,一科,二科,三科,四科,', '超级管理员', '根组织单元');
insert into JW_TZTG (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME, SENDUSERNAME, SENDDEPTNAME)
values (542, '会议通知', '3', '啊的说法发得分大飞洒发第三方', 'admin', to_date('27-10-2011 17:13:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', null, '6split4split5split2split1split3split', '警务测试用户2,警务测试用户3,警务测试用户0,警务测试用户1,警务测试用户4,警务测试用户5,', '0001split0002split0004split0005split0008split0009split0003split0006split0007split222split11001split11111211split56split15splitdfssplit121split41651splitfdsfd splitdsfsplitfsdsplitweeesplitddfsplitfdgdfssplit44400split311111split411111split511111split21111split34567300split', '市局,市局部门,一科,二科,三科,四科,分县局,一队,二队,市局3,市局3,宝鸡111,县局,镇公安局,区局,12, 县公安局ss,dsfsd1,fdsf,sdfsd,fdsf,dfsdf,dfdg,西安,宝鸡2,宝鸡3,宝鸡4,宝鸡3,宝鸡,', '超级管理员', '根组织单元');
insert into JW_TZTG (ID, TITLE, TYPE, CONTENT, SENDUSERID, SENDTIME, SENDSTATUS, SENDDEPTID, UPLOADFILENAME, REQDEVICE_ID, REQUSERNAME, REQDEPTID, REQDEPTNAME, SENDUSERNAME, SENDDEPTNAME)
values (561, ' 接受任务', '2', '御敌 345345435', 'admin', null, '0', '00000', null, '6split4split', '警务测试用户2,警务测试用户3,', '0003split0006split0007split', '分县局,一队,二队,', '超级管理员', '根组织单元');
commit;
prompt 5 records loaded
prompt Loading JW_TZTGUSER...
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (522, 0, 521, '4', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (523, 0, 521, '5', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (525, 0, 521, '1', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (541, 0, 541, '6', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (547, 0, 541, '1', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (555, 0, 542, '6', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (560, 0, 542, '3', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (521, 0, 521, '6', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (544, 0, 541, '4', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (551, 0, 542, '1', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (558, 0, 542, '2', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (524, 0, 521, '2', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (542, 0, 541, '4', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (543, 0, 541, '6', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (548, 0, 541, '3', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (550, 0, 542, '2', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (554, 0, 542, '4', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (557, 0, 542, '5', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (526, 0, 521, '3', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (545, 0, 541, '5', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (552, 0, 542, '3', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (559, 0, 542, '1', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (546, 0, 541, '2', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (549, 0, 542, '5', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (553, 0, 542, '6', null);
insert into JW_TZTGUSER (ID, READSTATUS, NOTICEID, DEVICE_ID, RECEIVETIME)
values (556, 0, 542, '4', null);
commit;
prompt 26 records loaded
prompt Loading JW_UPDATE...
insert into JW_UPDATE (ID, NAME, NAME_COPY, TIME, DESCRIPTION, VERSION, STATE)
values ('19330043:13339b49dbe:-7ffd', 'xajw.apk', '1319523129218.apk', to_date('25-10-2011 14:47:08', 'dd-mm-yyyy hh24:mi:ss'), '更新程序', '1.2', '1');
commit;
prompt 1 records loaded
prompt Loading JW_USER...
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('-10577269:1338b7284ef:-7ffd', 'aaaaaa1', '1', '5678', '56856', '78678', '1', '0001', 'aaaaa2', 'F', '56856', null, null, '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('2b70bf0:133336e2f58:-7ffe', '88', '88', '88', '88', '88', '1', '610100020000', '88', 'F', '88', '29d4bcde:1326b18d4bf:-7fff', null, '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('-10577269:1338b7284ef:-7ffe', 'aaaaaa1', '1', '5689', '56856', '78679', '1', '0001', '1', 'F', '56856', null, null, '1');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('-3afc9a3c:132f0b3b93d:-8000', '警务测试用户5', '3', '3', '3', '3', '1', '0001', '3', 'F', '3', '3cfebef3:1328edc98f8:-7ff5', to_date('25-10-2011 10:10:00', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('-f5d9eb9:132a9972f8b:-8000', '警务测试用户4', '1', '1', '1', '1', '1', '0001', '1', 'F', '1', '29d4bcde:1326b18d4bf:-7fff', to_date('12-10-2011 14:39:35', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('48fe9eb5:132ebb4bb9b:-8000', '警务测试用户1', 'admin', '2', '123111230012276', '2', '1', '0001', 'admin', 'F', '2', '29d4bcde:1326b18d4bf:-7ffe', to_date('10-10-2011 11:10:00', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('5ec89d92:13323cbbc93:-8000', '警务测试用户0', '1', '1', '5', '1', '1', '0001', '222', 'F', '1', '29d4bcde:1326b18d4bf:-7fff', null, '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('-585d5b7c:1336c66b549:-8000', '1', '1', '1', '1', '1', '1', '610100000000', '11', 'F', '1', null, null, '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('-10577269:1338b7284ef:-7fff', 'aaaaaa', '1', '5678', '56856', '78678', '1', '0001', 'aaaaa', 'F', '56856', null, null, '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('5591591f:133afef5f4b:-8000', 'ttt', 'ttt', '212', '12', '2121', '1', '0001', 'ttt', 'F', 'ttt', '29d4bcde:1326b18d4bf:-7fff', null, '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('5591591f:133afef5f4b:-7fff', '111', '1111', '122222', '333333', '333333', '1', '0006', 'wwwwwwwww', 'F', '33333', '3cfebef3:1328edc98f8:-7ff5', null, '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('1197648c:13361d92b1b:-8000', 'aa', '123', '15088888888', '88888888', '88888888', '3', '0001', '123', 'F', '88888888', '29d4bcde:1326b18d4bf:-7fff', null, '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('-db59aa5:13386c5b266:-8000', '111', '111', '11', '1', '1', '1', '0007', '111', 'F', '11', '3cfebef3:1328edc98f8:-7ff5', null, '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('2eeafc5a:133251ad3b8:-8000', '警务测试用户2', '123', '1', '6', '1', '1', '0002', 'test22', 'F', '1', '29d4bcde:1326b18d4bf:-7fff', null, '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('1420cf81:13324310efe:-8000', '警务测试用户3', 'test', '1', '4', '1', '1', '0002', 'test', 'F', '1', '29d4bcde:1326b18d4bf:-7fff', null, '0');
insert into JW_USER (ID, NAME, PSW, SJHM, SJCM, JMKH, JZ, XZQH, ACCOUNT, XB, DESCRIPTION, JW_ROLE_ID, LOADTIME, ISLOCKED)
values ('-10577269:1338b7284ef:-7ffe', 'aaaaaa1', '1', '5678', '56856', '78678', '1', '0001', 'aaaaa1', 'F', '56856', null, null, '0');
commit;
prompt 16 records loaded
prompt Loading SYSTEM_MAP...
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('3', '增加', 'business');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('2', '查询', 'business');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('1', '列表菜单', 'business');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('0', '平铺菜单', 'business');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('0', '不验证', 'validate');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('1', '非空验证', 'validate');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('2', '身份证验证', 'validate');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('3', '手机验证', 'validate');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('4', '固定电话', 'validate');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('5', '数字验证', 'validate');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('6', '日期验证', 'validate');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('7', '特殊字符验证', 'validate');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('0', 'like', 'condition');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('1', '>', 'condition');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('2', '<', 'condition');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('3', '=', 'condition');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('1', '男', 'XB');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('2', '女', 'XB');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('1', '否', 'isnull');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('1', '否', 'isleaf');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('0', '是', 'isleaf');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('0', '是', 'isnull');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('1', '否', 'isshow');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('0', '是', 'isshow');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('0', '详细', 'relatetype');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('1', '列表', 'relatetype');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('8', '其他', 'QCLB');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('7', '血检/尿检', 'QCLB');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('6', '拖移机动车', 'QCLB');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('5', '收缴物品', 'QCLB');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('4', '扣留行驶证', 'QCLB');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('3', '扣留驾驶证', 'QCLB');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('2', '扣留非机动车', 'QCLB');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('1', '扣留机动车', 'QCLB');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('0', '否', 'haveres');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('TextSpinner', '下拉列表', 'w_type');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('1', '是', 'haveres');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('EditDate', '编辑框[日期]', 'w_type');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('SpinnersEdit', '下拉+编辑框', 'w_type');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('TextEdit', '编辑框[文本]', 'w_type');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('0', 'bizDS', 'datasource');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('1', 'bizDS_1', 'datasource');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('2', 'bizDS_2', 'datasource');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('3', 'bizDS_3', 'datasource');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('4', 'bizDS_4', 'datasource');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('5', 'bizDS_5', 'datasource');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('6', 'bizDS_6', 'datasource');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('7', 'bizDS_7', 'datasource');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('8', 'bizDS_8', 'datasource');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('9', 'bizDS_9', 'datasource');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('10', 'bizDS_10', 'datasource');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('7', '77777', '77');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('VARCHAR', 'VARCHAR', 'cname_type');
insert into SYSTEM_MAP (KEY, VALUE, TYPE)
values ('DATE', 'DATE', 'cname_type');
commit;
prompt 54 records loaded
prompt Loading SYSTEM_RES_CONFIG...
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('XB', '性别', 'select key,value from busi_map where type = ''XB''', '20111102144747', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('MZ', '民族', 'select key,value from busi_map where type = ''MZ''', '20110803160101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('CLLX', '车辆类型', 'select key,value from busi_map where type = ''CLLX''', '20110803160101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('HPZL', '号牌种类', 'select key,value from busi_map where type = ''HPZL''', '20110803160101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('AJZT', '案件状态', 'select key,value from busi_map where type = ''AJZT''', '20110803160101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('LKZJLX', '旅客证件类型', 'select key,value from busi_map where type = ''LKZJLX''', '20110803160101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('LGMC', '旅馆名称', 'select HNOHOTEL key,HNAME value from t_hotel  ', '20110803160101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('CJLB', '处警类别', 'select key,value from busi_map where type = ''CJLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('BJLX', '报警类型', 'select key,value from busi_map where type = ''BJLX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('DW', '单位', 'select * from busi_map where type = ''DW'' and key  like ''%61010009%''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('ZJZL', '证件类型', 'select key,value from busi_map where type = ''ZJZL''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('QZZL', '签证种类', 'select key,value from busi_map where type = ''QZZL''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('WBMC', '网吧名称', 'select YYCSDM key,YYCSMC value from JG_WBXX  ', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('WHCD', '文化程度', 'select key,value from busi_map where type = ''WHCD''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('ZZMM', '政治面貌', 'select key,value from busi_map where type = ''ZZMM''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('HYZK', '婚姻状况', 'select key,value from busi_map where type = ''HYZK''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('HKLB', '户口类别', 'select key,value from busi_map where type = ''HKLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('JSZZT', '驾驶证状态', 'select key,value from busi_map where type = ''JSZZT''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('ZJCX', '准驾车型', 'select key,value from busi_map where type = ''ZJCX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('CLYS', '车辆颜色', 'select key,value from busi_map where type = ''CLYS''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('AJSX', '案件属性', 'select key,value from busi_map where type = ''AJSX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('AJXZ', '案件性质', 'select key,value from busi_map where type = ''AJXZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('AJLY', '案件类型', 'select key,value from busi_map where type = ''AJLY''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('DBJB', '督捕级别', 'select key,value from busi_map where type = ''DBJB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('ZDRTLB', '重点人头类别', 'select key,value from busi_map where type = ''ZDRTLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('CJBS', '处警标识', 'select key,value from busi_map where type = ''CJBS''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('CJJG', '处警结果', 'select key,value from busi_map where type = ''CJJG''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('AFDZLB', '案发地址类别', 'select key,value from busi_map where type = ''AFDZLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('FWLX', '房屋类型', 'select key,value from busi_map where type = ''FWLX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('FWCQXZ', '房屋产权性质', 'select key,value from busi_map where type = ''FWCQXZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('GLJB', '管理级别', 'select key,value from busi_map where type = ''GLJB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('ZXYY', '注销原因', 'select key,value from busi_map where type = ''ZXYY''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('NBGLBM', '内保管理部门', 'select key,value from busi_map where type = ''NBGLBM''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('JGDQ', '籍贯地区', 'select key,value from busi_map where type = ''JGDQ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('JTGX', '家庭关系', 'select key,value from busi_map where type = ''JTGX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('ZZSY', '暂住事由', 'select key,value from busi_map where type = ''ZZSY''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('TSHK', '特殊户口', 'select key,value from busi_map where type =''TSHK''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('FZJG', '发证机关', 'select key,value from busi_map where type = ''FZJG''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('XZQH', '行政区划', 'select key,value from busi_map where type = ''XZQH''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('GNZJ', '国内证件', 'select key,value from busi_map where type = ''GNZJ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('JZYY', '寄住原因', 'select key,value from busi_map where type = ''JZYY''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('ZW', '职务', 'select key,value from busi_map where type = ''ZW''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('SFXXY', '是否信息员', 'select key,value from busi_map where type = ''SFXXY''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('CZYT', '出租用途', 'select key,value from busi_map where type = ''CZYT''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('FWZT', '房屋状态', 'select key,value from busi_map where type = ''FWZT''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('RYLB', '人员类别', 'select key,value from busi_map where type = ''RYLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('DJDWLX', '登记单位类型', 'select key,value from busi_map where type = ''DJDWLX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('THLB', '特行类别', 'select key,value from busi_map where type = ''THLB''', '20110808150101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('XJDJ', '星级等级', 'select key,value from busi_map where type = ''XJDJ''', '20110808150101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('ZXBS', '注销标识', 'select key,value from busi_map where type = ''ZXBS''', '20110808150101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('SFZBG', '是否住宾馆', 'select key,value from busi_map where type = ''SFZBG''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('BARYXZ', '保安人员性质', 'select key,value from busi_map where type = ''BARYXZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('PZGW', '派驻岗位', 'select key,value from busi_map where type = ''PZGW''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('BMJB', '保密级别', 'select key,value from busi_map where type = ''BMJB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('YW', '有无', 'select key,value from busi_map where type = ''YW''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('ZYLB', '职业类别', 'select key,value from busi_map where type = ''ZYLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('WWXX', '维稳信息', 'select key,value from busi_map where type = ''WWXX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('ZZCS', '暂住处所', 'select key,value from busi_map where type = ''ZZCS''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('DJ', '等级', 'select key,value from busi_map where type = ''DJ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('BWJGSZ', '保卫机构设置', 'select key,value from busi_map where type = ''BWJGSZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('DWXZ', '单位性质', 'select key,value from busi_map where type = ''DWXZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('ZYBWJB', '重要部位级别', 'select key,value from busi_map where type = ''ZYBWJB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('SFZZL', '身份证种类', 'select key,value from busi_map where type = ''SFZZL''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('GGCSDJ', '公共场所等级', 'select key,value from busi_map where type = ''GGCSDJ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('CSLB', '场所类别', 'select key,value from busi_map where type = ''CSLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('RYGX', '人员关系', 'select key,value from busi_map where type = ''RYGX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('NBJGXZ', '内保机构性质', 'select key,value from busi_map where type = ''NBJGXZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('JGLX', '机构类型', 'select key,value from busi_map where type = ''JGLX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('HYLB', '行业类别', 'select key,value from busi_map where type = ''HYLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('JJXZ', '经济性质', 'select key,value from busi_map where type = ''JJXZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('XFDJ', '消防等级', 'select key,value from busi_map where type = ''XFDJ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('CLJG', '处理结果', 'select key,value from busi_map where type = ''CLJG''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('BAZGZW', '保安主管职务', 'select key,value from busi_map where type = ''BAZGZW''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('ZDDJ', '重点等级', 'select key,value from busi_map where type = ''ZDDJ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('GYDWLX', '雇佣单位类型', 'select key,value from busi_map where type = ''GYDWLX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('MPHZ', '门牌后缀', 'select key,value from busi_map where type = ''MPHZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('SFSW', '是否涉外', 'select key,value from busi_map where type = ''SFSW''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('FSCS', '发生场所', 'select key,value from busi_map where type = ''FSCS''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('SF', '是否', 'select key,value from busi_map where type = ''SF''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('BJJB', '报警级别', 'select key,value from busi_map where type = ''BJJB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('ZXDZBZ', '专项斗争标志', 'select key,value from busi_map where type = ''ZXDZBZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('JCJ_CLLX', '处理类型', 'select key,value from busi_map where type = ''JCJ_CLLX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('FAB', '副案别', 'select key,value from busi_map where type = ''FAB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('AJLB', '案件类别', 'select key,value from busi_map where type = ''AJLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('MJ', '密级', 'select key,value from busi_map where type = ''MJ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100015', '常住人口信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100015''', '20110920172844', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100016', '暂住人口信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100016''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100017', '驾驶员员信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100017''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100019', '寄主人员信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100019''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100022', '在逃人员信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100022''', '20110919131927', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100042', '机构信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100042''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100031', '机动车辆查询', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100031''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100020', '单位从人员业', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100020''', '20110919131840', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100023', '房屋出租户主', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100023''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100024', '保安人员信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100024''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100025', '上网人员信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100025''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100027', '巡逻盘查车辆信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100027''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100028', '接处警信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100028''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100029', '刑事案件信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100029''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100030', '行政案件信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100030''', '20110811080101', 'bizDS_1');
commit;
prompt 101 records committed...
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100032', '网吧信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100032''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100033', '特种行业', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100033''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100034', '公共场所', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100034''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100035', '保安公司', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100035''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100036', '涉外单位', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100036''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100037', '内保单位', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100037''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100041', '巡逻盘查人员信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100041''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100043', '处警信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100043''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100018', '人员住宿信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100018''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100021', '境外人员住宿信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100021''', '20110919131902', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('S000000001', '密码设置', 'select COLUMNS key,CNAME value from column_map where b_id = ''S000000001''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('3cfebef3:1328edc98f8:-7fed', '王鹏', 'select COLUMNS key,CNAME value from column_map where b_id = ''3cfebef3:1328edc98f8:-7fed''', '20111110093830', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100044', '通知通告', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100044''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100045', '通讯录', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100045''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (RES_ID, RES_NAME, SOURCE, CHANGE_DATE, DS)
values ('B201100046', '法律法规', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100046''', '20110811080101', 'bizDS_1');
commit;
prompt 115 records loaded
prompt Loading TAB_INFO...
insert into TAB_INFO (TAB_ID, B_ID, TAB_NAME)
values (1, '2879d6f8:131fa4a7057:-8000', '11');
insert into TAB_INFO (TAB_ID, B_ID, TAB_NAME)
values (0, '31171d2c:132b99423bf:-8000', 'a1');
insert into TAB_INFO (TAB_ID, B_ID, TAB_NAME)
values (1, '31171d2c:132b99423bf:-8000', 'aa1');
insert into TAB_INFO (TAB_ID, B_ID, TAB_NAME)
values (2, '31171d2c:132b99423bf:-8000', 'a2');
commit;
prompt 4 records loaded
prompt Enabling triggers for BUSINESS_CONFIG...
alter table BUSINESS_CONFIG enable all triggers;
prompt Enabling triggers for BUSINESS_RELATED...
alter table BUSINESS_RELATED enable all triggers;
prompt Enabling triggers for BUSINESS_RES_CONFIG...
alter table BUSINESS_RES_CONFIG enable all triggers;
prompt Enabling triggers for COLUMN_MAP...
alter table COLUMN_MAP enable all triggers;
prompt Enabling triggers for IMG_INFO...
alter table IMG_INFO enable all triggers;
prompt Enabling triggers for JW_ADDRESS...
alter table JW_ADDRESS enable all triggers;
prompt Enabling triggers for JW_FILE_INFO...
alter table JW_FILE_INFO enable all triggers;
prompt Enabling triggers for JW_GPS_CONFIG...
alter table JW_GPS_CONFIG enable all triggers;
prompt Enabling triggers for JW_GPS_DATA...
alter table JW_GPS_DATA enable all triggers;
prompt Enabling triggers for JW_JZ...
alter table JW_JZ enable all triggers;
prompt Enabling triggers for JW_LAW...
alter table JW_LAW enable all triggers;
prompt Enabling triggers for JW_LOG...
alter table JW_LOG enable all triggers;
prompt Enabling triggers for JW_M_ROLE_BIZ...
alter table JW_M_ROLE_BIZ enable all triggers;
prompt Enabling triggers for JW_M_ROLE_RES...
alter table JW_M_ROLE_RES enable all triggers;
prompt Enabling triggers for JW_ROLE...
alter table JW_ROLE enable all triggers;
prompt Enabling triggers for JW_SPCJ...
alter table JW_SPCJ enable all triggers;
prompt Enabling triggers for JW_TPCJ...
alter table JW_TPCJ enable all triggers;
prompt Enabling triggers for JW_TZTG...
alter table JW_TZTG enable all triggers;
prompt Enabling triggers for JW_TZTGUSER...
alter table JW_TZTGUSER enable all triggers;
prompt Enabling triggers for JW_UPDATE...
alter table JW_UPDATE enable all triggers;
prompt Enabling triggers for JW_USER...
alter table JW_USER enable all triggers;
prompt Enabling triggers for SYSTEM_MAP...
alter table SYSTEM_MAP enable all triggers;
prompt Enabling triggers for SYSTEM_RES_CONFIG...
alter table SYSTEM_RES_CONFIG enable all triggers;
prompt Enabling triggers for TAB_INFO...
alter table TAB_INFO enable all triggers;
set feedback on
set define on
prompt Done.

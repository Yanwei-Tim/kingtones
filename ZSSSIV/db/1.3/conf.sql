prompt PL/SQL Developer import file
prompt Created on 2012年2月24日 星期五 by Administrator
set feedback off
set define off
prompt Creating BUSINESS_CONFIG...
create table BUSINESS_CONFIG
(
  b_id           VARCHAR2(50) not null,
  b_name         VARCHAR2(50) not null,
  b_type         VARCHAR2(1) not null,
  img_name       VARCHAR2(30),
  l_simple_items VARCHAR2(100),
  d_simple_items VARCHAR2(1000),
  d_sql          VARCHAR2(1000),
  father_id      VARCHAR2(50) not null,
  final_node     VARCHAR2(1) default '1' not null,
  edit_res_date  VARCHAR2(14) not null,
  l_sql          VARCHAR2(1000),
  b_orders       NUMBER,
  ds             VARCHAR2(100),
  validate_res   VARCHAR2(1000),
  validate_des   VARCHAR2(1000)
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
  b_id     VARCHAR2(50),
  r_id     VARCHAR2(50),
  r_column VARCHAR2(50),
  r_type   VARCHAR2(1)
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
comment on column BUSINESS_RELATED.b_id
  is '业务标记';
comment on column BUSINESS_RELATED.r_id
  is '关联业务标记';
comment on column BUSINESS_RELATED.r_column
  is '关联字段（客户字段）';
comment on column BUSINESS_RELATED.r_type
  is '关联到详细，还是列表(0：详细信息；1、列表信息)';

prompt Creating BUSINESS_RES_CONFIG...
create table BUSINESS_RES_CONFIG
(
  w_id          NUMBER not null,
  b_id          VARCHAR2(50) not null,
  name          VARCHAR2(50) not null,
  type          VARCHAR2(30) not null,
  res_id        VARCHAR2(30),
  visible       NUMBER not null,
  validate_type VARCHAR2(2),
  validate_des  VARCHAR2(255),
  code          VARCHAR2(30) not null,
  datatype      VARCHAR2(50),
  isbenull      NUMBER not null,
  orders        NUMBER not null,
  tabgroup      NUMBER
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
comment on column BUSINESS_RES_CONFIG.w_id
  is '组件标记(复合主键)';
comment on column BUSINESS_RES_CONFIG.b_id
  is '业务标记，用于服务器端进行业务处理的标示(复合主键)';
comment on column BUSINESS_RES_CONFIG.name
  is '组件标题，组件说明';
comment on column BUSINESS_RES_CONFIG.type
  is '组件类型  详见《组件说明》';
comment on column BUSINESS_RES_CONFIG.res_id
  is '组件数据来源';
comment on column BUSINESS_RES_CONFIG.visible
  is '组件是否显示，0表示显示，1表示不显示';
comment on column BUSINESS_RES_CONFIG.validate_type
  is '验证类型';
comment on column BUSINESS_RES_CONFIG.validate_des
  is '验证失败后的验证说明';
comment on column BUSINESS_RES_CONFIG.code
  is '系统字段';
comment on column BUSINESS_RES_CONFIG.datatype
  is '用于验证数据类型;*后面数字为类型的大小 ';
comment on column BUSINESS_RES_CONFIG.isbenull
  is '是否可以为空;默认0可以为空;1不能为空';
comment on column BUSINESS_RES_CONFIG.orders
  is '用于排序显示字段顺序';
comment on column BUSINESS_RES_CONFIG.tabgroup
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
  columns    VARCHAR2(20) not null,
  b_id       VARCHAR2(50) not null,
  cname      VARCHAR2(30) not null,
  table_name VARCHAR2(30),
  c_column   VARCHAR2(500),
  cname_type VARCHAR2(30),
  is_res     VARCHAR2(1),
  res_id     VARCHAR2(20),
  op         VARCHAR2(20)
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
comment on column COLUMN_MAP.columns
  is '系统字段(复合主键)';
comment on column COLUMN_MAP.b_id
  is '业务标记(复合主键)';
comment on column COLUMN_MAP.cname
  is '系统字段名称';
comment on column COLUMN_MAP.table_name
  is '否	相对应客户表的表名';
comment on column COLUMN_MAP.c_column
  is '对应客户字段';
comment on column COLUMN_MAP.cname_type
  is '关联字段数据类型';
comment on column COLUMN_MAP.is_res
  is '是否有资源';
comment on column COLUMN_MAP.res_id
  is '资源分类ID';
comment on column COLUMN_MAP.op
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
  img_name VARCHAR2(30) not null,
  img_path VARCHAR2(255) not null,
  img_des  VARCHAR2(255) not null
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
comment on column IMG_INFO.img_name
  is '图片名称(不含后缀) (主键)';
comment on column IMG_INFO.img_path
  is '图片路径（使用与后台管理系统）';
comment on column IMG_INFO.img_des
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
  addid     NUMBER not null,
  name      VARCHAR2(10),
  deptid    NUMBER,
  mobile    VARCHAR2(20),
  unittel   VARCHAR2(20),
  hometel   VARCHAR2(20),
  remark    VARCHAR2(100),
  duty      VARCHAR2(60),
  sort      NUMBER,
  mobile2   VARCHAR2(20),
  unittel2  VARCHAR2(20),
  deptnames VARCHAR2(200),
  email     VARCHAR2(60)
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
comment on column JW_ADDRESS.addid
  is '通讯录编号';
comment on column JW_ADDRESS.name
  is '人员姓名';
comment on column JW_ADDRESS.deptid
  is '所在单位编号';
comment on column JW_ADDRESS.mobile
  is '手机';
comment on column JW_ADDRESS.unittel
  is '单位电话';
comment on column JW_ADDRESS.hometel
  is '家庭电话';
comment on column JW_ADDRESS.remark
  is '备注';
comment on column JW_ADDRESS.duty
  is '职务';
comment on column JW_ADDRESS.sort
  is '排序号';
comment on column JW_ADDRESS.mobile2
  is '手机号2';
comment on column JW_ADDRESS.unittel2
  is '单位电话2';
comment on column JW_ADDRESS.deptnames
  is '机构名称';
comment on column JW_ADDRESS.email
  is '邮件';

prompt Creating JW_FILE_INFO...
create table JW_FILE_INFO
(
  filename   VARCHAR2(100) not null,
  username   VARCHAR2(50),
  uploaddate DATE
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
comment on column JW_FILE_INFO.filename
  is '文件名称';
comment on column JW_FILE_INFO.username
  is '上传用户';
comment on column JW_FILE_INFO.uploaddate
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
  userid   VARCHAR2(32),
  state    NUMBER default 1,
  interval NUMBER default 5
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
comment on column JW_GPS_CONFIG.userid
  is '用户名';
comment on column JW_GPS_CONFIG.state
  is '开关0=关闭，1=开启';
comment on column JW_GPS_CONFIG.interval
  is 'gps上报时间间隔单位（秒）';

prompt Creating JW_GPS_DATA...
create table JW_GPS_DATA
(
  deviceid  VARCHAR2(16),
  x         VARCHAR2(32),
  y         VARCHAR2(32),
  datetime  DATE default sysdate,
  speed     VARCHAR2(32),
  direction VARCHAR2(32),
  imsi      VARCHAR2(16),
  userid    VARCHAR2(32)
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
comment on column JW_GPS_DATA.deviceid
  is '设备串号';
comment on column JW_GPS_DATA.x
  is '维度';
comment on column JW_GPS_DATA.y
  is '精度';
comment on column JW_GPS_DATA.datetime
  is '时间';
comment on column JW_GPS_DATA.speed
  is '速度';
comment on column JW_GPS_DATA.direction
  is '方向';
comment on column JW_GPS_DATA.imsi
  is 'imsi码';
comment on column JW_GPS_DATA.userid
  is '用户ID';

prompt Creating JW_JZ...
create table JW_JZ
(
  id          VARCHAR2(50) not null,
  name        VARCHAR2(50) not null,
  description VARCHAR2(1024) not null
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
comment on column JW_JZ.id
  is '警种编号';
comment on column JW_JZ.name
  is '警种名称';
comment on column JW_JZ.description
  is '警种描述';

prompt Creating JW_LAW...
create table JW_LAW
(
  law_id             NUMBER not null,
  law_code           VARCHAR2(50),
  law_name           VARCHAR2(50),
  administration     VARCHAR2(200),
  irregularityaction VARCHAR2(200),
  law_type           CHAR(4)
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
comment on column JW_LAW.law_id
  is '法规ID';
comment on column JW_LAW.law_code
  is '法规代码';
comment on column JW_LAW.law_name
  is '法规名称';
comment on column JW_LAW.administration
  is '颁布事件';
comment on column JW_LAW.irregularityaction
  is '法规内容';
comment on column JW_LAW.law_type
  is '法规类型';

prompt Creating JW_LOG...
create table JW_LOG
(
  id          VARCHAR2(50) not null,
  user_id     VARCHAR2(50),
  biz_id      VARCHAR2(50),
  op_status   VARCHAR2(50),
  op_time     TIMESTAMP(6),
  description VARCHAR2(50),
  days        NUMBER
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
comment on column JW_LOG.id
  is '日志ID';
comment on column JW_LOG.user_id
  is '用户账号';
comment on column JW_LOG.biz_id
  is '业务ID';
comment on column JW_LOG.op_status
  is '操作状态';
comment on column JW_LOG.op_time
  is '操作时间';
comment on column JW_LOG.description
  is '备注';
comment on column JW_LOG.days
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
  role_id VARCHAR2(50) not null,
  biz_id  VARCHAR2(50) not null
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
  role_id VARCHAR2(50) not null,
  res_id  VARCHAR2(50) not null,
  biz_id  VARCHAR2(50) not null
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
  role_id     VARCHAR2(50) not null,
  role_name   VARCHAR2(50) not null,
  role_desc   VARCHAR2(200),
  change_date VARCHAR2(30) not null
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
  id          NUMBER not null,
  description VARCHAR2(500),
  videoname   VARCHAR2(50) not null,
  createtime  DATE not null,
  device_id   VARCHAR2(30) not null,
  length      VARCHAR2(10)
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
comment on column JW_SPCJ.id
  is '主键ID';
comment on column JW_SPCJ.description
  is '消息内容';
comment on column JW_SPCJ.videoname
  is '视频名称';
comment on column JW_SPCJ.createtime
  is '创建时间';
comment on column JW_SPCJ.device_id
  is '手机串号';
comment on column JW_SPCJ.length
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

prompt Creating JW_SPJK...
create table JW_SPJK
(
  id          VARCHAR2(50) not null,
  ip          VARCHAR2(20),
  port        VARCHAR2(10),
  point       VARCHAR2(10),
  jk_state    CHAR(1),
  order_id    NUMBER,
  description VARCHAR2(50)
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
comment on column JW_SPJK.id
  is '主键ID';
comment on column JW_SPJK.ip
  is 'ip地址';
comment on column JW_SPJK.port
  is '端口';
comment on column JW_SPJK.point
  is '采集点';
comment on column JW_SPJK.jk_state
  is '是否可用';
comment on column JW_SPJK.order_id
  is '排序';
comment on column JW_SPJK.description
  is '描述备注';
alter table JW_SPJK
  add constraint PK_T_SPJK primary key (ID)
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
  id           NUMBER not null,
  description  VARCHAR2(500),
  picturename  VARCHAR2(50) not null,
  createuserid NUMBER,
  createtime   DATE,
  device_id    VARCHAR2(30)
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
comment on column JW_TPCJ.id
  is '主键ID';
comment on column JW_TPCJ.description
  is '消息内容';
comment on column JW_TPCJ.picturename
  is '图片名称';
comment on column JW_TPCJ.createuserid
  is '创建人';
comment on column JW_TPCJ.createtime
  is '创建时间';
comment on column JW_TPCJ.device_id
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
  id             NUMBER not null,
  title          VARCHAR2(100) not null,
  type           VARCHAR2(10) not null,
  content        VARCHAR2(2000) not null,
  senduserid     VARCHAR2(50),
  sendtime       DATE,
  sendstatus     VARCHAR2(50) default 0 not null,
  senddeptid     VARCHAR2(50),
  uploadfilename VARCHAR2(4000),
  reqdevice_id   VARCHAR2(2000),
  requsername    VARCHAR2(2000),
  reqdeptid      VARCHAR2(2000),
  reqdeptname    VARCHAR2(2000),
  sendusername   VARCHAR2(100),
  senddeptname   VARCHAR2(100)
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
comment on column JW_TZTG.id
  is '主键ID';
comment on column JW_TZTG.title
  is '消息标题';
comment on column JW_TZTG.type
  is '消息类型（协查通报=1，通知通告=2，会议通知=3）';
comment on column JW_TZTG.content
  is '消息具体内容';
comment on column JW_TZTG.senduserid
  is '发送人（登录用户名ID）';
comment on column JW_TZTG.sendtime
  is '发送时间是系统默认时间';
comment on column JW_TZTG.sendstatus
  is '发送状态。0=未发送,1=已发送';
comment on column JW_TZTG.senddeptid
  is '发送单位（登录用户所属单元ID）';
comment on column JW_TZTG.uploadfilename
  is '上传文件的名字';
comment on column JW_TZTG.reqdevice_id
  is '接收方手机串码字符集';
comment on column JW_TZTG.requsername
  is '接收方姓名字符集';
comment on column JW_TZTG.reqdeptid
  is '接收方单位行政区划字符集';
comment on column JW_TZTG.reqdeptname
  is '接收方单位名称字符集';
comment on column JW_TZTG.sendusername
  is '发送用户姓名';
comment on column JW_TZTG.senddeptname
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
  id          NUMBER not null,
  readstatus  NUMBER default 0,
  noticeid    NUMBER not null,
  device_id   VARCHAR2(30),
  receivetime DATE
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
comment on column JW_TZTGUSER.id
  is '主键ID';
comment on column JW_TZTGUSER.readstatus
  is '是否已阅状态0=未阅读;1=已阅读';
comment on column JW_TZTGUSER.noticeid
  is 'NOTICE外键';
comment on column JW_TZTGUSER.device_id
  is '手机串号';
comment on column JW_TZTGUSER.receivetime
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

prompt Creating JW_TZTG_READ_INFO...
create table JW_TZTG_READ_INFO
(
  id       NUMBER not null,
  account  VARCHAR2(50) not null,
  readtime DATE not null
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
comment on table JW_TZTG_READ_INFO
  is '已读通知通告表';
comment on column JW_TZTG_READ_INFO.id
  is '通知通告ID';
comment on column JW_TZTG_READ_INFO.account
  is '用户Id';
comment on column JW_TZTG_READ_INFO.readtime
  is '读取时间';

prompt Creating JW_UPDATE...
create table JW_UPDATE
(
  id          VARCHAR2(50) not null,
  name        VARCHAR2(50) not null,
  name_copy   VARCHAR2(50) not null,
  time        DATE not null,
  description VARCHAR2(200) not null,
  version     VARCHAR2(200),
  state       VARCHAR2(10)
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
comment on column JW_UPDATE.id
  is '主键ID';
comment on column JW_UPDATE.name
  is '本地文件名';
comment on column JW_UPDATE.name_copy
  is '更新后的文件名';
comment on column JW_UPDATE.time
  is '更新时间';
comment on column JW_UPDATE.description
  is '备注';
comment on column JW_UPDATE.version
  is '版本号';
comment on column JW_UPDATE.state
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
  id                 VARCHAR2(50) not null,
  name               VARCHAR2(50) not null,
  psw                VARCHAR2(50) not null,
  sjhm               VARCHAR2(100) not null,
  sjcm               VARCHAR2(100) not null,
  jmkh               VARCHAR2(100) not null,
  jz                 VARCHAR2(100) not null,
  xzqh               VARCHAR2(50) not null,
  account            VARCHAR2(50) not null,
  xb                 VARCHAR2(50) not null,
  description        VARCHAR2(300),
  jw_role_id         VARCHAR2(50),
  loadtime           DATE,
  islocked           VARCHAR2(1),
  login_failed_count NUMBER default 0 not null
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
comment on column JW_USER.id
  is '主键ID';
comment on column JW_USER.name
  is '用户名(中文)';
comment on column JW_USER.psw
  is '密码';
comment on column JW_USER.sjhm
  is '手机号码';
comment on column JW_USER.sjcm
  is '手机串号';
comment on column JW_USER.jmkh
  is '加密卡号';
comment on column JW_USER.jz
  is '警种';
comment on column JW_USER.xzqh
  is '行政区划';
comment on column JW_USER.account
  is '登录账户';
comment on column JW_USER.xb
  is '性别';
comment on column JW_USER.description
  is '描述信息';
comment on column JW_USER.jw_role_id
  is '警务角色id';
comment on column JW_USER.loadtime
  is '是否在线';
comment on column JW_USER.islocked
  is '是否锁定';
comment on column JW_USER.login_failed_count
  is '距最近一次成功登录之后登录失败计数';

prompt Creating SYSTEM_MAP...
create table SYSTEM_MAP
(
  key   VARCHAR2(50) not null,
  value VARCHAR2(50) not null,
  type  VARCHAR2(30) not null
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
comment on column SYSTEM_MAP.key
  is '类型标示';
comment on column SYSTEM_MAP.value
  is '类型说明';
comment on column SYSTEM_MAP.type
  is '所属类别';

prompt Creating SYSTEM_RES_CONFIG...
create table SYSTEM_RES_CONFIG
(
  res_id      VARCHAR2(50) not null,
  res_name    VARCHAR2(30) not null,
  source      VARCHAR2(400) not null,
  change_date VARCHAR2(30) not null,
  ds          VARCHAR2(100)
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
comment on column SYSTEM_RES_CONFIG.res_id
  is '资源分类标识(主键)';
comment on column SYSTEM_RES_CONFIG.res_name
  is '资源分类名称';
comment on column SYSTEM_RES_CONFIG.source
  is '系统的数据来源，可以写sql';
comment on column SYSTEM_RES_CONFIG.change_date
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

prompt Creating SYSTEM_SQLITE_SYNCH...
create table SYSTEM_SQLITE_SYNCH
(
  role_id     VARCHAR2(50) not null,
  file_name   VARCHAR2(300),
  synch_date  VARCHAR2(30),
  file_length NUMBER default 0 not null
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
comment on column SYSTEM_SQLITE_SYNCH.role_id
  is '角色ID。（如果角色ID为“all”代表无角色ID，更新所有数据）';
comment on column SYSTEM_SQLITE_SYNCH.file_name
  is '服务器端对应角色ID最新版本sqlite文件名。';
comment on column SYSTEM_SQLITE_SYNCH.synch_date
  is 'sqlite文件最新版本时间。';
comment on column SYSTEM_SQLITE_SYNCH.file_length
  is 'sqlite文件长度，单位byte，默认值为0。';
alter table SYSTEM_SQLITE_SYNCH
  add constraint ROLE_ID_PK primary key (ROLE_ID)
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

prompt Creating TAB_INFO...
create table TAB_INFO
(
  tab_id   NUMBER not null,
  b_id     VARCHAR2(50) not null,
  tab_name VARCHAR2(30) not null
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
comment on column TAB_INFO.tab_id
  is '选项卡标识(复合主键)';
comment on column TAB_INFO.b_id
  is '业务标记 (复合主键)';
comment on column TAB_INFO.tab_name
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

prompt Creating TEST_IMG...
create table TEST_IMG
(
  id      VARCHAR2(40),
  name    VARCHAR2(40),
  idcode  VARCHAR2(40),
  nohotel VARCHAR2(40),
  bdate   VARCHAR2(40),
  num     VARCHAR2(40),
  imgpath VARCHAR2(100)
)
tablespace XASGAJ
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating T_SYSTEMLOG...
create table T_SYSTEMLOG
(
  id         NUMBER not null,
  userid     VARCHAR2(20),
  accessmsg  VARCHAR2(50),
  equipment  VARCHAR2(30),
  devid      VARCHAR2(36),
  ip         VARCHAR2(15),
  logtype    CHAR(1),
  createdate DATE,
  phonetype  VARCHAR2(20),
  modeuleid  NUMBER
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
comment on table T_SYSTEMLOG
  is '日志表';
comment on column T_SYSTEMLOG.id
  is '编号';
comment on column T_SYSTEMLOG.userid
  is '用户账号';
comment on column T_SYSTEMLOG.accessmsg
  is '操作';
comment on column T_SYSTEMLOG.equipment
  is '浏览器';
comment on column T_SYSTEMLOG.devid
  is '设备号';
comment on column T_SYSTEMLOG.ip
  is 'IP';
comment on column T_SYSTEMLOG.logtype
  is '系统类型，0表示后台，1表示终端';
comment on column T_SYSTEMLOG.createdate
  is '时间';
comment on column T_SYSTEMLOG.phonetype
  is '终端机型';
comment on column T_SYSTEMLOG.modeuleid
  is '模块编号';
alter table T_SYSTEMLOG
  add constraint PK_T_SYSTEMLOG primary key (ID)
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

prompt Loading BUSINESS_CONFIG...
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000015', '通讯录', '0', 'aa', 'NAME,DEPTID,MOBILE,EMAIL', 'ADDID,NAME,DEPTID,MOBILE,UNITTEL,REMARK,DUTY,SORT,MOBILE2,UNITTEL2,DEPTNAMES,EMAIL', 'select @ from fw_conf_xa.jw_address t where 1=1 #ADDID# #NAME#', 'B201100006', '1', '20120217144956', 'select @ from fw_conf_xa.jw_address t where 1=1 #NAME# #DEPTID#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000014', '法律法规', '9', 'aa', 'LAW_ID,LAW_CODE,LAW_NAME,LAW_TYPE', 'LAW_ID,LAW_CODE,LAW_NAME,ADMINISTRATION,IRREGULARITYACTION,LAW_TYPE', 'select @ from fw_conf_xa.jw_law t where 1=1  #LAW_CODE# ', 'B201100006', '1', '20111222132658', 'select @ from fw_conf_xa.jw_law t where 1=1 #LAW_CODE# #LAW_NAME# #LAW_TYPE#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100098', '公文审核', '5', null, null, 'ID,GWBT,WZ,JJCD,CJYJ,SHYJ', 'select @ from xasgaj.OA_GWSH t where 1=1 #ID#', 'B201100099', '1', '20120216130740', 'update xasgaj.OA_GWSH set CJYJ=#CJYJ#,SHYJ=#SHYJ# where ID=#ID#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100099', '待办公文审批', '6', 'aa', 'WZ,GWBT,JJCD,BLSJ,ID', 'GWBT,WZ,JJCD,BLSJ,CJYJ,SHYJ', 'select @ from xasgaj.OA_GWSH t where 1=1 #ID#', 'B201100006', '1', '20111201110714', 'select @ from xasgaj.OA_GWSH t where 1=1 ', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000004', '资料交换', '1', 'zhcx', null, null, null, 'B201100006', '1', '20111219150129', null, 5, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000005', '待发资料信息', '0', 'zhcx', null, null, null, 'S000000004', '0', '20120223171903', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000006', '待收资料信息', '9', 'zhcx', null, null, null, 'S000000004', '0', '20111219150222', null, 2, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000007', '已收资料信息', '9', 'zhcx', null, null, null, 'S000000004', '0', '20111219150258', null, 3, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000008', '已发资料信息', '9', 'zhcx', null, null, null, 'S000000004', '0', '20111219150320', null, 4, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('-585bcf9a:13469b08262:-8000', 'test111', '2', 'ar', 'OP_TIME', 'OP_TIME,USER_ID', null, 'B201100010', '0', '20120215143019', '12', 11, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000009', '视频监控', '9', 'zhcx', null, null, null, 'S000000004', '0', '20111219150258', null, 3, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000010', '拍照', '9', 'zhcx', null, null, null, 'S000000004', '0', '20111219150258', null, 3, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000011', '视频', '9', 'zhcx', null, null, null, 'S000000004', '0', '20111219150258', null, 3, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000012', '蓝牙', '9', 'zhcx', null, null, null, 'S000000004', '0', '20111219150258', null, 3, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('3661e604:135a2ed32d4:-7fff', 'LEMON', '0', '111111111111', 'lemonName', 'lemonName', null, 'B201100000', '0', '20120222133812', null, 2, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('-627dffca:13579850b7c:-7ffa', 'test14', '0', '460', 'test14', 'test14', 'test14', 'B201100005', '0', '20120214110028', 'test14', 6, 'bizDS', 'test14', 'test14');
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('3661e604:135a2ed32d4:-7ffe', 'lemon', '0', 'Windows XP', null, null, null, '3661e604:135a2ed32d4:-7fff', '0', '20120222154221', null, 2, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('3661e604:135a2ed32d4:-7ffd', 'lemon', '0', 'Windows XP', null, null, null, '3661e604:135a2ed32d4:-7fff', '0', '20120222155214', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('3661e604:135a2ed32d4:-7ffc', 'qq', '0', '460', null, null, null, '3661e604:135a2ed32d4:-7fff', '0', '20120222155407', null, 2, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('3661e604:135a2ed32d4:-7ffb', 'test', '0', '460', null, null, null, '3661e604:135a2ed32d4:-7fff', '0', '20120222155513', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('3661e604:135a2ed32d4:-7ffa', 'test', '0', 'Windows XP', null, null, null, '3661e604:135a2ed32d4:-7fff', '0', '20120222155655', null, 3, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('3661e604:135a2ed32d4:-7ff9', 'test', '0', '460', null, null, null, '3661e604:135a2ed32d4:-7ffe', '0', '20120222155835', null, 3, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('3661e604:135a2ed32d4:-7ff8', 'test', '0', '460', null, null, null, '3661e604:135a2ed32d4:-7ffe', '0', '20120222161606', null, 3, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('3661e604:135a2ed32d4:-7ff7', 'aa', '0', 'Windows XP', null, null, null, '3661e604:135a2ed32d4:-7fff', '0', '20120222161914', null, 3, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('3661e604:135a2ed32d4:-7ff6', '11', '0', 'Windows XP', null, null, null, '3661e604:135a2ed32d4:-7fff', '0', '20120222161946', null, 3, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('3661e604:135a2ed32d4:-7ff5', 'cc', '0', 'Windows XP', null, null, null, '3661e604:135a2ed32d4:-7fff', '0', '20120222162227', null, 3, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('3661e604:135a2ed32d4:-7ff4', 'ss', '0', 'Windows XP', null, null, null, '3661e604:135a2ed32d4:-7fff', '0', '20120222162533', null, 2, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('3661e604:135a2ed32d4:-7ff3', 'lemonnew', '0', '460', 'name', 'name', null, '3661e604:135a2ed32d4:-7fff', '0', '20120222162937', 'select * from dual', 2, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000016', '执法规范', '9', 'zhcx', null, null, null, 'B201100000', '0', '20111219150211', null, 3, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100028', '接处警信息', '2', 'jcjxx', 'JJ_JJSJ,JJBH,JJ_JJR,JJ_JJDW', 'JJBH,JJ_AJBH,JJ_JJSJ,JJ_JJDW,JJ_JJR,JJ_CJR,JJ_CJSJ,JJ_CFBJ,JJ_BJDZRQ,JJ_BJRZZQH,JJ_BJRZZJX,JJ_BJRZZXZ,JJ_BJR,JJ_BJRXB,JJ_FXSJ,JJ_FXDD,JJ_AFDZLB,JJ_JQBT,JJ_BJXQDW,JJ_BJRCSRQ,JJ_BJRZJZL,JJ_BJRZH,JJ_LXDH,JJ_BJRDW,JJ_BJXS,JJ_BJJB,JJ_BJNR,JJ_ZXDZBZ,JJ_CLLX,JJ_BJAJZT,BJCZSJ,JJ_AJFSDZ,JJ_CJBS,JJ_CJDDDSJ,JJ_CJDJSSJ,JJ_CJDPJSJ,JJ_YJDW,JJ_YJR,JJ_YJSJ,JJ_YJSM', 'select @ from xasgaj.jcj_cjxx c,xasgaj.jcj_jjxx j where 1=1 #JJBH# #JJBH#', 'B201100011', '1', '20111228134958', 'select @ from xasgaj.jcj_cjxx c,xasgaj.jcj_jjxx j where 1=1 and c.cj_jjbh=j.jj_jjbh #JJ_BJXS# #JJ_BJR# #JJ_JJSJ# #JJ_JJDW# #JJ_JJR# #JJ_JJBH# #CJ_CJDW# #CJ_CJR# #CJ_CJBH# #CJ_CJLB#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100029', '刑事案件信息', '2', 'xsajxx', 'SLSJ,AJBH,AJLB,SLDW', 'AJBH,BARXM,BARXB,BARCSRQ,BARZJZL,BARZJHM,BARDW,BARLXFS,BARZZ,BARBMJB,AJZT,AJMC,MJ,AJLB,AJWAB,AJXZ,AJSX,AJLY,BASJ,ZBR,SLR,SLDW,PADW,LADW,XBR,ZBDW', 'select @ from xasgaj.aj_jbxx where ajlb <''200000'' and 1=1 #AJBH#', 'B201100011', '1', '20111222132537', 'select @ from xasgaj.aj_jbxx where  ajlb <''200000'' and 1=1 #AJBH# #BARXM# #BARXB# #BARCSRQ# #BARZJHM# #SLDW# #SLR# #ZBR# #XBR# #AJZT# ', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100030', '行政案件信息', '2', 'xzajxx', 'SLSJ,AJBH,AJLB,SLDW', 'AJBH,BARXM,BARXB,BARCSRQ,BARZJZL,BARZJHM,BARDW,BARLXFS,BARZZ,BARBMJB,AJZT,AJMC,MJ,AJLB,AJWAB,AJXZ,AJSX,AJLY,BASJ,ZBR,SLR,SLDW,PADW,LADW,XBR,ZBDW', 'select @ from xasgaj.aj_jbxx where ajlb >=''200000'' and 1=1 #AJBH#', 'B201100011', '1', '20111222132544', 'select @ from xasgaj.aj_jbxx where ajlb >=''200000'' and 1=1 #AJBH# #BARXM# #BARXB# #BARCSRQ# #BARZJHM# #SLDW# #SLR# #ZBR# #XBR# #AJZT# ', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100031', '车辆信息', '2', 'clxx', 'SAWP_CPH,SAWP_CJH,SAWP_FDJH,SAWP_CZSFZH', 'SAWP_BH,SAWP_AJBH,SAWP_RYBH,SAWP_CJH,SAWP_FDJH,SAWP_CPH,HPZL,SAWP_CZSFZH,SAWP_CZLXDH,SAWP_CZDZ,SAWP_SFBX,SAWP_BXQK,SAWP_BZ', 'select @ from xasgaj.aj_sawp where 1=1 #SAWP_CZSFZH#', 'B201100012', '1', '20111222132556', 'select @ from xasgaj.aj_sawp where 1=1 #SAWP_CPH# #SAWP_HPZL# #SAWP_FDJH# #SAWP_CJH# #SAWP_CZSFZH#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100032', '网吧信息', '2', 'wbxx', 'YYCSDM,YYCSMC,DZ,CKIPDZ', 'YYCSDM,YYCSMC,DZQH,DZ,CKIPDZ,ENTERDB_TIME', 'select @ from xasgaj.JG_WBXX t,xasgaj.JG_WBSWRYXX w  where t.yycsdm=w.yycsdm and 1=1 #YYCSDM#', 'B201100013', '1', '20111222132602', 'select @ from xasgaj.JG_WBXX t,xasgaj.JG_WBSWRYXX w  where t.yycsdm=w.yycsdm and 1=1 #YYCSDM# #DZ# #SWRYXM# #ZJHM#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100033', '特种行业', '2', 'tzhy', 'FRDB,JGBH,MC,THBH', 'DWMC,THBH,JGBH,MC,XKZH,THBM,THLB,JZZMJ,KFMJ,MTMJ,HKSMJ,JCSMJ,TCCZMJ,YLCSMJ,TDKD,XJDJ,FJS,CWS,FZJG,FZRQ,HFR,LZR,ZBZZMC,ZRMJ,ZRMJDH,ZXBS,ZXRQ,ZXYY,BGQK,BZ', 'select @ from xasgaj.za_tzhy t,xasgaj.jg_jbxx j where t.tzhy_jgthbh=j.jgbh and 1=1 #JGBH#', 'B201100014', '1', '20111222132608', 'select @ from xasgaj.za_tzhy t,xasgaj.jg_jbxx j where t.tzhy_jgthbh=j.jgbh and 1=1 #DWMC# #FRDB# #LXDH# #FRZZ#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100034', '公共场所', '2', 'ggcs', 'FRDB,GGCS_BH,GGCS_MC,JGBH', 'DWMC,GGCS_TDK,GGCS_QT,GGCS_NBJG,GGCS_JZWJG,GGCS_GGCSDJ,GGCS_CSLB,GGCS_MC,GGCS_BADJHM,JGBH,GGCS_BH,GGCS_TDKSL,GGCS_YWXJJCC,GGCS_CSZMJ,GGCS_YYMJ,GGCS_ZWHJ', 'select @ from  xasgaj.za_ggcsxx t,xasgaj.jg_jbxx j where t.ggcs_jgbh=j.jgbh and 1=1 #JGBH#', 'B201100014', '1', '20111222132617', 'select @ from  xasgaj.za_ggcsxx t,xasgaj.jg_jbxx j where t.ggcs_jgbh=j.jgbh and 1=1 #DWMC# #FRDB# #LXDH# #FRZZ#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100035', '保安公司', '2', 'bags', 'BAGS_FRDB,BAGS_JGBH,BAGS_DWMC,BAGS_FRSFZHM', 'BAGS_JGBH,BAGS_DWMC,BAGS_GSDM,BAGS_DWCZ,BAGS_DWDH,BAGS_DWDZYX,BAGS_GLFW,BAGS_FRDB,BAGS_FRSFZHM,BAGS_FRLXDH,BAGS_FRZZ,BAGS_ZGBM,BAGS_FZR,BAGS_ZW,BAGS_FZRDH,BAGS_GLRYS,BAGS_ZBFBQ,BAGS_ZBXJG,BAGS_ZBYCC,BAGS_ZPRY,BAGS_JGZCH,BAGS_BAGS_ZCRQ,BAGS_ZCQH,BAGS_ZCDZ,BAGS_YXQX,BAGS_JGSSXQ,BAGS_JGJLX,BAGS_JGMLPH,BAGS_JGMLXZ,BAGS_JGMPHZ,BAGS_YZBH,BAGS_SZZRQ,BAGS_XFDJ,BAGS_DWXZ,BAGS_BGQK,BAGS_BZ', 'select @ from xasgaj.za_bags where 1=1 #BAGS_JGBH#', 'B201100014', '1', '20111222132624', 'select @ from xasgaj.za_bags where 1=1 #BAGS_FRDB# #BAGS_JGBH# #BAGS_DWMC# #BAGS_FRSFZHM# ', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100036', '涉外单位', '2', 'swdw', 'FRDB,JGBH,DWMC,SWDW_BH', 'DWMC,SWDW_BH,JGBH,SWDW_LXR,SWDW_SJBGDZ,SWDW_ZFZB,SWDW_WFZB,SWDW_ZFTZDW,SWDW_WFTZDW,SWDW_TZGJDQ,SWDW_QYQKJZ,SWDW_ZXBS,SWDW_ZXYY,SWDW_ZXRQ,SWDW_BZ', 'select @ from xasgaj.za_swdw t ,xasgaj.jg_jbxx j where t.swdw_jgbh=j.jgbh and 1=1 #JGBH#', 'B201100014', '1', '20111222132631', 'select @ from xasgaj.za_swdw t ,xasgaj.jg_jbxx j where t.swdw_jgbh=j.jgbh and 1=1 #DWMC# #FRDB# #LXDH# #FRZZ#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100037', '内保单位', '2', 'nbdw', 'FRDB,JGBH,DWMC,NBDW_BH', 'DWMC,NBDW_BH,JGBH,NBDW_DWXZ,NBDW_DWLLR,NBDW_JFQK,NBDW_ZDGAJG,NBDW_WWXX,NBDW_GLBM,NBDW_BWJGSZ,NBDW_SCJYZK,NBDW_ZYBWS,NBDW_YHBWS,NBDW_ZDDJ,NBDW_PDYJ,NBDW_NLR,NBDW_NXSE,NBDW_ZGZGS,NBDW_XGZGS,NBDW_WYGS,NBDW_WJSSYGS,NBDW_ZGXSRS,NBDW_GATSSYGS,NBDW_JCSSMZSSYGS,NBDW_BWZZLB,NBDW_BWBMFZR,NBDW_ZZBWGBS,NBDW_JZBWGBS,NBDW_JJS,NBDW_BAS,NBDW_HWLL,NBDW_HWQS,NBDW_QDZAZRSSJ,NBDW_YWYJZB,NBDW_ZBDTS,NBDW_ZBJGS,NBDW_ZBMTCS,NBDW_ZBQCS', 'select @ from xasgaj.za_nbdw t,xasgaj.jg_jbxx j where  t.nbdw_jgbh=j.jgbh and 1=1 #NBDW_BH# #JGBH#', 'B201100014', '1', '20111222132638', 'select @ from xasgaj.za_nbdw t,xasgaj.jg_jbxx j where t.nbdw_jgbh=j.jgbh and 1=1 #DWMC# #FRDB# #LXDH# #FRZZ#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000001', '密码设置', '9', 'mmsz', null, null, null, 'B201100008', '0', '20111222132725', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000002', '版本更新', '9', 'bbgx', null, null, null, 'B201100008', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000003', '系统设置', '9', 'xtsz2', null, null, null, 'B201100008', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100041', '巡逻盘查人员信息', '2', 'xlpcryxx', 'RYPC_XM,XB,RYPC_CSRQ,RYPC_GMSFHM', 'RYPC_XXBH,RYPC_BH,RYPC_RYBH,RYPC_XM,XB,RYPC_MZ,RYPC_CSRQ,RYPC_GMSFHM,RYPC_ZJZL,RYPC_ZJHM,RYPC_JSZH,RYPC_XZZ,RYPC_RYLB,RYPC_CLJG,RYPC_BZ', 'select @ from xasgaj.ZA_PCRYXX where 1=1 #RYPC_GMSFHM#', 'B201100010', '1', '20120212132518', 'select @ from xasgaj.ZA_PCRYXX where 1=1 #RYPC_GMSFHM# #RYPC_XM# #XB# #RYPC_CSRQ# #NLD#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100042', '机构信息', '0', 'jgcx', null, 'DWMC,FRDB,FRZZ,FRSFZH,JGBH,WWM,DSZ,ZJL,DWCZ,DWDZYX,DWSX,FRLXDH,JJXZ,XYLB,JYFW_ZY,JYFW_JY,KYRQ,YYZZBH,SWDJH,JGZCH,ZCRQ,ZCZB,ZCQH,ZCDZ,FZRQ,YXQX,FHDJ,CYRS,FZJG,DWDM,GYDWLX,YZBM,JGJLX,JGMLPH,JGMLXZ,JGMPHZ,JGSSXQ,SZZRQ,TZGJ,DWDH', 'select @ from xasgaj.jg_jbxx j where 1=1 #JGBH#', '9999999999', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100043', '处警信息', '0', 'jcjxx', null, 'JJBH,CJ_CJSJ,CJ_ZBLD,CJ_DDXCSJ,CJ_CJJG,CJ_BCCLJG,CJ_SFSW,CJ_XXQK,CJ_SSXXQK,CJ_FSCS,CJ_PHXXAJ,CJ_ZHZACY,CJ_CDJL,CJ_CDJDC,CJ_CDCZ,CJ_ZJJJSS,CJ_WHSS,CJ_JZQZ,CJ_JZSY,CJ_JJFNS,CJ_JJETS,CJ_JJRZS,CJ_RYSWS,CJ_RYSSS,CJ_TPRF,CJ_LZSCRS,CJ_CJCZSJ,CJ_AJSLR,CJ_AJSLDW,CJ_CJDW,CJ_CJR,CJ_CJBH,CJ_CJLB', 'select @ from xasgaj.jcj_cjxx c where 1=1 #JJBH#', '9999999999', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('31171d2c:132b99423bf:-8000', 'cc', '0', 'Windows XP', null, null, null, 'B201100010', '0', '20111122172815', null, 7, 'bizDS', '4', '5');
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('S000000013', '通知通告', '9', 'aa', 'ID,TITLE,CONTENT,SENDTIME', 'ID,TITLE,TYPE,CONTENT,SENDUSERID,SENDTIME,SENDSTATUS,SENDDEPTID,UPLOADFILENAME,REQDEVICE_ID,REQUSERNAME,REQDEPTID,REQDEPTNAME,SENDUSERNAME,SENDDEPTNAME', 'select @ from fw_conf_xa.jw_tztg t where 1=1 #ID#', 'B201100006', '1', '20111107110714', 'select @ from test_conf3.jw_tztg t where #REQDEPTID# #REQUSERNAME# order by sendtime desc', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B20110052', '强制措施', '3', 'qzcs', null, null, null, '9999999999', '0', '20110813103958', 'insert into test_add(jysbh,zqmj,jzzl,zjhm) values(#JDSBH#,#ZQMJ#,#JZJL#,#ZJHM#)', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('7adf59e3:132f0f4cce8:-8000', 'aabcc', '0', 'bags', null, null, null, 'B201100010', '0', '20111115144521', null, 6, 'bizDS', '6', '6');
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100025', '上网人员信息', '2', 'swryxx', 'SWRYXM,YYCSDM,YYCSMC,ZJHM,DWMC', 'YYCSDM,YYCSMC,DZQH,DZ,SWRYXM,ZJLX,ZJHM,FZJGMC,SWKSSJ,XWSJ,SWZDH', 'select @ from xasgaj.JG_WBSWRYXX t,xasgaj.JG_WBXX d where 1=1 and t.yycsdm=d.yycsdm #YYCSDM# #YYCSDM#', 'B201100010', '1', '20111222132502', 'select @ from xasgaj.JG_WBSWRYXX t,xasgaj.JG_WBXX d where 1=1 and t.yycsdm=d.yycsdm #YYCSDM# #ZJHM# #SWRYXM# #DZ#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100027', '巡逻盘查车辆信息', '2', 'xlpcclxx', 'CLPC_CPH,CLPC_XXBH,CLPC_CLLX,CLPC_CLYS', 'CLPC_XXBH,CLPC_CPH,CLPC_CJH,CLPC_FDJH,CLPC_XSZH,CLPC_CLLX,CLPC_CLYS,CLPC_CLPP,CLPC_TBBS,CLPC_CZRS,CLPC_CLJG,CLPC_BZ,CLPC_BH,CLPC_FLLX', 'select @ from xasgaj.ZA_PCCLXX where 1=1 #CLPC_XXBH#', 'B201100010', '1', '20111222132509', 'select @ from xasgaj.ZA_PCCLXX where 1=1 #CLPC_CPH# #CLPC_XXBH# #CLPC_CLLX# #CLPC_CLYS#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100000', '西安警务通', '1', 'ar', null, null, null, '0', '0', '20120223171903', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100001', '综合查询', '1', 'zhcx', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100002', '交通管理', '1', 'jtgl', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100003', '社区警务', '1', 'sqjw', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100004', '治安管理', '1', 'zagl', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100005', '盘查', '1', 'pc', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100006', '移动办公', '1', 'ydbg', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100007', '指挥调度', '1', 'zhdd', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100008', '系统设置', '1', 'xtsz1', null, null, null, 'B201100000', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100010', '人口信息', '1', 'rkxx', null, null, null, 'B201100001', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100011', '案件信息', '1', 'ajxx', null, null, null, 'B201100001', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100012', '物品查询', '1', 'wpcx', null, null, null, 'B201100001', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100013', '机构查询', '1', 'jgcx', null, null, null, 'B201100001', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100014', '单位信息', '1', 'dwxx', null, null, null, 'B201100001', '0', '20110813103958', null, 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100015', '常住人口', '2', 'aa', 'XM,XB,GMSFHM,CSRQ', 'RYBH,RYZZBH,GMSFHM,JWSFZH,XM,XMPY,CYM,ZJZL,ZJHM,BMCH,XB,MZ,CSRQ,CSSJ,CSDQ,CSQX,CSXZ,JHRYSFZH,JHRYXM,JHGXY,JHRESFZH,JHREXM,JHGXE,FQSFZH,FQXM,MQSFZH,MQXM,POSFZH,POXM,JGDQ,JGQX,JGXZ,YXQX,ZJXY,ZZMM,WHCD,HYZK,BYZK,SG,XX,LXDH,BZ,HH,HKLB,TSHK,YHZGX', 'select @ from xasgaj.RY_JBXX t where 1=1 #GMSFHM# #RYBH#', 'B201100010', '1', '20120106140934', 'select @ from xasgaj.RY_JBXX t where 1=1 #CSRQ# #XB# #GMSFHM# #XM# #NLD#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100016', '暂住人口', '2', 'aa', 'XM,XB,GMSFHM,CSRQ', 'RYBH,ZZRY_BDBH,ZZRY_ZZBH,ZZRY_QTZZBH,ZZZBH,GMSFHM,XM,ZZRY_CYM,XB,ZZRY_MZ,CSRQ,ZZRY_WHCD,ZZRY_ZZMM,ZZRY_HYZK,ZZRY_HJDQH,ZZRY_HJXZ,ZZRY_ZRQ,ZZRY_DDSJ,ZZRY_ZZSY,ZZRY_YZY,ZZRY_YZYLB,ZZRY_XZY,ZZRY_ZYLB,ZZRY_ZZCS,ZZRY_FWCS,ZZRY_JYZM,ZZRY_GZDZAZRRXM,ZZRY_FZRGDDH,ZZRY_FZRYDDH,ZZRY_JZZBL,ZZRY_QFRQ,ZZRY_YXQX,ZZRY_ZZZYXJZSJ,ZZRY_DJDW,ZZRY_DJR,ZZRY_DJSJ', 'select @ from xasgaj.RY_JBXX c,xasgaj.RY_ZKBD z where 1=1 #GMSFHM#', 'B201100010', '1', '20111226133247', 'select @ from xasgaj.RY_JBXX c,xasgaj.RY_ZKBD z where  1=1 and z.zzry_rybh=c.rybh   #ZZRY_GMSFHM# #ZZRY_XM# #ZZRY_XB# #ZZRY_CSRQ# #NLD#', 2, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100017', '驾驶员', '2', ' jsy', 'XM,XB,CSRQ,SFZMHM', 'ZT,CCLZRQ,YXQZ,YXQS,JZQX,ZJCX,FZRQ,LXZSXXDZ,LXZSXZQH,LXDH,CSRQ,XB,XM,SFZMHM,SFZMMC,BZCS,FZJG,LJJF,WFCS,SYRQ,CFRQ,SGCS', 'select @ from driver_bak t where 1=1 #SFZMHM# ', 'B201100010', '1', '20111027163257', 'select @ from driver_bak t where 1=1 #ZJCX# #SFZMHM# #XM#', 1, 'confDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100018', '人员住宿信息', '2', 'ryzsxx', 'NAME,NOHOTEL,IDCODE,BDATE', 'CCODE,XM,NAMEPY,XB,CSRQ,NATION,IDTYPE,GMSFHM,XZQH,ADDRESS,LTIME,NOROOM,ETIME,STIME,CARDTYPE,CARDNO,RTIME,PICTURE,GCODE,NOHOTEL,CREATETIME,LWAITER,EWAITER,FLAG', 'select @ from xasgaj.T_CHREC t where 1=1 #IDCODE# ', 'B201100010', '1', '20111222132217', 'select @ from xasgaj.T_CHREC t where 1=1 #IDTYPE# #IDCODE# #NOHOTEL# #NAME# #LTIME#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100019', '寄住人口', '2', 'jzrk', 'XM,XB,GMSFHM,CSRQ', 'JZ_BH,RYBH,JZ_QTZZBH,JZ_YHZGX,JZ_GMSFHM,JZ_XM,JZ_CSRQ,JZ_ZZBH,JZ_JZDQH,JZ_JZDXZ,JZ_HSJZBZ,JZ_HYJZBZ,JZ_BZ,JZ_DJR,JZ_DJSJ,c.XB', 'select @ from xasgaj.RY_JBXX c,xasgaj.RY_JZXX t where  1=1 and t.JZ_RYBH=c.RYBH #GMSFHM# #RYBH#', 'B201100010', '1', '20120215141828', 'select @ from xasgaj.RY_JBXX c,xasgaj.RY_JZXX t where  1=1 and t.JZ_RYBH=c.RYBH #GMSFHM# #XM# #XB# #CSRQ# #NLD#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100020', '单位从业人员', '2', 'dwcyry', 'XM,XB,GMSFHM,CSRQ', 'RYBH,CYRY_JGBH,CYRY_ZZBH,CYRY_XZZ,CYRY_SX,CYRY_BMMC,CYRY_ZW,CYRY_YM,CYRY_SJ,CYRY_QTLXDH,RYBH,RAS,CYRY_ZSQK,CYRY_PCSYJ,CYRY_PXZH,CYRY_PXZS,CYRY_ZXYY,CYRY_ZXBS,CYRY_ZXRQ,CYRY_ZDFWDXLB,CYRY_BWCS,CYRY_ZYGX,CYRY_ZDRTLB,CYRY_KZCS,CYRY_ZYWT,CYRY_BZ,CYRY_DJRQ,CYRY_SHYX,CYRY_SHXJ,c.XM,c.XB,c.GMSFHM,c.CSRQ', 'select @ from xasgaj.RY_JBXX c,xasgaj.JG_CYRY t where  1=1 and t.CYRY_RYBH=c.RYBH  #GMSFHM# #RYBH# ', 'B201100010', '1', '20111228134940', 'select @ from  xasgaj.RY_JBXX c,xasgaj.JG_CYRY t where  1=1 and t.CYRY_RYBH=c.RYBH #GMSFHM# #XM# #XB# #CSRQ# #NLD#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100021', '境外临时住宿人员', '2', 'jwlszsry', 'XM,XB,ZJHM,CSRQ', 'LSZS_ZSBH,RYBH,LSZS_ZZGLBH,LSZS_DDRQ,LSZS_LKRQ,LSZS_RYSF,LSZS_LXDH,LSZS_HCLGL,LSZS_HCQGL,LSZS_HCLGW,LSZS_HCQGW,LSZS_ZSDW,LSZS_FH,LSZS_DJDWXZQH,LSZS_DJDWDM,LSZS_DJDWMC,LSZS_ZXSJ,LSZS_ZXYY,LSZS_BZ,LSZS_LZSHGW,LSZS_LZSHGL,LSZS_LSZSXZZ,LSZS_JDDW,LSZS_LSDWDH,LSZS_LSDW,LSZS_QQGX,LSZS_SHZSBG,LSZS_DJDWLX,LSZS_ZHGZDM,LSZS_ZHGZMC,LSZS_ZFLX,LSZS_FZGMSFHM,LSZS_FZDH,LSZS_JJLXR,LSZS_JJLXDH,LSZS_DJSJ,XM,XB,CSRQ,YWX,YWM,ZJZL,GMSFHM,QZZL', 'select @ from xasgaj.RY_JBXX c,xasgaj.RY_JWLSZS l where  1=1  #ZJHM#  #RYBH# ', 'B201100010', '1', '20111222132236', 'select @ from xasgaj.RY_JBXX c,xasgaj.RY_JWLSZS t where 1=1 and t.LSZS_RYGLBH=c.RYBH #ZJHM# #XM# #XB# #CSRQ# #YWX# #YWM# #ZJZL# #QZZL#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100022', '在逃人员', '2', 'ztry', 'ZTXM,ZTXB,ZTCSRQ,SFZHSB', 'ZTRYBH,ZTXM,ZTXB,ZTCSRQ,SFZHSB,HJDQH,HJDXZ,ZTJYAQ,LADQ,LADW,ZTXZQX,ZTXZXZ,ZTZC,ZTJYJL,ZTRQ', 'select @ from xasgaj.ZTRYXX t where 1=1 #SFZHSB# ', 'B201100010', '1', '20111222132248', 'select @ from xasgaj.ZTRYXX t where 1=1 #SFZHSB# #ZTXM# #ZTXB# #ZTCSRQ# #NLD#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100023', '房屋出租户房主', '2', 'fwczhfz', 'XM,XB,CSRQ,RYBH', 'CZFW_BH,CZFW_ZZBH,RYBH,CZFW_DJBH,CZFW_SZQX,CZFW_SZXZ,CZFW_SYR,CZFW_SYRPY,CZFW_SYRCSRQ,CZFW_SYRZH,CZFW_CQDW,CZFW_LXDH,CZFW_DLR,CZFW_DLRLXFS,CZFW_CQXZ,CZFW_GLJB,CZFW_SFXXY,CZFW_CZYT,CZFW_FWLX,CZFW_CZJS,CZFW_CZMJ,CZFW_CZSJ,CZFW_CZZZSJ,CZFW_ZXYY,CZFW_BZ,CZFW_FWZT,CSRQ,XB,XM,GMSFHM', 'select @ from xasgaj.DZ_CZFW t,xasgaj.RY_JBXX d where t.czfw_ryjgbh=d.rybh and 1=1 #RYBH# #RYBH# ', 'B201100010', '1', '20120209141337', 'select @ from xasgaj.RY_JBXX d ,xasgaj.DZ_CZFW t  where t.czfw_ryjgbh=d.rybh and 1=1 #RYBH# #XM# #XB# #CSRQ# #NLD#', 1, 'bizDS', null, null);
insert into BUSINESS_CONFIG (b_id, b_name, b_type, img_name, l_simple_items, d_simple_items, d_sql, father_id, final_node, edit_res_date, l_sql, b_orders, ds, validate_res, validate_des)
values ('B201100024', '保安人员信息', '2', 'baryxx', 'XM,XB,CSRQ,RYBH', 'RYBH,XM,XB,GMSFHM,CSRQ,BARY_BH,BARY_GSBH,RYBH,ZZBH,XZZ,BARY_CZPX,BARY_ZGZBH,BARY_SGZBH,BARY_XHPBH,BARY_GJZC,BARY_HSPX,BARY_HCPX,BARY_PZGW,BARY_PZDW,BARY_SSXQ,BARY_JLX,BARY_DWDZ,BARY_PZDW,BARY_RYXZ,BARY_ZYGZQK', 'select @ from xasgaj.ZA_BARY t,xasgaj.RY_JBXX d where 1=1 and t.bary_rybh=d.rybh  #RYBH# ', 'B201100010', '1', '20111222132454', 'select @ from  xasgaj.RY_JBXX d,xasgaj.ZA_BARY t  where  t.bary_rybh=d.rybh and 1=1 #RYBH# #XM# #XB# #CSRQ# #NLD#', 1, 'bizDS', null, null);
commit;
prompt 75 records loaded
prompt Loading BUSINESS_RELATED...
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('3661e604:135a2ed32d4:-7ff3', '3661e604:135a2ed32d4:-7fff', 'lemonName', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100023', 'B201100015', 'RYBH', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100025', 'B201100032', 'YYCSDM', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100016', 'B201100015', 'RYBH', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100024', 'B201100015', 'RYBH', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100020', 'B201100015', 'RYBH', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100037', 'B201100042', 'JGBH', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100036', 'B201100042', 'JGBH', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100034', 'B201100042', 'JGBH', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100033', 'B201100042', 'JGBH', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100032', 'B201100025', 'YYCSDM', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100019', 'B201100015', 'RYBH', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100021', 'B201100015', 'RYBH', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100028', 'B201100043', 'JJBH', '0');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('B201100017', 'B201100015', 'GMSFHM', '1');
insert into BUSINESS_RELATED (b_id, r_id, r_column, r_type)
values ('3661e604:135a2ed32d4:-7fff', '3661e604:135a2ed32d4:-7fff', 'lemonName', '1');
commit;
prompt 16 records loaded
prompt Loading BUSINESS_RES_CONFIG...
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100028', '报警形式', 'TextSpinner', 'BJLX', 1, '0', null, 'JJ_BJXS', null, 0, 1, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100028', '报  警 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'JJ_BJR', 'VARCHAR*20', 0, 2, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100028', '接警时间', 'TextEdit', null, 1, '0', null, 'JJ_JJSJ', 'CHAR_DATE*20', 0, 3, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100028', '接警单位', 'TextSpinner', 'DW', 1, '0', null, 'JJ_JJDW', null, 0, 4, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100028', '接  警 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'JJ_JJR', 'VARCHAR*20', 0, 5, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (7, 'B201100028', '处警单位', 'TextSpinner', 'DW', 1, '0', null, 'CJ_CJDW', null, 0, 7, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (9, 'B201100028', '处警编号', 'TextEdit', null, 1, '0', null, 'CJ_CJBH', null, 0, 9, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (10, 'B201100028', '处警类别', 'TextSpinner', 'CJLB', 1, '0', null, 'CJ_CJLB', null, 0, 10, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100032', '姓       名', 'TextEdit', null, 1, '7', null, 'SWRYXM', 'VARCHAR*18', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100032', '证件号码', 'TextEdit', null, 1, '0', null, 'ZJHM', null, 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100030', '案件编号', 'TextEdit', null, 1, '0', null, 'AJBH', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100022', '出生日期', 'EditDate', null, 1, '6', '日期输入不合法', 'ZTCSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100023', '出生日期', 'EditDate', null, 1, '6', '日期输入不合法', 'CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100024', '身份号码', 'TextEdit', null, 1, '2', '身份证输入不合法', 'GMSFHM', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100025', '证件号码', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'ZJHM', 'VARCHAR*50', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (8, 'B201100028', '处  警 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'CJ_CJR', 'VARCHAR*20', 0, 8, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100029', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BARXM', 'VARCHAR*20', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (10, 'B201100029', '协 办  人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XBR', 'VARCHAR*20', 0, 10, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100041', '身份证号', 'TextEdit', null, 1, '2', '身份证输入不合法', 'RYPC_GMSFHM', 'VERCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (9, 'B201100030', '协  办 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XBR', 'VARCHAR*20', 0, 9, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100031', '身份证号', 'TextEdit', null, 1, '2', '身份证输入不合法', 'SAWP_CZSFZH', 'VARCHAR*18', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100033', '法人代表', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRDB', 'VERCHAR*20', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100034', '单位名称', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'DWMC', 'VERCHAR*50', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100034', '法人住址', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRZZ', 'VERCHAR*50', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100035', '单位名称', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BAGS_DWMC', 'VERCHAR*50', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100035', '法人住址', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BAGS_FRZZ', 'VERCHAR*50', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100036', '单位名称', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'DWMC', 'VERCHAR*50', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100037', '法人代表', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRDB', 'VERCHAR*20', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100016', '年  龄  段', 'TextAge', null, 1, '5', '年龄必须是数字', 'NLD', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (6, 'B201100028', '接警编号', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'JJ_JJBH', 'VARCHAR*20', 0, 6, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'S000000001', '旧  密  码', 'TextPwd', null, 1, '0', null, 'OLD_PWD', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'S000000001', '新  密  码', 'TextPwd', null, 1, '0', null, 'NEW_PWD', null, 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'S000000001', '确认密码', 'TextPwd', null, 1, '0', null, 'CONFIRM_PWD', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, '2879d6f8:131fa4a7057:-8000', '2', 'EditDate', 'CLLX', 1, '0', '2', '11', '2', 0, 2, 1);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, '3cfebef3:1328edc98f8:-7fed', '性       别', 'TextSpinner', 'XB', 0, '0', null, 'XB', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (6, '7adf59e3:132f0f4cce8:-8000', '6', 'EditDate', 'XB', 0, '0', '6', '61', '6', 0, 6, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'S000000015', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'NAME', 'VARCHAR*20', 0, 6, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (9, '31171d2c:132b99423bf:-8000', '9', 'EditDate', 'XB', 0, '0', '9', '7', '9', 0, 9, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'S000000015', '手机号码', 'TextEdit', null, 1, '7', '手机号码输入不合法', 'MOBILE', 'VARCHAR*13', 0, 4, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'S000000015', 'E-Mail', 'TextEdit', null, 1, '7', 'E-Mail输入不正确', 'EMAIL', 'VARCHAR*30', 0, 4, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'S000000014', '法规代码', 'TextEdit', null, 1, '7', '法规代码输入不合法', 'LAW_CODE', 'VARCHAR*50', 0, 4, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'S000000014', '法规名称', 'TextEdit', null, 1, '7', '法规名称输入不合法', 'LAW_NAME', 'VARCHAR*50', 0, 4, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100098', '文       种       ', 'TextText', 'WZ', 0, null, null, 'WZ', null, 0, 2, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, '31171d2c:132b99423bf:-8000', '1', 'SpinnersEdit', 'XB,MZ', 0, '0', null, '8', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100098', '公文标题', 'TextText', 'GWBT', 0, null, null, 'GWBT', null, 0, 1, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100098', '紧急程度', 'TextText', 'JJCD', 0, null, null, 'JJCD', null, 0, 3, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100098', '常见意见', 'TextArea', 'CJYJ', 0, '1', null, 'CJYJ', null, 1, 4, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100098', '审核意见', 'TextArea', 'SHYJ', 0, '1', null, 'SHYJ', null, 1, 5, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (6, 'B201100098', '业务标识', 'TextText', 'ID', 1, null, null, 'ID', null, 0, 6, null);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100000', 'RETURN_CODE', 'EditDate', 'RETURN_CODE', 1, '0', null, 'RETURN_CODE', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, '-585bcf9a:13469b08262:-8000', '时间', 'TextEdit', null, 0, '0', null, 'OP_TIME', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, '-585bcf9a:13469b08262:-8000', '用户ID', 'TextEdit', null, 0, '0', null, 'USER_ID', null, 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, '3661e604:135a2ed32d4:-7fff', 'lemon', 'SpinnersEdit', 'FAB', 0, '0', 'lemon错误', 'lemonName', null, 0, 2, 1);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (14, '-627dffca:13579850b7c:-7ffa', 'test14', 'EditDate', 'ZXDZBZ', 0, '0', 'test14', 'test14', 'test14', 0, 0, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, '3661e604:135a2ed32d4:-7ff3', 'lemonnew', 'EditDate', 'AJLB', 0, '0', 'lemonnew', 'name', '2', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100015', '出生日期', 'EditDate', null, 0, '6', '日期输入不合法', 'CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100015', '年  龄 段', 'TextAge', null, 1, '5', '年龄必须是数字', 'NLD', 'CHAR_DATE', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100015', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100015', '姓       名', 'Text', null, 1, '7', '不能输入特殊字符', 'XM', 'VARCHAR', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100015', '身份号码', 'TextEdit', null, 0, '2', '身份证输入不合法', 'GMSFHM', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100031', '发动机号', 'TextEdit', null, 1, '0', null, 'SAWP_FDJH', null, 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100031', '车  架  号', 'TextEdit', null, 1, '0', null, 'SAWP_CJH', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100031', '号牌种类', 'TextSpinner', 'HPZL', 1, '0', null, 'SAWP_HPZL', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100031', '车  牌  号', 'TextEdit', null, 1, '0', null, 'SAWP_CPH', null, 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100033', '单位名称', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'DWMC', 'VERCHAR*50', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100033', '联系电话', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'LXDH', 'VERCHAR*20', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100033', '法人住址', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRZZ', 'VERCHAR*50', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100017', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', ' XM', 'VARCHAR*50', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100017', '准驾车型', 'TextSpinner', 'ZJCX', 1, '0', null, 'ZJCX', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100032', '地       址', 'TextEdit', null, 1, '0', null, 'DZ', null, 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100032', '网吧名称', 'TextSpinner', 'WBMC', 1, '0', null, 'YYCSDM', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100034', '法人代表', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRDB', 'VERCHAR*20', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100034', '联系电话', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'LXDH', 'VERCHAR*20', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100023', '身份号码', 'TextEdit', null, 1, '2', '身份证输入不合法', 'GMSFHM', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100023', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XM', 'VARCHAR', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100023', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100017', '身份号码 ', 'TextEdit', null, 1, '2', '身份证输入不合法', 'SFZMHM', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100018', '证件类型', 'TextSpinner', 'LKZJLX', 1, '0', null, 'IDTYPE', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100018', '证件号码', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'IDCODE', 'VARCHAR*50', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100018', '旅馆名称', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'NOHOTEL', 'VARCHAR', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100018', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'NAME', 'VARCHAR*50', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100018', '入住时间', 'EditDate', null, 1, '6', '日期格式不正确', 'LTIME', 'CHAR_DATE*50', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100019', '身份号码', 'TextEdit', null, 1, '2', '身份证输入不合法', 'GMSFHM', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100019', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XM', 'VARCHAR', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100019', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100019', '年  龄 段', 'TextAge', null, 1, '5', '年龄必须是数字', 'NLD', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100019', '出生日期', 'EditDate', null, 1, '6', '日期输入不合法', 'CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100035', '法人代表', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BAGS_FRDB', 'VERCHAR*20', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100035', '联系电话', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BAGS_FRLXDH', 'VERCHAR*20', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100037', '单位名称', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'DWMC', 'VERCHAR*50', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100037', '联系电话', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'LXDH', 'VERCHAR*20', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100037', '法人住址', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRZZ', 'VERCHAR*50', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100016', '身份号码', 'TextEdit', null, 1, '2', '身份证输入不合法', 'ZZRY_BDBH', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100016', '姓       名 ', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'ZZRY_XM', 'VARCHAR*18', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100016', '性       别 ', 'TextSpinner', 'XB', 1, '0', null, 'ZZRY_XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100016', '出生日期', 'EditDate', null, 1, '6', '日期格式不正确', 'ZZRY_CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100024', '出生日期', 'EditDate', null, 1, '6', '日期输入不合法', 'CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100024', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100024', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XM', 'VARCHAR', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100036', '法人代表', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRDB', 'VERCHAR*20', 0, 2, 0);
commit;
prompt 100 records committed...
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100036', '联系电话', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'LXDH', 'VERCHAR*20', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100036', '法人住址', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'FRZZ', 'VERCHAR*50', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100035', '身份证号', 'TextEdit', null, 1, '2', '身份证输入不合法', 'BAGS_FRSFZHM', 'VERCHAR*18', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100025', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'SWRYXM', 'VARCHAR*50', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100025', '人员地址', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'DZ', 'VARCHAR*50', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100041', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'RYPC_XM', 'VERCHAR*18', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100041', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100041', '年  龄  段', 'TextAge', null, 1, '5', '年龄输入是数字', 'NLD', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100041', '出生日期', 'EditDate', null, 1, '6', '日期格式不正确', 'RYPC_CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100020', '身份号码', 'TextEdit', null, 1, '2', '身份证输入不合法', 'GMSFHM', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100020', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XM', 'VARCHAR*50', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100020', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100020', '年  龄 段', 'TextAge', null, 1, '5', '年龄必须是数字', 'NLD', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100020', '出生日期', 'EditDate', null, 1, '6', '日期输入不合法', 'CSRQ', 'CHAR_DATE*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100027', '车 牌 号', 'TextEdit', null, 1, '0', null, 'CLPC_CPH', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100027', '车 架 号', 'TextEdit', null, 1, '0', null, 'CLPC_CJH', null, 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100027', '发动机号', 'TextEdit', null, 1, '0', null, 'CLPC_FDJH', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100027', '行驶证号', 'TextEdit', null, 1, '0', null, 'CLPC_XSZH', null, 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100027', '车辆类型', 'TextSpinner', 'CLLX', 1, '0', null, 'CLPC_CLLX', null, 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100021', '中文姓名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'XM', 'VARCHAR*20', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100021', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'XB', null, 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100021', '出生日期', 'EditDate', null, 1, '6', '输入日期格式不正确', 'CSRQ', 'CHAR_DATE*20', 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100021', '英  文  姓', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'YWX', 'VARCHAR*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100021', '英  文  名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'YWM', 'VARCHAR*20', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (6, 'B201100021', '证件种类', 'TextSpinner', 'ZJZL', 1, '0', null, 'ZJZL', null, 0, 6, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (7, 'B201100021', '证件号码', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'ZJHM', 'VARCHAR*50', 0, 7, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (8, 'B201100021', '签证种类', 'TextSpinner', 'QZZL', 1, '0', null, 'QZZL', null, 0, 8, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100022', '身份证号', 'TextEdit', null, 1, '2', '身份证输入不合法', 'SFZHSB', 'VARCHAR*18', 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100022', '姓       名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'ZTXM', 'VARCHAR*50', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100022', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'ZTXB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100022', '年  龄 段', 'TextAge', null, 1, '5', '年龄必须是数字', 'NLD', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (1, 'B201100029', '案件编号', 'TextEdit', null, 1, '0', null, 'AJBH', null, 0, 1, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100029', '性       别', 'TextSpinner', 'XB', 1, '0', null, 'BARXB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100029', '出生日期', 'TextEdit', null, 1, '6', '日期输入不合法', 'BARCSRQ', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100029', '证件号码', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BARZJHM', 'VARCHAR*50', 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (6, 'B201100029', '受理单位', 'TextSpinner', 'DW', 1, '0', null, 'SLDW', null, 0, 6, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (7, 'B201100029', '受  理 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'SLR', 'VARCHAR*50', 0, 7, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (8, 'B201100029', '主  办 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'ZBR', 'VARCHAR*20', 0, 8, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (12, 'B201100029', '案件状态', 'TextSpinner', 'AJZT', 1, '0', null, 'AJZT', null, 0, 12, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (2, 'B201100030', '姓      名', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'BARXM', 'VARCHAR*20', 0, 2, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (3, 'B201100030', '性      别', 'TextSpinner', 'XB', 1, null, null, 'BARXB', null, 0, 3, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (4, 'B201100030', '出生日期', 'TextEdit', null, 1, '6', '日期格式不正确', 'BARCSRQ', 'CHAR_DATE*20', 0, 4, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (5, 'B201100030', '证件号码', 'TextEdit', null, 1, '0', null, 'BARZJHM', null, 0, 5, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (6, 'B201100030', '受理单位', 'TextSpinner', 'DW', 1, '0', null, 'SLDW', null, 0, 6, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (7, 'B201100030', '受  理 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'SLR', 'VARCHAR*20', 0, 7, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (8, 'B201100030', '主  办 人', 'TextEdit', null, 1, '7', '不能输入特殊字符', 'ZBR', 'VARCHAR*20', 0, 8, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (10, 'B201100030', '案件状态', 'TextSpinner', 'AJZT', 1, '0', null, 'AJZT', null, 0, 10, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (9, 'B201100029', '主办单位', 'TextSpinner', 'DW', 1, '0', null, 'ZBDW', null, 0, 9, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (11, 'B201100029', '立案单位', 'TextSpinner', 'DW', 1, '0', null, 'LADW', null, 0, 11, 0);
insert into BUSINESS_RES_CONFIG (w_id, b_id, name, type, res_id, visible, validate_type, validate_des, code, datatype, isbenull, orders, tabgroup)
values (13, 'B201100029', '破案单位', 'TextSpinner', 'DW', 1, '0', null, 'PADW', null, 0, 13, 0);
commit;
prompt 150 records loaded
prompt Loading COLUMN_MAP...
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DEPTID', 'S000000015', '所在单位编号', 'fw_conf_xa.jw_address t', 'DEPTID', 'VARCHAR', '0', null, '<');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('MOBILE', 'S000000015', '手机', 'fw_conf_xa.jw_address t', 'MOBILE', 'VARCHAR', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('UNITTEL', 'S000000015', '单位电话', 'fw_conf_xa.jw_address t', 'UNITTEL', 'VARCHAR', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('HOMETEL', 'S000000015', '家庭电话', 'fw_conf_xa.jw_address t', 'HOMETEL', 'VARCHAR', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('REMARK', 'S000000015', '备注', 'fw_conf_xa.jw_address t', 'REMARK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DUTY', 'S000000015', '职务', 'fw_conf_xa.jw_address t', 'DUTY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SORT', 'S000000015', '排序号', 'fw_conf_xa.jw_address t', 'SORT', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('MOBILE2', 'S000000015', '手机号2', 'fw_conf_xa.jw_address t', 'MOBILE2', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('UNITTEL2', 'S000000015', '单位电话2', 'fw_conf_xa.jw_address t', 'UNITTEL2', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DEPTNAMES', 'S000000015', '机构名称', 'fw_conf_xa.jw_address t', 'DEPTNAMES', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('EMAIL', 'S000000015', '邮件', 'fw_conf_xa.jw_address t', 'EMAIL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LAW_ID', 'S000000014', '法规ID', 'fw_conf_xa.jw_law t', 'LAW_ID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LAW_CODE', 'S000000014', '法规代码', 'fw_conf_xa.jw_law t', 'LAW_CODE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LAW_NAME', 'S000000014', '法规名称', 'fw_conf_xa.jw_law t', 'LAW_NAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ADMINISTRATION', 'S000000014', '颁布事件', 'fw_conf_xa.jw_law t', 'ADMINISTRATION', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('IRREGULARITYACTION', 'S000000014', '法规内容', 'fw_conf_xa.jw_law t', 'IRREGULARITYACTION', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ID', 'B201100099', '主键ID', 'xasgaj.OA_GWSH t', 'ID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BLSJ', 'B201100099', '办理时间', 'xasgaj.OA_GWSH t', 'BLSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJYJ', 'B201100099', '常见意见', 'xasgaj.OA_GWSH t', 'CJYJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SHYJ', 'B201100099', '审核意见', 'xasgaj.OA_GWSH t', 'SHYJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GWBT', 'B201100099', '公文标题', 'xasgaj.OA_GWSH t', 'GWBT', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LAW_TYPE', 'S000000014', '法规类型', 'fw_conf_xa.jw_law t', 'LAW_TYPE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJCD', 'B201100099', '紧急程度', 'xasgaj.OA_GWSH t', 'JJCD', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('WZ', 'B201100099', '文种', 'xasgaj.OA_GWSH t', 'WZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('IMG', 'B201100018', '加载图片', 'fw_conf_xa.test_img', 'MYIMG', 'BLOB', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RETURN_CODE', 'B201100000', 'RETURN_CODE', 'RETURN_CODE', 'RETURN_CODE', 'VARCHAR', '1', 'RETURN_CODE', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('OP_TIME', '-585bcf9a:13469b08262:-8000', '时间', 'fw_conf_xa.jw_log', 'OP_TIME', 'VARCHAR', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('USER_ID', '-585bcf9a:13469b08262:-8000', '用户ID', 'fw_conf_xa.jw_log', 'USER_ID', 'VARCHAR', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ID', 'B201100098', '主键ID', 'xasgaj.OA_GWSH t', 'ID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GWBT', 'B201100098', '公文标题', 'xasgaj.OA_GWSH t', 'GWBT', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('WZ', 'B201100098', '文种', 'xasgaj.OA_GWSH t', 'WZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJCD', 'B201100098', '紧急程度', 'xasgaj.OA_GWSH t', 'JJCD', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BLSJ', 'B201100098', '办理时间', 'xasgaj.OA_GWSH t', 'BLSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJYJ', 'B201100098', '常见意见', 'xasgaj.OA_GWSH t', 'CJYJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SHYJ', 'B201100098', '审核意见', 'xasgaj.OA_GWSH t', 'SHYJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('lemonName', '3661e604:135a2ed32d4:-7fff', 'lemon名', 'ZA_PCRYXX', 'XM', 'VARCHAR', '0', 'SF', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('test14', '-627dffca:13579850b7c:-7ffa', 'test14', 'test14', 'test14', 'BLOB', '0', 'B201100043', '>');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('name', '3661e604:135a2ed32d4:-7ff3', 'name', 'name', 'name', 'BLOB', '0', 'B201100035', '>');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JHREXM', 'B201100015', '监护人二姓名', 'XASGAJ.RY_JBXX', 'JHREXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JHGXE', 'B201100015', '监护关系二', 'XASGAJ.RY_JBXX', 'JHGXE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FQSFZH', 'B201100015', '父亲身份证号', 'XASGAJ.RY_JBXX', 'FQSFZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FQXM', 'B201100015', '父亲姓名', 'XASGAJ.RY_JBXX', 'FQXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('MQSFZH', 'B201100015', '母亲身份证号', 'XASGAJ.RY_JBXX', 'MQSFZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('MQXM', 'B201100015', '母亲姓名', 'XASGAJ.RY_JBXX', 'MQXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('POSFZH', 'B201100015', '配偶身份证号', 'XASGAJ.RY_JBXX', 'POSFZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('POXM', 'B201100015', '配偶姓名', 'XASGAJ.RY_JBXX', 'POXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGDQ', 'B201100015', '籍贯地区', 'XASGAJ.RY_JBXX', 'JGDQ', 'VARCHAR', '1', 'JGDQ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGQX', 'B201100015', '籍贯区县', 'XASGAJ.RY_JBXX', 'JGQX', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGXZ', 'B201100015', '籍贯详址', 'XASGAJ.RY_JBXX', 'JGXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YXQX', 'B201100015', '有效期限', 'XASGAJ.RY_JBXX', 'YXQX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZJXY', 'B201100015', '宗教信仰', 'XASGAJ.RY_JBXX', 'ZJXY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZMM', 'B201100015', '政治面貌', 'XASGAJ.RY_JBXX', 'ZZMM', 'VARCHAR', '1', 'ZZMM', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('WHCD', 'B201100015', '文化程度', 'XASGAJ.RY_JBXX', 'WHCD', 'VARCHAR', '1', 'WHCD', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('HYZK', 'B201100015', '婚姻状况', 'XASGAJ.RY_JBXX', 'HYZK', 'VARCHAR', '1', 'HYZK', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BYZK', 'B201100015', '兵役状况', 'XASGAJ.RY_JBXX', 'BYZK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SG', 'B201100015', '身高', 'XASGAJ.RY_JBXX', 'SG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XX', 'B201100015', '血型', 'XASGAJ.RY_JBXX', 'XX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LXDH', 'B201100015', '联系电话', 'XASGAJ.RY_JBXX', 'LXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BZ', 'B201100015', '备注', 'XASGAJ.RY_JBXX', 'BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('HH', 'B201100015', '人员户号', 'XASGAJ.RY_JBXX', 'HH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('HKLB', 'B201100015', '户口类别', 'XASGAJ.RY_JBXX', 'HKLB', 'VARCHAR', '1', 'HKLB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('TSHK', 'B201100015', '特殊户口', 'XASGAJ.RY_JBXX', 'TSHK', 'VARCHAR', '1', 'TSHK', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YHZGX', 'B201100015', '与户主关系', 'XASGAJ.RY_JBXX', 'YHZGX', 'VARCHAR', '1', 'JTGX', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DWMC', 'B201100042', '单位名称', 'XASGAJ.JG_JBXX j', 'j.DWMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRDB', 'B201100042', '法人代表', 'XASGAJ.JG_JBXX j', 'j.FRDB', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRZZ', 'B201100042', '法人住址', 'XASGAJ.JG_JBXX j', 'j.FRZZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRSFZH', 'B201100042', '法人身份证号', 'XASGAJ.JG_JBXX j', 'j.FRSFZHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGBH', 'B201100042', '机构编号', 'XASGAJ.JG_JBXX j', 'j.JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CJDW', 'B201100043', '处警单位', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJDW', 'VARCHAR', '1', 'DW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CJR', 'B201100043', '处警人', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CJBH', 'B201100043', '处警编号', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CJLB', 'B201100043', '处警类别', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJLB', 'VARCHAR', '1', 'CJLB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('WWM', 'B201100042', '机构外文名', 'XASGAJ.JG_JBXX j', 'j.WWM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DSZ', 'B201100042', '机构董事长', 'XASGAJ.JG_JBXX j', 'j.DSZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZJL', 'B201100042', '机构总经理', 'XASGAJ.JG_JBXX j', 'j.ZJL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DWCZ', 'B201100042', '机构传真', 'XASGAJ.JG_JBXX j', 'j.DWCZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DWDZYX', 'B201100042', '机构Email', 'XASGAJ.JG_JBXX j', 'j.DWDZYX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DWSX', 'B201100042', '机构属性', 'XASGAJ.JG_JBXX j', 'j.DWSX', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRLXDH', 'B201100042', '法人电话', 'XASGAJ.JG_JBXX j', 'j.FRLXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJXZ', 'B201100042', '经济性质', 'XASGAJ.JG_JBXX j', 'j.JJXZ', 'CHAR', '1', 'JJXZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XYLB', 'B201100042', '行业类别', 'XASGAJ.JG_JBXX j', 'j.XYLB', 'CHAR', '1', 'HYLB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JYFW_ZY', 'B201100042', '经营范围(主营)', 'XASGAJ.JG_JBXX j', 'j.JYFW_ZY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JYFW_JY', 'B201100042', '经营范围(兼营)', 'XASGAJ.JG_JBXX j', 'j.JYFW_JY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('KYRQ', 'B201100042', '开业日期', 'XASGAJ.JG_JBXX j', 'j.KYRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YYZZBH', 'B201100042', '营业执照号', 'XASGAJ.JG_JBXX j', 'j.YYZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDJH', 'B201100042', '税务登记号', 'XASGAJ.JG_JBXX j', 'j.SWDJH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGZCH', 'B201100042', '注册号', 'XASGAJ.JG_JBXX j', 'j.JGZCH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZCRQ', 'B201100042', '注册日期', 'XASGAJ.JG_JBXX j', 'j.ZCRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZCZB', 'B201100042', '注册资本', 'XASGAJ.JG_JBXX j', 'j.ZCZB', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZCQH', 'B201100042', '注册区划', 'XASGAJ.JG_JBXX j', 'j.ZCQH', 'CHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZCDZ', 'B201100042', '注册地址', 'XASGAJ.JG_JBXX j', 'j.ZCDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FZRQ', 'B201100042', '发照日期', 'XASGAJ.JG_JBXX j', 'j.FZRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YXQX', 'B201100042', '有效期限', 'XASGAJ.JG_JBXX j', 'j.YXQX', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FHDJ', 'B201100042', '防火等级', 'XASGAJ.JG_JBXX j', 'j.FHDJ', 'CHAR', '1', 'DJ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRS', 'B201100042', '从业人数', 'XASGAJ.JG_JBXX j', 'j.CYRS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FZJG', 'B201100042', '分支机构', 'XASGAJ.JG_JBXX j', 'j.FZJG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DWDM', 'B201100042', '单位代码', 'XASGAJ.JG_JBXX j', 'j.DWDM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GYDWLX', 'B201100042', '雇佣单位类型', 'XASGAJ.JG_JBXX j', 'j.GYDWLX', 'CHAR', '1', 'GYDWLX', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YZBM', 'B201100042', '邮政编码', 'XASGAJ.JG_JBXX j', 'j.YZBM', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGJLX', 'B201100042', '街路巷', 'XASGAJ.JG_JBXX j', 'j.JGJLX', 'CHAR', null, null, null);
commit;
prompt 100 records committed...
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGMLPH', 'B201100042', '门楼牌号', 'XASGAJ.JG_JBXX j', 'j.JGMLPH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGMLXZ', 'B201100042', '门楼详址', 'XASGAJ.JG_JBXX j', 'j.JGMLXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGMPHZ', 'B201100042', '门牌后缀', 'XASGAJ.JG_JBXX j', 'j.JGMPHZ', 'CHAR', '1', 'MPHZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGSSXQ', 'B201100042', '省市县区', 'XASGAJ.JG_JBXX j', 'j.JGSSXQ', 'CHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SZZRQ', 'B201100042', '所属责任区', 'XASGAJ.JG_JBXX j', 'j.SZZRQ', 'CHAR', '1', 'DW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('TZGJ', 'B201100042', '涉外投资国', 'XASGAJ.JG_JBXX j', 'j.TZGJ', 'CHAR', '1', 'JGDQ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DWDH', 'B201100042', '机构电话', 'XASGAJ.JG_JBXX j', 'j.DWDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_BH', 'B201100027', '车辆编号', 'XASGAJ.ZA_PCCLXX', 'CLPC_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_FLLX', 'B201100027', '车分类类型', 'XASGAJ.ZA_PCCLXX', 'CLPC_FLLX', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWRYXM', 'B201100032', '姓        名', 'xasgaj.jg_wbswryxx w', 'w.SWRYXM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZJHM', 'B201100032', '证件号码', 'xasgaj.jg_wbswryxx w', 'w.ZJHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYBH', 'B201100020', '关联人员编号', 'XASGAJ.JG_CYRY  t', 't.CYRY_RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NLD', 'B201100015', '年龄段', 'XASGAJ.RY_JBXX', 'CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NLD', 'B201100022', '年龄段', 'XASGAJ.RY_JBXX  c', 'c.CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NLD', 'B201100023', '年龄段', 'XASGAJ.RY_JBXX  c', 'CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NLD', 'B201100024', '年龄段', 'XASGAJ.RY_JBXX  c', 'CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NLD', 'B201100026', '年龄段', 'XASGAJ.RY_JBXX  c', 'CSRQ', 'CHARDATE', null, null, 'num_between');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('33', '2879d6f8:131fa4a7057:-8000', '33', '33', '33', 'DATE', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('a1', '79c8c89a:1323da9d9be:-8000', 'a1', 'a1', 'a1', 'DATE', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('11', '2879d6f8:131fa4a7057:-8000', '11', '11', '11', 'DATE', '0', 'XB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('22', '2879d6f8:131fa4a7057:-8000', '22', '22', '22', 'DATE', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('44', '2879d6f8:131fa4a7057:-8000', '44', '44', '44', 'DATE', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('55', '2879d6f8:131fa4a7057:-8000', '55', '55', '55', 'DATE', '1', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYBH', '3cfebef3:1328edc98f8:-7fed', '人员编号', 'RY_JBXX', 'RYBH', 'VARCHAR', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XM', '3cfebef3:1328edc98f8:-7fed', '姓名', 'RY_JBXX', 'XM', 'VARCHAR', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GMSFHM', '3cfebef3:1328edc98f8:-7fed', '公民身份号码', 'RY_JBXX', 'GMSFHM', 'VARCHAR', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XB', '3cfebef3:1328edc98f8:-7fed', '性别', 'RY_JBXX', 'XB', 'VARCHAR', '1', 'XB', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('61', '7adf59e3:132f0f4cce8:-8000', '61', '61', '61', 'DATE', '0', 'XB', 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('8', '31171d2c:132b99423bf:-8000', '8', '8', '8', 'DATE', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('7', '31171d2c:132b99423bf:-8000', '7', '7', '7', 'DATE', '0', 'XB', 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('9', '31171d2c:132b99423bf:-8000', '9', '9', '9', 'DATE', '0', null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ID', 'S000000013', '主键ID', 'fw_conf_xa.jw_tztg t', 'ID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('TITLE', 'S000000013', '消息标题', 'fw_conf_xa.jw_tztg t', 'TITLE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('TYPE', 'S000000013', '消息类型', 'fw_conf_xa.jw_tztg t', 'TYPE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CONTENT', 'S000000013', '消息具体内容', 'fw_conf_xa.jw_tztg t', 'CONTENT', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SENDUSERID', 'S000000013', '发送人', 'fw_conf_xa.jw_tztg t', 'SENDUSERID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SENDTIME', 'S000000013', '发送时间', 'fw_conf_xa.jw_tztg t', 'SENDTIME', 'CHAR_DATE', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SENDSTATUS', 'S000000013', '发送状态', 'fw_conf_xa.jw_tztg t', 'SENDSTATUS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SENDDEPTID', 'S000000013', '发送单位', 'fw_conf_xa.jw_tztg t', 'SENDDEPTID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('UPLOADFILENAME', 'S000000013', '上传文件的名字', 'fw_conf_xa.jw_tztg t', 'UPLOADFILENAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('REQDEVICE_ID', 'S000000013', '接收方手机串码字符集', 'fw_conf_xa.jw_tztg t', 'REQDEVICE_ID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('REQUSERNAME', 'S000000013', '接收方姓名字符集', 'fw_conf_xa.jw_tztg t', 'REQUSERNAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('REQDEPTID', 'S000000013', '接收方单位行政区划字符集', 'fw_conf_xa.jw_tztg t', 'REQDEPTID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('REQDEPTNAME', 'S000000013', '接收方单位名称字符集', 'fw_conf_xa.jw_tztg t', 'REQDEPTNAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SENDUSERNAME', 'S000000013', '发送用户姓名', 'fw_conf_xa.jw_tztg t', 'SENDUSERNAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SENDDEPTNAME', 'S000000013', '发送用户单位', 'fw_conf_xa.jw_tztg t', 'SENDDEPTNAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ADDID', 'S000000015', '通讯录编号', 'fw_conf_xa.jw_address t', 'ADDID', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NAME', 'S000000015', '人员姓名', 'fw_conf_xa.jw_address t', 'NAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YWM', 'B201100021', '英文名', 'XASGAJ.RY_JBXX  c', 'c.YWM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZJZL', 'B201100021', '证件种类', 'XASGAJ.RY_JBXX  c', 'c.ZJZL', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GMSFHM', 'B201100021', '证件号码', 'XASGAJ.RY_JBXX  c', 'c.ZJHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('QZZL', 'B201100021', '签证种类', 'XASGAJ.RY_JBXX  c', 'c.QZZL', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NLD', 'B201100016', '年龄段', 'XASGAJ.RY_JBXX  z', 'z.ZZRY_CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJBH', 'B201100028', '接警编号', 'XASGAJ.JCJ_JJXX j', 'j.JJ_JJBH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_AJBH', 'B201100028', '案件编号', 'XASGAJ.JCJ_JJXX j', 'j.JJ_AJBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_JJSJ', 'B201100028', '接警时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_JJSJ', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_JJDW', 'B201100028', '接警单位', 'XASGAJ.JCJ_JJXX j', 'j.JJ_JJDW', 'VARCHAR', '1', 'DW', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_JJR', 'B201100028', '接警人', 'XASGAJ.JCJ_JJXX j', 'j.JJ_JJR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_CJR', 'B201100028', '处警人', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CJR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_CJSJ', 'B201100028', '处警时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CJSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_CFBJ', 'B201100028', '是否重复报警', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CFBJ', 'VARCHAR', '1', 'SF', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJDZRQ', 'B201100028', '报警地责任区', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJDZRQ', 'VARCHAR', '1', 'DW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJRZZQH', 'B201100028', '报警人住址区划', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRZZQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJRZZJX', 'B201100028', '报警人住址街巷', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRZZJX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJRZZXZ', 'B201100028', '报警人住址详址', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRZZXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJR', 'B201100028', '报警人', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJRXB', 'B201100028', '报警人性别', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRXB', 'VARCHAR', '1', 'XB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_FXSJ', 'B201100028', '发现时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_FXSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_FXDD', 'B201100028', '发现地点', 'XASGAJ.JCJ_JJXX j', 'j.JJ_FXDD', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_AFDZLB', 'B201100028', '案发地址类别', 'XASGAJ.JCJ_JJXX j', 'j.JJ_AFDZLB', 'VARCHAR', '1', 'AFDZLB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_JQBT', 'B201100028', '警情标题', 'XASGAJ.JCJ_JJXX j', 'j.JJ_JQBT', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJXQDW', 'B201100028', '报警辖区单位', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJXQDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJRCSRQ', 'B201100028', '报警人出生日期', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRCSRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJRZJZL', 'B201100028', '报警人证件种类', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRZJZL', 'VARCHAR', '1', 'ZJZL', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJRZH', 'B201100028', '报警人证号', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_LXDH', 'B201100028', '联系电话', 'XASGAJ.JCJ_JJXX j', 'j.JJ_LXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJRDW', 'B201100028', '报警人单位', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJXS', 'B201100028', '报警形式', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJXS', 'VARCHAR', '1', 'BJLX', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJJB', 'B201100028', '报警级别', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJJB', 'VARCHAR', '1', 'BJJB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJNR', 'B201100028', '报警内容', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJNR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_ZXDZBZ', 'B201100028', '专项斗争标志', 'XASGAJ.JCJ_JJXX j', 'j.JJ_ZXDZBZ', 'VARCHAR', '1', 'ZXDZBZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_CLLX', 'B201100028', '处理类型', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CLLX', 'VARCHAR', '1', 'JCJ_CLLX', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJAJZT', 'B201100028', '报警案件状态', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJAJZT', 'VARCHAR', '1', 'AJZT', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_BJRZZ', 'B201100028', '报警人住址', 'XASGAJ.JCJ_JJXX j', 'j.JJ_BJRZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BJCZSJ', 'B201100028', '报警操作时间', 'XASGAJ.JCJ_JJXX j', 'j.BJCZSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_AJFSDZ', 'B201100028', '案件发生地址', 'XASGAJ.JCJ_JJXX j', 'j.JJ_AJFSDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_CJBS', 'B201100028', '处警标识', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CJBS', 'VARCHAR', '1', 'CJBS', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_CJDDDSJ', 'B201100028', '处警单到达时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CJDDDSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_CJDJSSJ', 'B201100028', '处警单接收时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CJDJSSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_CJDPJSJ', 'B201100028', '处警单二次派警时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_CJDPJSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_YJDW', 'B201100028', '移交单位', 'XASGAJ.JCJ_JJXX j', 'j.JJ_YJDW', 'VARCHAR', '1', 'DW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_YJR', 'B201100028', '移交人', 'XASGAJ.JCJ_JJXX j', 'j.JJ_YJR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_YJSJ', 'B201100028', '移交时间', 'XASGAJ.JCJ_JJXX j', 'j.JJ_YJSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJ_YJSM', 'B201100028', '移交说明', 'XASGAJ.JCJ_JJXX j', 'j.JJ_YJSM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CJDW', 'B201100028', '处警单位', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJDW', 'VARCHAR', '1', 'DW', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CJR', 'B201100028', '处警人', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CJBH', 'B201100028', '处警编号', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJBH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CJLB', 'B201100028', '处警类别', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJLB', 'VARCHAR', '1', 'CJLB', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JJBH', 'B201100043', '处警接警编号', 'XASGAJ.JCJ_CJXX c', 'c.CJ_JJBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CJSJ', 'B201100043', '填写时间', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJSJ', 'VARCHAR', null, null, null);
commit;
prompt 200 records committed...
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_ZBLD', 'B201100043', '处警值班领导', 'XASGAJ.JCJ_CJXX c', 'c.CJ_ZBLD', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_DDXCSJ', 'B201100043', '处警到达现场时间', 'XASGAJ.JCJ_CJXX c', 'c.CJ_DDXCSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CJJG', 'B201100043', '处警结果', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJJG', 'CHAR', '1', 'CJJG', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_BCCLJG', 'B201100043', '处警补充处理结果', 'XASGAJ.JCJ_CJXX c', 'c.CJ_BCCLJG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_SFSW', 'B201100043', '处警是否涉外', 'XASGAJ.JCJ_CJXX c', 'c.CJ_SFSW', 'CHAR', '1', 'SFSW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_XXQK', 'B201100043', '处警详细情况', 'XASGAJ.JCJ_CJXX c', 'c.CJ_XXQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_SSXXQK', 'B201100043', '处警损失详细情况', 'XASGAJ.JCJ_CJXX c', 'c.CJ_SSXXQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_FSCS', 'B201100043', '处警案事件发生场所', 'XASGAJ.JCJ_CJXX c', 'c.CJ_FSCS', 'CHAR', '1', 'FSCS', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_PHXXAJ', 'B201100043', '处警破获现行案件', 'XASGAJ.JCJ_CJXX c', 'c.CJ_PHXXAJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_ZHZACY', 'B201100043', '处警抓获作案成员', 'XASGAJ.JCJ_CJXX c', 'c.CJ_ZHZACY', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CDJL', 'B201100043', '处警出动警力', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CDJL', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CDJDC', 'B201100043', '处警出动机动车', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CDJDC', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CDCZ', 'B201100043', '处警出动船只', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CDCZ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_ZJJJSS', 'B201100043', '处警直接经济损失', 'XASGAJ.JCJ_CJXX c', 'c.CJ_ZJJJSS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_WHSS', 'B201100043', '处警挽回损失', 'XASGAJ.JCJ_CJXX c', 'c.CJ_WHSS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_JZQZ', 'B201100043', '处警救助群众', 'XASGAJ.JCJ_CJXX c', 'c.CJ_JZQZ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_JZSY', 'B201100043', '处警救助伤员', 'XASGAJ.JCJ_CJXX c', 'c.CJ_JZSY', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_JJFNS', 'B201100043', '处警解救妇女数', 'XASGAJ.JCJ_CJXX c', 'c.CJ_JJFNS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_JJETS', 'B201100043', '处警解救儿童数', 'XASGAJ.JCJ_CJXX c', 'c.CJ_JJETS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_JJRZS', 'B201100043', '处警解救人质数', 'XASGAJ.JCJ_CJXX c', 'c.CJ_JJRZS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_RYSWS', 'B201100043', '处警人员死亡数', 'XASGAJ.JCJ_CJXX c', 'c.CJ_RYSWS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_RYSSS', 'B201100043', '处警人员受伤数', 'XASGAJ.JCJ_CJXX c', 'c.CJ_RYSSS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_TPRF', 'B201100043', '处警逃跑人犯', 'XASGAJ.JCJ_CJXX c', 'c.CJ_TPRF', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_LZSCRS', 'B201100043', '处警留置审查人数', 'XASGAJ.JCJ_CJXX c', 'c.CJ_LZSCRS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_CJCZSJ', 'B201100043', '处警处警操作时间', 'XASGAJ.JCJ_CJXX c', 'c.CJ_CJCZSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_AJSLR', 'B201100043', '处警案件受理人', 'XASGAJ.JCJ_CJXX c', 'c.CJ_AJSLR', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CJ_AJSLDW', 'B201100043', '处警案件受理单位', 'XASGAJ.JCJ_CJXX c', 'c.CJ_AJSLDW', 'CHAR', '1', 'DW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYBH', 'B201100015', '人员编号', 'XASGAJ.RY_JBXX', 'RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYZZBH', 'B201100015', '人员住址编号', 'XASGAJ.RY_JBXX', 'RYZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GMSFHM', 'B201100015', '公民身份号码', 'XASGAJ.RY_JBXX', 'GMSFHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JWSFZH', 'B201100015', '境外身份号码', 'XASGAJ.RY_JBXX', 'JWSFZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XM', 'B201100015', '姓名', 'XASGAJ.RY_JBXX', 'XM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XMPY', 'B201100015', '姓名拼音', 'XASGAJ.RY_JBXX', 'XMPY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYM', 'B201100015', '曾用名', 'XASGAJ.RY_JBXX', 'CYM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZJZL', 'B201100015', '证件种类', 'XASGAJ.RY_JBXX', 'ZJZL', 'VARCHAR', '1', 'ZJZL', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZJHM', 'B201100015', '证件号码', 'XASGAJ.RY_JBXX', 'ZJHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BMCH', 'B201100015', '别名绰号', 'XASGAJ.RY_JBXX', 'BMCH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XB', 'B201100015', '性别', 'XASGAJ.RY_JBXX', 'XB', 'VARCHAR', '1', 'XB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('MZ', 'B201100015', '民族', 'XASGAJ.RY_JBXX', 'MZ', 'VARCHAR', '1', 'MZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CSRQ', 'B201100015', '出生日期', 'XASGAJ.RY_JBXX', 'CSRQ', 'CHAR_DATE', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CSSJ', 'B201100015', '出生时间', 'XASGAJ.RY_JBXX', 'CSSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CSDQ', 'B201100015', '出生地区', 'XASGAJ.RY_JBXX', 'CSDQ', 'VARCHAR', '1', 'JGDQ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CSQX', 'B201100015', '出生区县', 'XASGAJ.RY_JBXX', 'CSQX', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CSXZ', 'B201100015', '出生详址', 'XASGAJ.RY_JBXX', 'CSXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JHRYSFZH', 'B201100015', '监护人一身份证号', 'XASGAJ.RY_JBXX', 'JHRYSFZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JHRYXM', 'B201100015', '监护人一姓名', 'XASGAJ.RY_JBXX', 'JHRYXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JHGXY', 'B201100015', '监护关系一', 'XASGAJ.RY_JBXX', 'JHGXY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JHRESFZH', 'B201100015', '监护人二身份证号', 'XASGAJ.RY_JBXX', 'JHRESFZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_YWXJJCC', 'B201100034', '公共场所有无小件寄存处', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_YWXJJCC', 'CHAR', '1', 'YW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_CSZMJ', 'B201100034', '公共场所总面积', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_CSZMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_YYMJ', 'B201100034', '公共场所营业面积', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_YYMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_ZWHJ', 'B201100034', '公共场所周围环境', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_ZWHJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZT', 'B201100017', '驾驶证状态', 'XASGAJ.DRIVER', 'ZT', 'VARCHAR', '1', 'JSZZT', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CCLZRQ', 'B201100017', '初次领证日期', 'XASGAJ.DRIVER', 'CCLZRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YXQZ', 'B201100017', '有效期止', 'XASGAJ.DRIVER', 'YXQZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YXQS', 'B201100017', '有效期始', 'XASGAJ.DRIVER', 'YXQS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZQX', 'B201100017', '驾证期限', 'XASGAJ.DRIVER', 'JZQX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZJCX', 'B201100017', '准驾车型', 'XASGAJ.DRIVER', 'ZJCX', 'VARCHAR', '1', 'ZJCX', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FZRQ', 'B201100017', '发证日期', 'XASGAJ.DRIVER', 'FZRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LXZSXXDZ', 'B201100017', '联系住所详细地址', 'XASGAJ.DRIVER', 'LXZSXXDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LXZSXZQH', 'B201100017', '联系住所行政区划', 'XASGAJ.DRIVER', 'LXZSXZQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LXDH', 'B201100017', '联系电话', 'XASGAJ.DRIVER', 'LXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CSRQ', 'B201100017', '出生日期', 'XASGAJ.DRIVER', 'CSRQ', 'CHAR_DATE', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XB', 'B201100017', '性别', 'XASGAJ.DRIVER', 'XB', 'VARCHAR', '1', 'XB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XM', 'B201100017', '姓名', 'XASGAJ.DRIVER', 'XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SFZMHM', 'B201100017', '身份证号', 'XASGAJ.DRIVER', 'SFZMHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SFZMMC', 'B201100017', '身份证明名称', 'XASGAJ.DRIVER', 'SFZMMC', 'VARCHAR', '1', 'SFZZL', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BZCS', 'B201100017', '补证次数', 'XASGAJ.DRIVER', 'BZCS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FZJG', 'B201100017', '发证机关', 'XASGAJ.DRIVER', 'FZJG', 'VARCHAR', '1', 'FZJG', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LJJF', 'B201100017', '累积记分', 'XASGAJ.DRIVER', 'LJJF', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('WFCS', 'B201100017', '违法次数', 'XASGAJ.DRIVER', 'WFCS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SYRQ', 'B201100017', '下一审验日期', 'XASGAJ.DRIVER', 'SYRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CFRQ', 'B201100017', '超分日期', 'XASGAJ.DRIVER', 'CFRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SGCS', 'B201100017', '事故次数', 'XASGAJ.DRIVER', 'SGCS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRSFZH', 'B201100034', '法人身份证号', 'XASGAJ.JG_JBXX j', 'j.FRSFZHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRZZ', 'B201100034', '法人住址', 'XASGAJ.JG_JBXX j', 'j.FRZZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LXDH', 'B201100034', '联系电话', 'XASGAJ.JG_JBXX j', 'j.DWDH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRDB', 'B201100034', '法人代表', 'XASGAJ.JG_JBXX j', 'j.FRDB', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DWMC', 'B201100034', '单位名称', 'XASGAJ.JG_JBXX j', 'j.DWMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_BH', 'B201100023', '房屋编号', 'XASGAJ.DZ_CZFW t', 't.CZFW_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_ZZBH', 'B201100023', '房屋住址编号', 'XASGAJ.DZ_CZFW t', 't.CZFW_ZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYBH', 'B201100023', '房屋房主编号', 'XASGAJ.DZ_CZFW t', 't.CZFW_RYJGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_DJBH', 'B201100023', '房屋登记编号', 'XASGAJ.DZ_CZFW t', 't.CZFW_DJBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_SZQX', 'B201100023', '房屋所在区县', 'XASGAJ.DZ_CZFW t', 't.CZFW_SZQX', 'CHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_SZXZ', 'B201100023', '房屋所在详址', 'XASGAJ.DZ_CZFW t', 't.CZFW_SZXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_SYR', 'B201100023', '房屋所有人', 'XASGAJ.DZ_CZFW t', 't.CZFW_SYR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('THBH', 'B201100033', '特行编号', 'XASGAJ.ZA_TZHY t', 't.TZHY_JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGBH', 'B201100033', '机构特行编号', 'XASGAJ.ZA_TZHY t', 't.TZHY_JGTHBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('MC', 'B201100033', '名称', 'XASGAJ.ZA_TZHY t', 't.TZHY_MC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XKZH', 'B201100033', '许可证号', 'XASGAJ.ZA_TZHY t', 't.TZHY_TZHYXKZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('THBM', 'B201100033', '特行编码', 'XASGAJ.ZA_TZHY t', 't.TZHY_THBM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('THLB', 'B201100033', '特行类别', 'XASGAJ.ZA_TZHY t', 't.TZHY_THLB', 'CHAR', '1', 'THLB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZZMJ', 'B201100033', '建筑总面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_JZZMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('KFMJ', 'B201100033', '库房面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_KFMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('MTMJ', 'B201100033', '门庭面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_MTMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('HKSMJ', 'B201100033', '会客室面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_HKSMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JCSMJ', 'B201100033', '寄存室面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_JCSMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('TCCZMJ', 'B201100033', '停车场总面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_TCCZMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YLCSMJ', 'B201100033', '娱乐场所面积', 'XASGAJ.ZA_TZHY t', 't.TZHY_YLCSMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('TDKD', 'B201100033', '通道宽度', 'XASGAJ.ZA_TZHY t', 't.TZHY_TDKD', 'NUMBER', null, null, null);
commit;
prompt 300 records committed...
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XJDJ', 'B201100033', '星级等级', 'XASGAJ.ZA_TZHY t', 't.TZHY_XJDJ', 'CHAR', '1', 'XJDJ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FJS', 'B201100033', '房间数', 'XASGAJ.ZA_TZHY t', 't.TZHY_FJS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CWS', 'B201100033', '床位数', 'XASGAJ.ZA_TZHY t', 't.TZHY_CWS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FZJG', 'B201100033', '发证机关', 'XASGAJ.ZA_TZHY t', 't.TZHY_FZJG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FZRQ', 'B201100033', '发证日期', 'XASGAJ.ZA_TZHY t', 't.TZHY_FZRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('HFR', 'B201100033', '核发人', 'XASGAJ.ZA_TZHY t', 't.TZHY_HFR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LZR', 'B201100033', '领证人', 'XASGAJ.ZA_TZHY t', 't.TZHY_LZR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZBZZMC', 'B201100033', '治保组织名称', 'XASGAJ.ZA_TZHY t', 't.TZHY_ZBZZMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZRMJ', 'B201100033', '责任民警', 'XASGAJ.ZA_TZHY t', 't.TZHY_ZRMJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZRMJDH', 'B201100033', '责任民警电话', 'XASGAJ.ZA_TZHY t', 't.TZHY_MJDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZXBS', 'B201100033', '注销标识', 'XASGAJ.ZA_TZHY t', 't.TZHY_ZXBS', 'CHAR', '1', 'ZXBS', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZXRQ', 'B201100033', '注销日期', 'XASGAJ.ZA_TZHY t', 't.TZHY_ZXRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZXYY', 'B201100033', '注销原因', 'XASGAJ.ZA_TZHY t', 't.TZHY_ZXYY', 'VARCHAR', '1', 'ZXYY', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BGQK', 'B201100033', '变更情况', 'XASGAJ.ZA_TZHY t', 't.TZHY_BGQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BZ', 'B201100033', '备注', 'XASGAJ.ZA_TZHY t', 't.TZHY_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DWMC', 'B201100033', '单位名称', 'XASGAJ.JG_JBXX j', 'j.DWMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRDB', 'B201100033', '法人代表', 'XASGAJ.JG_JBXX j', 'j.FRDB', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LXDH', 'B201100033', '联系电话', 'XASGAJ.JG_JBXX j', 'j.DWDH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRZZ', 'B201100033', '法人住址', 'XASGAJ.JG_JBXX j', 'j.FRZZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRSFZH', 'B201100033', '法人身份证号', 'XASGAJ.JG_JBXX j', 'j.FRSFZHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SAWP_BH', 'B201100031', '品编号', 'xasgaj.aj_sawp', 'SAWP_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SAWP_AJBH', 'B201100031', '物品案件编号', 'xasgaj.aj_sawp', 'SAWP_AJBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SAWP_RYBH', 'B201100031', '物品人员编号', 'xasgaj.aj_sawp', 'SAWP_RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SAWP_CJH', 'B201100031', '物品车架号', 'xasgaj.aj_sawp', 'SAWP_CJH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SAWP_FDJH', 'B201100031', '物品发动机号', 'xasgaj.aj_sawp', 'SAWP_FDJH', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SAWP_CPH', 'B201100031', '物品车牌号', 'xasgaj.aj_sawp', 'SAWP_CPH', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('HPZL', 'B201100031', '物品号牌种类', 'xasgaj.aj_sawp', 'SAWP_HPZL', 'CHAR', '1', 'HPZL', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SAWP_CZSFZH', 'B201100031', '物品车主身份证号', 'xasgaj.aj_sawp', 'SAWP_CZSFZH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SAWP_CZLXDH', 'B201100031', '物品车主联系电话', 'xasgaj.aj_sawp', 'SAWP_CZLXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SAWP_CZDZ', 'B201100031', '物品车主地址', 'xasgaj.aj_sawp', 'SAWP_CZDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SAWP_SFBX', 'B201100031', '物品是否参加被盗抢保险', 'xasgaj.aj_sawp', 'SAWP_SFBX', 'CHAR', '1', 'SF', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SAWP_BXQK', 'B201100031', '物品保险情况', 'xasgaj.aj_sawp', 'SAWP_BXQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SAWP_BZ', 'B201100031', '物品备注', 'xasgaj.aj_sawp', 'SAWP_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YYCSDM', 'B201100032', '网吧单位代码', 'xasgaj.JG_WBXX t', 't.YYCSDM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YYCSMC', 'B201100032', '单位名称', 'xasgaj.JG_WBXX t', 't.YYCSMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DZQH', 'B201100032', '地址区划', 'xasgaj.JG_WBXX t', 't.DZQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DZ', 'B201100032', '地        址', 'xasgaj.JG_WBXX t', 't.DZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CKIPDZ', 'B201100032', '主机IP地址', 'xasgaj.JG_WBXX t', 't.CKIPDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ENTERDB_TIME', 'B201100032', '录入时间', 'xasgaj.JG_WBXX t', 't.ENTERDB_TIME', 'DATE', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_TDK', 'B201100034', '公共场所通道口', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_TDK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_QT', 'B201100034', '公共场所其它', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_QT', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_NBJG', 'B201100034', '公共场所内部结构', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_NBJG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_JZWJG', 'B201100034', '公共场所建筑物结构', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_JZWJG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_GGCSDJ', 'B201100034', '公共场所等级', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_GGCSDJ', 'CHAR', '1', 'GGCSDJ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_CSLB', 'B201100034', '公共场所类别', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_CSLB', 'CHAR', '1', 'CSLB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_MC', 'B201100034', '公共场所名称', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_MC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_BADJHM', 'B201100034', '公共场所备案登记号码', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_BADJHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGBH', 'B201100034', '公共场所关联机构编号', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_BH', 'B201100034', '公共场所编号', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GGCS_TDKSL', 'B201100034', '公共场所通道口数量', 'XASGAJ.ZA_GGCSXX t', 't.GGCS_TDKSL', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_SYRPY', 'B201100023', '房屋所有人拼音', 'XASGAJ.DZ_CZFW t', 't.CZFW_SYRPY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_SYRCSRQ', 'B201100023', '房屋所有人出生日期', 'XASGAJ.DZ_CZFW t', 't.CZFW_SYRCSRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_SYRZH', 'B201100023', '房屋所有人证号', 'XASGAJ.DZ_CZFW t', 't.CZFW_SYRZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_CQDW', 'B201100023', '房屋产权单位', 'XASGAJ.DZ_CZFW t', 't.CZFW_CQDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_LXDH', 'B201100023', '房主联系电话', 'XASGAJ.DZ_CZFW t', 't.CZFW_LXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_DLR', 'B201100023', '房屋代理人', 'XASGAJ.DZ_CZFW t', 't.CZFW_DLR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_DLRLXFS', 'B201100023', '代理人联系方式', 'XASGAJ.DZ_CZFW t', 't.CZFW_DLRLXFS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_CQXZ', 'B201100023', '房屋产权性质', 'XASGAJ.DZ_CZFW t', 't.CZFW_CQXZ', 'CHAR', '1', 'FWCQXZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_GLJB', 'B201100023', '管理级别', 'XASGAJ.DZ_CZFW t', 't.CZFW_GLJB', 'CHAR', '1', 'GLJB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_SFXXY', 'B201100023', '是否信息员', 'XASGAJ.DZ_CZFW t', 't.CZFW_SFXXY', 'CHAR', '1', 'SFXXY', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_CZYT', 'B201100023', '出租用途', 'XASGAJ.DZ_CZFW t', 't.CZFW_CZYT', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_FWLX', 'B201100023', '房屋类型', 'XASGAJ.DZ_CZFW t', 't.CZFW_FWLX', 'CHAR', '1', 'FWLX', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_CZJS', 'B201100023', '出租间数', 'XASGAJ.DZ_CZFW t', 't.CZFW_CZJS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_CZMJ', 'B201100023', '出租面积', 'XASGAJ.DZ_CZFW t', 't.CZFW_CZMJ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_CZSJ', 'B201100023', '出租时间', 'XASGAJ.DZ_CZFW t', 't.CZFW_CZSJ', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_CZZZSJ', 'B201100023', '出租终止时间', 'XASGAJ.DZ_CZFW t', 't.CZFW_CZZZSJ', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_ZXYY', 'B201100023', '注销原因', 'XASGAJ.DZ_CZFW t', 't.CZFW_ZXYY', 'CHAR', '1', 'ZXYY', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_BZ', 'B201100023', '备注', 'XASGAJ.DZ_CZFW t', 't.CZFW_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CZFW_FWZT', 'B201100023', '房屋状态', 'XASGAJ.DZ_CZFW t', 't.CZFW_FWZT', 'CHAR', '1', 'FWZT', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CCODE', 'B201100018', '旅客编码', 'XASGAJ.T_CHREC', 'CCODE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XM', 'B201100018', '姓名', 'XASGAJ.T_CHREC', 'NAME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NAMEPY', 'B201100018', '姓名拼音', 'XASGAJ.T_CHREC', 'NAMEPY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XB', 'B201100018', '性别', 'XASGAJ.T_CHREC', 'SEX', 'VARCHAR', '1', 'XB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CSRQ', 'B201100018', '出生日期', 'XASGAJ.T_CHREC', 'BDATE', 'CHAR_DATE', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NATION', 'B201100018', '民族', 'XASGAJ.T_CHREC', 'NATION', 'VARCHAR', '1', 'MZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('IDTYPE', 'B201100018', '证件类型', 'XASGAJ.T_CHREC', 'IDTYPE', 'VARCHAR', '1', 'GNZJ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GMSFHM', 'B201100018', '证件号码', 'XASGAJ.T_CHREC', 'IDCODE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XZQH', 'B201100018', '旅客省市县', 'XASGAJ.T_CHREC', 'XZQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ADDRESS', 'B201100018', '旅客详址', 'XASGAJ.T_CHREC', 'ADDRESS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LTIME', 'B201100018', '入住时间', 'XASGAJ.T_CHREC', 'LTIME', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NOROOM', 'B201100018', '入住房号', 'XASGAJ.T_CHREC', 'NOROOM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ETIME', 'B201100018', '退房时间', 'XASGAJ.T_CHREC', 'ETIME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('STIME', 'B201100018', '传送时间', 'XASGAJ.T_CHREC', 'STIME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CARDTYPE', 'B201100018', '信用卡类型', 'XASGAJ.T_CHREC', 'CARDTYPE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CARDNO', 'B201100018', '信用卡号码', 'XASGAJ.T_CHREC', 'CARDNO', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RTIME', 'B201100018', '接收时间', 'XASGAJ.T_CHREC', 'RTIME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('PICTURE', 'B201100018', '照片', 'XASGAJ.T_CHREC', 'PICTURE', 'BLOB', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GCODE', 'B201100018', '团队编码', 'XASGAJ.T_CHREC', 'GCODE', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NOHOTEL', 'B201100018', '旅馆名称', 'XASGAJ.T_CHREC', 'NOHOTEL', 'VARCHAR', '1', 'LGMC', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CREATETIME', 'B201100018', '录入时间', 'XASGAJ.T_CHREC', 'CREATETIME', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LWAITER', 'B201100018', '入住当班人', 'XASGAJ.T_CHREC', 'LWAITER', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('EWAITER', 'B201100018', '退房当班人', 'XASGAJ.T_CHREC', 'EWAITER', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FLAG', 'B201100018', '标识', 'XASGAJ.T_CHREC', 'FLAG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CSRQ', 'B201100023', '出生日期', 'XASGAJ.RY_JBXX d', 'd.CSRQ', 'CHAR_DATE', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XB', 'B201100023', '性       别', 'XASGAJ.RY_JBXX d', 'd.XB', 'CHAR', '1', 'XB', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XM', 'B201100023', '姓       名', 'XASGAJ.RY_JBXX d', 'd.XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GMSFHM', 'B201100023', '身份证号', 'XASGAJ.RY_JBXX d', 'd.GMSFHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_BH', 'B201100019', '寄住编号', 'XASGAJ.RY_JZXX', 'JZ_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYBH', 'B201100019', '人员编号', 'XASGAJ.RY_JZXX', 'JZ_RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_QTZZBH', 'B201100019', '其他住址编号', 'XASGAJ.RY_JZXX', 'JZ_QTZZBH', 'VARCHAR', null, null, null);
commit;
prompt 400 records committed...
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_YHZGX', 'B201100019', '与户主关系', 'XASGAJ.RY_JZXX', 'JZ_YHZGX', 'VARCHAR', '1', 'RYGX', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_GMSFHM', 'B201100019', '公民身份号码', 'XASGAJ.RY_JZXX', 'JZ_GMSFHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_XM', 'B201100019', '姓名', 'XASGAJ.RY_JZXX', 'JZ_XM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_CSRQ', 'B201100019', '出生日期', 'XASGAJ.RY_JZXX', 'JZ_CSRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_ZZBH', 'B201100019', '住址编号', 'XASGAJ.RY_JZXX', 'JZ_ZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_JZDQH', 'B201100019', '住地区划', 'XASGAJ.RY_JZXX', 'JZ_JZDQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_JZDXZ', 'B201100019', '居住地详址', 'XASGAJ.RY_JZXX', 'JZ_JZDXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_HSJZBZ', 'B201100019', '何时寄住本址', 'XASGAJ.RY_JZXX', 'JZ_HSJZBZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_HYJZBZ', 'B201100019', '何因寄住本址', 'XASGAJ.RY_JZXX', 'JZ_HYJZBZ', 'VARCHAR', '1', 'JZYY', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_BZ', 'B201100019', '备注', 'XASGAJ.RY_JZXX', 'JZ_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_DJR', 'B201100019', '登记人', 'XASGAJ.RY_JZXX', 'JZ_DJR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JZ_DJSJ', 'B201100019', '登记日期', 'XASGAJ.RY_JZXX', 'JZ_DJSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDW_BH', 'B201100036', '机构编号', 'XASGAJ.ZA_SWDW t', 't.SWDW_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGBH', 'B201100036', '关联机构编号', 'XASGAJ.ZA_SWDW t', 't.SWDW_JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDW_LXR', 'B201100036', '机构联系人', 'XASGAJ.ZA_SWDW t', 't.SWDW_LXR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDW_SJBGDZ', 'B201100036', '实际办公地址', 'XASGAJ.ZA_SWDW t', 't.SWDW_SJBGDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDW_ZFZB', 'B201100036', '中方资本', 'XASGAJ.ZA_SWDW t', 't.SWDW_ZFZB', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDW_WFZB', 'B201100036', '外方资本', 'XASGAJ.ZA_SWDW t', 't.SWDW_WFZB', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDW_ZFTZDW', 'B201100036', '中方投资单位', 'XASGAJ.ZA_SWDW t', 't.SWDW_ZFTZDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDW_WFTZDW', 'B201100036', '外方投资单位', 'XASGAJ.ZA_SWDW t', 't.SWDW_WFTZDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDW_TZGJDQ', 'B201100036', '投资国家地区', 'XASGAJ.ZA_SWDW t', 't.SWDW_TZGJDQ', 'CHAR', '1', 'JGDQ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDW_QYQKJZ', 'B201100036', '企业情况记载', 'XASGAJ.ZA_SWDW t', 't.SWDW_QYQKJZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDW_ZXBS', 'B201100036', '注销标识', 'XASGAJ.ZA_SWDW t', 't.SWDW_ZXBS', 'CHAR', '1', 'ZXBS', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDW_ZXYY', 'B201100036', '注销原因', 'XASGAJ.ZA_SWDW t', 't.SWDW_ZXYY', 'VARCHAR', '1', 'ZXYY', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDW_ZXRQ', 'B201100036', '注销日期', 'XASGAJ.ZA_SWDW t', 't.SWDW_ZXRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWDW_BZ', 'B201100036', '备注', 'XASGAJ.ZA_SWDW t', 't.SWDW_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRZZ', 'B201100036', '法人住址', 'XASGAJ.JG_JBXX j', 'j.FRZZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LXDH', 'B201100036', '联系电话', 'XASGAJ.JG_JBXX j', 'j.DWDH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRDB', 'B201100036', '法人代表', 'XASGAJ.JG_JBXX j', 'j.FRDB', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DWMC', 'B201100036', '单位名称', 'XASGAJ.JG_JBXX j', 'j.DWMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_BDBH', 'B201100016', '变动编号', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_BDBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYBH', 'B201100016', '人员编号', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_ZZBH', 'B201100016', '住址编号', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_QTZZBH', 'B201100016', '其他住址', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_QTZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZZBH', 'B201100016', '暂住证编号', 'XASGAJ.RY_ZKBD  z', 'z.ZZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GMSFHM', 'B201100016', '身份号码', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_GMSFHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XM', 'B201100016', '姓名', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_XM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_CYM', 'B201100016', '曾用名', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_CYM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XB', 'B201100016', '性别', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_XB', 'VARCHAR', '1', 'XB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_MZ', 'B201100016', '民族', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_MZ', 'VARCHAR', '1', 'MZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CSRQ', 'B201100016', '出生日期', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_CSRQ', 'CHAR_DATE', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_WHCD', 'B201100016', '文化程度', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_WHCD', 'VARCHAR', '1', 'WHCD', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_ZZMM', 'B201100016', '政治面貌', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZZMM', 'VARCHAR', '1', 'ZZMM', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_HYZK', 'B201100016', '婚姻状况', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_HYZK', 'VARCHAR', '1', 'HYZK', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_HJDQH', 'B201100016', '户籍省市县', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_HJDQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_HJXZ', 'B201100016', '户籍详址', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_HJXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_ZRQ', 'B201100016', '责任区', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_DDSJ', 'B201100016', '到达时间', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_DDSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_ZZSY', 'B201100016', '暂住事由', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZZSY', 'VARCHAR', '1', 'ZZSY', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_YZY', 'B201100016', '原职业', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_YZY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_YZYLB', 'B201100016', '原职业类别', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_YZYLB', 'VARCHAR', '1', 'ZYLB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_XZY', 'B201100016', '现职业', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_XZY', 'VARCHAR', '1', 'ZYLB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_ZYLB', 'B201100016', '职业类别', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZYLB', 'VARCHAR', '1', 'ZYLB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_ZZCS', 'B201100016', '暂住处所', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZZCS', 'VARCHAR', '1', 'ZZCS', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_FWCS', 'B201100016', '服务处所', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_FWCS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_JYZM', 'B201100016', '就业证明', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_JYZM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_ZZDZAZRRXM', 'B201100016', '暂住地治安责任人姓名', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZZDZAZRRXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_GZDZAZRRXM', 'B201100016', '工作地治安责任人姓名', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_GZDZAZRRXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_FZRGDDH', 'B201100016', '工作地负责人固定电话', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_FZRGDDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_FZRYDDH', 'B201100016', '工作地负责人移动电话', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_FZRYDDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_JZZBL', 'B201100016', '居住证办理情况', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_JZZBL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_QFRQ', 'B201100016', '签发日期', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_QFRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_YXQX', 'B201100016', '有效期限', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_YXQX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_ZZZYXJZSJ', 'B201100016', '有效期截止日期', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_ZZZYXJZSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_DJDW', 'B201100016', '暂住人员登记单位', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_DJDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_DJR', 'B201100016', '暂住人员登记人', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_DJR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZRY_DJSJ', 'B201100016', '暂住人员登记日期', 'XASGAJ.RY_ZKBD  z', 'z.ZZRY_DJSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_JGBH', 'B201100035', '公司编号', 'XASGAJ.ZA_BAGS', 'BAGS_JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_DWMC', 'B201100035', '公司名称', 'XASGAJ.ZA_BAGS', 'BAGS_DWMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_GSDM', 'B201100035', '公司代码', 'XASGAJ.ZA_BAGS', 'BAGS_GSDM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_DWCZ', 'B201100035', '公司传真', 'XASGAJ.ZA_BAGS', 'BAGS_DWCZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_DWDH', 'B201100035', '公司电话', 'XASGAJ.ZA_BAGS', 'BAGS_DWDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_DWDZYX', 'B201100035', '公司电子邮箱', 'XASGAJ.ZA_BAGS', 'BAGS_DWDZYX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_GLFW', 'B201100035', '管理范围', 'XASGAJ.ZA_BAGS', 'BAGS_GLFW', 'VARCHAR', '1', 'PZGW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_FRDB', 'B201100035', '代表人', 'XASGAJ.ZA_BAGS', 'BAGS_FRDB', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_FRSFZHM', 'B201100035', '法定代表人身份证号', 'XASGAJ.ZA_BAGS', 'BAGS_FRSFZHM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_FRLXDH', 'B201100035', '法定代表人联系电话', 'XASGAJ.ZA_BAGS', 'BAGS_FRLXDH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_FRZZ', 'B201100035', '法定代表人住址', 'XASGAJ.ZA_BAGS', 'BAGS_FRZZ', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_ZGBM', 'B201100035', '主管部门名称', 'XASGAJ.ZA_BAGS', 'BAGS_ZGBM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_FZR', 'B201100035', '主管部门负责人', 'XASGAJ.ZA_BAGS', 'BAGS_FZR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_ZW', 'B201100035', '主管部门负责职务', 'XASGAJ.ZA_BAGS', 'BAGS_ZW', 'CHAR', '1', 'BAZGZW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_FZRDH', 'B201100035', '主管部门负责人电话', 'XASGAJ.ZA_BAGS', 'BAGS_FZRDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_GLRYS', 'B201100035', '管理人员数', 'XASGAJ.ZA_BAGS', 'BAGS_GLRYS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_ZBFBQ', 'B201100035', '装备防暴枪', 'XASGAJ.ZA_BAGS', 'BAGS_ZBFBQ', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_ZBXJG', 'B201100035', '装备橡胶棍', 'XASGAJ.ZA_BAGS', 'BAGS_ZBXJG', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_ZBYCC', 'B201100035', '装备运钞车', 'XASGAJ.ZA_BAGS', 'BAGS_ZBYCC', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_ZPRY', 'B201100035', '招聘保安人数', 'XASGAJ.ZA_BAGS', 'BAGS_ZPRY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_JGZCH', 'B201100035', '注册号', 'XASGAJ.ZA_BAGS', 'BAGS_JGZCH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_BAGS_ZCRQ', 'B201100035', '注册日期', 'XASGAJ.ZA_BAGS', 'BAGS_BAGS_ZCRQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_ZCQH', 'B201100035', '注册区划', 'XASGAJ.ZA_BAGS', 'BAGS_ZCQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_ZCDZ', 'B201100035', '注册地址', 'XASGAJ.ZA_BAGS', 'BAGS_ZCDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_JGZCXZ', 'B201100035', '注册详址', 'XASGAJ.ZA_BAGS', 'BAGS_JGZCXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_YXQX', 'B201100035', '有效期限', 'XASGAJ.ZA_BAGS', 'BAGS_YXQX', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_JGSSXQ', 'B201100035', '省市县区', 'XASGAJ.ZA_BAGS', 'BAGS_JGSSXQ', 'CHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_JGJLX', 'B201100035', '街路巷', 'XASGAJ.ZA_BAGS', 'BAGS_JGJLX', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_JGMLPH', 'B201100035', '门楼牌号', 'XASGAJ.ZA_BAGS', 'BAGS_JGMLPH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_JGMLXZ', 'B201100035', '门楼详址', 'XASGAJ.ZA_BAGS', 'BAGS_JGMLXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_JGMPHZ', 'B201100035', '门牌后缀', 'XASGAJ.ZA_BAGS', 'BAGS_JGMPHZ', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_JGDZ', 'B201100035', '详细地址', 'XASGAJ.ZA_BAGS', 'BAGS_JGDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_YZBH', 'B201100035', '邮政编码', 'XASGAJ.ZA_BAGS', 'BAGS_YZBH', 'VARCHAR', null, null, null);
commit;
prompt 500 records committed...
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_SZZRQ', 'B201100035', '所属责任区', 'XASGAJ.ZA_BAGS', 'BAGS_SZZRQ', 'CHAR', '1', 'DW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_XFDJ', 'B201100035', '消防等级 ', 'XASGAJ.ZA_BAGS', 'BAGS_XFDJ', 'CHAR', '1', 'XFDJ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_DWXZ', 'B201100035', '单位性质 ', 'XASGAJ.ZA_BAGS', 'BAGS_DWXZ', 'CHAR', '1', 'DWXZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_BGQK', 'B201100035', '变更情况 ', 'XASGAJ.ZA_BAGS', 'BAGS_BGQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BAGS_BZ', 'B201100035', '备注', 'XASGAJ.ZA_BAGS', 'BAGS_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_ZYGZQK', 'B201100024', '主要工作情况', 'XASGAJ.ZA_BARY t', 't.BARY_ZYGZQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_RYXZ', 'B201100024', '人员性质', 'XASGAJ.ZA_BARY t', 't.BARY_RYXZ', 'CHAR', '1', 'BARYXZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_DWDZ', 'B201100024', '派驻单位地址', 'XASGAJ.ZA_BARY t', 't.BARY_DWDZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_JLX', 'B201100024', '派驻单位街路巷', 'XASGAJ.ZA_BARY t', 't.BARY_JLX', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_SSXQ', 'B201100024', '派驻单位省市县区', 'XASGAJ.ZA_BARY t', 't.BARY_SSXQ', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_PZDW', 'B201100024', '派驻单位', 'XASGAJ.ZA_BARY t', 't.BARY_PZDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_PZGW', 'B201100024', '派驻岗位', 'XASGAJ.ZA_BARY t', 't.BARY_PZGW', 'CHAR', '1', 'PZGW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_HCPX', 'B201100024', '在何处培训', 'XASGAJ.ZA_BARY t', 't.BARY_HCPX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_HSPX', 'B201100024', '在何时培训', 'XASGAJ.ZA_BARY t', 't.BARY_HSPX', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_GJZC', 'B201100024', '国家职业标准职称', 'XASGAJ.ZA_BARY t', 't.BARY_GJZC', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_XHPBH', 'B201100024', '胸号牌编号', 'XASGAJ.ZA_BARY t', 't.BARY_XHPBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_SGZBH', 'B201100024', '上岗证编号', 'XASGAJ.ZA_BARY t', 't.BARY_SGZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_ZGZBH', 'B201100024', '资格证编号', 'XASGAJ.ZA_BARY t', 't.BARY_ZGZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_CZPX', 'B201100024', '人员持证培训', 'XASGAJ.ZA_BARY t', 't.BARY_CZPX', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZZBH', 'B201100024', '住址编号', 'XASGAJ.ZA_BARY t', 't.ZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYBH', 'B201100024', '人员编号', 'XASGAJ.ZA_BARY t', 't.BARY_RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_GSBH', 'B201100024', '公司编号', 'XASGAJ.ZA_BARY t', 't.BARY_GSBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARY_BH', 'B201100024', '人员编号', 'XASGAJ.ZA_BARY t', 't.BARY_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XZZ', 'B201100024', '现住址', 'XASGAJ.ZA_BARY t', 't.XZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XB', 'B201100024', '性       别', 'XASGAJ.RY_JBXX d', 'd.XB', 'CHAR', '1', 'XB', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XM', 'B201100024', '姓       名', 'XASGAJ.RY_JBXX d', 'd.XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GMSFHM', 'B201100024', '身份证号', 'XASGAJ.RY_JBXX d', 'd.GMSFHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CSRQ', 'B201100024', '出生日期', 'XASGAJ.RY_JBXX d', 'd.CSRQ', 'CHAR_DATE', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_BH', 'B201100037', '内保编号', 'XASGAJ.ZA_NBDW t', 't.NBDW_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('JGBH', 'B201100037', '内保机构编号', 'XASGAJ.ZA_NBDW t', 't.NBDW_JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_DWXZ', 'B201100037', '单位性质', 'XASGAJ.ZA_NBDW t', 't.NBDW_DWXZ', 'CHAR', '1', 'NBJGXZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_DWLLR', 'B201100037', '单位联络人', 'XASGAJ.ZA_NBDW t', 't.NBDW_DWLLR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_JFQK', 'B201100037', '技防情况', 'XASGAJ.ZA_NBDW t', 't.NBDW_JFQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_ZDGAJG', 'B201100037', '驻地公安机关', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZDGAJG', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_WWXX', 'B201100037', '维稳信息', 'XASGAJ.ZA_NBDW t', 't.NBDW_WWXX', 'CHAR', '1', 'WWXX', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_GLBM', 'B201100037', '管理部门', 'XASGAJ.ZA_NBDW t', 't.NBDW_GLBM', 'CHAR', '1', 'NBGLBM', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_BWJGSZ', 'B201100037', '保卫机构设置', 'XASGAJ.ZA_NBDW t', 't.NBDW_BWJGSZ', 'CHAR', '1', 'BWJGSZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_SCJYZK', 'B201100037', '生产经营状况', 'XASGAJ.ZA_NBDW t', 't.NBDW_SCJYZK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_ZYBWS', 'B201100037', '重要部位级别', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZYBWS', 'CHAR', '1', 'ZYBWJB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_YHBWS', 'B201100037', '要害部位数', 'XASGAJ.ZA_NBDW t', 't.NBDW_YHBWS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_ZDDJ', 'B201100037', '重点等级', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZDDJ', 'CHAR', '1', 'ZDDJ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_PDYJ', 'B201100037', '判定依据', 'XASGAJ.ZA_NBDW t', 't.NBDW_PDYJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_NLR', 'B201100037', '年利润', 'XASGAJ.ZA_NBDW t', 't.NBDW_NLR', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_NXSE', 'B201100037', '年销售额', 'XASGAJ.ZA_NBDW t', 't.NBDW_NXSE', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_ZGZGS', 'B201100037', '在岗职工数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZGZGS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_XGZGS', 'B201100037', '下岗职工数', 'XASGAJ.ZA_NBDW t', 't.NBDW_XGZGS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_WYGS', 'B201100037', '外用工数', 'XASGAJ.ZA_NBDW t', 't.NBDW_WYGS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_WJSSYGS', 'B201100037', '外籍师生员工数', 'XASGAJ.ZA_NBDW t', 't.NBDW_WJSSYGS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_ZGXSRS', 'B201100037', '职工学生人数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZGXSRS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_GATSSYGS', 'B201100037', '港澳台师生员工数', 'XASGAJ.ZA_NBDW t', 't.NBDW_GATSSYGS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_JCSSMZSSYGS', 'B201100037', '疆藏少数民族师生员工数', 'XASGAJ.ZA_NBDW t', 't.NBDW_JCSSMZSSYGS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_BWZZLB', 'B201100037', '保卫组织类别', 'XASGAJ.ZA_NBDW t', 't.NBDW_BWZZLB', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_BWBMFZR', 'B201100037', '保卫部门负责人', 'XASGAJ.ZA_NBDW t', 't.NBDW_BWBMFZR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_ZZBWGBS', 'B201100037', '专职保卫干部数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZZBWGBS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_JZBWGBS', 'B201100037', '兼职保卫干部数', 'XASGAJ.ZA_NBDW t', 't.NBDW_JZBWGBS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_JJS', 'B201100037', '经警数', 'XASGAJ.ZA_NBDW t', 't.NBDW_JJS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_BAS', 'B201100037', '保安数', 'XASGAJ.ZA_NBDW t', 't.NBDW_BAS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_HWLL', 'B201100037', '护卫力量', 'XASGAJ.ZA_NBDW t', 't.NBDW_HWLL', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_HWQS', 'B201100037', '护卫犬数', 'XASGAJ.ZA_NBDW t', 't.NBDW_HWQS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_QDZAZRSSJ', 'B201100037', '签订治安责任书日期', 'XASGAJ.ZA_NBDW t', 't.NBDW_QDZAZRSSJ', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_YWYJZB', 'B201100037', '有无夜间值班', 'XASGAJ.ZA_NBDW t', 't.NBDW_YWYJZB', 'CHAR', '1', 'YW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_ZBDTS', 'B201100037', '装备电台数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZBDTS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_ZBJGS', 'B201100037', '装备警棍数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZBJGS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_ZBMTCS', 'B201100037', '装备摩托车数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZBMTCS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NBDW_ZBQCS', 'B201100037', '装备汽车数', 'XASGAJ.ZA_NBDW t', 't.NBDW_ZBQCS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRSFZH', 'B201100037', '法人身份证号', 'XASGAJ.JG_JBXX j', 'j.FRSFZHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRZZ', 'B201100037', '法人住址', 'XASGAJ.JG_JBXX j', 'j.FRZZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LXDH', 'B201100037', '联系电话', 'XASGAJ.JG_JBXX j', 'j.DWDH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FRDB', 'B201100037', '法人代表', 'XASGAJ.JG_JBXX j', 'j.FRDB', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DWMC', 'B201100037', '单位名称', 'XASGAJ.JG_JBXX j', 'j.DWMC', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YYCSDM', 'B201100025', '单位代码', 'XASGAJ.JG_WBSWRYXX t', 't.YYCSDM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YYCSMC', 'B201100025', '网吧名称', 'XASGAJ.JG_WBSWRYXX t', 't.YYCSMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DZQH', 'B201100025', '地址区划', 'XASGAJ.JG_WBSWRYXX t', 't.DZQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DZ', 'B201100025', '人员地址', 'XASGAJ.JG_WBSWRYXX t', 't.DZ', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWRYXM', 'B201100025', '姓名', 'XASGAJ.JG_WBSWRYXX t', 't.SWRYXM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZJLX', 'B201100025', '证件类型', 'XASGAJ.JG_WBSWRYXX t', 't.ZJLX', 'VARCHAR', '1', 'LKZJLX', 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZJHM', 'B201100025', '证件号码', 'XASGAJ.JG_WBSWRYXX t', 't.ZJHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('FZJGMC', 'B201100025', '发证机构名称', 'XASGAJ.JG_WBSWRYXX t', 't.FZJGMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWKSSJ', 'B201100025', '上网开始时间', 'XASGAJ.JG_WBSWRYXX t', 't.SWKSSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XWSJ', 'B201100025', '下网时间', 'XASGAJ.JG_WBSWRYXX t', 't.XWSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SWZDH', 'B201100025', '上网座位号', 'XASGAJ.JG_WBSWRYXX t', 't.SWZDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DWMC', 'B201100025', '单位名称', 'XASGAJ.JG_WBXX d', 'd.YYCSMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJBH', 'B201100029', '案件编号', 'XASGAJ.AJ_JBXX', 'AJBH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARXM', 'B201100029', '报案人姓名', 'XASGAJ.AJ_JBXX', 'BARXM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARXB', 'B201100029', '报案人性别', 'XASGAJ.AJ_JBXX', 'BARXB', 'CHAR', '1', 'XB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARCSRQ', 'B201100029', '报案人出生日期', 'XASGAJ.AJ_JBXX', 'BARCSRQ', 'CHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARZJZL', 'B201100029', '报案人证件种类', 'XASGAJ.AJ_JBXX', 'BARZJZL', 'CHAR', '1', 'ZJZL', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARZJHM', 'B201100029', '报案人证件号码', 'XASGAJ.AJ_JBXX', 'BARZJHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARDW', 'B201100029', '报案人单位', 'XASGAJ.AJ_JBXX', 'BARDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARLXFS', 'B201100029', '报案人联系方式', 'XASGAJ.AJ_JBXX', 'BARLXFS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARZZ', 'B201100029', '报案人住址', 'XASGAJ.AJ_JBXX', 'BARZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARBMJB', 'B201100029', '报案人保密级别', 'XASGAJ.AJ_JBXX', 'BARBMJB', 'CHAR', '1', 'BMJB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJZT', 'B201100029', '案件状态', 'XASGAJ.AJ_JBXX', 'AJZT', 'CHAR', '1', 'AJZT', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJMC', 'B201100029', '案件名称', 'XASGAJ.AJ_JBXX', 'AJMC', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('MJ', 'B201100029', '案件密级', 'XASGAJ.AJ_JBXX', 'MJ', 'CHAR', '1', 'MJ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJLB', 'B201100029', '案件类别', 'XASGAJ.AJ_JBXX', 'AJLB', 'CHAR', '1', 'AJLB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJWAB', 'B201100029', '案件副案别', 'XASGAJ.AJ_JBXX', 'AJWAB', 'CHAR', '1', 'FAB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJXZ', 'B201100029', '案件性质', 'XASGAJ.AJ_JBXX', 'AJXZ', 'CHAR', '1', 'AJXZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJSX', 'B201100029', '案件属性', 'XASGAJ.AJ_JBXX', 'AJSX', 'CHAR', '1', 'AJSX', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJLY', 'B201100029', '案件来源', 'XASGAJ.AJ_JBXX', 'AJLY', 'CHAR', '1', 'AJLY', null);
commit;
prompt 600 records committed...
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BASJ', 'B201100029', '报案时间', 'XASGAJ.AJ_JBXX', 'BASJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_XXBH', 'B201100041', '信息编号', 'XASGAJ.ZA_PCRYXX', 'RYPC_XXBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_BH', 'B201100041', '盘查编号', 'XASGAJ.ZA_PCRYXX', 'RYPC_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_RYBH', 'B201100041', '人员编号', 'XASGAJ.ZA_PCRYXX', 'RYPC_RYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_XM', 'B201100041', '姓名', 'XASGAJ.ZA_PCRYXX', 'RYPC_XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XB', 'B201100041', '性别', 'XASGAJ.ZA_PCRYXX', 'RYPC_XB', 'CHAR', '1', 'XB', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_MZ', 'B201100041', '民族', 'XASGAJ.ZA_PCRYXX', 'RYPC_MZ', 'CHAR', '1', 'MZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_CSRQ', 'B201100041', '出生日期', 'XASGAJ.ZA_PCRYXX', 'RYPC_CSRQ', 'CHAR_DATE', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_GMSFHM', 'B201100041', '身份证号', 'XASGAJ.ZA_PCRYXX', 'RYPC_GMSFHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_ZJZL', 'B201100041', '证件种类', 'XASGAJ.ZA_PCRYXX', 'RYPC_ZJZL', 'CHAR', '1', 'ZJZL', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_ZJHM', 'B201100041', '证件号码', 'XASGAJ.ZA_PCRYXX', 'RYPC_ZJHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_JSZH', 'B201100041', '驾驶证号', 'XASGAJ.ZA_PCRYXX', 'RYPC_JSZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_XZZ', 'B201100041', '现住址', 'XASGAJ.ZA_PCRYXX', 'RYPC_XZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_JGBH', 'B201100020', '关联机构编号', 'XASGAJ.JG_CYRY  t', 't.CYRY_JGBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_ZZBH', 'B201100020', '住址编号', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZZBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_XZZ', 'B201100020', '现住址', 'XASGAJ.JG_CYRY  t', 't.CYRY_XZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_SX', 'B201100020', '人员属性', 'XASGAJ.JG_CYRY  t', 't.CYRY_SX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_BMMC', 'B201100020', '部门名称', 'XASGAJ.JG_CYRY  t', 't.CYRY_BMMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_ZW', 'B201100020', '人员职务', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZW', 'VARCHAR', '1', 'ZW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_YM', 'B201100020', '人员艺名', 'XASGAJ.JG_CYRY  t', 't.CYRY_YM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_SJ', 'B201100020', '人员手机', 'XASGAJ.JG_CYRY  t', 't.CYRY_SJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_QTLXDH', 'B201100020', '其他联系电话', 'XASGAJ.JG_CYRY  t', 't.CYRY_QTLXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_RYLB', 'B201100041', '人员类别', 'XASGAJ.ZA_PCRYXX', 'RYPC_RYLB', 'CHAR', '1', 'RYLB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_XXBH', 'B201100027', '车信息编号', 'XASGAJ.ZA_PCRYXX', 'CLPC_XXBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_CLJG', 'B201100041', '处理结果', 'XASGAJ.ZA_PCRYXX', 'RYPC_CLJG', 'CHAR', '1', 'CLJG', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_CPH', 'B201100027', '车牌号', 'XASGAJ.ZA_PCCLXX', 'CLPC_CPH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_CJH', 'B201100027', '车辆车架号', 'XASGAJ.ZA_PCCLXX', 'CLPC_CJH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_FDJH', 'B201100027', '发动机号', 'XASGAJ.ZA_PCCLXX', 'CLPC_FDJH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_XSZH', 'B201100027', '行驶证号', 'XASGAJ.ZA_PCCLXX', 'CLPC_XSZH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_CLLX', 'B201100027', '车辆类型', 'XASGAJ.ZA_PCCLXX', 'CLPC_CLLX', 'CHAR', '1', 'CLLX', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_CLYS', 'B201100027', '车辆颜色', 'XASGAJ.ZA_PCCLXX', 'CLPC_CLYS', 'CHAR', '1', 'CLYS', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_CLPP', 'B201100027', '车辆品牌', 'XASGAJ.ZA_PCCLXX', 'CLPC_CLPP', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_TBBS', 'B201100027', '图标标识', 'XASGAJ.ZA_PCCLXX', 'CLPC_TBBS', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_CZRS', 'B201100027', '车载人数', 'XASGAJ.ZA_PCCLXX', 'CLPC_CZRS', 'NUMBER', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_CLJG', 'B201100027', '处理结果', 'XASGAJ.ZA_PCCLXX', 'CLPC_CLJG', 'CHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CLPC_BZ', 'B201100027', '车辆备注', 'XASGAJ.ZA_PCCLXX', 'CLPC_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYPC_BZ', 'B201100041', '备注', 'XASGAJ.ZA_PCRYXX', 'RYPC_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJBH', 'B201100030', '案件编号', 'XASGAJ.AJ_JBXX', 'AJBH', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARXM', 'B201100030', '报案人姓名', 'XASGAJ.AJ_JBXX', 'BARXM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARXB', 'B201100030', '报案人性别', 'XASGAJ.AJ_JBXX', 'BARXB', 'CHAR', '1', 'XB', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARCSRQ', 'B201100030', '报案人出生日期', 'XASGAJ.AJ_JBXX', 'BARCSRQ', 'CHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARZJZL', 'B201100030', '报案人证件种类', 'XASGAJ.AJ_JBXX', 'BARZJZL', 'CHAR', '1', 'ZJZL', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARZJHM', 'B201100030', '报案人证件号码', 'XASGAJ.AJ_JBXX', 'BARZJHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARDW', 'B201100030', '报案人单位', 'XASGAJ.AJ_JBXX', 'BARDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARLXFS', 'B201100030', '报案人联系方式', 'XASGAJ.AJ_JBXX', 'BARLXFS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARZZ', 'B201100030', '报案人住址', 'XASGAJ.AJ_JBXX', 'BARZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BARBMJB', 'B201100030', '报案人保密级别', 'XASGAJ.AJ_JBXX', 'BARBMJB', 'CHAR', '1', 'BMJB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJZT', 'B201100030', '案件状态', 'XASGAJ.AJ_JBXX', 'AJZT', 'CHAR', '1', 'AJZT', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJMC', 'B201100030', '案件名称', 'XASGAJ.AJ_JBXX', 'AJMC', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('MJ', 'B201100030', '案件密级', 'XASGAJ.AJ_JBXX', 'MJ', 'CHAR', '1', 'MJ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJLB', 'B201100030', '案件类别', 'XASGAJ.AJ_JBXX', 'AJLB', 'CHAR', '1', 'AJLB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJWAB', 'B201100030', '案件副案别', 'XASGAJ.AJ_JBXX', 'AJWAB', 'CHAR', '1', 'FAB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJXZ', 'B201100030', '案件性质', 'XASGAJ.AJ_JBXX', 'AJXZ', 'CHAR', '1', 'AJXZ', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJSX', 'B201100030', '案件属性', 'XASGAJ.AJ_JBXX', 'AJSX', 'CHAR', '1', 'AJSX', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJLY', 'B201100030', '案件来源', 'XASGAJ.AJ_JBXX', 'AJLY', 'CHAR', '1', 'AJLY', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('BASJ', 'B201100030', '报案时间', 'XASGAJ.AJ_JBXX', 'BASJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZTRYBH', 'B201100022', '人员编号', 'XASGAJ.ZTRYXX', 'ZTRYBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZTXM', 'B201100022', '姓名', 'XASGAJ.ZTRYXX', 'ZTXM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZTXB', 'B201100022', '性别', 'XASGAJ.ZTRYXX', 'ZTXB', 'VARCHAR', '1', 'XB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZTCSRQ', 'B201100022', '出生日期', 'XASGAJ.ZTRYXX', 'ZTCSRQ', 'CHAR_DATE', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SFZHSB', 'B201100022', '身份证号', 'XASGAJ.ZTRYXX', 'SFZHSB', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('HJDQH', 'B201100022', '户籍地区号', 'XASGAJ.ZTRYXX', 'HJDQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('HJDXZ', 'B201100022', '户籍地详址', 'XASGAJ.ZTRYXX', 'HJDXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZTJYAQ', 'B201100022', '简要案情', 'XASGAJ.ZTRYXX', 'ZTJYAQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LADQ', 'B201100022', '立案地区', 'XASGAJ.ZTRYXX', 'LADQ', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LADW', 'B201100022', '立案单位', 'XASGAJ.ZTRYXX', 'LADW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZTXZQX', 'B201100022', '籍贯', 'XASGAJ.ZTRYXX', 'ZTXZQX', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZTXZXZ', 'B201100022', '籍贯详址', 'XASGAJ.ZTRYXX', 'ZTXZXZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZTZC', 'B201100022', '专长', 'XASGAJ.ZTRYXX', 'ZTZC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZTJYJL', 'B201100022', '简要经历', 'XASGAJ.ZTRYXX', 'ZTJYJL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZTRQ', 'B201100022', '在逃日期', 'XASGAJ.ZTRYXX', 'ZTRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('DBJB', 'B201100022', '督捕级别', 'XASGAJ.ZTRYXX', 'DBJB', 'VARCHAR', '1', 'DBJB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('AJLB', 'B201100022', '案件类别', 'XASGAJ.ZTRYXX', 'AJLB', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_BH', 'B201100020', '从业人员编号', 'XASGAJ.JG_CYRY  t', 't.CYRY_BH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RAS', 'B201100020', '提取标识', 'XASGAJ.JG_CYRY  t', 't.RAS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_ZSQK', 'B201100020', '政审情况', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZSQK', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_PCSYJ', 'B201100020', '派出所意见', 'XASGAJ.JG_CYRY  t', 't.CYRY_PCSYJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_PXZH', 'B201100020', '培训证号', 'XASGAJ.JG_CYRY  t', 't.CYRY_PXZH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_PXZS', 'B201100020', '培训证书', 'XASGAJ.JG_CYRY  t', 't.CYRY_PXZS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_ZXYY', 'B201100020', '注销原因', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZXYY', 'VARCHAR', '1', 'ZXYY', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_ZXBS', 'B201100020', '注销标识', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZXBS', 'VARCHAR', '1', 'ZXBS', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_ZXRQ', 'B201100020', '注销日期', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZXRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_ZDFWDXLB', 'B201100020', '重点服务对象类别', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZDFWDXLB', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_BWCS', 'B201100020', '重点服务对象保卫措施', 'XASGAJ.JG_CYRY  t', 't.CYRY_BWCS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_ZYGX', 'B201100020', '重点服务对象主要贡献', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZYGX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_ZDRTLB', 'B201100020', '重点人头类别', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZDRTLB', 'VARCHAR', '1', 'ZDRTLB', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_KZCS', 'B201100020', '重点人头控制措施', 'XASGAJ.JG_CYRY  t', 't.CYRY_KZCS', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_ZYWT', 'B201100020', '重点人头主要问题', 'XASGAJ.JG_CYRY  t', 't.CYRY_ZYWT', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_BZ', 'B201100020', '备注', 'XASGAJ.JG_CYRY  t', 't.CYRY_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_DJRQ', 'B201100020', '登记日期', 'XASGAJ.JG_CYRY  t', 't.CYRY_DJRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_SHYX', 'B201100020', '状态是否有效', 'XASGAJ.JG_CYRY  t', 't.CYRY_SHYX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CYRY_SHXJ', 'B201100020', '状态是否新建', 'XASGAJ.JG_CYRY  t', 't.CYRY_SHXJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GMSFHM', 'B201100020', '身份号码 ', 'XASGAJ.RY_JBXX  c', 'c.GMSFHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XM', 'B201100020', '姓名', 'XASGAJ.RY_JBXX  c', 'c.XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XB', 'B201100020', '性别', 'XASGAJ.RY_JBXX  c', 'c.XB', 'VARCHAR', '1', 'XB', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NLD', 'B201100020', '年龄段', 'XASGAJ.RY_JBXX  c', 'c.CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CSRQ', 'B201100020', '出生日期', 'XASGAJ.RY_JBXX  c', 'c.CSRQ', 'CHAR_DATE', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('GMSFHM', 'B201100019', '身份号码 ', 'XASGAJ.RY_JBXX  c', 'c.GMSFHM', 'VARCHAR', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XM', 'B201100019', '姓名', 'XASGAJ.RY_JBXX  c', 'c.XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XB', 'B201100019', '性别', 'XASGAJ.RY_JBXX  c', 'c.XB', 'VARCHAR', '1', 'XB', '=');
commit;
prompt 700 records committed...
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('NLD', 'B201100019', '年龄段', 'XASGAJ.RY_JBXX  c', 'c.CSRQ', 'CHAR_DATE', null, null, 'num_between');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CSRQ', 'B201100019', '出生日期', 'XASGAJ.RY_JBXX  c', 'c.CSRQ', 'CHAR_DATE', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZBR', 'B201100029', '主办人', 'XASGAJ.AJ_JBXX', 'ZBR', 'CHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SLR', 'B201100029', '受理人', 'XASGAJ.AJ_JBXX', 'SLR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SLDW', 'B201100029', '受理单位', 'XASGAJ.AJ_JBXX', 'SLDW', 'CHAR', '1', 'DW', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('PADW', 'B201100029', '破案单位', 'XASGAJ.AJ_JBXX', 'PADW', 'CHAR', '1', 'DW', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LADW', 'B201100029', '立案单位', 'XASGAJ.AJ_JBXX', 'LADW', 'CHAR', '1', 'DW', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XBR', 'B201100029', '协办人', 'XASGAJ.AJ_JBXX', 'XBR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZBDW', 'B201100029', '主办单位', 'XASGAJ.AJ_JBXX', 'ZBDW', 'CHAR', '1', 'DW', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('PADW', 'B201100030', '破案单位', 'XASGAJ.AJ_JBXX', 'PADW', 'CHAR', '1', 'DW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LADW', 'B201100030', '立案单位', 'XASGAJ.AJ_JBXX', 'LADW', 'CHAR', '1', 'DW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XBR', 'B201100030', '协办人', 'XASGAJ.AJ_JBXX', 'XBR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZBDW', 'B201100030', '主办单位', 'XASGAJ.AJ_JBXX', 'ZBDW', 'CHAR', '1', 'DW', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('ZBR', 'B201100030', '主办人', 'XASGAJ.AJ_JBXX', 'ZBR', 'CHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SLR', 'B201100030', '受理人', 'XASGAJ.AJ_JBXX', 'SLR', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('SLDW', 'B201100030', '受理单位', 'XASGAJ.AJ_JBXX', 'SLDW', 'CHAR', '1', 'DW', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_ZSBH', 'B201100021', '住宿编号', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZSBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('RYBH', 'B201100021', '人员编号', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_RYGLBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_ZZGLBH', 'B201100021', '住址编号', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZZGLBH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_DDRQ', 'B201100021', '抵达日期', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_DDRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_LKRQ', 'B201100021', '离开日期', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LKRQ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_RYSF', 'B201100021', '人员身份', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_RYSF', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_LXDH', 'B201100021', '联系电话', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_HCLGL', 'B201100021', '何处来国内', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_HCLGL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_HCQGL', 'B201100021', '何处去国内', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_HCQGL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_HCLGW', 'B201100021', '何处来国外', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_HCLGW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_HCQGW', 'B201100021', '何处去国外', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_HCQGW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_ZSDW', 'B201100021', '住宿单位代码', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZSDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_FH', 'B201100021', '住宿房号', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_FH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_DJDWXZQH', 'B201100021', '登记单位行政区划', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_DJDWXZQH', 'VARCHAR', '1', 'XZQH', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_DJDWDM', 'B201100021', '住宿登记单位代码', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_DJDWDM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_DJDWMC', 'B201100021', '住宿登记单位名称', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_DJDWMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_ZXSJ', 'B201100021', '注销时间', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZXSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_ZXYY', 'B201100021', '注销原因', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZXYY', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_BZ', 'B201100021', '备注', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_BZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_LZSHGW', 'B201100021', '何处去的地区是否国外', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LZSHGW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_LZSHGL', 'B201100021', '何处来的地区是否国外', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LZSHGL', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_LSZSXZZ', 'B201100021', '住宿详细住址', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LSZSXZZ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_JDDW', 'B201100021', '接待单位l.人', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_JDDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_LSDWDH', 'B201100021', '留宿单位电话', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LSDWDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_LSDW', 'B201100021', '留宿单位l.户主', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_LSDW', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_QQGX', 'B201100021', '亲属关系代码', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_QQGX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_SHZSBG', 'B201100021', '是否住宿宾馆', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_SHZSBG', 'VARCHAR', '1', 'SFZBG', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_DJDWLX', 'B201100021', '登记单位类型', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_DJDWLX', 'VARCHAR', '1', 'DJDWLX', null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_ZHGZDM', 'B201100021', '在华工作机构代码', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZHGZDM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_ZHGZMC', 'B201100021', '在华工作机构名称', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZHGZMC', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_ZFLX', 'B201100021', '住房类型', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_ZFLX', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_FZGMSFHM', 'B201100021', '房主身份证号码', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_FZGMSFHM', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_FZDH', 'B201100021', '房主电话', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_FZDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_JJLXR', 'B201100021', '紧急情况下联系人', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_JJLXR', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_JJLXDH', 'B201100021', '紧急情况下联系电话', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_JJLXDH', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('LSZS_DJSJ', 'B201100021', '登记时间', 'XASGAJ.RY_JWLSZS  l', 'l.LSZS_DJSJ', 'VARCHAR', null, null, null);
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XM', 'B201100021', '中文姓名', 'XASGAJ.RY_JBXX  c', 'c.XM', 'VARCHAR', null, null, 'like');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('XB', 'B201100021', '性别', 'XASGAJ.RY_JBXX  c', 'c.XB', 'VARCHAR', '1', 'XB', '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('CSRQ', 'B201100021', '出生日期', 'XASGAJ.RY_JBXX  c', 'c.CSRQ', 'CHAR_DATE', null, null, '=');
insert into COLUMN_MAP (columns, b_id, cname, table_name, c_column, cname_type, is_res, res_id, op)
values ('YWX', 'B201100021', '英文姓', 'XASGAJ.RY_JBXX  c', 'c.YWX', 'VARCHAR', null, null, 'like');
commit;
prompt 756 records loaded
prompt Loading IMG_INFO...
insert into IMG_INFO (img_name, img_path, img_des)
values ('Windows XP', '/uploadfile/image/Windows XP.jpg', '54444');
insert into IMG_INFO (img_name, img_path, img_des)
values ('460', '/uploadfile/image/460.jpg', '11');
insert into IMG_INFO (img_name, img_path, img_des)
values ('a', '/uploadfile/image/a.png', '保存保存');
insert into IMG_INFO (img_name, img_path, img_des)
values ('Windows X2P', '/uploadfile/image/Windows X2P.jpg', '2121');
insert into IMG_INFO (img_name, img_path, img_des)
values ('abc_中文', '/uploadfile/image/abc_中文.png', '111');
insert into IMG_INFO (img_name, img_path, img_des)
values ('111111111111', '/uploadfile/image/111111111111.png', '测试lemon');
insert into IMG_INFO (img_name, img_path, img_des)
values ('ar', '/uploadfile/image/ar.png', 'ar');
insert into IMG_INFO (img_name, img_path, img_des)
values ('font_1', '/uploadfile/image/font_1.png', '用户名');
insert into IMG_INFO (img_name, img_path, img_des)
values ('bags', '/uploadfile/image/bags.png', '小屋子');
insert into IMG_INFO (img_name, img_path, img_des)
values ('nbdw', '/uploadfile/image/nbdw.png', '楼房');
insert into IMG_INFO (img_name, img_path, img_des)
values ('arrow', '/uploadfile/image/arrow.png', '大于');
insert into IMG_INFO (img_name, img_path, img_des)
values ('bottom_switcher_collapsed.9', '/uploadfile/image/bottom_switcher_collapsed.9.png', '7');
insert into IMG_INFO (img_name, img_path, img_des)
values ('ztry', '/uploadfile/image/ztry.png', '8');
insert into IMG_INFO (img_name, img_path, img_des)
values ('wbxx', '/uploadfile/image/wbxx.png', '小图片');
insert into IMG_INFO (img_name, img_path, img_des)
values ('photo_takephoto_1', '/uploadfile/image/photo_takephoto_1.png', 'photo');
insert into IMG_INFO (img_name, img_path, img_des)
values ('zhcx', '/uploadfile/image/zhcx.png', '资料交换');
commit;
prompt 16 records loaded
prompt Loading JW_ADDRESS...
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (6, 'coco', 1, '18094568529', '029-6859487', '029-6859487', '无', '局长', 1, '18094568529', '029-6859487', 'XX派出所', 'aa@126.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (37, '张126dddd', 4, '192XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 4, '161XXXXXXXX', '13-XXXXXXXX', 'XX派出所', 'XX@129.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (27, '1234567890', 123, '13625359458', '28654465', '68456645', '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890', '交警', 1, '13226589756', '56864564', '机构', 'cc@tt.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (39, '张128dddd', 6, '194XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 6, '163XXXXXXXX', '15-XXXXXXXX', 'XX派出所', 'XX@131.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (25, '张三xoxo', 1, '189XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 1, '158XXXXXXXX', '010-XXXXXXXX', 'XX派出所', 'XX@126.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (30, 'eee', 122, '13333333333', '22222222', '22222222', ' ', '1', 1, '13333333333', '22222222', '1', 'weew@so.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (31, '张三1111', 1, '189XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 1, '158XXXXXXXX', '010-XXXXXXXX', 'XX派出所', 'XX@126.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (35, '张124dddd', 2, '190XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 2, '159XXXXXXXX', '11-XXXXXXXX', 'XX派出所', 'XX@127.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (40, '张129dddd', 7, '195XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 7, '164XXXXXXXX', '16-XXXXXXXX', 'XX派出所', 'XX@132.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (21, '张三1', 1, '13256975845', '010-58612336', '010-58612336', '无', '科长', 1, '13256975845', '010-58612336', 'XX派出所', 'XX@ee.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (24, '4', 1, '189XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '?T', '??3¤', 1, '158XXXXXXXX', '010-XXXXXXXX', 'XX?é3??ù', 'XX@126.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (22, '5', 1, '189XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '?T', '??3¤', 1, '158XXXXXXXX', '010-XXXXXXXX', 'XX?é3??ù', 'XX@126.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (4, '10', 1, '189XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '?T', '??3¤', 1, '158XXXXXXXX', '010-XXXXXXXX', 'XX?é3??ù', 'XX@126.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (20, '张三', 1, '189XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 1, '158XXXXXXXX', '010-XXXXXXXX', 'XX派出所', 'XX@126.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (32, '张123', 1, '189XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 1, '158XXXXXXXX', '010-XXXXXXXX', 'XX派出所', 'XX@126.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (33, '张123dddd', 1, '189XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 1, '158XXXXXXXX', '010-XXXXXXXX', 'XX派出所', 'XX@126.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (36, '张125dddd', 3, '191XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 3, '160XXXXXXXX', '12-XXXXXXXX', 'XX派出所', 'XX@128.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (38, '张127dddd', 5, '193XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 5, '162XXXXXXXX', '14-XXXXXXXX', 'XX派出所', 'XX@130.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (51, '张140dddd', 18, '206XXXXXXXX', '010-XXXXXXX', '010-XXXXXXX', '无', '科长', 18, '175XXXXXXXX', '27-XXXXXXXX', 'XX派出所', 'XX@143.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (28, '12', 333, '13333333333', '12121212', '12121212', ' ', null, 2, '13333333333', '12121212', null, '12@so.com');
insert into JW_ADDRESS (addid, name, deptid, mobile, unittel, hometel, remark, duty, sort, mobile2, unittel2, deptnames, email)
values (29, '121', 1212, '13333333333', '12121212', '12121212', ' ', '23', 1, '13333333333', '12121212', null, 'dda@asa.com');
commit;
prompt 21 records loaded
prompt Loading JW_FILE_INFO...
insert into JW_FILE_INFO (filename, username, uploaddate)
values ('video_316126763250.3gp', null, to_date('13-10-2011 13:58:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into JW_FILE_INFO (filename, username, uploaddate)
values ('123.bmp', '456', to_date('13-10-2011', 'dd-mm-yyyy'));
insert into JW_FILE_INFO (filename, username, uploaddate)
values ('fileName', 'userName', to_date('13-10-2011 13:33:48', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 3 records loaded
prompt Loading JW_GPS_CONFIG...
insert into JW_GPS_CONFIG (userid, state, interval)
values ('e20cf99:1340d2eb33b:-8000', 0, 0);
insert into JW_GPS_CONFIG (userid, state, interval)
values ('48fe9eb5:132ebb4bb9b:-8000', 2, 111);
insert into JW_GPS_CONFIG (userid, state, interval)
values ('5591591f:133afef5f4b:-8000', 0, 999);
insert into JW_GPS_CONFIG (userid, state, interval)
values ('e20cf99:1340d2eb33b:-7ffe', 2, 10);
insert into JW_GPS_CONFIG (userid, state, interval)
values ('70d4d915:135654e6de2:-7ffd', 2, 20);
insert into JW_GPS_CONFIG (userid, state, interval)
values ('7734d31f:13415f82e4c:-8000', 2, 0);
insert into JW_GPS_CONFIG (userid, state, interval)
values ('e20cf99:1340d2eb33b:-7fff', 0, 30);
commit;
prompt 7 records loaded
prompt Loading JW_GPS_DATA...
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:39', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:39', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:49', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:49', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:22', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:22', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:38', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:38', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:06:52', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:06:52', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:11', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:11', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:35', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:35', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:54', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:54', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:08:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:08:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:04', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:04', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:45', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:45', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:43:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:43:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:53:05', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:53:05', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:01', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:01', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:17', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:17', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:44', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:44', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:48:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:48:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:03', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:03', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:08:12', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:08:12', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:13:39', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:13:39', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:13:51', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:13:51', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:10', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:10', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:39', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:39', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:43:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:43:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:40', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:40', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:46', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:46', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:59', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:59', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:53:11', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:53:11', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:39:31', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:39:31', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:48', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:48', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:02', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:02', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:34', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:34', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:45', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:45', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:43:30', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:43:30', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:44:52', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:44:52', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:35', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:35', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:40', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:40', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:51', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:51', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:02', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:02', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:48', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:48', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:12', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:12', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:28', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:28', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:55', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:55', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:48:05', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:48:05', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:49:58', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:49:58', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:17', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:17', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:23', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:23', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
commit;
prompt 100 records committed...
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:33', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:47:33', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:48:00', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:48:00', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:48:10', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:48:10', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:33', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:33', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:41:04', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:41:04', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:41:52', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:41:52', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:13', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:13', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:24', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:24', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:43:01', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:43:01', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:44:34', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:44:34', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:48:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:48:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:49:53', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:49:53', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:09', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:09', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:27', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:27', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:43', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:50:43', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:06:27', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:06:27', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:23', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:23', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:41', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:41', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:08:00', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:08:00', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:32', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:32', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:51', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:51', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:34', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:34', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:43', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:43', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:59', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:59', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:56', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:56', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:43:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:43:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:43:25', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:43:25', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:44:28', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:44:28', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:44:46', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:44:46', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:10', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:10', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:27', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:27', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:46', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:46', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:57', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:57', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:16', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:39:40', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:39:40', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:32', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:32', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:53', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:53', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:41:47', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:41:47', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:41:57', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:41:57', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:08', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:08', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:19', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:19', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:29', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:29', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:21', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:08', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:08', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:32', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:32', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:43', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:43', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
commit;
prompt 200 records committed...
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:06:33', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:06:33', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:06:59', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:06:59', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:29', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:29', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:48', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:48', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:13:45', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:13:45', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:13:57', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:13:57', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:52', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:52', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:06:39', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:06:39', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:06:46', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:06:46', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:05', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:07:05', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:25', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:14:25', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:43:05', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:43:05', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:43:11', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:43:11', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:43:27', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:43:27', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:28', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 10:52:28', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:39:47', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:39:47', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:26', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:26', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:37', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:40:37', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:41:10', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:41:10', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:40', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:40', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:50', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:42:50', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:43:20', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:43:20', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:43:36', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:43:36', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:44:39', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:44:39', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:01', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:45:01', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:27', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:27', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:37', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '-665bfc18:13575e15ce9:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('A1000020A12CE4', '0.0', '0.0', to_date('23-02-2012 16:46:37', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', '460030723824785', '2b70bf0:133336e2f58:-7ffe');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('a000002e379294', '0.0', '0.0', to_date('17-01-2012 15:33:55', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', null, '-3afc9a3c:132f0b3b93d:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('a000002e379294', '0.0', '0.0', to_date('17-01-2012 15:34:47', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '-3afc9a3c:132f0b3b93d:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('a000002e379294', '0.0', '0.0', to_date('17-01-2012 15:35:00', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '-3afc9a3c:132f0b3b93d:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('a000002e379294', '0.0', '0.0', to_date('17-01-2012 15:35:07', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '-3afc9a3c:132f0b3b93d:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('a000002e379294', '0.0', '0.0', to_date('17-01-2012 15:36:00', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '-3afc9a3c:132f0b3b93d:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('a000002e379294', '0.0', '0.0', to_date('17-01-2012 15:36:06', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '-3afc9a3c:132f0b3b93d:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('a000002e379294', '0.0', '0.0', to_date('17-01-2012 15:36:32', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '-3afc9a3c:132f0b3b93d:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('a000002e379294', '0.0', '0.0', to_date('17-01-2012 15:36:45', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '-3afc9a3c:132f0b3b93d:-8000');
insert into JW_GPS_DATA (deviceid, x, y, datetime, speed, direction, imsi, userid)
values ('a000002e379294', '0.0', '0.0', to_date('17-01-2012 15:37:17', 'dd-mm-yyyy hh24:mi:ss'), '0.0', '0.0', 'null', '-3afc9a3c:132f0b3b93d:-8000');
commit;
prompt 263 records loaded
prompt Loading JW_JZ...
insert into JW_JZ (id, name, description)
values ('4', '警长', '4');
insert into JW_JZ (id, name, description)
values ('1', '交警', '1');
insert into JW_JZ (id, name, description)
values ('2', '协警', '1');
insert into JW_JZ (id, name, description)
values ('3', '特警', '3');
commit;
prompt 4 records loaded
prompt Loading JW_LAW...
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (19, '123', '12', '22', '222', '22  ');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (20, '数据测试12数据测试', '数据测试12数据', '数据测试12数试12数据测试', '数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12数据测试12', '类型');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (4, '3', '2', '1', '1', '1   ');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (10, '8', '8', '8', '8', '8   ');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (14, '12', '12', '12', '12', '12  ');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (15, '10', '0123', '00', '0', '0   ');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (11, '9', '9', '9', '9', '9   ');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (8, '6', '6', '6', '6', '6   ');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (9, '7', '7', '7', '7', '7   ');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (5, '2', '2', '3', '1', '1   ');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (6, '4', '5', '6', '7', '8   ');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (7, '5', '5', '5', '5', '5   ');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (13, '11', '11', '11', '11', '11  ');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (16, '16', '交通规则', '礼让三先', '宁停3分，不争一秒,安全第一，珍惜生命，远离酒驾，尊重他人的人生，安全行驶。', '1   ');
insert into JW_LAW (law_id, law_code, law_name, administration, irregularityaction, law_type)
values (2, '1', '56423666', '01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', '16', '17  ');
commit;
prompt 15 records loaded
prompt Loading JW_LOG...
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7ff2', '3', 'B201100018', null, to_timestamp('20-02-2012 10:16:38.645000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-7ff7', '11', '0', null, to_timestamp('09-01-2012 09:44:21.516000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-7ffb', '88', '0', null, to_timestamp('09-01-2012 09:38:26.594000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-7ff8', '88', '0', null, to_timestamp('09-01-2012 09:43:50.563000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-488e4d4:134c0323a2c:-8000', '3', '0', null, to_timestamp('09-01-2012 10:00:46.001000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-88889c6:134cadb4912:-8000', '3', '0', null, to_timestamp('11-01-2012 11:41:39.390000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-7e6b6565:134e9503e8e:-7ffb', '3', '0', null, to_timestamp('17-01-2012 10:00:05.505000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6472b95f:13561131c1c:-7fff', '3', '0', null, to_timestamp('09-02-2012 16:28:38.007000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6472b95f:13561131c1c:-7ffd', '3', '0', null, to_timestamp('09-02-2012 17:18:40.898000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3246673c:1358543fe0c:-8000', '3', '0', null, to_timestamp('16-02-2012 16:25:33.333000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-1a02de6d:135a8ebceff:-8000', '3', '0', null, to_timestamp('23-02-2012 14:35:29.905000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-7e6b6565:134e9503e8e:-7ffe', '3', '0', null, to_timestamp('17-01-2012 09:50:56.895000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-7e6b6565:134e9503e8e:-7ffd', '3', '0', null, to_timestamp('17-01-2012 09:52:44.130000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3d35523c:134e921a0f6:-7fff', '222', '0', null, to_timestamp('17-01-2012 08:59:15.551000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3d35523c:134e921a0f6:-7ffd', '222', '0', null, to_timestamp('17-01-2012 09:01:44.661000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-7e6b6565:134e9503e8e:-7fff', '3', '0', null, to_timestamp('17-01-2012 09:47:05.051000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1e66852a:134b12085d4:-7ffc', '222', '0', null, to_timestamp('06-01-2012 14:10:01.126000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1e66852a:134b12085d4:-7ffa', '222', '0', null, to_timestamp('06-01-2012 14:27:19.173000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2811319a:1357ffeeae3:-7ffe', 'admin', 'B201100000', null, to_timestamp('15-02-2012 16:19:02.801000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6b11a5d8:135a7b9648d:-7fff', '1122334', '0', null, to_timestamp('23-02-2012 09:02:50.717000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-7ffc', '3', '0', null, to_timestamp('06-01-2012 13:18:20.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('18a22d2f:134c07682f2:-7ffe', '88', '0', null, to_timestamp('09-01-2012 11:16:43.735000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('11bfdc7f:134d0e920e6:-8000', '3', '0', null, to_timestamp('12-01-2012 15:54:23.546000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6e27d333:135a3a90c3e:-7ffd', '1122334', '0', null, to_timestamp('22-02-2012 14:30:57.577000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-4175093:134c59a72df:-7ffe', '3', 'B201100018', null, to_timestamp('10-01-2012 11:13:58.921000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2811319a:1357ffeeae3:-7fff', 'admin', 'B201100000', null, to_timestamp('15-02-2012 16:14:30.051000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3246673c:1358543fe0c:-7ffc', '3', 'B201100025', null, to_timestamp('16-02-2012 16:44:36.692000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3246673c:1358543fe0c:-7ffb', '3', 'B201100025', null, to_timestamp('16-02-2012 16:44:42.333000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-27c30d27:134c037b54f:-7ffd', '11', '0', null, to_timestamp('09-01-2012 10:08:37.016000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-27c30d27:134c037b54f:-7ffb', '88', '0', null, to_timestamp('09-01-2012 10:10:28.798000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-406e29cd:1355a6dff9d:-7fff', '3', '0', null, to_timestamp('08-02-2012 10:31:27.822000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fee', '77', '0', null, to_timestamp('24-02-2012 11:35:16.311000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3d35523c:134e921a0f6:-7ffe', '222', '0', null, to_timestamp('17-01-2012 08:59:44.176000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ff0', '77', '0', null, to_timestamp('24-02-2012 11:08:18.139000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fe7', '77', '0', null, to_timestamp('24-02-2012 13:30:01.733000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fe5', '77', '0', null, to_timestamp('24-02-2012 13:51:11.389000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fe3', '77', '0', null, to_timestamp('24-02-2012 13:56:13.295000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fe2', '77', '0', null, to_timestamp('24-02-2012 14:01:01.373000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fe1', '77', '0', null, to_timestamp('24-02-2012 14:15:05.170000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('40800e93:135996fb1c3:-8000', '3', '0', null, to_timestamp('20-02-2012 14:25:44.442000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2ba8fabd:134d4b35db2:-7ff4', '3', '0', null, to_timestamp('13-01-2012 16:58:10.240000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2ba8fabd:134d4b35db2:-7ffe', '3', '0', null, to_timestamp('13-01-2012 09:47:16.365000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2ba8fabd:134d4b35db2:-7ffd', '3', '0', null, to_timestamp('13-01-2012 10:01:02.818000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('69934829:1357fef972f:-8000', '3', '0', null, to_timestamp('15-02-2012 15:35:05.536000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3246673c:1358543fe0c:-7ff9', '3', 'B201100025', null, to_timestamp('16-02-2012 16:44:56.442000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-8000', '3', '0', null, to_timestamp('06-01-2012 11:51:19.072000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1e66852a:134b12085d4:-7ffe', '222', '0', null, to_timestamp('06-01-2012 13:11:34.408000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6e27d333:135a3a90c3e:-7ffb', '1122334', 'B201100044', null, to_timestamp('22-02-2012 14:54:33.358000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('590c39d5:135a95ed98e:-7fff', '77', '0', null, to_timestamp('23-02-2012 16:45:40.139000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('18a22d2f:134c07682f2:-7ffc', '88', 'B201100018', null, to_timestamp('09-01-2012 11:17:16.844000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('18a22d2f:134c07682f2:-7ffb', '111', '0', null, to_timestamp('09-01-2012 11:18:29.563000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2ba8fabd:134d4b35db2:-7ffa', '3', '0', null, to_timestamp('13-01-2012 10:27:06.849000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4955aba:134a6366e9f:-7ffe', '3', '0', null, to_timestamp('04-01-2012 09:11:14.710000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('20f1c76f:13478aee815:-8000', '3', '0', null, to_timestamp('26-12-2011 12:44:19.109000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('447f8378:13478d96334:-7ffc', '3', 'B201100017', null, to_timestamp('26-12-2011 15:44:02.688000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-1e3d53c0:13491c350f6:-8000', '3', '0', null, to_timestamp('31-12-2011 09:37:03.373000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-32eee4cd:13483c2f189:-8000', '3', '0', null, to_timestamp('28-12-2011 16:21:56.873000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('447f8378:13478d96334:-7ffb', '3', 'B201100017', null, to_timestamp('26-12-2011 15:44:11.781000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('447f8378:13478d96334:-7ffa', '3', 'B201100017', null, to_timestamp('26-12-2011 15:57:28.250000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7ff9', '3', '0', null, to_timestamp('29-12-2011 17:07:21.467000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7ff2', '3', '0', null, to_timestamp('29-12-2011 17:23:37.155000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fe5', '3', '0', null, to_timestamp('30-12-2011 16:05:57.327000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fe3', '3', '0', null, to_timestamp('30-12-2011 16:09:05.998000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fe1', '3', '0', null, to_timestamp('30-12-2011 16:13:37.280000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fe0', '3', '0', null, to_timestamp('30-12-2011 16:13:47.139000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fdb', '3', '0', null, to_timestamp('30-12-2011 16:22:13.889000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fd6', '3', '0', null, to_timestamp('30-12-2011 16:33:56.577000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fd0', '3', '0', null, to_timestamp('30-12-2011 16:46:16.389000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fc9', '3', '0', null, to_timestamp('30-12-2011 17:01:46.717000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7fff', '88', '0', null, to_timestamp('31-12-2011 09:01:42.686000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ffb', '3', '0', null, to_timestamp('31-12-2011 09:05:16.420000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ff9', '3', '0', null, to_timestamp('31-12-2011 09:12:00.967000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ff7', '88', '0', null, to_timestamp('31-12-2011 09:15:30.592000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ff1', '11', '0', null, to_timestamp('31-12-2011 09:19:06.858000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ff0', '11', '0', null, to_timestamp('31-12-2011 09:19:32.811000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7fee', '88', '0', null, to_timestamp('31-12-2011 09:22:03.577000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7fec', '3', '0', null, to_timestamp('31-12-2011 09:23:14.295000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7feb', '11', '0', null, to_timestamp('31-12-2011 09:24:13.530000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ff6', '11', '0', null, to_timestamp('30-12-2011 14:37:11.436000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ff3', '11', '0', null, to_timestamp('30-12-2011 14:42:16.217000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ff0', '3', '0', null, to_timestamp('30-12-2011 14:59:41.327000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fee', '3', '0', null, to_timestamp('30-12-2011 15:23:56.889000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fe4', '3', '0', null, to_timestamp('30-12-2011 16:06:21.748000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fde', '3', '0', null, to_timestamp('30-12-2011 16:19:24.702000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fdd', '11', '0', null, to_timestamp('30-12-2011 16:19:58.702000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fd1', '3', '0', null, to_timestamp('30-12-2011 16:41:14.123000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fcf', '3', '0', null, to_timestamp('30-12-2011 16:47:47.202000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fc3', '3', '0', null, to_timestamp('30-12-2011 17:23:11.748000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fc1', '3', '0', null, to_timestamp('30-12-2011 17:27:42.483000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('447f8378:13478d96334:-7ff9', '3', '0', null, to_timestamp('26-12-2011 16:08:28.078000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-67ab53e:1347e892db3:-8000', '3', '0', null, to_timestamp('27-12-2011 16:00:41.656000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ffe', '3', '0', null, to_timestamp('30-12-2011 09:00:25.264000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ffb', '3', '0', null, to_timestamp('30-12-2011 09:08:27.936000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ff8', '88', '0', null, to_timestamp('30-12-2011 09:14:17.170000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ff1', '11', '0', null, to_timestamp('30-12-2011 09:24:14.748000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ffe', '3', '0', null, to_timestamp('30-12-2011 14:31:47.998000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ffc', '88', '0', null, to_timestamp('30-12-2011 14:33:00.780000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ff2', '11', '0', null, to_timestamp('30-12-2011 14:43:15.983000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ff1', '3', '0', null, to_timestamp('30-12-2011 14:55:20.467000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fff', '3', '0', null, to_timestamp('31-12-2011 13:53:44.998000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 100 records committed...
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ffd', '88', '0', null, to_timestamp('31-12-2011 13:55:12.077000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ff6', '3', '0', null, to_timestamp('31-12-2011 14:06:25.389000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ff2', '3', '0', null, to_timestamp('31-12-2011 14:11:47.061000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-12ae24b5:1347eb4e819:-7ffd', '3', '0', null, to_timestamp('27-12-2011 16:52:17.280000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('561090e0:1348341fa08:-8000', '3', '0', null, to_timestamp('28-12-2011 14:00:56.030000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('561090e0:1348341fa08:-7ffd', '3', '0', null, to_timestamp('28-12-2011 14:33:15.780000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('561090e0:1348341fa08:-7ffc', '3', '0', null, to_timestamp('28-12-2011 14:35:33.748000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-32eee4cd:13483c2f189:-7fff', '3', 'B201100031', null, to_timestamp('28-12-2011 16:24:41.873000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-32eee4cd:13483c2f189:-7ffd', '3', 'B201100044', null, to_timestamp('28-12-2011 16:27:27.170000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-32eee4cd:13483c2f189:-7ffb', '3', 'B201100044', null, to_timestamp('28-12-2011 16:27:47.295000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('475a0f8f:13488a5ddbe:-8000', '3', '0', null, to_timestamp('29-12-2011 15:08:07.467000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ffc', '3', '0', null, to_timestamp('30-12-2011 09:07:30.108000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ffa', '3', '0', null, to_timestamp('30-12-2011 09:10:48.561000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ff9', '3', '0', null, to_timestamp('30-12-2011 09:13:27.686000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ff7', '88', '0', null, to_timestamp('30-12-2011 09:15:01.139000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ff5', '3', '0', null, to_timestamp('30-12-2011 09:18:46.045000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ff4', '88', '0', null, to_timestamp('30-12-2011 09:19:22.764000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('e49351:1347d08221b:-7fff', '3', '0', null, to_timestamp('27-12-2011 10:11:35.734000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('447f8378:13478d96334:-7ffe', '3', 'B201100017', null, to_timestamp('26-12-2011 15:18:46.141000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('447f8378:13478d96334:-7ffd', '3', 'B201100017', null, to_timestamp('26-12-2011 15:21:24.813000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('5ea90ccf:1346ad2e6b8:20cb', 'admin', 'B201100000', null, to_timestamp('26-12-2011 14:06:42.453000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('5ea90ccf:1346ad2e6b8:20cc', 'admin', 'B201100000', null, to_timestamp('26-12-2011 14:37:23.750000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('47036f8a:1347ebe6e64:-7fff', '3', '0', null, to_timestamp('27-12-2011 17:05:37.295000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7fff', '3', '0', null, to_timestamp('29-12-2011 16:52:23.936000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-8000', 'admin', '0', null, to_timestamp('30-12-2011 08:55:54.827000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ffb', '3', '0', null, to_timestamp('30-12-2011 09:10:14.545000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ff9', '3', '0', null, to_timestamp('30-12-2011 09:12:27.061000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ff6', '3', '0', null, to_timestamp('30-12-2011 09:24:44.045000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ff3', '3', 'B201100044', null, to_timestamp('30-12-2011 09:32:40.108000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ff1', '3', '0', null, to_timestamp('30-12-2011 09:33:51.295000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ff0', '3', 'B201100044', null, to_timestamp('30-12-2011 09:34:15.108000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-8000', '88', '0', null, to_timestamp('30-12-2011 14:18:38.873000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-8000', '3', '0', null, to_timestamp('31-12-2011 11:25:26.936000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-7bee4823:134a6632948:-8000', '3', '0', null, to_timestamp('04-01-2012 09:43:52.648000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-32eee4cd:13483c2f189:-7ffc', '3', 'B201100044', null, to_timestamp('28-12-2011 16:27:32.967000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-32eee4cd:13483c2f189:-7ffa', '3', 'B201100099', null, to_timestamp('28-12-2011 16:30:01.530000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ff8', '88', '0', null, to_timestamp('30-12-2011 14:36:33.014000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ff7', '3', '0', null, to_timestamp('30-12-2011 14:36:47.498000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ff5', '3', '0', null, to_timestamp('30-12-2011 14:40:02.827000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ff4', '11', '0', null, to_timestamp('30-12-2011 14:40:25.123000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fed', '3', '0', null, to_timestamp('30-12-2011 15:25:02.248000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fe7', '3', '0', null, to_timestamp('30-12-2011 15:57:14.405000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fdf', '3', '0', null, to_timestamp('30-12-2011 16:17:18.155000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fdc', '3', '0', null, to_timestamp('30-12-2011 16:21:30.748000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fd9', '3', '0', null, to_timestamp('30-12-2011 16:28:14.389000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fd2', '3', '0', null, to_timestamp('30-12-2011 16:40:31.170000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fcb', '3', '0', null, to_timestamp('30-12-2011 16:59:57.155000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fca', '3', '0', null, to_timestamp('30-12-2011 17:00:23.717000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fc6', '3', '0', null, to_timestamp('30-12-2011 17:20:15.452000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fc2', '11', '0', null, to_timestamp('30-12-2011 17:26:33.873000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-12ae24b5:1347eb4e819:-8000', '3', '0', null, to_timestamp('27-12-2011 16:48:23.249000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-12ae24b5:1347eb4e819:-7ffc', '3', '0', null, to_timestamp('27-12-2011 16:53:24.202000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('374f4b4e:13482c50f84:-8000', '3', '0', null, to_timestamp('28-12-2011 11:44:29.623000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('561090e0:1348341fa08:-7ffe', '3', '0', null, to_timestamp('28-12-2011 14:31:39.670000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('561090e0:1348341fa08:-7ff8', '3', '0', null, to_timestamp('28-12-2011 14:48:58.686000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-32eee4cd:13483c2f189:-7ffe', '3', 'B201100044', null, to_timestamp('28-12-2011 16:27:05.295000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-8000', '3', '0', null, to_timestamp('30-12-2011 08:58:25.827000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ffd', '88', '0', null, to_timestamp('30-12-2011 09:00:53.498000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-8000', '3', '0', null, to_timestamp('31-12-2011 08:59:37.202000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ff7', '88', '0', null, to_timestamp('31-12-2011 14:05:36.108000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ff4', '88', '0', null, to_timestamp('31-12-2011 14:07:12.780000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ff0', '88', '0', null, to_timestamp('31-12-2011 14:12:34.936000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fee', '11', '0', null, to_timestamp('31-12-2011 14:14:17.045000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7feb', '11', '0', null, to_timestamp('31-12-2011 14:17:56.436000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fea', '3', '0', null, to_timestamp('31-12-2011 14:19:44.139000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fe2', '3', '0', null, to_timestamp('31-12-2011 14:40:54.936000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fdd', '3', '0', null, to_timestamp('31-12-2011 14:52:33.092000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fdc', '3', '0', null, to_timestamp('31-12-2011 14:54:26.155000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fd9', '3', 'B201100018', null, to_timestamp('31-12-2011 14:58:31.358000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('561090e0:1348341fa08:-7ffa', '3', '0', null, to_timestamp('28-12-2011 14:41:57.577000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('561090e0:1348341fa08:-7ff9', '3', '0', null, to_timestamp('28-12-2011 14:47:31.795000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ffb', '3', '0', null, to_timestamp('30-12-2011 14:35:23.405000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ffa', '3', '0', null, to_timestamp('30-12-2011 14:35:46.967000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ff9', '88', '0', null, to_timestamp('30-12-2011 14:36:09.623000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ffc', '3', '0', null, to_timestamp('31-12-2011 09:04:45.373000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ff6', '3', '0', null, to_timestamp('31-12-2011 09:15:43.967000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ff5', '88', '0', null, to_timestamp('31-12-2011 09:16:11.623000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ff3', '3', '0', null, to_timestamp('31-12-2011 09:17:49.295000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('561090e0:1348341fa08:-7fff', '3', '0', null, to_timestamp('28-12-2011 14:06:33.233000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3415f1cd:1347e7851d8:-7fff', '3', '0', null, to_timestamp('27-12-2011 15:43:54.578000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('47036f8a:1347ebe6e64:-8000', '3', '0', null, to_timestamp('27-12-2011 16:58:47.452000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-1e3d53c0:13491c350f6:-7fff', '88', '0', null, to_timestamp('31-12-2011 09:37:32.420000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('433b9cd3:13491feaacf:-8000', '3', '0', null, to_timestamp('31-12-2011 10:41:52.967000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ffb', '3', '0', null, to_timestamp('28-12-2011 09:59:38.998000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ffa', '3', '0', null, to_timestamp('28-12-2011 10:02:30.295000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ff8', '3', '0', null, to_timestamp('28-12-2011 10:05:05.733000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ff6', '3', '0', null, to_timestamp('28-12-2011 10:19:51.811000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6412364d:134789995b5:-8000', '3', '0', null, to_timestamp('26-12-2011 12:21:04.656000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('447f8378:13478d96334:-7ff8', '3', 'B201100018', null, to_timestamp('26-12-2011 16:12:40.391000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3d23a936:1347eab1582:-7ffe', '3', '0', null, to_timestamp('27-12-2011 16:43:33.389000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('374f4b4e:13482c50f84:-7ffd', '3', '0', null, to_timestamp('28-12-2011 13:14:35.780000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-4c1939e9:13487553bd3:-7ff9', '88', '0', null, to_timestamp('29-12-2011 09:09:14.764000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fff', '11', '0', null, to_timestamp('30-12-2011 14:19:22.842000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4955aba:134a6366e9f:-8000', '3', '0', null, to_timestamp('04-01-2012 08:55:15.663000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('5fa58e31:1357440e330:-7ffe', '3', '0', null, to_timestamp('13-02-2012 09:42:35.194000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fef', '77', '0', null, to_timestamp('24-02-2012 11:32:45.545000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fde', '77', '0', null, to_timestamp('24-02-2012 14:56:20.170000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-7ffd', '3', '0', null, to_timestamp('06-01-2012 13:15:56.875000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6472b95f:13561131c1c:-8000', '3', '0', null, to_timestamp('09-02-2012 15:45:33.554000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('2ec1bac:13564e8f041:-7ffc', '3', 'B201100037', null, to_timestamp('10-02-2012 17:18:34.694000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 200 records committed...
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-7ff7', '3', '0', null, to_timestamp('06-01-2012 13:43:38.896000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-7ff5', '3', '0', null, to_timestamp('06-01-2012 13:49:28.175000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-7ff4', '88', '0', null, to_timestamp('06-01-2012 13:51:58.143000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-7ff3', '88', '0', null, to_timestamp('06-01-2012 13:52:57.892000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1e66852a:134b12085d4:-7ff7', '222', 'B201100018', null, to_timestamp('06-01-2012 14:29:01.407000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-7ffb', '3', '0', null, to_timestamp('06-01-2012 13:22:30.685000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-32eee4cd:13483c2f189:-7ff9', '3', '0', null, to_timestamp('28-12-2011 16:33:33.952000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fef', '3', '0', null, to_timestamp('30-12-2011 15:21:36.014000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fec', '3', '0', null, to_timestamp('30-12-2011 15:25:57.170000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7feb', '3', '0', null, to_timestamp('30-12-2011 15:27:41.873000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fe8', '3', '0', null, to_timestamp('30-12-2011 15:49:39.717000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fd5', '11', '0', null, to_timestamp('30-12-2011 16:36:30.670000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fd4', '11', '0', null, to_timestamp('30-12-2011 16:38:10.030000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fcc', '3', '0', null, to_timestamp('30-12-2011 16:52:02.202000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fc8', '3', '0', null, to_timestamp('30-12-2011 17:07:19.998000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fc4', '3', '0', null, to_timestamp('30-12-2011 17:22:05.811000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ff5', '3', '0', null, to_timestamp('28-12-2011 10:22:03.373000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('374f4b4e:13482c50f84:-7ffb', '3', '0', null, to_timestamp('28-12-2011 13:29:25.077000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('374f4b4e:13482c50f84:-7ffa', '3', '0', null, to_timestamp('28-12-2011 13:38:20.327000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-4c1939e9:13487553bd3:-8000', '88', '0', null, to_timestamp('29-12-2011 09:00:25.686000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-4c1939e9:13487553bd3:-7ffe', '88', '0', null, to_timestamp('29-12-2011 09:02:53.452000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ff8', '3', '0', null, to_timestamp('31-12-2011 09:14:59.936000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7fea', '88', '0', null, to_timestamp('31-12-2011 09:24:30.530000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('14b0fc69:1347e98d545:-7fff', '3', '0', null, to_timestamp('27-12-2011 16:19:36.484000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('433b9cd3:13491feaacf:-7fff', '88', '0', null, to_timestamp('31-12-2011 10:42:21.123000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ff4', '3', '0', null, to_timestamp('28-12-2011 10:25:15.373000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7fef', '3', '0', null, to_timestamp('28-12-2011 11:20:33.014000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fea', '3', '0', null, to_timestamp('30-12-2011 15:29:01.577000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fe9', '88', '0', null, to_timestamp('30-12-2011 15:44:52.905000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fe6', '3', '0', null, to_timestamp('30-12-2011 16:04:27.795000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fe2', '3', '0', null, to_timestamp('30-12-2011 16:09:32.061000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fda', '3', '0', null, to_timestamp('30-12-2011 16:27:41.686000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fd8', '3', '0', null, to_timestamp('30-12-2011 16:28:15.998000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fd7', '3', '0', null, to_timestamp('30-12-2011 16:33:51.655000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fd3', '11', '0', null, to_timestamp('30-12-2011 16:38:14.295000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fce', '3', '0', null, to_timestamp('30-12-2011 16:48:17.873000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fcd', '3', '0', null, to_timestamp('30-12-2011 16:51:47.639000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fc7', '3', '0', null, to_timestamp('30-12-2011 17:07:54.295000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7fc5', '3', '0', null, to_timestamp('30-12-2011 17:21:47.311000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ff4', '3', '0', null, to_timestamp('31-12-2011 09:16:32.248000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ff2', '88', '0', null, to_timestamp('31-12-2011 09:18:32.748000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ffe', '3', '0', null, to_timestamp('28-12-2011 09:47:57.655000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ffc', '3', '0', null, to_timestamp('28-12-2011 09:55:03.452000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7fef', '3', '0', null, to_timestamp('31-12-2011 09:21:33.592000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7fed', '11', '0', null, to_timestamp('31-12-2011 09:22:34.280000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-1a574806:13491f293e6:-8000', '3', '0', null, to_timestamp('31-12-2011 10:28:40.686000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ff9', '3', '0', null, to_timestamp('28-12-2011 10:03:49.342000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('374f4b4e:13482c50f84:-7ff8', '3', '0', null, to_timestamp('28-12-2011 13:52:46.764000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ffe', '3', '0', null, to_timestamp('31-12-2011 09:02:36.827000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('14b0fc69:1347e98d545:-7ffe', '3', '0', null, to_timestamp('27-12-2011 16:21:38.125000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('14b0fc69:1347e98d545:-7ffd', '3', '0', null, to_timestamp('27-12-2011 16:25:21.281000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ffd', '3', '0', null, to_timestamp('31-12-2011 09:03:59.280000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ffe', '11', '0', null, to_timestamp('31-12-2011 13:54:58.530000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ffa', '3', '0', null, to_timestamp('31-12-2011 14:03:38.827000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ff9', '3', '0', null, to_timestamp('31-12-2011 14:04:34.248000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ff3', '3', '0', null, to_timestamp('31-12-2011 14:07:59.842000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fed', '11', '0', null, to_timestamp('31-12-2011 14:15:20.202000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fe7', '3', '0', null, to_timestamp('31-12-2011 14:31:27.936000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fe4', '3', '0', null, to_timestamp('31-12-2011 14:34:45.577000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fe1', '3', '0', null, to_timestamp('31-12-2011 14:42:24.561000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fe0', '3', '0', null, to_timestamp('31-12-2011 14:44:46.889000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7ffd', '3', '0', null, to_timestamp('29-12-2011 17:00:46.811000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7ffc', '3', '0', null, to_timestamp('29-12-2011 17:01:15.889000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7ffb', '3', '0', null, to_timestamp('29-12-2011 17:03:52.873000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-4c1939e9:13487553bd3:-7ffa', '88', '0', null, to_timestamp('29-12-2011 09:08:09.983000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7ff6', '3', '0', null, to_timestamp('29-12-2011 17:18:33.389000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7ff4', '3', '0', null, to_timestamp('29-12-2011 17:20:55.420000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7ff3', '3', '0', null, to_timestamp('29-12-2011 17:22:55.483000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ffc', '3', '0', null, to_timestamp('30-12-2011 09:10:08.327000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7fed', '3', 'B201100044', null, to_timestamp('30-12-2011 10:02:30.623000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5e84171b:1349196950e:-7ffd', '3', '0', null, to_timestamp('31-12-2011 08:54:51.936000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4955aba:134a6366e9f:-7fff', '3', '0', null, to_timestamp('04-01-2012 09:05:52.070000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ff3', '3', '0', null, to_timestamp('28-12-2011 10:49:39.952000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('14b0fc69:1347e98d545:-8000', '3', '0', null, to_timestamp('27-12-2011 16:17:47.594000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('e49351:1347d08221b:-8000', 'admin', '0', null, to_timestamp('27-12-2011 09:00:07.422000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ffd', '3', '0', null, to_timestamp('28-12-2011 09:52:24.998000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5202ecef:13491a10abb:-7ffa', '3', '0', null, to_timestamp('31-12-2011 09:09:44.827000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ffc', '3', '0', null, to_timestamp('31-12-2011 13:57:20.030000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ff5', '11', '0', null, to_timestamp('31-12-2011 14:06:54.061000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ff1', '3', '0', null, to_timestamp('31-12-2011 14:12:13.733000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fec', '11', '0', null, to_timestamp('31-12-2011 14:17:40.373000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fe9', '11', '0', null, to_timestamp('31-12-2011 14:22:30.655000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fdf', '3', '0', null, to_timestamp('31-12-2011 14:46:15.717000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fde', '3', '0', null, to_timestamp('31-12-2011 14:48:15.077000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fdb', '88', '0', null, to_timestamp('31-12-2011 14:55:49.827000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fda', '3', '0', null, to_timestamp('31-12-2011 14:58:01.998000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7ffa', '3', '0', null, to_timestamp('29-12-2011 17:06:24.170000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7ff5', '3', '0', null, to_timestamp('29-12-2011 17:19:30.608000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('374f4b4e:13482c50f84:-7ff9', '3', '0', null, to_timestamp('28-12-2011 13:48:51.014000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('12740ad4:13483e8e54b:-7fff', 'admin', 'B201100044', null, to_timestamp('28-12-2011 17:04:07.686000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7fff', 'admin', '0', null, to_timestamp('30-12-2011 08:56:08.014000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ffe', 'admin', '0', null, to_timestamp('30-12-2011 08:56:18.920000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ff7', 'admin', 'B201100017', null, to_timestamp('30-12-2011 09:18:54.248000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ff5', '3', 'B201100044', null, to_timestamp('30-12-2011 09:26:51.545000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ff2', '3', 'B201100044', null, to_timestamp('30-12-2011 09:32:59.827000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7fef', '3', 'B201100044', null, to_timestamp('30-12-2011 09:40:36.670000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-7bee4823:134a6632948:-7fff', '88', '0', null, to_timestamp('04-01-2012 09:53:19.554000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3d23a936:1347eab1582:-8000', '3', '0', null, to_timestamp('27-12-2011 16:37:43.656000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ff7', '3', '0', null, to_timestamp('28-12-2011 10:08:33.123000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('12740ad4:13483e8e54b:-8000', 'admin', 'B201100044', null, to_timestamp('28-12-2011 17:03:20.858000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 300 records committed...
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('5ea90ccf:1346ad2e6b8:20c9', 'admin', 'B201100000', null, to_timestamp('26-12-2011 09:05:27.547000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('5ea90ccf:1346ad2e6b8:20ca', 'admin', 'B201100000', null, to_timestamp('26-12-2011 09:45:01.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7ff7', '3', '0', null, to_timestamp('29-12-2011 17:09:27.530000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('12740ad4:13483e8e54b:-7ffe', 'admin', 'B201100044', null, to_timestamp('28-12-2011 17:05:26.061000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-8000', '3', '0', null, to_timestamp('28-12-2011 09:32:42.842000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7fff', '3', '0', null, to_timestamp('28-12-2011 09:46:18.623000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-4c1939e9:13487553bd3:-7ffd', 'bbb111', '0', null, to_timestamp('29-12-2011 09:04:04.155000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6412364d:134789995b5:-7fff', '3', '0', null, to_timestamp('26-12-2011 12:29:11.266000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-368494:1348c6e06fc:-8000', 'admin', '0', null, to_timestamp('30-12-2011 08:45:45.342000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ffd', '3', '0', null, to_timestamp('30-12-2011 08:56:56.717000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ff4', '3', 'B201100044', null, to_timestamp('30-12-2011 09:30:16.998000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7fee', '3', 'B201100044', null, to_timestamp('30-12-2011 09:44:24.842000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3415f1cd:1347e7851d8:-8000', '3', '0', null, to_timestamp('27-12-2011 15:42:16.813000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7ffe', '3', '0', null, to_timestamp('29-12-2011 16:54:36.889000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('447f8378:13478d96334:-7fff', '3', '0', null, to_timestamp('26-12-2011 15:12:59.516000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('561090e0:1348341fa08:-7ffb', '3', '0', null, to_timestamp('28-12-2011 14:37:19.202000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('374f4b4e:13482c50f84:-7ffe', '3', '0', null, to_timestamp('28-12-2011 13:08:21.155000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('374f4b4e:13482c50f84:-7ffc', '3', '0', null, to_timestamp('28-12-2011 13:19:37.358000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('561090e0:1348341fa08:-7ff7', '3', '0', null, to_timestamp('28-12-2011 14:53:33.670000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5e84171b:1349196950e:-8000', '3', '0', null, to_timestamp('31-12-2011 08:48:11.733000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5e84171b:1349196950e:-7fff', '3', '0', null, to_timestamp('31-12-2011 08:53:15.983000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-5e84171b:1349196950e:-7ffe', '3', '0', null, to_timestamp('31-12-2011 08:54:32.905000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ffb', '3', '0', null, to_timestamp('31-12-2011 14:03:08.655000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7ff8', '11', '0', null, to_timestamp('31-12-2011 14:05:20.123000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fef', '3', '0', null, to_timestamp('31-12-2011 14:13:58.030000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fe8', '3', '0', null, to_timestamp('31-12-2011 14:26:31.108000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fe6', '3', '0', null, to_timestamp('31-12-2011 14:31:48.248000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fe5', '3', '0', null, to_timestamp('31-12-2011 14:32:57.248000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4422c88e:13492268daf:-7fe3', '3', '0', null, to_timestamp('31-12-2011 14:36:26.873000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3d1d6f3d:134a67f11df:-8000', '3', '0', null, to_timestamp('04-01-2012 10:14:21.648000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3d1d6f3d:134a67f11df:-7fff', '88', '0', null, to_timestamp('04-01-2012 10:15:00.601000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ff2', '3', '0', null, to_timestamp('28-12-2011 10:57:30.780000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ff1', '3', '0', null, to_timestamp('28-12-2011 11:02:11.608000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-12ae24b5:1347eb4e819:-7fff', '3', '0', null, to_timestamp('27-12-2011 16:50:02.249000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-12ae24b5:1347eb4e819:-7ffe', '3', '0', null, to_timestamp('27-12-2011 16:51:46.967000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-4c1939e9:13487553bd3:-7ffc', '3', '0', null, to_timestamp('29-12-2011 09:04:39.045000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-4c1939e9:13487553bd3:-7ffb', '88', '0', null, to_timestamp('29-12-2011 09:07:17.592000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ff6', '3', '0', null, to_timestamp('30-12-2011 09:15:13.295000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ff2', '88', '0', null, to_timestamp('30-12-2011 09:23:56.748000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ff0', '3', '0', null, to_timestamp('30-12-2011 09:28:40.311000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-4c1939e9:13487553bd3:-7fff', '3', '0', null, to_timestamp('29-12-2011 09:01:29.577000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-7ff8', '88', '0', null, to_timestamp('29-12-2011 17:08:18.655000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ffa', '3', '0', null, to_timestamp('30-12-2011 09:12:24.358000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('4cef01aa:1348c7753c8:-7ff8', 'admin', '0', null, to_timestamp('30-12-2011 09:15:00.952000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('475a0f8f:13488a5ddbe:-7fff', '88', '0', null, to_timestamp('29-12-2011 15:11:31.311000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-529612f7:13489036ece:-8000', '3', '0', null, to_timestamp('29-12-2011 16:50:19.405000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2317f8c:134824c6959:-7ff0', '3', '0', null, to_timestamp('28-12-2011 11:15:11.514000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7fff', '3', '0', null, to_timestamp('30-12-2011 08:59:34.045000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7ff3', '11', '0', null, to_timestamp('30-12-2011 09:23:16.920000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3aaae2c6:1348c7991e8:-7fef', '11', '0', null, to_timestamp('30-12-2011 09:29:07.077000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6781a984:1348d9ebd9b:-7ffd', '88', '0', null, to_timestamp('30-12-2011 14:32:20.467000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('47036f8a:1347ebe6e64:-7ffe', '3', '0', null, to_timestamp('27-12-2011 17:11:49.561000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('374f4b4e:13482c50f84:-7fff', '3', '0', null, to_timestamp('28-12-2011 11:52:11.030000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3d23a936:1347eab1582:-7fff', '3', '0', null, to_timestamp('27-12-2011 16:38:49.250000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('40800e93:135996fb1c3:-7fff', '3', 'B201100018', null, to_timestamp('20-02-2012 14:30:03.567000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('54d0cf6e:135a7fc4315:-7fff', '77', '0', null, to_timestamp('23-02-2012 10:13:47.139000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('54d0cf6e:135a7fc4315:-7ffe', '77', '0', null, to_timestamp('23-02-2012 10:52:43.733000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-7ff6', '3', '0', null, to_timestamp('06-01-2012 13:46:12.911000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-7ff9', '88', '0', null, to_timestamp('09-01-2012 09:43:34.391000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-7ff3', '11', '0', null, to_timestamp('09-01-2012 09:51:30.985000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1a9f2a2a:134e5ab044e:-8000', '222', '0', null, to_timestamp('16-01-2012 16:38:42.583000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-495edff8:13555b62430:-7ffe', '3', 'B201100025', null, to_timestamp('07-02-2012 10:53:29.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1e66852a:134b12085d4:-8000', '3', '0', null, to_timestamp('06-01-2012 11:47:10.670000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-7ffe', '3', '0', null, to_timestamp('06-01-2012 13:11:35.940000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-7ff9', '3', '0', null, to_timestamp('06-01-2012 13:26:55.090000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('590c39d5:135a95ed98e:-8000', '77', '0', null, to_timestamp('23-02-2012 16:40:37.686000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fed', '77', '0', null, to_timestamp('24-02-2012 11:37:02.014000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fea', '77', '0', null, to_timestamp('24-02-2012 13:20:51.030000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fe8', '77', '0', null, to_timestamp('24-02-2012 13:29:26.655000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fe6', '77', '0', null, to_timestamp('24-02-2012 13:46:30.592000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fe0', '77', '0', null, to_timestamp('24-02-2012 14:21:56.452000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fdf', '77', '0', null, to_timestamp('24-02-2012 14:30:50.655000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-3d35523c:134e921a0f6:-8000', '222', '0', null, to_timestamp('17-01-2012 08:47:08.301000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-7ffa', '88', '0', null, to_timestamp('09-01-2012 09:42:28.844000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ffe', '77', '0', null, to_timestamp('24-02-2012 09:18:19.717000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ffd', '77', '0', null, to_timestamp('24-02-2012 09:20:58.030000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-7ff6', '88', '0', null, to_timestamp('09-01-2012 09:44:36.844000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ffb', '77', '0', null, to_timestamp('24-02-2012 09:28:25.733000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ff2', '77', '0', null, to_timestamp('24-02-2012 10:27:21.889000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fec', '77', '0', null, to_timestamp('24-02-2012 11:41:21.998000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7feb', '77', '0', null, to_timestamp('24-02-2012 13:08:08.905000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('5fa58e31:1357440e330:-7fff', '3', '0', null, to_timestamp('13-02-2012 09:12:33.804000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-495edff8:13555b62430:-8000', '3', '0', null, to_timestamp('07-02-2012 10:48:24.759000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-495edff8:13555b62430:-7fff', '3', 'B201100025', null, to_timestamp('07-02-2012 10:53:16.775000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('18a22d2f:134c07682f2:-8000', '3', '0', null, to_timestamp('09-01-2012 11:15:21.032000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('18a22d2f:134c07682f2:-7fff', '11', '0', null, to_timestamp('09-01-2012 11:16:06.157000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('457eb88:134bff5a07c:-8000', '3', '0', null, to_timestamp('09-01-2012 08:54:40.782000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('2ec1bac:13564e8f041:-7ffe', '3', 'B201100018', null, to_timestamp('10-02-2012 17:17:35.819000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('2ec1bac:13564e8f041:-7ffd', '3', 'B201100033', null, to_timestamp('10-02-2012 17:18:26.991000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-27c30d27:134c037b54f:-8000', '3', '0', null, to_timestamp('09-01-2012 10:06:45.204000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-27c30d27:134c037b54f:-7fff', '3', '0', null, to_timestamp('09-01-2012 10:07:10.844000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2811319a:1357ffeeae3:-7ffc', 'admin', 'B201100041', null, to_timestamp('15-02-2012 16:20:40.129000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-7fff', '3', '0', null, to_timestamp('06-01-2012 11:53:02.898000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-27c30d27:134c037b54f:-7ffe', '11', '0', null, to_timestamp('09-01-2012 10:07:53.157000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-27c30d27:134c037b54f:-7ffc', '11', '0', null, to_timestamp('09-01-2012 10:09:22.094000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-478882dd:1352d2e5121:-8000', '3', '0', null, to_timestamp('13-01-2012 13:54:56.615000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('5fa58e31:1357440e330:-8000', '3', '0', null, to_timestamp('13-02-2012 09:08:39.898000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-77cff697:134c007da46:-7fff', '3', '0', null, to_timestamp('09-01-2012 09:14:41.766000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-77cff697:134c007da46:-7ffe', '3', '0', null, to_timestamp('09-01-2012 09:21:05.813000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fff', '77', '0', null, to_timestamp('24-02-2012 09:16:29.483000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 400 records committed...
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ff8', '77', '0', null, to_timestamp('24-02-2012 09:39:07.373000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ff1', '77', '0', null, to_timestamp('24-02-2012 11:07:11.202000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6eba96f1:1358a3f3ddb:-8000', '3', '0', null, to_timestamp('17-02-2012 15:38:26.942000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6e27d333:135a3a90c3e:-7ffe', '1122334', '0', null, to_timestamp('22-02-2012 14:29:25.936000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-8000', '77', '0', null, to_timestamp('24-02-2012 09:12:16.123000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3246673c:1358543fe0c:-7ffa', '3', 'B201100025', null, to_timestamp('16-02-2012 16:44:51.754000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('2ec1bac:13564e8f041:-7fff', '3', 'B201100018', null, to_timestamp('10-02-2012 09:52:04.085000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3246673c:1358543fe0c:-7fff', '3', '0', null, to_timestamp('16-02-2012 16:41:45.598000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3246673c:1358543fe0c:-7ffe', '3', '0', null, to_timestamp('16-02-2012 16:42:26.958000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('457eb88:134bff5a07c:-7fff', '3', 'B201100017', null, to_timestamp('09-01-2012 08:55:09.454000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-8000', '3', '0', null, to_timestamp('09-01-2012 09:25:50.204000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-7fff', '3', '0', null, to_timestamp('09-01-2012 09:27:37.407000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-7ffc', '88', '0', null, to_timestamp('09-01-2012 09:38:08.969000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-7ff4', '11', '0', null, to_timestamp('09-01-2012 09:50:36.469000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1e66852a:134b12085d4:-7fff', '222', '0', null, to_timestamp('06-01-2012 13:06:38.910000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7ffc', '3', 'B201100018', null, to_timestamp('20-02-2012 10:11:08.364000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7ff5', '3', 'B201100018', null, to_timestamp('20-02-2012 10:15:25.770000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ff6', '77', '0', null, to_timestamp('24-02-2012 09:58:23.077000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ff5', '77', '0', null, to_timestamp('24-02-2012 10:08:12.920000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2ba8fabd:134d4b35db2:-8000', '222', '0', null, to_timestamp('13-01-2012 09:34:13.615000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2ba8fabd:134d4b35db2:-7ff9', '3', '0', null, to_timestamp('13-01-2012 10:31:58.787000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2ba8fabd:134d4b35db2:-7ff8', '3', '0', null, to_timestamp('13-01-2012 10:43:38.740000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2811319a:1357ffeeae3:-7ffa', 'admin', 'B201100000', null, to_timestamp('15-02-2012 16:38:38.036000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2811319a:1357ffeeae3:-7ff8', 'admin', 'B201100041', null, to_timestamp('15-02-2012 16:39:00.426000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('590c39d5:135a95ed98e:-7ffe', '77', '0', null, to_timestamp('23-02-2012 16:47:09.327000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('590c39d5:135a95ed98e:-7ff9', '77', '0', null, to_timestamp('23-02-2012 17:02:51.936000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('590c39d5:135a95ed98e:-7ff7', '77', '0', null, to_timestamp('23-02-2012 17:08:10.873000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6b11a5d8:135a7b9648d:-8000', '1122334', '0', null, to_timestamp('23-02-2012 09:00:35.436000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6b11a5d8:135a7b9648d:-7ffe', '1122334', '0', null, to_timestamp('23-02-2012 09:03:58.717000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-4175093:134c59a72df:-7fff', '3', 'B201100018', null, to_timestamp('10-01-2012 11:13:41.218000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-77cff697:134c007da46:-8000', '3', '0', null, to_timestamp('09-01-2012 09:14:28.954000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-7ffd', '3', '0', null, to_timestamp('09-01-2012 09:33:50.329000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ff7', '77', '0', null, to_timestamp('24-02-2012 09:55:39.436000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ff4', '77', '0', null, to_timestamp('24-02-2012 10:10:50.639000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1e66852a:134b12085d4:-7ffb', '222', '0', null, to_timestamp('06-01-2012 14:12:57.532000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-6b3aa7b2:135acdec5e1:-8000', '77', '0', null, to_timestamp('24-02-2012 08:59:12.358000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ffc', '77', '0', null, to_timestamp('24-02-2012 09:22:40.420000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ff9', '77', '0', null, to_timestamp('24-02-2012 09:36:15.373000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2811319a:1357ffeeae3:-7ff9', 'admin', 'B201100041', null, to_timestamp('15-02-2012 16:38:55.270000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('590c39d5:135a95ed98e:-7ffa', '77', '0', null, to_timestamp('23-02-2012 17:02:49.217000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3246673c:1358543fe0c:-7ffd', '3', 'B201100025', null, to_timestamp('16-02-2012 16:44:30.083000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3246673c:1358543fe0c:-7ff7', '3', 'B201100025', null, to_timestamp('16-02-2012 16:45:02.458000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('590c39d5:135a95ed98e:-7ffb', '77', '0', null, to_timestamp('23-02-2012 16:58:21.545000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-7ffe', '3', '0', null, to_timestamp('09-01-2012 09:29:15.313000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('3246673c:1358543fe0c:-7ff8', '3', 'B201100025', null, to_timestamp('16-02-2012 16:44:59.333000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1e66852a:134b12085d4:-7ffd', '222', 'B201100016', null, to_timestamp('06-01-2012 14:07:34.235000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-495edff8:13555b62430:-7ffd', '3', 'B201100099', null, to_timestamp('07-02-2012 11:22:52.619000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ffa', '77', '0', null, to_timestamp('24-02-2012 09:33:10.608000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7ff3', '77', '0', null, to_timestamp('24-02-2012 10:15:52.186000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2ba8fabd:134d4b35db2:-7ff7', '3', '0', null, to_timestamp('13-01-2012 16:46:52.083000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2ba8fabd:134d4b35db2:-7ff6', '3', 'B201100044', null, to_timestamp('13-01-2012 16:47:21.802000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2ba8fabd:134d4b35db2:-7ff5', '3', '0', null, to_timestamp('13-01-2012 16:56:15.662000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2811319a:1357ffeeae3:-7ffd', 'admin', 'B201100041', null, to_timestamp('15-02-2012 16:20:02.739000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2811319a:1357ffeeae3:-7ffb', 'admin', 'B201100000', null, to_timestamp('15-02-2012 16:36:47.848000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-7ffa', '3', '0', null, to_timestamp('06-01-2012 13:24:05.732000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-61802fbb:134b124a05e:-7ff8', '3', '0', null, to_timestamp('06-01-2012 13:30:24.026000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7ff9', '3', 'B201100018', null, to_timestamp('20-02-2012 10:13:47.489000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('18a22d2f:134c07682f2:-7ffd', '88', 'B201100018', null, to_timestamp('09-01-2012 11:17:09.469000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-406e29cd:1355a6dff9d:-8000', '3', '0', null, to_timestamp('08-02-2012 08:47:44.462000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7ff8', '3', 'B201100017', null, to_timestamp('20-02-2012 10:14:28.098000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7ff3', '3', 'B201100018', null, to_timestamp('20-02-2012 10:16:17.426000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1f966765:134c0123f68:-7ff5', '88', '0', null, to_timestamp('09-01-2012 09:45:47.641000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6e27d333:135a3a90c3e:-7ffa', '1122334', 'B201100044', null, to_timestamp('22-02-2012 14:54:36.827000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6e27d333:135a3a90c3e:-7ff9', '1122334', 'B201100044', null, to_timestamp('22-02-2012 14:54:42.358000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6b11a5d8:135a7b9648d:-7ffd', '1122334', '0', null, to_timestamp('23-02-2012 09:04:47.452000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('590c39d5:135a95ed98e:-7ffd', '77', '0', null, to_timestamp('23-02-2012 16:51:59.795000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('590c39d5:135a95ed98e:-7ffc', '77', '0', null, to_timestamp('23-02-2012 16:54:58.873000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-4175093:134c59a72df:-7ffd', '3', 'B201100018', null, to_timestamp('10-01-2012 11:17:06.015000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-4175093:134c59a72df:-7ffc', '3', 'B201100018', null, to_timestamp('10-01-2012 11:17:15.484000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('2ec1bac:13564e8f041:-8000', '3', '0', null, to_timestamp('10-02-2012 09:38:14.319000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-7e6b6565:134e9503e8e:-8000', '222', '0', null, to_timestamp('17-01-2012 09:38:03.333000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-7e6b6565:134e9503e8e:-7ffc', '3', '0', null, to_timestamp('17-01-2012 09:57:50.895000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('590c39d5:135a95ed98e:-7ff8', '77', '0', null, to_timestamp('23-02-2012 17:02:54.327000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7ffd', '3', 'B201100018', null, to_timestamp('20-02-2012 10:10:56.833000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7ffb', '3', 'B201100018', null, to_timestamp('20-02-2012 10:11:33.442000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7ffa', '3', 'B201100018', null, to_timestamp('20-02-2012 10:13:37.192000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7ff7', '3', 'B201100025', null, to_timestamp('20-02-2012 10:14:49.739000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6e27d333:135a3a90c3e:-7ffc', '1122334', '0', null, to_timestamp('22-02-2012 14:34:43.733000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6e27d333:135a3a90c3e:-7ff8', '1122334', 'B201100044', null, to_timestamp('22-02-2012 14:54:46.248000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('590c39d5:135a95ed98e:-7ff6', '77', '0', null, to_timestamp('23-02-2012 17:24:53.217000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-8000', '3', '0', null, to_timestamp('20-02-2012 10:08:12.926000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fe9', '77', '0', null, to_timestamp('24-02-2012 13:28:37.077000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6970152a:135aceabb86:-7fe4', '77', '0', null, to_timestamp('24-02-2012 13:54:54.123000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('6472b95f:13561131c1c:-7ffe', '3', '0', null, to_timestamp('09-02-2012 16:34:59.679000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7fff', '3', '0', null, to_timestamp('20-02-2012 10:09:11.129000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-4175093:134c59a72df:-8000', '3', '0', null, to_timestamp('10-01-2012 11:12:36.765000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('5fa58e31:1357440e330:-7ffd', '3', '0', null, to_timestamp('13-02-2012 14:38:39.429000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7ffe', '3', 'B201100025', null, to_timestamp('20-02-2012 10:10:24.895000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7ff6', '3', 'B201100025', null, to_timestamp('20-02-2012 10:15:07.692000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('9641ba7:1359883f0fb:-7ff4', '3', 'B201100018', null, to_timestamp('20-02-2012 10:16:01.208000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2ba8fabd:134d4b35db2:-7fff', '3', '0', null, to_timestamp('13-01-2012 09:42:43.662000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2ba8fabd:134d4b35db2:-7ffc', '3', '0', null, to_timestamp('13-01-2012 10:06:09.490000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1e66852a:134b12085d4:-7ff9', '222', 'B201100018', null, to_timestamp('06-01-2012 14:28:37.954000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('1e66852a:134b12085d4:-7ff8', '222', 'B201100018', null, to_timestamp('06-01-2012 14:28:43.110000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2ba8fabd:134d4b35db2:-7ffb', '3', '0', null, to_timestamp('13-01-2012 10:10:26.615000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into JW_LOG (id, user_id, biz_id, op_status, op_time, description, days)
values ('-2811319a:1357ffeeae3:-7ff7', 'admin', 'B201100000', null, to_timestamp('15-02-2012 16:57:20.286000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 496 records loaded
prompt Loading JW_M_ROLE_BIZ...
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000016');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000005');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000010');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000006');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000011');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100031');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100032');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100034');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100036');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100003');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100005');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100045');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100099');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100008');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'S000000002');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100001');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100019');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100010');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100007');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100010');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100024');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', '7adf59e3:132f0f4cce8:-8000');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100031');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100034');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100030');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100014');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100037');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100006');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'S000000004');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'S000000003');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100020');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100023');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100025');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '31171d2c:132b99423bf:-8000');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100011');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '598bb5c:132f0a26a93:-8000');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100015');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100027');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '8c840f4:134550cff87:-7fff');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100001');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'S000000004');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '598bb5c:132f0a26a93:-8000');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100020');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100030');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100025');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'S000000007');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100033');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100037');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '2879d6f8:131fa4a7057:-8000');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100029');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100032');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100036');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100005');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100099');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'S000000007');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'S000000002');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100006');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100021');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100012');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100004');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100099');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100030');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100034');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100000');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '3cfebef3:1328edc98f8:-7fed');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100016');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100016');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100001');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000003');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100016');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100021');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100027');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100028');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100029');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100030');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100032');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100035');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100036');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100014');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100037');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100006');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100098');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'S000000008');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'S000000003');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '-585bcf9a:13469b08262:-8000');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100000');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100015');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100017');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100020');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100022');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100025');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100041');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', '-585bcf9a:13469b08262:-8000');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100028');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100012');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100013');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100033');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100035');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100002');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100004');
commit;
prompt 100 records committed...
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100044');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100046');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100007');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'S000000001');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100022');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100041');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100013');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100005');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100008');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100032');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100037');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100000');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100010');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100000');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'S000000005');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100018');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100017');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100018');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100017');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100022');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100023');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100041');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100011');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100012');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100031');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000001');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000002');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100033');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100034');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100002');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100003');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100044');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100045');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'S000000004');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'S000000005');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100007');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100008');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100019');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100024');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '7adf59e3:132f0f4cce8:-8000');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100002');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100045');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'S000000002');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100028');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100031');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100036');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100015');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'S000000008');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100010');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100019');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'S000000006');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100024');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100028');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100013');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100035');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100004');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'B201100046');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'S000000006');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', 'S000000001');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100001');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100016');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100018');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100021');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100023');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100027');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', '31171d2c:132b99423bf:-8000');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100011');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('447f8378:13478d96334:-8000', 'B201100029');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100014');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100003');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100044');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100046');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'S000000001');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'S000000003');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100029');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100033');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', 'B201100035');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100015');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100018');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'B201100006');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000004');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000007');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000008');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000009');
insert into JW_M_ROLE_BIZ (role_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', 'S000000012');
commit;
prompt 185 records loaded
prompt Loading JW_M_ROLE_RES...
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '5', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '4', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '7', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '9', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '11', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '12', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '4', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '5', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '7', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '9', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '10', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'S000000001');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'S000000001');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '6', '7adf59e3:132f0f4cce8:-8000');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '5', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '1', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '5', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '3', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100019');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100020');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100021');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '6', 'B201100021');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100022');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100024');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100025');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100027');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100041');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '9', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '7', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '12', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '8', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100031');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100035');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100036');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100037');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100098');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '6', 'B201100098');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100045');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '4', 'B201100019');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '3', 'B201100020');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '8', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '8', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '13', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '6', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '4', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '2', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '4', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100024');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '1', 'B201100017');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '3', 'B201100017');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '1', '3cfebef3:1328edc98f8:-7fed');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100027');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100041');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '7', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '10', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '6', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100031');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100032');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100033');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100034');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100035');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100036');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100037');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100098');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100045');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'S000000001');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '1', 'B201100019');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '5', 'B201100020');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '5', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '10', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '5', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '10', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '5', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '10', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '8', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '9', '31171d2c:132b99423bf:-8000');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '1', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '2', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100015');
commit;
prompt 100 records committed...
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '4', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100019');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100017');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'B201100017');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '4', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '2', 'B201100017');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', '598bb5c:132f0a26a93:-8000');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '5', '598bb5c:132f0a26a93:-8000');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100019');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100020');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100020');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100021');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100021');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '7', 'B201100021');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100022');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100022');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100023');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100023');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100024');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100025');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100027');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100041');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '6', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '9', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '10', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100031');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100032');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100033');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100034');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100035');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100036');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100037');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100098');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100046');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'S000000001');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('447f8378:13478d96334:-8000', '2', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('447f8378:13478d96334:-8000', '5', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '2', 'B201100019');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '1', 'B201100020');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '1', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '6', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '2', 'B201100045');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100017');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '4', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '6', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '7', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '9', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '4', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '6', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '3', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '8', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '1', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100017');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '9', '31171d2c:132b99423bf:-8000');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '3', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '2', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100024');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100025');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100027');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100027');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100041');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100041');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '8', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '10', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '6', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '8', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '11', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '13', 'B201100029');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '7', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '9', 'B201100030');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100031');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100031');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100032');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100032');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100033');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100033');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100034');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100034');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100035');
commit;
prompt 200 records committed...
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100035');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100036');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100037');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100098');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100098');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'B201100046');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100045');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '1', 'S000000001');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '1', '-585bcf9a:13469b08262:-8000');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('447f8378:13478d96334:-8000', '3', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('447f8378:13478d96334:-8000', '4', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'S000000001');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100017');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100015');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'B201100017');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '2', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '1', 'B201100020');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100019');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '5', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '3', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '5', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100019');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100018');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100020');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '5', 'B201100020');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100021');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100021');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '8', 'B201100021');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100022');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '4', 'B201100022');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '2', 'B201100023');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7ffe', '3', 'B201100023');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '2', '-585bcf9a:13469b08262:-8000');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('447f8378:13478d96334:-8000', '1', 'B201100016');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '3', 'B201100019');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '5', 'B201100019');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '2', 'B201100020');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '4', 'B201100020');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '2', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '4', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '7', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '9', 'B201100028');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '1', 'B201100045');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('3cfebef3:1328edc98f8:-7ff5', '3', 'B201100045');
insert into JW_M_ROLE_RES (role_id, res_id, biz_id)
values ('29d4bcde:1326b18d4bf:-7fff', '3', 'B201100015');
commit;
prompt 248 records loaded
prompt Loading JW_ROLE...
insert into JW_ROLE (role_id, role_name, role_desc, change_date)
values ('29d4bcde:1326b18d4bf:-7fff', '角色1', '1', '20120223171903');
insert into JW_ROLE (role_id, role_name, role_desc, change_date)
values ('3cfebef3:1328edc98f8:-7ff5', '角色3', '角色3', '20120223171903');
insert into JW_ROLE (role_id, role_name, role_desc, change_date)
values ('447f8378:13478d96334:-8000', '角色5', '测试角色', '20120217144956');
insert into JW_ROLE (role_id, role_name, role_desc, change_date)
values ('29d4bcde:1326b18d4bf:-7ffe', '角色2', '2', '20120223171903');
insert into JW_ROLE (role_id, role_name, role_desc, change_date)
values ('-585bcf9a:13469b08262:-7fff', '角色4', '测试', '20111223153606');
commit;
prompt 5 records loaded
prompt Loading JW_SPCJ...
insert into JW_SPCJ (id, description, videoname, createtime, device_id, length)
values (202, '来自android 终端的视频', 'video_1308114367659.3gp', to_date('15-06-2011 13:05:45', 'dd-mm-yyyy hh24:mi:ss'), '3', '46.92K');
insert into JW_SPCJ (id, description, videoname, createtime, device_id, length)
values (221, '来自android 终端的视频', 'video_1308555686529.3gp', to_date('20-06-2011 15:41:25', 'dd-mm-yyyy hh24:mi:ss'), '3', '146.943K');
insert into JW_SPCJ (id, description, videoname, createtime, device_id, length)
values (201, '来自android 终端的视频', 'video_1308106765753.3gp', to_date('15-06-2011 10:59:05', 'dd-mm-yyyy hh24:mi:ss'), '3', '46.139K');
insert into JW_SPCJ (id, description, videoname, createtime, device_id, length)
values (203, '来自android 终端的视频', 'video_1308115281450.3gp', to_date('15-06-2011 13:20:56', 'dd-mm-yyyy hh24:mi:ss'), '3', '30.897K');
insert into JW_SPCJ (id, description, videoname, createtime, device_id, length)
values (241, '来自android 终端的视频', 'video_1308739154626.3gp', to_date('22-06-2011 18:39:25', 'dd-mm-yyyy hh24:mi:ss'), '3', '80.842K');
insert into JW_SPCJ (id, description, videoname, createtime, device_id, length)
values (321, '来自android 终端的视频', 'video_1311660502293.3gp', to_date('26-07-2011 14:08:27', 'dd-mm-yyyy hh24:mi:ss'), '3', '91.273K');
commit;
prompt 6 records loaded
prompt Loading JW_SPJK...
insert into JW_SPJK (id, ip, port, point, jk_state, order_id, description)
values ('1', '10.10.11.55', '19531', '2', 'Y', 1, '太白南路');
insert into JW_SPJK (id, ip, port, point, jk_state, order_id, description)
values ('4d9d84e7:135565a148d:-7fb3', '192.168.43.45', '8081', 'TT', 'Y', 2, '2');
insert into JW_SPJK (id, ip, port, point, jk_state, order_id, description)
values ('3', '10.10.11.55', '19531', '3', 'Y', 3, '公司大厅');
insert into JW_SPJK (id, ip, port, point, jk_state, order_id, description)
values ('2', '10.10.11.55', '19531', '1', 'Y', 2, '榆林视频服务器');
commit;
prompt 4 records loaded
prompt Loading JW_TPCJ...
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (3, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (4, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (5, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (6, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (7, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (8, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (9, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (10, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (11, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (12, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (13, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (14, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (15, '13', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (16, '12', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (17, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (18, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (1, '张张张张张张张张在大在在在在在大在在在在在在在在在', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (161, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (162, '1', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (105, '照片', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (106, '小时候车', 'picture_1308104243688.jpg', 3, to_date('05-05-2011 10:19:44', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (101, 'ytest', 'picture_1308104243688.jpg', 3, to_date('15-06-2011 10:18:08', 'dd-mm-yyyy hh24:mi:ss'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (103, 'TT2', 'picture_1308104243688.jpg', 3, to_date('16-06-2011', 'dd-mm-yyyy'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (102, 'TT', 'picture_1308104243688.jpg', 3, to_date('15-06-2011', 'dd-mm-yyyy'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (104, 'TT3', 'picture_1308104243687pg', 3, to_date('17-06-2011', 'dd-mm-yyyy'), '3');
insert into JW_TPCJ (id, description, picturename, createuserid, createtime, device_id)
values (115, 'TT4', 'picture_1308104243688.jpg', 3, to_date('16-06-2011 23:59:59', 'dd-mm-yyyy hh24:mi:ss'), '3');
commit;
prompt 26 records loaded
prompt Loading JW_TZTG...
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (646, 'aaaa<>''''s', '1', 'aaaaa', 'admin', to_date('06-02-2012', 'dd-mm-yyyy'), '1', '0001', null, '333333split', '1,', '121221split', 'yttttt,', '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (681, '1111', '1', '111111', '-3d363c2c:1355fe3b4aa:-8000', to_date('10-02-2012 10:33:09', 'dd-mm-yyyy hh24:mi:ss'), '1', '11001', null, null, null, 'aasplitaa11split', 'aaxs,a1,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (682, '111111', '2', '111122', '-3d363c2c:1355fe3b4aa:-8000', to_date('10-02-2012 10:33:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (683, '121212', '3', '1212121', '-3d363c2c:1355fe3b4aa:-8000', to_date('10-02-2012 10:33:40', 'dd-mm-yyyy hh24:mi:ss'), '1', '11001', null, null, null, 'aasplitaa11splittttsplit', 'aaxs,a1,ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (741, '测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊', '1', '测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊测试长度啊', 'admin', to_date('16-02-2012 10:34:37', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', '部门通讯录_1329294566531.xls', '222split', '测试测试1112,', 'aaasplitaaa3split', 'aaa3dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd,aaa3,', '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (802, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (721, '测试lemon1', '1', '测试lemona', 'admin', to_date('16-02-2012 10:36:49', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', 'a_1329353716500.png', '12split', 'cccc1,', '00011split', 'unit_test,', '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (781, 'ttttte', '1', 'aa', '-beeb56c:11ce53e3927:-7feb', to_date('16-02-2012 10:33:56', 'dd-mm-yyyy hh24:mi:ss'), '1', '11000', null, '1split1split1split1split1split1split1split1split1split1split1split1split1split1split1split1split1split1split1split1split1split1split', '1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1131,1132,1133,', '0008split', '三科,', '王五', '市局部门');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (803, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (804, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (805, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (806, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (807, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (808, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (809, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (810, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (811, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (812, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (813, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (814, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (815, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (816, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (817, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (818, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (819, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (820, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (821, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (822, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (823, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (824, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (825, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (826, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (827, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (828, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (829, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (830, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (831, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (832, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (833, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (701, '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', '1', 'dff', 'admin', to_date('16-02-2012 10:35:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', '924149e4jw1dpthcwm2rkg_1329211584750.gif', '12split', 'cccc1,', 'aaasplitaaa3split', 'aaa3dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd,aaa3,', '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (664, 'CCC', '2', 'SASDA', 'admin', to_date('07-02-2012 13:15:42', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', null, '123456split', '测试测试111,', '11001split', '市局3,', '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (643, 'aaaaAAcc', '2', 'aaaaa', 'admin', to_date('16-02-2012 10:35:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', null, '333333split', '1,', '121221split', 'yttttt,', '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (684, '121212', '2', 'aaa', '-beeb56c:11ce53e3927:-7feb', to_date('16-02-2012 10:32:53', 'dd-mm-yyyy hh24:mi:ss'), '1', '11000', 'imageinfo_add_1329359523578.jsp', null, null, 'tttsplit', 'ttt111,', '王五', '市局部门');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (703, 'as01234567801345678901234567890123456789123456789101234567890123456789012345678901234567890123456789', '2', 'a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a01234567890134567890123456789012345678912345678910123456789012345689012345678901234567890123456789d', 'admin', to_date('23-02-2012 09:33:27', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', 'oraclTempdata说明_1329878348593.txt', null, null, null, null, '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (687, '11212', '1', 'aaa7', '3fec0ccf:13560e55954:-7fff', to_date('10-02-2012 10:55:30', 'dd-mm-yyyy hh24:mi:ss'), '1', '413e01e9:1342165bba4:-7ffe', null, null, null, 'aa11split', 'a1,', '777777', 'aaxs');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (782, 'a测试数据a', '2', 'updateJwUserLockState', 'admin', to_date('16-02-2012 11:41:39', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', '文本_1329363690171.txt', '55555split', '新增人员1,', '0001split00011split0002split0004splitaasplitaa11splitaaaaa11splittttsplit0005split0008split0009split0011ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddsplit0003split0006split0007split222split11001split11111211split11111split56split15splitdfssplit121splithhh1split41651splitfdsfd splitdsfsplitfsdsplitweeesplitddfsplitfdgdfssplit0101split44400split311111split411111split511111split21111split5541split34567300split', '市局,unit_test,市局部门,一科,aaxs,a1,aaaaa11,ttt111,二科,三科,四科,五科aas,分县局,一队,二队,市局3,市局3,宝鸡111,aaaaasss,县局,镇公安局,区局,12,2121, 县公安局ss,dsfsd1,fdsf,sdfsd,fdsf,dfsdf,dfdg,测试单位,西安,宝鸡2,宝鸡3,宝鸡4,宝鸡3,ttt,宝鸡,', '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (521, 'TEST1', '1', 'TEST1', 'admin', to_date('24-10-2011 09:33:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', 'D:\', '5split2split1split3split', '警务测试用户0,警务测试用户1,警务测试用户4,警务测试用户5,', '0002split0004split0005split0008split0009split', '市局部门,一科,二科,三科,四科,', '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (587, '1111', '1', '1111', 'admin', to_date('22-11-2011 15:53:10', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', 'D:\Android中文翻译组——Android开发者指南（1）.chm', '5split', '警务测试用户0,', null, null, '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (626, '1111110000', '1', '455646454654600000', 'admin', to_date('20-12-2011 17:53:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', null, null, null, '0002split', 'êD??2???,', '3???1üàí?±', '?ù×é?ˉμ￥?a');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (523, '开会', '1', '任命大会', 'admin', to_date('10-11-2011 09:33:34', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', 'D:\', '5split2split1split3split', '?ˉ??2aê?ó??§0,?ˉ??2aê?ó??§1,?ˉ??2aê?ó??§4,?ˉ??2aê?ó??§5,', '0002split0004split0005split0008split0009split', 'êD??2???,ò???,?t??,èy??,????,', '3???1üàí?±', '?ù×é?ˉμ￥?a');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (541, '测试通告', '3', '的发放大方法v', 'admin', to_date('27-10-2011 17:10:03', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', null, '6split4split5split2split1split3split', '警务测试用户2,警务测试用户3,警务测试用户0,警务测试用户1,警务测试用户4,警务测试用户5,', '0002split0004split0005split0008split0009split', '市局部门,一科,二科,三科,四科,', '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (542, '会议通知', '3', '啊的说法发得分大飞洒发第三方', 'admin', to_date('27-10-2011 17:13:21', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', null, '6split4split5split2split1split3split', '警务测试用户2,警务测试用户3,警务测试用户0,警务测试用户1,警务测试用户4,警务测试用户5,', '0001split0002split0004split0005split0008split0009split0003split0006split0007split222split11001split11111211split56split15splitdfssplit121split41651splitfdsfd splitdsfsplitfsdsplitweeesplitddfsplitfdgdfssplit44400split311111split411111split511111split21111split34567300split', '市局,市局部门,一科,二科,三科,四科,分县局,一队,二队,市局3,市局3,宝鸡111,县局,镇公安局,区局,12, 县公安局ss,dsfsd1,fdsf,sdfsd,fdsf,dfsdf,dfdg,西安,宝鸡2,宝鸡3,宝鸡4,宝鸡3,宝鸡,', '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (561, ' 接受任务', '2', '御敌 345345435', 'admin', to_date('22-11-2011 15:30:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', 'D:\JwUserAC.java', '6split4split', '警务测试用户2,警务测试用户3,', '0003split0006split0007split', '分县局,一队,二队,', '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (625, '0000000000000', '1', '0000000000000', 'admin', to_date('30-11-2011 17:53:07', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', null, null, null, '0002split', '市局部门,', '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (641, 'aaaa', '1', 'aaaaa', 'admin', to_date('06-02-2012 14:41:08', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', null, '333333split', '1,', '121221split', 'yttttt,', '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (702, 'a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789', '1', 'c012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789a012345678901345678901234567890123456789123456789101234567890123456789012345678901234567890123456789', 'admin', to_date('23-02-2012 09:32:36', 'dd-mm-yyyy hh24:mi:ss'), '1', '00000', null, null, null, null, null, '超级管理员', '根组织单元');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (685, '11', '1', '12121', '3fec0ccf:13560e55954:-7fff', to_date('10-02-2012 10:50:58', 'dd-mm-yyyy hh24:mi:ss'), '1', '413e01e9:1342165bba4:-7ffe', null, null, null, 'aa11split', 'a1,', '777777', 'aaxs');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (686, '啊啊啊啊嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷啊啊啊啊嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷', '3', '啊啊啊啊嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷啊啊啊啊嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷嗷', '-beeb56c:11ce53e3927:-7feb', to_date('16-02-2012 10:30:13', 'dd-mm-yyyy hh24:mi:ss'), '1', '11000', null, '55555split', '测试用户,', 'aa11split', 'a1,', '王五', '市局部门');
insert into JW_TZTG (id, title, type, content, senduserid, sendtime, sendstatus, senddeptid, uploadfilename, reqdevice_id, requsername, reqdeptid, reqdeptname, sendusername, senddeptname)
values (801, '嗷嗷嗷', '1', '啊', '-3d363c2c:1355fe3b4aa:-8000', null, '0', '11001', null, null, null, 'tttsplit', 'ttt111,', '111222', '一科');
commit;
prompt 59 records loaded
prompt Loading JW_TZTGUSER...
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (662, 0, 686, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (622, 0, 664, '123456', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (665, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (664, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (669, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (670, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (674, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (675, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (679, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (601, 0, 641, '333333', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (680, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (684, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (690, 0, 782, '123456', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (695, 0, 782, '12', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (700, 0, 782, 'A1000020A12CE4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (705, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (712, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (717, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (722, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (727, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (732, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (743, 0, 782, '5', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (748, 0, 782, '2', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (753, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (765, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (770, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (775, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (780, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (783, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (785, 0, 782, '333333', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (791, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (796, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (801, 0, 782, 's', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (806, 0, 782, 'aaa111aa', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (809, 0, 782, '4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (813, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (818, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (823, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (828, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (839, 0, 782, '44', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (844, 0, 782, '88888888', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (849, 0, 782, '3', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (854, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (857, 0, 782, '6', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (861, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (866, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (871, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (876, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (882, 0, 782, 'w', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (890, 0, 782, '5', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (895, 0, 782, '2', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (900, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (912, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (918, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (924, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (932, 0, 782, '333333', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (936, 0, 782, '222', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (939, 0, 782, '5', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (941, 0, 782, '123111230012276', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (944, 0, 782, '2', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (946, 0, 782, 'lemon', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (949, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (951, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (954, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (958, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (961, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (963, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (966, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (968, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (971, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (973, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (976, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (978, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (979, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (981, 0, 782, '333333', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (982, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (983, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (667, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (671, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (672, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (676, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (677, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (661, 0, 686, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (681, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (682, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (666, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (685, 0, 741, '222', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (686, 0, 643, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (687, 0, 643, '333333', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (688, 0, 701, '12', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (691, 0, 782, '222', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (693, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (696, 0, 782, '123111230012276', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (698, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (701, 0, 782, 'lemon', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (703, 0, 782, 's', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (706, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (708, 0, 782, 'aaa111aa', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (709, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (711, 0, 782, '4', null);
commit;
prompt 100 records committed...
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (713, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (715, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (718, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (720, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (723, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (725, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (728, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (730, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (733, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (737, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (738, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (739, 0, 782, '123456', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (740, 0, 782, '222', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (744, 0, 782, '12', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (745, 0, 782, '123111230012276', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (749, 0, 782, 'A1000020A12CE4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (750, 0, 782, 'lemon', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (754, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (755, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (758, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (761, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (762, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (766, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (767, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (771, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (772, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (776, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (777, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (781, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (782, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (786, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (787, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (789, 0, 782, '222', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (794, 0, 782, '123111230012276', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (799, 0, 782, 'lemon', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (804, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (807, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (811, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (816, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (821, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (826, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (831, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (835, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (836, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (840, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (845, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (850, 0, 782, 's', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (855, 0, 782, 'aaa111aa', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (858, 0, 782, '4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (862, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (867, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (872, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (877, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (887, 0, 782, '222', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (892, 0, 782, '123111230012276', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (897, 0, 782, 'lemon', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (902, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (905, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (909, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (914, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (920, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (926, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (930, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (933, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (788, 0, 782, '123456', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (790, 0, 782, '44', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (793, 0, 782, '12', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (795, 0, 782, '88888888', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (798, 0, 782, 'A1000020A12CE4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (800, 0, 782, '3', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (803, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (805, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (808, 0, 782, '6', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (810, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (812, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (815, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (817, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (820, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (822, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (825, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (827, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (830, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (833, 0, 782, 'w', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (837, 0, 782, '123456', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (841, 0, 782, '5', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (842, 0, 782, '12', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (846, 0, 782, '2', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (847, 0, 782, 'A1000020A12CE4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (851, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (852, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (859, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (863, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (864, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (868, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (869, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (873, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (874, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (878, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (879, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (881, 0, 782, '1', null);
commit;
prompt 200 records committed...
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (883, 0, 782, '333333', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (886, 0, 782, '123456', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (888, 0, 782, '44', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (891, 0, 782, '12', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (893, 0, 782, '88888888', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (896, 0, 782, 'A1000020A12CE4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (898, 0, 782, '3', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (901, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (903, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (906, 0, 782, '6', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (908, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (910, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (913, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (915, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (919, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (921, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (925, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (927, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (934, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (935, 0, 782, '123456', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (938, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (940, 0, 782, '12', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (943, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (945, 0, 782, 'A1000020A12CE4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (948, 0, 782, 's', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (950, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (953, 0, 782, 'aaa111aa', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (956, 0, 782, '4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (957, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (960, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (962, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (965, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (967, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (970, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (972, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (975, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (977, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (694, 0, 782, '5', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (699, 0, 782, '2', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (704, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (716, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (522, 0, 521, '4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (721, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (523, 0, 521, '5', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (726, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (525, 0, 521, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (541, 0, 541, '6', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (547, 0, 541, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (555, 0, 542, '6', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (560, 0, 542, '3', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (562, 0, 561, '333333', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (521, 0, 521, '6', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (544, 0, 541, '4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (551, 0, 542, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (558, 0, 542, '2', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (563, 0, 561, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (571, 0, 587, '5', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (583, 0, 625, '4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (524, 0, 521, '2', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (542, 0, 541, '4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (543, 0, 541, '6', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (548, 0, 541, '3', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (550, 0, 542, '2', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (554, 0, 542, '4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (557, 0, 542, '5', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (565, 0, 561, '4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (526, 0, 521, '3', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (545, 0, 541, '5', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (552, 0, 542, '3', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (559, 0, 542, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (564, 0, 561, '6', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (581, 0, 625, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (546, 0, 541, '2', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (549, 0, 542, '5', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (553, 0, 542, '6', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (556, 0, 542, '4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (582, 0, 625, '6', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (731, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (734, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (736, 0, 782, '333333', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (741, 0, 782, '44', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (746, 0, 782, '88888888', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (751, 0, 782, '3', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (756, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (759, 0, 782, '6', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (763, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (768, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (773, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (778, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (784, 0, 782, 'w', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (673, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (678, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (683, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (689, 0, 721, '12', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (692, 0, 782, '44', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (663, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (668, 0, 781, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (697, 0, 782, '88888888', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (702, 0, 782, '3', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (707, 0, 782, '56856', null);
commit;
prompt 300 records committed...
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (710, 0, 782, '6', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (714, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (719, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (724, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (729, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (735, 0, 782, 'w', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (742, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (747, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (752, 0, 782, 's', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (757, 0, 782, 'aaa111aa', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (760, 0, 782, '4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (764, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (769, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (774, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (779, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (792, 0, 782, '5', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (797, 0, 782, '2', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (802, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (814, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (819, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (824, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (829, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (832, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (834, 0, 782, '333333', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (838, 0, 782, '222', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (843, 0, 782, '123111230012276', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (848, 0, 782, 'lemon', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (853, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (856, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (860, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (865, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (870, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (875, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (880, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (884, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (885, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (889, 0, 782, '55555', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (894, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (899, 0, 782, 's', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (904, 0, 782, 'aaa111aa', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (907, 0, 782, '4', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (911, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (916, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (917, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (922, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (923, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (928, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (929, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (931, 0, 782, 'w', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (937, 0, 782, '44', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (942, 0, 782, '88888888', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (947, 0, 782, '3', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (952, 0, 782, '56856', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (955, 0, 782, '6', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (959, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (964, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (969, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (974, 0, 782, '1', null);
insert into JW_TZTGUSER (id, readstatus, noticeid, device_id, receivetime)
values (980, 0, 782, 'w', null);
commit;
prompt 359 records loaded
prompt Loading JW_TZTG_READ_INFO...
prompt Table is empty
prompt Loading JW_UPDATE...
insert into JW_UPDATE (id, name, name_copy, time, description, version, state)
values ('-2da9eb95:134c521cb2d:-7fff', 'xasjw.apk', '1326157253484.apk', to_date('10-01-2012 09:01:09', 'dd-mm-yyyy hh24:mi:ss'), '更新程序', '1.3', '1');
insert into JW_UPDATE (id, name, name_copy, time, description, version, state)
values ('19330043:13339b49dbe:-7ffd', 'xajw.apka', '1319523129218.apk', to_date('28-12-2011 16:09:28', 'dd-mm-yyyy hh24:mi:ss'), '更新程序', '1.2', '0');
commit;
prompt 2 records loaded
prompt Loading JW_USER...
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-665bfc18:13575e15ce9:-8000', '陈', 'c6f057b86584942e4154', '18049200680', 'A1000020A12CE4', '80062f10', '4', '0001', '000', 'M', '测试', '3cfebef3:1328edc98f8:-7ff5', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7ff6', '1115', 'fd1f3a205d3bede3b9bc', '1', '1', '1', '1', '0004', '1115', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7ff2', '1119', '3f57b0e5e1b53e2d1822', '1', '1', '1', '1', '0004', '1119', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7ff7', '1114', '4339c7b894b1d99bd1b6', '1', '1', '1', '1', '0004', '1114', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7ff1', '1120', '6388a5a172cd360a2e55', '1', '1', '1', '1', '0004', '1120', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7fed', '1124', '44af1e0fc44169bc652e', '1', '1', '1', '1', '0004', '1124', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7fec', '1125', '443f18fb833a94ceed28', '1', '1', '1', '1', '0004', '1125', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7fe8', '1129', '74b9b28887982883d207', '1', '1', '1', '1', '0004', '1129', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7fe7', '1130', 'fc4455c28404a2477ffc', '1', '1', '1', '1', '0004', '1130', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-3947f7a7:135a326c2ca:-7fff', 'rrr', 'c4ca4238a0b923820dcc', '1', '1', '1', '1', '121221', '111122fffff', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-3947f7a7:135a326c2ca:-7ffe', 'ttt', 'c4ca4238a0b923820dcc', '1', '1', '1', '1', '121221', '1221ssss', 'F', '11', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('6e27d333:135a3a90c3e:-8000', 'aa11', 'c4ca4238a0b923820dcc', '1', '1', '1', '1', '-3ca57892:135650b4959:-7ffd', '11aaa', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('6e27d333:135a3a90c3e:-7fff', '12', 'eccbc87e4b5ce2fe2830', '1', '11', '1', '1', '0002', '1122334', 'F', '1', '29d4bcde:1326b18d4bf:-7ffe', to_date('23-02-2012 09:32:29', 'dd-mm-yyyy hh24:mi:ss'), '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-31e7b05:1355fcad897:-7ff2', 'ccc', '202cb962ac59075b964b', '13226458945', 's', 's', '1', '0001', 'ccc', 'F', 'ccc', '3cfebef3:1328edc98f8:-7ff5', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('70d4d915:135654e6de2:-7ffe', 'cccc1', 'c4ca4238a0b923820dcc', '13333333333', '12', '1', '1', 'tttt', 'ccccc1', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7ff9', '1112', 'c4ca4238a0b923820dcc', '1', '1', '1', '1', '0004', '1112', 'F', '1', '3cfebef3:1328edc98f8:-7ff5', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7ff8', '1113', 'c4ca4238a0b923820dcc', '1', '1', '1', '1', '0004', '1113', 'F', '1', '29d4bcde:1326b18d4bf:-7fff', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7ff5', '1116', '24b576325d4b858da1f6', '1', '1', '1', '1', '0004', '1116', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7ff3', '1118', '70bd57f00b7dc4884dc2', '1', '1', '1', '1', '0004', '1118', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7ff0', '1121', '62d5ee197268c22dfd97', '1', '1', '1', '1', '0004', '1121', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7fee', '1123', '5fd3f1f27bb0897b9bef', '1', '1', '1', '1', '0004', '1123', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7feb', '1126', '865336046144654def10', '1', '1', '1', '1', '0004', '1126', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7fe9', '1128', '4544b0034b44c0160b04', '1', '1', '1', '1', '0004', '1128', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-31e7b05:1355fcad897:-7ff1', 'QQqqqqq', '202cb962ac59075b964b', '13226584698', 'w', 'w', '1', '0003', 'qqqqq', 'F', 'w', '3cfebef3:1328edc98f8:-7ff5', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('70d4d915:135654e6de2:-7ffd', '11cccc', 'c4ca4238a0b923820dcc', '1', '1', '1', '1', '121221', '22cc', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7fe6', '1131', 'b209fe19579e2853517c', '1', '1', '1', '1', '0004', '1131', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7fe4', '1133', '9ce0abcc85a2cc09bba0', '1', '1', '1', '1', '0004', '1133', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-3947f7a7:135a326c2ca:-8000', '3', 'eccbc87e4b5ce2fe2830', '1', '1', '1', '1', 'aaa', '1333', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-2e5ab62b:1355b9b1d01:-7fff', '876', 'c4ca4238a0b923820dcc', '5678', '56856', '78678', '1', '0001', 'aaaaaaaq', 'F', '56856', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7ff4', '1117', '8700a3d68122c73c6cc3', '1', '1', '1', '1', '0004', '1117', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7fef', '1122', '4f0839cabf461257bf93', '1', '1', '1', '1', '0004', '1122', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7fea', '1127', 'bf32167d0385b4f2be22', '1', '1', '1', '1', '0004', '1127', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-627dffca:13579850b7c:-7fe5', '1132', '3c2864662474b5dc87bf', '1', '1', '1', '1', '0004', '1132', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('e20cf99:1340d2eb33b:-8000', '测试测试111', 'e10adc3949ba59abbe56', '123456', '123456', '123456', '4', '0001', '123456', 'M', '123456', '29d4bcde:1326b18d4bf:-7fff', null, '1', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-10577269:1338b7284ef:-7ffd', '12a', '1', '12345678900', 'aaa111aa', 'bb', '2', '0001', 'bbb111', 'M', 'aaass', '447f8378:13478d96334:-8000', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('2b70bf0:133336e2f58:-7ffe', '88', '88', '13312345678', 'A1000020A12CE4', '88', '1', '610100020000', '88', 'F', '88', '29d4bcde:1326b18d4bf:-7fff', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-10577269:1338b7284ef:-7ffe', 'aaaaaa1', '1', '5689', '56856', '78679', '1', '0001', '1', 'F', '56856', null, to_date('23-11-2011 15:52:49', 'dd-mm-yyyy hh24:mi:ss'), '1', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-3afc9a3c:132f0b3b93d:-8000', '警务测试用户5', '3', '3', '3', '3', '1', '0001', '3', 'F', '3', '3cfebef3:1328edc98f8:-7ff5', to_date('25-10-2011 10:10:00', 'dd-mm-yyyy hh24:mi:ss'), '2', 3);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-f5d9eb9:132a9972f8b:-8000', '警务测试用户4', '1', '1', '1', '1', '1', '0001', '12', 'F', '1', null, to_date('23-11-2011 15:52:49', 'dd-mm-yyyy hh24:mi:ss'), '1', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('48fe9eb5:132ebb4bb9b:-8000', '警务测试用户1', 'admin', '2', '123111230012276', '2', '1', '0001', 'admin', 'F', '2', '29d4bcde:1326b18d4bf:-7ffe', to_date('15-02-2012 17:30:43', 'dd-mm-yyyy hh24:mi:ss'), '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('5ec89d92:13323cbbc93:-8000', '警务测试用户0', '1', '1', '5', '1', '1', '0001', '222', 'F', '1', '29d4bcde:1326b18d4bf:-7fff', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-585d5b7c:1336c66b549:-8000', '1', '22', '1', '1', '1', '1', '610100000000', '11', 'F', '1', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-10577269:1338b7284ef:-7fff', 'aaaaaa', '1', '5678', '56856', '78678', '1', '0001', 'aaaaa', 'F', '56856', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('5591591f:133afef5f4b:-8000', 'ttt', 'ttt', '212', '12', '2121', '1', '0001', 'ttt', 'F', 'ttt', '29d4bcde:1326b18d4bf:-7fff', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('e20cf99:1340d2eb33b:-7ffe', '3', 'f7177163c833dff4b38f', '44', '44', '44', '1', '0001', '444', 'F', '44', '29d4bcde:1326b18d4bf:-7fff', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-4ebd100c:134365246f9:-8000', 'lemon', '3f24e567591e9cbab2a7', '123', 'lemon', 'lemon', '1', '0001', 'lemon', 'M', 'lemon', '29d4bcde:1326b18d4bf:-7fff', null, '0', 1);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('5591591f:133afef5f4b:-7fff', '1', '1111', '122222', '333333', '333333', '1', '0006', 'wwwwwww', 'F', '33333', '3cfebef3:1328edc98f8:-7ff5', null, '1', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('1197648c:13361d92b1b:-8000', 'aa', '123', '15088888888', '88888888', '88888888', '3', '0001', '123', 'F', '88888888', '29d4bcde:1326b18d4bf:-7fff', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-db59aa5:13386c5b266:-8000', '111', '111', '11', '1', '1', '1', '0007', '111', 'F', '11', '3cfebef3:1328edc98f8:-7ff5', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('e20cf99:1340d2eb33b:-7fff', '测试测试1112', 'bcbe3365e6ac95ea2c03', '222', '222', '22', '1', '0001', '1116666', 'F', '22', '29d4bcde:1326b18d4bf:-7ffe', null, '2', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-ddc1349:134643e48e0:-8000', '2', 'c81e728d9d4c2f636f06', '2', '2', '2', '1', '0001', '2', 'F', '2', '29d4bcde:1326b18d4bf:-7ffe', null, '1', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('2eeafc5a:133251ad3b8:-8000', '警务测试用户2', '123', '1', '6', '1', '1', '0002', 'test22', 'F', '1', '29d4bcde:1326b18d4bf:-7fff', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('1420cf81:13324310efe:-8000', '警务测试用户3', 'test', '1', '4', '1', '1', '0002', 'test', 'F', '1', '29d4bcde:1326b18d4bf:-7fff', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('-10577269:1338b7284ef:-7ffe', 'aaaaaa1', '1', '5678', '56856', '78678', '1', '0001', 'aaaaa1', 'F', '56856', null, null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('54d0cf6e:135a7fc4315:-8000', '77', '28dd2c7955ce92645624', '77', '77', '77', '1', '0001', '77', 'M', '77', '29d4bcde:1326b18d4bf:-7fff', to_date('24-02-2012 15:20:22', 'dd-mm-yyyy hh24:mi:ss'), '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('7734d31f:13415f82e4c:-8000', '新增人员1', 'c5fe25896e49ddfe996d', '13227893333', '55555', '55555', '4', '0001', '77777', 'M', '新增人员描述', '29d4bcde:1326b18d4bf:-7fff', null, '0', 0);
insert into JW_USER (id, name, psw, sjhm, sjcm, jmkh, jz, xzqh, account, xb, description, jw_role_id, loadtime, islocked, login_failed_count)
values ('70d4d915:135654e6de2:-7ffc', '11222cccc', 'c4ca4238a0b923820dcc', '1', '1', '1', '1', 'aa11', '4456', 'F', '1', null, null, '0', 0);
commit;
prompt 57 records loaded
prompt Loading SYSTEM_MAP...
insert into SYSTEM_MAP (key, value, type)
values ('3', '增加', 'business');
insert into SYSTEM_MAP (key, value, type)
values ('2', '查询', 'business');
insert into SYSTEM_MAP (key, value, type)
values ('1', '列表菜单', 'business');
insert into SYSTEM_MAP (key, value, type)
values ('0', '平铺菜单', 'business');
insert into SYSTEM_MAP (key, value, type)
values ('0', '不验证', 'validate');
insert into SYSTEM_MAP (key, value, type)
values ('1', '非空验证', 'validate');
insert into SYSTEM_MAP (key, value, type)
values ('2', '身份证验证', 'validate');
insert into SYSTEM_MAP (key, value, type)
values ('3', '手机验证', 'validate');
insert into SYSTEM_MAP (key, value, type)
values ('4', '固定电话', 'validate');
insert into SYSTEM_MAP (key, value, type)
values ('5', '数字验证', 'validate');
insert into SYSTEM_MAP (key, value, type)
values ('6', '日期验证', 'validate');
insert into SYSTEM_MAP (key, value, type)
values ('7', '特殊字符验证', 'validate');
insert into SYSTEM_MAP (key, value, type)
values ('0', 'like', 'condition');
insert into SYSTEM_MAP (key, value, type)
values ('1', '>', 'condition');
insert into SYSTEM_MAP (key, value, type)
values ('2', '<', 'condition');
insert into SYSTEM_MAP (key, value, type)
values ('3', '=', 'condition');
insert into SYSTEM_MAP (key, value, type)
values ('1', '男', 'XB');
insert into SYSTEM_MAP (key, value, type)
values ('2', '女', 'XB');
insert into SYSTEM_MAP (key, value, type)
values ('1', '否', 'isnull');
insert into SYSTEM_MAP (key, value, type)
values ('1', '否', 'isleaf');
insert into SYSTEM_MAP (key, value, type)
values ('0', '是', 'isleaf');
insert into SYSTEM_MAP (key, value, type)
values ('0', '是', 'isnull');
insert into SYSTEM_MAP (key, value, type)
values ('1', '否', 'isshow');
insert into SYSTEM_MAP (key, value, type)
values ('0', '是', 'isshow');
insert into SYSTEM_MAP (key, value, type)
values ('0', '详细', 'relatetype');
insert into SYSTEM_MAP (key, value, type)
values ('1', '列表', 'relatetype');
insert into SYSTEM_MAP (key, value, type)
values ('8', '其他', 'QCLB');
insert into SYSTEM_MAP (key, value, type)
values ('7', '血检/尿检', 'QCLB');
insert into SYSTEM_MAP (key, value, type)
values ('6', '拖移机动车', 'QCLB');
insert into SYSTEM_MAP (key, value, type)
values ('5', '收缴物品', 'QCLB');
insert into SYSTEM_MAP (key, value, type)
values ('4', '扣留行驶证', 'QCLB');
insert into SYSTEM_MAP (key, value, type)
values ('3', '扣留驾驶证', 'QCLB');
insert into SYSTEM_MAP (key, value, type)
values ('2', '扣留非机动车', 'QCLB');
insert into SYSTEM_MAP (key, value, type)
values ('1', '扣留机动车', 'QCLB');
insert into SYSTEM_MAP (key, value, type)
values ('0', '否', 'haveres');
insert into SYSTEM_MAP (key, value, type)
values ('TextSpinner', '下拉列表', 'w_type');
insert into SYSTEM_MAP (key, value, type)
values ('1', '是', 'haveres');
insert into SYSTEM_MAP (key, value, type)
values ('EditDate', '编辑框[日期]', 'w_type');
insert into SYSTEM_MAP (key, value, type)
values ('SpinnersEdit', '下拉+编辑框', 'w_type');
insert into SYSTEM_MAP (key, value, type)
values ('TextEdit', '编辑框[文本]', 'w_type');
insert into SYSTEM_MAP (key, value, type)
values ('0', 'bizDS', 'datasource');
insert into SYSTEM_MAP (key, value, type)
values ('1', 'bizDS_1', 'datasource');
insert into SYSTEM_MAP (key, value, type)
values ('2', 'bizDS_2', 'datasource');
insert into SYSTEM_MAP (key, value, type)
values ('3', 'bizDS_3', 'datasource');
insert into SYSTEM_MAP (key, value, type)
values ('4', 'bizDS_4', 'datasource');
insert into SYSTEM_MAP (key, value, type)
values ('5', 'bizDS_5', 'datasource');
insert into SYSTEM_MAP (key, value, type)
values ('6', 'bizDS_6', 'datasource');
insert into SYSTEM_MAP (key, value, type)
values ('7', 'bizDS_7', 'datasource');
insert into SYSTEM_MAP (key, value, type)
values ('8', 'bizDS_8', 'datasource');
insert into SYSTEM_MAP (key, value, type)
values ('9', 'bizDS_9', 'datasource');
insert into SYSTEM_MAP (key, value, type)
values ('10', 'bizDS_10', 'datasource');
insert into SYSTEM_MAP (key, value, type)
values ('VARCHAR', 'VARCHAR', 'cname_type');
insert into SYSTEM_MAP (key, value, type)
values ('DATE', 'DATE', 'cname_type');
insert into SYSTEM_MAP (key, value, type)
values ('001', '系统繁忙，无法处理您的请求！请稍后重试。', 'RETURN_CODE');
insert into SYSTEM_MAP (key, value, type)
values ('002', '用户帐号不存在！', 'RETURN_CODE');
insert into SYSTEM_MAP (key, value, type)
values ('003', '请用匹配的注册手机登陆！', 'RETURN_CODE');
insert into SYSTEM_MAP (key, value, type)
values ('004', '用户密码错误！', 'RETURN_CODE');
insert into SYSTEM_MAP (key, value, type)
values ('005', '密碼修改成功！', 'RETURN_CODE');
insert into SYSTEM_MAP (key, value, type)
values ('006', '更新密码验证失败，用户名或原密码错误！', 'RETURN_CODE');
insert into SYSTEM_MAP (key, value, type)
values ('007', '更新用户锁定状态成功！', 'RETURN_CODE');
insert into SYSTEM_MAP (key, value, type)
values ('008', '更新用户数据不存在！', 'RETURN_CODE');
insert into SYSTEM_MAP (key, value, type)
values ('009', '该用户已被锁定，不能登录！', 'RETURN_CODE');
insert into SYSTEM_MAP (key, value, type)
values ('010', '该用户已被注销，不能登录！', 'RETURN_CODE');
insert into SYSTEM_MAP (key, value, type)
values ('BLOB', 'BLOB', 'cname_type');
commit;
prompt 64 records loaded
prompt Loading SYSTEM_RES_CONFIG...
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('BJJB', '报警级别', 'select key,value from busi_map where type = ''BJJB''', '20120215162916', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('ZXDZBZ', '专项斗争标志', 'select key,value from busi_map where type = ''ZXDZBZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('JCJ_CLLX', '处理类型', 'select key,value from busi_map where type = ''JCJ_CLLX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('FAB', '副案别', 'select key,value from busi_map where type = ''FAB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('AJLB', '案件类别', 'select key,value from busi_map where type = ''AJLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('MJ', '密级', 'select key,value from busi_map where type = ''MJ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100015', '常住人口信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100015''', '20110920172844', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100016', '暂住人口信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100016''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100017', '驾驶员员信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100017''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100019', '寄主人员信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100019''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100022', '在逃人员信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100022''', '20110919131927', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100042', '机构信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100042''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100031', '机动车辆查询', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100031''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100020', '单位从人员业', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100020''', '20110919131840', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100023', '房屋出租户主', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100023''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100024', '保安人员信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100024''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100025', '上网人员信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100025''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100027', '巡逻盘查车辆信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100027''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100028', '接处警信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100028''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100029', '刑事案件信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100029''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100030', '行政案件信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100030''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100032', '网吧信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100032''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100033', '特种行业', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100033''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100034', '公共场所', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100034''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100035', '保安公司', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100035''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100036', '涉外单位', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100036''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100037', '内保单位', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100037''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100041', '巡逻盘查人员信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100041''', '20120212132518', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100043', '处警信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100043''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100018', '人员住宿信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100018''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100021', '境外人员住宿信息', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100021''', '20110919131902', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('S000000001', '密码设置', 'select COLUMNS key,CNAME value from column_map where b_id = ''S000000001''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('3cfebef3:1328edc98f8:-7fed', '王鹏', 'select COLUMNS key,CNAME value from column_map where b_id = ''3cfebef3:1328edc98f8:-7fed''', '20111110093830', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('S000000013', '通知通告', 'select COLUMNS key,CNAME value from column_map where b_id = ''S000000013''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('S000000015', '通讯录', 'select COLUMNS key,CNAME value from column_map where b_id = ''S000000015''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('S000000014', '法律法规', 'select COLUMNS key,CNAME value from column_map where b_id = ''S000000014''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100098', '公文审核', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100098''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('B201100099', '公文审核列表', 'select COLUMNS key,CNAME value from column_map where b_id = ''B201100099''', '20110811080101', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('RETURN_CODE', '返回码', 'select key,value from system_map  where type = ''RETURN_CODE''', '20111102144747', 'bizDS_1');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('T20120222001', '测试lemon', 'select @ from fw_conf_xa.jw_law t where 1=1  #LAW_CODE# ', '20120222132901', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('3661e604:135a2ed32d4:-7fff', 'LEMON', 'select COLUMNS key,CNAME value from column_map where b_id = ''3661e604:135a2ed32d4:-7fff''', '20120222133822', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('lemonnew', 'lemonnew', 'select @ from tab_info where 1=1', '20120222162720', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('3661e604:135a2ed32d4:-7ff3', 'lemonnew', 'select COLUMNS key,CNAME value from column_map where b_id = ''3661e604:135a2ed32d4:-7ff3''', '20120222162941', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('XB', '性别', 'select key,value from busi_map where type = ''XB''', '20111228161141', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('MZ', '民族', 'select key,value from busi_map where type = ''MZ''', '20110803160101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('CLLX', '车辆类型', 'select key,value from busi_map where type = ''CLLX''', '20110803160101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('HPZL', '号牌种类', 'select key,value from busi_map where type = ''HPZL''', '20110803160101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('AJZT', '案件状态', 'select key,value from busi_map where type = ''AJZT''', '20110803160101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('LKZJLX', '旅客证件类型', 'select key,value from busi_map where type = ''LKZJLX''', '20110803160101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('LGMC', '旅馆名称', 'select HNOHOTEL key,HNAME value from t_hotel  ', '20110803160101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('CJLB', '处警类别', 'select key,value from busi_map where type = ''CJLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('BJLX', '报警类型', 'select key,value from busi_map where type = ''BJLX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('DW', '单位', 'select * from busi_map where type = ''DW'' and key  like ''%61010009%''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('ZJZL', '证件类型', 'select key,value from busi_map where type = ''ZJZL''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('QZZL', '签证种类', 'select key,value from busi_map where type = ''QZZL''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('WBMC', '网吧名称', 'select YYCSDM key,YYCSMC value from JG_WBXX  ', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('WHCD', '文化程度', 'select key,value from busi_map where type = ''WHCD''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('ZZMM', '政治面貌', 'select key,value from busi_map where type = ''ZZMM''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('HYZK', '婚姻状况', 'select key,value from busi_map where type = ''HYZK''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('HKLB', '户口类别', 'select key,value from busi_map where type = ''HKLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('JSZZT', '驾驶证状态', 'select key,value from busi_map where type = ''JSZZT''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('ZJCX', '准驾车型', 'select key,value from busi_map where type = ''ZJCX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('CLYS', '车辆颜色', 'select key,value from busi_map where type = ''CLYS''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('AJSX', '案件属性', 'select key,value from busi_map where type = ''AJSX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('AJXZ', '案件性质', 'select key,value from busi_map where type = ''AJXZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('AJLY', '案件类型', 'select key,value from busi_map where type = ''AJLY''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('DBJB', '督捕级别', 'select key,value from busi_map where type = ''DBJB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('ZDRTLB', '重点人头类别', 'select key,value from busi_map where type = ''ZDRTLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('CJBS', '处警标识', 'select key,value from busi_map where type = ''CJBS''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('CJJG', '处警结果', 'select key,value from busi_map where type = ''CJJG''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('AFDZLB', '案发地址类别', 'select key,value from busi_map where type = ''AFDZLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('FWLX', '房屋类型', 'select key,value from busi_map where type = ''FWLX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('FWCQXZ', '房屋产权性质', 'select key,value from busi_map where type = ''FWCQXZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('GLJB', '管理级别', 'select key,value from busi_map where type = ''GLJB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('ZXYY', '注销原因', 'select key,value from busi_map where type = ''ZXYY''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('NBGLBM', '内保管理部门', 'select key,value from busi_map where type = ''NBGLBM''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('JGDQ', '籍贯地区', 'select key,value from busi_map where type = ''JGDQ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('JTGX', '家庭关系', 'select key,value from busi_map where type = ''JTGX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('ZZSY', '暂住事由', 'select key,value from busi_map where type = ''ZZSY''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('TSHK', '特殊户口', 'select key,value from busi_map where type =''TSHK''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('FZJG', '发证机关', 'select key,value from busi_map where type = ''FZJG''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('XZQH', '行政区划', 'select key,value from busi_map where type = ''XZQH''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('GNZJ', '国内证件', 'select key,value from busi_map where type = ''GNZJ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('JZYY', '寄住原因', 'select key,value from busi_map where type = ''JZYY''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('ZW', '职务', 'select key,value from busi_map where type = ''ZW''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('SFXXY', '是否信息员', 'select key,value from busi_map where type = ''SFXXY''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('CZYT', '出租用途', 'select key,value from busi_map where type = ''CZYT''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('FWZT', '房屋状态', 'select key,value from busi_map where type = ''FWZT''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('RYLB', '人员类别', 'select key,value from busi_map where type = ''RYLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('DJDWLX', '登记单位类型', 'select key,value from busi_map where type = ''DJDWLX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('THLB', '特行类别', 'select key,value from busi_map where type = ''THLB''', '20110808150101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('XJDJ', '星级等级', 'select key,value from busi_map where type = ''XJDJ''', '20110808150101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('ZXBS', '注销标识', 'select key,value from busi_map where type = ''ZXBS''', '20110808150101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('SFZBG', '是否住宾馆', 'select key,value from busi_map where type = ''SFZBG''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('BARYXZ', '保安人员性质', 'select key,value from busi_map where type = ''BARYXZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('PZGW', '派驻岗位', 'select key,value from busi_map where type = ''PZGW''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('BMJB', '保密级别', 'select key,value from busi_map where type = ''BMJB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('YW', '有无', 'select key,value from busi_map where type = ''YW''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('ZYLB', '职业类别', 'select key,value from busi_map where type = ''ZYLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('WWXX', '维稳信息', 'select key,value from busi_map where type = ''WWXX''', '20110808080101', 'bizDS');
commit;
prompt 100 records committed...
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('ZZCS', '暂住处所', 'select key,value from busi_map where type = ''ZZCS''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('DJ', '等级', 'select key,value from busi_map where type = ''DJ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('BWJGSZ', '保卫机构设置', 'select key,value from busi_map where type = ''BWJGSZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('DWXZ', '单位性质', 'select key,value from busi_map where type = ''DWXZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('ZYBWJB', '重要部位级别', 'select key,value from busi_map where type = ''ZYBWJB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('SFZZL', '身份证种类', 'select key,value from busi_map where type = ''SFZZL''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('GGCSDJ', '公共场所等级', 'select key,value from busi_map where type = ''GGCSDJ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('CSLB', '场所类别', 'select key,value from busi_map where type = ''CSLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('RYGX', '人员关系', 'select key,value from busi_map where type = ''RYGX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('NBJGXZ', '内保机构性质', 'select key,value from busi_map where type = ''NBJGXZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('JGLX', '机构类型', 'select key,value from busi_map where type = ''JGLX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('HYLB', '行业类别', 'select key,value from busi_map where type = ''HYLB''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('JJXZ', '经济性质', 'select key,value from busi_map where type = ''JJXZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('XFDJ', '消防等级', 'select key,value from busi_map where type = ''XFDJ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('CLJG', '处理结果', 'select key,value from busi_map where type = ''CLJG''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('BAZGZW', '保安主管职务', 'select key,value from busi_map where type = ''BAZGZW''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('ZDDJ', '重点等级', 'select key,value from busi_map where type = ''ZDDJ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('GYDWLX', '雇佣单位类型', 'select key,value from busi_map where type = ''GYDWLX''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('MPHZ', '门牌后缀', 'select key,value from busi_map where type = ''MPHZ''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('SFSW', '是否涉外', 'select key,value from busi_map where type = ''SFSW''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('FSCS', '发生场所', 'select key,value from busi_map where type = ''FSCS''', '20110808080101', 'bizDS');
insert into SYSTEM_RES_CONFIG (res_id, res_name, source, change_date, ds)
values ('SF', '是否', 'select key,value from busi_map where type = ''SF''', '20110808080101', 'bizDS');
commit;
prompt 122 records loaded
prompt Loading SYSTEM_SQLITE_SYNCH...
insert into SYSTEM_SQLITE_SYNCH (role_id, file_name, synch_date, file_length)
values ('all', 'police_all_20120217144956.db', '20120217144956', 906240);
insert into SYSTEM_SQLITE_SYNCH (role_id, file_name, synch_date, file_length)
values ('3cfebef3:1328edc98f8:-7ff5', 'police_3cfebef31328edc98f8-7ff5_20120217144956.db', '20120217144956', 891904);
insert into SYSTEM_SQLITE_SYNCH (role_id, file_name, synch_date, file_length)
values ('447f8378:13478d96334:-8000', 'police_447f837813478d96334-8000_20120217144956.db', '20120217144956', 887808);
insert into SYSTEM_SQLITE_SYNCH (role_id, file_name, synch_date, file_length)
values ('-585bcf9a:13469b08262:-7fff', 'police_-585bcf9a13469b08262-7fff_20111223153606.db', '20111223153606', 875520);
insert into SYSTEM_SQLITE_SYNCH (role_id, file_name, synch_date, file_length)
values ('29d4bcde:1326b18d4bf:-7ffe', 'police_29d4bcde1326b18d4bf-7ffe_20120217144956.db', '20120217144956', 902144);
insert into SYSTEM_SQLITE_SYNCH (role_id, file_name, synch_date, file_length)
values ('29d4bcde:1326b18d4bf:-7fff', 'police_29d4bcde1326b18d4bf-7fff_20120215162916.db', '20120215162916', 889856);
commit;
prompt 6 records loaded
prompt Loading TAB_INFO...
insert into TAB_INFO (tab_id, b_id, tab_name)
values (1, '3661e604:135a2ed32d4:-7fff', 'lemon1');
insert into TAB_INFO (tab_id, b_id, tab_name)
values (2, '3661e604:135a2ed32d4:-7fff', 'lemon2');
insert into TAB_INFO (tab_id, b_id, tab_name)
values (1, '3661e604:135a2ed32d4:-7ffe', '1');
insert into TAB_INFO (tab_id, b_id, tab_name)
values (1, '2879d6f8:131fa4a7057:-8000', '11');
insert into TAB_INFO (tab_id, b_id, tab_name)
values (0, '31171d2c:132b99423bf:-8000', 'a1');
insert into TAB_INFO (tab_id, b_id, tab_name)
values (1, '31171d2c:132b99423bf:-8000', 'aa1');
insert into TAB_INFO (tab_id, b_id, tab_name)
values (2, '31171d2c:132b99423bf:-8000', 'a2');
commit;
prompt 7 records loaded
prompt Loading TEST_IMG...
insert into TEST_IMG (id, name, idcode, nohotel, bdate, num, imgpath)
values ('2', '王峰', '612401198708133651', '6101000056', '19870813', '1', 'C:\simpleimg\XP.jpg');
insert into TEST_IMG (id, name, idcode, nohotel, bdate, num, imgpath)
values ('1', '郭世斌', '612725196811290012', '6101000056', '19681129', '2', null);
commit;
prompt 2 records loaded
prompt Loading T_SYSTEMLOG...
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95426, '908001', '交警业务=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('11-09-2011 08:18:04', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1221);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95428, '908001', '综合查询=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('11-09-2011 08:18:26', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 112);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95429, '908001', '综合查询=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('11-09-2011 08:20:00', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 112);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95455, 'admin', '用户管理=>>停用启用用户', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('15-09-2011 11:29:03', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95456, 'admin', '用户管理=>>停用启用用户', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('15-09-2011 11:29:15', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95489, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('16-09-2011 11:56:58', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95490, '908001', '综合查询=>>因私出境查询', null, '666-666-666-666-666-666', null, '1', to_date('16-09-2011 11:57:12', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 114);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95491, '908001', '综合查询=>>接处警查询', null, '666-666-666-666-666-666', null, '1', to_date('16-09-2011 11:58:49', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1121);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94661, '911009', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('06-02-2011 04:53:31', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94060, '911022', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('19-01-2011 05:31:41', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94061, '911022', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('19-01-2011 05:40:36', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94139, '908002', '综合查询=>>旅店业查询', null, '666-666-666-666-666-666', null, '1', to_date('21-01-2011 06:03:45', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94148, '908002', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('21-01-2011 09:11:35', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94149, '908002', '综合查询=>>旅店业查询', null, '666-666-666-666-666-666', null, '1', to_date('21-01-2011 09:14:43', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94150, '908002', '综合查询=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('21-01-2011 09:15:29', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1131);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94151, '908002', '综合查询=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('21-01-2011 09:15:55', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1131);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95320, '908002', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('29-08-2011 05:18:43', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95497, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('18-09-2011 02:55:43', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95501, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('18-09-2011 03:25:15', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95503, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('19-09-2011 07:37:54', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95504, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('19-09-2011 07:39:00', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95506, '908001', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('19-09-2011 07:39:39', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94728, '911009', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('07-02-2011 12:32:38', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93860, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('15-01-2011 01:30:27', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93861, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('15-01-2011 01:33:11', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93964, 'admin', '后台管理退出', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('17-01-2011 10:42:52', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94272, 'admin', '用户管理=>用户查询', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('26-01-2011 14:32:25', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94273, 'admin', '用户管理=>>浏览用户', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('26-01-2011 14:32:29', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94916, '908002', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('12-02-2011 02:21:48', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94917, '908002', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('12-02-2011 02:22:04', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95001, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('14-02-2011 03:00:25', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95002, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('14-02-2011 03:02:45', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95003, '908002', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('14-02-2011 03:08:03', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94443, 'admin', '用户管理=>用户查询', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('30-01-2011 11:10:08', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94444, 'admin', '用户管理=>修改用户密码', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('30-01-2011 11:10:10', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94445, 'admin', '后台管理退出', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('30-01-2011 11:10:59', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95461, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('15-09-2011 11:57:26', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95462, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('15-09-2011 11:57:39', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95463, '908001', '综合查询=>>在押人口查询', null, '666-666-666-666-666-666', null, '1', to_date('15-09-2011 11:57:47', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95464, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('15-09-2011 11:58:00', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95465, '908001', '系统设置=>>版本更新', null, '666-666-666-666-666-666', null, '1', to_date('15-09-2011 11:58:03', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 163);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95466, '908001', '系统设置=>>版本更新', null, '666-666-666-666-666-666', null, '1', to_date('15-09-2011 11:58:06', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 163);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95433, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('14-09-2011 03:01:18', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95434, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('14-09-2011 03:01:36', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95435, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('14-09-2011 03:01:44', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95436, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('14-09-2011 03:01:51', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95437, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('14-09-2011 03:02:49', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95438, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('14-09-2011 03:04:00', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95439, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('14-09-2011 03:05:09', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95440, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('14-09-2011 03:05:15', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95441, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('14-09-2011 03:06:05', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95509, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('19-09-2011 12:46:24', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95510, '908001', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('19-09-2011 12:46:26', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95511, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('19-09-2011 12:46:28', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95512, '908001', '移动办公=>>通讯录', null, '666-666-666-666-666-666', null, '1', to_date('19-09-2011 12:46:32', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95513, '908001', '移动办公=>>通讯录', null, '666-666-666-666-666-666', null, '1', to_date('19-09-2011 12:46:57', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95514, '908001', '移动办公=>>通讯录', null, '666-666-666-666-666-666', null, '1', to_date('19-09-2011 12:47:17', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95643, '900000', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('18-10-2011 10:29:59', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94073, '911009', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('19-01-2011 09:16:06', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94074, '911009', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('19-01-2011 09:19:11', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94075, '911009', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('19-01-2011 09:21:26', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94267, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('25-01-2011 09:55:47', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95230, 'admin', '进入法律法规管理', 'WinNTIEV6.0', null, '10.177.66.44', '0', to_date('10-08-2011 09:27:50', 'dd-mm-yyyy hh24:mi:ss'), null, 63);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94469, '908002', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('31-01-2011 08:45:09', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94473, '908002', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('31-01-2011 08:47:21', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94474, '908002', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('31-01-2011 08:48:23', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94476, '908002', '系统设置=>>系统配置', null, '666-666-666-666-666-666', null, '1', to_date('31-01-2011 08:48:49', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 162);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94478, '908002', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('31-01-2011 08:48:59', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95345, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 09:00:36', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95346, '908001', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 09:00:49', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95347, '908001', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 09:03:39', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95402, '908001', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 09:03:34', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95403, '908001', '综合查询=>>暂住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 09:03:58', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 117);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95404, '908001', '综合查询=>>接处警查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 09:04:37', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1121);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95405, '908001', '综合查询=>>印章查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 09:07:26', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1133);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95406, '908001', '综合查询=>>旅店业查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 09:07:47', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94196, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('23-01-2011 11:52:36', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94197, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('23-01-2011 11:52:46', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94198, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('23-01-2011 11:56:10', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94199, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('23-01-2011 11:58:17', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94200, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('23-01-2011 12:02:13', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95675, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '192.168.20.70', '0', to_date('20-10-2011 10:44:08', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95483, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('16-09-2011 11:50:01', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95486, '908001', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('16-09-2011 11:51:18', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95487, '908001', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('16-09-2011 11:52:26', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95488, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('16-09-2011 11:52:32', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (126, 'yladmin', '进入单位管理', 'WinNTIEV6.0', null, '127.0.0.1', '0', to_date('25-09-2010 13:58:10', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (127, 'yladmin', '进入用户管理', 'WinNTIEV6.0', null, '127.0.0.1', '0', to_date('25-09-2010 13:58:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (128, 'yladmin', '进入角色管理', 'WinNTIEV6.0', null, '127.0.0.1', '0', to_date('25-09-2010 13:58:21', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (129, 'yladmin', '后台管理退出', 'WinNTIEV6.0', null, '127.0.0.1', '0', to_date('25-09-2010 13:58:34', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (15075, 'jwt', '综合查询=>>旅店业查询', null, '666-666-666-666-666-666', null, '1', to_date('01-12-2010 09:12:11', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (15076, 'jwt', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('01-12-2010 09:13:00', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (15084, 'jwt', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('01-12-2010 10:45:50', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (15195, '911022', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-12-2010 10:02:43', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (15215, '911021', '综合查询=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('02-12-2010 10:03:46', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 112);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (10912, 'jwt', '刑侦信息=>>在逃人员查询', null, '666-666-666-666-666-666', null, '1', to_date('29-10-2010 01:52:04', 'dd-mm-yyyy hh24:mi:ss'), '海信E8', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (12667, 'jwt', '综合查询=>>因私出境查询', null, '666-666-666-666-666-666', null, '1', to_date('02-11-2010 07:29:12', 'dd-mm-yyyy hh24:mi:ss'), '海信E8', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (12668, 'jwt', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('02-11-2010 07:29:35', 'dd-mm-yyyy hh24:mi:ss'), '海信E8', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (12669, 'jwt', '综合查询=>>人口查询=>>境内旅客列表', null, '666-666-666-666-666-666', null, '1', to_date('02-11-2010 07:30:07', 'dd-mm-yyyy hh24:mi:ss'), '海信E8', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (12670, 'jwt', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('02-11-2010 07:30:48', 'dd-mm-yyyy hh24:mi:ss'), '海信E8', null);
commit;
prompt 100 records committed...
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (12671, 'jwt', '综合查询=>>人口查询=>>境内旅客列表', null, '666-666-666-666-666-666', null, '1', to_date('02-11-2010 07:31:13', 'dd-mm-yyyy hh24:mi:ss'), '海信E8', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (12672, 'jwt', '综合查询=>>人口查询=>>境内旅客详细', null, '666-666-666-666-666-666', null, '1', to_date('02-11-2010 07:31:31', 'dd-mm-yyyy hh24:mi:ss'), '海信E8', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (12673, 'jwt', '综合查询=>>人口查询=>>境内旅客列表', null, '666-666-666-666-666-666', null, '1', to_date('02-11-2010 07:32:24', 'dd-mm-yyyy hh24:mi:ss'), '海信E8', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (12674, 'jwt', '综合查询=>>人口查询=>>境内旅客详细', null, '666-666-666-666-666-666', null, '1', to_date('02-11-2010 07:32:37', 'dd-mm-yyyy hh24:mi:ss'), '海信E8', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (12675, 'jwt', '综合查询=>>人口查询=>>境内旅客列表', null, '666-666-666-666-666-666', null, '1', to_date('02-11-2010 07:32:51', 'dd-mm-yyyy hh24:mi:ss'), '海信E8', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (12676, 'jwt', '综合查询=>>人口查询=>>境内旅客详细', null, '666-666-666-666-666-666', null, '1', to_date('02-11-2010 07:33:19', 'dd-mm-yyyy hh24:mi:ss'), '海信E8', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (12677, 'jwt', '综合查询=>>人口查询=>>境内旅客列表', null, '666-666-666-666-666-666', null, '1', to_date('02-11-2010 07:33:35', 'dd-mm-yyyy hh24:mi:ss'), '海信E8', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (12678, 'jwt', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('02-11-2010 07:33:43', 'dd-mm-yyyy hh24:mi:ss'), '海信E8', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (16234, '911015', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('02-12-2010 06:26:53', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (16238, '911015', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('02-12-2010 06:28:50', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (16241, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-12-2010 06:29:08', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91326, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('16-12-2010 11:45:41', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91327, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('16-12-2010 11:47:23', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91328, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('16-12-2010 11:51:29', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91477, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('17-12-2010 11:31:04', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92968, 'admin', '后台管理退出', 'WinXPIEV6.0', null, '10.177.66.222', '0', to_date('04-01-2011 09:51:34', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90879, '911015', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('12-12-2010 07:52:12', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90880, '911015', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('12-12-2010 07:54:21', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90881, '911015', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('12-12-2010 07:56:26', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90883, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('12-12-2010 07:56:40', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90884, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('12-12-2010 07:59:43', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90886, '911015', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('12-12-2010 08:00:14', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91005, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('14-12-2010 03:47:54', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91007, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('14-12-2010 03:50:53', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91008, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('14-12-2010 03:52:55', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91009, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('14-12-2010 03:54:30', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91012, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('14-12-2010 03:56:35', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91013, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('14-12-2010 03:56:51', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91020, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('14-12-2010 04:24:05', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18533, '911006', '移动办公=>>通讯录', null, '666-666-666-666-666-666', null, '1', to_date('07-12-2010 03:40:51', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18534, '911006', '移动办公=>>法律法规', null, '666-666-666-666-666-666', null, '1', to_date('07-12-2010 03:42:51', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90372, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('09-12-2010 11:37:59', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90373, '911006', '综合查询=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('09-12-2010 11:40:49', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 112);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (16559, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('03-12-2010 12:18:55', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93174, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('05-01-2011 10:51:09', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93175, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('05-01-2011 10:52:30', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93176, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('05-01-2011 11:01:50', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93254, '908002', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 10:42:16', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93255, '908002', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 10:42:20', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93412, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('07-01-2011 12:20:57', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93431, '911009', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('07-01-2011 08:29:42', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93432, '911009', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('07-01-2011 08:31:34', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93433, '911009', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('07-01-2011 08:33:49', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93313, '908002', '移动办公=>>通知公告', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 12:20:56', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 142);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93315, '908002', '交警业务=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 12:21:11', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1221);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93316, '908002', '交警业务=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 12:21:53', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1221);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93317, '908002', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 12:22:11', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93319, '908002', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 12:22:36', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93321, '908002', '系统设置=>>系统配置', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 12:23:08', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 162);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93323, '908002', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 12:23:23', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93324, '908002', '综合查询=>>在押人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 12:25:07', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93325, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 12:25:16', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93326, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 12:28:25', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93327, '908002', '综合查询=>>接处警查询', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 12:28:59', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1121);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93328, '908002', '综合查询=>>印章查询', null, '666-666-666-666-666-666', null, '1', to_date('06-01-2011 12:29:18', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1133);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91664, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('19-12-2010 02:26:56', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91665, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('19-12-2010 02:27:45', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91666, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('19-12-2010 02:30:16', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91667, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('19-12-2010 02:30:25', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91668, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('19-12-2010 02:36:09', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91675, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('19-12-2010 02:57:55', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91676, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('19-12-2010 02:58:11', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92445, '911009', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('29-12-2010 05:56:00', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92446, '911009', '交警业务=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('29-12-2010 05:56:03', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1221);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92447, '911009', '交警业务=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('29-12-2010 05:56:19', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1221);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92448, '911009', '交警业务=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('29-12-2010 05:57:33', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1221);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92449, '911009', '交警业务=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('29-12-2010 05:58:15', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1221);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90983, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '127.0.0.1', '0', to_date('14-12-2010 09:34:37', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17435, '911015', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 04:49:58', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17436, '911015', '移动办公=>>通讯录', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 04:50:20', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17438, '911015', '移动办公=>>通讯录', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 04:51:07', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17439, '911015', '移动办公=>>法律法规', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 04:51:35', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 143);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17442, '911015', '移动办公=>>法律法规', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 04:52:21', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 143);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17443, '911015', '移动办公=>>通知公告', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 04:52:28', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 142);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17447, '911015', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 04:54:10', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17448, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 04:54:44', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (16845, 'admin', '角色管理=>>删除角色', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('03-12-2010 14:46:05', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (16848, 'admin', '进入单位管理', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('03-12-2010 14:48:37', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (16849, 'admin', '进入法律法规管理', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('03-12-2010 14:48:58', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (16852, 'admin', '进入法律法规管理', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('03-12-2010 14:49:24', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (16853, 'admin', '进入单位管理', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('03-12-2010 14:49:42', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (16854, 'admin', '进入单位管理', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('03-12-2010 14:50:24', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90659, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 11:01:37', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17673, '911015', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('05-12-2010 11:35:36', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17674, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('05-12-2010 11:35:46', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17675, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('05-12-2010 11:40:16', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17676, '911015', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('05-12-2010 11:41:20', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91719, 'admin', '进入单位管理', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('20-12-2010 09:41:56', 'dd-mm-yyyy hh24:mi:ss'), null, 21);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93639, '911021', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('11-01-2011 12:51:12', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93640, '911021', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('11-01-2011 12:51:33', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93641, '911021', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('11-01-2011 12:55:45', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93642, '911021', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('11-01-2011 12:57:46', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93643, '911021', '综合查询=>>在逃人员查询', null, '666-666-666-666-666-666', null, '1', to_date('11-01-2011 12:58:39', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 118);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93644, '911021', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('11-01-2011 12:58:49', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93670, '911015', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('11-01-2011 10:52:29', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93671, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('11-01-2011 10:52:37', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93672, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('11-01-2011 10:54:31', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93675, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('11-01-2011 10:58:23', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93710, 'jwt', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('13-01-2011 10:01:52', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93711, 'admin', '进入用户管理', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('13-01-2011 09:59:21', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
commit;
prompt 200 records committed...
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93740, 'jwt', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('13-01-2011 10:33:50', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93748, '911015', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('13-01-2011 10:41:10', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93768, '911015', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('13-01-2011 11:31:08', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93773, '911015', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('13-01-2011 03:33:12', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93774, '911015', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('13-01-2011 03:33:30', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93779, '911015', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('13-01-2011 05:21:53', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90688, '911021', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('11-12-2010 10:23:20', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90689, '911021', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('11-12-2010 10:24:43', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90258, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '127.0.0.1', '0', to_date('09-12-2010 15:33:48', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18104, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 12:42:59', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18105, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 12:43:11', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18106, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 12:44:53', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18107, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 12:45:03', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18111, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 12:51:17', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18114, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 12:53:49', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18116, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 12:56:30', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18119, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 12:59:47', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18126, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 01:05:41', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18130, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 01:07:37', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90506, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '127.0.0.1', '0', to_date('10-12-2010 15:57:28', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90001, 'jwt', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('08-12-2010 02:27:50', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91092, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '127.0.0.1', '0', to_date('15-12-2010 10:54:18', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90264, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '192.168.20.70', '0', to_date('09-12-2010 15:59:30', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92005, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('23-12-2010 01:54:04', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92006, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('23-12-2010 01:56:18', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92007, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('23-12-2010 01:58:03', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92008, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('23-12-2010 02:00:51', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92011, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('23-12-2010 02:04:02', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92014, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('23-12-2010 03:16:25', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92015, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('23-12-2010 03:20:30', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92016, '911015', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('23-12-2010 03:20:39', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92042, '911015', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('24-12-2010 12:38:19', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92044, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('24-12-2010 12:39:08', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18789, 'jwt', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('08-12-2010 02:10:11', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18246, 'jwt', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 10:30:47', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18273, '911015', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 11:57:32', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18274, '911015', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 11:57:43', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18433, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('07-12-2010 01:28:28', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18434, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('07-12-2010 01:28:40', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90660, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 11:02:00', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90661, '911006', '综合查询=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 11:02:43', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 112);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90662, '911006', '综合查询=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 11:07:09', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 112);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90663, '911006', '综合查询=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 11:08:02', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 112);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90041, 'jwt', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('08-12-2010 03:52:46', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90164, 'jwt', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('09-12-2010 08:49:09', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90209, 'admin', '进入群组管理', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('09-12-2010 10:18:43', 'dd-mm-yyyy hh24:mi:ss'), null, 41);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90210, 'admin', '后台管理退出', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('09-12-2010 10:19:09', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90213, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '127.0.0.1', '0', to_date('09-12-2010 10:54:49', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90263, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '10.177.66.44', '0', to_date('09-12-2010 16:00:52', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90271, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '127.0.0.1', '0', to_date('09-12-2010 16:40:51', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90387, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 12:14:17', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90388, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 12:15:57', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90389, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 12:18:46', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90391, '911006', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 12:19:17', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90421, '911015', '综合查询=>>因私出境查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 09:47:46', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 114);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90422, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 09:47:57', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90428, 'jwt', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 09:52:19', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90430, 'jwt', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 09:54:11', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90431, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 09:55:23', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90432, 'jwt', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 09:55:29', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90433, 'jwt', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 09:57:13', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90447, '911015', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 10:43:13', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90517, '911015', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 05:21:44', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90519, '911015', '系统设置=>>系统配置', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 05:23:12', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 162);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90521, '911015', '移动办公=>>通讯录', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 05:23:33', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90522, '911015', '移动办公=>>法律法规', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 05:25:23', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 143);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90988, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '192.168.20.70', '0', to_date('14-12-2010 09:39:47', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90989, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '192.168.20.70', '0', to_date('14-12-2010 09:45:30', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90990, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '192.168.20.70', '0', to_date('14-12-2010 09:45:49', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90991, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '192.168.20.70', '0', to_date('14-12-2010 09:47:30', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18213, 'jwt', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 09:30:32', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93596, '908002', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('10-01-2011 05:37:37', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93597, '908002', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('10-01-2011 05:39:38', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93598, '908002', '综合查询=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('10-01-2011 05:40:01', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1131);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93599, '908002', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('10-01-2011 05:43:44', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93600, '908002', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('10-01-2011 05:44:49', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93601, '908002', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('10-01-2011 05:45:05', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17043, '911022', '综合查询=>>驾驶员约考查询', null, '666-666-666-666-666-666', null, '1', to_date('03-12-2010 09:26:23', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 113);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17044, '911022', '综合查询=>>驾驶员约考查询', null, '666-666-666-666-666-666', null, '1', to_date('03-12-2010 09:27:33', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 113);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17045, '911022', '综合查询=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('03-12-2010 09:27:43', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 112);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17048, '911022', '综合查询=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('03-12-2010 09:29:19', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 112);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17051, '911022', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('03-12-2010 09:29:36', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17055, '911022', '移动办公=>>法律法规', null, '666-666-666-666-666-666', null, '1', to_date('03-12-2010 09:31:15', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 143);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17056, '911022', '移动办公=>>法律法规', null, '666-666-666-666-666-666', null, '1', to_date('03-12-2010 09:32:16', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 143);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17057, '911022', '移动办公=>>通知公告', null, '666-666-666-666-666-666', null, '1', to_date('03-12-2010 09:32:19', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 142);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17059, '911022', '移动办公=>>通讯录', null, '666-666-666-666-666-666', null, '1', to_date('03-12-2010 09:33:26', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17061, '911022', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('03-12-2010 09:35:14', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17063, '911022', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('03-12-2010 09:37:16', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17245, '911022', '综合查询=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 12:11:46', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 112);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17247, '911022', '综合查询=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 12:12:32', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 112);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17248, '911022', '综合查询=>>在逃人员查询', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 12:12:45', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 118);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17250, '911022', '综合查询=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 12:13:22', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1131);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17252, '911022', '刑侦信息=>>被盗抢车辆查询', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 12:15:42', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1132);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17257, '911022', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('04-12-2010 12:16:19', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18382, '911009', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 08:52:57', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91883, '911009', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('22-12-2010 09:15:34', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17650, '911022', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-12-2010 10:16:34', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18409, '911009', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('06-12-2010 09:33:01', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17653, '911022', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-12-2010 10:17:48', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17658, '911022', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-12-2010 10:19:12', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
commit;
prompt 300 records committed...
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17659, '911022', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-12-2010 10:20:24', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17661, '911022', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('05-12-2010 10:20:47', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17662, '911022', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('05-12-2010 10:21:46', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (17663, '911022', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('05-12-2010 10:24:31', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92481, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('29-12-2010 09:35:55', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92482, '911015', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('29-12-2010 09:43:50', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92106, '911015', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('25-12-2010 12:20:38', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92111, '911015', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('25-12-2010 10:21:05', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92421, 'admin', '用户管理=>用户查询', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('29-12-2010 16:12:27', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92423, 'admin', '用户管理=>用户查询', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('29-12-2010 16:12:44', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92424, 'admin', '用户管理=>>浏览用户', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('29-12-2010 16:12:53', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92429, 'admin', '用户管理=>用户查询', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('29-12-2010 16:26:55', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92442, 'admin', '后台管理退出', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('29-12-2010 17:26:34', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92443, 'admin', '后台管理退出', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('29-12-2010 17:26:35', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92514, 'admin', '后台管理退出', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('30-12-2010 09:57:36', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92515, 'admin', '进入单位管理', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('30-12-2010 09:59:48', 'dd-mm-yyyy hh24:mi:ss'), null, 21);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92692, 'admin', '后台管理退出', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('01-01-2011 13:23:33', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92706, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '127.0.0.1', '0', to_date('01-01-2011 16:41:55', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92773, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('01-01-2011 11:14:44', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92781, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 12:12:31', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92782, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 12:14:48', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92783, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 12:21:39', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92784, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 12:25:24', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92785, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 12:25:33', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92790, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 12:57:19', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92791, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 12:59:46', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92792, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 01:03:46', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92793, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 01:07:34', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92794, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 01:12:02', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92795, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 01:17:50', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92796, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 01:21:35', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92797, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 01:24:23', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92851, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 09:03:52', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92852, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 09:04:07', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92853, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 09:08:04', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92854, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 09:12:52', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92855, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 09:13:01', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92856, '911006', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 09:13:33', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92871, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 11:45:30', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92872, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 11:46:45', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92873, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 11:50:24', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92874, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 11:52:26', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92875, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('02-01-2011 11:55:15', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91222, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('15-12-2010 11:42:30', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91223, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('15-12-2010 11:42:42', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91224, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('15-12-2010 11:46:44', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91225, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('15-12-2010 11:48:22', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91226, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('15-12-2010 11:53:29', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91227, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('16-12-2010 12:02:18', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91273, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('16-12-2010 04:29:27', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91275, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('16-12-2010 04:29:49', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (91279, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('16-12-2010 04:31:50', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90257, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '192.168.20.70', '0', to_date('09-12-2010 15:30:58', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90385, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 12:06:05', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92142, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('25-12-2010 10:46:23', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92143, '911006', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('25-12-2010 10:46:39', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92162, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('26-12-2010 11:00:33', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92163, '911006', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('26-12-2010 11:01:57', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92214, '911021', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('27-12-2010 02:29:23', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (92235, '911021', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('27-12-2010 10:16:19', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18603, '911009', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('07-12-2010 08:34:44', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18613, '911009', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('07-12-2010 08:46:27', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', null);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (18726, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '127.0.0.1', '0', to_date('08-12-2010 10:18:11', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90214, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '192.168.20.70', '0', to_date('09-12-2010 10:57:26', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90944, '911009', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('13-12-2010 07:51:44', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90260, 'admin', '单位管理=>>创建单位', 'WinNTIEV6.0', null, '10.177.66.44', '0', to_date('09-12-2010 15:45:47', 'dd-mm-yyyy hh24:mi:ss'), null, 21);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (90386, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('10-12-2010 12:10:06', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95598, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('11-10-2011 11:27:57', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95599, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('11-10-2011 11:29:24', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95600, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('11-10-2011 11:29:33', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95601, '908001', '综合查询=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('11-10-2011 11:29:51', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1131);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95602, '908001', '综合查询=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('11-10-2011 11:31:12', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1131);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95603, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('11-10-2011 11:31:19', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95604, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('11-10-2011 11:31:24', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94120, 'admin', '用户管理=>用户查询', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('21-01-2011 16:15:04', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94152, '908002', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('21-01-2011 09:30:09', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94244, '908002', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('24-01-2011 05:17:08', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94255, '911021', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('25-01-2011 01:42:35', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95374, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:59:10', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95375, '908001', '系统设置=>>系统配置', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:59:24', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 162);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95376, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:59:31', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95378, '908001', '移动办公=>>通知公告', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 01:01:39', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 142);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95389, '908001', '综合查询=>>在押人口查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 08:09:14', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95419, '900000', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('09-09-2011 10:23:43', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95421, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('11-09-2011 04:47:57', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95422, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('11-09-2011 04:48:52', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95473, 'admin', '用户管理=>修改用户密码', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('15-09-2011 15:36:35', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95479, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('15-09-2011 06:36:16', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95494, '900000', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('17-09-2011 04:20:18', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95519, '908002', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('20-09-2011 02:03:31', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95520, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('20-09-2011 02:05:18', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95521, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('20-09-2011 02:06:34', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95551, '908002', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('26-09-2011 03:35:50', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95552, '908002', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('26-09-2011 03:37:08', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95554, '908002', '综合查询=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('26-09-2011 03:37:33', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1131);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95555, '908002', '综合查询=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('26-09-2011 03:39:53', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1131);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95556, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('26-09-2011 03:40:02', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95557, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('26-09-2011 03:42:33', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95564, '908002', '综合查询=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('27-09-2011 04:09:34', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1131);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95567, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('28-09-2011 11:19:58', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
commit;
prompt 400 records committed...
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95568, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('28-09-2011 11:20:49', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95572, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('02-10-2011 10:01:13', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95573, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('02-10-2011 10:03:11', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95559, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('27-09-2011 11:46:18', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95560, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('27-09-2011 11:47:19', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95575, '908002', '综合查询=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-10-2011 05:19:09', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1131);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95576, '908002', '综合查询=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-10-2011 05:21:34', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1131);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95578, '908002', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-10-2011 05:21:50', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95579, '908002', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-10-2011 05:22:43', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95580, '908002', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-10-2011 05:25:13', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95581, '908002', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-10-2011 05:26:17', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95583, '908002', '系统设置=>>版本更新', null, '666-666-666-666-666-666', null, '1', to_date('05-10-2011 05:26:44', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 163);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95584, '908002', '系统设置=>>系统配置', null, '666-666-666-666-666-666', null, '1', to_date('05-10-2011 05:26:51', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 162);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95614, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('13-10-2011 07:41:50', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95616, '908001', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('13-10-2011 07:43:00', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95618, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('13-10-2011 07:45:42', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95621, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('15-10-2011 02:19:36', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95624, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('15-10-2011 02:21:50', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94106, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('21-01-2011 10:48:44', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94107, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('21-01-2011 10:51:18', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94108, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('21-01-2011 10:54:47', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94109, '908002', '综合查询=>>驾驶员查询', null, '666-666-666-666-666-666', null, '1', to_date('21-01-2011 10:56:10', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 112);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95452, '908001', '综合查询=>>暂住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('15-09-2011 11:28:57', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 117);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94246, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('24-01-2011 05:57:17', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94349, 'admin', '进入通讯录管理', '6.0', null, '10.177.65.85', '0', to_date('28-01-2011 09:46:40', 'dd-mm-yyyy hh24:mi:ss'), null, 61);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94614, '911006', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-02-2011 03:19:46', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94615, '911006', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-02-2011 03:22:34', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95549, '900000', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('24-09-2011 03:59:47', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95425, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('11-09-2011 08:17:57', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95395, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 08:53:33', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95396, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 08:56:36', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95397, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 08:57:16', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95398, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 08:57:36', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95399, '908001', '综合查询=>>在逃人员查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 08:58:17', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 118);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95400, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 08:58:30', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95401, '908001', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 08:58:57', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95408, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 10:40:58', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95410, '908001', '系统设置=>>版本更新', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 10:41:25', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 163);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95411, '908001', '系统设置=>>系统配置', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 10:41:29', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 162);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95215, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '192.168.20.60', '0', to_date('08-08-2011 10:29:34', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95216, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '192.168.20.60', '0', to_date('08-08-2011 10:30:04', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95650, 'admin', '进入单位管理', 'WinNTIEV6.0', null, '192.168.20.70', '0', to_date('19-10-2011 16:03:23', 'dd-mm-yyyy hh24:mi:ss'), null, 21);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94102, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('21-01-2011 10:37:08', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94104, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('21-01-2011 10:37:25', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94105, '908002', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('21-01-2011 10:46:04', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95238, '908002', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('10-08-2011 01:11:46', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95239, '908002', '综合查询=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('10-08-2011 01:12:05', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 1131);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95240, '908002', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('10-08-2011 01:13:06', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95241, '908002', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('10-08-2011 01:13:44', 'dd-mm-yyyy hh24:mi:ss'), '华为C8100', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95262, 'jwt', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('15-08-2011 02:47:04', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95263, 'jwt', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('15-08-2011 02:47:35', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95264, 'jwt', '系统设置=>>系统配置', null, '666-666-666-666-666-666', null, '1', to_date('15-08-2011 02:47:43', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 162);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95265, 'jwt', '系统设置=>>版本更新', null, '666-666-666-666-666-666', null, '1', to_date('15-08-2011 02:47:47', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 163);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95266, 'jwt', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('15-08-2011 02:47:54', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95277, 'jwt', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('15-08-2011 04:19:30', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95278, 'jwt', '移动办公=>>通知公告', null, '666-666-666-666-666-666', null, '1', to_date('15-08-2011 04:24:02', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 142);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95279, 'jwt', '移动办公=>>通讯录', null, '666-666-666-666-666-666', null, '1', to_date('15-08-2011 04:24:12', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95280, 'jwt', '移动办公=>>通讯录', null, '666-666-666-666-666-666', null, '1', to_date('15-08-2011 04:24:22', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95291, 'jwt', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('18-08-2011 02:00:09', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95292, 'jwt', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('18-08-2011 02:00:16', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95293, 'jwt', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('18-08-2011 02:12:33', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95297, '900000', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('18-08-2011 07:57:42', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95309, '900000', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('26-08-2011 08:08:23', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95311, '900000', '系统设置=>>版本更新', null, '666-666-666-666-666-666', null, '1', to_date('26-08-2011 08:08:43', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 163);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95313, '900000', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('26-08-2011 08:08:58', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95317, '900000', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('26-08-2011 08:14:49', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95481, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('16-09-2011 10:19:43', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95260, 'jwt', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('15-08-2011 02:04:06', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95391, '908001', '登录成功', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 05:40:46', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95392, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 05:41:03', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95393, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('08-09-2011 05:44:37', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95413, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('09-09-2011 09:10:47', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93891, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('15-01-2011 11:26:05', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93898, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('15-01-2011 11:47:22', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (93899, '911006', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('15-01-2011 11:51:40', 'dd-mm-yyyy hh24:mi:ss'), '三星I329', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94258, 'admin', '日志管理=>>日志查询', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('25-01-2011 16:57:37', 'dd-mm-yyyy hh24:mi:ss'), null, 81);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94269, 'admin', '后台管理退出', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('26-01-2011 08:26:28', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94347, 'admin', '用户管理=>用户查询', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('28-01-2011 08:09:38', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (94348, 'admin', '用户管理=>>停用启用用户', 'WinXPIEV6.0', null, '10.177.65.85', '0', to_date('28-01-2011 08:09:42', 'dd-mm-yyyy hh24:mi:ss'), null, 9);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95326, 'admin', '日志管理=>>日志查询', 'WinNTIEV6.0', null, '192.168.20.70', '0', to_date('31-08-2011 10:08:39', 'dd-mm-yyyy hh24:mi:ss'), null, 81);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95327, 'admin', '进入单位管理', 'WinNTIEV6.0', null, '192.168.20.70', '0', to_date('31-08-2011 10:09:27', 'dd-mm-yyyy hh24:mi:ss'), null, 21);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95328, 'admin', '进入单位管理', 'WinNTIEV6.0', null, '192.168.20.70', '0', to_date('31-08-2011 10:10:04', 'dd-mm-yyyy hh24:mi:ss'), null, 21);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95329, 'admin', '后台管理退出', 'WinNTIEV6.0', null, '192.168.20.70', '0', to_date('31-08-2011 10:10:23', 'dd-mm-yyyy hh24:mi:ss'), null, 0);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95354, '908001', '系统设置=>>版本更新', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:46:43', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 163);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95356, '908001', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:46:57', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95357, '908001', '综合查询=>>境内旅客查询', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:48:35', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 116);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95358, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:48:59', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95359, '908001', '综合查询=>>常住人口查询', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:51:04', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95360, '908001', '综合查询=>>在押人口查询', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:51:37', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1111);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95361, '908001', '综合查询=>>出租房房东查询', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:51:46', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1110);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95362, '908001', '综合查询=>>因私出境查询', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:51:59', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 114);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95364, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:52:22', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95365, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:54:30', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95366, '908001', '交警业务=>>机动车查询', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:56:25', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1222);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95368, '908001', '移动办公=>>通讯录', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:56:44', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95369, '908001', '移动办公=>>通讯录', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:57:16', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 141);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95371, '908001', '指挥调度', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:57:24', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 15);
insert into T_SYSTEMLOG (id, userid, accessmsg, equipment, devid, ip, logtype, createdate, phonetype, modeuleid)
values (95373, '908001', '综合查询=>>在押人口查询', null, '666-666-666-666-666-666', null, '1', to_date('05-09-2011 12:59:02', 'dd-mm-yyyy hh24:mi:ss'), '酷派N92', 1111);
commit;
prompt 498 records loaded
set feedback on
set define on
prompt Done.

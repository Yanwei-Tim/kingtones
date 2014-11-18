package com.kingtone.jw.service.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;

import com.kingtone.activity.oa.receipt.widget.TreeElement;
import com.kingtone.jw.service.dao.OaPermissionDAO;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.jwoa.bean.ArrayOfSuperiorsInfo;
import com.kingtone.jw.service.jwoa.bean.SuperiorsInfo;
import com.kingtone.jw.service.jwoa.pojo.FileType;
import com.kingtone.jw.service.jwoa.pojo.ReceiptType;
import com.kingtone.jw.service.util.ConvertUtil;
import com.kingtone.ssi.dao.SSIDAO;

public class OaPermissionDAOImpl extends SSIDAO implements OaPermissionDAO {

    public List getOaCYList(QueryEnvelop request) {
        String userId = request.getUserID();
        int pageSize = request.getPageSize();
        int pageNum = request.getPageNum();
        int start = pageNum * pageSize - pageSize;
        int end = pageNum * pageSize;
        CallableStatement cstm = null;
        Connection con = null;
        ResultSet rs = null;
        try {
            List list = new ArrayList();
            String sql = "call zsgaoa.p_gettasks_cy(?,?,?,?,?)";
            con = this.getDataSource().getConnection();
            cstm = con.prepareCall(sql);
            cstm.setString(1, "");
            cstm.setString(2, userId);
            cstm.setInt(3, 1);
            cstm.registerOutParameter(4, Types.INTEGER);
            cstm.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR);
            cstm.execute();
            int total = cstm.getInt(4);
            int countPage = total % pageSize > 0 ? total / pageSize + 1 : total
                    / pageSize;
            request.setTotalPage(countPage);
            cstm = con.prepareCall(sql);
            cstm.setString(1, "");
            cstm.setString(2, userId);
            cstm.setInt(3, total);
            cstm.registerOutParameter(4, Types.INTEGER);
            cstm.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR);
            cstm.execute();
            rs = (ResultSet) cstm.getObject(5);
            int i = 0;
            while (rs.next()) {

                Map map = new HashMap();
                map.put("PROCNAME", rs.getString("PROCNAME")); // 类型
                map.put("CREATETIME", rs.getString("CREATETIME"));// 时间
                map.put("TASKDEPICT", rs.getString("TASKDEPICT")); // 标题
                map.put("PREVUSERORG", rs.getString("PREVUSERORG")); // 部门
                map.put("TASKID", rs.getString("TASKID")); // 类型
                if (i >= start && i < end) {
                    list.add(map);
                }
                i++;

            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // TODO Auto-generated method stub
        return null;
    }

    public List getOaGList(QueryEnvelop request) {
        String userId = request.getUserID();
        int pageSize = request.getPageSize();
        int pageNum = request.getPageNum();
        int start = pageNum * pageSize - pageSize;
        int end = pageNum * pageSize;
        // TODO Auto-generated method stub
        CallableStatement cstm = null;
        Connection con = null;
        ResultSet rs = null;
        try {
            List list = new ArrayList();
            String sql = "call zsgaoa.p_gettasks_g(?,?,?,?,?)";
            con = this.getDataSource().getConnection();
            cstm = con.prepareCall(sql);
            cstm.setString(1, "");
            cstm.setString(2, userId);
            cstm.setInt(3, 1);
            cstm.registerOutParameter(4, Types.INTEGER);
            cstm.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR);
            cstm.execute();
            int total = cstm.getInt(4);
            int countPage = total % pageSize > 0 ? total / pageSize + 1 : total
                    / pageSize;
            request.setTotalPage(countPage);
            cstm = con.prepareCall(sql);
            cstm.setString(1, "");
            cstm.setString(2, userId);
            cstm.setInt(3, total);
            cstm.registerOutParameter(4, Types.INTEGER);
            cstm.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR);
            cstm.execute();
            rs = (ResultSet) cstm.getObject(5);
            int i = 0;
            while (rs.next()) {
                Map map = new HashMap();
                map.put("PROCNAME", rs.getString("PROCNAME")); // 类型
                map.put("CREATETIME", rs.getString("CREATETIME"));// 时间
                map.put("TASKDEPICT", rs.getString("TASKDEPICT")); // 标题
                map.put("PREVUSERORG", rs.getString("PREVUSERORG")); // 部门
                map.put("TASKID", rs.getString("TASKID")); // 类型
                if (i >= start && i < end) {
                    list.add(map);
                }
                i++;
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
        // TODO Auto-generated method stub
    }

    public Map getCyDetail(String uid) {
        // TODO Auto-generated method stub
        Map map = new HashMap();
        String sql = "select 编号,文件号,文件类别,标题,主题词,紧急程度,密级  from zsgaoa.传阅表 where guid='"
                + uid + "'";
        List list = this.getJdbcTemplate().query(sql, new QueryRowMaper());
        if (list.size() > 0)
            map = (Map) list.get(0);
        return map;
    }

    public Map getGDetail(String uid) {
        // TODO Auto-generated method stub
        Map map = new HashMap();
        String sql1 = "select 编号,文件类别,收文类别,文件号 来文号,收文号,密级,紧急程度,标题,完成时限   from zsgaoa.承办 where guid='"
                + uid + "'";
        String sql2 = "select serialnumber ,draftorg ,draftdate ,drafthuman ,contactno ,caption ,keyword   from zsgaoa.普通办文表 where guid='"
                + uid + "'";
        List list1 = this.getJdbcTemplate().query(sql1, new QueryRowMaper());
        List list2 = this.getJdbcTemplate().query(sql2, new QueryRowMaper());
        if (list1.size() > 0) {
            map = (Map) list1.get(0);
        } else if (list2.size() > 0) {
            map = (Map) list2.get(0);
        }
        return map;
    }

    public List getMindList(String uid) {
        // TODO Auto-generated method stub
        String sql1 = "select 处理步骤,填写意见 处理意见,填写人 处理人,填写部门 处理部门,填写时间 处理时间  from zsgaoa.收文意见表 where 编号 in(select 处理编号 from zsgaoa.承办 where guid='"
                + uid + "')";
        String sql2 = "select step 处理步骤, content 处理意见,fullname 处理人,orgname 处理部门,datetime 处理时间  from zsgaoa.普通办文意见表 where refguid='"
                + uid + "'";
        List list1 = this.getJdbcTemplate().query(sql1, new QueryRowMaper());
        List list2 = this.getJdbcTemplate().query(sql2, new QueryRowMaper());
        if (list1.size() > 0) {
            return list1;
        } else if (list2.size() > 0) {
            return list2;
        }
        return null;
    }

    private static class QueryRowMaper implements RowMapper {
        public String bizId = "";

        public QueryRowMaper() {
        }

        @SuppressWarnings("unchecked")
        public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
            HashMap<String, String> dataMap = new HashMap<String, String>();
            ResultSetMetaData rsMeta = rs.getMetaData();
            int columnCount = rsMeta.getColumnCount();
            for (int i = 1; i <= columnCount; i++) {
                String colName = rsMeta.getColumnName(i) == null ? null
                        : rsMeta.getColumnName(i);
                String colValue = rs.getString(i) == null ? null : rs
                        .getString(i).trim();
                // colValue = CommonTool.getCodeValue(bizId, colName, colValue);
                dataMap.put(colName, colValue);
            }
            return dataMap;
        }
    }

    public List getHisMindList(String uid) {
        String sql = "select 处理步骤,填写意见 处理意见,填写人 处理人,填写部门 处理部门,填写时间 处理时间"
                + "  from zsgaoa.收文意见表 where 编号 in(select 处理编号 from zsgaoa.收文表 where guid='"
                + uid + "')"
                + "  or 编号 in(select 处理编号 from zsgaoa.承办 where guid='" + uid
                + "')";
        List list = this.getJdbcTemplate().query(sql, new QueryRowMaper());
        return list;
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.kingtone.jw.service.dao.OaPermissionDAO#findVFileTypeMList(com.kingtone
     * .jw.service.jwoa.pojo.FileType)
     */
    @Override
    public List<FileType> findVFileTypeMList(FileType filetype)
            throws SQLException {
        String sql = "select 文件类别 as fileType,二级类别 as towType,REFCODEGUID as guId,AREA as area from zsgaoa.v_文件类别m t where 1 = 1";
        List params = new ArrayList();
        if (filetype != null) {
            if (filetype.getArea() != null && !filetype.getArea().isEmpty()) {
                sql += " and t.area = ? ";
                params.add(filetype.getArea());
            }
        }
        List<Map> list = this.getJdbcTemplate().queryForList(sql,
                params.toArray());
        FileType rsFt = null;
        List<FileType> resultList = new ArrayList<FileType>();
        for (Map map : list) {
            rsFt = new FileType();
            ConvertUtil.convert2Bean(map, rsFt);
            resultList.add(rsFt);
        }
        return resultList;
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.kingtone.jw.service.dao.OaPermissionDAO#findFileTypeList(com.kingtone
     * .jw.service.jwoa.pojo.FileType)
     */
    @Override
    public List<FileType> findTowFileTypeList(FileType filetype)
            throws SQLException {
        String sql = "select   t.文件类别 as fileType  , t.二级类别 as towType  , t.文件号格式 as codeFormat  , t.filenum as fileNUM  , t.minnum as minNUM  , t.guid as guId  , t.userid as userId  , t.corpId as corpId  , t.area as area   from zsgaoa.文件类别 t   where 1=1 ";
        List params = new ArrayList();
        if (filetype != null) {
            if (filetype.getCorpId() != null && filetype.getCorpId().isEmpty()) {
                sql += " and t.corpid = ? ";
                params.add(filetype.getCorpId());
            }
            if (filetype.getArea() != null && filetype.getArea().isEmpty()) {
                sql += " and t.area = ? ";
                params.add(filetype.getArea());
            }
            if (filetype.getUserId() != null && filetype.getUserId().isEmpty()) {
                sql += " and t.userid = ? ";
                params.add(filetype.getUserId());
            }
        }
        List<Map> list = this.getJdbcTemplate().queryForList(sql,
                params.toArray());
        FileType rsFt = null;
        List<FileType> resultList = new ArrayList<FileType>();
        for (Map map : list) {
            rsFt = new FileType();
            ConvertUtil.convert2Bean(map, rsFt);
            resultList.add(rsFt);
        }
        return resultList;
    }

    @Override
    public List<ReceiptType> findReceiptTypeList(ReceiptType receiptType)
            throws SQLException {
    	
    	//获取收文类型 OA方给的SQL by yangzm
        //String sql = "select t.类别 as type, t.guid as guId from zsgaoa.收文类别 t,zsgaoa.sys_user u where t.corpid=? and t.orgid = u.reg_runid and u.username=?";
        String sql = "select t.类别 as type, t.guid as guId from zsgaoa.收文类别 t,zsgaoa.sys_user u where t.corpid=? and t.orgid = u.reg_runid and u.userno=? and u.flag=1";
        
        List<String> params = new ArrayList<String>();
        params.add(receiptType.getCorpId());
        params.add(receiptType.getUserId());
        List<Map> list = this.getJdbcTemplate().queryForList(sql,
                params.toArray());
        ReceiptType obj = null;
        List<ReceiptType> resultList = new ArrayList<ReceiptType>();
        for (Map map : list) {
            obj = new ReceiptType();
            ConvertUtil.convert2Bean(map, obj);
            resultList.add(obj);
        }   
        return resultList;
    }

    /* (non-Javadoc)
     * @see com.kingtone.jw.service.dao.OaPermissionDAO#findBMlevelList(java.lang.String, java.lang.String)
     */
    @Override
    public List<String> findBMlevelList() throws SQLException {
        String sql = "select t.保密级别 as bmjb from 保密级别 t ";
        List<Map> list = this.getJdbcTemplate().queryForList(sql);
        List<String> resultList = new ArrayList<String>();
        for (Map map : list) {
            resultList.add((String)map.get("bmjb"));
        }
        return resultList;
    }

    /* (non-Javadoc)
     * @see com.kingtone.jw.service.dao.OaPermissionDAO#findjjcdList()
     */
    @Override
    public List<String> findjjcdList() throws SQLException {
        String sql = "select t.紧急程度 as jjcd from zsgaoa.紧急程度 t";
        List<Map> list = this.getJdbcTemplate().queryForList(sql);
        List<String> resultList = new ArrayList<String>();
        for (Map map : list) {
            resultList.add((String)map.get("jjcd"));
        }
        return resultList;
    }

    /* (non-Javadoc)
     * @see com.kingtone.jw.service.dao.OaPermissionDAO#findZTCList()
     */
    @Override
    public List<String> findZTCList() throws SQLException {
        String sql = "select t. 主题词 as ztc from zsgaoa.主题词 t";
        List<Map> list = this.getJdbcTemplate().queryForList(sql);
        List<String> resultList = new ArrayList<String>();
        for (Map map : list) {
            resultList.add((String)map.get("ztc"));
        }
        return resultList;
    }

    /* (non-Javadoc)
     * @see com.kingtone.jw.service.dao.OaPermissionDAO#findCYPSYList()
     */
    @Override
    public List<String> findCYPSYList() throws SQLException {
        String sql = "select t.常用批示语 as cypsy from zsgaoa.常用批示语 t";
        List<Map> list = this.getJdbcTemplate().queryForList(sql);
        List<String> resultList = new ArrayList<String>();
        for (Map map : list) {
            resultList.add((String)map.get("cypsy"));
        }
        return resultList;
    }

    /* (non-Javadoc)
     * @see com.kingtone.jw.service.dao.OaPermissionDAO#findUserToCYCList(java.lang.String)
     */
    @Override
    public List<String> findUserToCYCList(String userId) throws SQLException {
        String sql = "select t.常用词 as cyc from zsgaoa.公文审批常用词 t where t.foruser = ?";
        List<Map> list = this.getJdbcTemplate().queryForList(sql,new String[]{userId});
        List<String> resultList = new ArrayList<String>();
        for (Map map : list) {
            resultList.add((String)map.get("cyc"));
        }
        return resultList;
    }

    @Override
    public List<TreeElement> findSelorgtaxis() throws SQLException {
        List<TreeElement> listTree = new ArrayList<TreeElement>();
        String sql = "select  v_s.orgname, v_s.suporg, v_s.taxis from zsgaoa.v_selorgtaxis v_s where v_s.suporg = v_s.orgname";
        List<Map<String, String>> list = this.getJdbcTemplate().queryForList(sql);
        for (Map<String, String> map : list) {
            String orgname = map.get("orgname");
            TreeElement tree = new TreeElement(null, orgname);
            findChild(tree);
            listTree.add(tree);
        }
        return listTree;
    }

    private void findChild(TreeElement tree) throws SQLException {
        List<TreeElement> listTree = new ArrayList<TreeElement>();
        String sql = "select  v_s.orgname, v_s.suporg, v_s.taxis from zsgaoa.v_selorgtaxis v_s where  v_s.suporg <> v_s.orgname and v_s.suporg = ?";
        List<Map<String, String>> list = this.getJdbcTemplate().queryForList(sql,new String[]{tree.getOutlineTitle()});
        for (Map<String, String> map : list) {
            String orgname = map.get("orgname");
            TreeElement treeChild = new TreeElement(null, orgname);
            findChild(treeChild);
            tree.addChild(treeChild);
        }
    }
    
    @Override
    public List<TreeElement> findSelusertaxis(String area) throws SQLException {
        List<TreeElement> listTree = new ArrayList<TreeElement>();
        String sql = "select v_su.sup from zsgaoa.v_selusertaxis v_su where v_su.area = '@--'";
        List<Map<String, String>> supList = this.getJdbcTemplate().queryForList(sql);
        for (Map<String, String> supMap : supList) {
            String sup = supMap.get("sup");
            TreeElement supTree = new TreeElement(null, sup);
            String userSql = "select v_su.sup,v_su.users,v_su.username,v_su.px,v_su.area from zsgaoa.v_selusertaxis v_su where v_su.sup = ? and  v_su.area <> '@--'";
            List<Map<String, String>> userList = this.getJdbcTemplate().queryForList(userSql,new String[]{sup});
            for (Map<String, String> userMap : userList) {
                TreeElement userTree = new TreeElement(userMap.get("username"), userMap.get("users"));
                supTree.addChild(userTree);
            }
            listTree.add(supTree);
        }
        return listTree;
    }

    @Override
    public List<TreeElement> findOrgTree(String area, boolean isFindUser) throws SQLException {
        int orgType = 1;
        List<TreeElement> list = new ArrayList<TreeElement>();
        findOrgTree(area, null,orgType,list,isFindUser);
        return list;
    }
    
    private void findOrgTree(String area, String supOrgId,int orgType,List<TreeElement> list, boolean isFindUser) throws SQLException {
        String sql = "select  t.ORGNAME,t.CORPID,t.SUPORGID,t.suporg,t.ORGID,t.AREA,t.px from zsgaoa.sys_org t where t.area = ? and t.orgtype=?";
        List params = new ArrayList();
        params.add(area);
        params.add(orgType);
        if(supOrgId != null && !supOrgId.isEmpty()){
            sql += " and t.suporgid = ?";
            params.add(supOrgId);
        }
        List<Map<String, Object>> queryList = this.getJdbcTemplate().queryForList(sql, params.toArray());
        if(queryList != null && queryList.size() > 0){
            orgType++;
            for (Map<String, Object> map : queryList) {
                String orgName = map.get("ORGNAME").toString();
                Object orgId = map.get("ORGID");
                TreeElement treeElement = new TreeElement(orgId.toString(), orgName);
                findOrgTree(area, orgId.toString(), orgType,treeElement.getChildList(),isFindUser);
                if(treeElement.getChildList()!=null&&treeElement.getChildList().size() > 0){
                    treeElement.setMhasChild(true);
                }
                if(isFindUser){//如果加载人员的话，mhaschild永远设置为true
                    treeElement.setMhasChild(true);
                }
                list.add(treeElement);
            }
        }else if(isFindUser){//isFindUser为true时且已经到达底层部门则查询该部门人员
            List<Map<String,String>> userList = findUserList(supOrgId);
            TreeElement elementUser = null;
            for (Map<String, String> map : userList) {
                elementUser = new TreeElement(map.get("USERNAME"),map.get("FULLNAME"));
                list.add(elementUser);
            }
        }
    }
    
    @Override
    public List<Map<String,String>> findUserList(String orgId) throws SQLException {
        String sql = "select u.username,u.fullname from zsgaoa.sys_user u ,zsgaoa.sys_orgmenber m,zsgaoa.sys_org o where m.member = u.username and m.orgid = o.orgid and u.flag = 1  and o.orgid = ? order by u.px";
        return this.getJdbcTemplate().queryForList(sql,new String[]{orgId});
    }

    /* (non-Javadoc)
     * @see com.kingtone.jw.service.dao.OaPermissionDAO#findUserList(java.lang.String, java.lang.String)
     */
    @Override
    public List<Map<String, Object>> findUserList(String userId,
            String userName) throws SQLException {
        List<String> params = new ArrayList<String>();
        
        //modify by yangzm sql语句由OA方提供
        //String sql = "select * from zsgaoa.sys_user t where 1=1 and t.flag = 1 ";
        String sql = "select t.* ,o.orgname from zsgaoa.sys_user t ,zsgaoa.sys_org o where t.reg_runid=o.orgid and t.flag = 1 ";
        if(userId != null && !userId.isEmpty()){
            sql+=" and t.userno = ?";
            params.add(userId);
        }
        if(userName != null && !userName.isEmpty()){
            sql+=" and t.fullname like ?";
            params.add("%" + userName + "%");
        }
        return (List<Map<String, Object>>)this.getJdbcTemplate().queryForList(sql,params.toArray());
    }

    /* (non-Javadoc)
     * @see com.kingtone.jw.service.dao.OaPermissionDAO#findIssuingUserList(java.lang.String)
     */
    @Override
    public List<Map<String, Object>> findIssuingUserList(String area)
            throws SQLException {
        String sql = "select username,fullname as 签发人 from zsgaoa.v_sys_user where username in (select member from zsgaoa.sys_memberofrole where rolename='发文签发员') and area=?";
        List<String> params = new ArrayList<String>();
        params.add(area);
        return (List<Map<String, Object>>)this.getJdbcTemplate().queryForList(sql,params.toArray());
    }
    
    public List<Map<String, Object>> findOAOrganization()throws SQLException{
    	String sql = "select orgid,orgname,suporgid from zsgaoa.sys_org";
    	 return (List<Map<String, Object>>)this.getJdbcTemplate().queryForList(sql);
    }
    public List<Map<String, Object>> findOAUser()throws SQLException{//zsgaoa.
    	//String sql = "select username,fullname,mobilephone,reg_runid,userno,telephone,titleofpost from zsgaoa.sys_user";
    	String sql = "select distinct t.username,t.fullname,t.mobilephone,t.reg_runid,t.userno,t.telephone,u.duty titleofpost from zsgaoa.sys_user t left join zsgaoa.sys_orgmenber u "
    	+" on t.username=u.member ";
    	return (List<Map<String, Object>>)this.getJdbcTemplate().queryForList(sql);
    }
    
}

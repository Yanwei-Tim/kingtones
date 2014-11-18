package com.kingtone.androidpn.server.dao;

import java.util.List;

import com.kingtone.androidpn.server.bs.UserNotFoundException;
import com.kingtone.androidpn.server.domain.User;
import com.kingtone.jw.biz.xajw.domain.JwVideo;
/**
 * 
 * @author hanliqiang android pn
 *
 */
public interface UserPNDAO {
	public User findUserByID(String id)throws Exception;
	public void addUser(User user)throws Exception;
	public void editUser(User user)throws Exception;
    public void deleteUser(String id)throws Exception;
	public boolean findByID(String id)throws Exception;
    public List<User> findUserList(User user,int skipindex, int maxindex)throws Exception;
    public User findUserByUsername(String username) throws UserNotFoundException;
    public int findUserPNCount(User user)throws Exception;
}

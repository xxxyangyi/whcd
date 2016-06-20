package com.hand.service;

import java.util.List;

import com.hand.dao.common.IOperation;
import com.hand.entity.Scenery;
import com.hand.entity.User;

public interface IUserService{
	/***
	 * 添加用户
	 * @param user 用户对象
	 */
	public void AddUser(User user);
	
	/***
	 * 更新用户信息
	 * @param user 用户对象
	 */
	public void UpdateUser(User user);
	
	/**
	 * 获取用户
	 * @param mail 用户邮箱
	 * @return 用户对象
	 */
	public User GetUser(String mail);
	
	/***
	 * 判断是否存在用户
	 * @param user
	 * @return 布尔值
	 */
	public boolean IsUserExisted(String mail,String password);
	
	/***
	 * 获取总页数
	 * @param sqlSum sql语句
	 * @param numPage 每页显示记录
	 * @return 每页显示总数
	 */
	public Integer GetTotal(String sqlSum,Integer numPage);
	
	/***
	 * 分页查询用户
	 * @param sql 查询语句
	 * @param page 当前页
	 * @param numPage 每页显示总数
	 * @param total 总页数
	 * @return 名胜古迹对象列表
	 */
	public List<User> GetList(String sql,Integer page,Integer numPage,Integer total);
	
	/***
	 * 删除用户对象
	 * @param user 用户对象
	 */
	public void DeleteUser(User user);
	
	/***
	 * 获取男性用户数量
	 * @return 数量
	 */
	public Integer getManSum();
	
	/***
	 * 获取女性用户数量
	 * @return 数量
	 */
	public Integer getWomenSum();
	
	/***
	 * 获取游客数量
	 * @return 数量
	 */
	public Integer getUserSum();
	
	/***
	 * 获取专家数量
	 * @return 数量
	 */
	public Integer getExpertSum();
}

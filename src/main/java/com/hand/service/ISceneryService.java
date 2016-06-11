package com.hand.service;

import java.util.List;

import com.hand.entity.Scenery;

public interface ISceneryService {

	/***
	 * 创建一个名胜古迹
	 * @param scenery 名胜古迹对象
	 */
	public void AddScenery(Scenery scenery);
	
	/***
	 * 获取总页数
	 * @param sqlSum sql查询语句
	 * @param numPage 每页显示总数
	 * @return 页数
	 */
	public Integer GetTotal(String sqlSum,Integer numPage);
	
	/***
	 * 分页查询名胜古迹
	 * @param sql 查询语句
	 * @param page 当前页
	 * @param numPage 每页显示总数
	 * @param total 总页数
	 * @return 名胜古迹对象列表
	 */
	public List<Scenery> GetList(String sql,Integer page,Integer numPage,Integer total);
	
	/***
	 * 获取名胜古迹对象
	 * @param sceneryId 名胜古迹对象ID
	 * @return 名胜古迹对象
	 */
	public Scenery GetScenery(String sceneryId);
	
	/***
	 * 更细名胜古迹对象信息
	 * @param scenery 名胜古迹对象
	 */
	public void UpdateScenery(Scenery scenery);
	
	/***
	 * 删除名胜古迹
	 * @param scenery 名胜古迹对象
	 */
	public void DeleteScenery(Scenery scenery);
}

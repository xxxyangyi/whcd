package com.hand.service;

import java.util.List;
import java.util.Map;
import com.hand.entity.Scenery;

public interface ISceneryService {

	/***
	 * 创建一个名胜古迹
	 * @param scenery 名胜古迹对象
	 */
	public void AddScenery(Scenery scenery);
	
	/***
	 * 获取名胜古迹对象
	 * @param sceneryId 名胜古迹对象ID
	 * @return 名胜古迹对象
	 */
	public Scenery getScenery(String sceneryId);
	
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
	public List<Scenery> GetScenerys();
	/***
	 * 获取12个月内的名胜古迹的数据
	 * @return 名胜古迹的数据
	 */
	public Map getSceneryListByMonth();
	
}

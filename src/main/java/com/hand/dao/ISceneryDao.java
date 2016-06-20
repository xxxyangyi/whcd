package com.hand.dao;

import java.util.Map;

import com.hand.dao.common.IOperation;
import com.hand.entity.Scenery;

public interface ISceneryDao extends IOperation<Scenery> {
	
	/***
	 * 获取名胜古迹通过月份
	 * @return map类型的数据
	 */
	public Map getSceneryListByMonth();
}

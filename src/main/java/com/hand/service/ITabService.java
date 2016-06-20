package com.hand.service;

import java.util.List;

import com.hand.entity.Tab;

public interface ITabService {
	
	/***
	 * 获取所有标签
	 * @return 标签列表
	 */
	public List<Tab> getAll();
	
	/***
	 * 添加标签
	 * @param tab 标签对象
	 */
	public void addTab(Tab tab);

	/***
	 * 修改标签对象
	 * @param tab 标签对象
	 */
	public void updateTab(Tab tab);
	
	/***
	 * 获取标签对象
	 * @param id 标签对象id
	 * @return 标签对象
	 */
	public Tab getTab(Integer id);
	
}

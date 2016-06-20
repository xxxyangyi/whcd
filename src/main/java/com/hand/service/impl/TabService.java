package com.hand.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.dao.ITabDao;
import com.hand.entity.Tab;
import com.hand.service.ITabService;

@Transactional
@Service("tabService")
public class TabService implements ITabService {
	
	@Resource(name = "tabDao")
	private ITabDao tabDao;

	@Override
	public List<Tab> getAll() {
		// TODO Auto-generated method stub
		return tabDao.FindAll();
	}

	@Override
	public void addTab(Tab tab) {
		// TODO Auto-generated method stub
		tabDao.Create(tab);
	}

	@Override
	public void updateTab(Tab tab) {
		// TODO Auto-generated method stub
		tabDao.Update(tab);
	}

	@Override
	public Tab getTab(Integer id) {
		// TODO Auto-generated method stub
		return tabDao.FindOne(id);
	}
	
	
}

package com.hand.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.dao.ISceneryDao;
import com.hand.entity.Scenery;
import com.hand.service.ISceneryService;

@Transactional
@Service("sceneryService")
public class SceneryService implements ISceneryService {
	@Resource(name = "sceneryDao")
	private ISceneryDao sceneryDao;
	
	@Override
	public void AddScenery(Scenery scenery){
		sceneryDao.Create(scenery);
	}
	
	@Override
	public Scenery getScenery(String sceneryId){
		return sceneryDao.FindOne(sceneryId);
	}

	@Override
	public void UpdateScenery(Scenery scenery) {
		sceneryDao.Update(scenery);
	}

	@Override
	public void DeleteScenery(Scenery scenery) {
		sceneryDao.Delete(scenery);
	}

	@Override
	public List<Scenery> GetScenerys() {
		return sceneryDao.FindAll();
	}

	@Override
	public Map getSceneryListByMonth() {
		return sceneryDao.getSceneryListByMonth();
	}

	
}

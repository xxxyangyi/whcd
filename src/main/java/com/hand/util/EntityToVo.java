package com.hand.util;

import com.hand.entity.Scenery;
import com.hand.entity.vo.SceneryVO;

public class EntityToVo {
	static public SceneryVO SceneryToVo(Scenery s){
		
		SceneryVO svo=new SceneryVO();
		svo.setDetail(s.getDetail());
		svo.setCreateDate(DateTransform.dateToString(s.getCreateDate()));
		svo.setDetailSub(s.getDetailSub());
		svo.setId(s.getId());
		svo.setPicaddr(s.getPicaddr());
		svo.setSummary(s.getSummary());
		svo.setUserName(s.getUser_id().getName());
		return svo;
	} 
}

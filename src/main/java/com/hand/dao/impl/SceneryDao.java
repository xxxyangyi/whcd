package com.hand.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.stereotype.Repository;

import com.hand.dao.ISceneryDao;
import com.hand.dao.common.AbstractHibernateDao;
import com.hand.entity.Scenery;

@Repository("sceneryDao")
public class SceneryDao extends AbstractHibernateDao<Scenery> implements
		ISceneryDao {

	public SceneryDao() {
		super();
		// TODO Auto-generated constructor stub
		setClazz(Scenery.class);
	}

	@Override
	public Map getSceneryListByMonth() {
		// TODO Auto-generated method stub
		String sql="select m.month,ifnull(b.scenerysum,0)  scenerysum from "
				  +"(SELECT DATE_FORMAT(CURDATE(), '%Y-%m') AS `month` " 
				  +"UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 1 MONTH), '%Y-%m') AS `month` "
				  +"UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 2 MONTH), '%Y-%m') AS `month` "
				  +"UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 3 MONTH), '%Y-%m') AS `month` "
				  +"UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 4 MONTH), '%Y-%m') AS `month` "
				  +"UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 5 MONTH), '%Y-%m') AS `month` "
				  +"UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 6 MONTH), '%Y-%m') AS `month` "
				  +"UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 7 MONTH), '%Y-%m') AS `month` "
				  +"UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 8 MONTH), '%Y-%m') AS `month` "
				  +"UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 9 MONTH), '%Y-%m') AS `month` "
				  +"UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 10 MONTH), '%Y-%m') AS `month` "
				  +"UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 11 MONTH), '%Y-%m') AS `month`) as m "
				  +"left join "
				  +"(select DATE_FORMAT(s.createdate,'%Y-%m') as month,count(s.id) as scenerysum "
				  +"from scenery AS s where " 
				  +"DATE_FORMAT(s.createdate,'%Y-%m')>"
				  +"DATE_FORMAT(date_sub(curdate(), interval 12 month),'%Y-%m') "
				  +"group by month) as b "
				  +"on m.month = b.month group by m.month";
		Query query=getCurrentSession().createSQLQuery(sql).addScalar("month",StandardBasicTypes.STRING).addScalar("scenerysum",StandardBasicTypes.INTEGER).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		Map<String, Object> m3=new HashMap<String, Object>();
		int len=query.list().size();
		List<String> month=new ArrayList<String>();
		List<Integer> scenerysum=new ArrayList<Integer>();
		for(int i=0;i<len;i++){
			Map m=(Map)query.list().get(i);
			month.add((String) m.get("month"));
			scenerysum.add((Integer) m.get("scenerysum"));
		}	
		m3.put("month", month);
		m3.put("scenerysum", scenerysum);
		return m3;
	}
	
	
}

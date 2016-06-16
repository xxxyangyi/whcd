package com.hand.dao.impl;


import org.springframework.stereotype.Repository;


import com.hand.dao.IVoteDao;
import com.hand.dao.common.AbstractHibernateDao;
import com.hand.entity.Vote;

@Repository("voteDao")
public class VoteDao extends AbstractHibernateDao<Vote> implements IVoteDao {
	public VoteDao() {
		super();
		setClazz(Vote.class);
	}
}

package com.hand.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.dao.IVoteDao;
import com.hand.entity.Vote;
import com.hand.service.IVoteService;

@Transactional
@Service("voteService")
public class VoteService implements IVoteService {

	@Resource(name = "voteDao")
	private IVoteDao voteDao;

	@Override
	public void AddVote(Vote vote) {
		voteDao.Create(vote);
	}

	@Override
	public Vote GetVote(int id) {
		return voteDao.FindOne(id);
	}

	@Override
	public Vote update(Vote vote) {
		return voteDao.Update(vote);	
	}
	
	@Override
	public List<Vote> FindBySQL(String str) {
		return voteDao.FindBySQL(str);
	}

}

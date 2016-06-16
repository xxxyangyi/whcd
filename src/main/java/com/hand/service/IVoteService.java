package com.hand.service;

import java.util.List;

import com.hand.entity.Vote;

public interface IVoteService{
	public void AddVote(Vote vote);
	public Vote GetVote(int id);
	public Vote update(Vote vote);
	public List<Vote> FindBySQL(String str);
}

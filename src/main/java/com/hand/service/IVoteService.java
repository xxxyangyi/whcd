package com.hand.service;

import com.hand.entity.Vote;

public interface IVoteService{
	public void AddVote(Vote vote);
	public Vote GetVote(int id);
	public Vote update(Vote vote);
}

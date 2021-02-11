module VotesHelper
  def close_vote(id)
    v = Vote.find(id) 
    v.finished = true
    v.save
end
end

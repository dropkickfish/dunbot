module IrvHelper
  def new_vote(options, ballots)
    inputs = []
    ballot_array = []

    options.each do |o|
      name = o.name 
      inputs << name
    end

    participants = ballots.distinct.pluck(:participant_id)
    participants.each do |p|
      pballot = ballots.where(participant_id: p)
      combined = pballot.includes(:option).pluck(:position, :name)
      arr = []
      combined.each do |b|
          arr.insert(b[0]-1, b[1])
          ballot_array << arr
        end
    end

    irv = Irv.new(inputs)

    ballot_array.each do |ballot|
      irv.poll!(ballot)
    end

    return irv.winner
  end
end
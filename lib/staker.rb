require "staker/version"
require "staker/stak_over_flow"

module Staker
  def self.lookup(query)
  	StakOverFlow.new.query(query)
	end
end

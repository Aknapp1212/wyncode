require "/VoterSimMod.rb"
include VoterSimMod

activity = 0
valid_activity = 0
valid_to_create = 0
valid_to_update = 0
sim = VoterSim.new

def ask_get(string, var1, var2, valid_arr)
	puts string
	var1 = gets.chomp.downcase.to_sym
	var2 = valid_arr
	until var2.include?(var1)
		puts string
		var1 = gets.chomp.downcase.to_sy 
	end
	var1
end


until activity == :end

	activity = ask_quest(
		"""\nWhat would you like to do?
	  Create, List, Update, Remove, Vote, or End""",
		activity, 
		valid_activity, 
		[:create, :c, :list, :l, :update, :u, :remove, :r, :vote, :v, :end]
	)

	if activity == :create or activity == :c

		to_create = ask_quest(
			"""\nWhat would you like to create: 
			Politician or Voter?"""
			to_create,
			valid_to_create,
			[:voter, :v, :politician, :p]
		)

		if to_create == :politician or to_create == :p
			new_politician = Politician.new
			sim.add_politician(new_politician)
		end

		if to_create == :voter or to_create == :v
			new_voter = Voter.new
			sim.add_voter(new_voter)
		end

	elsif activity == :list or activity == :l
		sim.people.each do |voter|
			puts ""
			print "* Voter - #{voter.name} / #{voter.party} "
		end
		puts ""
		sim.politicians.each do |politician|
			puts ""
			print "* Politician - #{politician.name} / #{politician.party} / Votes: #{politician.num_votes}"
		end

	elsif activity == :update or activity == :u
		to_update = ask_quest(
			"\nUpdate Politician or Voter?",
			to_update,
			valid_to_update,
			[:voter, :v, :politician, :p]
		)

		if to_update == :politician or to_update == :p
			sim.change_politician_name
			sim.change_politician_party
		else
			sim.change_voter_name
			sim.change_voter_politics
		end

	elsif activity == :remove or activity == :r
		sim.remove_voter

	elsif activity == :vote or activity == :v
		election = Election.new(sim)
		election.organize_politicians
		election.organize_voters
		election.politician_votes
		election.people.each do |voter|
			puts ""
			print "* Voter - #{voter.name} / #{voter.party} /"
		end
		puts ""
		election.politicians.each do |politician|
			puts ""
			print "* Politician - #{politician.name} / #{politician.party} / Votes: #{politician.num_votes}"
		end
	end
end
module VoterSimMod
	class VoterSim
		attr_accessor :politicians, :people

		def initialize
			@politicians = []
			@people = []
		end

		def add_politician(new_politician)
			@politicians << new_politician
		end

		def add_voter(new_voter)
			@people << new_voter
		end


	class Politician
		attr_accessor :name, :party, :num_votes

		def initialize
			@num_votes = 0
			get_name
			get_party
		end

		def get_name
			puts "\nName?"
			@name = gets.chomp.capitalize
		end

		def get_party
			puts "\nParty? Democrat or Republican?"
			@party = gets.chomp.capitalize
			valid_party = ["Democrat", "D", "Republican", "R"]
			until valid_party.include?(@party)
				puts "\nPlease enter: Democrat or Republican."
				@party = gets.chomp.capitalize
			end
		end

	end

	class Voter
		attr_accessor :name, :party,

		def initialize
			get_name
			get_party
		end

		def get_name
			puts "\nName?"
			@name = gets.chomp.capitalize
		end

		def get_party
			puts "\nPolitics? Liberal, Conservative, Tea Party, Socialist, or Neutral?"
			@party = gets.chomp.capitalize
			valid_party = ["Liberal", "L", "Conservative", "C", "Tea Party", "T", "Socialist", "S", "Neutral", "N"]
			until valid_party.include?(@party)
				puts "\nPlease enter: Liberal, Conservative, Tea Party, Socialist, or Neutral."
				@party = gets.chomp.capitalize
			end
		end	
	end

	class Election
		attr_accessor :politicians, :people

		def initialize(voter_sim)
			@politicians = voter_sim.politicians
			@people = voter_sim.people
		end
		#Divides all candidates into arrays by party.
		def organize_politicians
			@republicans = politicians.select do |politician|
				politician.party == "Republican" or politician.party == "R"
			end

			@democrats = politicians.select do |politician|
				politician.party == "Democrat" or politician.party == "D"
			end
		end

		#Creates an array for each party of voter and adds voters to the appropriate array.
		def organize_voters
			@liberals = @people.select do |voter|
				voter.party == "Liberal" or voter.party == "L"
			end

			@conservatives = @people.select do |voter|
				voter.party == "Conservative" or voter.party == "C"
			end

			@tea_partiers = @people.select do |voter|
				voter.party == "Tea Party" or voter.party == "T"
			end

			@socialists = @people.select do |voter|
				voter.party == "Socialist" or voter.party == "S"
			end

			@neutrals = @people.select do |voter|
				voter.party == "Neutral" or voter.party == "N"
			end
		end

				#Politician voting for him/her self.
		def politician_votes
			@politicians.each do |politician|
				politician.num_votes += 1
				
			end
		end
	end
end
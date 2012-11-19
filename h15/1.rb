require 'open-uri'
require 'uri'
class Domain
	@URL="http://zamunda.net/browse.php"
	@pages=Array.new
	@current_page=0
	def pages=(pages)
		@pages[current_page]=pages
		@current_page+=1
	end	
end
class Pages
	@content = 0
	@url = 0
	@links = Array.new

    def follow(link)
	puts link
	file = open(link)
	contents = file.read
	@url=link
	@content=contents
	puts contents
	links = Array.new
	splited_links=Array.new
	z=0
	contents = contents.split('=')
		for i in 0..contents.length
			if(contents[i]== nil)
				p "End of Links"	
			elsif(contents[i].include? 'http')
					puts  contents[i]
					z+=1
					links[z]=contents[i]
			end
		end
		
		
			for i in 0..links.length
			check=false
			temp=Array.new
				if(links[i]==nil)
					puts "empty link"
				else
					while(check!=true)
						if(links[i][-4,1]=='.')
							check=true
							puts links[i]
						elsif(links[i].length<5)
							check=true
						else	
							links[i][-1,1]=''
						end
					end
				end	
			end	
			for i in 0..links.length
				if(links[i]==nil)
					puts "empthy link"
				elsif(links[i].include?'"')
					links[i]=links[i].split('"')
				end
			end
			for i in 0..links.length
			check=false
				if(links[i]==nil)
					puts "empthy link"
				else
					while(check!=true)
						if(links[i][0]=='h')
							check=true
						else
							links[i][0]=''
						end	
					end
				end		
			end
		@links=links
	
	end
	def generate_random
		r=rand(0..@links.length)
		return r
	end
	def return_link
		r=generate_random
		return @links[r][0]
	end
end
petel = Pages.new
kokoshka=Domain.new
petel.follow(gets)
puts "chooose depth of crawling"
depth=gets.to_i
for i in 0..depth
	kokoshka.pages=petel.follow(petel.return_link)
end					
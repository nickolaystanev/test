require 'anemone'

links=Array.new
def random_index(length)
	r=Random.rand(0...length)
	return r
end
def crawl(str)
	i=0
	links=Array.new
	Anemone.crawl(str) do |anemone|
	  anemone.on_every_page do |page|
		puts page.url
		links[i]=page.url
		i+=1
	  end
	end
	return links
end
puts "input your site"
str=gets
links=crawl(str)
puts "input your depth"
k=gets
length=links.length
puts random_index(length)
for z in 0..k.to_i
	index=random_index(length)
	links=crawl(links[index])
end
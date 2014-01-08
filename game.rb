
game_on = true
history = []
while game_on
pages_with_questions = {}

lines_grabbed = ""
key = ""

File.open("story.txt","r") do |infile|
  while (line = infile.gets)
    if line.index("~p")
      key = line.chomp
      lines_grabbed = ""
    else
      lines_grabbed += line
    end
    pages_with_questions[key] = lines_grabbed
  end
end

p1 = pages_with_questions.select {|k, v| k.index("~p1")}

i= 1
#-You want to make breakfast
p1.each do |k,v| 
  if k.match /^~p\d$/ 
  puts v
  
#-choices
else puts "#{i}. #{v}"
  i+= 1
end
end

choice = gets.to_i 

history.push("~p#{choice+1}")
p2 = pages_with_questions.select {|k, v| k.index("~p#{choice+1}")}

puts p2.values[0]


puts "Do you want to play again?"
replay = gets.chomp.downcase
if replay == "yes"
  game_on = true
elsif replay == "no"
  game_on = false
end
end

File.open("history.txt","w+") do |x|
h= ["Here's a little review of your decisions: \n\n\n"]
history.each{|y| h.push pages_with_questions[y] }
x.write h.join # h=[]
 # h.push(history.each {|y| puts pages_with_questions[y]})
 # puts h[x]
  
end
#this puts each key's value, but one at a time. 



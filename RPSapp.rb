require 'sinatra'

get '/' do
  erb :rps_prompt
end

post '/' do 
  selection = params[:selection]
  rand_val = rand(3)
  if selection == "Rock"
    human_val = 0
  elsif selection == "Paper"
    human_val = 1
  else
    human_val = 2
  end 

  if (human_val == 0 && rand_val == 2) || (human_val == 1 && rand_val == 0) || (human_val == 2 && rand_val == 1)
    winner = "victory for you!" #0 for human 1 for computer 2 for tie
  elsif (human_val == 0 && rand_val == 1) || (human_val == 1 && rand_val == 2) || (human_val == 2 && rand_val == 0)
    winner = "victory for the computer!"
  else
    winner = "tie!"
  end  
  erb :result, locals: {victor: winner}
end
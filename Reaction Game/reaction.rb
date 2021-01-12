require 'ruby2d'

#The first sets the application title and the second one sets the background color 
set title: "Reaction Game"
set background: "blue"

#This line will show this text when the initial screen appears
message = Text.new("Click to begin")

#This var is going to be used to know when the game has started
g_start = false

#This var was created so I can check if the user is clicking where the square is
square = nil

#These var were created to receive the time from the moment that the square was displayed to the moment that the user clicked it
start_time = nil
duration = nil

#This 'do' is being used to let the user click on the screen and then it prints the x and the y where the user clicked
on :mouse_down do |event|

    #If the game starts this part of the code will run
    if g_start
        #This code will check if the user has clicked in the right location of the square and show the time in milliseconds that he needed to do it. After that, if the square will be removed and if the user clicks again he will start a new game.
        if square.contains?(event.x, event.y)
            duration = ((Time.now - start_time) * 1000).round
            message = Text.new("You took #{duration} milliseconds!. Click to restart")
            square.remove
            g_start = false
        end
    #When the game has not started yet this code will run
    #This code will remove the start message, create a square in a random position and start the game.
    else
        message.remove
        square = Square.new(
        x: rand(get(:width)-25), y: rand(get(:height)-25),
        size: 20,
        color: 'red'
        )
        start_time = Time.now
        g_start = true
    end
end

show

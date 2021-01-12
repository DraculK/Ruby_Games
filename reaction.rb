require 'ruby2d'
#This var is going to be used to know when the game has started
start = false

#This var was created so I can check if the user is clicking where the square is
square = nil

#These var were created to receive the time from the moment that the square was displayed to the moment that the user clicked it
start_time = nil
duration = nil

#The first sets the application title and the second one sets the background color 
set title: "Be as fast as you can"
set background: "blue"

#This line will show this text when the initial screen appears
message = Text.new("Click to begin")

#This 'do' is being used to let the user click on the screen and then it prints the x and the y where the user clicked
on :mouse_down do |event|
    puts event.x, event.y
    if start
        if square.contains?(event.x, event.y)
            duration = Time.now - start_time
            Text.new("You took #{duration}. Click to restart")
        end
    else
        message.remove
        square = Square.new(
        x: 100, y: 200,
        size: 20,
        color: 'red',
        )
    end

    start_time = Time.now
    start = true
end

show
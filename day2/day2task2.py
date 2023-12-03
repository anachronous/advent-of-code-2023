output = 0

with open("input.txt", "r") as file:
    for line in file:
        game_id = int("".join(str(number) for number in [i for i in line.split(":")[0] if i.isdigit()]))
        
        line = line.split(':')[1].strip()
        games = line.split("; ")
            
        
        red = -1
        green = -1
        blue = -1
        
        print("Game ID: " + str(game_id))
        
        for game in games:
            colors = game.split(", ")
            print(str(colors))
            
            for color_part in colors:
                amt, color = color_part.split()
                amt = int(amt)
                
                if color == "red" and amt > red:
                    red = amt
                    print("new red: " + str(red))
                if color == "green" and amt > green:
                    green = amt
                    print("new green: " + str(green))
                if color == "blue" and amt > blue:
                    blue = amt
                    print("new blue: " + str(blue))
        
        print(str(output) + " ; " + str(red*green*blue))            
        output += red*green*blue

print("Task 2: " + str(output))
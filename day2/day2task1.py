red = 12
green = 13
blue = 14

output = 0

with open("input.txt", "r") as file:
    for line in file:
        game_id = int("".join(str(number) for number in [i for i in line.split(":")[0] if i.isdigit()]))
        print(game_id)
        
        line = line.split(':')[1].strip()
        games = line.split("; ")

        flag_is_over = False
        
        for game in games:
            colors = game.split(", ")
            print(colors)
            
            for color_part in colors:
                amt, color = color_part.split()
                amt = int(amt)
                
                if color == "red" and amt > red:
                    flag_is_over = True
                    print("red is over")
                elif color == "green" and amt > green:
                    flag_is_over = True
                    print("green is over")
                elif color == "blue" and amt > blue:
                    flag_is_over = True
                    print("blue is over")
                    
        if not flag_is_over:
            output += game_id

print("Task 1: " + str(output))
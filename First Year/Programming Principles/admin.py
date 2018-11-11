# Name:  Justin Homsi
# Student Number:  10373949
# Program: Game Finder (Admin)
# Description: This program is designed to allow a user to manage a collection of games stored in a text file.


# Import the json module to allow us to read and write data in JSON format.
import json



# This function repeatedly prompts for input until an integer is entered.
def inputInt(prompt):
    while True:
        intValue = input(prompt)

        try:
            intValue = (int(intValue))

        except ValueError:
                print('Please enter an integer')
                continue

        return intValue



# This function repeatedly prompts for input until something (not whitespace) is entered.
def inputSomething(prompt):
    while True:
        somethingValue = input(prompt)

        somethingValue.strip()

        if somethingValue.isspace(): # Checks if the somethingValue variable only contains whitespace, if it does, prints an error message and returns to the start of the loop.
            print('Please enter at least one character')
            continue

        else:
            return (str(somethingValue)) # Returns the value of somethingValue as a string
            break



# This function opens "data.txt" in write mode and writes the data to it in JSON format.
def saveChanges(dataList):
    f = open('data.txt', 'w')
    json.dump(dataList, f)
    f.close()
    
    




# Here is where you attempt to open the file and read the data / create an empty list.
while True:
    try:
        f = open('data.txt', 'r')
        data = json.load(f)
        f.close()

    except: # If any exceptions occur while trying to open the file, the data variable will be set to an empty list
        data = []

    break




# Print welcome message, then enter the endless loop which prompts the user for a choice.
print('Welcome to the Game Finder Admin Program.')

while True:
    print('Choose [a]dd, [l]ist, [s]earch, [v]iew, [d]elete or [q]uit.')
    choice = input('> ')
        
    if choice == 'a':
        # Add a new game.
        gameName = inputSomething('Enter the name of the game: ')
        for index, i in enumerate(data): # Check if a game with the same name exists in the data list, if it does, prints a message informing the user and showing them the index number and name of the game, then breaks out of the loop.
            if gameName == i['name']:
                print('A game with this name already exists.', '\n', 'Index:', ' ', 'Name:', '\n',
                      index, '      ', i['name'])
                break
        else: # If the game does not exist, the user will be prompted to enter the min and max number of players, duration of the game, and min player age, the program will then compile the information, append it to the data list and save the changes.
            minPlayers = inputInt('Enter the minimum amount of players: ')
            maxPlayers = inputInt('Enter the maximum amount of players: ')
            gameDuration = inputInt('Enter the duration of the game (in minutes): ')
            minPlayerAge = inputInt('Enter minimum player age: ')
            compiledInfo = {'name': gameName,'min_players': minPlayers,'max_players': maxPlayers,'duration': gameDuration,'min_age': minPlayerAge,}
            data.append(compiledInfo)
            saveChanges(data)
            print('Game Added Successfully')

        


    
    elif choice == 'l':
        # List the current games.
            if data == []: # If the data list is empty, print an error message
                print('No Games Saved')

            else: # If the list is not empty, the program cycles through the list and prints the index number and name of every game
                print('List of games:')
                for index, i in enumerate(data):
                    print(' ',str(index) + ')', i['name'])



    elif choice == 's':
        # Search the current games.
        if data == []: # If the data list is empty, print an error message
            print('No Games Saved')

        else: # If the list is not empty, the program cycles through the list and prints the index number and name of games matching the search term.
            searchTerm = inputSomething('Enter search term: ')
            print('Saved games matching ', searchTerm)
            for index, i in enumerate(data):
                if searchTerm.lower() in i['name'].lower():
                    print(index, ' ', i['name'])



    elif choice == 'v':
        # View a game.
        if data == []: # If the data list is empty, print an error message
            print('No Games Saved')

        else: # If the list is not empty, the program cycles through the list and prints the name, min players, max players, duration and minimum player age of the index number entered.
            try:
                viewIndex = inputInt('Enter index number of the game you would like to view: ')
                if data[viewIndex] in data:
                        print(' ', data[viewIndex]['name'], '\n',
                              '   Players:', data[viewIndex]['min_players'], '-', data[viewIndex]['max_players'], '\n',
                              '   Duration:', data[viewIndex]['duration'], 'minutes', '\n',
                              '   Minimum Player Age:', data[viewIndex]['min_age'])

            except IndexError: # If the user enters an index number with no corresponding game, the program prints an error message.
                print('Invalid Index Number')
        

    elif choice == 'd':
        # Delete a game.
        if data == []: # If the data list is empty, print an error message
            print('No Games Saved')

        else: # If the list is not empty, the program prompts the user for the index number of the game they want to delete, it will then cycle through the list to find the corresponding game and delete its data.
            try:
                deleteIndex = inputInt('Enter index number of the game you would like to delete: ')
                if data[deleteIndex] in data:
                    data.remove(data[deleteIndex])
                    saveChanges(data)
                    print('Game Deleted Successfully')

            except IndexError: # If the user enters an index number with no corresponding game, the program prints an error message
                print('Invalid Index Number')

        

    elif choice == 'q':
        # Quit the program.
        print('Goodbye')
        break # Breaks out of the main endless loop



    else:
        # Prints "invalid choice" message if none of the above choices are entered.
        print('Invalid choice')

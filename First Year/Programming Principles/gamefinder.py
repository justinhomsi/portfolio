# Name:  Justin Homsi
# Student Number:  10373949



# Import the required modules.
import tkinter
import tkinter.messagebox
import json


class ProgramGUI:

    def __init__(self):
        # This is the constructor of the class.
        # It is responsible for loading and reading the data file and creating the user interface.
        self.main = tkinter.Tk() # Creates the main window
        self.main.title('Game Finder') # Sets the title of the window
        self.main.geometry('250x280') # Sets the size of the window
        while True:
            try: # Attempts to open the 'data.txt' file and load the data in json format
                f = open('data.txt', 'r')
                self.data = json.load(f)
                f.close()
                break

            except: # If any exceptions occur, display a an error messagebox to the user and destroy the main window
                tkinter.messagebox.showerror('Error', 'Missing/Invalid File')
                self.main.destroy()
                return

        # The program creates all the frames here
        self.frameTitleConstraints = tkinter.Frame(self.main, padx = 0, pady = 2)
        self.frameLabelPlayers = tkinter.Frame(self.main, padx = 0, pady = 2)
        self.frameLabelTime = tkinter.Frame(self.main, padx = 0, pady = 2)
        self.frameLabelMinAge = tkinter.Frame(self.main, padx = 0, pady = 2)
        self.frameButtonSubmit = tkinter.Frame(self.main, padx = 0, pady = 4)
        self.frameTitleMatching = tkinter.Frame(self.main, padx = 0, pady = 15)
        self.frameMatchingGames = tkinter.Frame(self.main, padx = 0, pady = 0)

        # Creates the Constraints label inside the constraints frame, then packs both the label and frame.
        self.titleConstraints = tkinter.Label(self.frameTitleConstraints, justify = 'center', text = 'Constraints:', font = ('Arial', 15), fg = 'red')
        self.titleConstraints.pack()
        self.frameTitleConstraints.pack()

        # Creates the Players label and Entry box inside the Players frame, then packs the entry box, label and frame.
        self.labelPlayers = tkinter.Label(self.frameLabelPlayers, width = '20', text = 'Number of players:', font = ('Arial', 10), fg = 'black')
        self.entryPlayers = tkinter.Entry(self.frameLabelPlayers, width = '5')
        self.entryPlayers.pack(side='right')
        self.labelPlayers.pack(side='left')
        self.frameLabelPlayers.pack()

        # Creates the Time label and Entry box inside the Time frame, then packs the label, entry box and frame.
        self.labelTime = tkinter.Label(self.frameLabelTime, width = '20', text = 'Time available (mins):', font = ('Arial', 10), fg = 'black')
        self.entryTime = tkinter.Entry(self.frameLabelTime, width = '5')
        self.entryTime.pack(side='right')
        self.labelTime.pack(side='left')
        self.frameLabelTime.pack()

        # Creates the Minimum Age label and Entry box inside the MinAge frame, then packs the label, entry box and frame.
        self.labelMinAge = tkinter.Label(self.frameLabelMinAge, width = '20', text = 'Age of youngest player:', font = ('Arial', 10), fg = 'black')
        self.entryMinAge = tkinter.Entry(self.frameLabelMinAge, width = '5')
        self.entryMinAge.pack(side='right')
        self.labelMinAge.pack(side='left')
        self.frameLabelMinAge.pack()

        # Creates the Submit button inside the Button frame, then packs both the button and the frame.
        self.buttonSubmit = tkinter.Button(self.frameButtonSubmit, text = 'Submit', font = ('Arial', 10), fg = 'black', command = self.findGames)
        self.buttonSubmit.pack()
        self.frameButtonSubmit.pack()

        # Creates the Matching Games label inside the TitleMatching frame, then packs both the label and frame.
        self.titleMatchingGames = tkinter.Label(self.frameTitleMatching, justify = 'center', text = 'Matching Games:', font = ('Arial', 15), fg = 'red')
        self.titleMatchingGames.pack()
        self.frameTitleMatching.pack()

        # Creates the label to display a list of matching games inside the MathingGames frame, then packs both the label and the frame.
        self.matchingGames = tkinter.Label(self.frameMatchingGames, text = 'No criteria submitted', font = ('Arial', 10))
        self.matchingGames.pack()
        self.frameMatchingGames.pack()

        # Sets focus to the Players entry box and starts the mainloop of the program.
        self.entryPlayers.focus()
        tkinter.mainloop()
        



    def findGames(self):
        # This method finds and displays games matching the criteria entered by the user.
        try: # The program attempts to convert the values entered by the user in the three entry boxes to integers.
            players = int(self.entryPlayers.get())
            duration = int(self.entryTime.get())
            minAge = int(self.entryMinAge.get())

        except ValueError: # If a value error exception occurs, display an error messagebox.
            tkinter.messagebox.showerror('Error', 'Invalid Criteria Specified')

        else: # If no exception occurs, destroy the widgets in the MatchingGames frame and set the noMatches variable to True.
            for widget in self.frameMatchingGames.winfo_children():
                widget.destroy()
            noMatches = True
            for i in self.data: # The program then loops through the data variable to find games matching the criteria entered by the user, adding the names of matching games to the results variable
                if players >= i['min_players'] and players <= i['max_players'] and duration >= i['duration'] and minAge >= i['min_age']:
                    results = i['name']
                    self.matchingGames = tkinter.Label(self.frameMatchingGames, text = results, font = ('Arial', 10)) # Re-creates the matchingGames label inside the MatchingGames frame, setting the text of the label to what is stored in the results variable.
                    self.matchingGames.pack()
                    noMatches = False # If a match is found, sets the noMatches variable to false
                            

                elif noMatches == True: # Only runs if no matches were found while looping through the data variable
                    for widget in self.frameMatchingGames.winfo_children(): # Destroys the widgets in the MatchingGames frame
                        widget.destroy()
                    self.matchingGames = tkinter.Label(self.frameMatchingGames, text = 'No matching games', font = ('Arial', 10)) # Re-creates the matchingGames label inside the MatchingGames frame and sets the text to 'No matching games'.
                    self.matchingGames.pack()


                        




# Create an object of the ProgramGUI class to begin the program.
gui = ProgramGUI()

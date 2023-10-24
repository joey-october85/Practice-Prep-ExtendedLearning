# Project: Super Stopwatch

# Say you want to track how much time you spend on boring tasks you haven’t
# automated yet. You don’t have a physical stopwatch, and it’s surprisingly difficult
# to find a free stopwatch app for your laptop or smartphone that isn’t
# covered in ads and doesn’t send a copy of your browser history to marketers.
# (It says it can do this in the license agreement you agreed to. You did read
# the license agreement, didn’t you?) You can write a simple stopwatch program
# yourself in Python.
# At a high level, here’s what your program will do:
# TODO: 1. Track the amount of time elapsed between presses of the enter key, with each key press starting a new “lap” on the timer.
# TODO: 2. Print the lap number, total time, and lap time. Keeping Time, Scheduling Tasks, and Launching Programs 393 

# This means your code will need to do the following:
# TODO: 1. Find the current time by calling time.time() and store it as a timestamp at the start of the program, as well as at the start of each lap.
# TODO: 2. Keep a lap counter and increment it every time the user presses enter.
# TODO: 3. Calculate the elapsed time by subtracting timestamps.
# TODO: 4. Handle the KeyboardInterrupt exception so the user can press ctrl-C to quit.



# Step 1: Set Up the Program to Track Times

import time

# Display the programs instructions
print('Press ENTER to begin. Afterwards, press ENTER to "click" the stopwatch. \n'
      'Press Ctrl-C to quit.')

# Press ENTER to begin
input()
print('Started')

# Get the first lap's start time
startTime = time.time()
lastTime = startTime
lapNum = 1

# Start tracking the lap times.
try:
    while True:
        lapTime = round(time.time() - lastTime,2)
        totalTime = round(time.time() - startTime,2)
        print('Lap #%s: %s (%s)' % (lapNum, totalTime, lapTime), end='')
        # print('Lap #%s: %s (%s)' % (lapNum, totalTime, lapTime), end='')
        lapTime += 1
        # Reset the last lap time
        lastTime = time.time() 
except KeyboardInterrupt:
    # Handle the Ctrl-C exception to keep its error message from displaying
    print('/nDone.')
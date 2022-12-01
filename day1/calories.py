import os

def sumup(elfcalories):
    elfSum = 0
    for cals in elfcalories:
        calsInt = int(cals)
        elfSum += calsInt 
    return elfSum

def calories():
    cwd = os.getcwd()
    location = os.path.realpath(
      os.path.join(cwd, os.path.dirname(__file__))
    )
    joinedlocation = os.path.join(location, 'input.txt')
    input_file = open(joinedlocation)
    lines = input_file.readlines()
    
    listofelves = [[]]
    elfnumber = 0

    size = os.path.getsize(joinedlocation)
    print("SIZE: ", size)

    biggestCal = 0
    biggestElf = 0

    for line in lines:
      if (line != "\n"):
        listofelves[elfnumber].append(line.strip())
      else:
        summedCal = sumup(listofelves[elfnumber])
        listofelves[elfnumber] = summedCal 
        if (summedCal > biggestCal):
            biggestCal = summedCal
            biggestElf = elfnumber
        elfnumber += 1
        listofelves.append([])
    listofelves[elfnumber] = sumup(listofelves[elfnumber])
    print(biggestCal, biggestElf)

    listofelves.sort(reverse=True)
    threeBiggestTogether = 0

    for biggestCalIndex in range(3):
      print(biggestCalIndex)
      threeBiggestTogether += listofelves[biggestCalIndex]

    print(threeBiggestTogether)
    
calories()

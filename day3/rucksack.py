file1 = open('input.txt')
Items = file1.readlines()

sum = 0

def getPriority(first, second):
  global sum
  commonLetters=list(set(first)&set(second))
  if (len(commonLetters)):
    letterToConvert=commonLetters[0]
    if (letterToConvert.isupper()):
      sum += ord(letterToConvert) - 38
    if (letterToConvert.islower()):
      sum += ord(letterToConvert) - 96
    


for line in Items:
  parsedLine = line.rstrip()
  lineLength = len(parsedLine)
  halfLength = lineLength//2
  firstHalf = line[0:halfLength]
  secondHalf = line[-halfLength:]
  getPriority(firstHalf, secondHalf)

print(sum)
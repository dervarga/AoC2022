const fs = require('fs/promises')
const readline = require('readline')

const aoc = async () => {
  try {
    const data = await fs.readFile('./input.txt', 'utf-8')
    const lines = data.split("\n"); 
    const result = lines.reduce((sum, currentLine) => {
      const firstPart = [...currentLine.substring(0, currentLine.length/2)]
      const secondPart = [...currentLine.substring(currentLine.length/2, currentLine.length)]
      const intersected = firstPart.filter(ch => secondPart.indexOf(ch) !== -1)[0]
      console.log({firstPart, secondPart, intersected});
      if (intersected) {
        const theCode = intersected.charCodeAt(0)
        const toAdd = theCode > 96 ? theCode - 96 : theCode - 38 
        return sum + toAdd
      }
      return sum
    }, 0)
    console.log(result);
  } catch (error) {
   console.log({error}); 
  }
}

aoc()
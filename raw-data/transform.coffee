fs = require 'fs'

data = JSON.parse fs.readFileSync 'trigrams.json'
first = (str) ->
  str.split('\n')[0]
second = (str) ->
  str.split('\n')[1]
trigrams = data.trigrams.map (elem, index) -> 
  {
    "number" : elem[0]
    "figure" : elem[1]
    "binary" : elem[2]
    "name" : {
      "latin" : second elem[3]
      "chinese" : first elem[3]
    }
    "translation" : {
      "wilhelm" : elem[4]
    }
    "image" : {
      "latin" : first elem[5]
      "chinese" : second elem[5]
    }
    "direction" : elem[6]
    "family relationship": elem[7]
    "body part" : elem[8]
    "attribute" : elem[9]
    "stage" : elem[10]
    "animal" : {
      "latin" : second elem[11]
      "chinese" : first elem[11]
    }
  }
 
process.stdout.write JSON.stringify trigrams

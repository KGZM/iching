'use strict';

angular.module('ichingApp')
  .service 'ConsultationMethods', () ->
    rollDice = this.rollDice = -> Math.floor(Math.random() * 6) + 1 for _ in [1..2]
    this.rollToFormulas = (roll) ->
      formulas = [""]
      rolls = [roll, ""]
      changingLine = null
      changing = false
      for position, index in roll
        if position in "69" and not changing
          changing = true
          changingLine = index + 1
          formulas.push formulas[0]
          formulas[1] += if position in "79" then 0 else 1
          rolls[1] += if position in "79" then 8 else 7
        else if changing
          formulas[1] += if position in "79" then 1 else 0
          rolls[1] += if position in "79" then 7 else 8

        formulas[0] += if position in "79" then 1 else 0
      {rolls, formulas, changing, changingLine}

    this.roll = ->
      formula = ""
      isEven = (n) -> n % 2 == 0
      for line in [1..6]
        leadDice = if rollDice().every(isEven) then 2 else 3
        secondaryDice = rollDice()
          .map (n) ->
            if isEven n then 2 else 3
          .reduce (a,b) -> a + b
        result = leadDice + secondaryDice
        formula += result
      return formula
    return this

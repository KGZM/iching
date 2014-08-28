'use strict'

describe 'Service: ConsultationMethods', () ->

  # load the service's module
  beforeEach module 'ichingApp'

  # instantiate service
  ConsultationMethods = {}
  beforeEach inject ($injector) ->
    ConsultationMethods = $injector.get('ConsultationMethods')

  it 'should roll two dice properly', () ->
    expect(ConsultationMethods.rollDice().length).toBe 2

  it 'should roll six times properly', () ->
    roll = ConsultationMethods.roll()
    expect(roll.length).toBe 6

  it 'should convert a roll into a result object', () ->
    roll = ConsultationMethods.roll()
    result = ConsultationMethods.rollToFormulas(roll)
    expect(result.rolls.length).toBeGreaterThan 0
    expect(result.formulas.length).toBeGreaterThan 0
    expect([true, false]).toContain result.changing
    expect([null].concat [0..6]).toContain result.changingLine

  it 'should handle changing lines properly', () ->
    roll = '697777'
    result = ConsultationMethods.rollToFormulas(roll)
    expect(result.changing).toBe true
    expect(result.changingLine).toBe 1
    expect(result.rolls.length).toBe 2
    expect(result.formulas.length).toBe 2
    expect(result.rolls[0]).toBe roll
    expect(result.rolls[1]).toBe '777777'
    expect(result.formulas[0]).toBe '011111'
    expect(result.formulas[1]).toBe '111111'




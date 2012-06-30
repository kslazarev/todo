# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Task.create([
  {
    :content => 'First task',
    :due_date => Date.today
  }, {
    :content => 'Second task',
    :due_date => Date.today,
    :complete => true
  }, {
    :content => 'Third task',
    :due_date => Date.today,
    :important => true
  }, {
    :content => 'Forth task',
    :due_date => Date.today,
    :important => true,
    :complete => true
  }, {
    :content => 'Fifth task',
    :due_date => Date.today - 1.month,
    :important => true,
  }, {
    :content => 'Sixth task',
    :due_date => Date.today + 1.month,
    :complete => true,
  }, {
    :content => 'Seventh task',
    :due_date => Date.today + 1.day,
    :important => true,
    :complete => true
  }
])
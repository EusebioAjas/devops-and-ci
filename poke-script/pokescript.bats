#!/usr/local/bin/bats
load bats-extra

@test "should fetch a pokemon data when Id is passed" {
  run bash pokescript.sh 1
  assert_output "Id=1, name=bulbasaur, weight=69, height=7, order=1"
}

@test "should fetch a pokemon data when name is passed" {
  run bash pokescript.sh ditto
  assert_output "Id=132, name=ditto, weight=40, height=3, order=214"
}

@test "should print a message when pokemon doesn't exists" {
  run bash pokescript.sh Dodonzo
  assert_output "Pokemon not found."
}

@test "print usage banner with no value given" {
  run bash pokescript.sh
  assert_output "Usage: pokescript.sh <name|id>"
}

@test "Incorrect arguments" {
  run bash pokescript.sh Chameleon Charminster
  assert_output "Usage: pokescript.sh <name|id>"
}


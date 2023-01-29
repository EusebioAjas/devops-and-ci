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

@test "should report a message when pokemon doesn't exists" {
  run bash pokescript.sh Dodonzo
  assert_output "Pokemon not found."
}

@test "should report a message when no pokemon name is passed" {
  run bash pokescript.sh
  assert_output "No pokemon name is passed."
}

@test "should report a message when incorrect number of arguments is passed" {
  run bash pokescript.sh Chameleon Charminster
  assert_output "Incorrect number of arguments passed. Only one argument is allowed."
}


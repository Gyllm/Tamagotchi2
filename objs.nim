import utils

type
  Tamagotchi* = ref object of RootObj
    nome*:string
    idade*:int
    peso*:int
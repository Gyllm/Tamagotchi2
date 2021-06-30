import objs
import strutils
import strformat
import random

var 
  bichinho:seq[Tamagotchi]
  peso:int
  idade:int
  vida:int
  c=9
  d=9
  cm=3
  dm=3
  bc=3

proc linha() =
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++"

proc menu*() =
  linha()
  echo """
  BICHINHO VIRTUAL TAMAGOTCHI
  [1] - Criar novo Tamagotchi
  [2] - SAIR"""
  linha()

proc comer*()=
  var bichinho: Tamagotchi = Tamagotchi()
  echo """
    Seu Bichinho deve comer:
    [1] - Muito
    [2] - Pouco"""
  var cm = parseInt(readline(stdin))
  if cm == 1:# echo "comendo muito"
    if peso + 5 <= 20:
      peso = peso + 5
      echo &"Seu bichinho está com {peso} Kg \n "
      echo &"Seu bichinho está cansado \n "
    else:
      echo "Seu bichinho morreu de excesso de peso"
      vida=0
  elif cm == 2:# echo "comendo pouco"
    if peso + 3 <= 20:
      peso = peso + 3
      echo &"Seu bichinho está com {peso} Kg \n "
    else:
      echo "Seu bichinho morreu de excesso de peso"
      vida=0
  else:
    echo "Erro: Opção Inválida"

proc dormir*()=
  var bichinho: Tamagotchi = Tamagotchi()
  echo """
    Seu Bichinho deve dormir:
    [1] - Muito
    [2] - Pouco"""
  var dm = parseInt(readline(stdin))
  if dm == 1:# echo "dormindo muito"
    if peso - 4 > 0:
      peso = peso - 4
      echo &"Seu bichinho está com {peso} Kg \n "
      echo &"Seu bichinho está faminto \n "
    else:
      echo "Seu bichinho morreu de fome"
      vida=0
  elif dm == 2:# echo "dormindo pouco"
    if peso - 1 > 0:
      peso = peso - 1
      echo &"Seu bichinho está com {peso} Kg \n "
    else:
      echo "Seu bichinho morreu de fome"
      vida=0
  else:
    echo "Erro: Opção Inválida"

proc brincar*()=
  var bichinho: Tamagotchi = Tamagotchi()
  echo """
    Seu Bichinho deve brincar:
    [1] - Muito
    [2] - Pouco"""
  var bc = parseInt(readline(stdin))
  if bc == 1:# echo "brincando muito"
    if peso - 2 > 0:
      peso = peso - 2
      echo &"Seu bichinho está com {peso} Kg \n "
      echo &"Seu bichinho está faminto \n "
    else:
      echo "Seu bichinho morreu de fome"
      vida=0
  elif bc == 2:# echo "brincando pouco"
    if peso - 1 > 0:
      peso = peso - 1
      echo &"Seu bichinho está com {peso} Kg \n "
    else:
      echo "Seu bichinho morreu de fome"
      vida=0
  else:
    echo "Erro: Opção Inválida"

proc decidir*()= 
  linha()
  while vida > 0:
    echo """
    O que você vai fazer para o seu Bichinho
    [1] - Alimentar o Bichinho
    [2] - Por o Bichinho para dormir
    [3] - Brincar com o Bichinho"""
    var d = parseInt(readline(stdin))
    case d
    of 1: comer()
    of 2: dormir()
    of 3: brincar()
    else: echo "Opção inválida!, escolha uma opção válida"

proc agir*()=
  randomize()
  let acoes = ["faminto", "cansado", "triste"]
  let pick = sample(acoes)
  echo &"Seu bichinho está {pick} \n "
  decidir()

proc newTamagotchi*() = 
  var bichinho = Tamagotchi()
  echo "Qual nome você vai batizar seu bichinho" 
  vida = 1
  peso = 1
  idade = 0
  bichinho.nome=readline(stdin)
  bichinho.idade = idade #dias de vida
  bichinho.peso = peso  #peso em kg
  linha()
  echo &"Seu bichinho chama {bichinho.nome}, ele tem {bichinho.idade} anos e pesa {bichinho.peso} kilos \n "
  agir()

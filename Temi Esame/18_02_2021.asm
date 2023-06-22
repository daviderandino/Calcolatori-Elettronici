DIM = 64

.data
vetRX: .byte 0x84, 0xFA, 0x09, 0x54, 0x20, 0x42, 0x19, 0x20, 0x41, 0xB1, 0x03
vetTX: .space DIM

.text
.globl main
.ent main

main:
  la $a0, vetRX      # Carica l'indirizzo di vetRX in $a0
  la $a1, vetTX      # Carica l'indirizzo di vetTX in $a1
  jal SpaceRemove    # Chiama la procedura SpaceRemove
  jr $ra
  .end main


SpaceRemove:
  move $t0, $a0        # Salva l'indirizzo di vetRX in $t0
  move $t1, $a1        # Salva l'indirizzo di vetTX in $t1

  lb $t2, ($t0)        # Carica l'elemento 0 di vetRX in $t2
  lb $t3, 1($t0)       # Carica l'elemento 1 di vetRX in $t3

  sb $t3, ($t1)        # Salva l'elemento 1 in vetTX
  sb $t2, 1($t1)       # Salva l'elemento 0 in vetTX

  addi $t0, $t0, 2     # Incrementa l'indirizzo per passare all'elemento successivo
  addi $t1, $t1, 2

  loop:
    lb $t2, ($t0)        # Carica il byte corrente da vetRX in $t2
    beq $t2, 0x03, end   # Se è il carattere <EOM>, salta alla fine della procedura

    beq $t2, 0x20, skip  # Se è un carattere blank (0x20), salta al prossimo byte

    sb $t2, ($t1)        # Salva il byte corrente in vetTX
    addi $t1, $t1, 1     # Incrementa l'indirizzo per passare al prossimo byte

    skip:
      addi $t0, $t0, 2   # Incrementa l'indirizzo per passare al prossimo byte
      j loop

  end:
    sb $zero, ($t1)      # Salva il carattere <EOM> in vetTX

  jr $ra
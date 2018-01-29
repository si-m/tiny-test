* TINY Compilation to TM Code
* File: is_prime.tm
* Standard prelude:
  0:     LD  6,0(0) 	load maxaddress from location 0
  1:     ST  0,0(0) 	clear location 0
* End of standard prelude.
  2:     IN  0,0,0 	read integer value
  3:     ST  0,0(5) 	read: store value
* -> assign
* -> Const
  4:    LDC  0,0(0) 	load const
* <- Const
  5:     ST  0,1(5) 	assign: store value
* <- assign
* -> assign
* -> Const
  6:    LDC  0,1(0) 	load const
* <- Const
  7:     ST  0,2(5) 	assign: store value
* <- assign
* -> if
* -> Op
* -> Const
  8:    LDC  0,1(0) 	load const
* <- Const
  9:     ST  0,0(6) 	op: push left
* -> Id
 10:     LD  0,0(5) 	load id value
* <- Id
 11:     LD  1,0(6) 	op: load left
 12:    SUB  0,1,0 	op <
 13:    JLT  0,2(7) 	br if true
 14:    LDC  0,0(0) 	false case
 15:    LDA  7,1(7) 	unconditional jmp
 16:    LDC  0,1(0) 	true case
* <- Op
* if: jump to else belongs here
* -> if
* -> Op
* -> Id
 18:     LD  0,0(5) 	load id value
* <- Id
 19:     ST  0,0(6) 	op: push left
* -> Const
 20:    LDC  0,2(0) 	load const
* <- Const
 21:     LD  1,0(6) 	op: load left
 22:    SUB  0,1,0 	op ==
 23:    JEQ  0,2(7) 	br if true
 24:    LDC  0,0(0) 	false case
 25:    LDA  7,1(7) 	unconditional jmp
 26:    LDC  0,1(0) 	true case
* <- Op
* if: jump to else belongs here
* -> assign
* -> Const
 28:    LDC  0,1(0) 	load const
* <- Const
 29:     ST  0,1(5) 	assign: store value
* <- assign
* if: jump to end belongs here
 27:    JEQ  0,3(7) 	if: jmp to else
* -> if
* -> Op
* -> Id
 31:     LD  0,2(5) 	load id value
* <- Id
 32:     ST  0,0(6) 	op: push left
* -> Op
* -> Id
 33:     LD  0,0(5) 	load id value
* <- Id
 34:     ST  0,-1(6) 	op: push left
* -> Const
 35:    LDC  0,1(0) 	load const
* <- Const
 36:     LD  1,-1(6) 	op: load left
 37:    SUB  0,1,0 	op -
* <- Op
 38:     LD  1,0(6) 	op: load left
 39:    SUB  0,1,0 	op <
 40:    JLT  0,2(7) 	br if true
 41:    LDC  0,0(0) 	false case
 42:    LDA  7,1(7) 	unconditional jmp
 43:    LDC  0,1(0) 	true case
* <- Op
* if: jump to else belongs here
* -> repeat
* repeat: jump after body comes back here
* -> if
* -> Op
* -> Op
* -> Id
 45:     LD  0,0(5) 	load id value
* <- Id
 46:     ST  0,0(6) 	op: push left
* -> Id
 47:     LD  0,2(5) 	load id value
* <- Id
 48:     LD  1,0(6) 	op: load left
 49:    MOD  0,1,0 	op %%
* <- Op
 50:     ST  0,0(6) 	op: push left
* -> Const
 51:    LDC  0,0(0) 	load const
* <- Const
 52:     LD  1,0(6) 	op: load left
 53:    SUB  0,1,0 	op ==
 54:    JEQ  0,2(7) 	br if true
 55:    LDC  0,0(0) 	false case
 56:    LDA  7,1(7) 	unconditional jmp
 57:    LDC  0,1(0) 	true case
* <- Op
* if: jump to else belongs here
* -> assign
* -> Op
* -> Id
 59:     LD  0,1(5) 	load id value
* <- Id
 60:     ST  0,0(6) 	op: push left
* -> Const
 61:    LDC  0,1(0) 	load const
* <- Const
 62:     LD  1,0(6) 	op: load left
 63:    ADD  0,1,0 	op +
* <- Op
 64:     ST  0,1(5) 	assign: store value
* <- assign
* if: jump to end belongs here
 58:    JEQ  0,7(7) 	if: jmp to else
 65:    LDA  7,0(7) 	jmp to end
* <- if
* -> assign
* -> Op
* -> Id
 66:     LD  0,2(5) 	load id value
* <- Id
 67:     ST  0,0(6) 	op: push left
* -> Const
 68:    LDC  0,1(0) 	load const
* <- Const
 69:     LD  1,0(6) 	op: load left
 70:    ADD  0,1,0 	op +
* <- Op
 71:     ST  0,2(5) 	assign: store value
* <- assign
* -> Op
* -> Op
* -> Id
 72:     LD  0,0(5) 	load id value
* <- Id
 73:     ST  0,0(6) 	op: push left
* -> Const
 74:    LDC  0,1(0) 	load const
* <- Const
 75:     LD  1,0(6) 	op: load left
 76:    SUB  0,1,0 	op -
* <- Op
 77:     ST  0,0(6) 	op: push left
* -> Id
 78:     LD  0,2(5) 	load id value
* <- Id
 79:     LD  1,0(6) 	op: load left
 80:    SUB  0,1,0 	op <
 81:    JLT  0,2(7) 	br if true
 82:    LDC  0,0(0) 	false case
 83:    LDA  7,1(7) 	unconditional jmp
 84:    LDC  0,1(0) 	true case
* <- Op
 85:    JEQ  0,-41(7) 	repeat: jmp back to body
* <- repeat
* if: jump to end belongs here
 44:    JEQ  0,42(7) 	if: jmp to else
 86:    LDA  7,0(7) 	jmp to end
* <- if
 30:    LDA  7,56(7) 	jmp to end
* <- if
* if: jump to end belongs here
 17:    JEQ  0,70(7) 	if: jmp to else
 87:    LDA  7,0(7) 	jmp to end
* <- if
* -> if
* -> Op
* -> Id
 88:     LD  0,1(5) 	load id value
* <- Id
 89:     ST  0,0(6) 	op: push left
* -> Const
 90:    LDC  0,1(0) 	load const
* <- Const
 91:     LD  1,0(6) 	op: load left
 92:    SUB  0,1,0 	op ==
 93:    JEQ  0,2(7) 	br if true
 94:    LDC  0,0(0) 	false case
 95:    LDA  7,1(7) 	unconditional jmp
 96:    LDC  0,1(0) 	true case
* <- Op
* if: jump to else belongs here
* -> Const
 98:    LDC  0,1(0) 	load const
* <- Const
 99:    OUT  0,0,0 	write ac
* if: jump to end belongs here
 97:    JEQ  0,3(7) 	if: jmp to else
* -> Const
101:    LDC  0,0(0) 	load const
* <- Const
102:    OUT  0,0,0 	write ac
100:    LDA  7,2(7) 	jmp to end
* <- if
* End of execution.
103:   HALT  0,0,0 	

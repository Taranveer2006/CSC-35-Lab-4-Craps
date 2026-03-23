#--------------------------------------------------------
# Lab 4: Craps
#--------------------------------------------------------
.intel_syntax noprefix
.data

	PromptWelcome: .asciz "Welcome to Craps!\n"
	PromptrollMsg: .asciz "\nRolling the dice...\n"
	PromptRollAgain: .asciz "\nRolling Again...\n"
	PromptrolledMsg: .asciz "You rolled a "

	PromptpointMsg: .asciz ". Your point is "
	PromptperiodNL: .asciz ".\n"
	PromptkeepMsg: .asciz ". Keep rolling!\n"
	PromptwinNat: .asciz ". Natural! You win!\n"
	PromptloseCraps: .asciz ". Craps! You lose.\n"
	PromptwinPoint: .asciz ". You hit your point! You win!\n"
	PromptloseSeven: .asciz ". Seven-out! You lose.\n"

.text
.global Program

Program:

# Display Welcome
	lea rcx, PromptWelcome
	call PrintStrZ

# Come-Out Roll
	lea rcx, PromptrollMsg
	call PrintStrZ

	mov rcx, 6
	call GetRandom
	add rcx, 1
	mov r8, rcx

	mov rcx, 6
	call GetRandom
	add rcx, 1
	mov r9, rcx

	mov r10, r8
	add r10, r9

	lea rcx, PromptrolledMsg
	call PrintStrZ

	mov rcx, r10
	call PrintInt64

# Evalute Come-Out Result

	cmp r10, 7
	je Displaywin
	cmp r10, 11
	je Displaywin

	cmp r10, 2
	je Displaylose
	cmp r10, 3
	je Displaylose
	cmp r10, 12
	je Displaylose

	mov r11, r10

	lea rcx, PromptpointMsg
	call PrintStrZ

	mov rcx, r11
	call PrintInt64

	lea rcx, PromptperiodNL
	call PrintStrZ

	jmp Do

Displaywin:

	lea rcx, PromptwinNat
	call PrintStrZ
	call End

Displaylose:

	lea rcx, PromptloseCraps
	call PrintStrZ
	call End

LoseSeven:

	lea rcx, PromptloseSeven
	call PrintStrZ
	call End

Pointwin:

	lea rcx, PromptwinPoint
	call PrintStrZ
	call End

# Point Phase Loop

Do:
	lea rcx, PromptRollAgain
	call PrintStrZ

	mov rcx, 6
	call GetRandom
	add rcx, 1
	mov r8, rcx

	mov rcx, 6
	Call GetRandom
	add rcx, 1
	mov r9, rcx

	mov r10, r8
	add r10, r9

	lea rcx, PromptrolledMsg
	call PrintStrZ

	mov rcx, r10
	call PrintInt64

	cmp r11, r10
	je Pointwin

	cmp r10, 7
	je LoseSeven

	lea rcx, PromptkeepMsg
	call PrintStrZ
	jmp Do

End:

	call ProgramEnd



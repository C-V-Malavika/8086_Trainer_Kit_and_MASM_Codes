data segment
string db 40h,10h,50h,20h,99h,12h,56h,45h,36h
data ends

stk segment stack
stk ends

code segment
assume cs : code, ds : data

start:
	mov ax, ds
	mov ds, ax
	mov ch, 08h

label1:
	mov cl, 08h
	lea si, string

label2:
	mov al, [si]
	mov bl, [si+1]
	cmp al, bl
	jc label3
	mov dl, [si+1]
	xchg [si], dl
	mov [si+1], dl

label3: 
	inc si
	dec cl
	jnz label2
	dec ch
	jnz label1

quit: 
	mov al,0h
	mov ah, 04ch
	int 21h

code ends
end start
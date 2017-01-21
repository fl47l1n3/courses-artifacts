; ������� 256 ASCII ��������          
; ------------
; test - ��������� ��������� "���������� � (AND)", �� ����������� ��������������� �������� ������.
; �������� �������� ZF � 1
;        mov     ah,2
;        test    ax,00100000b
; jnz - �������� ������� �� ������, ���� ���� ZF ���������� � 1.
; loop - ��������� ������� ECX � ��������� �� �����.        
;------------
 
        .model  tiny
        .code
        org     100h     
        
start:             
        mov     cx,256
        mov     ah,2            ; ��������� ����� DOS 02h - �������� ������ � STDOUT.     
        mov     dl,0            ; � DL �������� ��� �������.

cloop:  int     21h 
        inc     dl              ; ����������� dl �� 1 - ��������� ������.
        
        test    dl,0Fh          ; ��������� ��������� �������� 16-� (����� �������� �� 16 �������� � ������)
        jnz     continue_loop   ; ���� �� ������ - �� �������� ���� ������
                                                                          
        ; ���� ������ �� �������� \n
        push    dx      ; ��������� DX � ����
        ; �������� \n
        mov     dl,0Dh
        int     21h
        mov     dl,0Ah
        int     21h
        pop     dx      ; ��������������� DX �� �����                                                                                                
        
continue_loop:
        loop    cloop

        ret
        end     start        
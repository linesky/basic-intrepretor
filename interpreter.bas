sub scommand(a as string)
	shell a
end sub 
sub sline(ffile as string)
	dim a as string
	open ffile for input as 1
		while 1
			if eof(1) then goto escapes
			line input #1,a
			scommand a
		wend
		escapes:
	close 1
end sub
color 7,1
if command(1)<>"" then sline(command(1))
	

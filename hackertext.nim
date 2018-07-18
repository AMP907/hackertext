import os, random, strutils, terminal

randomize() # Initializes the RNG with a new seed each run
hideCursor() # Hides the cursor during runtime

var target, output: string

if paramCount() >= 1:
  target = paramStr(1)
else:
  target = "Hello, world!"
output = repeat('\0',target.len)

for i,x in target:
  while x != output[i]:
    output[i] = chr(rand(32..126))
    eraseLine() # Write to the same line instead of spewing new lines
    stdout.write(output)
    stdout.flushFile() # Force writing to console every iteration
    sleep(3)
showCursor()
echo() # Add new line at the end of execution to keep the terminal tidy

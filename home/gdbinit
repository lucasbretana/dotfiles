# _____________ better output _____________
#  a color print, but how?

# _____________ general functions _____________
define pa
  if $argc != 3
    help pa
  else
    printf "Printing array from %d to %d", $arg1, $arg2
    set $_i = $arg1
    while $_i < $arg2
      printf "array[%d] = %d", $_i, $arg0[$_i]
    end
    printf "Done"
  end
end
document pa
Prints a array
usage: pa ARRAY_ADDR LOW_BOUND HIGH_BOUND

Both both are inclusive.
Example: 
  pa array i j
end

# _____________ breakpoint aliases _____________

define bpl
  info breakpoints
end
document bpl
List all breakpoints.
end

define bp
  if $argc != 1
    help bp
  else
    break $arg0
  end
end
document bp
Set breakpoint.
Usage: bp LOCATION
LOCATION may be a line number, function name, or "*" and an address.

To break on a symbol you must enclose symbol name inside "".
Example:
  bp "[NSControl stringValue]"
Or else you can use directly the break command (break [NSControl stringValue])
end


define bpc 
  if $argc != 1
    help bpc
  else
    clear $arg0
  end
end
document bpc
Clear breakpoint.
Usage: bpc LOCATION
LOCATION may be a line number, function name, or "*" and an address.
end


define bpe
  if $argc != 1
    help bpe
  else
    enable $arg0
  end
end
document bpe
Enable breakpoint with number NUM.
Usage: bpe NUM
end

define bpd
  if $argc != 1
    help bpd
  else
    disable $arg0
  end
end
document bpd
Disable breakpoint with number NUM.
Usage: bpd NUM
end


define bpt
  if $argc != 1
    help bpt
  else
    tbreak $arg0
  end
end
document bpt
Set a temporary breakpoint.
Will be deleted when hit!
Usage: bpt LOCATION
LOCATION may be a line number, function name, or "*" and an address.
end


# ______________process information____________
define argv
  show args
end
document argv
Print program arguments.
end


define stack
  if $argc == 0
    info stack
  end
  if $argc == 1
    info stack $arg0
  end
  if $argc > 1
    help stack
  end
end
document stack
Print backtrace of the call stack, or innermost COUNT frames.
Usage: stack <COUNT>
end


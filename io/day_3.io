// Enhance the XML program to add spaces to show the indentation
// structure.
// Create a list syntax that uses brackets.
// Enhance the XML program to handle attributes: if the first
// argument is a map (use the curly brackets syntax), add
// attributes to the XML program. For example:
// book({"author": "Tate"}...) would print <book author="Tate">:

Builder := Object clone
Builder level := -1
Builder prev_name := "ul"
Builder forward := method(
    if(prev_name != call message name, level := level + 2)
    for(i, 0, level, write(" "))
    writeln("<", call message name, ">")
    call message arguments foreach(arg,
        content := self doMessage(arg)
        if(content type == "Sequence",
            level := level + 2
            for(i, 0, level, write(" "))
            writeln(content)
            level := level - 2
        )
    )
    for(i, 0, level, write(" "))
    writeln("</", call message name, ">")
    if(prev_name != (prev_name := call message name), level := level - 2)
)

Builder ul(
    li("Io"),
    li("Lua"),
    li("JavaScript")
)

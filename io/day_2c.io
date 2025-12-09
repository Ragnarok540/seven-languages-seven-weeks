// Write a prototype for a two-dimensional list. The dim(x, y) method
// should allocate a list of y lists that are x elements long. set(x, y,
// value) should set a value, and get(x, y) should return that value.

// Bonus: Write a transpose method so that (new_matrix get(y, x)) ==
// matrix get(x, y) on the original list.

// Write the matrix to a file, and read a matrix from a file.

Matrix := Object clone do(
    cells := list()
    dim := method(x, y,
        for(i, 1, y,
            ls := list()
            for(j, 1, x,
                ls append(0)
            )
            cells append(ls)
        )
    )
    set := method(x, y, value,
        ls := cells at(y)
        ls atPut(x, value)
    )
    get := method(x, y,
        ls := cells at(y)
        ls at(x)
    )
    transpose := method(
        ysz := cells size
        xsz := cells at(0) size
        NewMatrix := Matrix clone
        NewMatrix cells = list()
        NewMatrix dim(ysz, xsz)
        for(i, 0, ysz - 1,
            for(j, 0, xsz - 1,
                NewMatrix set(i, j, self get(j, i))
            )
        )
        NewMatrix
    )
    loadFile := method(file,
        f := File with(file)
        f openForReading
        l := f readLine
        while(l != nil,
            cells append(l split(","))
            l := f readLine
        )
        f close
    )
    writeFile := method(file,
        f := File with(file)
        f openForUpdating
        ysz := cells size
        xsz := cells at(0) size
        for(i, 0, ysz - 1,
            for(j, 0, xsz - 1,
                f write(get(j, i))
                f write(",")
            )
            f write("\n")
        )
        f close
    )
    show := method(write(cells))
)

Matrix dim(5, 4)
Matrix set(2, 3, 5)
Matrix get(2, 3) println
Matrix transpose get(3, 2) println

Matrix cells = list()
Matrix loadFile("matrix.txt")
Matrix show
Matrix transpose writeFile("matrixt.txt")

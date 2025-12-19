// • Write a game that will take a tic-tac-toe board with X, O, and blank
// characters and detect the winner or whether there is a tie or no
// winner yet. Use classes where appropriate.
// • Bonus problem: Let two players play tic-tac-toe.

def initBoard: Array[Array[String]] =
    val board: Array[Array[String]] = Array.ofDim[String](3, 3)
    
    for
        i <- 0 until 3
        j <- 0 until 3
    do
        board(i)(j) = " "

    board


def printBoard(board: Array[Array[String]]): Unit =
    for i <- 0 until 3 do
        for j <- 0 until 3 do
            print(board(i)(j) + " ")
        println()


def set(board: Array[Array[String]], symbol: String, x: Int, y: Int): Unit =
    board(x)(y) = symbol


def arrayMatches(value: String, arr: Array[String]): Boolean =
    arr.filter(_ == value).size == arr.size


def checkArr(arr: Array[String]): String =
    if arrayMatches("X", arr) then
        return "X"
    if arrayMatches("O", arr) then
        return "O"
    return ""


def checkWon(arr: Array[Array[String]]): String =
    for row <- arr do
        val winner = checkArr(row)
        if winner != "" then
            return winner
    return ""


def diagonal(arr: Array[Array[String]]): Array[String] =
    var diag = new Array[String](3)
    for i <- arr.indices do
        diag(i) = arr(i)(i)
    diag

def whoWon(rows: Array[Array[String]]): String =
    var winner =  ""

    winner = checkWon(rows)
    if winner != "" then
        return winner

    winner = checkWon(rows.transpose) 
    if winner != "" then
        return winner

    winner = checkArr(diagonal(rows)) 
    if winner != "" then
        return winner

    winner = checkArr(diagonal(rows.reverse)) 
    if winner != "" then
        return winner

    return "Nobody"


@main def main() =
    val board = initBoard
    set(board, "X", 0, 0)
    set(board, "O", 1, 0)
    set(board, "X", 2, 0)
    printBoard(board)
    println("winner: " + whoWon(board))

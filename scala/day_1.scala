// • Write a game that will take a tic-tac-toe board with X, O, and blank
// characters and detect the winner or whether there is a tie or no
// winner yet. Use classes where appropriate.
// • Bonus problem: Let two players play tic-tac-toe.

import scala.util.boundary
import boundary.break
import scala.io.StdIn.readInt

def initBoard: Array[Array[String]] =
    val board: Array[Array[String]] = Array.ofDim[String](3, 3)
    
    for
        i <- 0 until 3
        j <- 0 until 3
    do
        board(i)(j) = " "

    board

def slots: Array[Array[String]] =
    val board: Array[Array[String]] = Array.ofDim[String](3, 3)
    
    for
        i <- 0 until 3
        j <- 0 until 3
    do
        board(i)(j) = "" + (3 * i + j)

    board


def printBoard(board: Array[Array[String]]): Unit =
    for i <- 0 until 3 do
        for j <- 0 until 3 do
            print(board(i)(j) + " ")
        println()


def set(board: Array[Array[String]], symbol: String, x: Int, y: Int): Unit =
    if board(x)(y) == " " then board(x)(y) = symbol


def setNumber(board: Array[Array[String]], symbol: String, num: Int): Unit =
    set(board, symbol, num / 3, num % 3)


def arrayMatches(value: String, arr: Array[String]): Boolean =
    arr.filter(_ == value).size == arr.size


def checkArr(arr: Array[String]): String =
    if arrayMatches("X", arr) then
        return "X"
    if arrayMatches("O", arr) then
        return "O"
    ""


def checkWon(arr: Array[Array[String]]): String =
    boundary:
        for row <- arr do
            val winner = checkArr(row)
            if winner != "" then
                break(winner)
        ""


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

    "Nobody"


@main def main() =
    val board = initBoard
    var turn = "X"
    val sl = slots
    println("slots:")
    printBoard(slots)

    while whoWon(board) == "Nobody" do
        println(s"$turn turn")
        println("choose a slot:")
        val a = readInt()
        setNumber(board, turn, a)
        printBoard(board)
        if turn == "X" then turn = "O"
        else turn = "X"

    println("winner: " + whoWon(board))

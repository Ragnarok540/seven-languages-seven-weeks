// • Use foldLeft to compute the total size of a list of strings.

def totalSize(list: List[String]): Int =
    list.foldLeft(0)((sum, value) => sum + value.size)

// • Write a Censor trait with a method that will replace the curse words
// Shoot and Darn with Pucky and Beans alternatives. Use a map to
// store the curse words and their alternatives.

trait Censor:
    def replace(censorWords: Map[String, String], word: String): String =
        if censorWords.contains(word) then censorWords(word)
        else word


class Reader() extends Censor:
    def read(censorWords: Map[String, String], text: List[String]): String =
        text.foldLeft("")((acc, word) => acc + replace(censorWords, word) + " ").trim


@main def main() =
    val ls: List[String] = List("hello", "world")
    println(totalSize(ls))

    val censorWords = Map("Shoot" -> "Pucky", "Darn" -> "Beans")
    val input = List("Fuck", "Darn", "Shit", "Kill", "Shoot")
    val reader = new Reader
    val output = reader.read(censorWords, input)
    println(output)

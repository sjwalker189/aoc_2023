import scala.io

val num_char_range = (48, 57)

def is_num(char: Char): Boolean = {
  char.toInt match {
    case c if c >= num_char_range(0) && c <= num_char_range(1) => true
    case _                                                     => false
  }
}

@main def main() = {
  val sum = io.Source
    .fromFile("input.txt")
    .getLines()
    .map(line => line.toList.filter(is_num))
    .map(chars => chars.head.toString.concat(chars.last.toString).toInt)
    .reduce((a, b) => a + b)

  println(s"Sum = $sum\n")
}

// Answer: 54388

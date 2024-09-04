import scala.collection.mutable.HashMap

def text = """Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
"""

def samplePartOne(): Int = {
  text
    .split("\n")
    .map(takeIdWhenValid)
    .sum
}

def samplePartTwo(): Int = {
  text.split("\n")
    .zipWithIndex
    .map { case (line, i) =>
      val sets = line.replaceFirst("""Game \d+: """, "").split(";")
      val max = new HashMap[String, Int]
      
      sets.foreach { set => 
       set.split(", ").foreach{ cube =>
        val pairs = cube.split(" ")
        val color = parts(1)
        val count = parts(0).toInt

        println(s"COLOR=$color")
        
        if (count > max.getOrElse(color, 0)) {
          max.update(color, count)
        }
       }
      }
      
      val r = max.getOrElse("red", 0)
      val g = max.getOrElse("green", 0)
      val b = max.getOrElse("blue", 0)

      r * g * b
    }
    .sum
}

def partOne(): Int = {
  val source = scala.io.Source.fromFile("input.txt")
  val result = source
    .getLines()
    .map(takeIdWhenValid)
    .sum

  source.close()

  result
}

@main def main(): Unit = {
  val answer = samplePartTwo()
  println(s"Answer: $answer\n")
}


def takeIdWhenValid(line: String): Int = {
  val pairs = line.split(": ")
  val invalid = pairs(1)
    .split("; ")
    .flatMap { rounds =>
      rounds.split(", ").filter { group =>
        val parts = group.split(" ")
        val color = parts(1)
        val count = parts(0).toInt
        invalidGroup((color, count))
      }
    }

  if invalid.nonEmpty then
    0
  else
    extractId(pairs(0))

}

def extractId(str: String): Int = {
  str.stripPrefix("Game ").toInt
}

def invalidGroup(pairs: (String, Int)): Boolean =
  pairs match
    case (k, v) if k == "red" && v > 12 => true
    case (k, v) if k == "green" && v > 13 => true
    case (k, v) if k == "blue" && v > 14 => true
    case _ => false


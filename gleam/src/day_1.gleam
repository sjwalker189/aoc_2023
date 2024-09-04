import gleam/int
import gleam/io
import gleam/list
import gleam/option
import gleam/regex
import gleam/string

const sample = "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet"

const sample_2 = "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen"

pub fn main() {
  solve(sample) |> int.to_string |> io.println
  solve(sample_2) |> int.to_string |> io.println
}

fn solve(puzzle: String) -> Int {
  puzzle
  |> string.split("\n")
  |> list.map(parse_calibration_value)
  |> int.sum
}

fn parse_calibration_value(in: String) -> Int {
  let assert Ok(first) = match_calibration_value(in, first_number_regex)
  let assert Ok(last) = match_calibration_value(in, last_number_regex)
  let assert Ok(result) = int.undigits([parse_int(first), parse_int(last)], 10)
  result
}

fn match_calibration_value(in: String, pattern: String) -> Result(String, Nil) {
  let assert Ok(regex_pattern) = regex.from_string(pattern)
  regex.scan(with: regex_pattern, content: in)
  |> list.flat_map(fn(x: regex.Match) { x.submatches })
  |> list.filter(option.is_some)
  |> list.map(fn(x) { option.unwrap(x, "") })
  |> list.first
}

const first_number_regex = "^.*?([0-9]|one|two|three|four|five|six|seven|eight|nine|zero).*$"

const last_number_regex = "^.*([0-9]|one|two|three|four|five|six|seven|eight|nine|zero).*?$"

fn parse_int(value: String) -> Int {
  case value {
    "1" | "one" -> 1
    "2" | "two" -> 2
    "3" | "three" -> 3
    "4" | "four" -> 4
    "5" | "five" -> 5
    "6" | "six" -> 6
    "7" | "seven" -> 7
    "8" | "eight" -> 8
    "9" | "nine" -> 9
    "0" | "zero" -> 0
    _ -> panic
  }
}

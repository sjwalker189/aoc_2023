using System.Text.RegularExpressions;

namespace DayOne
{
    class Program
    {
        public const string NUM_REGEX = @"(one|two|three|four|five|six|seven|eight|nine|zero)";

        static void Main(string[] args)
        {
            var app = new Program();
            Console.WriteLine("Part One = " + app.PartOne());
            Console.WriteLine("Part Two = " + app.PartTwo());
        }

        int PartOne()
        {
            return Solve(File.ReadLines("input.txt"));
        }

        int PartTwo()
        {
            return Solve(File.ReadLines("input.txt"));
        }


        int Solve(IEnumerable<string> lines)
        {
            return lines.Sum(line => ParseCalibrationValue(line));
        }


        private int ParseCalibrationValue(string line)
        {
            var matches = Regex.Matches(line, NUM_REGEX);

            var first = ParseNumberString(matches.First().Value);
            var last = ParseNumberString(matches.Last().Value);
            var result = first.ToString() + last.ToString();

            if (int.TryParse(result, out int value))
            {
                return value;
            }
            else
            {
                Console.WriteLine($"Line could not be parsed. ({line})");
                System.Environment.Exit(1);
            }
        }

        private int ParseNumberString(string number)
        {
            return number switch
            {
                "one" or "1" => 1,
                "two" or "2" => 2,
                "three" or "3" => 3,
                "four" or "4" => 4,
                "five" or "5" => 5,
                "six" or "6" => 6,
                "seven" or "7" => 7,
                "eight" or "8" => 8,
                "nine" or "nine" => 9,
                _ => 0
            };
        }
    }
}

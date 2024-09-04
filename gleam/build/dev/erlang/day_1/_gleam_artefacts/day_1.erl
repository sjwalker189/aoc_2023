-module(day_1).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([main/0]).

-spec match_calibration_value(binary(), binary()) -> {ok, binary()} |
    {error, nil}.
match_calibration_value(In, Pattern) ->
    _assert_subject = gleam@regex:from_string(Pattern),
    {ok, Regex_pattern} = case _assert_subject of
        {ok, _} -> _assert_subject;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Assertion pattern match failed"/utf8>>,
                        value => _assert_fail,
                        module => <<"day_1"/utf8>>,
                        function => <<"match_calibration_value"/utf8>>,
                        line => 41})
    end,
    _pipe = gleam@regex:scan(Regex_pattern, In),
    _pipe@1 = gleam@list:flat_map(_pipe, fun(X) -> erlang:element(3, X) end),
    _pipe@2 = gleam@list:filter(_pipe@1, fun gleam@option:is_some/1),
    _pipe@3 = gleam@list:map(
        _pipe@2,
        fun(X@1) -> gleam@option:unwrap(X@1, <<""/utf8>>) end
    ),
    gleam@list:first(_pipe@3).

-spec parse_int(binary()) -> integer().
parse_int(Value) ->
    case Value of
        <<"1"/utf8>> ->
            1;

        <<"one"/utf8>> ->
            1;

        <<"2"/utf8>> ->
            2;

        <<"two"/utf8>> ->
            2;

        <<"3"/utf8>> ->
            3;

        <<"three"/utf8>> ->
            3;

        <<"4"/utf8>> ->
            4;

        <<"four"/utf8>> ->
            4;

        <<"5"/utf8>> ->
            5;

        <<"five"/utf8>> ->
            5;

        <<"6"/utf8>> ->
            6;

        <<"six"/utf8>> ->
            6;

        <<"7"/utf8>> ->
            7;

        <<"seven"/utf8>> ->
            7;

        <<"8"/utf8>> ->
            8;

        <<"eight"/utf8>> ->
            8;

        <<"9"/utf8>> ->
            9;

        <<"nine"/utf8>> ->
            9;

        <<"0"/utf8>> ->
            0;

        <<"zero"/utf8>> ->
            0;

        _ ->
            erlang:error(#{gleam_error => panic,
                    message => <<"panic expression evaluated"/utf8>>,
                    module => <<"day_1"/utf8>>,
                    function => <<"parse_int"/utf8>>,
                    line => 65})
    end.

-spec parse_calibration_value(binary()) -> integer().
parse_calibration_value(In) ->
    _assert_subject = match_calibration_value(
        In,
        <<"^.*?([0-9]|one|two|three|four|five|six|seven|eight|nine|zero).*$"/utf8>>
    ),
    {ok, First} = case _assert_subject of
        {ok, _} -> _assert_subject;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Assertion pattern match failed"/utf8>>,
                        value => _assert_fail,
                        module => <<"day_1"/utf8>>,
                        function => <<"parse_calibration_value"/utf8>>,
                        line => 34})
    end,
    _assert_subject@1 = match_calibration_value(
        In,
        <<"^.*([0-9]|one|two|three|four|five|six|seven|eight|nine|zero).*?$"/utf8>>
    ),
    {ok, Last} = case _assert_subject@1 of
        {ok, _} -> _assert_subject@1;
        _assert_fail@1 ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Assertion pattern match failed"/utf8>>,
                        value => _assert_fail@1,
                        module => <<"day_1"/utf8>>,
                        function => <<"parse_calibration_value"/utf8>>,
                        line => 35})
    end,
    _assert_subject@2 = gleam@int:undigits(
        [parse_int(First), parse_int(Last)],
        10
    ),
    {ok, Result} = case _assert_subject@2 of
        {ok, _} -> _assert_subject@2;
        _assert_fail@2 ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Assertion pattern match failed"/utf8>>,
                        value => _assert_fail@2,
                        module => <<"day_1"/utf8>>,
                        function => <<"parse_calibration_value"/utf8>>,
                        line => 36})
    end,
    Result.

-spec solve(binary()) -> integer().
solve(Puzzle) ->
    _pipe = Puzzle,
    _pipe@1 = gleam@string:split(_pipe, <<"\n"/utf8>>),
    _pipe@2 = gleam@list:map(_pipe@1, fun parse_calibration_value/1),
    gleam@int:sum(_pipe@2).

-spec main() -> nil.
main() ->
    _pipe = solve(<<"1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet"/utf8>>),
    _pipe@1 = gleam@int:to_string(_pipe),
    gleam@io:println(_pipe@1),
    _pipe@2 = solve(
        <<"two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen"/utf8>>
    ),
    _pipe@3 = gleam@int:to_string(_pipe@2),
    gleam@io:println(_pipe@3).

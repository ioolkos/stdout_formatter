-module(table_tests).

-include_lib("eunit/include/eunit.hrl").
-include("stdout_formatter.hrl").

format_cell_test() ->
    Content = atom,
    FormattedBlock = stdout_formatter:format(Content),
    ?assertEqual(
       #cell{content = FormattedBlock},
       stdout_formatter_table:format_cell(Content)),
    ?assertEqual(
       #cell{content = FormattedBlock},
       stdout_formatter_table:format_cell(#cell{content = atom})),
    ?assertEqual(
       #cell{content = FormattedBlock},
       stdout_formatter_table:format_cell(#cell{content = FormattedBlock})).

normalize_rows_and_cells_test() ->
    ?assertEqual(
       [],
       stdout_formatter_table:normalize_rows_and_cells(#table{}, [])),

    ?assertMatch(
       [#row{cells = [], props = _}],
       stdout_formatter_table:normalize_rows_and_cells(#table{}, [[]])),

    ?assertMatch(
       [#row{
           cells =
           [#cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["atom"], props = _}],
                  props = _},
               props = _}
           ],
           props = _}],
       stdout_formatter_table:normalize_rows_and_cells(#table{}, [[atom]])),

    ?assertMatch(
       [#row{cells =
             [#cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["a"], props = _}],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["b"], props = _}],
                  props = _},
               props = _}],
             props = _},
        #row{cells =
             [#cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["c"], props = _}],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["d"], props = _}],
                  props = _},
               props = _}],
             props = _}],
       stdout_formatter_table:normalize_rows_and_cells(
         #table{}, [[a, b], [c, d]])),

    ?assertMatch(
       [#row{cells =
             [#cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["a"], props = _}],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [],
                  props = _},
               props = _}],
             props = _},
        #row{cells =
             [#cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["c"], props = _}],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["d"], props = _}],
                  props = _},
               props = _}],
             props = _}],
       stdout_formatter_table:normalize_rows_and_cells(
         #table{}, [[a], [c, d]])),

    ?assertMatch(
       [#row{cells =
             [#cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["a"], props = _}],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["b"], props = _}],
                  props = _},
               props = _}],
             props = _},
        #row{cells =
             [#cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["c"], props = _}],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [],
                  props = _},
               props = _}],
             props = _}],
       stdout_formatter_table:normalize_rows_and_cells(
         #table{}, [[a, b], [c]])),

    ?assertMatch(
       [#row{cells =
             [#cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["a"], props = _}],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["b"], props = _}],
                  props = _},
               props = _}],
             props = _},
        #row{cells =
             [#cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["c"], props = _}],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [],
                  props = _},
               props = _}],
             props = _},
        #row{cells =
             [#cell{
                 content =
                 #formatted_block{
                    lines = [#formatted_line{content = ["e"], props = _}],
                    props = _},
                 props = _},
              #cell{
                 content =
                 #formatted_block{
                    lines = [#formatted_line{content = ["f"], props = _}],
                    props = _},
                 props = _}],
             props = _}],
       stdout_formatter_table:normalize_rows_and_cells(
         #table{}, [[a, b], [c], [e, f]])),

    ?assertMatch(
       [#row{cells =
             [#cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["a"], props = _}],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["b"], props = _}],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [],
                  props = _},
               props = _}],
             props = _},
        #row{cells =
             [#cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["c"], props = _}],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [],
                  props = _},
               props = _}],
             props = _},
        #row{cells =
             [#cell{
                 content =
                 #formatted_block{
                    lines = [#formatted_line{content = ["e"], props = _}],
                    props = _},
                 props = _},
              #cell{
                 content =
                 #formatted_block{
                    lines = [#formatted_line{content = ["f"], props = _}],
                    props = _},
                 props = _},
              #cell{
                 content =
                 #formatted_block{
                    lines = [#formatted_line{content = ["g"], props = _}],
                    props = _},
                 props = _},
              #cell{
                 content =
                 #formatted_block{
                    lines = [#formatted_line{content = ["h"], props = _}],
                    props = _},
                 props = _}],
             props = _}],
         stdout_formatter_table:normalize_rows_and_cells(
           #table{}, [[a, b], [c], [e, f, g, h]])),

    ?assertMatch(
       [#row{cells =
             [#cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["A"], props = _},
                           #formatted_line{content = ["A"], props = _}],
                  props = _},
               props = _},
              #cell{
               content =
               #formatted_block{
                  lines = [#formatted_line{content = ["B"], props = _}],
                  props = _},
               props = _}],
             props = _}],
       stdout_formatter_table:normalize_rows_and_cells(
         #table{}, [["A\nA", "B"]])).

compute_cols_widths_test() ->
    ?assertEqual(
       [],
       stdout_formatter_table:compute_cols_widths([])),
    ?assertEqual(
       [],
       stdout_formatter_table:compute_cols_widths([#row{}])),
    ?assertEqual(
       [],
       stdout_formatter_table:compute_cols_widths([#row{}, #row{}])),
    ?assertEqual(
       [0],
       stdout_formatter_table:compute_cols_widths([#row{cells = [#cell{}]}])),
    ?assertEqual(
       [0],
       stdout_formatter_table:compute_cols_widths([#row{cells = [#cell{}]},
                                                   #row{cells = [#cell{}]}])),
    ?assertEqual(
       [3],
       stdout_formatter_table:compute_cols_widths(
         [#row{cells = [stdout_formatter_table:format_cell(a)]},
          #row{cells = [stdout_formatter_table:format_cell(bcd)]}])),
    ?assertEqual(
       [3],
       stdout_formatter_table:compute_cols_widths(
         [#row{cells = [stdout_formatter_table:format_cell(abc)]},
          #row{cells = [stdout_formatter_table:format_cell(d)]}])),
    ?assertEqual(
       [0, 3],
       stdout_formatter_table:compute_cols_widths(
         [#row{cells = [#cell{}, stdout_formatter_table:format_cell(abc)]},
          #row{cells = [#cell{}, stdout_formatter_table:format_cell(d)]}])),
    ?assertEqual(
       [3, 0],
       stdout_formatter_table:compute_cols_widths(
         [#row{cells = [stdout_formatter_table:format_cell(abc), #cell{}]},
          #row{cells = [stdout_formatter_table:format_cell(d), #cell{}]}])),
    ?assertEqual(
       [1],
       stdout_formatter_table:compute_cols_widths(
         [#row{cells = [stdout_formatter_table:format_cell("a\nb")]},
          #row{cells = [stdout_formatter_table:format_cell(c)]}])),
    ?assertEqual(
       [3],
       stdout_formatter_table:compute_cols_widths(
         [#row{cells = [stdout_formatter_table:format_cell("a\nbcd")]},
          #row{cells = [stdout_formatter_table:format_cell(e)]}])).

to_string_test() ->
    ?assertEqual(
       "",
       stdout_formatter_table:to_string([])),
    ?assertEqual(
       "\e(0lqk\e(B\n"         %% ┌─┐
       "\e(0x\e(Ba\e(0x\e(B\n" %% │a│
       "\e(0mqj\e(B",          %% └─┘
       stdout_formatter_table:to_string([[a]])),
    ?assertEqual(
       "\e(0lqk\e(B\n"         %% ┌─┐
       "\e(0x\e(Ba\e(0x\e(B\n" %% │a│
       "\e(0mqj\e(B",          %% └─┘
       stdout_formatter_table:to_string(
         #table{rows = [[a]],
                props = #{border_drawing => ansi}})),
    ?assertEqual(
       "+-+\n"  %% +-+
       "|a|\n"  %% |a|
       "+-+",   %% +-+
       stdout_formatter_table:to_string(
         #table{rows = [[a]],
                props = #{border_drawing => ascii}})),
    ?assertEqual(
       "\e(0lqwqk\e(B\n"                 %% ┌─┬─┐
       "\e(0x\e(Ba\e(0x\e(Bb\e(0x\e(B\n" %% │a│b│
       "\e(0tqnqu\e(B\n"                 %% ├─┼─┤
       "\e(0x\e(Bc\e(0x\e(Bd\e(0x\e(B\n" %% │c│d│
       "\e(0mqvqj\e(B",                  %% └─┴─┘
       stdout_formatter_table:to_string([[a, b], [c, d]])),
    ?assertEqual(
       "+-+-+\n"  %% +-+-+
       "|a|b|\n"  %% |a|b|
       "+-+-+\n"  %% +-+-+
       "|c|d|\n"  %% |c|d|
       "+-+-+",   %% +-+-+
       stdout_formatter_table:to_string(
         #table{rows = [[a, b], [c, d]],
                props = #{border_drawing => ascii}})),
    ?assertEqual(
       "+-+-+\n"                             %% +-+-+
       "|\033[1ma\033[0m|\033[1mb\033[0m|\n" %% |a|b|
       "+-+-+\n"                             %% +-+-+
       "|c|d|\n"                             %% |c|d|
       "+-+-+",                              %% +-+-+
       stdout_formatter_table:to_string(
         #table{rows = [#row{cells = [a, b], props = #{title => true}},
                        [c, d]],
                props = #{border_drawing => ascii}})),
    ?assertEqual(
       "+-+-+\n" %% +-+-+
       "|A|B|\n" %% |A|B|
       "|A| |\n" %% |A| |
       "+-+-+",  %% +-+-+
       stdout_formatter_table:to_string(
         #table{rows = [["A\nA", "B"]],
                props = #{border_drawing => ascii}})),
    ?assertEqual(
       "+-+-+\n" %% +-+-+
       "|A|B|\n" %% |A|B|
       "| |B|\n" %% | |B|
       "+-+-+",  %% +-+-+
       stdout_formatter_table:to_string(
         #table{rows = [["A", "B\nB"]],
                props = #{border_drawing => ascii}})),
    ?assertEqual(
       "AB\n"
       " B",
       stdout_formatter_table:to_string(
         #table{rows = [["A", "B\nB"]],
                props = #{border_drawing => none}})).
module Main exposing (..)

import Html


uc : String -> String
uc name =
    let
        len =
            String.length name
    in
        if (len) > 2 then
            (String.toUpper name) ++ ", Length: " ++ toString len
        else
            name


(~=) : String -> String -> Bool
(~=) one two =
    String.left 1 one == String.left 1 two


wc : String -> Int
wc foo =
    List.length <| String.words foo


main : Html.Html msg
main =
    -- Html.text <| uc "arf your tomatoes today"
    -- Html.text <| toString <| (~=) "arf" "at"
    -- Html.text <| toString <| wc "now is the time bs ok!"
    "now is some time bs"
        |> wc
        |> toString
        |> Html.text

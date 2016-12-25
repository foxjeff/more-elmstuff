module Main exposing (..)

import Html


type alias CartItem =
    { name : String, qty : Int, freeQty : Int }


cart : List CartItem
cart =
    [ { name = "Lemmon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pearch", qty = 10, freeQty = 0 }
    ]


freeStuff : CartItem -> CartItem
freeStuff item =
    let
        qty =
            item.qty
    in
        if qty >= 10 then
            { item | freeQty = 3 }
        else if qty >= 5 then
            { item | freeQty = 1 }
        else
            item


main : Html.Html msg
main =
    List.map freeStuff cart
        |> toString
        |> Html.text

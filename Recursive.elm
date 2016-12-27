module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type IntList
    = Empty
    | Node Int IntList


type alias Model =
    { il : IntList
    , sum : Int
    }


sum : IntList -> Int
sum ns =
    case ns of
        Empty ->
            0

        Node n rn ->
            n + sum rn


initialModel : Model
initialModel =
    { il = Node 13 (Node 23 Empty)
    , sum = 0
    }


type Msg
    = Sum


update : Msg -> Model -> Model
update msg model =
    case msg of
        Sum ->
            { model | sum = sum model.il }


view : Model -> Html Msg
view model =
    div []
        [ text ("Sum: " ++ (toString model))
        , br [] []
        , button [ type_ "Button", onClick Sum ] [ text "AddIt" ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = initialModel, update = update, view = view }

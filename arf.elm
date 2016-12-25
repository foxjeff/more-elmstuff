module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    Int


initialModel : Int
initialModel =
    0


type Msg
    = AddIt
    | ClearIt


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddIt ->
            model + 1

        ClearIt ->
            initialModel


view : Model -> Html Msg
view model =
    div []
        [ text ("It: " ++ (toString model))
        , br [] []
        , button [ type_ "Button", onClick AddIt ] [ text "AddIt" ]
        , button [ type_ "Button", onClick ClearIt ] [ text "ClearIt" ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = initialModel, update = update, view = view }

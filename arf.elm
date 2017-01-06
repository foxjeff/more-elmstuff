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
    | Freg


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddIt ->
            model + 1

        ClearIt ->
            initialModel

        Freg ->
            Debug.log "stuff goes here"
                model


view : Model -> Html Msg
view model =
    div []
        [ text ("It: " ++ (toString model))
        , br [] []
        , button [ type_ "Button", onClick AddIt ] [ text "AddIt" ]
        , button [ type_ "Button", onClick ClearIt ] [ text "ClearIt" ]
        , button [ type_ "Button", onClick Freg ] [ text "Freg" ]
        ]


type alias Bg =
    { url : String }
bg = Bg "blerg"

[bg] |> Array.fromList |> Array.get 0 |> Maybe.map .url
-- Just "blerg" : Maybe.Maybe String



main : Program Never Model Msg
main =
    Html.beginnerProgram { model = initialModel, update = update, view = view }

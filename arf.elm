module Arf exposing (..)

import Array
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http


type alias Model =
    Int


initialModel : Int
initialModel =
    0


type Msg
    = AddIt
    | ClearIt
    | Freg
    | Nb



-- | NewBook (Result Http.Error String)


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



-- Nb ->
--     Debug.log "nb: " wp
-- NewBook (Ok book) ->
--     Debug.log "book: "
--         model
-- NewBook (Result.Err _) ->
--     Debug.log "error"
--         model


view : Model -> Html Msg
view model =
    div []
        [ text ("It: " ++ (toString model))
        , br [] []
        , button [ type_ "Button", onClick AddIt ] [ text "AddIt" ]
        , button [ type_ "Button", onClick ClearIt ] [ text "ClearIt" ]
        , button [ type_ "Button", onClick Freg ] [ text "Freg" ]
        , button [ type_ "Button", onClick Nb ] [ text "NewBook" ]
        ]


type alias Bg =
    { url : Maybe String }


bg =
    Bg Nothing


arf =
    [ { url = "arf" } ]
        |> Array.fromList
        |> Array.get 0
        |> Maybe.map .url
        |> Debug.log "arf is: "


bloo =
    Debug.log "bg: " { bg | url = arf }


wp =
    Http.getString "https://example.com/books/war-and-peace"


h =
    Http.send



-- Just "blerg" : Maybe.Maybe String


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = initialModel, update = update, view = view }

module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json


type alias Model =
    { model : Int, increment : Int }


initialModel : Model
initialModel =
    Model 0 0


type Msg
    = AddIt
    | CollectIt String
    | ClearIt
    | KeyUp Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddIt ->
            { model
                | model = model.model + model.increment
                , increment = 0
            }

        CollectIt arf ->
            { model | increment = Result.withDefault 0 (String.toInt arf) }

        ClearIt ->
            initialModel

        KeyUp key ->
            -- so CollectIt AND KeyUp will both fire on every keyup
            -- the big idea is that unless key == 13, just return the already
            -- updated (from CollectIt) model
            -- i'm thinking that using the advanced update : Msg -> Model -> (Model, Msg)
            -- then KeyUp could send the CollectIt msg to the update function, but where
            -- would it get the input value; or could key just be transformed into it?
            if key == 13 then
                { model
                    | model = model.model + model.increment
                    , increment = 0
                }
            else
                model



-- Html.Attributes.keyCode
-- tagger is the msg passed as the argument to onKeyUp,
-- in this case it is KeyUp


onKeyUp : (Int -> msg) -> Attribute msg
onKeyUp tagger =
    on "keyup" (Json.map tagger keyCode)



-- don't need this, just wanted to see it work
-- targetValue is a function from Html.Attributes


onMyInput : (String -> msg) -> Attribute msg
onMyInput tagger =
    on "input" (Json.map tagger targetValue)


view : Model -> Html Msg
view model =
    div []
        [ h4 [] [ text ("It: " ++ (toString model.model)) ]
        , input
            [ type_ "Input"
            , onKeyUp KeyUp
            , onMyInput CollectIt
            , value
                (if model.increment == 0 then
                    ""
                 else
                    toString model.increment
                )
            ]
            []
        , br [] []
        , button [ type_ "Button", onClick AddIt ] [ text "AddIt" ]
        , button [ type_ "Button", onClick ClearIt ] [ text "ClearIt" ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , update = update
        , view = view
        }

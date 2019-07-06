module Main exposing (..)

import Browser
import Html exposing (Html, Attribute, div, input, text, button, br)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)

-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL


type alias Model =
  { content : String
  }


init : Model
init =
  { content = "" }


-- UPDATE


type Msg
  = Change String
  | Reset


update : Msg -> Model -> Model
update msg model =
  case msg of

    Change newContent ->
        { model | content = newContent }

    Reset  ->
        { model | content = "" }



-- VIEW

renderText : Model -> String
renderText model =
    if String.isEmpty model.content
    then ""
    else "Hello, " ++ model.content ++ "!"


rootStyle : Attribute msg
rootStyle =
    attribute
        "style"
        "background-color: #eeeeee; width: 10rem; padding: 2rem; margin: 4rem; border: solid 1px black"


view : Model -> Html Msg
view model =
  div [ rootStyle ]
    [ div [] [ text (renderText model) ]
    , br [] []
    , input [ placeholder "Enter text", value model.content, onInput Change, size 13, maxlength 12, autofocus True] []
    , br [] []
    , br [] []
    , button [ onClick Reset ] [ text "Reset" ]
    ]

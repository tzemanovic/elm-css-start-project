module View exposing (..)

import Assets exposing (Assets)
import Html exposing (Html, text, div, img)
import Html.Attributes exposing (src)
import Html.CssHelpers exposing (withNamespace)
import Shared exposing (..)


{ id, class, classList } =
    withNamespace cssNamespace

type alias Model =
    { message : String
    , assets: Assets
    }

type Msg
    = NoOp | Op

init : Assets -> ( Model, Cmd Msg )
init assets =
    ( { message = "Elm App is working!", assets = assets }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div [ id Page ]
        [ div [ class [ Message ] ] [ text model.message ]
        , img [ src model.assets.logo ] []
        ]

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

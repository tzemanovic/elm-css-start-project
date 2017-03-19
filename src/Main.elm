module Main exposing (..)

import View exposing (..)
import Html exposing (programWithFlags)
import Shared exposing (cssNamespace)
import Html.CssHelpers exposing (withNamespace)


{ id, class, classList } =
    Html.CssHelpers.withNamespace cssNamespace


main : Program String Model Msg
main =
    programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }

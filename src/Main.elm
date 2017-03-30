module Main exposing (main)

import Assets exposing (Assets)
import View exposing (view, init, update, Msg, Model, subscriptions)
import Html exposing (programWithFlags)
import Shared exposing (cssNamespace)
import Html.CssHelpers exposing (withNamespace)


{ id, class, classList } =
    Html.CssHelpers.withNamespace cssNamespace

main : Program Assets Model Msg
main =
    programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }

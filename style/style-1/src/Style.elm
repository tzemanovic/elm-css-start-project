module Style
    exposing
        ( appCss
        )

import Css exposing (..)
import Css.Elements exposing (body, li)
import Css.Namespace exposing (namespace)
import Shared exposing (..)


appCss : Stylesheet
appCss =
    (stylesheet << namespace cssNamespace)
        [ body
            [ overflowX auto
            , minWidth (px 1280)
            , backgroundColor primaryAccentColor
            ]
        , id Page
            [ color (hex "000000")
            , width (pct 100)
            , height (pct 100)
            , boxSizing borderBox
            , padding (px 8)
            , margin zero
            ]
        , class Message
            [ margin zero
            , padding zero
            ]
        ]


primaryAccentColor =
    hex "ccffff"

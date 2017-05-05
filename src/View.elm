module View exposing (..)

import Assets exposing (Assets)
import Shared exposing (..)
import Animation
import Html exposing (Html, text, div, img)
import Html.Attributes exposing (src)
import Html.CssHelpers exposing (withNamespace)
import Keyboard.Extra as Keyboard exposing (Key(..), KeyChange(..))
import Task
import Window


{ id, class, classList } =
    withNamespace cssNamespace


type alias Model =
    { height : Int
    , width : Int
    , pressedKeys : List Key
    , style : Animation.State
    , message : String
    , assets : Assets
    }


type Msg
    = NoOp
      -- window height and width
    | Resize Int Int
    | Animate Animation.Msg
    | KeyboardMsg Keyboard.Msg


init : Assets -> ( Model, Cmd Msg )
init assets =
    ( { height = 0
      , width = 0
      , pressedKeys = []
      , style =
            Animation.style
                [ Animation.opacity 1.0
                ]
      , message = "Elm App is working!"
      , assets = assets
      }
    , windowSize
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        Resize h w ->
            ( { model | height = h, width = w }, Cmd.none )

        Animate animation ->
            ( { model | style = Animation.update animation model.style }, Cmd.none )

        KeyboardMsg keyMsg ->
            let
                ( pressedKeys, keyChange ) =
                    Keyboard.updateWithKeyChange keyMsg model.pressedKeys
            in
                ( { model
                    | pressedKeys = pressedKeys
                  }
                , Cmd.none
                )


view : Model -> Html Msg
view model =
    div [ id Page ]
        [ div [ class [ Message ] ] [ text model.message ]
        , img [ src model.assets.logo ] []
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map KeyboardMsg Keyboard.subscriptions
        , Animation.subscription Animate [ model.style ]
        , Window.resizes windowSizeToMsg
        ]


windowSize : Cmd Msg
windowSize =
    Task.attempt
        (\result ->
            Result.withDefault NoOp <| Result.map windowSizeToMsg result
        )
        Window.size


windowSizeToMsg : Window.Size -> Msg
windowSizeToMsg { height, width } =
    Resize height width

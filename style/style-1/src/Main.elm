port module Stylesheets exposing (..)

import Css exposing (..)
import Css.File exposing (..)
import Style
import Css.Normalize


port files : CssFileStructure -> Cmd msg


cssFiles : CssFileStructure
cssFiles =
    toFileStructure
        [ ( "../../src/main.css", Css.compile [ Css.Normalize.css, Style.appCss ] ) ]

main : CssCompilerProgram
main =
    compiler files cssFiles

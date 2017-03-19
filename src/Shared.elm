module Shared
    exposing
        ( CssClasses(..)
        , CssIds(..)
        , cssNamespace
        )

{-| This file contains the shared information between the style (CSS) and the view, specifically the CSS classes, IDs and namespace.

# Definition
@docs CssClasses, CssIds, cssNamespace

-}

{-| CSS Classes.
-}
type CssClasses
    = Message


{-| CSS IDs.
-}
type CssIds
    = Page


{-| CSS namespace.
-}
cssNamespace : String
cssNamespace =
    "loop11-ui-v2"

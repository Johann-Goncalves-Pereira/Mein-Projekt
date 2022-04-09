module Pages.NotFound exposing (page)

import Gen.Params.NotFound exposing (Params)
import Gen.Route as Route
import Html exposing (Html, a, div, h1, main_, p, text)
import Html.Attributes exposing (class, href)
import Page exposing (Page)
import Request
import Shared
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page
page shared req =
    Page.static
        { view = view
        }


view : View msg
view =
    { title = "Page Not Found"
    , body = viewPage
    }


viewPage : List (Html msg)
viewPage =
    [ main_ [ class "not-found bg-surface-0 h-full" ]
        [ h1 [ class "not-found__title font-bold" ] [ text "404" ]
        , p [ class "not-found__text" ] [ text "Page not found" ]
        , a [ class "not-found__link", href <| Route.toHref Route.Home_ ] [ text "Home" ]
        ]
    ]

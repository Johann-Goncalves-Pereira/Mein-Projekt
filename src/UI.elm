module UI exposing (PageModel, layout, pageConfig)

import Gen.Route as Route exposing (Route)
import Html exposing (Attribute, Html, a, div, header, main_, nav, text)
import Html.Attributes exposing (class, classList, href, id, tabindex)
import Regex



-- Model


type alias PageModel msg =
    { route : Route
    , rootAttr : List (Attribute msg)
    , headerContent : List (Html msg)
    , mainContent : List (Html msg)
    , mainAttrs : List (Attribute msg)
    , pageFooter : Maybe (Html msg)
    , pageSandbox : Maybe (List (Html msg))
    }


type alias Link =
    { routeStatic : Route
    , routeReceived : Route
    , routeName : String
    , hasMarginLeft : Bool
    }


pageConfig : PageModel msg
pageConfig =
    { route = Route.Home_
    , rootAttr = []
    , headerContent = []
    , mainContent = []
    , mainAttrs = []
    , pageFooter = Nothing
    , pageSandbox = Nothing
    }


defaultLink : Link
defaultLink =
    { routeStatic = Route.Home_
    , routeReceived = Route.Home_
    , routeName = ""
    , hasMarginLeft = False
    }



-- Structure


isRoute : Route -> Route -> Bool
isRoute route compare =
    case ( route, compare ) of
        ( Route.Home_, Route.Home_ ) ->
            True

        ( Route.Template__Gaslur, Route.Template__Gaslur ) ->
            True

        _ ->
            False


caseNamePage : Route -> String
caseNamePage route =
    case route of
        Route.Home_ ->
            "Home"

        Route.Template__Kafer ->
            "Kafer"

        Route.Template__Gaslur ->
            "Gaslur"

        Route.Template__District ->
            "District"

        Route.NotFound ->
            "Not Found"


userReplace : String -> (Regex.Match -> String) -> String -> String
userReplace userRegex replacer string =
    case Regex.fromString userRegex of
        Nothing ->
            string

        Just regex ->
            Regex.replace regex replacer string


classBuilder : String -> String
classBuilder string =
    userReplace "[ ]" (\_ -> "-") string
        |> String.toLower



-- View


layout : PageModel msg -> List (Html msg)
layout model =
    let
        mainClass : Attribute msg
        mainClass =
            class <| "main--" ++ classBuilder (caseNamePage model.route)

        caseSandbox =
            case model.pageSandbox of
                Just content ->
                    content

                Nothing ->
                    [ viewHeader model
                    , main_ (mainClass :: model.mainAttrs) model.mainContent
                    , Maybe.withDefault (text "") model.pageFooter
                    ]
    in
    [ div
        ([ id "root"
         , classList [ ( "root--" ++ classBuilder (caseNamePage model.route), True ) ]
         ]
            ++ model.rootAttr
        )
        caseSandbox
    ]


viewHeader : PageModel msg -> Html msg
viewHeader model =
    header [ class "main-header" ] <|
        nav [ class "main-header__nav" ]
            (viewHeaderLinks model [ Route.Home_ ])
            :: model.headerContent


viewHeaderLinks : PageModel msg -> List Route -> List (Html msg)
viewHeaderLinks model links =
    List.map
        (\staticRoute ->
            viewLink
                { defaultLink
                    | routeName = caseNamePage staticRoute
                    , routeStatic = staticRoute
                    , routeReceived = model.route
                }
        )
        links


viewLink : Link -> Html msg
viewLink model =
    a
        [ class "main-header__links"
        , classList
            [ ( "main-header__links--current-page"
              , isRoute model.routeReceived model.routeStatic
              )
            , ( "main-header__links--margin-left", model.hasMarginLeft )
            ]
        , href <| Route.toHref model.routeStatic
        , tabindex 1
        ]
        [ text model.routeName ]

module Pages.Gaslur exposing (Model, Msg, page)

import Array exposing (Array)
import Browser.Dom exposing (Viewport, getViewport)
import Browser.Events as BrowserEvents
import Components.Svg as SVG
import Gen.Params.Gaslur exposing (Params)
import Gen.Route as Route
import Html exposing (Html, a, button, div, em, h1, h2, header, img, li, nav, p, section, span, strong, text, ul)
import Html.Attributes as HA exposing (alt, attribute, class, classList, href, id, src)
import Html.Attributes.Aria exposing (ariaLabelledby)
import Page
import Platform exposing (Task)
import Request
import Shared
import Task
import UI exposing (pageConfig)
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subs
        }



-- INIT


type alias Model =
    { windowViewport : ( Int, Int ) }


init : ( Model, Cmd Msg )
init =
    ( { windowViewport = ( 0, 0 ) }, Task.perform GetViewport getViewport )



-- UPDATE


type Msg
    = GetViewport Viewport
    | NewViewport ( Int, Int )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetViewport viewport ->
            let
                transformAxisToInt : Float -> Float -> ( Int, Int )
                transformAxisToInt width height =
                    ( truncate width, truncate height )

                w : Float
                w =
                    viewport.viewport.width

                h : Float
                h =
                    viewport.viewport.height
            in
            ( { model | windowViewport = transformAxisToInt w h }, Cmd.none )

        NewViewport screenUpdate ->
            ( { model | windowViewport = screenUpdate }, Cmd.none )



-- VIEW


view : Model -> View Msg
view model =
    { title = "Gaslur - Home"
    , body =
        UI.layout
            { pageConfig
                | route = Route.Gaslur
                , headerContent = viewHeader
                , mainContent = viewMain model
            }
    }


textToUpper : String -> Html msg
textToUpper str =
    text <| String.toUpper str


viewHeader : List (Html Msg)
viewHeader =
    [ nav [ class "nav" ]
        [ a [ class "nav__link nav__link--current", href "#" ] [ textToUpper "Home" ]
        , a [ class "nav__link", href "#" ] [ textToUpper "My profile" ]
        , a [ class "nav__link", href "#" ] [ textToUpper "activity" ]
        , a [ class "nav__link", href "#" ] [ textToUpper "how it works" ]
        ]
    , nav [ class "login" ]
        [ button [ class "login__link login__link--border" ] [ textToUpper "create" ]
        , button [ class "login__link" ] [ textToUpper "sign in" ]
        ]
    ]


subs : Model -> Sub Msg
subs _ =
    BrowserEvents.onResize (\w h -> NewViewport ( w, h ))


viewMain : Model -> List (Html Msg)
viewMain model =
    [ viewMainSection
    , viewHotActions model
    ]


viewMainSection : Html Msg
viewMainSection =
    section [ class "main", ariaLabelledby "heading" ]
        [ header [ class "main__ctnr" ]
            [ h1 [ class "text-7xl tracking-[-2px] mb-5", id "heading" ] [ text "Discover, collect,  and charity in extraordinary NFT marketplace" ]
            , p [ class "text-2xl font-light" ] [ textToUpper """In aenean posuere lorem risus nec. Tempor tincidunt
             aenean purus purus vestibulum nibh mi venenatis""" ]
            , div [ class "flex gap-7 items-center py-4" ]
                [ button [ class "btm" ] [ text "Explore" ]
                , button [ class "btm btm--border" ] [ text "Create" ]
                ]
            ]
        , div [ class "main__ctnr" ]
            [ div [ class "glass-card" ]
                [ img [ class "glass-card__image", src "https://picsum.photos/800" ] []
                , div [ class "glass-card__bottom gap-2" ]
                    [ img [ class "row-span-2 rounded-[50%] w-14", src "https://picsum.photos/600" ] []
                    , strong [] [ text "Laura" ]
                    , span [] [ text <| String.fromFloat 0.21 ++ " Weth" ]
                    , strong [ class "col-start-3 row-start-1 ml-auto" ] [ textToUpper "WE ARE HERE" ]
                    , span [ class "flex gap-2 ml-auto" ] [ SVG.gaslur SVG.Heart, text <| String.fromInt 25 ]
                    ]
                , SVG.gaslur SVG.GlassCard
                ]
            ]
        ]


viewHotActions : Model -> Html Msg
viewHotActions model =
    let
        w =
            Tuple.first model.windowViewport

        numberOfItems : Int
        numberOfItems =
            if w <= 640 then
                2

            else if w <= 768 then
                3

            else if w <= 1024 then
                4

            else if w <= 1536 then
                5
                -- else if w <= 1536 then
                --     8

            else
                6
    in
    section [ class "hot-actions", ariaLabelledby "hot-actions-heading" ]
        [ header [ class "flex justify-between mb-7" ]
            [ h2 [ class "text-[2.625rem] font-medium", id "hot-actions-heading" ] [ text "Hot auctions" ]
            , button [ class "hot-actions__header__btm flex items-center gap-3" ] [ strong [] [ text "View all" ], SVG.gaslur SVG.Arrow ]
            ]
        , hotActionsListContent numberOfItems
            |> ul
                [ class "hot-actions__list"
                , attribute "style" <| "--number-of-col:" ++ String.fromInt numberOfItems
                ]
        ]


hotActionsListContent : Int -> List (Html Msg)
hotActionsListContent nItens =
    let
        sliceItems : Int -> List a -> List a
        sliceItems int contentList =
            Array.toList (Array.slice 0 int <| Array.fromList contentList)

        listContent : List { image : String, author : String, price : Float, endDate : String }
        listContent =
            [ { image = "https://picsum.photos/200", author = "Lorem Ipsum", price = 30.73, endDate = "01.34.45" }
            , { image = "https://picsum.photos/220", author = "Johann Gonçalves Pereira", price = 2.45, endDate = "01.34.45" }
            , { image = "https://picsum.photos/240", author = "Johann Gonçalves Pereira", price = 2.45, endDate = "01.34.45" }
            , { image = "https://picsum.photos/260", author = "Gonçalves Pereira", price = 2.45, endDate = "01.34.45" }
            , { image = "https://picsum.photos/280", author = "Johann Gonçalves Pereira", price = 2.45, endDate = "01.34.45" }
            , { image = "https://picsum.photos/300", author = "Pereira Assunção", price = 2.45, endDate = "01.34.45" }
            , { image = "https://picsum.photos/320", author = "Pereira Joaquin", price = 2.45, endDate = "01.34.45" }
            , { image = "https://picsum.photos/340", author = "Gonçalves Pereira", price = 2.45, endDate = "01.34.45" }
            , { image = "https://picsum.photos/360", author = "Johann Gonçalves Pereira", price = 2.45, endDate = "01.34.45" }
            , { image = "https://picsum.photos/380", author = "Johann Sousa", price = 2.45, endDate = "01.34.45" }
            , { image = "https://picsum.photos/400", author = "Gonçalves Pereira", price = 2.45, endDate = "01.34.45" }
            ]

        transformDate : String -> String
        transformDate str =
            String.replace "." "-" str
    in
    List.map
        (\{ image, author, price, endDate } ->
            li [ class "item" ]
                [ img [ class "col-span-2 rounded-xl w-full ", src image, alt <| "Made by" ++ author ] []
                , strong [ class "overflow-hidden text-ellipsis max-w-full whitespace-nowrap" ] [ text author ]
                , p [ class "font-semibold ml-auto" ] [ text <| String.fromFloat price ++ " Weth" ]
                , p [ class "item__end-date" ] [ text "Ends in ", Html.time [ HA.datetime <| transformDate endDate ] [ text endDate ] ]
                , button [ class "item__btm font-semibold ml-auto" ] [ text "Bid" ]
                ]
        )
        (sliceItems nItens listContent)

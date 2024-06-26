module Pages.Template.Gaslur exposing (Model, Msg, page)

import Array exposing (Array)
import Browser.Dom exposing (Element, Error, Viewport, getViewport)
import Browser.Events as BrowserEvents
import Components.Svg as SVG exposing (gaslur)
import Gen.Params.Home_ exposing (Params)
import Gen.Route as Route
import Html
    exposing
        ( Attribute
        , Html
        , a
        , button
        , div
        , em
        , footer
        , h1
        , h2
        , h3
        , h4
        , h5
        , header
        , img
        , li
        , main_
        , nav
        , p
        , section
        , small
        , span
        , strong
        , text
        , ul
        )
import Html.Attributes as HtmlAttr exposing (alt, attribute, class, classList, href, id, src)
import Html.Attributes.Aria exposing (ariaLabelledby)
import Html.Events as HtmlEvents
import Html.Events.Extra.Mouse as MouseEvents
import Json.Decode as Decode exposing (Decoder)
import Page
import Platform exposing (Task)
import Request
import Round
import Shared
import Svg.Attributes exposing (display, style)
import Task
import UI exposing (pageConfig)
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscription
        }



-- INIT


type alias Model =
    { windowViewport : ( Int, Int )
    , mousePosition : { x : Float, y : Float }
    , cardSize : Maybe { width : Float, height : Float }
    }


init : ( Model, Cmd Msg )
init =
    ( { windowViewport = ( 0, 0 )
      , mousePosition = { x = 0, y = 0 }
      , cardSize = Nothing
      }
    , Cmd.batch
        [ Task.perform GetViewport getViewport
        , Browser.Dom.getElement "main-card"
            |> Task.attempt GotCard
        ]
    )



-- UPDATE


type Msg
    = GetViewport Viewport
    | NewViewport ( Int, Int )
    | MouseMove ( Float, Float )
    | GotCard (Result Error Element)


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

        MouseMove ( x, y ) ->
            ( { model | mousePosition = { x = x, y = y } }, Cmd.none )

        GotCard checkCard ->
            case checkCard of
                Err _ ->
                    ( { model | cardSize = Nothing }, Cmd.none )

                Ok element ->
                    ( { model
                        | cardSize =
                            Just
                                { width = element.element.width
                                , height = element.element.height
                                }
                      }
                    , Cmd.none
                    )



-- SUBSCRIPTION


subscription : Model -> Sub Msg
subscription _ =
    BrowserEvents.onResize (\w h -> NewViewport ( w, h ))



{-
   type alias EventWithMovement =
       { mouseEvent : MouseEvents.Event
       , movement : ( Float, Float )
       }


   decodeWithMovement : Decoder EventWithMovement
   decodeWithMovement =
       Decode.map2 EventWithMovement
           MouseEvents.eventDecoder
           movementDecoder


   movementDecoder : Decoder ( Float, Float )
   movementDecoder =
       Decode.map2 (\a b -> ( a, b ))
           (Decode.field "movementX" Decode.float)
           (Decode.field "movementY" Decode.float)


   onMove : (EventWithMovement -> Msg) -> Html.Attribute Msg
   onMove tag =
       let
           decoder =
               decodeWithMovement
                   |> Decode.map tag
                   |> Decode.map options

           options message =
               { message = message
               , stopPropagation = False
               , preventDefault = True
               }
       in
       HtmlEvents.custom "mousemove" decoder
-}


depthCard : Model -> { x : String, y : String }
depthCard model =
    case model.cardSize of
        Nothing ->
            { x = "0", y = "0" }

        Just cardSize ->
            let
                adjustAxis : Float -> Float -> Float
                adjustAxis axisType posType =
                    if posType < 0 then
                        0

                    else if posType > axisType then
                        axisType

                    else
                        posType

                top : Float
                top =
                    adjustAxis model.mousePosition.y cardSize.height

                left : Float
                left =
                    adjustAxis model.mousePosition.x cardSize.width

                width : Float
                width =
                    cardSize.width

                height : Float
                height =
                    cardSize.height

                calcPos : Float -> Float -> Float
                calcPos posType axisType =
                    posType - axisType / 2

                pos : { x : Float, y : Float }
                pos =
                    { x = calcPos left width
                    , y = calcPos top height
                    }

                composeDepth : Float -> Float -> Float
                composeDepth axisType posType =
                    posType * 15 / (axisType / 2)

                depth : { x : Float, y : Float }
                depth =
                    { x = composeDepth width pos.x
                    , y = composeDepth height pos.y
                    }

                --! How to debug in elm
                -- _ =
                -- Debug.log "Depth" ( depth.x, depth.y )
            in
            if depth.x * depth.y < 0 then
                { x = Round.round 2 <| depth.x * -1
                , y = Round.round 2 <| depth.y * -1
                }

            else
                { x = Round.round 2 <| depth.x
                , y = Round.round 2 <| depth.y
                }


transformCard : Model -> Attribute Msg
transformCard model =
    let
        depth : { x : String, y : String }
        depth =
            depthCard model
    in
    String.concat [ "transform: rotateX(", depth.y, "deg) rotateY(", depth.x, "deg)" ]
        |> attribute "style"



-- String.concat [ Round.round 2 pos.x, "(x) : ", Round.round 2 pos.y, "(y)" ]
-- VIEW


view : Model -> View Msg
view model =
    { title = "Template - Gaslur"
    , body =
        UI.layout
            { pageConfig
                | route = Route.Template__Gaslur
                , pageSandbox = Just <| viewPage model
            }
    }


viewPage : Model -> List (Html Msg)
viewPage model =
    [ viewHeader, viewMain model, viewFooter ]


textToUpper : String -> Html msg
textToUpper str =
    text <| String.toUpper str


viewHeader : Html Msg
viewHeader =
    header [ class "gaslur__header" ]
        [ a [ class "gaslur__header__link", HtmlAttr.href <| Route.toHref Route.Home_ ] [ text "Gaslur" ]
        , nav [ class "nav" ]
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


viewMain : Model -> Html Msg
viewMain model =
    main_ [ class "main--gaslur" ]
        [ viewMainSection model
        , viewHotActions model
        , viewGettingStarted
        , viewDiscover model
        ]


viewMainSection : Model -> Html Msg
viewMainSection model =
    let
        depth : { x : String, y : String }
        depth =
            depthCard model
    in
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
        , div [ class "main__ctnr", id "main-card", MouseEvents.onMove (.offsetPos >> MouseMove) ]
            [ div
                [ class "glass-card"
                , transformCard model
                ]
                [ img [ class "glass-card__image", src "https://picsum.photos/800" ] []
                , div [ class "glass-card__bottom gap-2" ]
                    [ img [ class "row-span-2 rounded-[50%] w-14", src "https://picsum.photos/600" ] []
                    , strong [] [ text "Laura" ]
                    , span [] [ text <| String.fromFloat 0.21 ++ " Weth" ]
                    , strong [ class "col-start-3 row-start-1 ml-auto" ] [ textToUpper "WE ARE HERE" ]
                    , span [ class "flex gap-2 ml-auto" ] [ gaslur SVG.Heart, text <| String.fromInt 25 ]
                    ]
                , gaslur SVG.GlassCard
                ]
            ]
        ]


screenViewportWidth : Model -> Int
screenViewportWidth model =
    Tuple.first model.windowViewport


numberOfItems : Model -> Int
numberOfItems model =
    let
        w =
            screenViewportWidth model
    in
    if w <= 640 then
        1

    else if w <= 768 then
        2

    else if w <= 1024 then
        3

    else if w <= 1280 then
        4

    else if w <= 1536 then
        5

    else
        6


viewHotActions : Model -> Html Msg
viewHotActions model =
    section [ class "list-wrapper", ariaLabelledby "hot-actions-heading" ]
        [ header [ class "flex justify-between mb-7" ]
            [ h2 [ class "text-[2.625rem] font-medium", id "hot-actions-heading" ] [ text "Hot auctions" ]
            , button [ class "list-wrapper__header__btm flex items-center gap-3" ] [ strong [] [ text "View all" ], gaslur SVG.Arrow ]
            ]
        , hotActionsListContent (numberOfItems model)
            |> ul
                [ class "list-wrapper__list"
                , attribute "style" <| "--number-of-col:" ++ String.fromInt (numberOfItems model)
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
                , p [ class "item__end-date" ] [ text "Ends in ", Html.time [ HtmlAttr.datetime <| transformDate endDate ] [ text endDate ] ]
                , button [ class "item__btm font-semibold ml-auto" ] [ text "Bid" ]
                ]
        )
        (sliceItems nItens listContent)


viewGettingStarted : Html Msg
viewGettingStarted =
    section [ class "getting-started grid gap-12 my-52", ariaLabelledby "getting-started-heading" ]
        [ header []
            [ h3 [ class "mb-5 text-center text-4xl font-medium", id "getting-started-heading" ] [ text "Getting started" ]
            , p [ class "text-center text-xl font-medium" ] [ text "Eu, molestie commodo, enim pellentesque turpis integer sagittis" ]
            ]
        , List.map
            (\( icon, txt ) ->
                li [ class "item" ]
                    [ div [ class "item__icon" ] [ icon ]
                    , p [ class "item__text" ] [ text txt ]
                    ]
            )
            [ ( gaslur SVG.Shield, "Connect your wallet" )
            , ( gaslur SVG.Archive, "Posuere urna, sit amet molestie leo" )
            , ( gaslur SVG.Gallery, "Semper pretium libero sed quam ac integer ut" )
            , ( gaslur SVG.Rocket, "Lectus volutpat magna vitae in arcu" )
            ]
            |> ul [ class "flex justify-around items-start flex-wrap gap-6" ]
        ]


viewDiscover : Model -> Html Msg
viewDiscover model =
    section [ class "list-wrapper grid gap-9", ariaLabelledby "hot-actions-heading" ]
        [ header [ class "flex justify-between" ]
            [ h2 [ class "text-[2.625rem] font-medium", id "hot-actions-heading" ] [ text "Discover" ]
            , div [ class "hidden lg:flex items-center gap-3" ]
                [ button [ class "list-wrapper__header__btms" ] [ gaslur SVG.ListToTop, text "Category" ]
                , button [ class "list-wrapper__header__btms" ] [ text "Cheapest", gaslur SVG.SimpleArrow ]
                , button [ class "list-wrapper__header__btms" ] [ text "Newest", gaslur SVG.SimpleArrow ]
                , button [ class "list-wrapper__header__btms" ] [ gaslur SVG.Filter, text "Filter" ]
                ]
            ]
        , hotActionsListContent (numberOfItems model)
            |> ul
                [ class "list-wrapper__list"
                , attribute "style" <| "--number-of-col:" ++ String.fromInt (numberOfItems model)
                ]
        , hotActionsListContent (numberOfItems model)
            |> ul
                [ class "list-wrapper__list"
                , attribute "style" <| "--number-of-col:" ++ String.fromInt (numberOfItems model)
                ]
        , button [ class "list-wrapper__btm" ] [ textToUpper "Load more" ]
        ]


viewFooter : Html Msg
viewFooter =
    let
        headingCompose : String -> String
        headingCompose title =
            "foot-heading--" ++ title

        ulCompose l =
            ul [ class "sect__list" ] l

        liCompose i =
            li [ class "" ] i

        listItens =
            [ ( "Marketplace", ulCompose marketplace )
            , ( "Company", ulCompose company )
            , ( "Portfolio", ulCompose contact )
            ]

        marketplace =
            [ liCompose [ text "Home" ]
            , liCompose [ text "Activity" ]
            , liCompose [ text "Discover" ]
            , liCompose [ text "Learn more" ]
            ]

        company =
            [ liCompose [ text "About Us" ]
            , liCompose [ text "Services" ]
            , liCompose [ text "Portfolio" ]
            ]

        contact =
            [ liCompose [ text "Facebook" ]
            , liCompose [ text "Instagram" ]
            , liCompose [ text "Twitter" ]
            , liCompose [ text "Email" ]
            ]
    in
    footer [ class "footer--gaslur" ] <|
        [ h4 [ class "footer--gaslur__title" ] [ text "Etiam et id tincidunt faucibus mollis a sociis pretium fermentum quis magna faucibus lacus." ]
            :: List.map
                (\( title, content ) ->
                    section [ class "sect", ariaLabelledby <| headingCompose title ]
                        [ header [] [ h5 [ class "sect__title", id <| headingCompose title ] [ text title ] ]
                        , content
                        ]
                )
                listItens
            |> div [ class "footer--gaslur__header" ]
        , div [ class "flex justify-between" ]
            [ div [ class "flex items-center gap-4" ] [ gaslur SVG.Instagram, gaslur SVG.Facebook, gaslur SVG.Twitter ]
            , small [ class "font-light text-xl text-[#828282]" ] [ text "Copyright 2021 Gaslur" ]
            ]
        ]

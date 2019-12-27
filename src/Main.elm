module Main exposing (main)

import Browser
import Html exposing (Html, a, button, div, form, h2, input, label, nav, p, span, text)
import Html.Attributes exposing (class, for, id, placeholder, type_)
import Html.Events exposing (onClick)



-- MODEL


type alias Model =
    {}


initialModel : Model
initialModel =
    {}



-- MSG


type Msg
    = Nothing



-- UPDATE


update : Msg -> Model -> Model
update msg model =
    case msg of
        Nothing ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "flex flex-wrap" ]
        [ header
        , div [ class "w-1/3" ]
            [ iShippedForm
            ]
        , div [ class "w-2/3" ]
            [ text "To-Do"
            ]
        ]


header : Html Msg
header =
    nav [ class "flex items-center justify-between flex-wrap bg-teal-500 p-6 w-full" ]
        [ div [ class "flex items-center flex-shrink-0 text-white mr-6" ]
            [ span [ class "font-semibold text-xl tracking-tight" ] [ text "ShipEveryDay" ]
            ]
        , div [ class "block lg:hidden" ]
            [ button [ class "flex items-center px-3 py-2 border rounded text-teal-200 border-teal-400 hover:text-white hover:border-white" ] [ text "Menu" ]
            ]
        , div [ class "w-full block flex-grow lg:flex lg:items-center lg:w-auto" ]
            [ div [ class "text-sm lg:flex-grow" ]
                [ a [ class "block mt-4 lg:inline-block lg:mt-0 text-teal-200 hover:text-white mr-4" ] [ text "Profile" ]
                , a [ class "block mt-4 lg:inline-block lg:mt-0 text-teal-200 hover:text-white mr-4" ] [ text "My Feed" ]
                , a [ class "block mt-4 lg:inline-block lg:mt-0 text-teal-200 hover:text-white mr-4" ] [ text "Contact Us" ]
                ]
            , div []
                [ a [ class "inline-block text-sm px-4 py-2 leading-none border rounded text-white border-white hover:border-transparent hover:text-teal-500 hover:bg-white mt-4 lg:mt-0" ] [ text "Sign Up" ]
                ]
            ]
        ]


iShippedForm : Html Msg
iShippedForm =
    form [ class "w-full max-w-lg my-6" ]
        [ div [ class "flex flex-wrap mx-3 mb-6" ]
            [ createFormField "First Name" "John" "grid-first-name" HalfWidth
            , createFormField "Last Name" "Doe" "grid-last-name" HalfWidth
            ]
        , div [ class "flex flex-wrap mx-3 mb-6" ]
            [ createFormField "Info" "What did you ship today?" "grid-ship-info" FullWidth
            , createFormField "URL" "Link to your stuff!" "grid-ship-url" FullWidth
            ]
        , div [ class "flex flex-wrap mx-6 mb-6" ]
            [ createSignUpButton
            ]
        ]


type Width
    = FullWidth
    | HalfWidth



-- Params:
-- label - the value that will go in the label
-- placeholderValue - the value that will go in the placeholder
-- forValue - the id and for tag of the input
-- widthType - size of the input


createFormField : String -> String -> String -> Width -> Html Msg
createFormField fieldName placeholderName forValue widthType =
    let
        width =
            case widthType of
                FullWidth ->
                    "w-full "

                HalfWidth ->
                    "w-full md:w-1/2 "
    in
    div [ class <| width ++ "px-3" ]
        [ label [ class "block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2", for forValue ] [ text fieldName ]
        , input [ class "appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500", id forValue, type_ "text", placeholder placeholderName ] []
        ]


createSignUpButton : Html Msg
createSignUpButton =
    div [ class "md:w-2/3" ]
        [ button [ class "shadow bg-purple-500 hover:bg-purple-400 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-4 rounded", type_ "button" ] [ text "Submit" ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

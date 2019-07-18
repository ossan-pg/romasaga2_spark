module SparkFromCharaTest exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import SparkFromChara exposing (..)
import Test exposing (..)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (classes, tag, text)


suite : Test
suite =
    describe "The SparkFromChara module"
        [ describe "view"
            -- 剣
            [ test "剣の技が表示対象の場合、剣ボタンに selected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "剣" "selected" <|
                        { unselectedAllWeaponTypes | sword = True }
            , test "剣の技が表示対象外の場合、剣ボタンに unselected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "剣" "unselected" <|
                        { selectedAllWeaponTypes | sword = False }
            , test "剣ボタンがクリックされると ChangeWeaponType Sword メッセージを送信される" <|
                \_ ->
                    verifyButtonClick Sword 0

            -- 大剣
            , test "大剣の技が表示対象の場合、大剣ボタンに selected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "大剣" "selected" <|
                        { unselectedAllWeaponTypes | greatSword = True }
            , test "大剣の技が表示対象外の場合、大剣ボタンに unselected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "大剣" "unselected" <|
                        { selectedAllWeaponTypes | greatSword = False }
            , test "大剣ボタンがクリックされると ChangeWeaponType GreatSword メッセージを送信される" <|
                \_ ->
                    verifyButtonClick GreatSword 1

            -- 斧
            , test "斧の技が表示対象の場合、斧ボタンに selected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "斧" "selected" <|
                        { unselectedAllWeaponTypes | axe = True }
            , test "斧の技が表示対象外の場合、斧ボタンに unselected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "斧" "unselected" <|
                        { selectedAllWeaponTypes | axe = False }
            , test "斧ボタンがクリックされると ChangeWeaponType Axe メッセージを送信される" <|
                \_ ->
                    verifyButtonClick Axe 2

            -- 棍棒
            , test "棍棒の技が表示対象の場合、棍棒ボタンに selected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "棍棒" "selected" <|
                        { unselectedAllWeaponTypes | mace = True }
            , test "棍棒の技が表示対象外の場合、棍棒ボタンに unselected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "棍棒" "unselected" <|
                        { selectedAllWeaponTypes | mace = False }
            , test "棍棒ボタンがクリックされると ChangeWeaponType Mace メッセージを送信される" <|
                \_ ->
                    verifyButtonClick Mace 3

            -- 槍
            , test "槍の技が表示対象の場合、槍ボタンに selected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "槍" "selected" <|
                        { unselectedAllWeaponTypes | spear = True }
            , test "槍の技が表示対象外の場合、槍ボタンに unselected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "槍" "unselected" <|
                        { selectedAllWeaponTypes | spear = False }
            , test "槍ボタンがクリックされると ChangeWeaponType Spear メッセージを送信される" <|
                \_ ->
                    verifyButtonClick Spear 4

            -- 小剣
            , test "小剣の技が表示対象の場合、小剣ボタンに selected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "小剣" "selected" <|
                        { unselectedAllWeaponTypes | shortSword = True }
            , test "小剣の技が表示対象外の場合、小剣ボタンに unselected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "小剣" "unselected" <|
                        { selectedAllWeaponTypes | shortSword = False }
            , test "小剣ボタンがクリックされると ChangeWeaponType ShortSword メッセージを送信される" <|
                \_ ->
                    verifyButtonClick ShortSword 5

            -- 弓
            , test "弓の技が表示対象の場合、弓ボタンに selected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "弓" "selected" <|
                        { unselectedAllWeaponTypes | bow = True }
            , test "弓の技が表示対象外の場合、弓ボタンに unselected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "弓" "unselected" <|
                        { selectedAllWeaponTypes | bow = False }
            , test "弓ボタンがクリックされると ChangeWeaponType Bow メッセージを送信される" <|
                \_ ->
                    verifyButtonClick Bow 6

            -- 体術
            , test "体術の技が表示対象の場合、体術ボタンに selected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "体術" "selected" <|
                        { unselectedAllWeaponTypes | martialSkill = True }
            , test "体術の技が表示対象外の場合、体術ボタンに unselected クラスを設定する" <|
                \_ ->
                    verifyClassOfButton "体術" "unselected" <|
                        { selectedAllWeaponTypes | martialSkill = False }
            , test "体術ボタンがクリックされると ChangeWeaponType MartialSkill メッセージを送信される" <|
                \_ ->
                    verifyButtonClick MartialSkill 7
            ]
        ]


unselectedAllWeaponTypes : SelectedWeaponTypes
unselectedAllWeaponTypes =
    { sword = False
    , greatSword = False
    , axe = False
    , mace = False
    , spear = False
    , shortSword = False
    , bow = False
    , martialSkill = False
    }


selectedAllWeaponTypes : SelectedWeaponTypes
selectedAllWeaponTypes =
    { sword = True
    , greatSword = True
    , axe = True
    , mace = True
    , spear = True
    , shortSword = True
    , bow = True
    , martialSkill = True
    }


verifyClassOfButton : String -> String -> SelectedWeaponTypes -> Expectation
verifyClassOfButton weaponType className selectedWeaponTypes =
    Model selectedWeaponTypes
        |> view
        |> Query.fromHtml
        |> Query.find [ classes [ "weapon-type-filter" ] ]
        |> Query.find [ tag "button", classes [ className ] ]
        |> Query.has [ text weaponType ]


verifyButtonClick : WeaponType -> Int -> Expectation
verifyButtonClick weaponType index_ =
    Model unselectedAllWeaponTypes
        |> view
        |> Query.fromHtml
        |> Query.find [ classes [ "weapon-type-filter" ] ]
        |> Query.findAll [ tag "button" ]
        |> Query.index index_
        |> Event.simulate Event.click
        |> Event.expect (ChangeWeaponType weaponType)

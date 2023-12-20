//
//  Data.swift
//  CollectionViewProject
//
//  Created by Vadym Oliinyk on 04.12.2023.
//

import UIKit

struct Info: Equatable  {
    let name: String
    let image: UIImage!
}

let categories: [Info] = [
    Info(name: "Vegetables",    image: UIImage(named: "Vegetables")),
    Info(name: "Fruits",        image: UIImage(named: "Fruits")),
    Info(name: "Alchohol",      image: UIImage(named: "Alchohol")),
    Info(name: "Bakery",        image: UIImage(named: "Bakery")),
    Info(name: "FastFood",      image: UIImage(named: "FastFood"))
]

let vegetables: [Info] = [
    Info(name: "Carrot",        image: UIImage(named: "Carrot")),
    Info(name: "Broccoli",      image: UIImage(named: "Broccoli")),
    Info(name: "Tomato",        image: UIImage(named: "Tomato")),
    Info(name: "Cucumber",      image: UIImage(named: "Cucumber")),
    Info(name: "Spinach",       image: UIImage(named: "Spinach")),
    Info(name: "Bell pepper",   image: UIImage(named: "Bell Pepper")),
    Info(name: "Cabbage",       image: UIImage(named: "Cabbage")),
    Info(name: "Potato",        image: UIImage(named: "Potato")),
    Info(name: "Onion",         image: UIImage(named: "Onion")),
    Info(name: "Garlic",        image: UIImage(named: "Garlic")),
    Info(name: "Cauliflower",   image: UIImage(named: "Cauliflower")),
    Info(name: "Eggplant",      image: UIImage(named: "Eggplant")),
    Info(name: "Mushroom",      image: UIImage(named: "Mushroom")),
    Info(name: "Peas",          image: UIImage(named: "Peas")),
    Info(name: "Corn",          image: UIImage(named: "Corn")),
    Info(name: "Pumpkin",       image: UIImage(named: "Pumpkin")),
    Info(name: "Radish",        image: UIImage(named: "Radish")),
    Info(name: "Beet",          image: UIImage(named: "Beet"))
]

let fruits: [Info] = [
    Info(name: "Apple",         image: UIImage(named: "Apple")),
    Info(name: "Banana",        image: UIImage(named: "Banana")),
    Info(name: "Orange",        image: UIImage(named: "Orange")),
    Info(name: "Strawberry",    image: UIImage(named: "Strawberry")),
    Info(name: "Grapes",        image: UIImage(named: "Grapes")),
    Info(name: "Watermelon",    image: UIImage(named: "Watermelon")),
    Info(name: "Pineapple",     image: UIImage(named: "Pineapple")),
    Info(name: "Mango",         image: UIImage(named: "Mango")),
    Info(name: "Kiwi",          image: UIImage(named: "Kiwi")),
    Info(name: "Peach",         image: UIImage(named: "Peach")),
    Info(name: "Blueberry",     image: UIImage(named: "Blueberry")),
    Info(name: "Raspberry",     image: UIImage(named: "Raspberry")),
    Info(name: "Grapefruit",    image: UIImage(named: "Grapefruit")),
    Info(name: "Melon",         image: UIImage(named: "Melon")),
    Info(name: "Plum",          image: UIImage(named: "Plum")),
    Info(name: "Blackberry",    image: UIImage(named: "Blackberry")),
    Info(name: "Papaya",        image: UIImage(named: "Papaya")),
    Info(name: "Apricot",       image: UIImage(named: "Apricot"))
]

let alcoholicDrinks: [Info] = [
    Info(name: "Whiskey",       image: UIImage(named: "Whiskey")),
    Info(name: "Rum",           image: UIImage(named: "Rum")),
    Info(name: "Vodka",         image: UIImage(named: "Vodka")),
    Info(name: "Tequila",       image: UIImage(named: "Tequila")),
    Info(name: "Cognac",        image: UIImage(named: "Cognac")),
    Info(name: "Gin",           image: UIImage(named: "Gin")),
    Info(name: "Vermouth",      image: UIImage(named: "Vermouth")),
    Info(name: "Champagne",     image: UIImage(named: "Champagne")),
    Info(name: "Wine",          image: UIImage(named: "Wine")),
    Info(name: "Beer",          image: UIImage(named: "Beer")),
    Info(name: "Martini",       image: UIImage(named: "Martini")),
    Info(name: "Scotch",        image: UIImage(named: "Scotch")),
    Info(name: "Cider",         image: UIImage(named: "Cider")),
    Info(name: "Sake",          image: UIImage(named: "Sake")),
    Info(name: "Mojito",        image: UIImage(named: "Mojito")),
    Info(name: "Absinthe",      image: UIImage(named: "Absinthe")),
    Info(name: "Brandy",        image: UIImage(named: "Brandy")),
    Info(name: "Bloody mary",   image: UIImage(named: "Bloody Mary"))

]
let bakeryItems: [Info] = [
    Info(name: "Croissant",     image: UIImage(named: "Croissant")),
    Info(name: "Baguette",      image: UIImage(named: "Baguette")),
    Info(name: "Pretzel",       image: UIImage(named: "Pretzel")),
    Info(name: "Cinnamon roll", image: UIImage(named: "Cinnamon Roll")),
    Info(name: "Donut",         image: UIImage(named: "Donut")),
    Info(name: "Muffin",        image: UIImage(named: "Muffin")),
    Info(name: "Eclair",        image: UIImage(named: "Eclair")),
    Info(name: "Cheesecake",    image: UIImage(named: "Cheesecake")),
    Info(name: "Apple pie",     image: UIImage(named: "Apple Pie")),
    Info(name: "Scone",         image: UIImage(named: "Scone")),
    Info(name: "Biscotti",      image: UIImage(named: "Biscotti")),
    Info(name: "Brioche",       image: UIImage(named: "Brioche")),
    Info(name: "Danish pastry", image: UIImage(named: "Danish Pastry")),
    Info(name: "Pound cake",    image: UIImage(named: "Pound Cake")),
    Info(name: "Cupcake",       image: UIImage(named: "Cupcake")),
    Info(name: "Chocolate cake",image: UIImage(named: "Chocolate Cake")),
    Info(name: "Cookie",        image: UIImage(named: "Cookie")),
    Info(name: "Sandwich",      image: UIImage(named: "Sandwich"))
    ]

let fastFoodItems: [Info] = [
    Info(name: "Burger",          image: UIImage(named: "burger")),
    Info(name: "Pizza",           image: UIImage(named: "pizza")),
    Info(name: "Hot-dog",         image: UIImage(named: "hotDog")),
    Info(name: "French fries",    image: UIImage(named: "fries")),
    Info(name: "Taco",            image: UIImage(named: "taco")),
    Info(name: "Тoodles",         image: UIImage(named: "noodles")),
    Info(name: "CheeseBurger",    image: UIImage(named: "CheeseBurger")),
    Info(name: "Chicken roll",    image: UIImage(named: "ChickenRoll")),
    Info(name: "Sandwich",        image: UIImage(named: "sandwich")),
    Info(name: "Зanini",          image: UIImage(named: "panini")),
    Info(name: "Shawarma",        image: UIImage(named: "shawarma")),
    Info(name: "Sandwich royale", image: UIImage(named: "sandwichRoyale")),
    Info(name: "Fried-chicken",   image: UIImage(named: "fried-chicken")),
    Info(name: "French fries 2",  image: UIImage(named: "village-stylepotatoes")),
    Info(name: "4 cheese pizza",  image: UIImage(named: "4cheesepizza")),
    Info(name: "Сarbonara",       image: UIImage(named: "carbonara")),
    Info(name: "Сheese balls",    image: UIImage(named: "Сheeseballs")),
    Info(name: "Fried fish",      image: UIImage(named: "Friedfish")),

]




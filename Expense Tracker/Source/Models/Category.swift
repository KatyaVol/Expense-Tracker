//
//  structureModel.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 10.05.2023.
//

import UIKit

struct Category {
    let image: UIImage?
    let text: String?
    
    static func makeCategory() -> [Category] {
        var categories: [Category] = []
        
        let foodCategory = Category(image: UIImage(named: "icon_food"),
                                    text:  LocalizedStrings.foodCategory)
        let homeCategory = Category(image: UIImage(named: "icon_home"),
                                    text: LocalizedStrings.homeCategory)
        let transportCategory = Category(image: UIImage(named: "icon_transport"),
                                         text: LocalizedStrings.transportCategory)
        let clothesCategory = Category(image: UIImage(named: "icon_clothes"),
                                       text: LocalizedStrings.clothesCategory)
        let healthCategory = Category(image: UIImage(named: "icon_health"),
                                      text: LocalizedStrings.healthCategory)
        let educationCategory = Category(image: UIImage(named: "icon_education"),
                                         text: LocalizedStrings.educationCategory)
        let happyTimeCategory = Category(image: UIImage(named: "icon_happytime"),
                                         text: LocalizedStrings.leisureCategory)
        let travelCategory = Category(image: UIImage(named: "icon_travel"),
                                      text: LocalizedStrings.travelCategory)
        let giftsCategory = Category(image: UIImage(named: "icon_gifts"),
                                     text: LocalizedStrings.giftsCategory)
        let lifeCategory = Category(image: UIImage(named: "icon_life"),
                                    text: LocalizedStrings.lifeCategory)
        let savingsCategory = Category(image: UIImage(named: "icon_savings"),
                                       text: LocalizedStrings.savingsCategory)
        let incomeCategory =   Category(image: UIImage(named: "icon_income"),
                                        text: LocalizedStrings.incomeCategory)
        let petsCategory = Category(image: UIImage(named: "icon_pets"),
                                    text: LocalizedStrings.petsCategory)
        let childrenCategory = Category(image: UIImage(named: "icon_children"),
                                    text: LocalizedStrings.childrenCategory)
        let othersCategory = Category(image: UIImage(named: "icon_others"),
                                      text:  LocalizedStrings.othersCategory)
        
        let arrayOfCategory = [foodCategory,
                               homeCategory,
                               transportCategory,
                               clothesCategory,
                               healthCategory,
                               educationCategory,
                               happyTimeCategory,
                               travelCategory,
                               giftsCategory,
                               lifeCategory,
                               savingsCategory,
                               incomeCategory,
                               petsCategory,
                               childrenCategory,
                               othersCategory]
        
        categories.append(contentsOf: arrayOfCategory)
        return categories
    }
}

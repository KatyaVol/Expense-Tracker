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
        return [
            Category(image: UIImage(named: "icon_food"),
                     text:  LocalizedStrings.foodCategory),
            Category(image: UIImage(named: "icon_home"),
                     text: LocalizedStrings.homeCategory),
            Category(image: UIImage(named: "icon_transport"),
                     text: LocalizedStrings.transportCategory),
            Category(image: UIImage(named: "icon_clothes"),
                     text: LocalizedStrings.clothesCategory),
            Category(image: UIImage(named: "icon_health"),
                     text: LocalizedStrings.healthCategory),
            Category(image: UIImage(named: "icon_education"),
                     text: LocalizedStrings.educationCategory),
            Category(image: UIImage(named: "icon_happytime"),
                     text: LocalizedStrings.leisureCategory),
            Category(image: UIImage(named: "icon_travel"),
                     text: LocalizedStrings.travelCategory),
            Category(image: UIImage(named: "icon_gifts"),
                     text: LocalizedStrings.giftsCategory),
            Category(image: UIImage(named: "icon_life"),
                     text: LocalizedStrings.lifeCategory),
            Category(image: UIImage(named: "icon_savings"),
                     text: LocalizedStrings.savingsCategory),
            Category(image: UIImage(named: "icon_income"),
                     text: LocalizedStrings.incomeCategory),
            Category(image: UIImage(named: "icon_pets"),
                     text: LocalizedStrings.petsCategory),
            Category(image: UIImage(named: "icon_children"),
                     text: LocalizedStrings.childrenCategory),
            Category(image: UIImage(named: "icon_others"),
                     text:  LocalizedStrings.othersCategory)
            ]
        }
    }

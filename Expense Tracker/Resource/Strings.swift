//
//  Strings.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 23.04.2023.
//

import UIKit

enum LocalizedStrings {
    static let welcomeMessage = NSLocalizedString("welcome_message", comment: "Welcome message")
    static let signUpButtonTitle = NSLocalizedString("sign_up", comment: "Sign up button title")
    static let loginButtonTitle = NSLocalizedString("login", comment: "Login button title")
    
    // MARK: - Tabbar
    
    static let report = NSLocalizedString("report", comment: "")
    static let add = NSLocalizedString("add", comment: "")
    static let history = NSLocalizedString("history", comment: "")
    static let settings = NSLocalizedString("settings", comment: "")
    
    // MARK: - AddExpense
    
    static let categoryTitle = NSLocalizedString("category_title", comment: "")
    static let dateTitle = NSLocalizedString("date_title", comment: "")
    static let dateText = NSLocalizedString("date_text", comment: "")
    static let amountTitle = NSLocalizedString("amount_title", comment: "")
    static let amountText = NSLocalizedString("amount_text", comment: "")
    static let noteTitle = NSLocalizedString("note_title", comment: "")
    static let noteText = NSLocalizedString("note_text", comment: "")
    static let income = NSLocalizedString("income", comment: "")
    static let expense = NSLocalizedString("expense", comment: "")
    static let saveEntry = NSLocalizedString("save_entry", comment: "")
    static let categoryName = NSLocalizedString("category_name", comment: "")
    
    // MARK: - Categories
    
    static let categories = NSLocalizedString("categories", comment: "")
    static let chooseCategory = NSLocalizedString("choose_category", comment: "")
    static let foodCategory = NSLocalizedString("food", comment: "")
    static let homeCategory = NSLocalizedString("home", comment: "")
    static let transportCategory = NSLocalizedString("transport", comment: "")
    static let clothesCategory = NSLocalizedString("clothes", comment: "")
    static let healthCategory = NSLocalizedString("health", comment: "")
    static let educationCategory = NSLocalizedString("education", comment: "")
    static let leisureCategory = NSLocalizedString("leisure", comment: "")
    static let travelCategory = NSLocalizedString("travel", comment: "")
    static let giftsCategory = NSLocalizedString("gifts", comment: "")
    static let lifeCategory = NSLocalizedString("life", comment: "")
    static let savingsCategory = NSLocalizedString("savings", comment: "")
    static let othersCategory = NSLocalizedString("others", comment: "")
    static let incomeCategory = NSLocalizedString("income", comment: "")
    static let petsCategory = NSLocalizedString("pets", comment: "")
    static let childrenCategory = NSLocalizedString("children", comment: "")
    
    // MARK: - Calendar
    
    static let chooseButton = NSLocalizedString("choose", comment: "")
    
    // MARK: - Errors
    
    static let chooseDate = NSLocalizedString("choose date", comment: "")
    static let enterTheAmount = NSLocalizedString("enter the amount", comment: "")
    static let alert = NSLocalizedString("alert", comment: "")
    
    // MARK: - HistoryScreen
    
    static let ruble = NSLocalizedString("ruble", comment: "")
}

//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Giventus Marco Victorio Handojo on 03/11/24.
//

import Foundation


class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
}



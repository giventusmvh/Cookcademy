//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Giventus Marco Victorio Handojo on 03/11/24.
//

import SwiftUI

import SwiftUI

struct RecipeDetailView: View {
  let recipe: Recipe
  
  private let listBackgroundColor = AppColor.background
  private let listTextColor = AppColor.foreground
  
  var body: some View {
      NavigationView {
          VStack {
              HStack {
                  Text("Author: \(recipe.mainInformation.author)")
                      .font(.subheadline)
                      .padding()
                  Spacer()
              }
              HStack {
                  Text("Author: \(recipe.mainInformation.description)")
                      .font(.subheadline)
                      .padding()
                  Spacer()
              }
              List {
                  Section(header: Text("Ingredients")) {
                      ForEach(recipe.ingredients.indices, id: \.self) { index in
                          let ingredient = recipe.ingredients[index]
                          Text(ingredient.description)
                              .foregroundColor(listTextColor)
                      }
                  }.listRowBackground(listBackgroundColor)
                  Section(header: Text("Directions")) {
                      ForEach(recipe.directions.indices, id: \.self) { index in
                          let direction = recipe.directions[index]
                          HStack {
                              Text("\(index + 1). ").bold()
                              Text("\(direction.isOptional ? "(Optional) " : "")"
                                   + "\(direction.description)")
                          }.foregroundColor(listTextColor)
                      }
                  }.listRowBackground(listBackgroundColor)
              }
          }
          .navigationTitle(recipe.mainInformation.name)
      }
  }
}

#Preview {
    RecipeDetailView(recipe: Recipe.testRecipes[0])
}

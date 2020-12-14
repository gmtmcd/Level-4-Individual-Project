//
//  SearchBarView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 14/12/2020.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchTerm: String
    @State private var isEditing = false
    
    var body: some View {
        HStack{
            TextField("Search for name or skill type", text: $searchTerm)
                .padding(10)
                .padding(.horizontal, 20)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding(.leading, 6)
                        
                        if isEditing{
                            Button(action: {
                                self.searchTerm = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 6)
                            }
                        }
                    }
                )
                .onTapGesture {
                    self.isEditing = true
                }
            if isEditing{
                Button(action: {
                    self.isEditing = false
                    self.searchTerm = ""
                    // This line dismisses the keyboard after clicking cancel
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchTerm: .constant(""))
    }
}

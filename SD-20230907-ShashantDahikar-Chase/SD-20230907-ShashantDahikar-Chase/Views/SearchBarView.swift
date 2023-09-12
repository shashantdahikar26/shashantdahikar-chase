//
//  SearchBarView.swift
//  SD-20230907-ShashantDahikar-Chase
//
//  Created by Shashant Dahikar on 08/09/23.
//

import SwiftUI

struct SearchBarView: View {
    private struct Constants {
        let cornerRadius = CGFloat(8)
        let padding = CGFloat(12)
        let searchImage = "magnifyingglass"
        let cityTextfieldPlaceholder = "Enter a City"
        let buttonTitle = "Done"
    }
    
    @Binding var text: String
    let onSearchButtonTapped: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: Constants().searchImage)
            TextField(Constants().cityTextfieldPlaceholder,
                      text: $text,
                      onEditingChanged: { _ in
            }, onCommit: {})
            .foregroundColor(.primary)
            Button(action: onSearchButtonTapped) {
                Text(Constants().buttonTitle)
            }.foregroundColor(.blue)
        }
        .padding(EdgeInsets(top: Constants().padding, leading: Constants().padding, bottom: Constants().padding, trailing: Constants().padding))
        .foregroundColor(.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(Constants().cornerRadius)
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    @State static var searchTest: String = "test"
    static var previews: some View {
        SearchBarView(text: $searchTest, onSearchButtonTapped: {})
    }
}


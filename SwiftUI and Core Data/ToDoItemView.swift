//
//  ToDoItemView.swift
//  SwiftUI and Core Data
//
//  Created by Eng Angelo E Saber on 12/19/19.
//  Copyright © 2019 Eng Angelo E Saber. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title : String = ""
    var createdAt : String = ""
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(createdAt)
                    .font(.subheadline)
                
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "Lorem Ipsum is simply dummy text", createdAt: "12 jan 2020")
    }
}

//
//  ContentView.swift
//  SwiftUI and Core Data
//
//  Created by Eng Angelo E Saber on 12/19/19.
//  Copyright © 2019 Eng Angelo E Saber. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @Environment(\.managedObjectContext) var mangedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems : FetchedResults<ToDoItem>
    @State private var newTodoItem = ""
    
    var body: some View {
        NavigationView {
            List {
                     Section(header: Text("To Do List")) {
                        
                         HStack {
                            TextField("Write New Notes", text: self.$newTodoItem)
                             Button(action: {
                                let toDoItem = ToDoItem(context: self.mangedObjectContext)
                                toDoItem.title = self.newTodoItem
                                toDoItem.createdAt = Date()
                                do{
                                    try self.mangedObjectContext.save()
                                }catch{
                                    print(error)
                                }
                                self.newTodoItem = ""
                                
                             }){
                                 Image(systemName: "plus.circle.fill")
                                     .foregroundColor(Color.green)
                                     .imageScale(.large)
                             }
                         }
                     }
                Section(header: Text("You Have to do it") ){
                    ForEach(self.toDoItems) { todoItem in
                        ToDoItemView(title: todoItem.title!, createdAt: "\(todoItem.createdAt!)")
                    }.onDelete{ indexSet in
                        let deleteItem = self.toDoItems[indexSet.first!]
                        self.mangedObjectContext.delete(deleteItem)
                        do {
                            try self.mangedObjectContext.save()
                            
                        }catch{
                            print(error)
                        }
                    }

                }
        
             }
        .navigationBarTitle(Text("To Do List"))
        .navigationBarItems(trailing: EditButton())
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

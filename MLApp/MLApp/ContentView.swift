//
//  ContentView.swift
//  MLApp
//
//  Created by Alejandra Coeto on 07/02/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Sleep journal from \(item.timestamp!, formatter: itemFormatter)")
                            .font(.headline)
                        Text("You described your sleep as: ")
                            .font(.subheadline)
                        Text("The NLP model rated this sleep as a: \(item.emoji!)")
                            .font(.subheadline)
                        Text("You described your sleep as a: \(item.yourEmoji!)")
                            .font(.subheadline)
                       
                    } label: {
                        Text("\(item.emoji!) Sleep journal")
                        Text("\(item.timestamp!, formatter: itemFormatter)")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    NavigationLink {
                        SleepModeView()
                    } label:{
                        Label("Sleep mode", systemImage: "moon.zzz.fill")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink {
                        JournalView()
                    } label:{
                        Label("New ", systemImage: "sun.min.fill")
                    }
                }
            }
            Text("Select an item")
        }
    }
    
   
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

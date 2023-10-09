//
//  JournalView.swift
//  MLApp
//
//  Created by Alejandra Coeto on 12/02/23.
//

import SwiftUI
import CoreData

struct JournalView: View {
    @ObservedObject var identifier = SleepJournal()
    @State private var input = ""
    @State private var emojiToDisplay = "😆"
    @State private var yourEmoji = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack {
            Text(emojiToDisplay)
                .font(.system(size: 60))
                .opacity(self.identifier.confidence + 0.25)
                .scaleEffect(CGFloat(1 + (self.identifier.confidence - 0.5)))
            TextField("How did you sleep overnight?", text: $input, axis: .vertical)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.bottom)
                .onChange(of:input) { _ in
                    self.identifier.predict(input)
                    if self.identifier.prediction == "0" {
                        emojiToDisplay = "😞"
                    } else if self.identifier.prediction == "2" {
                        emojiToDisplay = "🫤"
                    } else {
                        emojiToDisplay = "😃"
                    }
                }
            Text("Choose an emoji to describe your sleep")
            TextField("...", text: $yourEmoji)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.bottom)
            Button("Save") {
                addItem()
            }
            .buttonStyle(.borderedProminent)
        }
    }
    private func addItem(){
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.text = input
            newItem.emoji = emojiToDisplay
            newItem.yourEmoji = yourEmoji
            
            do {
                try viewContext.save()
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}

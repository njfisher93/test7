//
//  ContentView.swift
//  test7
//
//  Created by Nolan on 8/12/21.
//

import SwiftUI

import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [])
    private var quizzes: FetchedResults<Quiz>
    
    var body: some View {
        
        ZStack {
            HStack (spacing: 15) {
                
                // Drop down menu
                Button(action: {

                }, label: {
                    Image(systemName: "arrowtriangle.down.square")
        
                })
                
                Spacer()
                
                // Settings button
                Button(action: {}, label: {
                    Image(systemName: "gearshape")
                })
            
            }
            .padding()
            .foregroundColor(Color(.black))
            
            // Title
            Text("StudyApp")
                .font(.title)
                
        }
        .padding([.leading, .bottom, .trailing])
        .shadow(radius: 5, x: 2.0, y: 3.0)
        
        TabView {
            
            // Profile/Home view
            VStack {
                
                HStack {
                    Text("Full Name")
                        .fontWeight(.light)
                        .font(.system(size: 30))
                    
                    Spacer()
                }
                .padding(.all)
                
                HStack {
                    VStack (alignment: .leading){
                        Text("Student, resident, etc.")
                            .fontWeight(.ultraLight)
                            .font(.system(size: 20))
                        Text("School, workplace, etc.")
                            .fontWeight(.ultraLight)
                            .font(.system(size: 20))
                    }
                    .padding([.leading, .bottom])
                    
                    Spacer()
                }
                
            
                Spacer()
                
            }
            .tabItem{
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
                
            }
            
            // Quiz library list
            VStack {
                NavigationView{
                    List {
                        ForEach(quizzes) { quiz in
                            NavigationLink(destination: QuizDescriptionView(quiz: quiz)){
                                Text(quiz.title ?? "Untitled")
                            }
                            
                        }
                        .onDelete(perform: deleteQuiz)
                        }
                    .navigationTitle("Quiz Library")
                    .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
                    
                  
                    
                }
            }
            .tabItem {
                VStack {
                    Image(systemName: "books.vertical")
                    Text("Library")
                }
            }
            
            // Create Quiz Tab
            AddQuiz()
                .tabItem {
                    VStack {
                        Image(systemName: "plus.circle")
                        Text("Create Quiz")
                    }
                    .foregroundColor(.black)
                }
        }
       
        
    }
    
        private func saveContext() {
            
            // Use the below do/catch for future saving to core data
            
            do{
                try viewContext.save()
            }
            catch {
                let error = error as NSError
                fatalError("Unresolved Error: \(error)")
            }
        }
    
    private func updateQuiz(_ quiz: FetchedResults<Quiz>.Element) {
        withAnimation {
            quiz.title = "TBI"
            saveContext()
        }
    }
    
    private func deleteQuiz(offsets: IndexSet) {
        withAnimation{
            offsets.map { quizzes[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }
        
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

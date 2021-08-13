//
//  QuizCard.swift
//  test7
//
//  Created by Nolan on 8/12/21.
//

import SwiftUI

struct QuizCard: View {
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(height: 200)
            
            HStack {
                Text("Stroke")
                Spacer()
                Text("PM&R")
            }
            .padding()
            .foregroundColor(.white)
        }
        .padding()
        
        
    }
}

struct QuizCard_Previews: PreviewProvider {
    static var previews: some View {
        QuizCard()
    }
}

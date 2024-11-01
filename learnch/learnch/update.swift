//
//  learningPage.swift
//  Learning
//
//  Created by maram  on 20/04/1446 AH.
//

import SwiftUI

struct update: View {
    @State private var learningText: String = ""
    @State private var isButtonPressed: [Bool] = [false, false, false]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("I want to learn")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        
                        ZStack(alignment: .leading) {
                            if learningText.isEmpty {
                                // Placeholder text
                                Text("swift")
                                    .foregroundColor(Color.gray)
                            }
                            TextField("", text: $learningText)
                                .padding(.vertical, 10)
                                .foregroundColor(.white)
                        }
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical)
                    
                    Text("I want to learn it in a")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    HStack(spacing: 10) {
                     
                        Button(action: {
                            toggleButtonState(at: 0)
                        }) {
                            Text("Week")
                                .padding(.horizontal, 15.0)
                                .padding(.vertical, 10.0)
                                .background(isButtonPressed[0] ? Color.orange : Color(.darkGray))
                                .foregroundColor(isButtonPressed[0] ? Color.black : Color.orange)
                                .cornerRadius(10)
                                .font(.title2)
                        }
                        
                       
                        Button(action: {
                            toggleButtonState(at: 1)
                        }) {
                            Text("Month")
                                .padding(.horizontal, 15.0)
                                .padding(.vertical, 10.0)
                                .background(isButtonPressed[1] ? Color.orange : Color(.darkGray))
                                .foregroundColor(isButtonPressed[1] ? Color.black : Color.orange)
                                .cornerRadius(10)
                                .font(.title2)
                        }
                        
                        
                        Button(action: {
                            toggleButtonState(at: 2)
                        }) {
                            Text("Year")
                                .padding(.horizontal, 15.0)
                                .padding(.vertical, 10.0)
                                .background(isButtonPressed[2] ? Color.orange : Color(.darkGray))
                                .foregroundColor(isButtonPressed[2] ? Color.black : Color.orange)
                                .cornerRadius(10)
                                .font(.title2)
                        }
                    }
                    
                    Spacer()
                    
                   
                    VStack {
                        NavigationLink(destination: Homepage()) {
                            Text("Update")
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                                .font(.title2)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 30)
                }
                .padding(30)
            }
        }
    }
    
    private func toggleButtonState(at index: Int) {
        for i in 0..<isButtonPressed.count {
            isButtonPressed[i] = (i == index)
        }
    }
}

struct Homepage: View {
    var body: some View {
        Text("Welcome to the Homepage")
            .font(.largeTitle)
            .foregroundColor(.black)
    }
}

#Preview {
    update()
}

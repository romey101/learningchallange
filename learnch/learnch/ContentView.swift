//
//  learningPage.swift
//  Learning
//
//  Created by maram  on 20/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var learningText: String = ""
    @State private var isButtonPressed: [Bool] = [false, false, false]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    
                    VStack {
                        Text("🔥")
                            .font(Font.custom("OpenMoji-Color", size: 60))
                            .padding(40)
                            .background(Circle().fill(.gray.opacity(0.3)))
                    }
                    .frame(maxWidth: .infinity)
                    
                  
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Hello Learner!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .accessibilityAddTraits([.isHeader])
                            .accessibilityLabel("Label")
                        
                        Text("This app will help you learn everyday")
                            .foregroundColor(Color.gray)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("I want to learn")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            ZStack(alignment: .leading) {
                                if learningText.isEmpty {
                                   
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
                        
                       
                        HStack {
                          
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
                        
                     
                        VStack {
                            NavigationLink(destination: homepage()) {
                                Text("Start →")
                                    .padding(.horizontal, 45.0)
                                    .padding(.vertical, 15.0)
                                    .background(Color.orange)
                                    .foregroundColor(Color.black)
                                    .cornerRadius(10)
                                    .font(.title2)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        .padding(.top, 30)
                    }
                    .padding(30)
                    
                    Spacer()
                }
            }
        }
    }
    
   
    private func toggleButtonState(at index: Int) {
        for i in 0..<isButtonPressed.count {
            isButtonPressed[i] = (i == index)
        }
    }
}

#Preview {
    ContentView()
}

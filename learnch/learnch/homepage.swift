//
//  learningPage.swift
//  Learning
//
//  Created by maram  on 20/04/1446 AH.
//

import SwiftUI

struct homepage: View {
    
    @State private var freezeDaysUsed = 0
    @State private var maxFreezeDays = 6
    @State private var streakDays = 0
    @State private var currentMonth = Date()
    @State private var selectedDate = Date()
    @State private var frozenDate: Date?
    @State private var isFreezeButtonDisabled = false
    @State private var isDayFreezed = false
    @State private var isDayLearned = false
    let customBrown = Color(red: 66/255, green: 40/255, blue: 0/255)
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                HStack {
                    Text(fullCurrentDate())
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
                
                HStack {
                    Text("Learning ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        // Navigate to the update page
                    }) {
                        NavigationLink(destination: update()) {
                            Text("🔥")
                                .font(.system(size: 40))
                                .background(Circle().fill(Color.gray.opacity(0.2)).frame(width: 50, height: 50))
                        }
                    }
                }
                .padding(.horizontal)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(height: 200)
                    
                    VStack(spacing: 12) {
                        HStack {
                            Button(action: {
                                changeMonth(by: -1)
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.orange)
                            }
                            .padding(.leading)
                            
                            Text(currentMonthAndYear())
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Button(action: {
                                changeMonth(by: 1)
                            }) {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.orange)
                            }
                            .padding(.trailing)
                            
                            Spacer()
                            
                            Button(action: {
                                changeWeek(by: -1)
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.orange)
                            }
                            
                            Button(action: {
                                changeWeek(by: 1)
                            }) {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.orange)
                            }
                            .padding(.trailing)
                        }
                        
                        HStack(spacing: 10) {
                            ForEach(0..<7, id: \.self) { offset in
                                let date = Calendar.current.date(byAdding: .day, value: offset, to: startOfWeek())!
                                VStack(spacing: 0) {
                                    Text(fullDayOfWeek(for: date))
                                        .font(.subheadline)
                                        .foregroundColor(isToday(date: date) ? .white : .gray)
                                        .frame(height: 30)
                                    Text(dayOfMonth(for: date))
                                        .font(.title3)
                                        .foregroundColor(isFrozen(date: date) ? .blue : (isToday(date: date) ? .orange : .white))
                                        .frame(height: 30)
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                        
                        Divider().background(Color.gray)
                        HStack {
                            VStack {
                                Text("\(streakDays)🔥")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                Text("Day streak")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            Divider()
                                .frame(height: 50)
                                .background(Color.gray)
                            
                            Spacer()
                            
                            VStack {
                                Text("\(freezeDaysUsed)🧊")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                Text("Day freezed")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                }
                .padding(.horizontal)
                
                Spacer().frame(height: 115)
                
                // Toggle action to log or unlog
                Button(action: {
                    if isDayLearned {
                        isDayLearned = false
                        streakDays -= 1
                    } else {
                        isDayLearned = true
                        streakDays += 1
                    }
                }) {
                    Text(isDayLearned ? "Unlog today" : "Log today as learned")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding()
                        .background(Circle().fill(isDayLearned ? customBrown : .orange).frame(width: 300, height: 300))
                }
                
                Spacer().frame(height: 110)
                
                // Toggle action to freeze or unfreeze
                Button(action: {
                    if isDayFreezed {
                        isDayFreezed = false
                        freezeDaysUsed -= 1
                        frozenDate = nil
                    } else {
                        isDayFreezed = true
                        freezeDaysUsed += 1
                        frozenDate = selectedDate
                    }
                }) {
                    Text(isDayFreezed ? "Unfreeze Day" : "Freeze Day")
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(isFreezeButtonDisabled ? .gray : .blue))
                        .frame(width: 200, height: 50)
                }
                .disabled(isFreezeButtonDisabled && !isDayFreezed)
                
                Text("\(freezeDaysUsed) out of \(maxFreezeDays) freezes used")
                    .font(.footnote)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Learning ")
        }
    }
    
    func fullCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM"
        return formatter.string(from: Date())
    }
    
    func currentMonthAndYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: currentMonth)
    }
    
    func startOfWeek() -> Date {
        let calendar = Calendar.current
        let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: selectedDate)?.start
        return startOfWeek ?? Date()
    }
    
    func fullDayOfWeek(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: date)
    }
    
    func dayOfMonth(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
    
    func isToday(date: Date) -> Bool {
        Calendar.current.isDateInToday(date)
    }
    
    func isFrozen(date: Date) -> Bool {
        guard let frozenDate = frozenDate else { return false }
        return Calendar.current.isDate(date, inSameDayAs: frozenDate)
    }
    
    func changeMonth(by value: Int) {
        if let newDate = Calendar.current.date(byAdding: .month, value: value, to: currentMonth) {
            currentMonth = newDate
            isFreezeButtonDisabled = false
        }
    }
    
    func changeWeek(by value: Int) {
        if let newDate = Calendar.current.date(byAdding: .weekOfYear, value: value, to: selectedDate) {
            selectedDate = newDate
        }
    }
}

#Preview {
    homepage()
}

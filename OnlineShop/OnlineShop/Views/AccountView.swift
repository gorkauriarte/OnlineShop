//
//  AccountView.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct AccountView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthday = Date()
    @State private var isVIPCustomer = false
    @State private var receiveEmails = false
    
    @AppStorage("storedFirstName") private var storedFirstName: String = ""
    @AppStorage("storedLastName") private var storedLastName: String = ""
    @AppStorage("storedEmail") private var storedEmail: String = ""
    @AppStorage("storedBirthday") private var storedBirthday: String = ""
    @AppStorage("storedIsVIPCustomer") private var storedIsVIPCustomer: Bool = false
    @AppStorage("storedReceiveEmails") private var storedReceiveEmails: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Account")
                    .font(.largeTitle)
                Image(systemName: "smiley")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            Form {
                Section(header: Text("PERSONAL INFO")) {
                    TextField("First Name", text: $firstName)
                        .onAppear { firstName = storedFirstName }
                    TextField("Last Name", text: $lastName)
                        .onAppear { lastName = storedLastName }
                    TextField("Email", text: $email)
                        .onAppear { email = storedEmail }
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                        .onAppear {
                            if let storedDate = DateFormatter.storedDateFormatter.date(from: storedBirthday) {
                                birthday = storedDate
                            }
                        }
                }
                
                Section(header: Text("SETTINGS")) {
                    Toggle("VIP Customer", isOn: $isVIPCustomer)
                        .onAppear { isVIPCustomer = storedIsVIPCustomer }
                    Toggle("Receive Emails with Offers", isOn: $receiveEmails)
                        .onAppear { receiveEmails = storedReceiveEmails }
                }
            }
            
            Button(action: {
                saveChanges()
            }) {
                Text("Save Changes")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func saveChanges() {
        storedFirstName = firstName
        storedLastName = lastName
        storedEmail = email
        storedBirthday = DateFormatter.storedDateFormatter.string(from: birthday)
        storedIsVIPCustomer = isVIPCustomer
        storedReceiveEmails = receiveEmails
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}


extension DateFormatter {
    static let storedDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}

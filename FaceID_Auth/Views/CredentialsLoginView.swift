//
//  CredentialsLoginView.swift
//  FaceID_Auth
//
//  Created by Stanley Pan on 2021/12/21.
//

import SwiftUI

struct CredentialsLoginView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 40) {
            Title()
            
            TextField("Username", text: $username)
            
            SecureField("Password", text: $password)
            
            PrimaryButton(showImage: false, text: "Login")
                .onTapGesture {
                    authenticationManager.authenticateWithCredentials(username: username, password: password)
                }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct CredentialsLoginView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsLoginView()
            .environmentObject(AuthenticationManager())
    }
}

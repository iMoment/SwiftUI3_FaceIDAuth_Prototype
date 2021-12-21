//
//  LoginView.swift
//  FaceID_Auth
//
//  Created by Stanley Pan on 2021/12/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: 40) {
            Title()
            
            PrimaryButton(image: "faceid", text: "Login with FaceID")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

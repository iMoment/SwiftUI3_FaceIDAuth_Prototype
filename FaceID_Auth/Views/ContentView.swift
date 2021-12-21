//
//  ContentView.swift
//  FaceID_Auth
//
//  Created by Stanley Pan on 2021/12/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authenticationManager = AuthenticationManager()
    
    var body: some View {
        VStack {
            LoginView()
                .environmentObject(authenticationManager)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  AuthenticationManager.swift
//  FaceID_Auth
//
//  Created by Stanley Pan on 2021/12/21.
//

import Foundation
import LocalAuthentication

class AuthenticationManager: ObservableObject {
    @Published private(set) var biometryType: LABiometryType = .none
    @Published private(set) var isAuthenticated = false
    @Published private(set) var errorDescription: String?
    @Published var showAlert = false
    
    private(set) var context = LAContext()
    private(set) var canEvaluatePolicy = false
    
    init() {
        getBiometryType()
    }
    
    func getBiometryType() {
        canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
    }
    
    func authenticateWithBiometrics() async {
        context = LAContext()
        
        if canEvaluatePolicy {
            let localizedReason = "Log into your account"
            
            do {
                let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: localizedReason)
                
                if success {
                    // Cannot publish changes on background thread
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                        print("isAuthenticated", self.isAuthenticated)
                    }
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errorDescription = error.localizedDescription
                    self.showAlert = true
                    self.biometryType = .none
                }
            }
        }
    }
    
    func authenticateWithCredentials(username: String, password: String) {
        if username.lowercased() == "stanley" && password == "123456" {
            isAuthenticated = true
        } else {
            errorDescription = "Credentials are invalid"
            showAlert = true
        }
    }
    
    func logout() {
        isAuthenticated = false
    }
}

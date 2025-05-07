//
//  Alert.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 07.05.25.
//


import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext {

    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data received from the server was invalid. Please contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again later or contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let requestFailed  = AlertItem(title: Text("Server Error"),
                                            message: Text("The request failed. Please try again later or contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let decodingError  = AlertItem(title: Text("Decode Error"),
                                            message: Text("The received data impossible to decode. Please try again later or contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidURL       = AlertItem(title: Text("Sever Error"),
                                            message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let unknown = AlertItem(title: Text("Server Error"),
                                            message: Text("Something went wrong. Please check your internet connection and try again."),
                                            dismissButton: .default(Text("OK")))
    static let noNewProducts = AlertItem(title: Text("Information"),
                                            message: Text("Seems you reach the end of the list. Please check for new items a bit later."),
                                            dismissButton: .default(Text("OK")))
    
}

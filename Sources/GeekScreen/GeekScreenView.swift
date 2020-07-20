//
//  File.swift
//  
//
//  Created by Mridul Gupta on 20/07/20.
//

import Foundation
import SwiftUI

public struct ContentView: View {
    @available(iOS 13.0.0, *)
    @available(OSX 10.15.0, *)
    public var body: some View {
        Text("Hello World")
    }
    
    public init(){}
}

public struct ContentView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    @available(OSX 10.15.0, *)
    public static var previews: some View {
        ContentView()
    }
}

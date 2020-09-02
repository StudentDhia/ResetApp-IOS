//
//  Env.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 30/11/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//


import UIKit

class Env {
    
    static var iPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}

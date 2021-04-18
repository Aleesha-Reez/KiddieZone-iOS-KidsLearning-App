//
//  KeyChainService.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/10/21.
//

import Foundation
import  KeychainSwift

class keyChainService{
    
    var _locVar = KeychainSwift()
    
    var keyChain : KeychainSwift{
        get {
            return _locVar
        }
        set {
            _locVar = newValue
        }
    }
}


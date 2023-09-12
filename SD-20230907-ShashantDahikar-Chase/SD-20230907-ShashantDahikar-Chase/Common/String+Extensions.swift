//
//  String+Extensions.swift
//  SD-20230907-ShashantDahikar-Chase
//
//  Created by Shashant Dahikar on 11/09/23.
//

import Foundation

extension String {
    func appendDegree() -> String {
        self + "°"
    }
    
    func appendPercentage() -> String {
        self + " %"
    }
    
    func appendMPerSec() -> String {
        self + " m/s"
    }
    
    func appendM() -> String {
        self + " m"
    }
}

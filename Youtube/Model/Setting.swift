//
//  Setting.swift
//  Youtube
//
//  Created by Jersan Balago on 16/09/2018.
//  Copyright © 2018 Jersan Balago. All rights reserved.
//

import UIKit

class Setting: NSObject {
    
    let name: SettingName
    let imageName: String
    
    init(name: SettingName, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
}


enum SettingName: String {
    
    case Settings = "Settings"
    case TermsPrivacy = "Terms & Privacy Policy"
    case SendFeedback = "Send Feedback"
    case Help = "Help"
    case SwitchAccount = "Switch Account"
    case Cancel = "Cancel"
    case Blank = ""
    
}

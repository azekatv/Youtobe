//
//  Video.swift
//  youtobe
//
//  Created by Azamat on 22.11.2021.
//

import UIKit

class Video: NSObject  {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
    
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}

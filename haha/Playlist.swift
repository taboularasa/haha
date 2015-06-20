//
//  Playlist.swift
//  haha
//
//  Created by David on 6/18/15.
//  Copyright (c) 2015 Philosophie LLC. All rights reserved.
//

import Foundation
import UIKit

struct Playlist {
  var title: String?
  var description: String?
  var icon: UIImage?
  var largeIcon: UIImage?
  var artists: [String] = []
  var backgroundColor: UIColor = UIColor.clearColor()
  
  init(index: Int) {
    let musicLibrary = MusicLibrary().library
    let playlistDictionary = musicLibrary[index]
    
    title = playlistDictionary["title"] as? String
    description = playlistDictionary["descripton"] as? String
    
    let iconName = playlistDictionary["icon"] as! String
    icon = UIImage(named: iconName)
    
    let largeIconName = playlistDictionary["largeIcon"] as! String
    largeIcon = UIImage(named: largeIconName)
    
    artists += playlistDictionary["artists"] as! [String]
    
    let colorDictionary = playlistDictionary["backgroundColor"] as! [String: CGFloat]
    backgroundColor = rgbColorFromDictionary(colorDictionary)
  }
  
  func rgbColorFromDictionary(colorDictionary: [String: CGFloat]) -> UIColor {
    let red = colorDictionary["red"]! / 255.0
    let green = colorDictionary["green"]! / 255.0
    let blue = colorDictionary["blue"]! / 255.0
    let alpha = colorDictionary["alpha"]!
    
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
  }
  
}
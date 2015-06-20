//
//  ViewController.swift
//  haha
//
//  Created by David on 6/18/15.
//  Copyright (c) 2015 Philosophie LLC. All rights reserved.
//

import UIKit

class PlaylistMasterViewController: UIViewController {

  var playlistArray: [UIImageView] = []
  
  @IBOutlet weak var playlistImageView0: UIImageView!
  @IBOutlet weak var playlistImageView1: UIImageView!
  @IBOutlet weak var playlistImageView2: UIImageView!
  @IBOutlet weak var playlistImageView3: UIImageView!
  @IBOutlet weak var playlistImageView4: UIImageView!
  @IBOutlet weak var playlistImageView5: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    playlistArray.append(playlistImageView0)
    for index in 0..<playlistArray.count {
      let playlist = Playlist(index: index)
      let playlistImageView = playlistArray[index]
      playlistImageView.image = playlist.icon
      playlistImageView.backgroundColor = playlist.backgroundColor
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showPlaylistDetailSegue" {
      let playlistImageView = sender!.view as! UIImageView
      if let index = find(playlistArray, playlistImageView) {
        let playlistDetailController = segue.destinationViewController as! PlaylistDetailViewController
        playlistDetailController.playlist = Playlist(index: index)
      }
    }
  }
  
  @IBAction func showPlaylistDetail(sender: AnyObject) {
    performSegueWithIdentifier("showPlaylistDetailSegue", sender: sender)
  }
}


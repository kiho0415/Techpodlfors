//
//  ViewController.swift
//  Techpodlfors
//
//  Created by 森田貴帆 on 2020/09/16.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet var table:UITableView!
    var songnameArray = [String]()
    var filenameArray = [String]()
    var imagenameArray = [String]()
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        songnameArray = ["カノン","エリーゼのために","G線上のアリア"]
        filenameArray = ["cannon","elise","aria"]
        imagenameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songnameArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = songnameArray[indexPath.row]
        cell?.imageView?.image = UIImage(named: imagenameArray[indexPath.row])
        return cell!
    }
    //せるが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songnameArray[indexPath.row])が選ばれました")
        let auidioPath = URL(fileURLWithPath: Bundle.main.path(forResource: filenameArray[indexPath.row], ofType: "mp3")!)
        audioPlayer = try? AVAudioPlayer(contentsOf: auidioPath)
        audioPlayer.play()
    }
}


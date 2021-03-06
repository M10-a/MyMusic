//
//  ViewController.swift
//  MyMusic
//
//  Created by 浅野未央 on 2017/05/14.
//  Copyright © 2017年 mio. All rights reserved.
//

import UIKit
//音を扱いやすくするフレームワーク
import AVFoundation


class ViewController: UIViewController {
  let chdir: UIButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view,
    
    UIView.animate(withDuration: 1.0, delay: 0.0, options: .repeat, animations: {
      self.chdir.center.y += 100.0
    }, completion: nil)
    
    UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.0, options: .repeat, animations: {
      self.guitar.center.y += 100.0
      self.guitar.bounds.size.height += 30.0
      self.guitar.bounds.size.width += 30.0
    }) { _ in
      self.guitar.center.y -= 100.0
      self.guitar.bounds.size.height -= 30.0
      self.guitar.bounds.size.width -= 30.0
    
  }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  //シンバルの音源ファイル指定
  let cymbalpath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
  
  //シンバルのプレイヤーインスタンス
  var cymbalPiayer = AVAudioPlayer()
  //Bundle＝格納。変数でも一個しか使ってないとアラートくる
  
  
  @IBAction func cymba(_ sender: Any) {
    //_省略されている
    soundPlayer(&cymbalPiayer, path: cymbalpath, count: 0)
    
 /*   do{
      cymbalPiayer = try AVAudioPlayer(contentsOf: cymbalpath, fileTypeHint: nil)
      cymbalPiayer.play()
    } catch {
      print("シンバルでエラーが発生しました！")
      //AVAudioPlayer 例外が発生しやすいので、例外処理を記述しないといけない
    }
 */
    
  }
  
  // ギター
  let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
  
  var guitarPlayer = AVAudioPlayer()
  
  @IBAction func guitar(_ sender: Any) {
    soundPlayer(&guitarPlayer, path: guitarPath, count: 0)
 
    /*  do {
     guitarPlayer = try AVAudioPlayer(contentsOf: guitarPath, fileTypeHint: nil)
      guitarPlayer.play()
    } catch {
      print("ギターでエラーが発生しました！")
    }
     */
    
  }
  
  //バックミュージック
  let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
  
  var backmusicPlayer = AVAudioPlayer()
		
  @IBAction func play(_ sender: Any) {
    soundPlayer(&backmusicPlayer, path: backmusicPath, count: -1)
    
    
 /*   do {
      backmusicPlayer = try AVAudioPlayer(contentsOf: backmusicPath, fileTypeHint: nil)
      
      //リピート設定（−１＝無限）
      backmusicPlayer.numberOfLoops = -1
      backmusicPlayer.play()
    }catch {
      print("エラーが発生しました！")
    }
 */
  }
  @IBOutlet var bg: [UIImageView]!
  
  //STOP
  @IBAction func stop(_ sender: Any) {
    backmusicPlayer.stop()
  }
  
  fileprivate func soundPlayer(_ player:inout AVAudioPlayer, path:URL, count: Int){
    do{
      player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
      player.numberOfLoops = count
      player.play()
    } catch {
      print("エラーが発生しました！")
    }
    
  }
}





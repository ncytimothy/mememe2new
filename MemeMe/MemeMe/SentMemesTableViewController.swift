//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Timothy Ng on 11/24/17.
//  Copyright © 2017 Timothy Ng. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UITableViewController {
  
    var memes = [Meme]()
  
    // MARK: - Properties
    @IBOutlet weak var memeTableView: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func addMeme(_ sender: Any) {
        let memeEditorVC = self.storyboard?.instantiateViewController(withIdentifier: "MemeEditorVC") as! MemeEditorVC
       present(memeEditorVC, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memeTableView.rowHeight = 90
        memes = appDelegate.memes
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeTableView.layoutMargins = UIEdgeInsets.zero
        memeTableView.separatorInset = UIEdgeInsets.zero
    }
        
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell") as! MemeTableViewCell
        let meme = memes[(indexPath as NSIndexPath).row]
        cell.layoutMargins = UIEdgeInsets.zero
        
        cell.memedImage?.image = meme.memedImage
        cell.memeText?.text = meme.topText + "..." + meme.bottomText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailViewController.meme = memes[(indexPath as NSIndexPath).row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

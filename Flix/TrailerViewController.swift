//
//  TrailerViewController.swift
//  Flix
//
//  Created by OSL on 3/3/22.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    var trailerKey: String!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // default video id is 0 which opens a video not available page
        let trailerURL = URL(string: "https://www.youtube.com/watch?v=\(self.trailerKey ?? "0")")
        let myRequest = URLRequest(url: trailerURL!)
        webView.load(myRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

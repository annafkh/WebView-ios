import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let config = WKWebViewConfiguration()
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        config.defaultWebpagePreferences = preferences

        webView = WKWebView(frame: view.bounds, configuration: config)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.uiDelegate = self
        view.addSubview(webView)

        if let url = URL(string: "https://annme-money-main-bqtexi.laravel.cloud/") {
            webView.load(URLRequest(url: url))
        }
    }

    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "Tidak", style: .cancel) { _ in
            completionHandler(false)
        })

        alertController.addAction(UIAlertAction(title: "Ya", style: .default) { _ in
            completionHandler(true)
        })

        present(alertController, animated: true, completion: nil)
    }
}

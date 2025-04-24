import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    public var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let config = WKWebViewConfiguration()
        let prefs  = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        config.defaultWebpagePreferences = prefs

        webView = WKWebView(frame: view.bounds, configuration: config)
        webView.uiDelegate        = self
        webView.navigationDelegate = self
        webView.autoresizingMask  = [.flexibleWidth, .flexibleHeight]

        webView.customUserAgent = """
            Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) \
            AppleWebKit/605.1.15 (KHTML, like Gecko) \
            Version/15.0 Mobile/15E148 Safari/604.1
        """

        view.addSubview(webView)

        if let url = URL(string: "https://annme-money-main-bqtexi.laravel.cloud/") {
            webView.load(URLRequest(url: url))
        }
    }

    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        guard let url = navigationAction.request.url else {
            decisionHandler(.allow)
            return
        }

        if url.scheme == "dompetannme" {
            UIApplication.shared.open(url)
            decisionHandler(.cancel)
            return
        }

        if navigationAction.navigationType == .linkActivated,
           url.host != "annme-money-main-bqtexi.laravel.cloud" {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            decisionHandler(.cancel)
            return
        }

        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Cancel", style: .cancel) { _ in completionHandler(false) })
        alert.addAction(.init(title: "OK", style: .default){ _ in completionHandler(true) })
        present(alert, animated: true)
    }
}

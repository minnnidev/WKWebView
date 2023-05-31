//
//  ViewController.swift
//  WebView-Test
//
//  Created by 김민 on 2023/05/31.
//

import UIKit

import SnapKit
import Then
import WebKit

final class WebViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
        setLayout()
        setWebView()
        setNavigationBar()
        setDelegate()
    }
}


extension WebViewController {
    
    // MARK: - Custom Methods
    
    private func setBackground() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(webView)
        
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setWebView() {
        let url = URL(string: "https://m.naver.com")
        let request = URLRequest(url: url!)
        webView.configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        webView.load(request)
    }
    
    private func setNavigationBar() {
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(rightButtonDidTap))
        navigationItem.title = "네이버"
        navigationItem.rightBarButtonItem = rightItem
    }
    
    private func setDelegate() {
        webView.uiDelegate = self
        webView.navigationDelegate = self
    }
    
    // MARK: - @objc Methods
    
    @objc private func rightButtonDidTap() {
        dismiss(animated: true)
    }
}

// MARK: - WKUIDelegate

extension WebViewController: WKUIDelegate {}

// MARK: - WKNavigationDelegate

extension WebViewController: WKNavigationDelegate {}

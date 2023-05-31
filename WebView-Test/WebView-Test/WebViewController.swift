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
    
    private let webView: WKWebView = {
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
    
    // MARK: - Properties
    
    private let url: URL
    
    // MARK: - Initializer
    
    init(url: URL) {
        self.url = url
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
        setLayout()
        setWebView()
        setNavigationBar()
        setDelegate()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        webView.frame = view.bounds
    }
}


extension WebViewController {
    
    // MARK: - Custom Methods
    
    private func setBackground() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(webView)
    }
    
    private func setWebView() {
        let request = URLRequest(url: url)
        self.webView.load(request)
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

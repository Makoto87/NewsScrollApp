//
//  MainViewController.swift
//  NewsScrollApp
//
//  Created by 原田悠嗣 on 2019/08/11.
//  Copyright © 2019 原田悠嗣. All rights reserved.
//

// ロード中インジケータが表示されること
// インジケータはNVActivityIndicatorViewというライブラリを利用すること
// インジケータは上タブを含んだ画面全体の中心に表示されること
// ロード中にテーブルビューのセルを押せなくして、そのことがユーザーが直感的にわかるようにすること
// webView内のリンクによる遷移、toolBarのボタンによる遷移は短時間なことが多いため、インジケータをつけなくてよい。
// インジケータ自体のデザイン、色彩は問わない。
// インジケータの追加はコード上でもStoryboard上でも構わない

import UIKit
import XLPagerTabStrip

class MainViewController: ButtonBarPagerTabStripViewController {

    // URLの文字列（yahoo,NHK,週刊文春)
    let urlList: [String] = ["https://news.yahoo.co.jp/pickup/domestic/rss.xml",
                             "https://www.nhk.or.jp/rss/news/cat0.xml",
                             "http://shukan.bunshun.jp/list/feed/rss"]

    // タブの名前の表示
    var iteminfo: [IndicatorInfo] = ["Yahoo!", "NHK", "週刊文春"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 各VCを返す処理
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {

        // 返すViewControllerの配列
        var childViewControllers: [UIViewController] = []

        // 各ViewControllerにurlとiteminfoの情報を受け渡し
        for i in 0 ..< urlList.count {

            // viewcontrollerのインスタンス化
            let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "News") as! NewsViewController

            // 値の受け渡し
            VC.url = urlList[i]
            VC.itemInfo = iteminfo[i]
            // 配列にappend
            childViewControllers.append(VC)

        }
        // VCを返す
        return childViewControllers
    }
}


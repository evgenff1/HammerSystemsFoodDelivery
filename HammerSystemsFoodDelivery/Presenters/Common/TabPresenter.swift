//
//  TabPresenter.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import Foundation

// MARK: - TabPresenter

final class TabPresenter {
    var view: TabViewProtocol?
    var selectedTab: Constants.Tab = .menu

    func selectTab(_ tab: Constants.Tab) {
        guard tab != selectedTab else { return }
        selectedTab = tab
        view?.updateSelectedTab(tab)
    }
}

//
//  ScrollSyncManager.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 25.07.2025.
//

import SwiftUI

// MARK: - ScrollSyncManager

class ScrollSyncManager {
    
    // MARK: - Public Methods
    
    func scrollToCategory(
        _ category: String,
        scrollProxy: ScrollViewProxy,
        completion: @escaping () -> Void
    ) {
        withAnimation(.easeInOut(duration: 0.35)) {
            scrollProxy.scrollTo(category.lowercased(), anchor: .top)
        }
        
        Task {
            try? await Task.sleep(nanoseconds: Constants.Timing.scrollCategoryAdjustDelay)
            await MainActor.run { self.adjustScroll(offset: 56) }

            try? await Task.sleep(nanoseconds: Constants.Timing.scrollCategoryFinalDelay)
            await MainActor.run { completion() }
        }
    }

    func handleVisibleCategories(
        _ values: [VisibleCategory],
        currentSelected: String,
        isCategoryTapScrolling: Bool,
        onChange: (String) -> Void
    ) {
        guard !isCategoryTapScrolling else { return }

        let visibleAboveTop = values.filter { $0.minY <= 10 }

        if let topVisible = visibleAboveTop.max(by: { $0.minY < $1.minY }),
           topVisible.id != currentSelected {
            withAnimation {
                onChange(topVisible.id)
            }
        }
    }

    // MARK: - Private Helpers
    
    @MainActor
    private func adjustScroll(offset: CGFloat) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let scrollView = findScrollView(in: window) else { return }

        let newOffset = CGPoint(x: 0, y: scrollView.contentOffset.y - offset)
        scrollView.setContentOffset(newOffset, animated: false)
    }

    private func findScrollView(in view: UIView) -> UIScrollView? {
        if let scrollView = view as? UIScrollView { return scrollView }
        for sub in view.subviews {
            if let found = findScrollView(in: sub) { return found }
        }
        return nil
    }
}


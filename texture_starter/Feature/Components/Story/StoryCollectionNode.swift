//
//  StoryCollectionNode.swift
//  texture_starter
//
//  Created by arya.surya on 13/06/21.
//

import Foundation
import AsyncDisplayKit

public class StoryCollectionNode: ASCollectionNode {
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumInteritemSpacing = 8
        collectionViewFlowLayout.scrollDirection = .horizontal
        return collectionViewFlowLayout
    }()

    private let stories: [StoryModel]
    
    public init(stories: [StoryModel]) {
        self.stories = stories
        super.init(frame: .zero, collectionViewLayout: collectionViewFlowLayout, layoutFacilitator: nil)
        self.automaticallyManagesSubnodes = true
        self.showsHorizontalScrollIndicator = false
        self.delegate = self
        self.dataSource = self
        self.style.width = .init(unit: .fraction, value: 1)
//        self.style.height = .init(unit: .points, value: 80)
        self.style.height = ASDimensionMake(80)
    }
}

extension StoryCollectionNode: ASCollectionDataSource, ASCollectionDelegate {
    public func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    public func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let storyData = self.stories[indexPath.row]
        return {
            StoryNode(story: storyData)
        }
    }
}

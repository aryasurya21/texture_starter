//
//  HomeViewController.swift
//  texture_starter
//
//  Created by arya.surya on 13/06/21.
//

import Foundation
import AsyncDisplayKit

public final class HomeViewController: ASDKViewController<ASScrollNode> {
    
    private let rootNode: ASScrollNode = {
        let rootNode = ASScrollNode()
        rootNode.automaticallyManagesSubnodes = true
        rootNode.backgroundColor = .white
        rootNode.automaticallyManagesContentSize = true
        rootNode.scrollableDirections = [.up, .down]
        return rootNode
    }()
    
    private let headerNode: HeaderNode
    private let storyCollectionNode: StoryCollectionNode
    private let postTableNode: PostTableNode
    
    public override init() {
        self.headerNode = HeaderNode()
        self.storyCollectionNode = StoryCollectionNode(stories: DataGenerator.generateDummyStories())
        self.postTableNode = PostTableNode(posts: DataGenerator.generateDummyPosts())
        
        super.init(node: rootNode)
        rootNode.layoutSpecBlock = { [weak self] _, _ -> ASLayoutSpec in
            guard let self = self else { return .init() }
            let insetedHeaderNode = ASInsetLayoutSpec(insets: .init(top: 48, left: 16, bottom: 8, right: 16), child: self.headerNode)
            return ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .stretch, children: [
                insetedHeaderNode,
                self.storyCollectionNode,
                self.postTableNode
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

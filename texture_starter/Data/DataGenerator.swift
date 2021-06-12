//
//  DataGenerator.swift
//  texture_starter
//
//  Created by arya.surya on 12/06/21.
//

import Foundation

public class DataGenerator {
    public static func generateDummyStories() -> [StoryModel] {
        [
            .init(userAvatar: "user1", userName: "eleanorrigby2"),
            .init(userAvatar: "user2", userName: "blancokun123"),
            .init(userAvatar: "user3", userName: "calvinscong00"),
            .init(userAvatar: "user4", userName: "dulubukanwibu"),
            .init(userAvatar: "user5", userName: "edwardo.kipasje"),
            .init(userAvatar: "user6", userName: "kelvinjulia68"),
            .init(userAvatar: "user7", userName: "phillipeborrow"),
            .init(userAvatar: "user8", userName: "sherlyef22"),
        ]
    }
    
    public static func generateDummyPosts() -> [PostModel] {
        [
            .init(userName: "kelvinjulia68", userAvatar: "user6", location: "Turkey", image: "post1", likesCount: 140, caption: "I'm visiting Turkey"),
            .init(userName: "edwardo.kipasje", userAvatar: "user5", location: "Somewhere", image: "post2", likesCount: 120, caption: "I look cool on this photo"),
            .init(userName: "dulubukanwibu", userAvatar: "user4", location: nil, image: "post5", likesCount: 1156, caption: "Watching anime"),
            .init(userName: "sherlyef22", userAvatar: "user8", location: "Bhutan", image: "post3", likesCount: 120, caption: "Got to visit the Tiger's Nest at Bhutan"),
            .init(userName: "blancokun123", userAvatar: "user2", location: nil, image: "post4", likesCount: 104, caption: "-"),
            .init(userName: "calvinscong00", userAvatar: "user3", location: nil, image: "post6", likesCount: 450, caption: "Cosplaying"),
        ]
    }
}

//
//  ThemeMain.swift
//  
//
//  Created by Vladislav Markov on 04.08.2023.
//

public struct ThemeMain: Theme {
    public let id: String
    public let colors: Colors
    public let font: Font

    public init() {
        id = "ThemeMain"
        self.colors = ThemeMainColors()
        font = ThemeMainFont()
    }
}

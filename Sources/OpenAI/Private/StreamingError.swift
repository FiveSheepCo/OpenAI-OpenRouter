//
//  File.swift
//  OpenAI
//
//  Created by Oleksii Nezhyborets on 03.02.2025.
//

import Foundation

public enum StreamingError: Error {
    case unknownContent
    case emptyContent
    case statusError(Int)
}

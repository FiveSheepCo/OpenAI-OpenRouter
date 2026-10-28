//
//  ServiceTier.swift
//  OpenAI
//
//  Created by Oleksii Nezhyborets on 22.05.2025.
//

import Foundation

public enum ServiceTier: Codable, Hashable, Sendable, CaseIterable, RawRepresentable {
    case auto
    case defaultTier
    case flexTier
    case onDemand
    case priority
    case provisioned
    /// A tier this SDK doesn't know about. Providers behind OpenRouter report many different tiers,
    /// so unknown values are preserved instead of failing to decode.
    case unknown(String)

    /// The known service tiers. Doesn't include `unknown`.
    public static let allCases: [ServiceTier] = [.auto, .defaultTier, .flexTier, .onDemand, .priority, .provisioned]

    public init(rawValue: String) {
        self = Self.allCases.first { $0.rawValue == rawValue } ?? .unknown(rawValue)
    }

    public var rawValue: String {
        switch self {
        case .auto: "auto"
        case .defaultTier: "default"
        case .flexTier: "flex"
        case .onDemand: "on_demand"
        case .priority: "priority"
        case .provisioned: "provisioned"
        case .unknown(let value): value
        }
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(rawValue: try container.decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}

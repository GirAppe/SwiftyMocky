//
//  ProtocolWithPropertiesTests.swift
//  SwiftyMocky
//
//  Created by Andrzej Michnia on 08.12.2017.
//  Copyright © 2017 MakeAWishFoundation. All rights reserved.
//

import XCTest
import SwiftyMocky
#if os(iOS)
    @testable import Mocky_Example_iOS
#elseif os(tvOS)
    @testable import Mocky_Example_tvOS
#elseif os(macOS)
    @testable import Mocky_Example_macOS
#endif

class ProtocolsWithPropertiesTests: XCTestCase {
    func test_properties_getters() {
        let mock = ProtocolWithPropoertiesMock()

        Verify(mock, .never, .name)
        Verify(mock, .never, .name(set: .any))

        mock.name = "danny_13"

        // Get properties randomly between 10 and 20 times
        let upper: Int = 10 + Int(arc4random_uniform(10))
        for _ in 1...upper {
            XCTAssertEqual(mock.name, "danny_13")
        }

        Verify(mock, .in(range: 10..<20), .name)
        Verify(mock, .in(range: 10...20), .name)
        Verify(mock, .in(range: 10...), .name)
    }

    func test_properties_setters() {
        let mock = ProtocolWithPropoertiesMock()

        Verify(mock, .never, .name)
        Verify(mock, .never, .name(set: .any))

        // Get properties randomly between 10 and 20 times
        let upper: Int = 10 + Int(arc4random_uniform(10))
        for i in 1...upper {
            mock.name = "danny_\(i)"
        }

        Verify(mock, .atLeastOnce, .name(set: .value("danny_1")))
        Verify(mock, .in(range: 10..<20), .name(set: .any))
        Verify(mock, .in(range: 10...20), .name(set: .any))
        Verify(mock, .in(range: 10...), .name(set: .any))
    }

    func test_static_properties_getters() {
        let mock = ProtocolWithPropoertiesMock.self
        mock.clear()

        Verify(mock, .never, .name)
        Verify(mock, .never, .name(set: .any))

        mock.name = "danny_13"

        // Get properties randomly between 10 and 20 times
        let upper: Int = 10 + Int(arc4random_uniform(10))
        for _ in 1...upper {
            XCTAssertEqual(mock.name, "danny_13")
        }

        Verify(mock, .in(range: 10..<20), .name)
        Verify(mock, .in(range: 10...20), .name)
        Verify(mock, .in(range: 10...), .name)
    }

    func test_static_properties_setters() {
        let mock = ProtocolWithPropoertiesMock.self
        mock.clear()

        Verify(mock, .never, .name)
        Verify(mock, .never, .name(set: .any))

        // Get properties randomly between 10 and 20 times
        let upper: Int = 10 + Int(arc4random_uniform(10))
        for i in 1...upper {
            mock.name = "danny_\(i)"
        }

        Verify(mock, .atLeastOnce, .name(set: .value("danny_1")))
        Verify(mock, .in(range: 10..<20), .name(set: .any))
        Verify(mock, .in(range: 10...20), .name(set: .any))
        Verify(mock, .in(range: 10...), .name(set: .any))
    }
}

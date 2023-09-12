//
//  SD_20230907_ShashantDahikar_ChaseUITestsLaunchTests.swift
//  SD-20230907-ShashantDahikar-ChaseUITests
//
//  Created by Shashant Dahikar on 07/09/23.
//

import XCTest

final class SD_20230907_ShashantDahikar_ChaseUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

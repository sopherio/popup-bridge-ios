/*
 IMPORTRANT
 Hardware keyboard should be disabled on simulator for tests to run reliably.
 */

import XCTest

class PopupBridge_PayPalCheckoutUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("-url::https://js-sdk-integration.herokuapp.com/v3/paypal-checkout?v3Version=latest&js=prod&merchant=sandbox")
        
        self.app.launch()
        sleep(1)
//        self.waitForElementToBeHittable(app.buttons["Pay With iDEAL"])
    }

    func test_doesAThing() {





    }
}

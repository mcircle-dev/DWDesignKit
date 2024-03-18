# DW Design Components for iOS

#### Super Easy and Simple Design Components for DW common iOS Service Apps

# Feature

- [x] pure swift 5.0 code
- [x] RxSwift not support

# Installation

#### Swift Package Manager

Simply add DWDesignComponets to your `Package Dependancies`.

Add only url 'https://github.com/mcircle-dev/ios-dw-design-components.git' into Package Dependancies

# Usage

You must initialize DwDesignComponets into AppDelegate.

Then you can use incrediable design components.

You can see as below screen.

```swift
import UIKit
import DwDesignComponents

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DwDesignComponents.shared.wholeDisabledButtonColor = UIColor.gray
        DwDesignComponents.shared.wholeEnabledButtonColor = UIColor.blue
        return true
    }
```

The following sample code for your reference.

```swift
import UIKit
import DwDesignComponents

class ViewController: UIViewController {

    private lazy var button: DwButton = {
        let button = DwButton()
        button.status(true)
        button.text = "Tapped Me"
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
    }
}
```

Scheduled for next version for RxSwift.

```swift
import UIKit

import DwDesignComponents
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    private lazy var button: DwButton = {
        let button = DwButton()
        button.status = true
        button.text = "Tapped Me"
        return button
    }()

    private var isEnabledRx = PublishRelay<Bool>()
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)

        isEnabledRx
            .distinctUntilChanged()
            .bint(to: button.rx.status)
            .disposed(by: disposeBag)
    }
}
```

# Components and Views API References

### DwButton()

| method            | types   | support rx | description                                        |
| ----------------- | ------- | ---------- | -------------------------------------------------- |
| text              | String  | Yes        | text messages                                      |
| status.status     | Bool    | Yes        | enabled or disabled status                         |
| status.isEnabled  | Bool    | No         | possible/impossible tap when enable button status  |
| status.isDisabled | Bool    | No         | possible/impossible tap when disable button status |
| textColor         | UIColor | No         | setting button text color                          |
| backgroundColor   | UIColor | No         | setting button background color                    |
| cornerRadius      | CGFloat | No         | setting button cornerRaidus                        |
| borderColor       | UIColor | No         | setting button background color                    |

# License

DwDesignComponets is available under the MIT license. See the LICENSE file for more info.

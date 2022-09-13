<p align="center">
   <img width="200" src="https://raw.githubusercontent.com/SvenTiigi/SwiftKit/gh-pages/readMeAssets/SwiftKitLogo.png" alt="LayoutItKit Logo">
</p>

<p align="center">
   <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat" alt="Swift 5.0">
   </a>
   <a href="http://cocoapods.org/pods/LayoutItKit">
      <img src="https://img.shields.io/cocoapods/v/LayoutItKit.svg?style=flat" alt="Version">
   </a>
   <a href="http://cocoapods.org/pods/LayoutItKit">
      <img src="https://img.shields.io/cocoapods/p/LayoutItKit.svg?style=flat" alt="Platform">
   </a>
   <a href="https://github.com/Carthage/Carthage">
      <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage Compatible">
   </a>
   <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" alt="SPM">
   </a>
</p>

# LayoutItKit

LayoutItKit is a set of UIKit extensions to facilitate layout creation using ViewCode and UIKit.

## Features

- [x] Easy to create layouts using `UIStackView`.
- [x] Shortcuts for dealing with UIKit constraints.
- [x] Custom initializers for the most common `UIView`, `UILabel`, and `UIStackView`.
- [x] Possibilite to create simple scrollable layout using only `UIStackView` without `UITableView`.

## Example

The example application is the best way to see `LayoutItKit` in action. Simply open the `LayoutItKit.xcodeproj` and run the `Example` scheme.

## Installation

### CocoaPods

LayoutItKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```bash
pod 'LayoutItKit'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

To integrate LayoutItKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "abraaolevi/LayoutItKit"
```

Run `carthage update` to build the framework and drag the built `LayoutItKit.framework` into your Xcode project. 

On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase” and add the Framework path as mentioned in [Carthage Getting started Step 4, 5 and 6](https://github.com/Carthage/Carthage/blob/master/README.md#if-youre-building-for-ios-tvos-or-watchos)

### Swift Package Manager

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/), add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/abraaolevi/LayoutItKit.git", from: "0.1.0")
]
```

Alternatively navigate to your Xcode project, select `Swift Packages` and click the `+` icon to search for `LayoutItKit`.

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate LayoutItKit into your project manually. Simply drag the `Sources` Folder into your Xcode project.

## Usage

It is easy to use:


<table>
<tr>
<td>

```swift
import LayoutItKit
import UIKit

class InlineViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fluent code interface
        let label = UILabel()
            .withText("🚀\nInline UILabel\nLayoutItKit\nExample")
            .withFont(.systemFont(ofSize: 25, weight: .semibold))
            .withTextColor(.black)
            .withTextAlignment(.center)
            .withNumberOfLines(0)

        // Simple scrollableView using UIStackView without UITableView
        view.scrollableStack(views: [
            label,
            UIView(backgroundColor: .blue).withSize(height: 100),
            UIView(backgroundColor: .green).withSize(height: 100),
            UIView(backgroundColor: .black).withSize(height: 100),
            UIView(backgroundColor: .brown).withSize(height: 100),
            UIView(backgroundColor: .purple).withSize(height: 100),
            UIView(backgroundColor: .red).withSize(height: 100),
            UIView()
        ], spacing: 24)
    }
}
```

</td>
<td>
<img 
src="https://user-images.githubusercontent.com/502058/190005106-89346846-d889-4dc8-83c3-f256d09211a5.gif" 
alt="Exemple of layout built with LayoutItKit"
title="Exemple of layout built with LayoutItKit"
width="296" />
</td>
</tr>
</table>

Also, you can create your own component pieces:

```swift
import LayoutItKit
import UIKit

struct CreditCard {
    let number: String
    let holder: String
    let expiration: String
}

// You can create custom UIViews
class CreditCardView: UIView {

    // Custom initializers for the most common `UIView`, `UILabel`, and `UIStackView`.
    let titleLabel = UILabel(
        text: "Credit Card", 
        font: .boldSystemFont(ofSize: 32), 
        textColor: .white)

    let monthYearTitleLabel = UILabel(
        text: "Month / Year", 
        font: .systemFont(ofSize: 8), 
        textColor: .white)

    let validThruTitleLabel = UILabel(
        text: "Valid Thru", 
        font: .systemFont(ofSize: 10), 
        textColor: .white, 
        numberOfLines: 2)

    let cardNumberLabel = UILabel(
        font: .systemFont(ofSize: 24, weight: .semibold), 
        textColor: .white)

    let expirationLabel = UILabel(
        font: .systemFont(ofSize: 18), 
        textColor: .white)

    let holderLabel = UILabel(
        font: .systemFont(ofSize: 18), 
        textColor: .white)

    // UIView initializers
    convenience init(card: CreditCard) {
        self.init(frame: .zero)

        cardNumberLabel.text = card.number
        expirationLabel.text = card.expiration
        holderLabel.text = card.holder
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        // Creates layout with LayoutItKit 🚀

        vstack(
            titleLabel,
            spacer(),
            
            cardNumberLabel,
            vspacer(8),
            
            hstack(
                hspacer(30),
                monthYearTitleLabel,
                spacer()
            ),
            hstack(
                validThruTitleLabel.withSize(width: 30),
                expirationLabel,
                spacer()
            ),
            vspacer(8),

            holderLabel
        )
        .withPadding()
        
        // Set some color for the current UIView
        
        backgroundColor = .blue
        layer.cornerRadius = 12
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// On the UIViewController

class CreditCardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Uses the CreditCardView component created
        let creditCard = CreditCardView(
            card: CreditCard(
                number: "4412 9873 1234 9876",
                holder: "Jonh Doe",
                expiration: "10 / 29"
            )
        )

        view.addSubviewAndCenterToSuperview(creditCard)

        // Credit Card Size
        let width = UIScreen.main.bounds.width - 64
        let height = (width / 3) * 2
        creditCard.withSize(width: width, height: height)
    }
}
```

<img 
src="https://user-images.githubusercontent.com/502058/190005097-0ec0c64e-9a9c-4ea0-a3f1-7227dbf05372.png" 
alt="Exemple of use of custom UIView layout built with LayoutItKit"
title="Exemple of use of custom UIView layout built with LayoutItKit"
width="296" />

## Contributing
Contributions are very welcome 🙌

## License

```
LayoutItKit
Copyright (c) 2020 LayoutItKit abr4ao.levi@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

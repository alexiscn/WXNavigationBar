# WXNavigationBar
WeChat NavigationBar

![](Assets/navigationbar01.gif)

# Features

- [x] Support transparent navigationbar
- [x] Support navigationbar background image
- [x] Support navigationbar large title
- [x] Support fullscreen pop gesture
- [x] As Simple as using UINavigationBar 
 
# Requirements

- iOS 12.0+
- Xcode 11.0+
- Swift 5.0+

# Installation

`WXNavigationBar` is available through CocoaPods. To install it, simply add the following line to your Podfile:

```
use_frameworks!

pod 'WXNavigationBar'
```

# Design Principle

`WXNavigation` make the actual UINavigationBar transparent and add a view as a fake navigation bar. 

# Getting Started

There is no setup needed for using WXNavigationBar. However you can customize WXNavigationBar if needed.

### Configuration

In your `AppDelegate.swift`

```swift

import WXNavigationBar

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    // ...
    
    // Customize WXNavigationBar if needed (Optional)
    WXNavigationBar.NavBar.backImage = UIImage(named: "xxx")
}

```

Options:

```swift
/// Back Image for Navigation Bar
public static var backImage: UIImage? = Utility.image(named: "wx_nav_back")
        
/// Background Image for NavigationBar
public static var backgroundImage: UIImage? = nil

/// Background color for NavigationBar
public static var backgroundColor: UIColor = UIColor(white: 237.0/255, alpha: 1.0)

/// Tint Color for NavigationBar
public static var tintColor = UIColor(white: 24.0/255, alpha: 1.0)

/// Shadow Image for NavigationBar
public static var shadowImage: UIImage? = UIImage()

/// Enable fullscreen pop gesture
public static var fullscreenPopGestureEnabled = false
```

### ViewController based configuration

Background Color
---

```swift
/// Background color of fake NavigationBar
/// Default color is UIColor(white: 237.0/255, alpha: 1.0)
override var wx_navigationBarBackgroundColor: UIColor? {
    return .white
}
```

Background Image
---

```swift
override var wx_navigationBarBackgroundImage: UIImage? {
    return UIImage(named: "icons_navigation_bar")
}
```

System blur navigation bar
---

```swift
override var wx_useSystemBlurNavBar: Bool {
    return true
}
```

NavigationBar bar tint color
---

```swift
override var wx_barBarTintColor: UIColor? {
    return .red
}
```

NavigationBar tint color
---

```swift
override var wx_barTintColor: UIColor? {
    return .black
}
```

Shadow Image
---

```swift
override var wx_shadowImage: UIImage? {
    return UIImage(named: "icons_navigation_bar_shadow_line")
}
```

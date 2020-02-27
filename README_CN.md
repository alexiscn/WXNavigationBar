# WXNavigationBar
WeChat NavigationBar

![](Assets/navigationbar01.gif)



# 特点

- 支持设置导航栏背景颜色
- 支持设置导航栏背景图片
- 支持Large Title模式
- 支持隐藏导航栏底部黑线


# Requirements

- iOS 12.0+
- Xcode 11.0+
- Swift 5.0+

# 安装

`WXNavigationBar` 可以通过CocoaPods安装，在`Podfile`中添加

```
pod 'WXNavigationBar'
```


# 实现原理

将系统导航栏设为透明，在View中添加一个NavigationBar相同大小，相同位置的View作为导航栏的背景视图。


# 使用方法

See the demo.

```swift
import WXNavigationBar

let controller = ViewController()
let nav = WXNavigationController(rootViewController: controller)
```

### 自定义返回按钮


1、全局修改返回按钮图片

```swift
import WXNavigationBar

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

	// ...
	WXNavigationBar.NavBar.backImage = UIImage("my_back_button_image")

}

```


2、修改特定ViewController中的返回按钮图片

```swift
// ViewController.swift
import WXNavigationBar

class ViewController: UIViewController {
	

	// ....

	override var wx_backImage: UIImage? {
		return UIImage("my_back_button_image")
	}

}

```


### 导航栏透明


有两种方法可以让导航栏透明，将WXNavigationBar的背景颜色设为透明或者将其alpha 设为 0

```swift

override func viewDidLoad() {
	super.viewDidLoad()
	
	wx_navigationBar.alpha = 0	

	// wx_navigationBar.isHidden = true
}

```

或者

```swift
override var wx_navigationBarBackgroundColor: UIColor? {
        return .clear
 }
```

### 使用系统导航栏

由于`WXNavigationBar`的实现原理，默认是使用纯色的导航栏，如果想要Blur效果的导航栏，可以将 `wx_useSystemBlurNavBar`设为`true`:

```swift
override var wx_useSystemBlurNavBar: Bool {
    return true
}
```

## shadowImage

默认WXNavigationBar会隐藏导航栏下的黑线，如果想要显示shadowImage，可以将 `wx_hiddenShadowImage`设为`false`：


```swift
override var wx_hiddenShadowImage: Bool {
    return false
}
```



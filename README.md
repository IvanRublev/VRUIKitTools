VRUIKitTools
============

Several categories extending UIKit classes, and Core Graphics functions. For faster coding.

Installation
------------

- Subtree this repository somewhere in your project.
```
git subtree add --prefix=Somewhere/VRUIKitTools --squash https://github.com/IvanRublev/VRUIKitTools.git master
```

- Add `-ObjC` to Other Linker Flags in project's Build Settings. And add `"./Somewhere/**"` to Header Search Paths.
- Add VRUIKitTools target to Target Dependencies in Build phases of your project's target.
- Link to libVRUIKitTools.a in General tab of your project's target.
- Add `#import VRUIKitTools.h` to YourProject-Prefix.pch. 

Now it's ready to use!

Categories are included
-----------------------

#### UIViewController+VRShortcutsToAppDelegateAndBackButton

Quick access to app's delegate or back button inside any view controller via ```[self appDelegate]``` or ```[self backButtonOfLowerViewController]```.

#### UIColor+VRRGB255

Creates UIColor with integer values of colors in range 0-255.

#### UIButton+VRCopy

Copies button and all it's parametres including images if set.

#### VRActionSheetWithBlock

UIActionSheet subclass, to use with blocks.

#### VRAlertViewWithBlock

UIAlert subclass, to use with blocks.

#### UIImage+VRDerivatives

Loading image in memory bypassing system cache, decompressing image in memory, resizing, drawing image or dots over image, etc.  

#### UIStoryboardSegue+VRDeepDestination

Retrive view controller from segue destination, even if it's part of navigation controller.

#### UIView+FindFirstResponder

Recursively goes through subviews until finds first responder.

Functions are included
----------------------

#### VRGeometryTools.h

Several functions to calculate and produce CGRect, CGPoint and CGSize.

License
-------

MIT. Copyright (c) 2013 Ivan Rublev, ivan@ivanrublev.me 

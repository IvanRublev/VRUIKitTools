VRUIKitTools
============

Several categories extending UIKit classes, and Core Graphics functions. For faster coding.

Installation
------------

- Subtree this repository somewhere in your project.
```
git subtree add --prefix=Requirements/VRUIKitTools --squash https://github.com/IvanRublev/VRUIKitTools.git master
```

- Drag & drop `VRUIKitTools.xcodeproj` in to your poject.
- Add `-ObjC` to Other Linker Flags in project's Build Settings. And add `"./Requirements/**"` to Header Search Paths.
- Add VRUIKitTools target to Target Dependencies in Build phases of your project's target.
- Link to libVRUIKitTools.a in General tab of your project's target.
- Add `#import "VRUIKitTools.h"` to YourProject-Prefix.pch. 

Now it's ready to use!

Classes to use in Interface Builder
-----------------------------------

#### VRImageTiledView

Fills background of itself with specified image tiled.

##### VRInsetedBgImageButton

Replaces background image for Normal state with derived image inseted according to insetsRect property.


Categories and classes to use in code
-------------------------------------

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

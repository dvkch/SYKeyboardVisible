SYKeyboardVisible
=================

Singleton to determine if the keyboard is currently visible


How to use
----------

The interface is pretty simple, really. Maybe more will come layer, who knows.

	typedef enum : NSUInteger {
    	SYKeyboardVisibility_WillShow,
    	SYKeyboardVisibility_WillHide,
    	SYKeyboardVisibility_DidShow,
    	SYKeyboardVisibility_DidHide,
	} SYKeyboardVisibility;
	
	@interface SYKeyboardVisible : NSObject
	+ (SYKeyboardVisibility)visibility;
	@end


I think you guessed, the goal is to know the last keyboard notification that was received, so that at any moment you can know if the keyboard is visible or not.

Limitations
-----------

- Currently the following notifications are NOT observed:

		UIKeyboardWillChangeFrameNotification
		UIKeyboardDidChangeFrameNotification
	
- When the interface orientation changes the following notifications are sent, and saddly the `visibility` property follows the same path

		WillHide -> DidHide -> WillShow -> DidShow


License
-------

Once again, do as you wish with this code, but if you like it drop me an email to say thanks ;)

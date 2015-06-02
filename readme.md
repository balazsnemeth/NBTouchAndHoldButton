#NBTouchAndHoldButton

This button is a subclass of UIButton, and you can use it very simply. You can put a UIButton using Interface Builder and change the class to NBTouchAndHoldButton in Identity Inspector. After it, you must configure the action programmatically which will be executed during the user is holding the button in touched state.

    TouchAndHoldButton * pageDownButton = [TouchAndHoldButton buttonWithType:UIButtonTypeCustom];
    [pageDownButton setTitle:@"Page Down" forState:UIControlStateNormal];
    [pageDownButton addTarget:self action:@selector(pageDownAction:) forTouchAndHoldControlEventWithTimeInterval:0.2];

In this example, the button will fire calling the pageDownAction: in 200 ms intervals during the user touching and holding it.

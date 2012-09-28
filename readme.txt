# NBTouchAndHoldButton

This button is a subclass of UIBUtton, and you can use it very simple. You can put a UIButton using Interface Builder and change the class to NBTouchAndHoldButton in Identity Inspector. After it, you must to set the method programmatically which will be run when the user is going to touch the button and hold it:

    TouchAndHoldButton * pageDownButton = [TouchAndHoldButton buttonWithType:UIButtonTypeCustom];
    [pageDownButton setTitle:@"Page Down" forState:UIControlStateNormal];
[pageDownButton addTarget:self action:@selector(pageDownAction:) forTouchAndHoldControlEventWithTimeInterval:0.2];

In this example, the button will fire calling the pageDownAction: in 200 ms intervals when the user touch and hold it.
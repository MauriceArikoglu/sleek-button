[![header](https://github.com/MauriceArikoglu/sleek-button/blob/master/Assets/SleekButton.png)](https://github.com/MauriceArikoglu/sleek-button/blob/master/Assets/SleekButton.png)
# Sleek Button

SleekButton is a drop-in class replacing the boring default UIButton..

**You can easily add a grandient with pre determined Gradient Styles..**
-----

- maybe you like Left-to-Right gradients:
<img src="https://github.com/MauriceArikoglu/sleek-button/blob/master/Assets/LeftRightShadow.png" width="375">

- maybe you don't like shadows:
<img src="https://github.com/MauriceArikoglu/sleek-button/blob/master/Assets/LeftRightNoShadow.png" width="375">

- maybe you do like shadows, but prefer a diagonal gradient...:
<img src="https://github.com/MauriceArikoglu/sleek-button/blob/master/Assets/Diagonal.png" width="375">

- You can also animate the title, so that your user gets feedback, when the button is hit:

<img src="https://media.giphy.com/media/Tp8CAsPVpUPYY/giphy.gif" width="375">

- (Tip: disable button highlighting / set button style to 'custom' instead of 'system')

**Code**
-----
Basically every advantage _SleekButton_ has over the default UIButton (it's really just more fancy), can be configured and edited.

    //set the Gradient Colors. Per default SleekButton's gradient is created with two colors, gradientLightColor and gradientDarkColor - the gradient is always flowing from light to dark. You can easily add your own gradient though. SleekButton's layer is of type CAGradientLayer. So it is super easy to override the defaults and manage the gradient yourself.
    self.completeProfileButton.gradientLightColor = [UIColor colorWithRed:1.0 green:184.0/255.0 blue:140.0/255.0 alpha:1.0];
    self.completeProfileButton.gradientDarkColor = [UIColor colorWithRed:222.0/255.0 green:98.0/255.0 blue:98.0/255.0 alpha:1.0];
    
    //there are 5 gradient styles. The default is SleekGradientNoGradient, which, obviously, draws no gradient at all
    self.completeProfileButton.gradientStyle = SleekGradientLeftToRight;

    //you can easily configure if a cornerRadius should be drawn and what cornerRadius should be set. Default is no corner, so remember to set the cornerRadius and allow SleekButton to draw corners. We don't want to live in a squared world
    self.completeProfileButton.shouldDrawCornerRadius = YES;
    self.completeProfileButton.cornerRadius = 11.0f;

    //set if you want the predefined drop shadow to be drawn (color is the same as gradientDarkColor, it looks really good, I promise)
    self.completeProfileButton.shouldDrawDropShadow = YES;
    
    //set if you want that super fancy title expanding / shrinking (yes, yes, you want it)
    self.completeProfileButton.shouldAnimateTitle = YES;
    

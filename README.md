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
Basically every advantage* _SleekButton_ has over the default UIButton, can be configured and edited.

    //set the Gradient Colors. Per default SleekButton's gradient is created with two colors, 
    //gradientLightColor and gradientDarkColor - the gradient is always flowing from light to dark. 
    //You can easily add your own gradient though. SleekButton's layer is of type CAGradientLayer. 
    //So it is super easy to override the defaults and manage the gradient yourself.
    self.completeProfileButton.gradientLightColor = UIColor.blackColor;
    self.completeProfileButton.gradientDarkColor = UIColor.lightGrayColor;
    
    //there are 5 gradient styles. The default is SleekGradientNoGradient, which, obviously, draws no gradient at all
    self.completeProfileButton.gradientStyle = SleekGradientLeftToRight;

    //you can easily configure if a cornerRadius should be drawn and what cornerRadius should be set. 
    //Default is no corner, so remember to set the cornerRadius and allow SleekButton to draw corners. 
    //We don't want to live in a squared world
    self.completeProfileButton.shouldDrawCornerRadius = YES;
    self.completeProfileButton.cornerRadius = 11.0f;

    //set if you want the predefined drop shadow to be drawn (color is the same as gradientDarkColor, 
    //it looks really good, I promise)
    //you can always add your own shadow as well though
    self.completeProfileButton.shouldDrawDropShadow = YES;
    
    //set if you want that super fancy title expanding / shrinking (yes, yes, you want it)
    self.completeProfileButton.shouldAnimateTitle = YES;
    
*(it's really just more fancy)


**Bla License Bla Bla**
-----

MIT License

Copyright (c) 2017 Maurice Arikoglu

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

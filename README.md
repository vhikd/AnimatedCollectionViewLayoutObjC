# AnimatedCollectionViewLayoutObjC
Normally a `UICollectionView` has no transition effects when you scroll from one item to another. There are lots of ways to write animations for `UICollectionView`, but using a `UICollectionViewLayout` subclass is by far the simplest one. And it doesn't break any of your existing code. You can still use your `UICollectionView` subclass and you don't need to change your `UICollectionViewCell`. Just plug and enjoy.

This Layout was written by Object-C base on the >[AnimatedCollectionViewLayout](https://github.com/KelvinJin/AnimatedCollectionViewLayout). And add two kinds of animte `Move In` and `Move out`.

# Warning

**This layout just work with `UICollectionViewScrollDirectionHorizontal`.**

## Example

To run the example project, clone the repo, and start `iOS Example` in Xcode.

## Requirements

- iOS 7.0+

## Usage

### Get Started

Import the library where you want to use it. Create a `HorizontalFlowLayout` object, set its `animator` and assign it to your `UICollectionView`.

```
  HorizontalFlowLayout *lay = [HorizontalFlowLayout new];
  lay.scrollDirection = UICollectionViewScrollDirectionHorizontal;  
  lay.animator = [ParallaxAttributesAnimator new];
  lay.shouldReLayout = YES;
  UICollectionView *collect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:lay];
 ```
 
 ### Customization

Most of the built-in animators work best in **Paging** mode and they have additional parameters that you can tweak for better transitions.
You can also write your own animators by implementing the protocol `LayoutAttributesAnimator`.


## License

AnimatedCollectionViewLayout is available under the MIT license. See the LICENSE file for more info.
 


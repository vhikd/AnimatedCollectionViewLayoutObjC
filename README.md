# AnimatedCollectionViewLayoutObjC
Normally a `UICollectionView` has no transition effects when you scroll from one item to another. There are lots of ways to write animations for `UICollectionView`, but using a `UICollectionViewLayout` subclass is by far the simplest one. And it doesn't break any of your existing code. You can still use your `UICollectionView` subclass and you don't need to change your `UICollectionViewCell`. Just plug and enjoy.

This Layout was written by Object-C base on the >[AnimatedCollectionViewLayout](https://github.com/KelvinJin/AnimatedCollectionViewLayout). And add two kinds of animte `Move In` and `Move out`.

#Warning

This layout just work with `UICollectionViewScrollDirectionHorizontal`.

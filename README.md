# Roku Animated Poster

Component for providing animated posters

[![build status](https://img.shields.io/github/workflow/status/rokucommunity/roku-animated-poster/build.svg?logo=github)](https://github.com/rokucommunity/roku-animated-poster/actions?query=workflow%3Abuild)
[![monthly downloads](https://img.shields.io/npm/dm/roku-animated-poster.svg?sanitize=true&logo=npm&logoColor=)](https://npmcharts.com/compare/roku-animated-poster?minimal=true)
[![npm version](https://img.shields.io/npm/v/roku-animated-poster.svg?logo=npm)](https://www.npmjs.com/package/roku-animated-poster)
[![license](https://img.shields.io/github/license/rokucommunity/roku-animated-poster.svg)](LICENSE)
[![Slack](https://img.shields.io/badge/Slack-RokuCommunity-4A154B?logo=slack)](https://join.slack.com/t/rokudevelopers/shared_invite/zt-4vw7rg6v-NH46oY7hTktpRIBM_zGvwA)

## Installation


FIRST! Please take a look at: https://github.com/georgejecook/Animated-GIF-Roku-Demo

it might be that is more suitable for your needs.

### Using ropm

Use the [ropm package manager for roku](https://github.com/rokucommunity/ropm)

```bash
ropm install roku-animated-poster
```

suggestion: use a shorter prefix:

```bash
ropm install ap@npm:roku-animated-poster
```

## Usage

Follow these steps:

  1. Declare an animated poster
  1. Set the spritesheet uri
  1. Set the tile offsets for animation
  1. Play!

### Declare an animated poster component

#### In XML

Declare your animated poster with the target width and height!

*without prefix:*

```
  <rokuanimatedposter_AnimatedPoster 
      id="poster"
      width='240'
      height='240' />
```


*using ap prefix:*

```
  <ap_AnimatedPoster 
      id="poster"
      width='240'
      height='240' />
```

#### In Brighterscript

*without prefix:*

```
  poster = createObject("roSGNode", "rokuanimatedposter_AnimatedPoster")
  poster.width = 240
  poster.height = 240
```


*using ap prefix:*

```
  poster = createObject("roSGNode", "ap_AnimatedPoster")
  poster.width = 240
  poster.height = 240
```

### Set the spritesheet Uri

Animated poster works by moving a larger image, inside of a clipped group, to create the effect of an animation.

You need therefore need to supply the poster with a _spritesheet_, which is, multiple images in one image, with all of the animation frames for your image, as such:

![spritesheet sample](test-project/images/s.png)

Note:
Be careful to note you can easily blow out texture ram, by loading too big of an image.



### Set the tile offsets for animation

Provide the Animated poster with an array of `[x,y]` values for each frame of your animation, e.g. for the image referenced here:

```
  poster.frameOffsets = [
    [0, 0]
    [240, 0]
    [480, 0]
    [720, 0]
    [960, 0]
    [1200, 0]
  ]

```

Note: the offsets can be any x and y within the image.

### Play!

Use `control`, `duration` and `loopMode` (valid values: `once`, `loop`, `ping-pong`) to control your animation. e.g.

```
  poster.duration = 0.1
  poster.control = "start"
```

## Notes

Animated posters are a workaround for a missing Roku SDK feature. They are intended for use for icons, gamification, and UX flare. This implementation is a reference implementation only, and can be greatly improved. The real solution for animated images on Roku, is _ask Roku to add this missing feature to their SDK, with proper gif support._

### Performance

Animated poster performance is suprisingly good. You can get > 100 animated posters on a 9200x, without any glitches, and as many as 30 on a *roku 1*. However, you should take care to ensure the quality of your app's performance when using this component.

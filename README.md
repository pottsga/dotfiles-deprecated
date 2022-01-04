# dotfiles

Greg Potts `pottsga`'s dotfiles.

## Summary

These dotfiles utilize `GNU stow` to install dotfiles into the home directory.

## Process

1. Clone repository
2. `cd` into dotfiles
3. Run `./install` script

## CSS Browser Snippets for Stylus

### Roverradio.com

```css
/*
 Removes Rover's annoying advertisements from the top
 */
.vlog-asd,
.vlog-top-bar {
    display: none;
}

/*
 Makes the video player play at 100% width and height
 */
.vlog-section:nth-child(2) .container ,
#rmpPlayer1 {
    height: calc(100vh - 50px) !important; /* 100 percent of the view height minus the navbar's height */
    width: 100vw !important;
}

/*
 On the RMG Plus screens, Rover put a max-width property on the video's container.
 This breaks the video's ability to go full-screen. Remove that...
 */
div.fl-row:nth-child(2) > div:nth-child(1) > div:nth-child(1) {
    max-width: unset;
}
```

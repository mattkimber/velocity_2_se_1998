# Velocity 2 SE (1998)

An early teenage attempt at a racing game, in QBASIC. For historical interest only - 
this is unlikely to be good or idiomatic BASIC!

![Preview](Preview/Shot_1.gif)

## Background

My school had a programming club, to which I can credit my first experience of
the fun (and occasional frustration) of being part of a hacking community, and
my first exposure to open source via a few shared RedHat and SuSE discs.

However playing with Linux was a one-off treat, and the majority of programming
club time was spent in the only programming environment common to all school
computers, namely Microsoft QBASIC.

Velocity 2 SE was the last QBASIC iteration of a series of driving games I'd
written, initally based on a single-screen game example from Wrox Publishing's
"Revolutionary Guide to QBASIC" using QBASIC's inbuilt drawing primitives and
evolving to the scrolling sprite-based game here.

The source presented here is largely unmodified, bar some minor adjustments
to remove a potential trademark infringement and to clean up the directory
structure for easier inspection.

## Running

You will need a QBASIC interpreter - I tested QuickBasic 4.5 running under DOSBOX,
but the regular QBASIC 1.1 bundled with DOS 6.x should also work (it was what we
used back in the day!)

QB64 will also compile it, although the PC speaker sounds appear to cause it some
problems. They can probably be commented out, it is not one of gaming's essential
soundtracks. This is likely to be the best option for performance if you cannot
run DOSBOX with a very high number of cycles.

CPU usage is quite high. The presence of red angle brackets (`>`) indicate the
game running below its expected frame rate; despite primitive graphics the original
required a 486/25 for smooth running, and ideally a 486 DX2/66 - this was one of
the main reasons I ended up learning C.

The main game is `V2SE_101.BAS`. It loads support files using relative paths so
make sure you have the working directory of your interpreter set to the root
directory.

There is also a track editor, `TRACKED2.BAS`. This tool is quite rudimentary, keys
are as follows:

| Key | Function |
|-----|----------|
| Arrows | Move |
| +/- | Select tile |
| Space | Place tile |
| C | Add a checkpoint (no way to remove, be careful!) |
| B | Place start |
| F | Place finish |
| D | Drawing mode (draw while moving) |

## Easter egg

Set your player name to "Whole Bucketloads of Toads". This is original from 1998.
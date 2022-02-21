+++
title = "The Plan"
date = "2022-01-30T15:00:00-00:00"
author = "Stovoy"
authorTwitter = ""
cover = ""
description = "What's next?"
showFullContent = false
readingTime = false
+++
## Intro
Hey everyone, and welcome to the first official Evades blog post!

Evades is going to go through some major changes in the coming year, so I'll use this blog as a way to introduce the overall plan, and the reasoning behind it.

The changes are going to be widespread, including:
* New gameplay
* New art
* New music and sounds
* New technology
* New features

First, let's talk about the _why_. What's wrong with Evades as it is right now?

Well, for one, the game has performance problems. Especially if on an unstable connection, the lag can be annoying at the least, or game-ruining at worst.

It turns out, real time multiplayer networking is _complicated_. To understand this, and the plan to improve it, let's first talk about the current architecture of Evades...

## Technology
![Stack](/Stack.png)

The Evades backend runs using multiple Python asyncio server programs. The game engine itself is a custom engine, parts of which are in Rust for performance (namely, the collision detection).

## Servers
![серверы](/Servers.png)

There are two physical servers, which run these Python programs.

## Clients
![клиенты](/Client.png)

The client is relatively simple, using Canvas & WebSockets to render the game.

## Networking
![Networking](/Networking.png)

The networking is, all things considered, _simple_, and that's the issue.

The client sends inputs to the server, and the server sends all the game state to the client.

The typical features that are necessary to make a smooth experience are not there:
* No client side prediction
* No server reconciliation
* No data interpolation

These features all have some tradeoffs, of course, but without them, there's unavoidable input lag.

Additionally, it makes the game impossible to play as a singleplayer or offline experience.

# What's the problem?

"Stovoy", you might ask, "why don't we have these features?"

Fundamentally, the current Evades client, the website, is a _dumb client_ - It has no understanding of Evades. It just draws what the server tells it to. That means that lag is inevitable, because every input requires a full round-trip to the server to apply. Similarly, any autonomous elements like the enemies cannot move on the screen until the server responds.

To make it capable of that kind of prediction, the client needs to be able to simulate the game (accurately!) on its own. That's hard, though, since the game logic is written in Python, and the client is in Javascript.

Over the years, I've dabbled in a few possible solutions there, such as using Webassembly as an intermediate, or rewriting the server in Javascript/Typescript, etc.

I've also had a desire to open up Evades cross-platform, onto iOS, Android, Desktop, etc, and that further complicates things.

Making a game engine is a very large undertaking. The feature set for Evades is wide, and to support an enhanced art style, the game engine would need to be sophisticated.

# In comes Unity

Over the last several months, I've been experimenting with using Unity & C# as a client, rather than Javascript. Unity can be exported to any platform (including browser-native via WebGL), and has the sophistication required from a game engine of this variety.

However, since this is a multiplayer game, Evades wouldn't be able to rely entirely on Unity for simulation logic. Running Unity directly on the servers isn't feasible, but Evades _could_ run C# on the server for game simulation. Non-game simulation server logic can be written in Go, or perhaps also in C#.

This would let Evades have all the networking features we'd want, but it's a big lift to move from the current architecture to this Unity solution.

## First steps

First, Unity needs to be properly explored & Evades needs to be ported to Unity.

This is where I am now. I'm working on a fully-fledged Evades singleplayer experience to showcase, experiment with, and master Unity.

This project is already underway, and I'll be providing regular updates and showing it off more in future blogs!

My current estimates for completion of this singleplayer adventure is _3-4 months._

When finished, it will be posted standalone on Steam. Any proceeds from the singleplayer experience will go towards expanding the Evades team, and hiring experienced multiplayer devs to help bring everything together!

Once that's done, the next step is to take the existing multiplayer Evades experience, and upgrade it to the new system. This can be done in parallel with releasing new Unity-based content.

Stay tuned, for in the next blog posts, I'll be providing sneak peeks of the new Evades standalone adventure!

![Sneak Peek](/1-30-SneakPeek.gif)

-Stovoy
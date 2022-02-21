+++
title = "Unity as a sane client UI choice"
date = "2022-02-20T15:00:00-00:00"
author = "Stovoy"
cover = ""
tags = ["unity", "c#", "ui", "blogging-out-loud"]
keywords = ["unity", "ui", "native"]
description = "Using Unity for non-gameplay UI? Yes!"
showFullContent = false
readingTime = false
+++

Hi! I've had some thoughts about building out indirectly gameplay related UIs, and thought it'd be fun to share. 

So, for example, in the transition to a Unity-based engine for Evades, there are all sorts of non-gameplay related UIs:

- Profile Management
- Profile Viewer
- Account Management
- Level Editor
- And many more

I've also been toying around with the idea of self-hosted Evades servers in the future, similar to how anyone can host a Minecraft server.
We'd want a server management UI for that, too! There's all sorts of UIs involved here.

So, what are the options? Well, originally, I shyed away from attempting to use Unity for these UIs, as I wasn't familiar with it.

As an experiment towards solving this problem, I've been building a somewhat generic data editor that is meant to integrate with a Unity game. I wanted something that could run natively, so I thought maybe local webserver + React. Unity is in C#, and I'd like to keep things consistent within the codebase, so I tried out ASP.NET's Blazor. Though it seemed to work okay, there are so many differences in how things are done in ordinary C#, and in "Unity C#". It's a whole different ecosystem, really. That's an unfortunate truth.

Eventually, after experimenting enough, I realized that using Unity for the UI is the best solution here.

## What about the website?

For web and mobile-web, it'd still be necessary to have non-Unity UIs for certain pages. In those cases, Go + React is probably what I'll go with. I don't want to _optimize_ for that though. This is a pattern seen in a lot of games, though, where the website is only used for things like support, supplementary lore, patch notes, etc., and everything important happens in the client.

## Alternatives

Let's talk about some other alternatives and the problems I had with them. The biggest problem with a web-based approach, whether it be (Go, C#, OtherServerLanguage) + React, or Blazor, is that it doesn't have that native feel. Electron is a way to embed web in native, but it's heavy; it's essentially just a separate instance of Google Chrome (technically Chromium) wrapped in a native window. I've worked with Electron in the past, but I am not a fan. I don't like the bloat.

The other issue is that using JS (or C#, in Blazor's case) for these bits is that it isn't actually directly compatible with Unity. Like I mentioned above, Unity C# is a separate beast. To do Unity right generally means making use of Unity's GameObject and Component model. So anything done outside of Unity like this needs boilerplate serialization/deserialization layers.

## Unity UI - Too primative?

Unity's UI ecosystem is a little convoluted at first. There are several, including a newer UIElements that is still in preview. I've been using the built-in Unity UI system that has TextMeshPro, etc., and it's actually not so bad! For simple things, at least. I tried my hand at building a custom Tree View for a data editor, and it's not _tough_. Luckily, there are assets like these [New UI Widgets](https://assetstore.unity.com/packages/tools/gui/new-ui-widgets-27226), which are awesome, and then I can get to the important parts!

## Standalone App?

If, for example, I wanted the level editor to be distributable or launchable independently of the game, which is likely, doing it in Unity works out. It can be extracted from the rest of the Unity project since it'd be a separate Scene within the game.

## Conclusion

I've decided to build all the game UIs directly in-engine, in Unity! Certain screens might need to be reinvented for the website eventually, and others can run as Unity native in-browser, such as the level editor. This way, Evades sticks not to just C#, but Unity C#, and only one primary way of creating user interfaces. 

One added benefit of this is that the more I do in Unity, the better I get at it. And I'm getting pretty good now!

## Got any screenshots to share?

Not yet! But stay posted :)
    

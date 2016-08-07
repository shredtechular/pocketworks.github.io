---
title: Pocketworks - Mobile solutions for sales
date: 2014-06-28 00:00:01 Z
layout: blog
type: Blog
author: Tobin Harris
description: Pocketworks - Mobile solutions for sales
blog-title: git2pdf - get your GitHub issues on the wall
image: "/images/git2pdf/git2pdf-printed.jpg"
---

*WARNING: This post is for geeks and technical folk*

We've just created an open source tool to help people visualise their project tasks. It's called git2pdf. It's a simple command line tool to print your github issues, so you can get them out of the dark depths of Github and onto your wall.

It's aimed at anyone managing their creative projects with Github. It helps you visualize our work by making git easy to print you github issues

<!--more-->

## Why?

At Pocketworks, we tend to put *everything* into [github](http://github.com) - features, bugs, tasks and amends. So this nifty tool means we can get that info out onto our card wall quickly.

We're also big fans of Kanban, and particularly visualising our work so we can see bottlenecks. git2pdf allows us to get issues out of Github and onto the wall.

*Nine Kanban cards printed on an A4 sheet, ready to be cut into cards*

![Picture showing a printout of git2pdf]({{ site.baseurl }}/images/git2pdf/git2pdf-printed.jpg){: .img-responsive .thumbnail}

## Use it!

To get started, just do this in your bash prompt - only tested on Mac and Ruby 2.1:

    gem install git2pdf

Usage is a bit like this:

    git2pdf gen pocketworks/amber-ios -u tobinharris -p

You can do multiple repositories, and specifiy organisation separately

    git2pdf gen "amber-ios, amber-android" -o pocketworks -u tobinharris -p

See [our public github repo](http://github.com/pocketworks/git2pdf) for more up to date and . It's only in BETA at the moment, so expect wrinkles `:)`

The general process is that you install it, then tell it what repo(s) to print. Then, you use the Mac PDF preview to remove the cards you don't want. The printout looks like this image.

It's great for companies that use [Kanban](http://en.wikipedia.org/wiki/Kanban) or scrum.

*Kanban cards printed and chopped up*

![Picture showing a printout of git2pdf]({{ site.baseurl }}/images/git2pdf/git2pdf-printed-chopped.jpg){: .img-responsive .thumbnail}

*On the task board...*

![Picture showing a printout of git2pdf]({{ site.baseurl }}/images/git2pdf/git2pdf-on-wall.jpg){: .img-responsive .img-round .thumbnail}

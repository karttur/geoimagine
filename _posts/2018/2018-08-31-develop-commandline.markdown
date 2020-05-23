---
layout: article
title: Git commandline
categories: develop
excerpt: Install Git command line tool
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-08-31 T18:17:25.000Z'
modified: '2020-02-11 T18:17:25.000Z'
comments: true
share: true
figure15: github-framework_karttur_15_new-other
figure16: github-framework_karttur_16_pydev-package
figure17: github-framework_karttur_17_pydev-package2
---

## Introduction

Joint or shared (coding) projects benefit largely from a repository service that keeps track of versions and changes. Git, initially developed by Linus Torvalds for creating Linux OS, is today the most widely used distributed version control system. This post summarises how to install the command-line tool <span class='terminalapp'>git</span> for Git control.

There are two ways two securely connect from a local (machine) Git and an online [GitHub](https://github.com) repository: HTTPS or SSH. At time of updating this post (February 2020) the HTTPS solution is recommended on the GitHub help page [Set up Git](https://help.github.com/en/articles/set-up-git). Only HTTPS is covered in this post.

## Setup Git for command-line use

Check out if you have the command line tool for
[Git](https://git-scm.com) installed by opening a <span class='app'>Terminal</span> window and type:

<span class='terminal'>$ git version</span>

If your system does not have git installed you can install it via [<span class='app'>GitHub Desktop</span>](https://desktop.github.com) or download it from the [git official download page](https://git-scm.com/downloads).

If your version is outdated compared to the [git official download page](https://git-scm.com/downloads), you can instead use git itself for updating:

<span class='terminal'>$ git clone https://github.com/git/git</span>

### Check and setup user name

Every Git repository is linked to a user name. If you only have one Git user you can add a global user name to your local machine Git. If you have more than one Git user you can set the user name in each local repository (folder containing hidden <span class='file'>.git</span> system). For more information, here is the link to the GitHub page [Setting your username in Git](https://help.github.com/en/articles/setting-your-username-in-git).

#### Global Git user names

To check if you have a global Git user name set, open a <span class='app'>Terminal</span> window and type:

<span class='terminal'>$ git config \-\-global user.name</span>

If you had no global user but require one, set the Git global user name with the command:

<span class='terminal'>$ git config \-\-global user.name _username_</span>

#### Local (repository) user names

To set local (per repo) user names you have to sequentially change directory <span class='terminal'>cd</span> to each repo and then check/set the user name.

<span class='terminal'>$ git config user.name</span>

<span class='terminal'>$ git config user.name _repo-username_</span>

### Check and set email

See the official GitHub page on [Setting your commit email address](https://help.github.com/en/articles/setting-your-commit-email-address) to understand your alternatives for open or restricted email addresses.

The principles for setting your Git email address is similar to setting the Git user name. Here is, for example, how to check and set a global email:

<span class='terminal'>git config \-\- user.email</span>

<span class='terminal'>$ git config \-\- user.email _email@example.com_</span>

For local (per repo) setting of email you have to sequentially change directory to each local repo for which to set the email.

### Password

There are different options regarding how to set your password if you are cloning using HTTPS. If you use the <span class='app'>GitHub Desktop</span> app for pulling, committing and pushing staged changes, you do not need a separate Git password. The same is true if you use, for example, <span class='app'>Eclipse</span> for cloning. In both cases your password will be stored by the app you use. You can also choose to give the password each time it is requested by Git. The last option is [Caching your GitHub password in Git](https://help.github.com/en/articles/caching-your-github-password-in-git) as explained on the official help pages of GitHub.

### Try it out

To try <span class='terminalapp'>git</span> out and learn about Git control on [GitHub.com](https://github.com/) the youtube video [Github Tutorial For Beginners](https://www.youtube.com/watch?v=0fKg7e37bQE) is instructive.

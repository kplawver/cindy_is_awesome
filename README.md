# Cindy Is Awesome

And you can help remind her how awesome we all think she is!

## Contributing

If you'd like to share a story and/or photo, there are a few ways to do it:

* Send an email to kevin@lawver.net with your story and photos and I'll post it for you.
* Create a [new issue](https://github.com/kplawver/cindy_is_awesome/issues/new) with the story and photo and I'll add it.
* Create a pull request with your post added. I'll merge it and deploy it.

## Setup

* This thing is built on [Hugo](https://gohugo.io), so you'll need to install it. That's pretty easy.
* As of right now, we're using the Ananke theme, which is installed as a git submodule, so once you checkout this repo, you'll need to run `git submodule update --init --recursive` in the directory.
* Once you've install hugo and fetched the theme, you can see things by running `hugo serve -D` and then pointing your favorite browser to [ye olde localhost](http://localhost:1313)

## Cleanup

* The repo is pretty big (over 800mb), so you'll want to run `hugo --gc` especially if you've been messing with resizing images.
* We don't store the `public` or `resources` directories in git because they're generated, so the first time you run things, it might take a sec to resize all the images.  If you're done playing around, you can delete those two directories to clean up hard drive space.

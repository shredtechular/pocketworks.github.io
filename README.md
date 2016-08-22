# [pocketworks](http://www.pocketworks.co.uk/) Source Code

This is the source code of the pocketworks website built using [Jekyll](http://jekyllrb.com) and utilizing Netlify to publish and host the site.

Current Build Status is: [![Build Status](https://secure.travis-ci.org/pocketworks/pocketworks-web.png?branch=master)](https://travis-ci.org/pocketworks/pocketworks-web)



## Local Development

1. Install dependencies `bundle install`
2. Run Jekyll server to preview in development mode `jekyll serve -w`.
3. View the generated site by going to [http://localhost:4000/](http://localhost:4000/)

## Site Structure

| Directory | Description |
| ------------- |:------------- |
| _data | Directory contains yml files that contain content that is not within individual pages or posts. |
| _includes | Contains several partials that are common to several generated pages. |
| _layouts | Contains the templates that are used to generate the commonality of the pages (default is the main one that all the pages use. |
| _pages | Contains all non-blog post pages. |
| _posts | Contains all of the individual story entries. |
| css | Contains the css for the project. |
| fonts | Contains the customized font libraries for the project. |
| js | Contains the js libraries for the project. |
| images | Contains all the image files for the site |

## Code Standards

This section highlights the coding standards to be used for this project to ensure consistency across the codebase for current and future development

### Filename conventions

- Should be all lowercase and words are concatenated with a hypen

### Variable naming conventions

- All yml frontmatter keys should be lowercase and words concatenated with a hyphen

### Liquid

- All liquid variables are following an underscore pattern so they can be easier to differentiate from yml frontmatter variables
- All liquid tags, objects, and filtesr will have spaces in front of and following whatever is contained within braces

### Deployments

Travis is configured (via .travis.yml) to take the following actions after a push:

- Build a static Jekyll site from the source.
- Run HTML Proofer to validate the HTML of the generated site.
- Deploy the built site to Netlify.

In order to deploy to Netlify, the following steps were taken:
1. A Netlify site must first be initially setup.  The site at Netlify is under an open source account so it was setup to be able to also interact with the GitHub repository.
2. The steps to then move the generated website from Travis over to Netlify is contained in `/scripts/deploy.sh`.  As you can see the generated site is first zipped up and then sent over to Netlify via cURL.  In order to do this securely, you will notice a `$NETLIFYKEY` variable in the shell script.  That key was initially setup in Netlify and is now stored as an environment variable in Travis so the key is not under version control anywhere.  If the key needs to be regenerated for any reason, the key is setup here: https://app.netlify.com/applications/personal under the repository's admin account.  Then in Travis, the generated key can be put into the repositories settings with a name of "NETLIFYKEY".

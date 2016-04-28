# Google App Engine Standard Environment Images Sample

This sample demonstrates how to use the Images Java API.

See the [Google App Engine standard environment documentation][ae-docs] for more
detailed instructions.

[ae-docs]: https://cloud.google.com/appengine/docs/java/

## Setup
1. Update the `<application>` tag in `src/main/webapp/WEB-INF/appengine-web.xml`
   with your project name.
1. Update the `<version>` tag in `src/main/webapp/WEB-INF/appengine-web.xml`
   with your version name.
1. Create the Default Cloud Storage Bucket on the AppEngine Setting page for your project
   https://console.cloud.google.com/appengine/settings

## Running locally
    $ mvn appengine:devserver

## Deploying
    $ mvn appengine:update

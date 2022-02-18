# Asciidoc Mix Task
I've always really liked using [Asciidoctor](https://asciidoctor.org/) to generate internal documentation.  While ex_doc is really great, 
I like the portability and available plugins for Asciidoctor.  This is definitely not meant to replace ex_doc as
it has it's place, and I think asciidoc has it's own purposes.

I'm also a big fan of [PlantUML](https://plantuml.com/), so I've set the tasks to generate any included PlantUML files.

Mix tasks to clean, generate, and copy asciidoc generated documents.

This project is meant to be a starting point, so just copy it, and tweak for your own needs!

## Requirements
1. Docker
2. An elixir project using Mix.
3. rsync

## Setup
1. Copy `asciidoc.ex` to `lib/mix/tasks`
1. Create a folder named `asciidoc` in the root of your project.
1. Create `asciidoc/index.adoc`, and add some asciidoc markdown to it.   

## mix asciidoc.generate
This task will use the [asciidoctor/docker-asciidoctor](https://github.com/asciidoctor/docker-asciidoctor/blob/main/README.adoc) docker container 
to generate the output, so you don't need to install any asciidoctor libraries locally.  It also has the ability to use many different plugins out
of the box.

Output by default is HTML, but this can easily be modified to other output formants, just read up on Asciidoctor.

Output is sent to `asciidoc/generated`, so be sure to add this to your `.gitignore` file.

## mix asciidoc.copy
This task will rsync generated output from `asciidoc/generated/` to `priv/static/asciidoc`.
If you're using a web framework like Phoenix, you'll need to add or configure a `Plug.Static` plug to serve the files.

## mix asciidoc.clean
This task will remove `asciidoc/generated` and `asciidoc/static/asciidoc`

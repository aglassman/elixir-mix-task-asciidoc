defmodule Mix.Tasks.Asciidoc.Clean do
  @moduledoc """
  Cleans ./asciidoc/generated and ./priv/static/asciidoc/
  """
  @shortdoc "Cleans generated asciidoc."

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    Mix.shell().info("Cleaning Asciidoc - start")
    Mix.shell().cmd("rm -rf ./asciidoc/generated")
    Mix.shell().cmd("rm -rf ./priv/static/asciidoc")
    Mix.shell().info("Cleaning Asciidoc - complete")
  end
end

defmodule Mix.Tasks.Asciidoc.Generate do
  @moduledoc """
  Runs script ./asciidoc/generate-asciidoc.sh, outputs to ./asciidoc/generated
  """
  @shortdoc "Generates asciidoc markup to HTML."

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    Mix.shell().info("Generating Asciidoc - start")\
    Mix.shell().cmd("docker run -v $PWD:/documents/ asciidoctor/docker-asciidoctor asciidoctor -r asciidoctor-diagram -D /documents/asciidoc/generated asciidoc/src/index.adoc")
    Mix.shell().info("Generating Asciidoc - complete")
  end
end

defmodule Mix.Tasks.Asciidoc.Copy do
  @moduledoc """
  Copies generated asciidoc to priv/static/asciidoc
  """
  @shortdoc "Copies generated asciidoc to priv/static/asciidoc."

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    Mix.shell().info("Copying Asciidoc - start")
    Mix.shell().cmd("mkdir -p priv/static/asciidoc")
    Mix.shell().cmd("rsync -a asciidoc/generated/ priv/static/asciidoc/ --exclude=.asciidoctor -v")
    Mix.shell().info("Copying Asciidoc - complete")
  end
end

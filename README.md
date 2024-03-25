# GeminiShell

GeminiShell is a powerful terminal application that uses the Gemini API to bring the power of Google's Gemini AI to your fingertips. With GeminiShell, you can:

* **Easily access and interact with your Gemini AI.** Just type in your query and GeminiShell will do the rest.
* **Get help with coding, debugging, and other tasks.** Gemini AI can answer your questions and provide helpful suggestions.
* **Automate repetitive tasks.** Gemini AI can generate automation scripts which you will be able to run right away with the press of a button.

## Getting Started

To get started with GeminiShell, you will need to:

2. **Create a Gemini API key.** You can create a Gemini API key by following the instructions on the [Gemini website](https://makersuite.google.com/app/apikey).
1. **Install GeminiShell.** Check out the Installation Instructions below.
3. **Configure GeminiShell.** The installtion process creates a configuration file in `$XDG_DESKTOP_HOME/.config/geminishell/config.toml`. Check out the things you can configure [here](https://example.com) (not yet implemented)

## Installation
Setting up GeminiShell is a very easy process if you are on linux.
The setup contains creating a python environment, creating a binary, and linking it to your local binaries location (usually `~/.local/bin`)

To install geminishell:
```bash
git clone https://github.com/kshitijaucharmal/geminishell
cd geminishell
chmod +x install.sh
./install.sh
```

The setup script is very easy to understand, so you can change it to include anything else, or change it to fit your needs :)

## Using GeminiShell

Once you have configured GeminiShell, you can start using it to interact with the Gemini AI. To do this, type this:
```bash
geminishell -p "Hey Gemini !"
```

Geminishell can read from stdin. This is possible by just piping the information into geminishell as follows:
```bash
ls | geminishell -p "Give me instructions on how to clean my home folder"
tree . | geminishell -p "Give me the best folder structure for a python project based on my existing one."
```

You can also use geminishell interactively! This allows geminishell to remember information while you are in the chat.
```bash
geminishell -i
>>> Provide a definition for moulting.
Moulting is the process of shedding the outer layer of the skin or covering
, along with any associated structures, such as hair, feathers, or antlers. It is a natural process that occurs in many animals, including reptiles, birds,
 mammals, and arthropods. Moulting allows animals to replace old or damaged coverings with new ones, as well as to get rid of parasites and other debris that may have accumulated on the surface of the body.
>>> Which animals undergo this process?
Many animals undergo the process of moulting, including:
* **Arthropods:
    * Insects (e.g., butterflies, beetles, cockroaches)
    * Arachnids (e.g., spiders, scorpions,
 ticks)
    * Crustaceans (e.g., crabs, lobsters, shrimp)
# And so on..
```

## Plugins

Geminishell does not currently have a plugins system. Help me build it ;)

## Contributing

GeminiShell is an open source project and we welcome contributions from the community. If you would like to contribute to GeminiShell, just fork the repo and send me a pull request with your changes !!
Issues are most welcome too! Draft an issue in the issues section if you face any.


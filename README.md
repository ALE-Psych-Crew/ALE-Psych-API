# ALE Psych API Docs

This repo generates the API documentation site for ALE Psych with Haxe and Dox.

## Build Locally

Install Haxe/Haxelib, then run:

```bat
build.bat
```

That script:

1. clones/uses `ALE-Psych`
2. generates `ALE-Psych/docs.xml` from `xmlGenerator.hxml`
3. generates HTML into `docs/`
4. opens `docs/index.html`

## Theme Customization

The active theme is configured in `DocsGenerator.hx`:

```haxe
config.loadTheme('themes/ale-psych');
```

The custom theme lives in `themes/ale-psych/`.

`themes/ale-psych/config.json` inherits from Dox's default theme:

```json
{
  "parentTheme": "default",
  "headerIncludes": ["ale-psych.css"]
}
```

That means Dox keeps the normal default layout and templates, then loads the ALE Psych CSS from `themes/ale-psych/resources/ale-psych.css`.

For small visual changes, edit only:

```text
themes/ale-psych/resources/ale-psych.css
```

For bigger layout changes, add template files under:

```text
themes/ale-psych/templates/
```

Dox will use matching files from this theme before falling back to the default theme.

## Dox Metadata

`DocsGenerator.hx` also sets Dox metadata:

```haxe
config.pageTitle = 'ALE Psych API';
config.defines.set(Define.ThemeColor, '0x7D4CFF');
config.defines.set(Define.TextColor, '0xF4F7FF');
config.defines.set(Define.Website, 'https://github.com/ALE-Psych-Crew/ALE-Psych');
config.defines.set(Define.Description, 'API documentation for ALE Psych.');
config.defines.set(Define.SourcePath, 'https://github.com/ALE-Psych-Crew/ALE-Psych/blob/main/source/');
```

Change these when the public docs title, colors, source links, or project description need to change.

## What Gets Documented

`xmlGenerator.hxml` controls the ALE Psych source and compiler setup used to generate documentation XML. Add or remove `-lib` entries, `-D` flags, and filters there when the API surface changes.

# Jekyll Miscellaneous

[![Gem Version](https://badge.fury.io/rb/jekyll_miscellaneous.svg)](https://badge.fury.io/rb/jekyll_miscellaneous) [![codecov](https://codecov.io/gh/kinduff/jekyll_miscellaneous/branch/main/graph/badge.svg?token=VWB60QW0UV)](https://codecov.io/gh/kinduff/jekyll_miscellaneous)

A collection of opinionated plugins for Jekyll.

## How to install

Install the gem:

```
gem install jekyll_miscellaneous
```

Or add it to your Gemfile. You can use `bundle add jekyll_miscellaneous`.

Then use the plugin in your Jekyll's `_config.yml` file.

```
plugins:
  - jekyll_miscellaneous
```

## How to use

This gem includes multiple Jekyll or Liquid plugins that you can use immediately without further configuration.

- Tags
  - [YouTube](#youtube)
- Filters
  - [Base64 Encode](#base64-encode)
  - [Base64 Decode](#base64-decode)
  - [Hash Color](#hash-color)
  - [Regex Replace](#regex-replace)
  - [Clean URLs](#clean-urls)
  - [Truncate](#truncate)
  - [URI Encode](#uri-encode)
- Hooks
  - [External Links](#external-links)
  - [Mark](#mark)

More to come.

### YouTube

Given:

```liquid
{% youtube "dQw4w9WgXcQ" %}
```

Will output:

```html
<div class="youtube-container">
  <iframe src="https://www.youtube-nocookie.com/embed/dQw4w9WgXcQ"></iframe>
</div>
```

### Base64 Encode

Given:

```liquid
{% 'Hello, World!' | base64_encode %}
```

Will output:

```
SGVsbG8sIFdvcmxkIQ==
```

### Base64 Decode

Given:

```liquid
{% 'SGVsbG8sIFdvcmxkIQ==' | base64_decode %}
```

Will output:

```
Hello, World!
```

### Hash Color

Given:

```liquid
{% 'Hello, World!' | hash_color %}
```

Will output:

```
hsl(349, 100%, 90%)
```

### Regex Replace

Given:

```liquid
{% 'Hello, World!' | regex_replace '$Hello', 'Goodbye' %}
```

Will output:

```
Goodbye, World!
```

### Clean URLs

Given:

```liquid
{% 'Hello, http://example.com World!' | clean_urls %}
```

Will output:

```
Hello, World!
```

### Truncate

Given:

```liquid
{% 'Hello, World!' | truncate 10 %}
{% 'Hello, World!' | truncate 10 ',' %}
{% 'Hello, World!' | truncate 10 ',' '!' %}
```

Will output:

```
Hello, ...
Hello...
Hello!
```

### URI encode

Given:

```liquid
{% 'Hello, World!' | uri_encode %}
```

Will output:

```
Hello%2C%20World%21
```

### External links

With the configuration:

```yaml
base_url: https://kinduff.com
```

Given:

```html
<p>
  Link to the
  <a href="https://example.com">example</a>.
</p>
```

Will output:

```html
<p>
  Link to the
  <a href="https://example.com" rel="external" target="_blank">example ⧉</a>.
</p>
```

More in the documentation.

### Mark

Given:

```markdown
Hello, ==World==!
```

Will output:

```html
<p>Hello, <mark>World</mark>!</p>
```

## Contributing

1. Fork it (`https://github.com/kinduff/jekyll_miscellaneous/fork`).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Commit your changes (`git commit -am "Add some feature"`).
4. Push to the branch (`git push origin my-new-feature`).
5. Create new Pull Request.

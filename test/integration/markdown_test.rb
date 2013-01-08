require 'test_helper'
require 'tilt'

class MarkdownTest < Test::Unit::TestCase

  def render(file)
    template = Tilt.new(file)
    html     = template.render
    format_html(html)
  end

  def format_html(html)
    html.strip!
    html.gsub! /\n+/, "\n      "
    %Q(      #{html}\n)
  end

  def test_examples
    html = render('test/fixtures/markdown/example.md')
    assert_equal <<-HTML, html
      <div class="livingstyleguide--example">
        <button class="button">Test</button>
      </div>
    HTML
  end

  def test_text
    html = render('test/fixtures/markdown/text.md')
    assert_equal <<-HTML, html
      <h2 class="livingstyleguide--headline">Hello World</h2>
      <p class="livingstyleguide--paragraph">Lorem ipsum <strong>dolor</strong> sit amet, consectetur adipiscing elit. Sed a pulvinar turpis.</p>
      <ul class="livingstyleguide--unordered-list">
      <li class="livingstyleguide--unordered-list-item">Lorem</li>
      <li class="livingstyleguide--unordered-list-item">Ipsum</li>
      <li class="livingstyleguide--unordered-list-item">Dolor</li>
      </ul>
      <h3 class="livingstyleguide--sub-headline">More Lorem</h3>
      <ol class="livingstyleguide--ordered-list">
      <li class="livingstyleguide--ordered-list-item">Lorem</li>
      <li class="livingstyleguide--ordered-list-item">Ipsum</li>
      <li class="livingstyleguide--ordered-list-item">Dolor</li>
      </ol>
    HTML
  end

  def test_code
    html = render('test/fixtures/markdown/code.md')
    assert_equal <<-HTML, html
      <pre class="livingstyleguide--code-block"><code class="livingstyleguide--code"><b><i>.my-class</i></b> {
        <b>color:</b> <b>red</b>;
      }</code></pre>
    HTML
  end

end

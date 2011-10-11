module ApplicationHelper
  # File actionpack/lib/action_view/helpers/text_helper.rb, line 111
  def highlight(text, phrases, *args)
    options = args.extract_options!
    unless args.empty?
      options[:highlighter] = args[0] || '<strong class="highlight">\1</strong>'
    end
    options.reverse_merge!(:highlighter => '<strong class="highlight">\1</strong>')

    text = sanitize(text) unless options[:sanitize] == false
    if text.blank? || phrases.blank?
      text
    else
      match = Array(phrases).map { |p| "\\b#{Regexp.escape(p)}\\b" }.join('|')
      text.gsub(/(#{match})(?!(?:[^<]*?)(?:["'])[^<>]*>)/i, options[:highlighter])
    end.html_safe
  end
end

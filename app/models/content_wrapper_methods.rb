module ContentWrapperMethods
  def parsed_tags
      # le tags "#id.class > p" est stocké dans un tableau de la forme :
      # [
      #   [
      #     :div,
      #     "id",
      #     "class"
      #     ],
      #   [
      #     :p,
      #      nil,
      #      nil
      #      ]
      # ]
      @parsed_tags = []

      # eliminer les caractères indésirables
      # et prendre les niveaux
      levels = self.tags.downcase.gsub(/[^-_a-z0-9#. ]/,"").split(" ")
      levels.each do |level|
        @parsed_tags << parse_tag(level)
      end
    @parsed_tags
  end

  def for_surround
    pt = parsed_tags
    front = ""
    back = ""
    pt.each do |tags|
      front = "#{front}<#{tags[0].to_s}#{tags[1] ? " id='#{tags[1]}'" : "" }#{tags[2] ? " class='#{tags[2]}'" : "" }>"
      back = "</#{tags[0].to_s}>#{back}"
    end
    [front.html_safe, back.html_safe]
  end

  def parse_tag(div)
    tag = nil
    id = nil
    classes = nil
    if div =~ /#/
      tag, id_with_classes = div.split("#")
      id, *classes = id_with_classes.split(".")
    else # il n'y a pas de id
      tag, *classes = div.split(".")
    end
    tag = tag.empty? ? :div : tag.to_sym
    [ tag, id, classes * " " ]
  end
end

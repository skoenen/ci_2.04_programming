module SlideServer
  module Helper

    module ContentHelper
      def partial_for(file)
        @@template ||= "template"
        @@partials ||= "partials"

        File.new(File.join(@@template, @@partials, file)).read
      end

      def slide &block
        @@slide_partial ||= Haml::Engine.new(partial_for("slide.haml"))

        @@slide_partial.render(Object.new, {}, block)
      end

      def blockcite(caption, src, &block)
        @@blockcite_partial ||= Haml::Engine.new(partial_for("blockcite.haml"))

        @@blockcite.render(Object.new, {caption: caption, src: src}, block)
      end

      def code(language, &block)
        @@code_partial ||= Haml::Engine.new(partial_for("code.haml"))

        @@code_partial.render(Object.new, {language: language}, block)
      end

      def definition(name, block)
        @@definition_partial ||= Haml::Engine.new(partial_for("definition.haml"))

        @@definition_partial.render(Object.new, {name: name, block: block})
      end

      def image(name, source, img_url)
        @@image_partial ||= Haml::Engine.new(partial_for("image.haml"))

        @@image_partial.render(Object.new, {name: name, credit: source, src: img_url})
      end
    end

  end
end


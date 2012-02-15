module Rails
  module Generators
    module Actions

      @url_name;

      def dirname; File.dirname(__FILE__); end

      def eliminar_comentarios(path)
        gsub_file path, /#.*\n/, "\n"
        gsub_file path, /\n\n+/, "\n\n"
      end

      def corroborar(pregunta) 
        aprobado = false
        while not aprobado do
          name = ask(pregunta)
          aprobado = yes?("Eligio '#{name}' Esta seguro? (y/n)")
        end
        name
      end

      def local_path(name)
        File.join dirname, "#{name}"
      end

    end
  end
end

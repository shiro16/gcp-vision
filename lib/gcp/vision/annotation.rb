module Gcp
  module Vision
    class Annotation
      attr_reader :annotations

      def initialize(result)
        @annotations = {}
        result.each do |type, annotations|
          @annotations[type] = case type
                              when "labelAnnotations"
                                annotations.map { |annotation| Label.new(annotation) }
                              when "imagePropertiesAnnotation"
                                annotations["dominantColors"]["colors"].map { |annotation| ImageProperty.new(annotation) }
                              else
                                annotations
                              end
        end
      end

      class Label
        attr_reader :mid, :description, :score

        def initialize(annotation)
          @mid         = annotation["mid"]
          @description = annotation["description"]
          @score       = annotation["score"]
        end
      end

      class ImageProperty
        attr_reader :color, :score, :pixel_fraction

        def initialize(annotation)
          @color          = annotation["color"]
          @score          = annotation["score"]
          @pixel_fraction = annotation["pixelFraction"]
        end
      end
    end
  end
end

module CarouselHelper
	def carousel_for(images)
		unless images == []		
			Carousel.new(self, images).html
		end
	end

	class Carousel
		def initialize(view, images)
			@view, @images = view, images
			@uid = SecureRandom.hex(6)
		end

		def html
			content = safe_join([indicators, slides, controls])
			options = {
				id: uid,
				class: 'carousel slide',
				data: {
					ride: 'carousel'
				}
			}
			content_tag(:div, content, options)
		end

		private

		attr_accessor :view, :images, :uid
		delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

		def indicators
			items = images.count.times.map { |index| indicator_tag(index) }
			content_tag(:ol, safe_join(items), class: 'carousel-indicators')
		end

		def indicator_tag(index)
			options = {
				class: (index.zero? ? 'active' : nil ),
				data: {
					target: "##{uid}",
					slide_to: index
				}
			}

			content_tag(:li, '', options)
		end

		def slides
			items = images.map.with_index { |image, index| slide_tag(image, index.zero?) }
			content_tag(:div, safe_join(items), class: 'carousel-inner')
		end

		def slide_tag(image, is_active)
			options = {
				class: (is_active ? 'carousel-image carousel-item active' : 'carousel-image carousel-item'),
			}

			content_tag(:div, image_tag(image), options)
		end

		def controls
			safe_join([control_tag('prev'), control_tag('next')])
		end

		def control_tag(direction)
			options = {
				class: "carousel-control-#{direction}",
				role: "button",
				data: { 
					slide: direction
				}
			}
			control = link_to((control_span_1(direction) + control_span_2(direction)), "##{uid}", options)
		end

		def control_span_1(direction)
			span_1_options = {
				class: "carousel-control-#{direction}-icon",
				aria: {
					hidden: "true"
				}
			}
			span_1 = content_tag(:span, '', span_1_options)
		end

		def control_span_2(direction)
			span_2_label = (direction == 'prev' ? 'Previous' : 'Next')
			span_2 = content_tag(:span, "#{span_2_label}", class: 'sr-only')
		end
	end
end

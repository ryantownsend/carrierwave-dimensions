require "carrierwave"

module CarrierwaveDimensions
	module Processor
		def self.included(base)
			base.extend(ClassMethods)
			base.send(:include, InstanceMethods)
		end

		module ClassMethods
			def store_dimensions(options = {})
				process store_dimensions: options
			end
		end

		module InstanceMethods
			def store_dimensions(*args)
				options = args.inject({}) do |result,arr|
					result.merge(arr[0] => arr[1])
				end

				width_column = options[:width_column] ||
					(options[:columns] && "#{options[:columns]}_width") ||
					"#{mounted_as}_#{version_name || "default"}_width"
				height_column = options[:height_column] ||
				  (options[:columns] && "#{options[:columns]}_height") ||
				  "#{mounted_as}_#{version_name || "default"}_height"

				if model
					width, height = `identify -format "%wx%h" #{file.path}`.split(/x/)
					model.send("#{width_column}=", width.strip.to_i)
					model.send("#{height_column}=", height.strip.to_i)
				end
			end
		end
	end
end

CarrierWave::Uploader::Base.send(:include, CarrierwaveDimensions::Processor)
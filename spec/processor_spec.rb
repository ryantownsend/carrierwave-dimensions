require "spec_helper"
require_relative "../lib/carrierwave_dimensions/processor"

class TestUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick

	process store_dimensions: {
		width_column: :image_width,
		height_column: :image_height
	}
end

class UploadModel
	attr_accessor :image_width, :image_height
end

describe CarrierwaveDimensions::Processor do
	describe "processing images" do
		subject do
			TestUploader.new(model, :remote_file)
		end

		let(:model) { UploadModel.new }
		let(:image_file) { nil }

		before(:each) do
			TestUploader.enable_processing = true
			subject.store!(File.open(image_file))
		end

		after(:each) do
			subject.remove!
			TestUploader.enable_processing = false
		end

		context "given a semi-transparent image" do
			let(:image_file) do
				File.new(File.join(File.dirname(__FILE__), "data/mac-mini.png"))
			end
			
			before(:each) do
				subject.recreate_versions!
			end

			it "should set the width on the model" do
				expect(subject.model.image_width).to eq 776
			end
			
			it "should set the height on the model" do
				expect(subject.model.image_height).to eq 325
			end
		end
	end
end
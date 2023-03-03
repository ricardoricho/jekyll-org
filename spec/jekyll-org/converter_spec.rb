require 'spec_helper'

module Jekyll
  module Converters
    RSpec.describe Org do
      describe 'new' do
        it 'receives a string as text to convert' do
          expect(Org.new('Text')).not_to be_nil
        end
      end

      describe 'matches' do
        let(:converter) { Org.new('file') }

        it 'matches .org extension' do
          expect(converter.matches('.org')).to be_truthy
        end

        it 'not match other extensions' do
          expect(converter.matches('.org.txt')).to be_falsy
          expect(converter.matches('.html')).to be_falsy
          expect(converter.matches('.yorg')).to be_falsy
        end
      end

      describe 'output_ext(ext)' do
        let(:converter) { Org.new('file') }

        it { expect(converter.output_ext(nil)).to eq '.html' }
      end
    end
  end
end

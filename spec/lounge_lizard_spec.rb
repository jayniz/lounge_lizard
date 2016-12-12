require 'spec_helper'
require 'json'

describe LoungeLizard do

  it 'has a version number' do
    expect(LoungeLizard::VERSION).not_to be nil
  end

  describe '.parse' do

    it 'can parse a mson string into a hash representing an ast' do
      result = LoungeLizard.parse("# XXXX\ndescription for it")
      mson_ast = JSON.parse(result)
      expect('XXXX').to eq mson_ast['content'].first['meta']['title']
      expect('description for it').to eq  mson_ast['content'].first['content'].first['content']
    end

    context 'with invalid msons' do
      it 'does not raise an error when the mson is invalid' do
        expect(LoungeLizard.parse('Thi;lhBABBLINGad\'')).not_to be_empty
      end

      it 'returns nil when nil is passed' do
        expect(LoungeLizard.parse(nil)).to be_nil
      end
    end
  end
end

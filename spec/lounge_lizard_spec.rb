require 'spec_helper'

describe LoungeLizard do

  it 'has a version number' do
    expect(LoungeLizard::VERSION).not_to be nil
  end

  describe '.parse' do

    it 'can parse a mson string into a hash representing an ast' do
      mson_ast = LoungeLizard.parse("# XXXX\ndescription for it")
      expect('XXXX').to eq mson_ast['content'].first['meta']['title']
      expect('description for it').to eq  mson_ast['content'].first['content'].first['content']
    end

    context 'with invalid msons' do
      it 'does not raise an error when the mson is invalid' do
        expect { LoungeLizard.parse('Thi;lhBABBLINGad\'') }.not_to raise_error
      end

      it 'does not raise an error when the mson is nil' do
        expect { LoungeLizard.parse(nil) }.not_to raise_error
      end
    end
  end
end

#spec/caesar_spec.rb

require './lib/caesar-cipher.rb'

describe Message do
  describe '#caesar_cipher' do
    it 'moves message characters forward' do
      message = Message.new('hi')
      expect(message.caesar_cipher(1)).to eql('ij')
    end

    it 'moves message characters backward' do
      message = Message.new('hi')
      expect(message.caesar_cipher(-1)).to eql('gh')
    end

    it 'works on capital letters' do
      message = Message.new('ABC')
      expect(message.caesar_cipher(3)).to eql('DEF')
    end

    it 'keeps the case' do
      message = Message.new('abC')
      expect(message.caesar_cipher(3)).to eql('deF')
    end

    it 'goes to the beginning when alphabet index is too high' do
      message = Message.new('xYz')
      expect(message.caesar_cipher(3)).to eql('aBc')
    end

    it 'goes to the end when alphabet index is too low' do
      message = Message.new('abC')
      expect(message.caesar_cipher(-3)).to eql('xyZ')
    end

    it 'works with numbers' do
      message = Message.new('1')
      expect(message.caesar_cipher(3)).to eql('4')
    end

    it 'does not mess up punctuation' do
      message = Message.new('Hello, my name is Carol!')
      expect(message.caesar_cipher(1)).to eql('Ifmmp, nz obnf jt Dbspm!')
    end
  end
end

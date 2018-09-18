require 'rails_helper'

describe Book, type: :model do
  subject(:book) { described_class.new(gender: gender, author: author, image: image, title: title, editor: editor, year: year) }

  let(:gender) { Faker::Book.genre }
  let(:author) { Faker::Book.author }
  let(:image) { 'ImagenFalsa123.gif' }
  let(:title) { Faker::Book.title }
  let(:editor) { Faker::Book.publisher }
  let(:year) { '2006' }

  it do
    is_expected.to be_valid
  end

  describe '#Create' do
    context 'when the user is created' do
      it 'also creates its random gender' do
        expect(book.gender).to be_present
      end

      it 'also creates its random author' do
        expect(book.author).to be_present
      end

      it 'also creates its image' do
        expect(book.image).to be_present
      end

      it 'also creates its random title' do
        expect(book.title).to be_present
      end

      it 'also creates its random editor' do
        expect(book.editor).to be_present
      end

      it 'also creates its year, 2006' do
        expect(book.year).to be_present
      end
    end

    context 'When author is nil' do
      let(:author) { nil }

      it "The user isn't created" do
        expect(book).to be_invalid
      end
    end

    context 'When gender is nil' do
      let(:gender) { nil }

      it "The user isn't created" do
        expect(book).to be_invalid
      end
    end

    context 'When image is nil' do
      let(:image) { nil }

      it "The user isn't created" do
        expect(book).to be_invalid
      end
    end

    context 'When gender is nil' do
      let(:gender) { nil }

      it "The user isn't created" do
        expect(book).to be_invalid
      end
    end

    context 'When year is nil' do
      let(:year) { nil }

      it "The user isn't created" do
        expect(book).to be_invalid
      end
    end

    context 'When editor is nil' do
      let(:editor) { nil }

      it "The user isn't created" do
        expect(book).to be_invalid
      end
    end
  end
end

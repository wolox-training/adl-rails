require 'rails_helper'

describe Book, type: :model do
  subject(:book) { described_class.new(genre: genre, author: author, image: image, title: title, publisher: publisher, year: year) }

  let(:genre) { Faker::Book.genre }
  let(:author) { Faker::Book.author }
  let(:image) { 'ImagenFalsa123.gif' }
  let(:title) { Faker::Book.title }
  let(:publisher) { Faker::Book.publisher }
  let(:year) { '2006' }

  it do
    is_expected.to be_valid
  end

  describe '#Create' do
    context 'when the user is created' do
      it 'also creates its random genre' do
        expect(book.genre).to be_present
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

      it 'also creates its random publisher' do
        expect(book.publisher).to be_present
      end

      it 'also creates its year, 2006' do
        expect(book.year).to be_present
      end
    end

    context 'When author is nil' do
      let(:author) { nil }

      it "The book isn't created" do
        expect(book).to be_invalid
      end
    end

    context 'When genre is nil' do
      let(:genre) { nil }

      it "The book isn't created" do
        expect(book).to be_invalid
      end
    end

    context 'When image is nil' do
      let(:image) { nil }

      it "The book isn't created" do
        expect(book).to be_invalid
      end
    end

    context 'When year is nil' do
      let(:year) { nil }

      it "The book isn't created" do
        expect(book).to be_invalid
      end
    end

    context 'When publisher is nil' do
      let(:publisher) { nil }

      it "The book isn't created" do
        expect(book).to be_invalid
      end
    end

    context 'When title is nil' do
      let(:title) { nil }

      it "The book isn't created" do
        expect(book).to be_invalid
      end
    end
  end
end

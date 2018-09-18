require 'rails_helper'

describe Book, type: :model do
  context 'when the book has all fields' do
    let(:book) { build(:book) }

    it { expect(book).to be_valid }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:genre) }
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:publisher) }
  end

  context 'when the title is mising' do
    let(:book) { build(:book, title: nil) }

    it { expect(book).to be_invalid }
  end
end

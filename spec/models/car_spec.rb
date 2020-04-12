require 'rails_helper'

RSpec.describe Car, type: :model do
  let!(:cars) { FactoryBot.create_list(:car, 100) }

  describe "#color_filter" do
    let!(:color_id) { Color.find_by(name: "black").id }
    subject { Car.filter(color_filter: color_id).map { |item| item.color.name } }
    it { is_expected.to all(eq('black')) }
  end

  describe "#mileage_filter" do
    let(:random) { rand(101..300) }
    subject { Car.filter(mileage_filter: random).map {|item| item.mileage } }
    it { is_expected.to all(be >= random) }
  end

  describe "#price_filter" do
    let(:random) { rand(201..300) }
    subject { Car.filter(price_filter: random).map {|item| item.price } }
    it { is_expected.to all(be >= random.to_money) }
  end

  describe "#filter" do
    context 'by color' do
      let!(:color_id) { Color.find_by(name: "black").id }
      subject { Car.filter(color_filter: color_id).map { |item| item.color.name } }
      it { is_expected.to all(eq('black')) }
    end
    context 'by mileage' do
      let(:random) { rand(401..500) }
      subject { Car.filter(mileage_filter: random).map {|item| item.mileage } }
      it { is_expected.to all(be >= random) }
    end
    context 'by price' do
      let(:random) { rand(501..600) }
      subject { Car.filter(price_filter: random).map {|item| item.price } }
      it { is_expected.to all(be >= random.to_money) }
    end
    context 'by color and mileage' do
      let(:random) { rand(601..700) }
      let!(:color_id) { Color.find_by(name: "white").id }
      subject(:result) { Car.filter(color_filter: color_id, mileage_filter: random) }
      it { expect(result.map {|item| item.mileage }).to all(be >= random) }
      it { expect(result.map {|item| item.color.name }).to all(eq('white')) }
    end
    context 'by color and price' do
      let(:random) { rand(701..800) }
      let!(:color_id) { Color.find_by(name: "white").id }
      subject(:result) { Car.filter(color_filter: color_id, price_filter: random) }
      it { expect(result.map {|item| item.price }).to all(be >= random.to_money) }
      it { expect(result.map {|item| item.color.name }).to all(eq('white')) }
    end
    context 'by mileage and price' do
      let(:random) { rand(801..900) }
      subject(:result) { Car.filter(mileage_filter: random, price_filter: random) }
      it { expect(result.map {|item| item.price }).to all(be >= random.to_money) }
      it { expect(result.map {|item| item.mileage }).to all(be >= random) }
    end
    context 'by color,mileage and price' do
      let(:random) { rand(901..1000) }
      let!(:color_id) { Color.find_by(name: "black").id }
      subject(:result) { Car.filter(color_filter: color_id, mileage_filter: random, price_filter: random) }
      it { expect(result.map {|item| item.price }).to all(be >= random.to_money) }
      it { expect(result.map {|item| item.color.name }).to all(eq('black')) }
      it { expect(result.map {|item| item.mileage }).to all(be >= random) }
    end
  end
end

# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    module Style
      describe WhileUntilDo do
        let(:cop) { WhileUntilDo.new }

        it 'registers an offence for do in multiline while' do
          inspect_source(cop, ['while cond do',
                               'end'])
          expect(cop.offences.size).to eq(1)
        end

        it 'registers an offence for do in multiline until' do
          inspect_source(cop, ['until cond do',
                               'end'])
          expect(cop.offences.size).to eq(1)
        end

        it 'accepts do in single-line while' do
          inspect_source(cop, ['while cond do something end'])
          expect(cop.offences).to be_empty
        end

        it 'accepts do in single-line until' do
          inspect_source(cop, ['until cond do something end'])
          expect(cop.offences).to be_empty
        end

        it 'it accepts multi-line while without do' do
          inspect_source(cop, ['while cond',
                               'end'])
          expect(cop.offences).to be_empty
        end

        it 'it accepts multi-line until without do' do
          inspect_source(cop, ['until cond',
                               'end'])
          expect(cop.offences).to be_empty
        end
      end
    end
  end
end

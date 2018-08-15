require_relative 'test_helper'
require 'minitest/autorun'

require 'genevalidator/hsp'
require 'genevalidator/query'

module GeneValidator
  # Test the Sequence class
  class TestQueryClass < Minitest::Test
    describe 'Test Sequence Class' do
      it 'should initialize seq tabular attributes' do
        identifier   = 'sp|Q8N302|AGGF1_HUMAN'
        accession_no = 'Q8N302'
        slen         = 714
        seq          = Query.new
        hash = { 'qseqid' => 'GB10034-PA',
                 'sseqid' => identifier,
                 'sacc'   => accession_no,
                 'slen'   => slen }

        seq.init_tabular_attribute(hash)

        assert_equal(identifier, seq.identifier)
        assert_equal(accession_no, seq.accession_no)
        assert_equal(slen, seq.length_protein)
        assert(seq.length_protein.is_a?(Integer))
      end

      it 'should initialize hsp tabular attributes' do
        qstart = '49'
        qend   = '217'
        sstart = '65'
        send   = '247'
        length = '183'
        qframe = '1'
        pident = '34.43'
        nident = '63.0'
        evalue = '8.0e-12'
        qseq   = 'ERLNNLLDPHSFDEVG---------'
        sseq   = 'ERLRILLDPGSFIPVDGELSPTDPL'

        hash = { 'qseqid' => 'sp|Q8GBW6|12S_PROFR',
                 'sseqid' => 'sp|A5GSN7|ACCD_SYNR3',
                 'sacc'   => 'A5GSN7',
                 'slen'   => '291',
                 'qstart' => qstart,
                 'qend'   => qend,
                 'sstart' => sstart,
                 'send'   => send,
                 'length' => length,
                 'qframe' => qframe,
                 'pident' => pident,
                 'nident' => nident,
                 'evalue' => evalue,
                 'qseq'   => qseq,
                 'sseq'   => sseq }

        seq = Hsp.new
        seq.init_tabular_attribute(hash)

        assert_equal(qstart, seq.match_query_from.to_s)
        assert_equal(qend, seq.match_query_to.to_s)
        assert_equal(qframe, seq.query_reading_frame.to_s)
        assert_equal(sstart, seq.hit_from.to_s)
        assert_equal(send, seq.hit_to.to_s)
        assert_equal(qseq, seq.query_alignment.to_s)
        assert_equal(sseq, seq.hit_alignment.to_s)
        assert_equal(length, seq.align_len.to_s)
        assert_equal(pident, seq.pidentity.to_s)
        assert_equal(nident, seq.identity.to_s)
        assert_equal(evalue, seq.hsp_evalue.to_s)

        assert(seq.match_query_from.is_a?(Integer))
        assert(seq.match_query_to.is_a?(Integer))
        assert(seq.query_reading_frame.is_a?(Integer))
        assert(seq.hit_from.is_a?(Integer))
        assert(seq.hit_to.is_a?(Integer))
        assert(seq.query_alignment.is_a?(String))
        assert(seq.hit_alignment.is_a?(String))
        assert(seq.align_len.is_a?(Integer))
        assert(seq.pidentity.is_a?(Float))
        assert(seq.identity.is_a?(Float))
        assert(seq.hsp_evalue.is_a?(Float))
      end
    end
  end
end

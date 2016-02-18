require 'spec_helper'

module MorseSqlDump
  RSpec.describe SqlDumpController, type: :controller do
    routes { MorseSqlDump::Engine.routes }

    let(:sql_dumper_instance) { SqlDumper.new }
    describe 'GET index' do
      it 'creates new sql dump instance' do
        expect(SqlDumper).to receive(:new).and_return sql_dumper_instance
        expect(sql_dumper_instance).to receive(:clean!)
        get :index
      end
    end
  end
end

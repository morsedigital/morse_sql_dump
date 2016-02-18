require_dependency "morse_sql_dump/application_controller"

module MorseSqlDump
  class SqlDumpController < ApplicationController
    def index
      @dumper = SqlDumper.new
      @dumper.clean!
      @dump_file = @dumper.dump!
      send_file @dump_file
    end
  end
end

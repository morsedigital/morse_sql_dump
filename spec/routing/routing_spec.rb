RSpec.describe MorseSqlDump::SqlDumpController, :type => :routing do
  routes { MorseSqlDump::Engine.routes }

  it "routes to the sql dump action" do
    expect(:get => '/mysql_dump').
      to route_to(:controller => "morse_sql_dump/sql_dump", :action => "index")
  end
end

MorseSqlDump::Engine.routes.draw do
  get '/mysql_dump', to: 'sql_dump#index', action: :mysql_dump
end

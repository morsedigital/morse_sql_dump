Rails.application.routes.draw do

  mount MorseSqlDump::Engine => "/morse_sql_dump"
end

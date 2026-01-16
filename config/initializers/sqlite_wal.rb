# Configure SQLite for optimal Litestream compatibility
# WAL mode enables concurrent reads and better replication
# synchronous=NORMAL balances safety with performance

Rails.application.config.after_initialize do
  if ActiveRecord::Base.connection.adapter_name == "SQLite"
    ActiveRecord::Base.connection.execute("PRAGMA journal_mode=WAL;")
    ActiveRecord::Base.connection.execute("PRAGMA synchronous=NORMAL;")
  end
end

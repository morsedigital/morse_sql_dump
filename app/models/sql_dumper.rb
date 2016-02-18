class SqlDumper
  DUMP_DIR = '/tmp/mysql-backup'
  DUMP_FILE_REGEX = /#{DUMP_DIR}\/dump_[0-9._]{17}\.sql/
  ARCHIVE_FILE_REGEX = /#{DUMP_DIR}\/dump_[0-9._]{17}\.tar\.gz/

  attr_reader :archive_file
  attr_reader :dump_file

  def clean!
    FileUtils.rm_rf @temp_dir
    true
  rescue
    false
  end

  def dump!
    FileUtils.mkdir_p @temp_dir
    system dump_command
    if File.exists? @dump_file
      # temporary changes pwd
      Dir.chdir(@temp_dir) { |path| system tar_command }
      return File.exists?(@archive_file) ? @archive_file : nil
    end
  end

  def fake_rails_env
    { database: '', username: '', password: '' }
  end

  def initialize
    return self if load_db_config and prepare_dump_paths
    nil
  end

  def rails_root
    defined?(Rails) ? Rails.root : '/tmp'
  end

  def rails_env
    rails_env ||= defined?(Rails) ? Rails.env : fake_rails_env
  end

  private

  def load_db_config
    db_conf_file = File.join(rails_root, "/config/database.yml")
    @db_config = YAML::load(IO.read(db_conf_file))
    @mysql_database = @db_config[rails_env]["database"]
    @mysql_user = @db_config[rails_env]["username"]
    @mysql_password = @db_config[rails_env]["password"]
    true
  rescue
    false
  end

  def prepare_dump_paths
    time_str = Time.now.strftime('%d.%m.%y_%H.%M.%S')
    @temp_dir = File.join(rails_root, DUMP_DIR)
    @dump_file_name = "dump_#{time_str}.sql"
    @dump_file = File.join(@temp_dir, @dump_file_name)
    @archive_file_name = "dump_#{time_str}.tar.gz"
    @archive_file = File.join(@temp_dir, @archive_file_name)
    true
  rescue
    false
  end

  def dump_command
    cmd = "mysqldump #{@mysql_database}"
    cmd << " -u #{@mysql_user}"
    cmd << " -p#{@mysql_password}" if @mysql_password.present?
    cmd << " > #{@dump_file}"
    return cmd
  end

  def tar_command
    "tar czf #{@archive_file_name} #{@dump_file_name}"
  end
end

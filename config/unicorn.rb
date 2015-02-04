# Use at least one worker per core if you're on a dedicated server,
# more will usually help for _short_ waits on databases/caches.
worker_processes 4
listen 3000

# # feel free to point this anywhere accessible on the filesystem
pid "#{File.expand_path('.')}/tmp/pids/unicorn.pid"

# # By default, the Unicorn logger will write to stderr.
# # Additionally, ome applications/frameworks log to stderr or stdout,
# # so prevent them from going to /dev/null when daemonized here:
#stderr_path "#{File.expand_path('.')}/log/unicorn.log"
#stdout_path "#{File.expand_path('.')}/log/unicorn.log"

preload_app true

before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  # per-process listener ports for debugging/admin/migrations
  # addr = "127.0.0.1:#{9293 + worker.nr}"
  # server.listen(addr, :tries => -1, :delay => 5, :tcp_nopush => true)

  # the following is *required* for Rails + "preload_app true",
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
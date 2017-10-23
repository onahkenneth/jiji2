# coding: utf-8

ENV['ENABLE_COVERADGE_REPORT'] = 'false'

require 'singleton'
require 'fileutils'
require 'server'
require 'rpc_client'

module Jiji
  class PythonRpcServer < Jiji::Server

    include Singleton

    def self.start_python_rpc_server
      Jiji::PythonRpcServer.instance.setup('python_rpc')
      Jiji::RpcClient.instance.wait_for_server_start_up
    end

    private

    def initialize_db
    end

    def start_server(id)
      log_dir = create_log_dir
      spawn({
        'PYTHONPATH' => [
          './agent_services/python/src/',
          './agent_services/python/test/',
          './rpc/python/'
        ].join(':')
      }, 'python agent_services/python/src/jiji/server.py',
        out: File.join(log_dir, 'test_server_python_rpc.log'), err: :out)
    end

    def create_log_dir
      log_dir = File.join(BUILD_DIR, 'python_rpc_spec')
      FileUtils.mkdir_p log_dir
      log_dir
    end

  end
end
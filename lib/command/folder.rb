# -*- coding: UTF-8 -*-
#
# Copyright 2013 whiteleaf. All rights reserved.
#

require_relative "../helper"

module Command
  class Folder < CommandBase
    def initialize
      super("<target> [<target2> ...]")
      @opt.separator <<-EOS

  ・指定した小説の保存フォルダを開きます

  Example:
    narou open n9669bk
    narou open musyoku
      EOS
    end

    def execute(argv)
      super
      return if argv.empty?
      argv.each do |target|
        Helper.open_directory_by_os_filer(Downloader.get_novel_data_dir_by_target(target))
      end
    end

    def oneline_help
      "小説の保存フォルダを開きます"
    end
  end
end

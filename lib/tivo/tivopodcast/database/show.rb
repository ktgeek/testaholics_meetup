# -*- coding: utf-8 -*-
# Copyright 2017 Keith T. Garner. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#
#    * Redistributions in binary form must reproduce the above
#      copyright notice, this list of conditions and the following
#      disclaimer in the documentation and/or other materials provided
#      with the distribution.
#
#    * Neither the name of the copyright holder nor the names of its
#      contributors may be used to endorse or promote products derived
#      from this software without specific prior written permission.
#
require 'active_record'

module Tivo2Podcast
  class Show < ActiveRecord::Base
    belongs_to :config, foreign_key: 'configid'
    has_many :rss_files, through: :config
    validates_presence_of :config

    scope :on_disk, -> { where(on_disk: true) }
    scope :on_disk_for_config, ->(config) { on_disk.where(configid: config) }
    scope :episode_for, ->(config, programid) { where(configid: config, s_ep_programid: programid) }

    # def self.new_from_config_show_filename(config, showinfo, filename)
    #   show = Show.new
    #   show.config = config

    #   show.s_name = showinfo.title
    #   show.s_ep_title = showinfo.episode_title(use_date_if_nil: true)
    #   show.s_ep_number = showinfo.episode_number
    #   show.s_ep_description = showinfo.description
    #   show.s_ep_length = showinfo.duration
    #   show.s_ep_timecap = showinfo.time_captured.to_i
    #   show.s_ep_programid = showinfo.program_id
    #   show.on_disk = true

    #   show.filename = filename

    #   show
    # end
  end
end

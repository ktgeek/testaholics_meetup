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
  end
end

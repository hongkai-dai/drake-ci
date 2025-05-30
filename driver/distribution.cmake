# -*- mode: cmake; -*-
# vi: set ft=cmake:

# BSD 3-Clause License
#
# Copyright (c) 2019, Massachusetts Institute of Technology.
# Copyright (c) 2019, Toyota Research Institute.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

if(APPLE)
  set(DASHBOARD_UNIX_DISTRIBUTION "Apple")
  find_program(DASHBOARD_SW_VERS_COMMAND NAMES "sw_vers")
  if(NOT DASHBOARD_SW_VERS_COMMAND)
    fatal("sw_vers was not found")
  endif()
  execute_process(COMMAND "${DASHBOARD_SW_VERS_COMMAND}" "-productVersion"
    RESULT_VARIABLE SW_VERS_RESULT_VARIABLE
    OUTPUT_VARIABLE SW_VERS_OUTPUT_VARIABLE
    OUTPUT_STRIP_TRAILING_WHITESPACE)
  if(NOT SW_VERS_RESULT_VARIABLE EQUAL 0)
    fatal("unable to determine distribution release version")
  endif()
  if(SW_VERS_OUTPUT_VARIABLE MATCHES "([0-9]+)[.]([0-9]+)([.][0-9]+)?")
    set(DASHBOARD_UNIX_DISTRIBUTION_MAJOR_VERSION "${CMAKE_MATCH_1}")
    set(DASHBOARD_UNIX_DISTRIBUTION_MINOR_VERSION "${CMAKE_MATCH_2}")
  else()
    fatal("unable to determine distribution release version")
  endif()
  if(DASHBOARD_UNIX_DISTRIBUTION_MAJOR_VERSION EQUAL 12)
    set(DASHBOARD_UNIX_DISTRIBUTION_CODE_NAME "monterey")
    set(DASHBOARD_UNIX_DISTRIBUTION_VERSION "${DASHBOARD_UNIX_DISTRIBUTION_MAJOR_VERSION}")
  elseif(DASHBOARD_UNIX_DISTRIBUTION_MAJOR_VERSION EQUAL 13)
    set(DASHBOARD_UNIX_DISTRIBUTION_CODE_NAME "ventura")
    set(DASHBOARD_UNIX_DISTRIBUTION_VERSION "${DASHBOARD_UNIX_DISTRIBUTION_MAJOR_VERSION}")
  else()
    fatal("unable to determine distribution code name")
  endif()
  # Add detection logic for differentiating intel vs arm64 macOS.
  execute_process(
    COMMAND "/usr/bin/arch"
    RESULT_VARIABLE APPLE_ARCHITECTURE_RESULT_VARIABLE
    OUTPUT_VARIABLE APPLE_ARCHITECTURE
    OUTPUT_STRIP_TRAILING_WHITESPACE)
  if(NOT APPLE_ARCHITECTURE_RESULT_VARIABLE EQUAL 0)
    fatal("unable to detect Apple architecture via /usr/bin/arch")
  endif()
  if(APPLE_ARCHITECTURE STREQUAL "arm64")
    set(APPLE_ARM64 ON)
    set(APPLE_X86 OFF)
  else()
    set(APPLE_ARM64 OFF)
    set(APPLE_X86 ON)
  endif()
else()
  find_program(DASHBOARD_LSB_RELEASE_COMMAND NAMES "lsb_release")
  if(NOT DASHBOARD_LSB_RELEASE_COMMAND)
    fatal("lsb_release was not found")
  endif()
  execute_process(COMMAND "${DASHBOARD_LSB_RELEASE_COMMAND}" "--id" "--short"
    RESULT_VARIABLE LSB_RELEASE_RESULT_VARIABLE
    OUTPUT_VARIABLE DASHBOARD_UNIX_DISTRIBUTION
    OUTPUT_STRIP_TRAILING_WHITESPACE)
  if(NOT LSB_RELEASE_RESULT_VARIABLE EQUAL 0)
    fatal("unable to determine distribution name")
  endif()
  execute_process(COMMAND "${DASHBOARD_LSB_RELEASE_COMMAND}" "--release" "--short"
    RESULT_VARIABLE LSB_RELEASE_RESULT_VARIABLE
    OUTPUT_VARIABLE DASHBOARD_UNIX_DISTRIBUTION_VERSION
    OUTPUT_STRIP_TRAILING_WHITESPACE)
  if(NOT LSB_RELEASE_RESULT_VARIABLE EQUAL 0)
    fatal("unable to determine distribution release version")
  endif()
  execute_process(COMMAND "${DASHBOARD_LSB_RELEASE_COMMAND}" "--codename" "--short"
    RESULT_VARIABLE LSB_RELEASE_RESULT_VARIABLE
    OUTPUT_VARIABLE DASHBOARD_UNIX_DISTRIBUTION_CODE_NAME
    OUTPUT_STRIP_TRAILING_WHITESPACE)
  if(NOT LSB_RELEASE_RESULT_VARIABLE EQUAL 0)
    fatal("unable to determine distribution code name")
  endif()
endif()

set(CACHE_C_FLAGS "")
set(CACHE_C_INCLUDE_WHAT_YOU_USE "")
set(CACHE_CXX_FLAGS "")
set(CACHE_CXX_INCLUDE_WHAT_YOU_USE "")
set(CACHE_CXX_STANDARD "")
set(CACHE_CXX_STANDARD_REQUIRED "")
set(CACHE_EXE_LINKER_FLAGS "")
set(CACHE_FORTRAN_FLAGS "")
set(CACHE_INSTALL_PREFIX "")
set(CACHE_NINJA_LINK_POOL_SIZE "")
set(CACHE_POSITION_INDEPENDENT_CODE "")
set(CACHE_SHARED_LINKER_FLAGS "")
set(CACHE_STATIC_LINKER_FLAGS "")
set(CACHE_VERBOSE_MAKEFILE "")

if(DASHBOARD_C_FLAGS)
  set(CACHE_C_FLAGS "CMAKE_C_FLAGS:STRING=${DASHBOARD_C_FLAGS}")
endif()
if(DASHBOARD_CXX_FLAGS)
  set(CACHE_CXX_FLAGS "CMAKE_CXX_FLAGS:STRING=${DASHBOARD_CXX_FLAGS}")
endif()
if(DASHBOARD_CXX_STANDARD)
  set(CACHE_CXX_STANDARD_REQUIRED "CMAKE_CXX_STANDARD_REQUIRED:BOOL=ON")
  set(CACHE_CXX_STANDARD "CMAKE_CXX_STANDARD:STRING=${DASHBOARD_CXX_STANDARD}")
endif()
if(DASHBOARD_FORTRAN_FLAGS)
  set(CACHE_FORTRAN_FLAGS
    "CMAKE_Fortran_FLAGS:STRING=${DASHBOARD_FORTRAN_FLAGS}")
endif()
if(DASHBOARD_INCLUDE_WHAT_YOU_USE)
  set(CACHE_C_INCLUDE_WHAT_YOU_USE
    "CMAKE_C_INCLUDE_WHAT_YOU_USE:STRING=${DASHBOARD_INCLUDE_WHAT_YOU_USE}")
  set(CACHE_CXX_INCLUDE_WHAT_YOU_USE
    "CMAKE_CXX_INCLUDE_WHAT_YOU_USE:STRING=${DASHBOARD_INCLUDE_WHAT_YOU_USE}")
endif()
if(DASHBOARD_INSTALL_PREFIX)
  set(CACHE_INSTALL_PREFIX
    "CMAKE_INSTALL_PREFIX:PATH=${DASHBOARD_INSTALL_PREFIX}")
endif()
set(CACHE_LINK_WHAT_YOU_USE
  "CMAKE_LINK_WHAT_YOU_USE:BOOL=${DASHBOARD_LINK_WHAT_YOU_USE}")
if(DASHBOARD_NINJA_LINK_POOL_SIZE)
  set(CACHE_NINJA_LINK_POOL_SIZE
    "CMAKE_NINJA_LINK_POOL_SIZE:STRING=${DASHBOARD_NINJA_LINK_POOL_SIZE}")
endif()
if(DASHBOARD_POSITION_INDEPENDENT_CODE)
  set(CACHE_POSITION_INDEPENDENT_CODE
    "CMAKE_POSITION_INDEPENDENT_CODE:BOOL=${DASHBOARD_POSITION_INDEPENDENT_CODE}")
endif()
if(DASHBOARD_SHARED_LINKER_FLAGS)
  set(CACHE_EXE_LINKER_FLAGS
    "CMAKE_EXE_LINKER_FLAGS:STRING=${DASHBOARD_SHARED_LINKER_FLAGS}")
  set(CACHE_SHARED_LINKER_FLAGS
    "CMAKE_SHARED_LINKER_FLAGS:STRING=${DASHBOARD_SHARED_LINKER_FLAGS}")
endif()
if(DASHBOARD_STATIC_LINKER_FLAGS)
  set(CACHE_STATIC_LINKER_FLAGS
    "CMAKE_STATIC_LINKER_FLAGS:STRING=${DASHBOARD_STATIC_LINKER_FLAGS}")
endif()
if(DASHBOARD_VERBOSE_MAKEFILE)
  set(CACHE_VERBOSE_MAKEFILE
    "CMAKE_VERBOSE_MAKEFILE:BOOL=${DASHBOARD_VERBOSE_MAKEFILE}")
endif()

set(DASHBOARD_BUILD_DOCUMENTATION OFF)
set(DASHBOARD_LONG_RUNNING_TESTS OFF)

if(DOCUMENTATION OR DOCUMENTATION STREQUAL "publish")
  set(DASHBOARD_BUILD_DOCUMENTATION ON)
endif()

if(NOT DEFINED ENV{ghprbPullId})
  set(DASHBOARD_LONG_RUNNING_TESTS ON)
endif()

set(CACHE_BUILD_DOCUMENTATION
  "BUILD_DOCUMENTATION:BOOL=${DASHBOARD_BUILD_DOCUMENTATION}")
set(CACHE_BUILD_DOCUMENTATION_ALWAYS
  "BUILD_DOCUMENTATION_ALWAYS:BOOL=${DASHBOARD_BUILD_DOCUMENTATION}")
set(CACHE_LONG_RUNNING_TESTS
  "LONG_RUNNING_TESTS:BOOL=${DASHBOARD_LONG_RUNNING_TESTS}")

# Report build configuration
message("
  ------------------------------------------------------------------------------
  CC                                  = $ENV{CC}
  CCC_CC                              = $ENV{CCC_CC}
  CCC_CXX                             = $ENV{CCC_CXX}
  CXX                                 = $ENV{CXX}
  F77                                 = $ENV{F77}
  FC                                  = $ENV{FC}
  ------------------------------------------------------------------------------
  GTEST_DEATH_TEST_USE_FORK           = $ENV{GTEST_DEATH_TEST_USE_FORK}
  ------------------------------------------------------------------------------
  ROS_DISTRO                          = $ENV{ROS_DISTRO}
  ROS_ETC_DIR                         = $ENV{ROS_ETC_DIR}
  ROS_HOME                            = $ENV{ROS_HOME}
  ROS_MASTER_URI                      = $ENV{ROS_MASTER_URI}
  ROS_PACKAGE_PATH                    = $ENV{ROS_PACKAGE_PATH}
  ROS_ROOT                            = $ENV{ROS_ROOT}
  ------------------------------------------------------------------------------
  APPLE                               = ${DASHBOARD_APPLE}
  UNIX                                = ${DASHBOARD_UNIX}
  ------------------------------------------------------------------------------
  CMAKE_VERSION                       = ${CMAKE_VERSION}
  ------------------------------------------------------------------------------
  CMAKE_C_FLAGS                      += ${DASHBOARD_C_FLAGS}
  CMAKE_C_INCLUDE_WHAT_YOU_USE        = ${DASHBOARD_C_INCLUDE_WHAT_YOU_USE}
  CMAKE_CXX_FLAGS                    += ${DASHBOARD_CXX_FLAGS}
  CMAKE_CXX_INCLUDE_WHAT_YOU_USE      = ${DASHBOARD_CXX_INCLUDE_WHAT_YOU_USE}
  CMAKE_CXX_STANDARD                  = ${DASHBOARD_CXX_STANDARD}
  CMAKE_CXX_STANDARD_REQUIRED         = ${DASHBOARD_CXX_STANDARD_REQUIRED}
  CMAKE_EXE_LINKER_FLAGS             += ${DASHBOARD_EXE_LINKER_FLAGS}
  CMAKE_Fortran_FLAGS                += ${DASHBOARD_FORTRAN_FLAGS}
  CMAKE_INSTALL_PREFIX                = ${DASHBOARD_INSTALL_PREFIX}
  CMAKE_LINK_WHAT_YOU_USE             = ${DASHBOARD_LINK_WHAT_YOU_USE}
  CMAKE_NINJA_LINK_POOL_SIZE          = ${DASHBOARD_NINJA_LINK_POOL_SIZE}
  CMAKE_POSITION_INDEPENDENT_CODE     = ${DASHBOARD_POSITION_INDEPENDENT_CODE}
  CMAKE_SHARED_LINKER_FLAGS          += ${DASHBOARD_SHARED_LINKER_FLAGS}
  CMAKE_STATIC_LINKER_FLAGS          += ${DASHBOARD_STATIC_LINKER_FLAGS}
  CMAKE_VERBOSE_MAKEFILE              = ${DASHBOARD_VERBOSE_MAKEFILE}
  ------------------------------------------------------------------------------
  CTEST_BUILD_NAME                    = ${DASHBOARD_BUILD_NAME}
  CTEST_CHANGE_ID                     = ${CTEST_CHANGE_ID}
  CTEST_BUILD_FLAGS                   = ${CTEST_BUILD_FLAGS}
  CTEST_CMAKE_GENERATOR               = ${CTEST_CMAKE_GENERATOR}
  CTEST_CONFIGURATION_TYPE            = ${CTEST_CONFIGURATION_TYPE}
  CTEST_CONFIGURE_COMMAND             = ${CTEST_CONFIGURE_COMMAND}
  CTEST_COVERAGE_COMMAND              = ${CTEST_COVERAGE_COMMAND}
  CTEST_COVERAGE_EXTRA_FLAGS          = ${CTEST_COVERAGE_EXTRA_FLAGS}
  CTEST_GIT_COMMAND                   = ${CTEST_GIT_COMMAND}
  CTEST_MEMORYCHECK_COMMAND           = ${CTEST_MEMORYCHECK_COMMAND}
  CTEST_MEMORYCHECK_COMMAND_OPTIONS   = ${CTEST_MEMORYCHECK_COMMAND_OPTIONS}
  CTEST_MEMORYCHECK_SUPPRESSIONS_FILE = ${CTEST_MEMORYCHECK_SUPPRESSIONS_FILE}
  CTEST_MEMORYCHECK_TYPE              = ${CTEST_MEMORYCHECK_TYPE}
  CTEST_SITE                          = ${CTEST_SITE}
  CTEST_TEST_TIMEOUT                  = ${CTEST_TEST_TIMEOUT}
  CTEST_UPDATE_COMMAND                = ${CTEST_UPDATE_COMMAND}
  CTEST_UPDATE_VERSION_ONLY           = ${CTEST_UPDATE_VERSION_ONLY}
  CTEST_USE_LAUNCHERS                 = ${CTEST_USE_LAUNCHERS}
  ------------------------------------------------------------------------------
  BUILD_DOCUMENTATION                 = ${DASHBOARD_BUILD_DOCUMENTATION}
  LONG_RUNNING_TESTS                  = ${DASHBOARD_LONG_RUNNING_TESTS}
  TEST_TIMEOUT_MULTIPLIER             = ${DASHBOARD_TEST_TIMEOUT_MULTIPLIER}
  ------------------------------------------------------------------------------
  WITH_AVL                            = ${DASHBOARD_WITH_AVL}
  WITH_BOT_CORE_LCMTYPES              = ${DASHBOARD_WITH_BOT_CORE_LCMTYPES}
  WITH_BULLET                         = ${DASHBOARD_WITH_BULLET}
  WITH_DIRECTOR                       = ${DASHBOARD_WITH_DIRECTOR}
  WITH_DRAKE                          = ${DASHBOARD_WITH_DRAKE}
  WITH_DREAL                          = ${DASHBOARD_WITH_DREAL}
  WITH_EIGEN                          = ${DASHBOARD_WITH_EIGEN}
  WITH_FCL                            = ${DASHBOARD_WITH_FCL}
  WITH_GFLAGS                         = ${DASHBOARD_WITH_GFLAGS}
  WITH_GOOGLE_STYLEGUIDE              = ${DASHBOARD_WITH_GOOGLE_STYLEGUIDE}
  WITH_GOOGLETEST                     = ${DASHBOARD_WITH_GOOGLETEST}
  WITH_GUROBI                         = ${DASHBOARD_WITH_GUROBI}
  WITH_IPOPT                          = ${DASHBOARD_WITH_IPOPT}
  WITH_IRIS                           = ${DASHBOARD_WITH_IRIS}
  WITH_LCM                            = ${DASHBOARD_WITH_LCM}
  WITH_LIBBOT                         = ${DASHBOARD_WITH_LIBBOT}
  WITH_LIBCCD                         = ${DASHBOARD_WITH_LIBCCD}
  WITH_MESHCONVERTERS                 = ${DASHBOARD_WITH_MESHCONVERTERS}
  WITH_MOSEK                          = ${DASHBOARD_WITH_MOSEK}
  WITH_NLOPT                          = ${DASHBOARD_WITH_NLOPT}
  WITH_OCTOMAP                        = ${DASHBOARD_WITH_OCTOMAP}
  WITH_SEDUMI                         = ${DASHBOARD_WITH_SEDUMI}
  WITH_SIGNALSCOPE                    = ${DASHBOARD_WITH_SIGNALSCOPE}
  WITH_SNOPT                          = ${DASHBOARD_WITH_SNOPT}
  WITH_SNOPT_PRECOMPILED              = ${DASHBOARD_WITH_SNOPT_PRECOMPILED}
  WITH_SPDLOG                         = ${DASHBOARD_WITH_SPDLOG}
  WITH_SPOTLESS                       = ${DASHBOARD_WITH_SPOTLESS}
  WITH_SWIG_MATLAB                    = ${DASHBOARD_WITH_SWIG_MATLAB}
  WITH_SWIGMAKE                       = ${DASHBOARD_WITH_SWIGMAKE}
  WITH_TEXTBOOK                       = ${DASHBOARD_WITH_TEXTBOOK}
  WITH_XFOIL                          = ${DASHBOARD_WITH_XFOIL}
  WITH_YALMIP                         = ${DASHBOARD_WITH_YALMIP}
  WITH_YAML_CPP                       = ${DASHBOARD_WITH_YAML_CPP}
  ------------------------------------------------------------------------------
  ")

set(DASHBOARD_CDASH_SERVER "drake-cdash.csail.mit.edu")
set(DASHBOARD_NIGHTLY_START_TIME "00:00:00 EST")

set(DASHBOARD_SUPERBUILD_FAILURE OFF)

if(DASHBOARD_CONFIGURE_AND_BUILD_SUPERBUILD)
  set(DASHBOARD_SUPERBUILD_PROJECT_NAME "drake-superbuild")

  set(CTEST_BUILD_NAME "${DASHBOARD_BUILD_NAME}-pre-drake")
  set(CTEST_PROJECT_NAME "${DASHBOARD_SUPERBUILD_PROJECT_NAME}")
  set(CTEST_NIGHTLY_START_TIME "${DASHBOARD_NIGHTLY_START_TIME}")
  set(CTEST_DROP_METHOD "https")
  set(CTEST_DROP_SITE "${DASHBOARD_CDASH_SERVER}")
  set(CTEST_DROP_LOCATION
    "/submit.php?project=${DASHBOARD_SUPERBUILD_PROJECT_NAME}")
  set(CTEST_DROP_SITE_CDASH ON)

set(DASHBOARD_SUPERBUILD_START_MESSAGE
  "*** CTest Status: CONFIGURING / BUILDING SUPERBUILD")

message("
  ------------------------------------------------------------------------------
  ${DASHBOARD_SUPERBUILD_START_MESSAGE}
  ------------------------------------------------------------------------------
  ")

  ctest_start("${DASHBOARD_MODEL}" TRACK "${DASHBOARD_TRACK}" QUIET)
  ctest_update(SOURCE "${CTEST_SOURCE_DIRECTORY}"
    RETURN_VALUE DASHBOARD_SUPERBUILD_UPDATE_RETURN_VALUE QUIET)

  set(CACHE_SKIP_DRAKE_BUILD "SKIP_DRAKE_BUILD:BOOL=ON")

  # write initial cache
  file(WRITE "${CTEST_BINARY_DIRECTORY}/CMakeCache.txt" "
${CACHE_SKIP_DRAKE_BUILD}
${CACHE_BUILD_DOCUMENTATION_ALWAYS}
${CACHE_BUILD_DOCUMENTATION}
${CACHE_C_FLAGS}
${CACHE_CXX_FLAGS}
${CACHE_CXX_STANDARD_REQUIRED}
${CACHE_CXX_STANDARD}
${CACHE_EXE_LINKER_FLAGS}
${CACHE_FORTRAN_FLAGS}
${CACHE_INSTALL_PREFIX}
${CACHE_POSITION_INDEPENDENT_CODE}
${CACHE_SHARED_LINKER_FLAGS}
${CACHE_STATIC_LINKER_FLAGS}
${CACHE_VERBOSE_MAKEFILE}
${CACHE_LONG_RUNNING_TESTS}
${CACHE_TEST_TIMEOUT_MULTIPLIER}
${CACHE_WITH_AVL}
${CACHE_WITH_BOT_CORE_LCMTYPES}
${CACHE_WITH_BULLET}
${CACHE_WITH_DIRECTOR}
${CACHE_WITH_DRAKE}
${CACHE_WITH_DREAL}
${CACHE_WITH_EIGEN}
${CACHE_WITH_FCL}
${CACHE_WITH_GFLAGS}
${CACHE_WITH_GOOGLE_STYLEGUIDE}
${CACHE_WITH_GOOGLETEST}
${CACHE_WITH_GUROBI}
${CACHE_WITH_IPOPT}
${CACHE_WITH_IRIS}
${CACHE_WITH_LCM}
${CACHE_WITH_LIBBOT}
${CACHE_WITH_LIBCCD}
${CACHE_WITH_MESHCONVERTERS}
${CACHE_WITH_MOSEK}
${CACHE_WITH_NLOPT}
${CACHE_WITH_OCTOMAP}
${CACHE_WITH_SEDUMI}
${CACHE_WITH_SIGNALSCOPE}
${CACHE_WITH_SNOPT_PRECOMPILED}
${CACHE_WITH_SNOPT}
${CACHE_WITH_SPDLOG}
${CACHE_WITH_SPOTLESS}
${CACHE_WITH_SWIG_MATLAB}
${CACHE_WITH_SWIGMAKE}
${CACHE_WITH_TEXTBOOK}
${CACHE_WITH_XFOIL}
${CACHE_WITH_YALMIP}
${CACHE_WITH_YAML_CPP}
  ")

  ctest_configure(BUILD "${CTEST_BINARY_DIRECTORY}"
    SOURCE "${CTEST_SOURCE_DIRECTORY}"
    RETURN_VALUE DASHBOARD_SUPERBUILD_CONFIGURE_RETURN_VALUE QUIET)
  if(NOT DASHBOARD_SUPERBUILD_CONFIGURE_RETURN_VALUE EQUAL 0)
    set(DASHBOARD_FAILURE ON)
    list(APPEND DASHBOARD_FAILURES "CONFIGURE SUPERBUILD (PRE-DRAKE)")
  endif()

  ctest_build(BUILD "${CTEST_BINARY_DIRECTORY}" APPEND
    NUMBER_ERRORS DASHBOARD_SUPERBUILD_NUMBER_BUILD_ERRORS QUIET)
  if(DASHBOARD_SUPERBUILD_NUMBER_BUILD_ERRORS GREATER 0)
    set(DASHBOARD_FAILURE ON)
    list(APPEND DASHBOARD_FAILURES "BUILD SUPERBUILD (PRE-DRAKE)")
  endif()

  set(DASHBOARD_BUILD_URL_FILE
    "${CTEST_BINARY_DIRECTORY}/${DASHBOARD_BUILD_NAME}.url")
  file(WRITE "${DASHBOARD_BUILD_URL_FILE}" "$ENV{BUILD_URL}")
  ctest_upload(FILES "${DASHBOARD_BUILD_URL_FILE}" QUIET)

  ctest_submit(RETRY_COUNT 4 RETRY_DELAY 15
    RETURN_VALUE DASHBOARD_SUPERBUILD_SUBMIT_RETURN_VALUE QUIET)

  set(DASHBOARD_SUPERBUILD_FAILURE ${DASHBOARD_FAILURE})
endif()

set(DASHBOARD_STEPS "")
if(DASHBOARD_CONFIGURE)
  list(APPEND DASHBOARD_STEPS "CONFIGURING")
endif()
list(APPEND DASHBOARD_STEPS "BUILDING")
if(DASHBOARD_INSTALL)
  list(APPEND DASHBOARD_STEPS "INSTALLING")
endif()
if(DASHBOARD_TEST)
  list(APPEND DASHBOARD_STEPS "TESTING")
endif()
string(REPLACE ";" " / " DASHBOARD_STEPS_STRING "${DASHBOARD_STEPS}")

if(DASHBOARD_SUPERBUILD_FAILURE)
  set(DASHBOARD_START_MESSAGE "*** CTest Status: NOT CONTINUING BECAUSE SUPERBUILD (PRE-DRAKE) WAS NOT SUCCESSFUL")
else()
  set(DASHBOARD_PROJECT_NAME "Drake")

  # now start the actual drake build
  set(CTEST_SOURCE_DIRECTORY "${DASHBOARD_WORKSPACE}/drake")
  set(CTEST_BINARY_DIRECTORY "${DASHBOARD_WORKSPACE}/build/drake")

  # switch the dashboard to the drake only dashboard
  set(CTEST_BUILD_NAME "${DASHBOARD_BUILD_NAME}-drake")
  set(CTEST_PROJECT_NAME "${DASHBOARD_PROJECT_NAME}")
  set(CTEST_NIGHTLY_START_TIME "${DASHBOARD_NIGHTLY_START_TIME}")
  set(CTEST_DROP_METHOD "https")
  set(CTEST_DROP_SITE "${DASHBOARD_CDASH_SERVER}")
  set(CTEST_DROP_LOCATION "/submit.php?project=${DASHBOARD_PROJECT_NAME}")
  set(CTEST_DROP_SITE_CDASH ON)

  if(COMPILER MATCHES "^scan-build")
    file(REMOVE_RECURSE "${DASHBOARD_CCC_ANALYZER_HTML}")
    file(MAKE_DIRECTORY "${DASHBOARD_CCC_ANALYZER_HTML}")
  endif()

  set(DASHBOARD_START_MESSAGE "*** CTest Status: ${DASHBOARD_STEPS_STRING} DRAKE")
endif()

message("
  ------------------------------------------------------------------------------
  ${DASHBOARD_START_MESSAGE}
  ------------------------------------------------------------------------------
  ")

if(NOT DASHBOARD_SUPERBUILD_FAILURE)
  ctest_start("${DASHBOARD_MODEL}" TRACK "${DASHBOARD_TRACK}" QUIET)
  ctest_update(SOURCE "${CTEST_SOURCE_DIRECTORY}"
    RETURN_VALUE DASHBOARD_UPDATE_RETURN_VALUE QUIET)

  if(DASHBOARD_CONFIGURE)
    set(DRAKE_CACHE_ARGS "")
    set(DRAKE_CACHE_VARS
      CACHE_BUILD_DOCUMENTATION_ALWAYS
      CACHE_BUILD_DOCUMENTATION
      CACHE_VERBOSE_MAKEFILE
      CACHE_LONG_RUNNING_TESTS
      CACHE_TEST_TIMEOUT_MULTIPLIER
      CACHE_C_INCLUDE_WHAT_YOU_USE
      CACHE_CXX_INCLUDE_WHAT_YOU_USE
      CACHE_LINK_WHAT_YOU_USE
      CACHE_NINJA_LINK_POOL_SIZE
      CACHE_POSITION_INDEPENDENT_CODE
    )
    foreach(DRAKE_CACHE_VAR ${DRAKE_CACHE_VARS})
      if(NOT ${DRAKE_CACHE_VAR} STREQUAL "")
        list(APPEND DRAKE_CACHE_ARGS "-D${${DRAKE_CACHE_VAR}}")
      endif()
    endforeach()
    ctest_configure(BUILD "${CTEST_BINARY_DIRECTORY}"
      OPTIONS "${DRAKE_CACHE_ARGS}"
      SOURCE "${CTEST_SOURCE_DIRECTORY}"
      RETURN_VALUE DASHBOARD_CONFIGURE_RETURN_VALUE QUIET)
    if(NOT DASHBOARD_CONFIGURE_RETURN_VALUE EQUAL 0)
      set(DASHBOARD_FAILURE ON)
      list(APPEND DASHBOARD_FAILURES "CONFIGURE")
    endif()
  endif()

  ctest_read_custom_files("${CTEST_BINARY_DIRECTORY}")

  if(COMPILER STREQUAL "cpplint")
    set(CTEST_BUILD_COMMAND
      "${DASHBOARD_WORKSPACE}/drake/common/test/cpplint_wrapper.py")

    set(CTEST_CUSTOM_MAXIMUM_NUMBER_OF_ERRORS 1000)
    set(CTEST_CUSTOM_MAXIMUM_NUMBER_OF_WARNINGS 1000)

    set(CTEST_CUSTOM_ERROR_MATCH
      "TOTAL [0-9]+ files checked, found [1-9][0-9]* warnings"
      ${CTEST_CUSTOM_ERROR_MATCH}
    )
  elseif(COMPILER MATCHES "^(include|link)-what-you-use")
    set(CTEST_CUSTOM_MAXIMUM_NUMBER_OF_ERRORS 1000)
    set(CTEST_CUSTOM_MAXIMUM_NUMBER_OF_WARNINGS 1000)
  else()
    set(CTEST_CUSTOM_MAXIMUM_NUMBER_OF_ERRORS 100)
    set(CTEST_CUSTOM_MAXIMUM_NUMBER_OF_WARNINGS 100)
  endif()

  if(MATLAB)
    set(CTEST_CUSTOM_MAXIMUM_FAILED_TEST_OUTPUT_SIZE 307200)
    set(CTEST_CUSTOM_MAXIMUM_PASSED_TEST_OUTPUT_SIZE 307200)
  endif()

  ctest_build(APPEND NUMBER_ERRORS DASHBOARD_NUMBER_BUILD_ERRORS
    NUMBER_WARNINGS DASHBOARD_NUMBER_BUILD_WARNINGS QUIET)
  if(DASHBOARD_NUMBER_BUILD_ERRORS GREATER 0)
    set(DASHBOARD_FAILURE ON)
    list(APPEND DASHBOARD_FAILURES "BUILD")
  endif()

  if(DASHBOARD_FAILURE)
    set(DASHBOARD_BUILD_FAILURE_MESSAGE
      "*** CTest Status: NOT CONTINUING BECAUSE BUILD WAS NOT SUCCESSFUL")
    message("
  ------------------------------------------------------------------------------
  ${DASHBOARD_BUILD_FAILURE_MESSAGE}
  ------------------------------------------------------------------------------
    ")

    set(DASHBOARD_INSTALL OFF)
    set(DASHBOARD_TEST OFF)
    set(DASHBOARD_COVERAGE OFF)
    set(DASHBOARD_MEMCHECK OFF)
  endif()

  if(DASHBOARD_INSTALL)
    ctest_submit(RETRY_COUNT 4 RETRY_DELAY 15
      RETURN_VALUE DASHBOARD_SUBMIT_RETURN_VALUE QUIET)
    ctest_build(TARGET "install" APPEND
      RETURN_VALUE DASHBOARD_INSTALL_RETURN_VALUE QUIET)
    if(DASHBOARD_INSTALL AND NOT DASHBOARD_INSTALL_RETURN_VALUE EQUAL 0)
      set(DASHBOARD_FAILURE ON)
      list(APPEND DASHBOARD_FAILURES "INSTALL")
    endif()
  endif()

  if(DASHBOARD_TEST)
    ctest_test(BUILD "${CTEST_BINARY_DIRECTORY}" ${CTEST_TEST_ARGS}
      RETURN_VALUE DASHBOARD_TEST_RETURN_VALUE QUIET)
  endif()

  if(DASHBOARD_COVERAGE)
    ctest_coverage(RETURN_VALUE DASHBOARD_COVERAGE_RETURN_VALUE QUIET)
  endif()

  if(DASHBOARD_MEMCHECK)
    ctest_memcheck(RETURN_VALUE DASHBOARD_MEMCHECK_RETURN_VALUE QUIET)
  endif()

  # upload the Jenkins job URL to add link on CDash
  set(DASHBOARD_BUILD_URL_FILE
    "${CTEST_BINARY_DIRECTORY}/${DASHBOARD_BUILD_NAME}.url")
  file(WRITE "${DASHBOARD_BUILD_URL_FILE}" "$ENV{BUILD_URL}")
  ctest_upload(FILES "${DASHBOARD_BUILD_URL_FILE}" QUIET)

  ctest_submit(RETRY_COUNT 4 RETRY_DELAY 15
    RETURN_VALUE DASHBOARD_SUBMIT_RETURN_VALUE QUIET)

  if(NOT DASHBOARD_FAILURE)
    set(CTEST_SOURCE_DIRECTORY "${DASHBOARD_WORKSPACE}")
    set(CTEST_BINARY_DIRECTORY "${DASHBOARD_WORKSPACE}/build")

    set(CTEST_BUILD_NAME "${DASHBOARD_BUILD_NAME}-post-drake")
    set(CTEST_PROJECT_NAME "${DASHBOARD_SUPERBUILD_PROJECT_NAME}")
    set(CTEST_NIGHTLY_START_TIME "${DASHBOARD_NIGHTLY_START_TIME}")
    set(CTEST_DROP_METHOD "https")
    set(CTEST_DROP_SITE "${DASHBOARD_CDASH_SERVER}")
    set(CTEST_DROP_LOCATION
      "/submit.php?project=${DASHBOARD_SUPERBUILD_PROJECT_NAME}")
    set(CTEST_DROP_SITE_CDASH ON)

    ctest_start("${DASHBOARD_MODEL}" TRACK "${DASHBOARD_TRACK}" QUIET)

    ctest_configure(BUILD "${CTEST_BINARY_DIRECTORY}"
      OPTIONS "-DSKIP_DRAKE_BUILD:BOOL=OFF"
      SOURCE "${CTEST_SOURCE_DIRECTORY}"
      RETURN_VALUE DASHBOARD_SUPERBUILD_CONFIGURE_RETURN_VALUE QUIET)
    if(NOT DASHBOARD_SUPERBUILD_CONFIGURE_RETURN_VALUE EQUAL 0)
      set(DASHBOARD_FAILURE ON)
      list(APPEND DASHBOARD_FAILURES "CONFIGURE SUPERBUILD (POST-DRAKE)")
    endif()

    ctest_build(BUILD "${CTEST_BINARY_DIRECTORY}" APPEND
      NUMBER_ERRORS DASHBOARD_SUPERBUILD_NUMBER_BUILD_ERRORS QUIET)
    if(DASHBOARD_SUPERBUILD_NUMBER_BUILD_ERRORS GREATER 0)
      set(DASHBOARD_FAILURE ON)
      list(APPEND DASHBOARD_FAILURES "BUILD SUPERBUILD (POST-DRAKE)")
    endif()

    set(DASHBOARD_BUILD_URL_FILE
      "${CTEST_BINARY_DIRECTORY}/${DASHBOARD_BUILD_NAME}.url")
    file(WRITE "${DASHBOARD_BUILD_URL_FILE}" "$ENV{BUILD_URL}")
    ctest_upload(FILES "${DASHBOARD_BUILD_URL_FILE}" QUIET)

    ctest_submit(RETRY_COUNT 4 RETRY_DELAY 15
      RETURN_VALUE DASHBOARD_SUPERBUILD_SUBMIT_RETURN_VALUE QUIET)
  endif()
endif()

set(DASHBOARD_WARNING OFF)

if(DASHBOARD_FAILURE)
  string(REPLACE ";" " / " DASHBOARD_FAILURES_STRING "${DASHBOARD_FAILURES}")
  set(DASHBOARD_MESSAGE "FAILURE DURING ${DASHBOARD_FAILURES_STRING}")
  file(WRITE "${DASHBOARD_WORKSPACE}/FAILURE")
else()
  if(DASHBOARD_NUMBER_BUILD_WARNINGS EQUAL 1)
    set(DASHBOARD_WARNING ON)
    set(DASHBOARD_MESSAGE "SUCCESS BUT WITH 1 BUILD WARNING")
  elseif(DASHBOARD_NUMBER_BUILD_WARNINGS GREATER 1)
    set(DASHBOARD_WARNING ON)
    set(DASHBOARD_MESSAGE "SUCCESS BUT WITH ${DASHBOARD_NUMBER_BUILD_WARNINGS} BUILD WARNINGS")
  else()
    set(DASHBOARD_MESSAGE "SUCCESS")
  endif()

  set(DASHBOARD_UNSTABLE OFF)
  set(DASHBOARD_UNSTABLES "")

  if(DASHBOARD_WARNING)
    if(COMPILER MATCHES "^((include|link)-what-you-use|scan-build)")
      set(DASHBOARD_UNSTABLE ON)
      list(APPEND DASHBOARD_UNSTABLES "STATIC ANALYSIS TOOL")
    endif()
  endif()

  if(DASHBOARD_TEST AND NOT DASHBOARD_TEST_RETURN_VALUE EQUAL 0)
    set(DASHBOARD_UNSTABLE ON)
    list(APPEND DASHBOARD_UNSTABLES "TEST")
  endif()

  # if(DASHBOARD_COVERAGE AND NOT DASHBOARD_COVERAGE_RETURN_VALUE EQUAL 0)  # FIXME #3269
  #   set(DASHBOARD_UNSTABLE ON)
  #   list(APPEND DASHBOARD_UNSTABLES "COVERAGE TOOL")
  # endif()

  if(DASHBOARD_MEMCHECK AND NOT DASHBOARD_MEMCHECK_RETURN_VALUE EQUAL 0)
    set(DASHBOARD_UNSTABLE ON)
    list(APPEND DASHBOARD_UNSTABLES "MEMCHECK TOOL")
  endif()

  if(DASHBOARD_UNSTABLE)
    string(REPLACE ";" " / " DASHBOARD_UNSTABLES_STRING "${DASHBOARD_UNSTABLES}")
    set(DASHBOARD_MESSAGE
      "UNSTABLE DUE TO ${DASHBOARD_UNSTABLES_STRING} FAILURES")
    file(WRITE "${DASHBOARD_WORKSPACE}/UNSTABLE")
  else()
    file(WRITE "${DASHBOARD_WORKSPACE}/SUCCESS")
  endif()
endif()

if(DOCUMENTATION STREQUAL "publish")
  if(DASHBOARD_FAILURE OR DASHBOARD_UNSTABLE)
    set(DASHBOARD_PUBLISH_DOCUMENTATION OFF)
    set(DASHBOARD_PUBLISH_DOCUMENTATION_MESSAGE "*** CTest Status: NOT PUBLISHING DOCUMENTATION BECAUSE BUILD WAS NOT SUCCESSFUL")
  else()
    set(DASHBOARD_PUBLISH_DOCUMENTATION ON)
    set(DASHBOARD_PUBLISH_DOCUMENTATION_MESSAGE "*** CTest Status: PUBLISHING DOCUMENTATION")
  endif()
  message("
    ------------------------------------------------------------------------------
    ${DASHBOARD_PUBLISH_DOCUMENTATION_MESSAGE}
    ------------------------------------------------------------------------------
  ")
  if(DASHBOARD_PUBLISH_DOCUMENTATION)
    execute_process(COMMAND "${DASHBOARD_TOOLS_DIR}/publish_documentation.bash"
      WORKING_DIRECTORY "${DASHBOARD_WORKSPACE}"
      RESULT_VARIABLE DASHBOARD_PUBLISH_DOCUMENTATION_RESULT_VARIABLE
      OUTPUT_VARIABLE DASHBOARD_PUBLISH_DOCUMENTATION_OUTPUT_VARIABLE
      ERROR_VARIABLE DASHBOARD_PUBLISH_DOCUMENTATION_OUTPUT_VARIABLE)
    message("${DASHBOARD_PUBLISH_DOCUMENTATION_OUTPUT_VARIABLE}")
    if(NOT DASHBOARD_PUBLISH_DOCUMENTATION_RESULT_VARIABLE EQUAL 0)
      set(DASHBOARD_UNSTABLE ON)
      set(DASHBOARD_MESSAGE "UNSTABLE DUE TO FAILURE PUBLISHING DOCUMENTATION")
      file(REMOVE "${DASHBOARD_WORKSPACE}/SUCCESS")
      file(WRITE "${DASHBOARD_WORKSPACE}/UNSTABLE")
    endif()
  endif()
endif()

set(DASHBOARD_MESSAGE "*** CTest Result: ${DASHBOARD_MESSAGE}")

if(DASHBOARD_CONFIGURE_AND_BUILD_SUPERBUILD AND DASHBOARD_LABEL)
  set(DASHBOARD_CDASH_SUPERBUILD_URL_MESSAGE
    "*** CDash Superbuild URL: https://${DASHBOARD_CDASH_SERVER}/index.php?project=${DASHBOARD_SUPERBUILD_PROJECT_NAME}&showfilters=1&filtercount=2&showfilters=1&filtercombine=and&field1=label&compare1=61&value1=${DASHBOARD_LABEL}&field2=buildstarttime&compare2=84&value2=now")
else()
  set(DASHBOARD_CDASH_SUPERBUILD_URL_MESSAGE "*** CDash Superbuild URL:")
endif()

if(NOT DASHBOARD_SUPERBUILD_FAILURE AND DASHBOARD_LABEL)
  set(DASHBOARD_CDASH_URL_MESSAGE
    "*** CDash URL: https://${DASHBOARD_CDASH_SERVER}/index.php?project=${DASHBOARD_PROJECT_NAME}&showfilters=1&filtercount=2&showfilters=1&filtercombine=and&field1=label&compare1=61&value1=${DASHBOARD_LABEL}&field2=buildstarttime&compare2=84&value2=now")
else()
  set(DASHBOARD_CDASH_URL_MESSAGE "*** CDash URL:")
endif()

# Report build result and CDash links
message("
  ------------------------------------------------------------------------------
  ${DASHBOARD_MESSAGE}
  ------------------------------------------------------------------------------
  ${DASHBOARD_CDASH_SUPERBUILD_URL_MESSAGE}
  ------------------------------------------------------------------------------
  ${DASHBOARD_CDASH_URL_MESSAGE}
  ------------------------------------------------------------------------------
  ")

# Touch "warm" file
if(NOT APPLE AND NOT DASHBOARD_WARM AND NOT COMPILER STREQUAL "cpplint")
  file(WRITE "${DASHBOARD_WARM_FILE}")
endif()

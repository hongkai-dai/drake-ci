# CTEST_SOURCE_DIRECTORY and CTEST_BINARY_DIRECTORY are set in bazel.cmake.

notice("CTest Status: RUNNING BAZEL")

begin_stage(
  PROJECT_NAME "Drake"
  BUILD_NAME "${DASHBOARD_BUILD_NAME}-bazel")

ctest_start("${DASHBOARD_MODEL}" TRACK "${DASHBOARD_TRACK}" QUIET)
ctest_update(SOURCE "${CTEST_SOURCE_DIRECTORY}"
  RETURN_VALUE DASHBOARD_UPDATE_RETURN_VALUE QUIET)

set(CTEST_BUILD_COMMAND
  "${DASHBOARD_BAZEL_COMMAND} ${DASHBOARD_BAZEL_STARTUP_OPTIONS} test ${DASHBOARD_BAZEL_BUILD_OPTIONS} ...")

ctest_build(BUILD "${DASHBOARD_SOURCE_DIRECTORY}"
  NUMBER_ERRORS DASHBOARD_NUMBER_BUILD_ERRORS
  NUMBER_WARNINGS DASHBOARD_NUMBER_BUILD_WARNINGS QUIET)
if(DASHBOARD_NUMBER_BUILD_ERRORS GREATER 0)
  set(DASHBOARD_FAILURE ON)
  list(APPEND DASHBOARD_FAILURES "BAZEL BUILD")
endif()

set(DASHBOARD_BUILD_URL_FILE
  "${CTEST_BINARY_DIRECTORY}/${DASHBOARD_BUILD_NAME}.url")
file(WRITE "${DASHBOARD_BUILD_URL_FILE}" "$ENV{BUILD_URL}")
ctest_upload(FILES "${DASHBOARD_BUILD_URL_FILE}" QUIET)

ctest_submit(RETRY_COUNT 4 RETRY_DELAY 15
  RETURN_VALUE DASHBOARD_SUBMIT_RETURN_VALUE QUIET)

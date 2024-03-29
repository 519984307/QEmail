﻿cmake_minimum_required(VERSION 3.14)

project(QEmail VERSION 0.1 LANGUAGES CXX)

add_subdirectory(infrastructure)
add_subdirectory(domain)
add_subdirectory(application)
add_subdirectory(controller)
add_subdirectory(ui)

set(PROJECT_SOURCES
    main.cpp
    ui/res/qml.qrc
)

add_definitions(-DVERSION=1,0,0,4)

if (CMAKE_SYSTEM_NAME STREQUAL "Windows")
    add_executable(QEmail ${PROJECT_SOURCES} ${PROJECT_SOURCE_DIR}/rc/version.rc)
    message(${DEPLOYQT_EXECUTABLE})
    add_custom_command(TARGET ${PROJECT_NAME}
        POST_BUILD
        COMMAND ${DEPLOYQT_EXECUTABLE} "$<TARGET_FILE:${PROJECT_NAME}>"
        --$<LOWER_CASE:$<CONFIG>> --qmldir ${CMAKE_SOURCE_DIR}
    )
else ()
    add_executable(QEmail ${PROJECT_SOURCES})
endif ()

target_link_libraries(QEmail PRIVATE
    Qt${QT_VERSION_MAJOR}::QmlPrivate
    Qt${QT_VERSION_MAJOR}::QuickPrivate
    Qt${QT_VERSION_MAJOR}::QuickControls2Private
    Qt${QT_VERSION_MAJOR}::WidgetsPrivate
    UI
)

target_include_directories(QEmail PRIVATE
    ${CMAKE_SOURCE_DIR}/src
)

set_target_properties(QEmail PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER zhjw.QEmail.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

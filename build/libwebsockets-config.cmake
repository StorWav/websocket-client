# libwebsockets-config.cmake
# Configuration file for the libwebsockets package.

# Prevent multiple inclusions
if (DEFINED libwebsockets_CONFIG_INCLUDED)
  return()
endif()
set(libwebsockets_CONFIG_INCLUDED TRUE)

# Package version
set(libwebsockets_VERSION "1.0")

# Include directories
set(libwebsockets_INCLUDE_DIRS
    "/usr/include/"
    "/usr/include/libwebsockets/"
)

# HACK - disable this flag used in websocket-client
add_compile_definitions(LCCSCF_PRIORITIZE_READS=0)

# Library directories
set(libwebsockets_LIBRARY_DIRS
    "/usr/lib/x86_64-linux-gnu/"
)

# Libraries
set(libwebsockets_LIBRARIES
    "libwebsockets.a" # Replace with the actual library name
    uv ev cap ssl crypto
)

# Target definition (optional, but recommended)
if (NOT TARGET libwebsockets::libwebsockets)
  add_library(libwebsockets::libwebsockets INTERFACE IMPORTED)
  set_target_properties(libwebsockets::libwebsockets PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${libwebsockets_INCLUDE_DIRS}"
    INTERFACE_LINK_DIRECTORIES "${libwebsockets_LIBRARY_DIRS}"
    INTERFACE_LINK_LIBRARIES "${libwebsockets_LIBRARIES}"
  )
endif()

# Print message (optional)
if (NOT libwebsockets_FIND_QUIETLY)
  message(STATUS "Found libwebsockets: ${libwebsockets_VERSION}")
endif()

# Handle required components (optional)
if (libwebsockets_FIND_COMPONENTS)
  foreach(component ${libwebsockets_FIND_COMPONENTS})
    if (NOT component STREQUAL "default")
      message(FATAL_ERROR "Component '${component}' not supported by libwebsockets.")
    endif()
  endforeach()
endif()
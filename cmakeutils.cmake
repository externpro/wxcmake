function(set_wxtarget_properties target)
  set(wxversion 28)
  if(MSVC)
    # toolset
    if(MSVC60)
      set(toolset vc60)
    elseif(MSVC70)
      set(toolset vc70)
    elseif(MSVC71)
      set(toolset vc71)
    elseif(MSVC80)
      set(toolset vc80)
    elseif(MSVC90)
      set(toolset vc90)
    elseif(MSVC10)
      set(toolset vc100)
    else()
      set(toolset vcXX)
    endif()
    # wxbasename
    set(wxbasename wxmsw)
  else()
    set(wxbasename wxX)
  endif()
  if(${target} MATCHES "base")
    get_directory_property(global_includes INCLUDE_DIRECTORIES)
    set_property(TARGET ${target} PROPERTY
      INCLUDE_DIRECTORIES ${global_includes} ${wxroot}/src/regex ${wxroot}/src/zlib)
    set_property(TARGET ${target} PROPERTY
      COMPILE_DEFINITIONS __WXMSW__ WXBUILDING wxUSE_GUI=0 wxUSE_BASE=1)
    set_property(TARGET ${target} PROPERTY FOLDER wxbase_libs)
    set_target_properties(${target} PROPERTIES
      OUTPUT_NAME wxbase${wxversion}${toolset}x
      DEBUG_OUTPUT_NAME wxbase${wxversion}${toolset}d
      RELEASEMT_OUTPUT_NAME wxbase${wxversion}${toolset}s
      RELEASE_OUTPUT_NAME wxbase${wxversion}${toolset}
      COMPILE_FLAGS /W4
      )
  elseif(${target} MATCHES "net" OR ${target} MATCHES "odbc" OR ${target} MATCHES "xml")
    set_property(TARGET ${target} PROPERTY
      COMPILE_DEFINITIONS __WXMSW__ WXBUILDING wxUSE_GUI=0)
    set_property(TARGET ${target} PROPERTY FOLDER wxbase_libs)
    set_target_properties(${target} PROPERTIES
      OUTPUT_NAME wxbase${wxversion}${toolset}x_${target}
      DEBUG_OUTPUT_NAME wxbase${wxversion}${toolset}d_${target}
      RELEASEMT_OUTPUT_NAME wxbase${wxversion}${toolset}s_${target}
      RELEASE_OUTPUT_NAME wxbase${wxversion}${toolset}_${target}
      COMPILE_FLAGS /W4
      )
  elseif(${target} MATCHES "^wx") # any target that starts with "wx"
    set_property(TARGET ${target} PROPERTY FOLDER wxthirdparty_libs)
    set_target_properties(${target} PROPERTIES
      OUTPUT_NAME ${target}_${toolset}x
      DEBUG_OUTPUT_NAME ${target}_${toolset}d
      RELEASEMT_OUTPUT_NAME ${target}_${toolset}s
      RELEASE_OUTPUT_NAME ${target}_${toolset}
      COMPILE_FLAGS /W1
      )
  else()
    get_target_property(target_defs ${target} COMPILE_DEFINITIONS)
    if(NOT target_defs)
      set(target_defs)
    endif()
    set_property(TARGET ${target} PROPERTY
      COMPILE_DEFINITIONS __WXMSW__ WXBUILDING ${target_defs})
    set_property(TARGET ${target} PROPERTY FOLDER ${wxbasename}_libs)
    set_target_properties(${target} PROPERTIES
      OUTPUT_NAME ${wxbasename}${wxversion}${toolset}x_${target}
      DEBUG_OUTPUT_NAME ${wxbasename}${wxversion}${toolset}d_${target}
      RELEASEMT_OUTPUT_NAME ${wxbasename}${wxversion}${toolset}s_${target}
      RELEASE_OUTPUT_NAME ${wxbasename}${wxversion}${toolset}_${target}
      COMPILE_FLAGS /W4
      )
  endif()
  # NOTE: It appears /MACHINE needs to be specified if target has an .rc
  if(${CMAKE_GENERATOR} MATCHES "Win64$")
    # http://public.kitware.com/Bug/view.php?id=11240
    set_target_properties(${target} PROPERTIES STATIC_LIBRARY_FLAGS "/MACHINE:X64")
  elseif(MSVC)
    # MSVC defaults to X86, but specifying it here avoids a link warning (LNK4068)
    set_target_properties(${target} PROPERTIES STATIC_LIBRARY_FLAGS "/MACHINE:X86")
  endif()
  install(TARGETS ${lib_name} DESTINATION lib${NUMBITS})
endfunction()

add_definitions(-D_LIB)
set(CMAKE_DEBUG_POSTFIX)
set(CMAKE_RELEASEMT_POSTFIX)
set(CMAKE_RELEASE_POSTFIX)
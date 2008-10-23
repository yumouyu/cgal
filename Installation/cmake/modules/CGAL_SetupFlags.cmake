#
# Set CGAL_DONT_OVERRIDE_CMAKE_FLAGS to TRUE if you need to prevent the CGAL configuration to
# override the flags autodefined by cmake.
#

if ( NOT CGAL_DONT_OVERRIDE_CMAKE_FLAGS )

  if ( CGAL_CXX_FLAGS_INIT )
    set ( CMAKE_CXX_FLAGS "${CGAL_CXX_FLAGS_INIT}" )
    message( STATUS "OVERRIDING CMAKE_CXX_FLAGS = '${CMAKE_CXX_FLAGS}'" )
  endif()
  
  if ( CGAL_CXX_FLAGS_DEBUG_INIT )
    set ( CMAKE_CXX_FLAGS_DEBUG "${CGAL_CXX_FLAGS_DEBUG_INIT}" )
    message( STATUS "OVERRIDING CMAKE_CXX_FLAGS_DEBUG = '${CMAKE_CXX_FLAGS_DEBUG}'" )
  endif()
  
  if ( CGAL_CXX_FLAGS_RELEASE_INIT )
    set ( CMAKE_CXX_FLAGS_RELEASE "${CGAL_CXX_FLAGS_RELEASE_INIT}" )
    message( STATUS "OVERRIDING CMAKE_CXX_FLAGS_RELEASE = '${CMAKE_CXX_FLAGS_RELEASE}'" )
  endif()

  if ( CGAL_EXE_LINKER_FLAGS_INIT )
    set ( CMAKE_EXE_LINKER_FLAGS "${CGAL_EXE_LINKER_FLAGS_INIT}" )
    message( STATUS "OVERRIDING CMAKE_EXE_LINKER_FLAGS = '${CMAKE_EXE_LINKER_FLAGS}'" )
  endif()
  
  if ( CGAL_EXE_LINKER_FLAGS_DEBUG_INIT )
    set ( CMAKE_EXE_LINKER_FLAGS_DEBUG "${CGAL_EXE_LINKER_FLAGS_DEBUG_INIT}" )
    message( STATUS "OVERRIDING CMAKE_EXE_LINKER_FLAGS_DEBUG = '${CMAKE_EXE_LINKER_FLAGS_DEBUG}'" )
  endif()
  
  if ( CGAL_EXE_LINKER_FLAGS_RELEASE_INIT )
    set ( CMAKE_EXE_LINKER_FLAGS_RELEASE "${CGAL_EXE_LINKER_FLAGS_RELEASE_INIT}" )
    message( STATUS "OVERRIDING CMAKE_EXE_LINKER_FLAGS_RELEASE = '${CMAKE_EXE_LINKER_FLAGS_RELEASE}'" )
  endif()

endif()

if ( CGAL_RELEASE )
  message( STATUS "USING CUSTOM_CXXFLAGS = '${CGAL_CXX_FLAGS}  ${CGAL_CXX_FLAGS_RELEASE}'" )
  message( STATUS "USING        CXXFLAGS = '${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_RELEASE}'" )
  set(CMAKE_CXX_FLAGS_RELEASE_INIT "${CMAKE_CXX_FLAGS_RELEASE}")  
  set(CMAKE_CXX_FLAGS_RELEASE      "${CMAKE_CXX_FLAGS_RELEASE} ${CGAL_CXX_FLAGS_RELEASE}")  
  if ( NOT CMAKE_BUILD_TYPE )
    set ( CMAKE_BUILD_TYPE Release )
  endif()
endif()

if ( CGAL_DEBUG )
  message( STATUS "USING CUSTOM_CXXFLAGS = '${CGAL_CXX_FLAGS} ${CGAL_CXX_FLAGS_DEBUG}'" )
  message( STATUS "USING        CXXFLAGS = '${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_DEBUG}'" )
  set(CMAKE_CXX_FLAGS_DEBUG_INIT "${CMAKE_CXX_FLAGS_DEBUG}") 
  set(CMAKE_CXX_FLAGS_DEBUG      "${CMAKE_CXX_FLAGS_DEBUG} ${CGAL_CXX_FLAGS_DEBUG}") 
  if ( NOT CMAKE_BUILD_TYPE )
    set ( CMAKE_BUILD_TYPE Debug )
  endif()
endif()

set(CMAKE_CXX_FLAGS_INIT "${CMAKE_CXX_FLAGS}")  
set(CMAKE_CXX_FLAGS      "${CMAKE_CXX_FLAGS} ${CGAL_CXX_FLAGS}")  

if ( BUILD_SHARED_LIBS )
  
  if ( CGAL_RELEASE )
    message( STATUS "USING CUSTOM_LDFLAGS = '${CGAL_SHARED_LINKER_FLAGS}  ${CGAL_SHARED_LINKER_FLAGS_RELEASE}'" )
    message( STATUS "USING        LDFLAGS = ' ${CMAKE_SHARED_LINKER_FLAGS} ${CMAKE_SHARED_LINKER_FLAGS_RELEASE}'" )
    set(CMAKE_SHARED_LINKER_FLAGS_RELEASE_INIT "${CMAKE_SHARED_LINKER_FLAGS_RELEASE}")
    set(CMAKE_SHARED_LINKER_FLAGS_RELEASE      "${CMAKE_SHARED_LINKER_FLAGS_RELEASE} ${CGAL_SHARED_LINKER_FLAGS_RELEASE}")
  endif()
  
  if ( CGAL_DEBUG )
    message( STATUS "USING CUSTOM_LDFLAGS = '${CGAL_SHARED_LINKER_FLAGS}  ${CGAL_SHARED_LINKER_FLAGS_DEBUG}'" )
    message( STATUS "USING        LDFLAGS = '${CMAKE_SHARED_LINKER_FLAGS} ${CMAKE_SHARED_LINKER_FLAGS_DEBUG}'" )
    set(CMAKE_SHARED_LINKER_FLAGS_DEBUG_INIT "${CMAKE_SHARED_LINKER_FLAGS_DEBUG}")
    set(CMAKE_SHARED_LINKER_FLAGS_DEBUG      "${CMAKE_SHARED_LINKER_FLAGS_DEBUG} ${CGAL_SHARED_LINKER_FLAGS_DEBUG}")
  endif()
  
  set(CMAKE_SHARED_LINKER_FLAGS_INIT "${CMAKE_SHARED_LINKER_FLAGS}")
  set(CMAKE_SHARED_LINKER_FLAGS      "${CMAKE_SHARED_LINKER_FLAGS} ${CGAL_SHARED_LINKER_FLAGS}")

else()

  
  if ( CGAL_RELEASE )
    message( STATUS "USING CUSTOM_LDFLAGS = '${CGAL_STATIC_LINKER_FLAGS}  ${CGAL_STATIC_LINKER_FLAGS_RELEASE}'" )
    message( STATUS "USING        LDFLAGS = '${CMAKE_STATIC_LINKER_FLAGS} ${CMAKE_STATIC_LINKER_FLAGS_RELEASE}'" )
    set(CMAKE_MODULE_LINKER_FLAGS_RELEASE_INIT "${CMAKE_MODULE_LINKER_FLAGS_RELEASE}")
    set(CMAKE_MODULE_LINKER_FLAGS_RELEASE      "${CMAKE_MODULE_LINKER_FLAGS_RELEASE} ${CGAL_MODULE_LINKER_FLAGS_RELEASE}")
  endif()
  
  if ( CGAL_DEBUG )
    message( STATUS "USING CUSTOM_LDFLAGS = '${CGAL_STATIC_LINKER_FLAGS}  ${CGAL_STATIC_LINKER_FLAGS_DEBUG}'" )
    message( STATUS "USING        LDFLAGS = '${CMAKE_STATIC_LINKER_FLAGS} ${CMAKE_STATIC_LINKER_FLAGS_DEBUG}'" )
    set(CMAKE_MODULE_LINKER_FLAGS_DEBUG_INIT "${CMAKE_MODULE_LINKER_FLAGS_DEBUG}")
    set(CMAKE_MODULE_LINKER_FLAGS_DEBUG      "${CMAKE_MODULE_LINKER_FLAGS_DEBUG} ${CGAL_MODULE_LINKER_FLAGS_DEBUG}")
  endif()
  
  set(CMAKE_MODULE_LINKER_FLAGS_INIT "${CMAKE_MODULE_LINKER_FLAGS}")
  set(CMAKE_MODULE_LINKER_FLAGS      "${CMAKE_MODULE_LINKER_FLAGS} ${CGAL_MODULE_LINKER_FLAGS}")

endif()


if ( CGAL_RELEASE )
  message( STATUS "USING CUSTOM_EXEFLAGS = '${CGAL_EXE_LINKER_FLAGS}  ${CGAL_EXE_LINKER_FLAGS_RELEASE}'" )
  message( STATUS "USING        EXEFLAGS = '${CMAKE_EXE_LINKER_FLAGS} ${CMAKE_EXE_LINKER_FLAGS_RELEASE}'" )
  set(CMAKE_EXE_LINKER_FLAGS_RELEASE_INIT "${CMAKE_EXE_LINKER_FLAGS_RELEASE}")
  set(CMAKE_EXE_LINKER_FLAGS_RELEASE      "${CMAKE_EXE_LINKER_FLAGS_RELEASE} ${CGAL_EXE_LINKER_FLAGS_RELEASE}")
endif()

if ( CGAL_DEBUG )
  message( STATUS "USING CUSTOM_EXEFLAGS = '${CGAL_EXE_LINKER_FLAGS}  ${CGAL_EXE_LINKER_FLAGS_DEBUG}'" )
  message( STATUS "USING        EXEFLAGS = '${CMAKE_EXE_LINKER_FLAGS} ${CMAKE_EXE_LINKER_FLAGS_DEBUG}'" )
  set(CMAKE_EXE_LINKER_FLAGS_DEBUG_INIT "${CMAKE_EXE_LINKER_FLAGS_DEBUG}")
  set(CMAKE_EXE_LINKER_FLAGS_DEBUG      "${CMAKE_EXE_LINKER_FLAGS_DEBUG} ${CGAL_EXE_LINKER_FLAGS_DEBUG}")
endif()

set(CMAKE_EXE_LINKER_FLAGS_INIT "${CMAKE_EXE_LINKER_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS      "${CMAKE_EXE_LINKER_FLAGS} ${CGAL_EXE_LINKER_FLAGS}")

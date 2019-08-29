cmake_minimum_required(VERSION 3.10)

add_custom_target(SvgLogos ALL
                  DEPENDS metalogo-black-yellow-512.svg metalogo-black-yellow-200.svg metalogo-yellow-black-512.svg metalogo-yellow-black-200.svg metalogo-black-white-512.svg metalogo-black-white-200.svg metalogo-white-black-512.svg metalogo-white-black-200.svg metalogo-white-black-250.svg)

add_custom_target(PngLogos ALL
                  DEPENDS metalogo-black-yellow-512.png metalogo-black-yellow-200.png metalogo-yellow-black-512.png metalogo-yellow-black-200.png metalogo-black-white-512.png metalogo-black-white-200.png metalogo-white-black-512.png metalogo-white-black-200.png metalogo-white-black-250.png)

add_custom_command(OUTPUT metalogo-black-yellow-512.png metalogo-black-yellow-200.png metalogo-yellow-black-512.png metalogo-yellow-black-200.png metalogo-black-white-512.png metalogo-black-white-200.png metalogo-white-black-512.png metalogo-white-black-200.png metalogo-white-black-250.png
                   COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/metalogo-black-yellow-512.svg ${CMAKE_CURRENT_BINARY_DIR}/metalogo-black-yellow-512.png
                   COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/metalogo-black-yellow-200.svg ${CMAKE_CURRENT_BINARY_DIR}/metalogo-black-yellow-200.png
                   COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/metalogo-yellow-black-512.svg ${CMAKE_CURRENT_BINARY_DIR}/metalogo-yellow-black-512.png
                   COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/metalogo-yellow-black-200.svg ${CMAKE_CURRENT_BINARY_DIR}/metalogo-yellow-black-200.png
                   COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/metalogo-black-white-512.svg ${CMAKE_CURRENT_BINARY_DIR}/metalogo-black-white-512.png
                   COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/metalogo-black-white-200.svg ${CMAKE_CURRENT_BINARY_DIR}/metalogo-black-white-200.png
                   COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/metalogo-white-black-512.svg ${CMAKE_CURRENT_BINARY_DIR}/metalogo-white-black-512.png
                   COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/metalogo-white-black-200.svg ${CMAKE_CURRENT_BINARY_DIR}/metalogo-white-black-200.png
                   COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/metalogo-white-black-250.svg ${CMAKE_CURRENT_BINARY_DIR}/metalogo-white-black-250.png)

add_custom_command(OUTPUT metalogo-black-yellow-512.svg metalogo-black-yellow-200.svg metalogo-yellow-black-512.svg metalogo-yellow-black-200.svg metalogo-black-white-512.svg metalogo-black-white-200.svg metalogo-white-black-512.svg metalogo-white-black-200.svg metalogo-white-black-250.svg
                   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 256 0.95 45 000000 ffd700 > ${CMAKE_CURRENT_BINARY_DIR}/metalogo-black-yellow-512.svg
		   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 100 0.95 45 000000 ffd700 > ${CMAKE_CURRENT_BINARY_DIR}/metalogo-black-yellow-200.svg
                   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 256 0.95 45 ffd700 000000 > ${CMAKE_CURRENT_BINARY_DIR}/metalogo-yellow-black-512.svg
                   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 100 0.95 45 ffd700 000000 > ${CMAKE_CURRENT_BINARY_DIR}/metalogo-yellow-black-200.svg
                   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 256 0.95 45 000000 ffffff > ${CMAKE_CURRENT_BINARY_DIR}/metalogo-black-white-512.svg
		   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 100 0.95 45 000000 ffffff > ${CMAKE_CURRENT_BINARY_DIR}/metalogo-black-white-200.svg
                   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 256 0.95 45 ffffff 000000 > ${CMAKE_CURRENT_BINARY_DIR}/metalogo-white-black-512.svg
                   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 100 0.95 45 ffffff 000000 > ${CMAKE_CURRENT_BINARY_DIR}/metalogo-white-black-200.svg
                   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 125 0.95 45 ffffff 000000 > ${CMAKE_CURRENT_BINARY_DIR}/metalogo-white-black-250.svg)


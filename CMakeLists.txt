cmake_minimum_required(VERSION 3.10)

add_custom_target(SvgLogos ALL
  DEPENDS site-icon.svg logo.svg)

add_custom_command(OUTPUT site-icon.svg logo.svg
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 256 0.95 45 000000 ffffff > ${CMAKE_CURRENT_BINARY_DIR}/site-icon.svg
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 80 0.95 45 0073a8 ffffff > ${CMAKE_CURRENT_BINARY_DIR}/logo.svg)

add_custom_target(PngLogos ALL
  DEPENDS site-icon.png logo.png)

add_custom_command(OUTPUT site-icon.png logo.png
  COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/logo.svg ${CMAKE_CURRENT_BINARY_DIR}/logo.png)



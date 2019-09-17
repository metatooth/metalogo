cmake_minimum_required(VERSION 3.10)

add_custom_target(SvgLogos ALL
  DEPENDS site-icon--512x512.svg)

add_custom_command(OUTPUT site-icon--512x512.svg
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 256 0.95 45 black white > ${CMAKE_CURRENT_BINARY_DIR}/site-icon--512x512.svg)

add_custom_target(PngLogos ALL
  DEPENDS site-icon--512x512.png)

add_custom_command(OUTPUT site-icon--512x512.png
  COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/site-icon--512x512.svg ${CMAKE_CURRENT_BINARY_DIR}/site-icon--512x512.png)



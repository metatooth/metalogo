cmake_minimum_required(VERSION 3.10)

add_custom_target(SvgLogos ALL
  DEPENDS site-icon.svg logo.svg site-icon-red.svg logo-red.svg site-icon-green.svg logo-green.svg site-icon-blue.svg logo-blue.svg)

add_custom_command(OUTPUT site-icon.svg logo.svg site-icon-red.svg logo-red.svg site-icon-green.svg logo-green.svg site-icon-blue.svg logo-blue.svg
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 256 0.95 45 000000 ffffff > ${CMAKE_CURRENT_BINARY_DIR}/site-icon.svg
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 80 0.95 45 000000 ffffff > ${CMAKE_CURRENT_BINARY_DIR}/logo.svg
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 256 0.95 45 ff33bb ffffff  > ${CMAKE_CURRENT_BINARY_DIR}/site-icon-red.svg
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 80 0.95 45 ff33bb ffffff > ${CMAKE_CURRENT_BINARY_DIR}/logo-red.svg
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 256 0.95 45 000000 4d9900 > ${CMAKE_CURRENT_BINARY_DIR}/site-icon-green.svg
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 80 0.95 45 000000 4d9900 > ${CMAKE_CURRENT_BINARY_DIR}/logo-green.svg
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 256 0.95 45 000000 33669f > ${CMAKE_CURRENT_BINARY_DIR}/site-icon-blue.svg
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/metalogo.sh ARGS 80 0.95 45 000000 33669f > ${CMAKE_CURRENT_BINARY_DIR}/logo-blue.svg)

add_custom_target(PngLogos ALL
  DEPENDS site-icon.png logo.png site-icon-red.png logo-red.png site-icon-green.png logo-green.png site-icon-blue.png logo-blue.png)

add_custom_command(OUTPUT site-icon.png logo.png site-icon-red.png logo-red.png site-icon-green.png logo-green.png site-icon-blue.png logo-blue.png
  COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/site-icon.svg ${CMAKE_CURRENT_BINARY_DIR}/site-icon.png
  COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/logo.svg ${CMAKE_CURRENT_BINARY_DIR}/logo.png
  COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/site-icon-red.svg ${CMAKE_CURRENT_BINARY_DIR}/site-icon-red.png
  COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/logo-red.svg ${CMAKE_CURRENT_BINARY_DIR}/logo-red.png
  COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/site-icon-green.svg ${CMAKE_CURRENT_BINARY_DIR}/site-icon-green.png
  COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/logo-green.svg ${CMAKE_CURRENT_BINARY_DIR}/logo-green.png
  COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/site-icon-blue.svg ${CMAKE_CURRENT_BINARY_DIR}/site-icon-blue.png
  COMMAND convert -background none ${CMAKE_CURRENT_BINARY_DIR}/logo-blue.svg ${CMAKE_CURRENT_BINARY_DIR}/logo-blue.png)



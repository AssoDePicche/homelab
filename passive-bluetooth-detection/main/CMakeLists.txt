idf_component_register(SRCS "main.c"
  INCLUDE_DIRS "." REQUIRES bt driver esp_netif esp_timer mqtt nvs_flash)

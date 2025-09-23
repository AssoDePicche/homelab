#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/unistd.h>
#include <time.h>

#include "driver/gpio.h"
#include "driver/sdspi_host.h"
#include "driver/spi_common.h"
#include "esp_bt.h"
#include "esp_bt_main.h"
#include "esp_gap_ble_api.h"
#include "esp_gap_bt_api.h"
#include "esp_log.h"
#include "esp_system.h"
#include "esp_timer.h"
#include "freertos/FreeRTOS.h"
#include "freertos/event_groups.h"
#include "freertos/task.h"
#include "nvs_flash.h"
#include "sdmmc_cmd.h"

#define SD_CARD_CS GPIO_NUM_33
#define SD_CARD_SCK GPIO_NUM_32
#define SD_CARD_MISO GPIO_NUM_34
#define LED GPIO_NUM_23

#define ESP_MQTT_ADDR ""
#define ESP_WIFI_SSID ""
#define ESP_WIFI_PASS ""
#define ESP_MAX_WIFI_CONN_RETRY 3
#define TICKS_TO_DELAY (100 / portTICK_PERIOD_MS)
#define TAG "ESP"
#define MAX_BUFFER_SIZE 10
#define ESP_BT_MIN_RSSI (-70)

static bool is_LED_on = false;

typedef struct {
  char strftime[64];
  uint8_t BDA[ESP_BD_ADDR_LEN];
  int8_t RSSI;
} device_t;

static void serialize_device(device_t device) {}

static device_t buffer[MAX_BUFFER_SIZE];

static size_t buffer_size = 0;

static void write_buffer_to_SD_Card() {
  for (size_t index = 0; index < buffer_size; ++index) {
  }

  buffer_size = 0;
}

static void add_device(const uint8_t *BDA, const int8_t RSSI) {
  if (MAX_BUFFER_SIZE == buffer_size) {
    ESP_LOGW(TAG, "Buffer is full");

    ESP_LOGW(TAG, "Buffer is full");

    write_buffer_to_SD_Card();
  }

  if (RSSI < ESP_BT_MIN_RSSI) {
    ESP_LOGI(TAG, "Ignoring low RSSI");

    return;
  }

  for (size_t index = 0; index < buffer_size; ++index) {
    if (memcmp(BDA, buffer[index].BDA, ESP_BD_ADDR_LEN) == 0) {
      return;
    }
  }

  buffer[buffer_size] = (device_t){
      .RSSI = RSSI,
  };

  time_t now;

  char strftime_buffer[64];

  struct tm timeinfo;

  time(&now);

  setenv("TZ", "America/Sao_Paulo", 1);

  tzset();

  localtime_r(&now, &timeinfo);

  strftime(strftime_buffer, sizeof(strftime_buffer), "%c", &timeinfo);

  memcpy(buffer[buffer_size].strftime, strftime_buffer,
         sizeof(strftime_buffer));

  memcpy(buffer[buffer_size].BDA, BDA, ESP_BD_ADDR_LEN);

  ++buffer_size;

  is_LED_on = true;

  ESP_LOGI(TAG, "%s %02X:%02X:%02X:%02X:%02X:%02X:%02X:%02X %d dBm",
           strftime_buffer, BDA[0], BDA[1], BDA[2], BDA[3], BDA[4], BDA[5],
           BDA[6], BDA[7], RSSI);
}

static void gap_event_handler(esp_gap_ble_cb_event_t event,
                              esp_ble_gap_cb_param_t *param) {
  is_LED_on = false;

  if (ESP_GAP_BLE_SCAN_RESULT_EVT == event &&
      ESP_GAP_SEARCH_INQ_RES_EVT == param->scan_rst.search_evt &&
      BLE_ADDR_TYPE_RANDOM == param->scan_rst.ble_addr_type) {
    const uint8_t *BDA = param->scan_rst.bda;

    const int8_t RSSI = param->scan_rst.rssi;

    add_device(BDA, RSSI);
  }
}

void app_main(void) {
  ESP_ERROR_CHECK(nvs_flash_init());

  esp_bt_controller_config_t bt_config = BT_CONTROLLER_INIT_CONFIG_DEFAULT();

  ESP_ERROR_CHECK(esp_bt_controller_init(&bt_config));

  ESP_ERROR_CHECK(esp_bt_controller_enable(ESP_BT_MODE_BLE));

  ESP_ERROR_CHECK(esp_bluedroid_init());

  ESP_ERROR_CHECK(esp_bluedroid_enable());

  ESP_ERROR_CHECK(esp_ble_gap_register_callback(gap_event_handler));

  static esp_ble_scan_params_t bt_scan_params = {
      .scan_type = BLE_SCAN_TYPE_PASSIVE,
      .own_addr_type = BLE_ADDR_TYPE_PUBLIC,
      .scan_filter_policy = BLE_SCAN_FILTER_ALLOW_ALL,
      .scan_interval = 0x0010,  // 10ms
      .scan_window = 0x0010,    // 10ms
  };

  ESP_ERROR_CHECK(esp_ble_gap_set_scan_params(&bt_scan_params));

  gpio_reset_pin(LED);

  gpio_set_direction(LED, GPIO_MODE_OUTPUT);

  esp_ble_gap_start_scanning(0);

  while (1) {
    gpio_set_level(LED, is_LED_on);

    vTaskDelay(TICKS_TO_DELAY);
  }
}

// Copyright (c) 2021 Cesanta Software Limited
// All rights reserved

#include "main.h"
#include "lwip/api.h"
#include "web_server.h"
#include "mongoose.h"

static struct mg_mgr mgr;
// NOTE: Set actual board IP addres in Inc/main.h
// Default address is 192.168.0.10
static const char *s_listening_address = "http://0.0.0.0:80";

// Reroute printf & Co to SWV ITM Data Console
int __io_putchar(int ch) {
    ITM_SendChar(ch);
    return ch;
}

int _write(int file, char *ptr, int len) {
  int DataIdx;

  for (DataIdx = 0; DataIdx < len; DataIdx++) {
    __io_putchar( *ptr++ );
  }

  return len;
}

static void cb(struct mg_connection *c, int ev, void *ev_data, void *fn_data) {
  if (ev == MG_EV_HTTP_MSG) {
    mg_http_reply(c, 200, "", "hello, %s!\n", "world");
  }
  (void) fn_data;
  (void) ev_data;
}

static void server(void *args) {
  mg_mgr_init(&mgr);
  MG_INFO( ("Starting Mongoose v%s", MG_VERSION)); // Tell the world
  void *c = mg_http_listen(&mgr, s_listening_address, cb, &mgr); // Web listener
  if (c == NULL) {
	  BSP_LED_On(LED3); // Turn on RED led to indicate an error
  }
  while (1) {
	  BSP_LED_Toggle(LED2); // Blink BLUE led   
	  mg_mgr_poll(&mgr, 1000); // Infinite event loop
  }
  mg_mgr_free(&mgr); // Unreachable
}

void start_mongoose() {
  sys_thread_new("MG", server, NULL, DEFAULT_THREAD_STACKSIZE, osPriorityAboveNormal);
}

#include <wayland-client-core.h>
extern uint32_t (*wio_wl_proxy_get_version)(struct wl_proxy *);
extern struct wl_proxy *(*wio_wl_proxy_marshal_flags)(struct wl_proxy *, uint32_t, const struct wl_interface *, uint32_t, uint32_t, ...);
extern int (*wio_wl_proxy_add_listener)(struct wl_proxy *, void (**)(void), void *);
extern void (*wio_wl_proxy_destroy)(struct wl_proxy *);
extern void (*wio_wl_proxy_set_user_data)(struct wl_proxy *, void *);
extern void *(*wio_wl_proxy_get_user_data)(struct wl_proxy *);
#define wl_proxy_get_version wio_wl_proxy_get_version
#define wl_proxy_marshal_flags wio_wl_proxy_marshal_flags
#define wl_proxy_add_listener wio_wl_proxy_add_listener
#define wl_proxy_destroy wio_wl_proxy_destroy
#define wl_proxy_set_user_data wio_wl_proxy_set_user_data
#define wl_proxy_get_user_data wio_wl_proxy_get_user_data

#include <wayland-client-core.h>
extern struct wl_proxy *(*wio_wl_proxy_marshal_flags)(struct wl_proxy *, uint32_t, const struct wl_interface *, uint32_t, uint32_t, ...);
#define wl_proxy_marshal_flags (*wio_wl_proxy_marshal_flags)

Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4797C77B7C
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 03:40:47 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.120435.1682998841837804974
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 May 2023 20:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C8F4A40C90
	for <meta-ti@lists.yoctoproject.org>; Tue,  2 May 2023 03:40:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zf2ZvefQ4mNh for <meta-ti@lists.yoctoproject.org>;
	Tue,  2 May 2023 03:40:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD55740C5F
	for <meta-ti@lists.yoctoproject.org>; Tue,  2 May 2023 03:40:40 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 70258163894
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 May 2023 23:39:57 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 1/3] mesa: locally overlay 22.3.5-specific patches from oe-core/master
Date: Tue,  2 May 2023 03:40:36 +0000
Message-Id: <20230502034038.3527224-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230502034038.3527224-1-denis@denix.org>
References: <20230502034038.3527224-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 May 2023 03:40:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16465

From: Randolph Sapp <rs@ti.com>

Locally overlay verbatim copies of mesa 22.3.5 patches from
oe-core/master, so the same codebase works in kirkstone and master.

Also drop the old patches from 22.0 that were from the tip of
oe-core/kirkstone previously.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...nd-deprecate-drm_handle_format-and-d.patch | 157 ------------------
 ...e-unsigned-instead-of-uint-to-fix-mu.patch |  43 +++++
 ...fine-__NR_futex-if-it-does-not-exist.patch |  34 ----
 ...-backend-fix-gbm-compile-without-dri.patch |  64 +++++++
 ...sdetects-64bit-atomics-on-mips-clang.patch |   2 +-
 ...k-for-all-linux-host_os-combinations.patch |  18 +-
 ...ormat-Check-for-NEON-before-using-it.patch |   6 +-
 ...02-meson.build-make-TLS-ELF-optional.patch |  61 -------
 8 files changed, 120 insertions(+), 265 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-e=
gl-wayland-deprecate-drm_handle_format-and-d.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-freedren=
o-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-=
Define-__NR_futex-if-it-does-not-exist.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-gbm-back=
end-fix-gbm-compile-without-dri.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.bu=
ild-make-TLS-ELF-optional.patch

diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-egl-wayl=
and-deprecate-drm_handle_format-and-d.patch b/meta-ti-bsp/recipes-graphic=
s/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.pa=
tch
deleted file mode 100644
index 03e4b422..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-egl-wayland-dep=
recate-drm_handle_format-and-d.patch
+++ /dev/null
@@ -1,157 +0,0 @@
-From 7796c2c56c960ac55e49246f0349ac52539ada55 Mon Sep 17 00:00:00 2001
-From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
-Date: Sun, 10 Apr 2022 22:54:36 -0300
-Subject: [PATCH] Revert "egl/wayland: deprecate drm_handle_format() and
- drm_handle_capabilities()"
-
-Commit af1ee8e010441f8f2ed8c77065b159652a4ac9fe dropped support to
-wl_drm, as we thought that most compositors from active projects were
-already supporting zwp_linux_dmabuf_v1.
-
-But that's not true, so revert this commit in order to give these
-projects a longer transition period.
-
-Note that we didn't add back the support to GEM name API, and that was
-on purpose.
-
-Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
-Reviewed-by: Simon Ser <contact@emersion.fr>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1582=
2>
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/co=
mmit/c60fea8c228ae3f32e20d6b65c473d9f04871d20]
----
- src/egl/drivers/dri2/egl_dri2.h         |  1 +
- src/egl/drivers/dri2/platform_wayland.c | 59 +++++++++++++++++++------
- 2 files changed, 47 insertions(+), 13 deletions(-)
-
-diff --git a/src/egl/drivers/dri2/egl_dri2.h b/src/egl/drivers/dri2/egl_=
dri2.h
-index c466ff83c53..eecb32a53fd 100644
---- a/src/egl/drivers/dri2/egl_dri2.h
-+++ b/src/egl/drivers/dri2/egl_dri2.h
-@@ -283,6 +283,7 @@ struct dri2_egl_display
-    struct zwp_linux_dmabuf_feedback_v1 *wl_dmabuf_feedback;
-    struct dmabuf_feedback_format_table format_table;
-    bool authenticated;
-+   uint32_t capabilities;
-    char *device_name;
- #endif
-
-diff --git a/src/egl/drivers/dri2/platform_wayland.c b/src/egl/drivers/d=
ri2/platform_wayland.c
-index 5ff83cce08a..843434376a7 100644
---- a/src/egl/drivers/dri2/platform_wayland.c
-+++ b/src/egl/drivers/dri2/platform_wayland.c
-@@ -1343,7 +1343,7 @@ create_wl_buffer(struct dri2_egl_display *dri2_dpy=
,
-                  struct dri2_egl_surface *dri2_surf,
-                  __DRIimage *image)
- {
--   struct wl_buffer *ret;
-+   struct wl_buffer *ret =3D NULL;
-    EGLBoolean query;
-    int width, height, fourcc, num_planes;
-    uint64_t modifier =3D DRM_FORMAT_MOD_INVALID;
-@@ -1447,11 +1447,28 @@ create_wl_buffer(struct dri2_egl_display *dri2_d=
py,
-       ret =3D zwp_linux_buffer_params_v1_create_immed(params, width, he=
ight,
-                                                     fourcc, 0);
-       zwp_linux_buffer_params_v1_destroy(params);
-+   } else {
-+      struct wl_drm *wl_drm =3D
-+         dri2_surf ? dri2_surf->wl_drm_wrapper : dri2_dpy->wl_drm;
-+      int fd =3D -1, stride;
-+
-+      if (num_planes > 1)
-+         return NULL;
-+
-+      query =3D dri2_dpy->image->queryImage(image, __DRI_IMAGE_ATTRIB_F=
D, &fd);
-+      query &=3D dri2_dpy->image->queryImage(image, __DRI_IMAGE_ATTRIB_=
STRIDE, &stride);
-+      if (!query) {
-+         if (fd >=3D 0)
-+            close(fd);
-+         return NULL;
-+      }
-
--      return ret;
-+      ret =3D wl_drm_create_prime_buffer(wl_drm, fd, width, height, fou=
rcc, 0,
-+                                       stride, 0, 0, 0, 0);
-+      close(fd);
-    }
-
--   return NULL;
-+   return ret;
- }
-
- static EGLBoolean
-@@ -1698,16 +1715,21 @@ drm_handle_device(void *data, struct wl_drm *drm=
, const char *device)
- static void
- drm_handle_format(void *data, struct wl_drm *drm, uint32_t format)
- {
--   /* deprecated, as compositors already support the dma-buf protocol e=
xtension
--    * and so we can rely on dmabuf_handle_modifier() to receive formats=
 and
--    * modifiers */
-+   struct dri2_egl_display *dri2_dpy =3D data;
-+   int visual_idx =3D dri2_wl_visual_idx_from_fourcc(format);
-+
-+   if (visual_idx =3D=3D -1)
-+      return;
-+
-+   BITSET_SET(dri2_dpy->formats.formats_bitmap, visual_idx);
- }
-
- static void
- drm_handle_capabilities(void *data, struct wl_drm *drm, uint32_t value)
- {
--   /* deprecated, as compositors already support the dma-buf protocol e=
xtension
--    * and so we can rely on it to create wl_buffer's */
-+   struct dri2_egl_display *dri2_dpy =3D data;
-+
-+   dri2_dpy->capabilities =3D value;
- }
-
- static void
-@@ -2075,13 +2097,12 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
-    wl_registry_add_listener(dri2_dpy->wl_registry,
-                             &registry_listener_drm, dri2_dpy);
-
--   /* The compositor must expose the dma-buf interface. */
--   if (roundtrip(dri2_dpy) < 0 || dri2_dpy->wl_dmabuf =3D=3D NULL)
-+   if (roundtrip(dri2_dpy) < 0)
-       goto cleanup;
-
-    /* Get default dma-buf feedback */
--   if (zwp_linux_dmabuf_v1_get_version(dri2_dpy->wl_dmabuf) >=3D
--       ZWP_LINUX_DMABUF_V1_GET_DEFAULT_FEEDBACK_SINCE_VERSION) {
-+   if (dri2_dpy->wl_dmabuf && zwp_linux_dmabuf_v1_get_version(dri2_dpy-=
>wl_dmabuf) >=3D
-+                              ZWP_LINUX_DMABUF_V1_GET_DEFAULT_FEEDBACK_=
SINCE_VERSION) {
-       dmabuf_feedback_format_table_init(&dri2_dpy->format_table);
-       dri2_dpy->wl_dmabuf_feedback =3D
-          zwp_linux_dmabuf_v1_get_default_feedback(dri2_dpy->wl_dmabuf);
-@@ -2089,7 +2110,6 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
-                                                 &dmabuf_feedback_listen=
er, dri2_dpy);
-    }
-
--   /* Receive events from the interfaces */
-    if (roundtrip(dri2_dpy) < 0)
-       goto cleanup;
-
-@@ -2176,6 +2196,19 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
-
-    dri2_wl_setup_swap_interval(disp);
-
-+   if (dri2_dpy->wl_drm) {
-+      /* To use Prime, we must have _DRI_IMAGE v7 at least. createImage=
FromFds
-+       * support indicates that Prime export/import is supported by the=
 driver.
-+       * We deprecated the support to GEM names API, so we bail out if =
the
-+       * driver does not suport Prime. */
-+      if (!(dri2_dpy->capabilities & WL_DRM_CAPABILITY_PRIME) ||
-+          (dri2_dpy->image->base.version < 7) ||
-+          (dri2_dpy->image->createImageFromFds =3D=3D NULL)) {
-+         _eglLog(_EGL_WARNING, "wayland-egl: display does not support p=
rime");
-+         goto cleanup;
-+      }
-+   }
-+
-    if (dri2_dpy->is_different_gpu &&
-        (dri2_dpy->image->base.version < 9 ||
-         dri2_dpy->image->blitImage =3D=3D NULL)) {
---
-2.35.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-freedreno-pm4-U=
se-unsigned-instead-of-uint-to-fix-mu.patch b/meta-ti-bsp/recipes-graphic=
s/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.pa=
tch
new file mode 100644
index 00000000..f0775176
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsi=
gned-instead-of-uint-to-fix-mu.patch
@@ -0,0 +1,43 @@
+From 8a5de0b6cf1090d7f29f3974ec79c32776cf2745 Mon Sep 17 00:00:00 2001
+From: Jami Kettunen <jami.kettunen@protonmail.com>
+Date: Tue, 31 Aug 2021 00:15:58 +0300
+Subject: [PATCH] freedreno/pm4: Use unsigned instead of uint to fix musl=
 build
+
+Upstream-Status: Backport
+
+Fixes the following error I noticed when building against aarch64 with
+musl libc:
+
+  In file included from ../src/freedreno/decode/crashdec.h:38,
+                   from ../src/freedreno/decode/crashdec.c:40:
+  ../src/freedreno/common/freedreno_pm4.h:104:15: error: unknown type na=
me 'uint'
+    104 | static inline uint
+        |               ^~~~
+  ../src/freedreno/common/freedreno_pm4.h:105:25: error: unknown type na=
me 'uint'; did you mean 'int'?
+    105 | pm4_calc_odd_parity_bit(uint val)
+        |                         ^~~~
+        |                         int
+
+Signed-off-by: Jami Kettunen <jami.kettunen@protonmail.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1966=
5>
+---
+ src/freedreno/common/freedreno_pm4.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/freedreno/common/freedreno_pm4.h b/src/freedreno/common=
/freedreno_pm4.h
+index 8f958953d693..091247e709a0 100644
+--- a/src/freedreno/common/freedreno_pm4.h
++++ b/src/freedreno/common/freedreno_pm4.h
+@@ -105,8 +105,8 @@ pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)
+ #define cp_type3_opcode(pkt) (((pkt) >> 8) & 0xFF)
+ #define type3_pkt_size(pkt)  ((((pkt) >> 16) & 0x3FFF) + 1)
+
+-static inline uint
+-pm4_calc_odd_parity_bit(uint val)
++static inline unsigned
++pm4_calc_odd_parity_bit(unsigned val)
+ {
+    return (0x9669 >> (0xf & ((val) ^ ((val) >> 4) ^ ((val) >> 8) ^
+                              ((val) >> 12) ^ ((val) >> 16) ^ ((val) >> =
20) ^
+--
+2.39.2
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-Define-=
__NR_futex-if-it-does-not-exist.patch b/meta-ti-bsp/recipes-graphics/mesa=
/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
deleted file mode 100644
index 3f7a6340..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_fu=
tex-if-it-does-not-exist.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 253b042d2bf10e9abfa9cc508e0782aefd834145 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Oct 2020 11:03:47 -0700
-Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
-
-__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
-they only have 64bit variant of time_t. Glibc defines SYS_futex interfac=
e based on
-__NR_futex, since this is used in applications, such applications start
-to fail to build for these newer architectures. This patch defines a
-fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
-working
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/util/futex.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/util/futex.h b/src/util/futex.h
-index 43097f4..941b0ec 100644
---- a/src/util/futex.h
-+++ b/src/util/futex.h
-@@ -34,6 +34,10 @@
- #include <sys/syscall.h>
- #include <sys/time.h>
-
-+#if !defined(SYS_futex) && defined(SYS_futex_time64)
-+# define SYS_futex SYS_futex_time64
-+#endif
-+
- static inline long sys_futex(void *addr1, int op, int val1, const struc=
t timespec *timeout, void *addr2, int val3)
- {
-    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-gbm-backend-fix=
-gbm-compile-without-dri.patch b/meta-ti-bsp/recipes-graphics/mesa/files/=
0001-gbm-backend-fix-gbm-compile-without-dri.patch
new file mode 100644
index 00000000..289ff032
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-co=
mpile-without-dri.patch
@@ -0,0 +1,64 @@
+From 25946100e21cf2095bea334e8d7096798561d0b7 Mon Sep 17 00:00:00 2001
+From: Vincent Davis Jr <vince@underview.tech>
+Date: Wed, 28 Dec 2022 16:28:01 -0600
+Subject: [PATCH] gbm/backend: fix gbm compile without dri
+
+Upstream-Status: Backport
+
+https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20447
+https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e587067=
41a7d22d67b5088e60
+
+At mesa version 22.2.3 patch wasn't introduced until after.
+
+Commit introduces a fix that allows for gbm to be built with an empty
+backend. There are situation especially in a Yocto/OE cross compilation
+environment where you want to build with an empty backend. The particula=
r
+situation is as such:
+
+The mesa-gl recipe is the preferred provider for virtual/libgbm, virtual=
/libgl,
+virtual/mesa, etc... But the x11 DISTRO_FEATURE in't included this leads=
 to build
+errors such as:
+
+| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in function =
`find_backend':
+| backend.c:(.text.find_backend+0xa4): undefined reference to `gbm_dri_b=
ackend'
+| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro=
.builtin_backends+0x4):
+                undefined reference to `gbm_dri_backend'
+| collect2: error: ld returned 1 exit status
+
+Issue should be replicable by setting -Ddri3=3Ddisabled and -Dgbm=3Denab=
led
+
+Add fix to bypasses compilation issue by excluding gbm dri backend. If
+HAVE_DRI || HAVE_DRIX not specified.
+
+Acked-by: David Heidelberg <david.heidelberg@collabora.com>
+Signed-off-by: Vincent Davis Jr <vince@underview.tech>
+---
+ src/gbm/main/backend.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/gbm/main/backend.c b/src/gbm/main/backend.c
+index 974d0a76a4e..feee0703495 100644
+--- a/src/gbm/main/backend.c
++++ b/src/gbm/main/backend.c
+@@ -42,7 +42,9 @@
+ #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))
+ #define VER_MIN(a, b) ((a) < (b) ? (a) : (b))
+
++#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
+ extern const struct gbm_backend gbm_dri_backend;
++#endif
+
+ struct gbm_backend_desc {
+    const char *name;
+@@ -51,7 +53,9 @@ struct gbm_backend_desc {
+ };
+
+ static const struct gbm_backend_desc builtin_backends[] =3D {
++#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
+    { "dri", &gbm_dri_backend },
++#endif
+ };
+
+ #define BACKEND_LIB_SUFFIX "_gbm"
+--
+2.34.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetect=
s-64bit-atomics-on-mips-clang.patch b/meta-ti-bsp/recipes-graphics/mesa/f=
iles/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index 5b98915c..35bd0ea1 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit=
-atomics-on-mips-clang.patch
+++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit=
-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From d34bdbd80e5a1f309d2ba280cdc66ff0ee0e5c43 Mon Sep 17 00:00:00 2001
+From 3ef37c63f03ad6f2af407de350486fdd25e9132a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-che=
ck-for-all-linux-host_os-combinations.patch b/meta-ti-bsp/recipes-graphic=
s/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.pa=
tch
index 3d2c163b..f0c1de46 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-=
all-linux-host_os-combinations.patch
+++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-=
all-linux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From f9c597a2c517eb85c23cbeeb2e95c55794c74cda Mon Sep 17 00:00:00 2001
+From 3b4d6b89f644b43e507c08181fef06db4326f9da Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -20,23 +20,23 @@ Signed-off-by: Alistair Francis <alistair@alistair23.=
me>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/meson.build b/meson.build
-index bca6b1f..70d06c0 100644
+index 172c64a..9b5294c 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -172,7 +172,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wit=
h_gles2
+@@ -173,7 +173,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wit=
h_gles2
  # Only build shared_glapi if at least one OpenGL API is enabled
  with_shared_glapi =3D with_shared_glapi and with_any_opengl
=20
--system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
-+system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].co=
ntains(host_machine.system()) or host_machine.system().startswith('linux'=
)
+-system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()=
)
++system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()=
) or host_machine.system().startswith('linux')
=20
- dri_drivers =3D get_option('dri-drivers')
- if dri_drivers.length() !=3D 0
-@@ -1074,7 +1074,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; =
}',
+ with_freedreno_kgsl =3D get_option('freedreno-kgsl')
+ if with_freedreno_kgsl
+@@ -1076,7 +1076,7 @@ if cc.has_function('reallocarray')
  endif
=20
  # TODO: this is very incomplete
--if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].conta=
ins(host_machine.system())
+-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'andr=
oid'].contains(host_machine.system())
 +if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].conta=
ins(host_machine.system()) or host_machine.system().startswith('linux')
    pre_args +=3D '-D_GNU_SOURCE'
  elif host_machine.system() =3D=3D 'sunos'
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Che=
ck-for-NEON-before-using-it.patch b/meta-ti-bsp/recipes-graphics/mesa/fil=
es/0001-util-format-Check-for-NEON-before-using-it.patch
index b3403bcd..6eea5ed8 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-=
NEON-before-using-it.patch
+++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-=
NEON-before-using-it.patch
@@ -1,4 +1,4 @@
-From fdb2face4eeac3c20eedcca7520f4e7014225fb4 Mon Sep 17 00:00:00 2001
+From f17e836ef9b1bbc6056790596420b699e48128c2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 2 Dec 2021 19:57:42 -0800
 Subject: [PATCH] util/format: Check for NEON before using it
@@ -20,10 +20,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
-index 36c5e52..f0a0097 100644
+index c071250..0880984 100644
 --- a/src/util/format/u_format.c
 +++ b/src/util/format/u_format.c
-@@ -1138,7 +1138,7 @@ static void
+@@ -1184,7 +1184,7 @@ static void
  util_format_unpack_table_init(void)
  {
     for (enum pipe_format format =3D PIPE_FORMAT_NONE; format < PIPE_FOR=
MAT_COUNT; format++) {
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.build-mak=
e-TLS-ELF-optional.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0002-m=
eson.build-make-TLS-ELF-optional.patch
deleted file mode 100644
index 1b9c1ba3..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.build-make-TLS-E=
LF-optional.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From bf41fa026ae3d378e62fd83d03a6f5933b52ca04 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair@alistair23.me>
-Date: Thu, 14 Nov 2019 13:08:31 -0800
-Subject: [PATCH] meson.build: make TLS ELF optional
-
-USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original "make
-TLS GLX optional again" patch updated to the latest mesa.
-
-For details, see:
-https://gitlab.freedesktop.org/mesa/mesa/-/issues/966
-
-This prevents runtime segfault on musl:
-
-Traceback (most recent call last):
-  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/co=
re/decorator/__init__.py", line 36, in wrapped_f
-    return func(*args, **kwargs)
-  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/ru=
ntime/cases/parselogs.py", line 378, in test_parselogs
-    self.assertEqual(errcount, 0, msg=3Dself.msg)
-AssertionError: 1 !=3D 0 : Log: /home/pokybuild/yocto-worker/musl-qemux8=
6/build/build/tmp/work/qemux86-poky-linux-musl/core-image-sato-sdk/1.0-r0=
/target_logs/Xorg.0.log
-
-Upstream-Status: Inappropriate [configuration]
----
- meson.build       | 7 +++++--
- meson_options.txt | 6 ++++++
- 2 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 70d06c0..1441611 100644
---- a/meson.build
-+++ b/meson.build
-@@ -490,8 +490,11 @@ foreach platform : _platforms
-   pre_args +=3D '-DHAVE_@0@_PLATFORM'.format(platform.to_upper())
- endforeach
-
--use_elf_tls =3D true
--pre_args +=3D '-DUSE_ELF_TLS'
-+use_elf_tls =3D false
-+if get_option('elf-tls')
-+  use_elf_tls =3D true
-+  pre_args +=3D '-DUSE_ELF_TLS'
-+endif
-
- if with_platform_android and get_option('platform-sdk-version') >=3D 29
-   # By default the NDK compiler, at least, emits emutls references inst=
ead of
-diff --git a/meson_options.txt b/meson_options.txt
-index 1f6ef38..99cc5cb 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -440,6 +440,12 @@ option(
-   value : true,
-   description : 'Enable direct rendering in GLX and EGL for DRI',
- )
-+option(
-+  'elf-tls',
-+  type : 'boolean',
-+  value : true,
-+  description : 'Enable TLS support in ELF',
-+)
- option('egl-lib-suffix',
-   type : 'string',
-   value : '',
--=20
2.25.1



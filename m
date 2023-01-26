Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A49C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 17:06:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.79368.1674752779682447289
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 09:06:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=J1fdFsfJ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30QH6Ip2076774
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 11:06:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674752778;
	bh=eTxvndP92st92Ln/QjLpOwckND7VdKQCxXkZpZ9Yfo4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=J1fdFsfJPbpA8ZXir1vhpocaEx3C//DfifTYGUqrQ5XAwjU0GDZC5PM8ZcFS+gSlO
	 aQ4U8R0B/UfIWGlMBvnDnXl4xOuIfVZmi+sIVqE2BxMHIarz5NBNwQoQD5TIjyZt58
	 KGI7JJss5m3fVx40+g/057j726Vt0+xzja4sNWJg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30QH6I5e102874
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 11:06:18 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 26
 Jan 2023 11:06:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 26 Jan 2023 11:06:18 -0600
Received: from [10.250.32.60] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30QH6HQb009861;
	Thu, 26 Jan 2023 11:06:17 -0600
Message-ID: <f3ec2279-5ce9-af82-82ac-8d7170e3dbe9@ti.com>
Date: Thu, 26 Jan 2023 11:06:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [kirkstone PATCH 1/4] meta-ti-bsp: mesa: Add current patches
To: Randolph Sapp <rs@ti.com>, <denys@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>
References: <20230126030834.3889448-1-rs@ti.com>
 <20230126030834.3889448-2-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230126030834.3889448-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 17:06:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15676

On 1/25/23 9:08 PM, Randolph Sapp wrote:
> Copy over current patches from oe-core for mesa since we're going to be
> overriding the SRC_URI string and we still need those.
> 

We control the repo we will be pointing at, I'd say just add these
patches over there directly so this commit would be not needed.

Andrew

> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   ...nd-deprecate-drm_handle_format-and-d.patch | 158 ++++++++++++++++++
>   ...fine-__NR_futex-if-it-does-not-exist.patch |  34 ++++
>   ...sdetects-64bit-atomics-on-mips-clang.patch |  25 +++
>   ...k-for-all-linux-host_os-combinations.patch |  43 +++++
>   ...ormat-Check-for-NEON-before-using-it.patch |  47 ++++++
>   ...02-meson.build-make-TLS-ELF-optional.patch |  61 +++++++
>   6 files changed, 368 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
>   create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
>   create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
>   create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
>   create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
>   create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> 
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
> new file mode 100644
> index 00000000..dac2de4e
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
> @@ -0,0 +1,158 @@
> +From 7796c2c56c960ac55e49246f0349ac52539ada55 Mon Sep 17 00:00:00 2001
> +From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> +Date: Sun, 10 Apr 2022 22:54:36 -0300
> +Subject: [PATCH] Revert "egl/wayland: deprecate drm_handle_format() and
> + drm_handle_capabilities()"
> +
> +Commit af1ee8e010441f8f2ed8c77065b159652a4ac9fe dropped support to
> +wl_drm, as we thought that most compositors from active projects were
> +already supporting zwp_linux_dmabuf_v1.
> +
> +But that's not true, so revert this commit in order to give these
> +projects a longer transition period.
> +
> +Note that we didn't add back the support to GEM name API, and that was
> +on purpose.
> +
> +Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> +Reviewed-by: Simon Ser <contact@emersion.fr>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15822>
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/c60fea8c228ae3f32e20d6b65c473d9f04871d20]
> +---
> + src/egl/drivers/dri2/egl_dri2.h         |  1 +
> + src/egl/drivers/dri2/platform_wayland.c | 59 +++++++++++++++++++------
> + 2 files changed, 47 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/egl/drivers/dri2/egl_dri2.h b/src/egl/drivers/dri2/egl_dri2.h
> +index c466ff83c53..eecb32a53fd 100644
> +--- a/src/egl/drivers/dri2/egl_dri2.h
> ++++ b/src/egl/drivers/dri2/egl_dri2.h
> +@@ -283,6 +283,7 @@ struct dri2_egl_display
> +    struct zwp_linux_dmabuf_feedback_v1 *wl_dmabuf_feedback;
> +    struct dmabuf_feedback_format_table format_table;
> +    bool authenticated;
> ++   uint32_t capabilities;
> +    char *device_name;
> + #endif
> +
> +diff --git a/src/egl/drivers/dri2/platform_wayland.c b/src/egl/drivers/dri2/platform_wayland.c
> +index 5ff83cce08a..843434376a7 100644
> +--- a/src/egl/drivers/dri2/platform_wayland.c
> ++++ b/src/egl/drivers/dri2/platform_wayland.c
> +@@ -1343,7 +1343,7 @@ create_wl_buffer(struct dri2_egl_display *dri2_dpy,
> +                  struct dri2_egl_surface *dri2_surf,
> +                  __DRIimage *image)
> + {
> +-   struct wl_buffer *ret;
> ++   struct wl_buffer *ret = NULL;
> +    EGLBoolean query;
> +    int width, height, fourcc, num_planes;
> +    uint64_t modifier = DRM_FORMAT_MOD_INVALID;
> +@@ -1447,11 +1447,28 @@ create_wl_buffer(struct dri2_egl_display *dri2_dpy,
> +       ret = zwp_linux_buffer_params_v1_create_immed(params, width, height,
> +                                                     fourcc, 0);
> +       zwp_linux_buffer_params_v1_destroy(params);
> ++   } else {
> ++      struct wl_drm *wl_drm =
> ++         dri2_surf ? dri2_surf->wl_drm_wrapper : dri2_dpy->wl_drm;
> ++      int fd = -1, stride;
> ++
> ++      if (num_planes > 1)
> ++         return NULL;
> ++
> ++      query = dri2_dpy->image->queryImage(image, __DRI_IMAGE_ATTRIB_FD, &fd);
> ++      query &= dri2_dpy->image->queryImage(image, __DRI_IMAGE_ATTRIB_STRIDE, &stride);
> ++      if (!query) {
> ++         if (fd >= 0)
> ++            close(fd);
> ++         return NULL;
> ++      }
> +
> +-      return ret;
> ++      ret = wl_drm_create_prime_buffer(wl_drm, fd, width, height, fourcc, 0,
> ++                                       stride, 0, 0, 0, 0);
> ++      close(fd);
> +    }
> +
> +-   return NULL;
> ++   return ret;
> + }
> +
> + static EGLBoolean
> +@@ -1698,16 +1715,21 @@ drm_handle_device(void *data, struct wl_drm *drm, const char *device)
> + static void
> + drm_handle_format(void *data, struct wl_drm *drm, uint32_t format)
> + {
> +-   /* deprecated, as compositors already support the dma-buf protocol extension
> +-    * and so we can rely on dmabuf_handle_modifier() to receive formats and
> +-    * modifiers */
> ++   struct dri2_egl_display *dri2_dpy = data;
> ++   int visual_idx = dri2_wl_visual_idx_from_fourcc(format);
> ++
> ++   if (visual_idx == -1)
> ++      return;
> ++
> ++   BITSET_SET(dri2_dpy->formats.formats_bitmap, visual_idx);
> + }
> +
> + static void
> + drm_handle_capabilities(void *data, struct wl_drm *drm, uint32_t value)
> + {
> +-   /* deprecated, as compositors already support the dma-buf protocol extension
> +-    * and so we can rely on it to create wl_buffer's */
> ++   struct dri2_egl_display *dri2_dpy = data;
> ++
> ++   dri2_dpy->capabilities = value;
> + }
> +
> + static void
> +@@ -2075,13 +2097,12 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
> +    wl_registry_add_listener(dri2_dpy->wl_registry,
> +                             &registry_listener_drm, dri2_dpy);
> +
> +-   /* The compositor must expose the dma-buf interface. */
> +-   if (roundtrip(dri2_dpy) < 0 || dri2_dpy->wl_dmabuf == NULL)
> ++   if (roundtrip(dri2_dpy) < 0)
> +       goto cleanup;
> +
> +    /* Get default dma-buf feedback */
> +-   if (zwp_linux_dmabuf_v1_get_version(dri2_dpy->wl_dmabuf) >=
> +-       ZWP_LINUX_DMABUF_V1_GET_DEFAULT_FEEDBACK_SINCE_VERSION) {
> ++   if (dri2_dpy->wl_dmabuf && zwp_linux_dmabuf_v1_get_version(dri2_dpy->wl_dmabuf) >=
> ++                              ZWP_LINUX_DMABUF_V1_GET_DEFAULT_FEEDBACK_SINCE_VERSION) {
> +       dmabuf_feedback_format_table_init(&dri2_dpy->format_table);
> +       dri2_dpy->wl_dmabuf_feedback =
> +          zwp_linux_dmabuf_v1_get_default_feedback(dri2_dpy->wl_dmabuf);
> +@@ -2089,7 +2110,6 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
> +                                                 &dmabuf_feedback_listener, dri2_dpy);
> +    }
> +
> +-   /* Receive events from the interfaces */
> +    if (roundtrip(dri2_dpy) < 0)
> +       goto cleanup;
> +
> +@@ -2176,6 +2196,19 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
> +
> +    dri2_wl_setup_swap_interval(disp);
> +
> ++   if (dri2_dpy->wl_drm) {
> ++      /* To use Prime, we must have _DRI_IMAGE v7 at least. createImageFromFds
> ++       * support indicates that Prime export/import is supported by the driver.
> ++       * We deprecated the support to GEM names API, so we bail out if the
> ++       * driver does not suport Prime. */
> ++      if (!(dri2_dpy->capabilities & WL_DRM_CAPABILITY_PRIME) ||
> ++          (dri2_dpy->image->base.version < 7) ||
> ++          (dri2_dpy->image->createImageFromFds == NULL)) {
> ++         _eglLog(_EGL_WARNING, "wayland-egl: display does not support prime");
> ++         goto cleanup;
> ++      }
> ++   }
> ++
> +    if (dri2_dpy->is_different_gpu &&
> +        (dri2_dpy->image->base.version < 9 ||
> +         dri2_dpy->image->blitImage == NULL)) {
> +--
> +2.35.1
> +
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
> new file mode 100644
> index 00000000..3b0bfa32
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
> @@ -0,0 +1,34 @@
> +From 253b042d2bf10e9abfa9cc508e0782aefd834145 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 16 Oct 2020 11:03:47 -0700
> +Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
> +
> +__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
> +they only have 64bit variant of time_t. Glibc defines SYS_futex interface based on
> +__NR_futex, since this is used in applications, such applications start
> +to fail to build for these newer architectures. This patch defines a
> +fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
> +working
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +---
> + src/util/futex.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/util/futex.h b/src/util/futex.h
> +index 43097f4..941b0ec 100644
> +--- a/src/util/futex.h
> ++++ b/src/util/futex.h
> +@@ -34,6 +34,10 @@
> + #include <sys/syscall.h>
> + #include <sys/time.h>
> +
> ++#if !defined(SYS_futex) && defined(SYS_futex_time64)
> ++# define SYS_futex SYS_futex_time64
> ++#endif
> ++
> + static inline long sys_futex(void *addr1, int op, int val1, const struct timespec *timeout, void *addr2, int val3)
> + {
> +    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
> new file mode 100644
> index 00000000..b08e4d86
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
> @@ -0,0 +1,25 @@
> +From d34bdbd80e5a1f309d2ba280cdc66ff0ee0e5c43 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 13 Jan 2020 15:23:47 -0800
> +Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +---
> + src/util/u_atomic.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/util/u_atomic.c b/src/util/u_atomic.c
> +index 5a5eab4..e499516 100644
> +--- a/src/util/u_atomic.c
> ++++ b/src/util/u_atomic.c
> +@@ -21,7 +21,7 @@
> +  * IN THE SOFTWARE.
> +  */
> +
> +-#if defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
> ++#if !defined(__clang__) && defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
> +
> + #include <stdint.h>
> + #include <pthread.h>
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> new file mode 100644
> index 00000000..aea23d0e
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> @@ -0,0 +1,43 @@
> +From f9c597a2c517eb85c23cbeeb2e95c55794c74cda Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair@alistair23.me>
> +Date: Thu, 14 Nov 2019 13:04:49 -0800
> +Subject: [PATCH] meson.build: check for all linux host_os combinations
> +
> +Make sure that we are also looking for our host_os combinations like
> +linux-musl etc. when assuming support for DRM/KMS.
> +
> +Also delete a duplicate line.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> +Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +Signed-off-by: Alistair Francis <alistair@alistair23.me>
> +
> +---
> + meson.build | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index bca6b1f..70d06c0 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -172,7 +172,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
> + # Only build shared_glapi if at least one OpenGL API is enabled
> + with_shared_glapi = with_shared_glapi and with_any_opengl
> +
> +-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
> ++system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].contains(host_machine.system()) or host_machine.system().startswith('linux')
> +
> + dri_drivers = get_option('dri-drivers')
> + if dri_drivers.length() != 0
> +@@ -1074,7 +1074,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
> + endif
> +
> + # TODO: this is very incomplete
> +-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].contains(host_machine.system())
> ++if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].contains(host_machine.system()) or host_machine.system().startswith('linux')
> +   pre_args += '-D_GNU_SOURCE'
> + elif host_machine.system() == 'sunos'
> +   pre_args += '-D__EXTENSIONS__'
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
> new file mode 100644
> index 00000000..5c6165c2
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
> @@ -0,0 +1,47 @@
> +From fdb2face4eeac3c20eedcca7520f4e7014225fb4 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 2 Dec 2021 19:57:42 -0800
> +Subject: [PATCH] util/format: Check for NEON before using it
> +
> +This fixes build on rpi0-w and any other machine which does not have
> +neon unit and is not used as FPU unit
> +
> +Fixes errors e.g.
> +
> +In file included from ../mesa-21.3.0/src/util/format/u_format_unpack_neon.c:35:
> +/mnt/b/yoe/master/build/tmp/work/arm1176jzfshf-vfp-yoe-linux-gnueabi/mesa/2_21.3.0-r0/recipe-sysroot-native/usr/lib/clang/13.0.1/include/arm_neon.h:32:2: error: "NEON support not enabled"
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14032]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +---
> + src/util/format/u_format.c             | 2 +-
> + src/util/format/u_format_unpack_neon.c | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
> +index 36c5e52..f0a0097 100644
> +--- a/src/util/format/u_format.c
> ++++ b/src/util/format/u_format.c
> +@@ -1138,7 +1138,7 @@ static void
> + util_format_unpack_table_init(void)
> + {
> +    for (enum pipe_format format = PIPE_FORMAT_NONE; format < PIPE_FORMAT_COUNT; format++) {
> +-#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
> ++#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
> +       const struct util_format_unpack_description *unpack = util_format_unpack_description_neon(format);
> +       if (unpack) {
> +          util_format_unpack_table[format] = unpack;
> +diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_format_unpack_neon.c
> +index a4a5cb1..1e4f794 100644
> +--- a/src/util/format/u_format_unpack_neon.c
> ++++ b/src/util/format/u_format_unpack_neon.c
> +@@ -23,7 +23,7 @@
> +
> + #include <u_format.h>
> +
> +-#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
> ++#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
> +
> + /* armhf builds default to vfp, not neon, and refuses to compile neon intrinsics
> +  * unless you tell it "no really".
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> new file mode 100644
> index 00000000..af11baee
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> @@ -0,0 +1,61 @@
> +From bf41fa026ae3d378e62fd83d03a6f5933b52ca04 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair@alistair23.me>
> +Date: Thu, 14 Nov 2019 13:08:31 -0800
> +Subject: [PATCH] meson.build: make TLS ELF optional
> +
> +USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original "make
> +TLS GLX optional again" patch updated to the latest mesa.
> +
> +For details, see:
> +https://gitlab.freedesktop.org/mesa/mesa/-/issues/966
> +
> +This prevents runtime segfault on musl:
> +
> +Traceback (most recent call last):
> +  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/core/decorator/__init__.py", line 36, in wrapped_f
> +    return func(*args, **kwargs)
> +  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/runtime/cases/parselogs.py", line 378, in test_parselogs
> +    self.assertEqual(errcount, 0, msg=self.msg)
> +AssertionError: 1 != 0 : Log: /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/qemux86-poky-linux-musl/core-image-sato-sdk/1.0-r0/target_logs/Xorg.0.log
> +
> +Upstream-Status: Inappropriate [configuration]
> +---
> + meson.build       | 7 +++++--
> + meson_options.txt | 6 ++++++
> + 2 files changed, 11 insertions(+), 2 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 70d06c0..1441611 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -490,8 +490,11 @@ foreach platform : _platforms
> +   pre_args += '-DHAVE_@0@_PLATFORM'.format(platform.to_upper())
> + endforeach
> +
> +-use_elf_tls = true
> +-pre_args += '-DUSE_ELF_TLS'
> ++use_elf_tls = false
> ++if get_option('elf-tls')
> ++  use_elf_tls = true
> ++  pre_args += '-DUSE_ELF_TLS'
> ++endif
> +
> + if with_platform_android and get_option('platform-sdk-version') >= 29
> +   # By default the NDK compiler, at least, emits emutls references instead of
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 1f6ef38..99cc5cb 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -440,6 +440,12 @@ option(
> +   value : true,
> +   description : 'Enable direct rendering in GLX and EGL for DRI',
> + )
> ++option(
> ++  'elf-tls',
> ++  type : 'boolean',
> ++  value : true,
> ++  description : 'Enable TLS support in ELF',
> ++)
> + option('egl-lib-suffix',
> +   type : 'string',
> +   value : '',


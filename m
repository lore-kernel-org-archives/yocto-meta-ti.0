Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF15DC5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 19:59:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63486.1786478390142260244
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 12:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4518340C79;
	Tue, 11 Aug 2026 19:59:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yRno-ro_fTHF; Tue, 11 Aug 2026 19:59:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1111240B88;
	Tue, 11 Aug 2026 19:59:47 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 259261741B6;
	Tue, 11 Aug 2026 15:59:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] weston: update bbappend for version 16.0.x
Date: Tue, 11 Aug 2026 15:59:45 -0400
Message-Id: <20260811195945.53759-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 19:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20250

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

OE-Core updated weston to version 16.0.0 in master [1]

Our bbappend applied 2 patches to version 15.0.x and those
need to be updated for version 16.0.0 accordingly.

Patch 1 updated to remove fuzz.
Patch 2 removed as it was accepted upstream.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3Dad85da159=
d415f1aad6ea9fb50cd1b630a89692e

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 .../wayland/weston-ti-version.inc             |  1 -
 ...equire-GL_EXT_unpack_subimage-commit.patch | 17 +++----
 ...x-assert-firing-when-subsurfaces-hav.patch | 47 -------------------
 3 files changed, 7 insertions(+), 58 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston/0002-surf=
ace-state-Fix-assert-firing-when-subsurfaces-hav.patch

diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc b=
/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
index c8624f0e..42e6b6ac 100644
--- a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
+++ b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
@@ -4,5 +4,4 @@ PR:append =3D ".tisoc1"
=20
 SRC_URI +=3D " \
         file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
-        file://0002-surface-state-Fix-assert-firing-when-subsurfaces-hav=
.patch \
 "
diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-requ=
ire-GL_EXT_unpack_subimage-commit.patch b/meta-ti-bsp/recipes-graphics/wa=
yland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
index 4b3b4a1f..2e650234 100644
--- a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_=
EXT_unpack_subimage-commit.patch
+++ b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_=
EXT_unpack_subimage-commit.patch
@@ -1,4 +1,4 @@
-From 3cddacaa9ea3cfd75732ea9a84312fa68e0bfda7 Mon Sep 17 00:00:00 2001
+From a64f81b25e678026fa2d6a6715a9c63823235dd5 Mon Sep 17 00:00:00 2001
 From: Ryan Eatmon <reatmon@ti.com>
 Date: Tue, 24 Mar 2026 10:52:59 -0500
 Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
@@ -20,10 +20,10 @@ Signed-off-by: Ryan Eatmon <reatmon@ti.com>
  2 files changed, 23 insertions(+), 5 deletions(-)
=20
 diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/re=
nderer-gl/gl-renderer-internal.h
-index 1afffbda..dbf7b1c3 100644
+index 1752db2..6a27019 100644
 --- a/libweston/renderer-gl/gl-renderer-internal.h
 +++ b/libweston/renderer-gl/gl-renderer-internal.h
-@@ -526,6 +526,8 @@ struct gl_renderer {
+@@ -558,6 +558,8 @@ struct gl_renderer {
  	struct weston_log_scope *shader_scope;
 =20
  	struct dmabuf_allocator *allocator;
@@ -33,10 +33,10 @@ index 1afffbda..dbf7b1c3 100644
 =20
  static inline uint32_t
 diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl=
/gl-renderer.c
-index 45a2a148..8b238208 100644
+index 81bb5e5..0e04073 100644
 --- a/libweston/renderer-gl/gl-renderer.c
 +++ b/libweston/renderer-gl/gl-renderer.c
-@@ -3021,6 +3021,22 @@ gl_renderer_flush_damage(struct weston_paint_node=
 *pnode)
+@@ -3404,6 +3404,22 @@ gl_renderer_flush_damage(struct weston_paint_node=
 *pnode)
 =20
  	data =3D wl_shm_buffer_get_data(buffer->shm_buffer);
 =20
@@ -59,7 +59,7 @@ index 45a2a148..8b238208 100644
  	if (gb->needs_full_upload || quirks->force_full_upload) {
  		wl_shm_buffer_begin_access(buffer->shm_buffer);
 =20
-@@ -5171,11 +5187,9 @@ gl_renderer_setup(struct weston_compositor *ec)
+@@ -5652,11 +5668,9 @@ gl_renderer_setup(struct weston_compositor *ec)
  	else
  		ec->read_format =3D pixel_format_get_info(DRM_FORMAT_ABGR8888);
 =20
@@ -74,7 +74,7 @@ index 45a2a148..8b238208 100644
 =20
  	if (gl_extensions_has(gr, EXTENSION_OES_MAPBUFFER))
  		GET_PROC_ADDRESS(gr->unmap_buffer, "glUnmapBufferOES");
-@@ -5303,6 +5317,8 @@ gl_renderer_setup(struct weston_compositor *ec)
+@@ -5792,6 +5806,8 @@ gl_renderer_setup(struct weston_compositor *ec)
  		   gl_version_minor(gr->gl_version));
  	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
  			    ec->read_format->drm_format_name);
@@ -83,6 +83,3 @@ index 45a2a148..8b238208 100644
  	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
  			    yesno(gl_extensions_has(gr, EXTENSION_ANGLE_PACK_REVERSE_ROW_ORD=
ER)));
  	weston_log_continue(STAMP_SPACE "glReadPixels supports PBO: %s\n",
---=20
-2.43.0
-
diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston/0002-surface-sta=
te-Fix-assert-firing-when-subsurfaces-hav.patch b/meta-ti-bsp/recipes-gra=
phics/wayland/weston/0002-surface-state-Fix-assert-firing-when-subsurface=
s-hav.patch
deleted file mode 100644
index d370577c..00000000
--- a/meta-ti-bsp/recipes-graphics/wayland/weston/0002-surface-state-Fix-=
assert-firing-when-subsurfaces-hav.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 12ecd8d4b5095c120efef76493546ead3f41ab5b Mon Sep 17 00:00:00 2001
-From: Derek Foreman <derek.foreman@collabora.com>
-Date: Wed, 27 May 2026 14:12:36 -0500
-Subject: [PATCH] surface-state: Fix assert firing when subsurfaces have =
no
- views
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/westo=
n/-/merge_requests/2085]
-
-I've not been able to reproduce this, but have a report that this fires
-when running Chromium on aarch64.
-
-It seems plausible that we can get here when none of the subsurfaces hav=
e
-views, and thus the flag won't be set.
-
-Let's just remove the assert.
-
-Fixes 6a280a8f
-Fixes #1117
-
-Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
-Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
----
- libweston/surface-state.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/libweston/surface-state.c b/libweston/surface-state.c
-index 3c31a0aa..65dc70bb 100644
---- a/libweston/surface-state.c
-+++ b/libweston/surface-state.c
-@@ -268,7 +268,6 @@ weston_surface_attach(struct weston_surface *surface=
,
- static void
- weston_surface_apply_subsurface_order(struct weston_surface *surface)
- {
--	struct weston_compositor *comp =3D surface->compositor;
-	struct weston_subsurface *sub;
-	struct weston_view *view;
-
-@@ -279,7 +278,6 @@ weston_surface_apply_subsurface_order(struct weston_=
surface *surface)
-		wl_list_for_each(view, &sub->surface->views, surface_link)
-			weston_view_geometry_dirty(view);
-	}
--	weston_assert_true(comp, comp->view_list_needs_rebuild);
- }
-
- /* Translate pending damage in buffer co-ordinates to surface
---
-2.34.1
--=20
2.35.3



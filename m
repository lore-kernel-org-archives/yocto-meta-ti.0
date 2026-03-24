Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF2FF54AD8
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 16:20:12 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1430.1774369210620722308
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 09:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=e4F0Btm4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.58, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEkfanjm/0c+29TDjqmacyncKopUJIx83TW+kqvkGN24hE+md76N/fnAnFM05Fh3ouzqEIv/7hfyw+8wmFW89XJAHtoGgiGUX72oZ4dZy1umdW5eQ4atGxnTDKVvhV8UlWSk+/n7GZBcc2WdEFD5QWezyr7wW44tp7IJ4NWPi5JVQhHJhvEOOHJjaVz1DJk5su848C7m8Xz80tj48hyPEByo/SKBZeUEyXAtwxwRDpfMJGUL5FdddMDP5Ru19qh7ZZnntd+OuBWX7Ji+7Ul+80mUzXOrltDNkCVplcLpN/GOSFJJEjp58YhIXTGbqf47oB4i/dSRL5uMPmTPY+hqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/i1T7RHd8yAqO+R8aIeeoUTvYflDJ30osLQBFfnAHNY=;
 b=RQsFMppHsOHCyoVzvUhBP2eN6MiP6wmrVoYsZV5eqZzSutl3Gi7ETw80vvz/PyXE7BvCHfYshPZmIho5XgCOOIhy1tvyUlg5WHf/V1Z0jnzBa3ZFR8VeMmTFvMPTAkobYp/l/0i9MgtH9BHXCepTVqcUqyaq2UrM0rVNhw+GX5HsgkhyfO0fATWyTghu8ajcCmuprOGNZ1aufVz/EMdz7Jn8mzDLGm0kd55L+sxVY0fZiySIj0IuAw2CkjLGURnhtjINfcf/ztIlTNCIlhOJIaXwjFReGV6iNHeznpBccJPi6znzn1IgN9dJQwWoDDbFG22U2ckUvkv6QdDH/Wsevg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/i1T7RHd8yAqO+R8aIeeoUTvYflDJ30osLQBFfnAHNY=;
 b=e4F0Btm41vPtyZVQ0Xsk2oUCvk1oOFkChWp5RKrTNqc09zyfrchjFGselaJ4dLoPzurqXUNNNeuOlA2OubC5IkTkClR/VOCRZO72v92h1AAMTXoe9eVOV4SesOTI8yfD/pk3eQRs9QnnwKeVM3oW68PWnZ8foNwnsOp9WgrsO7A=
Received: from CH5P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::6)
 by SA2PR10MB4668.namprd10.prod.outlook.com (2603:10b6:806:117::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 16:20:05 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::d6) by CH5P222CA0014.outlook.office365.com
 (2603:10b6:610:1ee::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 16:20:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 16:20:04 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 11:20:04 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 11:20:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 11:20:04 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OGK4pI2931593;
	Tue, 24 Mar 2026 11:20:04 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w54U8-0000000DUPb-0srC;
	Tue, 24 Mar 2026 11:20:04 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] weston: Update to 15.0.0
Date: Tue, 24 Mar 2026 11:20:04 -0500
Message-ID: <20260324162004.3215160-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|SA2PR10MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ff0be7-5050-4dca-6f2d-08de89c1355c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	w4XlbfnbQim9WqxIBPzNh+ZJPF0guqzuq1DcbLrEjixUgZRtd0ZfP32uuP9LsI3HvKelhg0wNBeM7FOZ1ePBQpAke9ejz+B/Y6Wl4VmXANpidKmqH5Zaa4Js2mDfQDTXXzBWfLzhy58WbTboNuRoMrF9pXB5MZckzsoT/ZTXjt0nDiUu0xcYezh4W12pRkEzuw9MQ//rkdj+IAdnJdrG8jOjlDHXh5Mwa5WzN3juptPj4tDZb+LZqjzh0KGHFl6OCFLyRIIYZpOO+J7OWANdDxVfujHCWBYSV/vhblT2wxwHdak4VM0VXRYAwO1w6SfaZbV3wJaNDV+oLCyGvtFid8ttW5+pY8Vk/Krl1sXCVrtHJa9Hz0XbdRXFC2vCZ4ym6NLs3Mi1oqc7nUMgn8vWbvNyxrCEl7ZooQhQ4IwOUOPSSGuXOTdVw8qX7mCnimKBi7Rle/K5cu9VchMnscfhpODCg1iZN/N81wZPevZJtMAdZrF9+EkCRELrjShl810adMpxxbEOPHvouXD6FFdh4YH8LI3F/9TBM+IIoAcHDR9obAwM+8h3xnJt4FXocxrbsIAK4008c0mWMb1sU3rD1Yqn7kDCflmid3YnERKLia7l0twS8/HkjtIR0xd0z8AvpQMUA2Csgmo1JL5IsnSWGfJ5wIe6CFHlan49eiYwUjODnMdDqgL3+sQBxCaoxs34EeOMwJxNCGMPURhL9+oMsmLZsVaCm5DqG57s/EDbDILUngx0dYa9Ote7B2e2517CC+0Yb7biQuo9NlyXE/LmqA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dKpDvNu4S/rMdaRYy3fAwdF1STLXY3qRYDKd2OS0J9aUnmabHdAR7Yc1lx9meqWFzuOKYJ2NjErA0YhLthNLTDoI3u01MPvHcokT+Wyx/2tFU8tAWY13sBemca+77C5OJwNWwmpraP2BrPj5K7bds0sqA+UD3DNv6xnBgFAevrkdr7h+0xt+QYkzWgk+V380m44JTRWPz12WpdjXOvKtBU4bTxLe9aacGHrIwZWqIcKeiXi/YDD5rHTSfRI8gNpfLc7KPRZ7OivHGFMNGOR3bXQ0WQRq0LU5qsDeIzJfT5ii3lNISSmNoxJ8xnI9AqnIP3oUXysM3B1/0dMjHibP7byuG5PBMgOznN9D6KGOKQSFo9LPy5XRLZvYtQcImbTCurdHf6pLozvAXc4dFcOrvvs+AV+cfbFBBubvIBx4cGn2LOFGAD7viA4sRLL7vynj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 16:20:04.9108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ff0be7-5050-4dca-6f2d-08de89c1355c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4668
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Mar 2026 16:20:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19804

oe-core has bumped the version to 15.0.0 [1].  We need to adjust the
bbappend version to % to better match future version changes.

Additionally, the patch needs to be updated to match the weston code
changes.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3Da1ed6fddd99=
171536e23d63a5d5b180019d672ad

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...equire-GL_EXT_unpack_subimage-commit.patch | 109 ++++++++----------
 ...ston_14.0.%.bbappend =3D> weston_%.bbappend} |   0
 2 files changed, 51 insertions(+), 58 deletions(-)
 rename meta-ti-bsp/recipes-graphics/wayland/{weston_14.0.%.bbappend =3D> w=
eston_%.bbappend} (100%)

diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-requir=
e-GL_EXT_unpack_subimage-commit.patch b/meta-ti-bsp/recipes-graphics/waylan=
d/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
index fbe8f2bb..4b3b4a1f 100644
--- a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EX=
T_unpack_subimage-commit.patch
+++ b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EX=
T_unpack_subimage-commit.patch
@@ -1,6 +1,6 @@
-From 5a05e5b66dd3831a9c9c2b3f64bd42419d9ade2d Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@konsulko.com>
-Date: Thu, 6 Jul 2023 01:48:41 +0000
+From 3cddacaa9ea3cfd75732ea9a84312fa68e0bfda7 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Tue, 24 Mar 2026 10:52:59 -0500
 Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
=20
 This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
@@ -13,83 +13,76 @@ Upstream-Status: Inappropriate [specific to TI SGX]
=20
 Signed-off-by: Andrew Davis <afd@ti.com>
 Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
-
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
 ---
  libweston/renderer-gl/gl-renderer-internal.h |  2 ++
- libweston/renderer-gl/gl-renderer.c          | 29 ++++++++++++++++----
- 2 files changed, 26 insertions(+), 5 deletions(-)
+ libweston/renderer-gl/gl-renderer.c          | 26 ++++++++++++++++----
+ 2 files changed, 23 insertions(+), 5 deletions(-)
=20
 diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/rend=
erer-gl/gl-renderer-internal.h
-index 5032035..85616c9 100644
+index 1afffbda..dbf7b1c3 100644
 --- a/libweston/renderer-gl/gl-renderer-internal.h
 +++ b/libweston/renderer-gl/gl-renderer-internal.h
-@@ -229,6 +229,8 @@ struct gl_renderer {
-	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
-	bool has_platform_base;
-
-+	bool has_unpack_subimage;
+@@ -526,6 +526,8 @@ struct gl_renderer {
+ 	struct weston_log_scope *shader_scope;
+=20
+ 	struct dmabuf_allocator *allocator;
 +
-	PFNEGLBINDWAYLANDDISPLAYWL bind_display;
-	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
-	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
++    bool has_unpack_subimage;
+ };
+=20
+ static inline uint32_t
 diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/g=
l-renderer.c
-index e694418b..2be6d621 100644
+index 45a2a148..8b238208 100644
 --- a/libweston/renderer-gl/gl-renderer.c
 +++ b/libweston/renderer-gl/gl-renderer.c
-@@ -2523,6 +2523,7 @@ gl_renderer_flush_damage(struct weston_paint_node *p=
node)
-	struct weston_surface *surface =3D pnode->surface;
-	const struct weston_testsuite_quirks *quirks =3D
-		&surface->compositor->test_data.test_quirks;
-+	struct gl_renderer *gr =3D get_renderer(surface->compositor);
-	struct weston_buffer *buffer =3D surface->buffer_ref.buffer;
-	struct gl_surface_state *gs =3D get_surface_state(surface);
-	struct gl_buffer_state *gb =3D gs->buffer;
-@@ -2550,6 +2551,24 @@ gl_renderer_flush_damage(struct weston_paint_node *=
pnode)
-
-	data =3D wl_shm_buffer_get_data(buffer->shm_buffer);
-
+@@ -3021,6 +3021,22 @@ gl_renderer_flush_damage(struct weston_paint_node *=
pnode)
+=20
+ 	data =3D wl_shm_buffer_get_data(buffer->shm_buffer);
+=20
 +	if (!gr->has_unpack_subimage) {
 +		wl_shm_buffer_begin_access(buffer->shm_buffer);
-+		for (j =3D 0; j < gs->buffer->num_textures; j++) {
-+			glBindTexture(GL_TEXTURE_2D, gs->buffer->textures[j]);
-+			glTexImage2D(GL_TEXTURE_2D, 0,
-+				     gs->buffer->gl_format[j],
-+				     gs->buffer->pitch / pixel_format_hsub(buffer->pixel_format, j),
-+				     buffer->height / pixel_format_vsub(buffer->pixel_format, j),
-+				     0,
-+				     gl_format_from_internal(gs->buffer->gl_format[j]),
-+				     gs->buffer->gl_pixel_type,
-+				     data + gs->buffer->offset[j]);
++		for (j =3D 0; j < gb->num_textures; j++) {
++			glBindTexture(GL_TEXTURE_2D, gb->textures[j]);
++			gl_texture_2d_store(gr, 0, 0, 0,
++                        gb->pitch / pixel_format_hsub(buffer->pixel_forma=
t, j),
++				        buffer->height / pixel_format_vsub(buffer->pixel_format, j),
++					    gb->texture_format[j].external,
++					    gb->texture_format[j].type,
++					    data + gb->offset[j]);
 +		}
 +		wl_shm_buffer_end_access(buffer->shm_buffer);
 +
 +		goto done;
 +	}
 +
-	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
-		wl_shm_buffer_begin_access(buffer->shm_buffer);
-
-@@ -4754,11 +4773,9 @@ gl_renderer_setup(struct weston_compositor *ec)
-	else
-		ec->read_format =3D pixel_format_get_info(DRM_FORMAT_ABGR8888);
-
--	if (gr->gl_version < gr_gl_version(3, 0) &&
--	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage")) {
+ 	if (gb->needs_full_upload || quirks->force_full_upload) {
+ 		wl_shm_buffer_begin_access(buffer->shm_buffer);
+=20
+@@ -5171,11 +5187,9 @@ gl_renderer_setup(struct weston_compositor *ec)
+ 	else
+ 		ec->read_format =3D pixel_format_get_info(DRM_FORMAT_ABGR8888);
+=20
+-	if (gr->gl_version < gl_version(3, 0) &&
+-	    !gl_extensions_has(gr, EXTENSION_EXT_UNPACK_SUBIMAGE)) {
 -		weston_log("GL_EXT_unpack_subimage not available.\n");
 -		return -1;
 -	}
-+	if (gr->gl_version >=3D gr_gl_version(3, 0) ||
++	if (gr->gl_version >=3D gl_version(3, 0) ||
 +	    weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))
 +		gr->has_unpack_subimage =3D true;
-
-	if (gr->gl_version >=3D gr_gl_version(3, 0) ||
-	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10_1=
0_REV"))
-@@ -4880,6 +4897,8 @@ gl_renderer_setup(struct weston_compositor *ec)
-		   gr_gl_version_minor(gr->gl_version));
-	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
-			    ec->read_format->drm_format_name);
+=20
+ 	if (gl_extensions_has(gr, EXTENSION_OES_MAPBUFFER))
+ 		GET_PROC_ADDRESS(gr->unmap_buffer, "glUnmapBufferOES");
+@@ -5303,6 +5317,8 @@ gl_renderer_setup(struct weston_compositor *ec)
+ 		   gl_version_minor(gr->gl_version));
+ 	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
+ 			    ec->read_format->drm_format_name);
 +	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
 +			    gr->has_unpack_subimage ? "yes" : "no");
-	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
-			    yesno(gr->has_pack_reverse));
-	weston_log_continue(STAMP_SPACE "glReadPixels supports PBO: %s\n",
+ 	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
+ 			    yesno(gl_extensions_has(gr, EXTENSION_ANGLE_PACK_REVERSE_ROW_ORDER=
)));
+ 	weston_log_continue(STAMP_SPACE "glReadPixels supports PBO: %s\n",
+--=20
+2.43.0
+
diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend b/=
meta-ti-bsp/recipes-graphics/wayland/weston_%.bbappend
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend
rename to meta-ti-bsp/recipes-graphics/wayland/weston_%.bbappend
--=20
2.43.0



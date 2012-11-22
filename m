Return-Path: <ndec13@gmail.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0E70E003D6
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 06:36:31 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAMEaVIY016533
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 08:36:31 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAMEaVwn029688
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 08:36:31 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 22 Nov 2012 08:36:30 -0600
Received: from localhost.localdomain (lncpu06.tif.ti.com [137.167.138.194])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAMEaG1h000479;
	Thu, 22 Nov 2012 08:36:30 -0600
From: Nicolas Dechesne <ndec13@gmail.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 Nov 2012 15:35:57 +0100
Message-ID: <1353594959-18237-2-git-send-email-ndec13@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1353594959-18237-1-git-send-email-ndec13@gmail.com>
References: <1353594959-18237-1-git-send-email-ndec13@gmail.com>
MIME-Version: 1.0
Cc: Nicolas Dechesne <n-dechesne@ti.com>
Subject: [PATCH 1/3] Revert "libdrm: enable omap experimental api support"
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2012 14:36:32 -0000
Content-Type: text/plain

From: Nicolas Dechesne <n-dechesne@ti.com>

This reverts commit cce5a7aea905d2e2b167ab51b132ec43ed519a12.

Because oe-core (then poky master) was upgraded to libdrm 2.40,
and because OMAP experimental support was enabled there too.
---
 recipes-graphics/drm/libdrm_2.4.39.bbappend |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)
 delete mode 100644 recipes-graphics/drm/libdrm_2.4.39.bbappend

diff --git a/recipes-graphics/drm/libdrm_2.4.39.bbappend b/recipes-graphics/drm/libdrm_2.4.39.bbappend
deleted file mode 100644
index d0c1a77..0000000
--- a/recipes-graphics/drm/libdrm_2.4.39.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-COMPATIBLE_MACHINE = "omap4|omap5"
-
-EXTRA_OECONF += "--enable-omap-experimental-api"
-- 
1.7.0.4



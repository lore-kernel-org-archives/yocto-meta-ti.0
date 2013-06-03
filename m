Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA0EAE0152A
	for <meta-ti@yoctoproject.org>; Mon,  3 Jun 2013 15:06:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r53M6EFj027338
	for <meta-ti@yoctoproject.org>; Mon, 3 Jun 2013 17:06:14 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r53M6E04008480
	for <meta-ti@yoctoproject.org>; Mon, 3 Jun 2013 17:06:14 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 3 Jun 2013 17:06:13 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id r53M682I020489;
	Mon, 3 Jun 2013 17:06:12 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 3 Jun 2013 17:11:46 -0500
Message-ID: <1370297506-25495-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1370297506-25495-1-git-send-email-Chase.Maupin@ti.com>
References: <1370297506-25495-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libdrm: Add support for dra7xx-evm
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
X-List-Received-Date: Mon, 03 Jun 2013 22:06:15 -0000
Content-Type: text/plain

* Change the COMPATIBLE_MACHINE setting to use omap-a15 so that
  the dra7xx-evm machine type is also included.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-graphics/drm/libdrm_2.4.39.bbappend |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/drm/libdrm_2.4.39.bbappend b/recipes-graphics/drm/libdrm_2.4.39.bbappend
index d0c1a77..76c7a84 100644
--- a/recipes-graphics/drm/libdrm_2.4.39.bbappend
+++ b/recipes-graphics/drm/libdrm_2.4.39.bbappend
@@ -1,3 +1,3 @@
-COMPATIBLE_MACHINE = "omap4|omap5"
+COMPATIBLE_MACHINE = "omap4|omap-a15"
 
 EXTRA_OECONF += "--enable-omap-experimental-api"
-- 
1.7.0.4



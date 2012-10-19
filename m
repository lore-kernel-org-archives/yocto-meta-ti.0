Return-Path: <ndec13@gmail.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99100E0049F
	for <meta-ti@yoctoproject.org>; Fri, 19 Oct 2012 06:51:55 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9JDprQa019968;
	Fri, 19 Oct 2012 08:51:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9JDprw6005761;
	Fri, 19 Oct 2012 08:51:53 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 19 Oct 2012 08:51:53 -0500
Received: from localhost.localdomain (lncpu06.tif.ti.com [137.167.138.194])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9JDpSv9000682;
	Fri, 19 Oct 2012 08:51:52 -0500
From: Nicolas Dechesne <ndec13@gmail.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 19 Oct 2012 15:51:24 +0200
Message-ID: <1350654686-22868-2-git-send-email-ndec13@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1350654686-22868-1-git-send-email-ndec13@gmail.com>
References: <1350654686-22868-1-git-send-email-ndec13@gmail.com>
MIME-Version: 1.0
Cc: Nicolas Dechesne <n-dechesne@ti.com>
Subject: [PATCH 1/3] libdrm: enable omap experimental api support
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
X-List-Received-Date: Fri, 19 Oct 2012 13:51:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Enrico Butera <ebutera@users.berlios.de>

This is needed to build gst-plugin-ducati.

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Signed-off-by: Hervé Fache <h-fache@ti.com>
---
 recipes-graphics/drm/libdrm_2.4.39.bbappend |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 recipes-graphics/drm/libdrm_2.4.39.bbappend

diff --git a/recipes-graphics/drm/libdrm_2.4.39.bbappend b/recipes-graphics/drm/libdrm_2.4.39.bbappend
new file mode 100644
index 0000000..d0c1a77
--- /dev/null
+++ b/recipes-graphics/drm/libdrm_2.4.39.bbappend
@@ -0,0 +1,3 @@
+COMPATIBLE_MACHINE = "omap4|omap5"
+
+EXTRA_OECONF += "--enable-omap-experimental-api"
-- 
1.7.0.4



Return-Path: <ndec13@gmail.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40B15E003D6
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 06:36:32 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAMEaVWK016537
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 08:36:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAMEaVNS029691
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 08:36:31 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 22 Nov 2012 08:36:31 -0600
Received: from localhost.localdomain (lncpu06.tif.ti.com [137.167.138.194])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAMEaG1i000479;
	Thu, 22 Nov 2012 08:36:31 -0600
From: Nicolas Dechesne <ndec13@gmail.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 Nov 2012 15:35:58 +0100
Message-ID: <1353594959-18237-3-git-send-email-ndec13@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1353594959-18237-1-git-send-email-ndec13@gmail.com>
References: <1353594959-18237-1-git-send-email-ndec13@gmail.com>
MIME-Version: 1.0
Cc: Nicolas Dechesne <n-dechesne@ti.com>
Subject: [PATCH 2/3] Revert "xf86-video-omap: add new recipe for OMAP4/5 X11 video driver"
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

This reverts commit 410dc026f2ee24a2346e7563a83f0181c79809cf.

Because this recipe was integrated in oe-core (then poky master).
---
 .../xorg-driver/xf86-video-omap_git.bb             |   31 --------------------
 1 files changed, 0 insertions(+), 31 deletions(-)
 delete mode 100644 recipes-graphics/xorg-driver/xf86-video-omap_git.bb

diff --git a/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
deleted file mode 100644
index abe773a..0000000
--- a/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-require recipes-graphics/xorg-driver/xorg-driver-video.inc
-
-SUMMARY = "X.Org X server -- TI OMAP integrated graphics chipsets driver"
-
-DESCRIPTION = "Open-source X.org graphics driver for TI OMAP graphics \
-Currently relies on a closed-source submodule for EXA acceleration on \
-the following chipsets: \
-  + OMAP3430 \
-  + OMAP3630 \
-  + OMAP4430 \
-  + OMAP4460 \
-  + OMAP5430 \
-  + OMAP5432 \
-\
-NOTE: this driver is work in progress..  you probably don't want to try \
-and use it yet.  The API/ABI between driver and kernel, and driver and \
-acceleration submodules is not stable yet.  This driver requires the \
-omapdrm kernel driver w/ GEM support. \
-"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
-
-DEPENDS += "virtual/libx11 drm xf86driproto udev"
-
-SRCREV = "653ccadb38c87be565df3fbf2ff24a0cbe5a5e98"
-PR = "${INC_PR}.1"
-PV = "0.4.2+gitr${SRCPV}"
-
-SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap;protocol=git"
-
-S = "${WORKDIR}/git"
-- 
1.7.0.4



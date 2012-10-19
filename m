Return-Path: <ndec13@gmail.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1C1DE0049D
	for <meta-ti@yoctoproject.org>; Fri, 19 Oct 2012 06:51:54 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9JDpsM5025435
	for <meta-ti@yoctoproject.org>; Fri, 19 Oct 2012 08:51:54 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9JDps0j005775
	for <meta-ti@yoctoproject.org>; Fri, 19 Oct 2012 08:51:54 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 19 Oct 2012 08:51:53 -0500
Received: from localhost.localdomain (lncpu06.tif.ti.com [137.167.138.194])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9JDpSvA000682;
	Fri, 19 Oct 2012 08:51:53 -0500
From: Nicolas Dechesne <ndec13@gmail.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 19 Oct 2012 15:51:25 +0200
Message-ID: <1350654686-22868-3-git-send-email-ndec13@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1350654686-22868-1-git-send-email-ndec13@gmail.com>
References: <1350654686-22868-1-git-send-email-ndec13@gmail.com>
MIME-Version: 1.0
Cc: Nicolas Dechesne <n-dechesne@ti.com>
Subject: [PATCH 2/3] xf86-video-omap: add new recipe for OMAP4/5 X11 video driver
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
X-List-Received-Date: Fri, 19 Oct 2012 13:51:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Nicolas Dechesne <n-dechesne@ti.com>

Since this component is still actively being developed, let's use
a _git.bb recipe. We can introduce 'x.y' version later.

Even though xf-video-omap can be combined with private/restricted
EXA sub-driver for SGX/PVR, it can also work without it. In which
case EXA aren't using SGX, but all standard driver features still
work, and it is a replacement for xf-video-fbdev.

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Signed-off-by: Hervé Fache <h-fache@ti.com>
---
 .../xorg-driver/xf86-video-omap_git.bb             |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 recipes-graphics/xorg-driver/xf86-video-omap_git.bb

diff --git a/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
new file mode 100644
index 0000000..abe773a
--- /dev/null
+++ b/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
@@ -0,0 +1,31 @@
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
+
+SUMMARY = "X.Org X server -- TI OMAP integrated graphics chipsets driver"
+
+DESCRIPTION = "Open-source X.org graphics driver for TI OMAP graphics \
+Currently relies on a closed-source submodule for EXA acceleration on \
+the following chipsets: \
+  + OMAP3430 \
+  + OMAP3630 \
+  + OMAP4430 \
+  + OMAP4460 \
+  + OMAP5430 \
+  + OMAP5432 \
+\
+NOTE: this driver is work in progress..  you probably don't want to try \
+and use it yet.  The API/ABI between driver and kernel, and driver and \
+acceleration submodules is not stable yet.  This driver requires the \
+omapdrm kernel driver w/ GEM support. \
+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
+
+DEPENDS += "virtual/libx11 drm xf86driproto udev"
+
+SRCREV = "653ccadb38c87be565df3fbf2ff24a0cbe5a5e98"
+PR = "${INC_PR}.1"
+PV = "0.4.2+gitr${SRCPV}"
+
+SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap;protocol=git"
+
+S = "${WORKDIR}/git"
-- 
1.7.0.4



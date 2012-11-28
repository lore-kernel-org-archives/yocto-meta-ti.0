Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0A76E00294
	for <meta-ti@yoctoproject.org>; Wed, 28 Nov 2012 09:30:23 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0E77052A7B; Wed, 28 Nov 2012 17:30:22 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121128173022.0E77052A7B@arago-project.org>
Date: Wed, 28 Nov 2012 17:30:22 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Nicolas Dechesne : Revert "xf86-video-omap: add new recipe for OMAP4/ 5 X11 video driver"
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
X-List-Received-Date: Wed, 28 Nov 2012 17:30:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2b37d0ee5590e20a48758e3ee7bd8a947ba8a7bb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2b37d0ee5590e20a48758e3ee7bd8a947ba8a7bb

Author: Nicolas Dechesne <n-dechesne@ti.com>
Date:   Thu Nov 22 15:35:58 2012 +0100

Revert "xf86-video-omap: add new recipe for OMAP4/5 X11 video driver"

This reverts commit 410dc026f2ee24a2346e7563a83f0181c79809cf.

Because this recipe was integrated in oe-core (then poky master).

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../xorg-driver/xf86-video-omap_git.bb             |   31 --------------------
 1 files changed, 0 insertions(+), 31 deletions(-)

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



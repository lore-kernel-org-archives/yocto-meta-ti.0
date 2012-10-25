Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 019FBE0127A
	for <meta-ti@yoctoproject.org>; Wed, 24 Oct 2012 18:01:43 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 295FA52ABB; Thu, 25 Oct 2012 01:01:41 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121025010142.295FA52ABB@arago-project.org>
Date: Thu, 25 Oct 2012 01:01:41 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Nicolas Dechesne : xf86-video-omap: add new recipe for OMAP4/ 5 X11 video driver
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
X-List-Received-Date: Thu, 25 Oct 2012 01:01:44 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 410dc026f2ee24a2346e7563a83f0181c79809cf
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=410dc026f2ee24a2346e7563a83f0181c79809cf

Author: Nicolas Dechesne <n-dechesne@ti.com>
Date:   Fri Oct 19 15:51:25 2012 +0200

xf86-video-omap: add new recipe for OMAP4/5 X11 video driver

Since this component is still actively being developed, let's use
a _git.bb recipe. We can introduce 'x.y' version later.

Even though xf-video-omap can be combined with private/restricted
EXA sub-driver for SGX/PVR, it can also work without it. In which
case EXA aren't using SGX, but all standard driver features still
work, and it is a replacement for xf-video-fbdev.

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Signed-off-by: Hervé Fache <h-fache@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../xorg-driver/xf86-video-omap_git.bb             |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

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



Return-Path: <ebutera@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD977E013EF
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 16:41:08 -0700 (PDT)
Received: by mail-wi0-f182.google.com with SMTP id hm2so1195246wib.11
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 16:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=uYyyMZXaMsDxbtnsQ8tyJ3zl1VGH0pvxHSvfohkecWM=;
	b=c+JgNXHSFfmzKLj1wggbXXf88IK99MrIlkfwRkbty7ZU9QcQ5985MmpvoO9bvRD2Wy
	2AKDtiMgdCm4LZsxj1hPrUSGO8nDhI+CS7MzQBI4aIRv51XYkpoXsW1CgCA7qOlqUnBi
	4Y2cMDdZgI2BWp+vTN1JKXgdXm4gYmZ7Eoxh2HUYXaGYkrvEsA0iJWJskUSH1MMub1is
	zpKBy27Bvk8ZoJnVO4YloFIntC4WAu+UWh1u0cGVoHr8wCWB/RveO//jYk7TadGmUV3G
	zDbfVpDDhvKHNMGCynF2mvzpNxoFKQHHgzfLyj6IMOQukby6XPTRBmejG4FEuHO3Odrg
	iR0A==
Received: by 10.180.76.69 with SMTP id i5mr16386992wiw.9.1349912463965;
	Wed, 10 Oct 2012 16:41:03 -0700 (PDT)
Received: from localhost.localdomain ([188.11.142.65])
	by mx.google.com with ESMTPS id v3sm5459401wiy.5.2012.10.10.16.41.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 16:41:03 -0700 (PDT)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Thu, 11 Oct 2012 01:40:33 +0200
Message-Id: <1349912433-21880-6-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
Subject: [PATCH 6/6] gst-plugin-ducati: add latest git version
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
X-List-Received-Date: Wed, 10 Oct 2012 23:41:09 -0000

Tested h264 and mpeg4 1080p encoding on pandaboard ES.

Note: the bootloader must be configured WITHOUT memory holes
(mem=... mem=...), just use all 1GB.

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 .../gstreamer/gst-plugin-ducati_git.bb             |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 recipes-multimedia/gstreamer/gst-plugin-ducati_git.bb

diff --git a/recipes-multimedia/gstreamer/gst-plugin-ducati_git.bb b/recipes-multimedia/gstreamer/gst-plugin-ducati_git.bb
new file mode 100644
index 0000000..93ea08c
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gst-plugin-ducati_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "GStreamer plugins for omap4 using libdce"
+HOMEPAGE = "http://gitorious.org/gstreamer-omap/gst-ducati"
+SECTION = "multimedia"
+LICENSE = "TI"
+
+COMPATIBLE_MACHINE = "pandaboard"
+
+require recipes-multimedia/gstreamer/gst-plugins.inc
+
+PR = "r1"
+PV = "gitr${SRCPV}"
+
+# 2012/09/25: ducatividenc: log extended error info, and use the correct one from _process
+SRCREV = "9f29c17f8dcbd8cf59c8ad3b00d87534b6fc4579"
+
+SRC_URI = "git://gitorious.org/gstreamer-omap/gst-ducati.git;protocol=git"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "gstreamer gst-plugins-base gst-plugins-bad libdrm libdce"
+RDEPENDS = "gstreamer gst-plugins-base gst-plugins-bad libdrm libdce"
+
+inherit autotools gettext pkgconfig
+
+do_configure_prepend() {
+       git submodule init && git submodule update
+       autopoint
+}
-- 
1.7.9.5



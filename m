Return-Path: <ebutera@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FB33E014A2
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 12:26:28 -0700 (PDT)
Received: by mail-wi0-f182.google.com with SMTP id hm2so121651wib.11
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 12:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=RGD42iFF4cqAyot5DJGh4skatgaEK1vFdc/zzjftVpg=;
	b=agaPJSVEMc6g6TZ+dwPeUYv32kYLE72LgT0Ddb90Q/4BCVyhV4EqZb1spgevQ7+1mF
	oSMe71ke9UQwB5Fl1ml4W662RVBhshFMcprqy3QUSEnXxNrdiB9EztZzR5JmJ2F0soJe
	CNMPMOLIfleF9Qoy01AZn0N/w8IkWqyN7mgMs2Z1wHlPaKLgi2NiC3dXAb9IcRZfp/PX
	lrxcGbHEFzGioOWH21Dxp0X9aGhv3IGfWzg1pz7n/UYVHpPCBO6wQ1L5ls5UtMoRyzVk
	IZ9z45sEW4mBN+lYrDWEauDlXLqmFAkXFieZxBEFmjp+ydi7trp6ZRLCt7U6dgsCexWH
	P0Vw==
Received: by 10.216.135.85 with SMTP id t63mr3097799wei.93.1350069988774;
	Fri, 12 Oct 2012 12:26:28 -0700 (PDT)
Received: from localhost.localdomain ([188.11.142.65])
	by mx.google.com with ESMTPS id dm3sm5296065wib.3.2012.10.12.12.26.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Oct 2012 12:26:28 -0700 (PDT)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Oct 2012 21:26:12 +0200
Message-Id: <1350069972-21318-6-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
References: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
Subject: [PATCH v2 6/6] gst-plugin-ducati: add latest git version
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
X-List-Received-Date: Fri, 12 Oct 2012 19:26:29 -0000

Tested h264 and mpeg4 1080p encoding on pandaboard ES.

Note: the bootloader must be configured WITHOUT memory holes
(mem=... mem=...), just use all 1GB.

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 .../gstreamer/gst-plugin-ducati_git.bb             |   29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 recipes-multimedia/gstreamer/gst-plugin-ducati_git.bb

diff --git a/recipes-multimedia/gstreamer/gst-plugin-ducati_git.bb b/recipes-multimedia/gstreamer/gst-plugin-ducati_git.bb
new file mode 100644
index 0000000..6d91be3
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gst-plugin-ducati_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "GStreamer plugins for omap4 using libdce"
+HOMEPAGE = "http://gitorious.org/gstreamer-omap/gst-ducati"
+SECTION = "multimedia"
+LICENSE = "TI"
+
+COMPATIBLE_MACHINE = "omap4"
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
+
+inherit autotools gettext pkgconfig
+
+do_configure_prepend() {
+       git submodule init && git submodule update
+       autopoint
+}
-- 
1.7.9.5



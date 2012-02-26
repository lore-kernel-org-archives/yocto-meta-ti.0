Return-Path: <ebutera@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8B15E013AD
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:37 -0800 (PST)
Received: by mail-ey0-f176.google.com with SMTP id i1so236761eaa.35
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:37 -0800 (PST)
Received-SPF: pass (google.com: domain of ebutera@gmail.com designates
	10.213.14.205 as permitted sender) client-ip=10.213.14.205; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of ebutera@gmail.com
	designates 10.213.14.205 as permitted sender)
	smtp.mail=ebutera@gmail.com;
	dkim=pass header.i=ebutera@gmail.com
Received: from mr.google.com ([10.213.14.205])
	by 10.213.14.205 with SMTP id h13mr3179297eba.5.1330285177694 (num_hops
	= 1); Sun, 26 Feb 2012 11:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=9f7slUQjL+G2o/MVGO5CjzRUnBRU/VQGEAawc40mE6I=;
	b=xHAGWcnL8LIqq4MugQk3YN6inAxUuc8Sn3+jCcbeGtezBz0aBaAL5m0l5U3DoOz7b6
	Fq+I1nqD+Giv/zX8U5HQPKBW5GleNbj84wZYVY2gECRsAXQZAA4DPOL8dN/yKrR9wpxL
	gFMIkPZvmY+qOTWgcEsmWirK2VvU7PIDGDh4s=
Received: by 10.213.14.205 with SMTP id h13mr2401925eba.5.1330285177610;
	Sun, 26 Feb 2012 11:39:37 -0800 (PST)
Received: from localhost.localdomain ([188.11.55.70])
	by mx.google.com with ESMTPS id v51sm48713599eef.2.2012.02.26.11.39.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 11:39:36 -0800 (PST)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Sun, 26 Feb 2012 20:39:12 +0100
Message-Id: <1330285154-14853-8-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
References: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
Subject: [RFC PATCH 7/9] gst-ducati: add latest git version
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Feb 2012 19:39:38 -0000

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 recipes-ti/gstreamer-ti/gst-ducati_git.bb |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/gstreamer-ti/gst-ducati_git.bb

diff --git a/recipes-ti/gstreamer-ti/gst-ducati_git.bb b/recipes-ti/gstreamer-ti/gst-ducati_git.bb
new file mode 100644
index 0000000..0b43bca
--- /dev/null
+++ b/recipes-ti/gstreamer-ti/gst-ducati_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "GStreamer plugins for omap4 using libdce"
+HOMEPAGE = "http://gitorious.org/gstreamer-omap/gst-ducati"
+SECTION = "multimedia"
+LICENSE = "TI"
+
+require recipes-multimedia/gstreamer/gst-plugins.inc
+
+PR = "r1"
+PV = "gitr${SRCPV}"
+
+# 2012/01/24: ducatimpeg4dec: don't leak input buffers
+SRCREV = "815290098b6b638bd8832709b3ad2edbf366d144"
+
+SRC_URI = "git://gitorious.org/gstreamer-omap/gst-ducati.git;protocol=git"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "gstreamer gst-plugins-base gst-plugins-bad libdce"
+RDEPENDS = "gstreamer gst-plugins-base gst-plugins-bad libdce"
+
+inherit autotools gettext pkgconfig
+
+do_configure_prepend() {
+	git submodule init && git submodule update
+	autopoint
+}
-- 
1.7.5.4



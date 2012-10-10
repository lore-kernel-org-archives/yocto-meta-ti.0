Return-Path: <ebutera@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8185E013D2
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 16:41:16 -0700 (PDT)
Received: by mail-wi0-f176.google.com with SMTP id hn14so6272942wib.11
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 16:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=tmHfimQkeb7z3TjaGe/QErn0uc+z9L9Q1SJtjTq8zbc=;
	b=Ln7rY9UZfFr64yQ6YPhQ6P4yIvODEqz9GIhRz1ElILHg5/Vxpifk3tMqwD8NdfKrLV
	idEorcWKBbxIYcnvKRiynYFcGuUip27jAht2v9IQp1q2454mm4OcL2uX50GWtc3/+iQJ
	wPwKGWBWFl7pIdLqjgrdS+o7bjs6EffgiJyCGiJBf/OT2cFGxShXGOFwbWgGrHtNvmt3
	MiCa+eiOrrgYhhMa/0vGscL/Nj8dePIZQGWY1BNf8xIBoTzbA53YDhMKk4OdLv4GfjRc
	xE/+BSAhSohjbpDxS4z9vePgMFMAEin4bGXvBzARsXcryEmyiNgc1Iz8qHSV6EWXXBPu
	lN+Q==
Received: by 10.216.116.73 with SMTP id f51mr15427758weh.50.1349912461896;
	Wed, 10 Oct 2012 16:41:01 -0700 (PDT)
Received: from localhost.localdomain ([188.11.142.65])
	by mx.google.com with ESMTPS id v3sm5459401wiy.5.2012.10.10.16.41.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 16:41:01 -0700 (PDT)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Thu, 11 Oct 2012 01:40:32 +0200
Message-Id: <1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
Subject: [PATCH 5/6] gstreamer: bbappend to use TI-patched versions needed for gst-plugin-ducati
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
X-List-Received-Date: Wed, 10 Oct 2012 23:41:17 -0000

Note: pvrvideosink is disabled because it needs pvr driver.

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   17 +++++++++++++++++
 .../gstreamer/gst-plugins-base_0.10.36.bbappend    |   16 ++++++++++++++++
 .../gstreamer/gstreamer_0.10.36.bbappend           |   13 +++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
 create mode 100644 recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
 create mode 100644 recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend

diff --git a/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
new file mode 100644
index 0000000..06f62f9
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -0,0 +1,17 @@
+
+COMPATIBLE_MACHINE = "pandaboard"
+
+# 2012/09/26: pvrvideosink: Limit size to 1080p as it is a hardware limitation
+SRCREV = "3eb68bf5bcd79d490e35d29f262a0a9d84da36ff"
+
+SRC_URI = "git://gitorious.org/gstreamer-omap/gst-plugins-bad.git;protocol=git;branch=v0.10.23+ti"
+
+S = "${WORKDIR}/git"
+
+# TODO: add pvr drivers to enable the pvr plugin
+EXTRA_OECONF += " --disable-pvr"
+
+do_configure_prepend() {
+       git submodule init && git submodule update
+       autopoint
+}
diff --git a/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend b/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
new file mode 100644
index 0000000..f8b5742
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
@@ -0,0 +1,16 @@
+
+COMPATIBLE_MACHINE = "pandaboard"
+
+# 2012/09/20: typefind: give less weight to H.263 streams when few blocks are found
+SRCREV = "fad32193a79b394c8e7e630b0aa739462a424fa4"
+
+SRC_URI = "git://gitorious.org/gstreamer-omap/gst-plugins-base.git;protocol=git;branch=v0.10.36+ti \
+           file://gst-plugins-base-tremor.patch \
+           file://configure.ac-fix-subparse-plugin.patch"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+       git submodule init && git submodule update
+       autopoint
+}
diff --git a/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend b/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
new file mode 100644
index 0000000..aba1664
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
@@ -0,0 +1,13 @@
+
+COMPATIBLE_MACHINE = "pandaboard"
+
+SRCREV = "2096b1022ad513f90639aa7a04445a2da8bc5363"
+
+SRC_URI = "git://gitorious.org/gstreamer-omap/gstreamer.git;protocol=git;branch=v0.10.36+ti"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+       git submodule init && git submodule update
+       autopoint
+}
-- 
1.7.9.5



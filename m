Return-Path: <ebutera@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 363A7E0147E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 12:26:28 -0700 (PDT)
Received: by mail-wi0-f182.google.com with SMTP id hm2so121651wib.11
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 12:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Kjgmr7f0OvWcjXkc4d3jWzEGDTEpXE0dduc/0VeoxHI=;
	b=xxDCKUywu8pMpWnuNaJeucVbPRZXH4ardTNOx84CC1T3YNJwV6sF3NsRhuCHO8N8md
	SB/9NGS9wNmL9mp4BJC/qjXbg/1McMmkXpqF0Xid69xW/1QaaA8L2cHBf1QgbOrTnCF1
	xMZTpE3lfwT94htRKzzlmb+k4u/q+46gOlRcgN3NdjStGGqnpcLSlXG/SDZqESxk4T8l
	w4WbkPx4HEDqMo8k1lpmyOsZHGVAqzVsWDT9uhC9Yhd3HpSaYWvfsPVClhjg5eHcLQ5n
	hcNmfSAilBlj2z6wRR5VR8B51Z6bn5dGhuJV5KCzVRvZh6m6O8CccKZOsJMp/RWBRYMN
	hxxw==
Received: by 10.180.99.133 with SMTP id eq5mr8096887wib.21.1350069987417;
	Fri, 12 Oct 2012 12:26:27 -0700 (PDT)
Received: from localhost.localdomain ([188.11.142.65])
	by mx.google.com with ESMTPS id dm3sm5296065wib.3.2012.10.12.12.26.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Oct 2012 12:26:26 -0700 (PDT)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Oct 2012 21:26:11 +0200
Message-Id: <1350069972-21318-5-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
References: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
Subject: [PATCH v2 5/6] gstreamer: bbappend to use TI-patched versions needed for gst-plugin-ducati
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
X-List-Received-Date: Fri, 12 Oct 2012 19:26:28 -0000

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
index 0000000..21d68de
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -0,0 +1,17 @@
+
+COMPATIBLE_MACHINE = "omap4"
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
index 0000000..f85ded6
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
@@ -0,0 +1,16 @@
+
+COMPATIBLE_MACHINE = "omap4"
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
index 0000000..8037360
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
@@ -0,0 +1,13 @@
+
+COMPATIBLE_MACHINE = "omap4"
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



Return-Path: <ebutera@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B947E0132F
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:35 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id e49so869394eek.35
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:35 -0800 (PST)
Received-SPF: pass (google.com: domain of ebutera@gmail.com designates
	10.14.201.8 as permitted sender) client-ip=10.14.201.8; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of ebutera@gmail.com
	designates 10.14.201.8 as permitted sender)
	smtp.mail=ebutera@gmail.com;
	dkim=pass header.i=ebutera@gmail.com
Received: from mr.google.com ([10.14.201.8])
	by 10.14.201.8 with SMTP id a8mr6170458eeo.106.1330285175782 (num_hops
	= 1); Sun, 26 Feb 2012 11:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=g4CBn5QSf3I7XPB+DDsaJbdbCvG8M1823+/YCkQYji0=;
	b=IPbsOEvskDLJQjfrECFZX4WHfkvtWgkBmQ8qzLqgilnM+qTi/EjBEXUoQKSXnOGhml
	7oq2hKwzOn6eWSrMVnkkXGBi7SHgEjuh0ViaE9fHcyklLjzPRfAeZKKoftr94i/S7vY/
	2p0j9Aoo1y+lYBc+sWjqVdv76dTI02Vz/Pvlc=
Received: by 10.14.201.8 with SMTP id a8mr4654934eeo.106.1330285175705;
	Sun, 26 Feb 2012 11:39:35 -0800 (PST)
Received: from localhost.localdomain ([188.11.55.70])
	by mx.google.com with ESMTPS id v51sm48713599eef.2.2012.02.26.11.39.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 11:39:35 -0800 (PST)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Sun, 26 Feb 2012 20:39:11 +0100
Message-Id: <1330285154-14853-7-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
References: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
Subject: [RFC PATCH 6/9] gstreamer: add bbappends to use patched versions needed by gst-ducati
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
X-List-Received-Date: Sun, 26 Feb 2012 19:39:36 -0000

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 .../gstreamer/gst-plugins-bad_0.10.22.bbappend     |   21 +++++++++++++++++++
 .../gstreamer/gst-plugins-base_0.10.35.bbappend    |   18 ++++++++++++++++
 .../gstreamer/gstreamer_0.10.35.bbappend           |   22 ++++++++++++++++++++
 3 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bbappend
 create mode 100644 recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bbappend
 create mode 100644 recipes-multimedia/gstreamer/gstreamer_0.10.35.bbappend

diff --git a/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bbappend b/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bbappend
new file mode 100644
index 0000000..d00306a
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bbappend
@@ -0,0 +1,21 @@
+COMPATIBLE_MACHINE_omap4 = "(omap4430-panda|pandaboard)"
+
+PR = "r0"
+
+SRC_URI = "git://gitorious.org/gstreamer-omap/gst-plugins-bad.git;protocol=git;branch=v0.10.22+ti;name=gstbad \
+           git://anongit.freedesktop.org/gstreamer/common;protocol=git;destsuffix=git/common;name=common \
+          "
+
+SRCREV_gstbad = "7cea5a4ca2f0c551ea816b900a88f9bb5c1deee7"
+SRCREV_common = "46dfcea233cf6df83e3771d8a8066e87d614f893"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "--disable-pvr"
+
+do_configure_prepend() {
+	# This m4 file contains nastiness which conflicts with libtool 2.2.2
+	rm ${S}/m4/lib-link.m4 || true
+	autopoint
+}
+
diff --git a/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bbappend b/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bbappend
new file mode 100644
index 0000000..eabe47e
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bbappend
@@ -0,0 +1,18 @@
+COMPATIBLE_MACHINE_omap4 = "(omap4430-panda|pandaboard)"
+
+SRC_URI_omap4 = "git://gitorious.org/gstreamer-omap/gst-plugins-base.git;protocol=git;branch=v0.10.35+ti;name=gstbase \
+                 git://anongit.freedesktop.org/gstreamer/common;protocol=git;destsuffix=git/common;name=common \
+                 file://gst-plugins-base-tremor.patch"
+
+PR = "r0"
+
+SRCREV_gstbase = "a9efac64106a2e62fcc099fbbc9f530c36a8f943"
+SRCREV_common = "46dfcea233cf6df83e3771d8a8066e87d614f893"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+	# This m4 file contains nastiness which conflicts with libtool 2.2.2
+	rm -f ${S}/m4/lib-link.m4
+	autopoint
+}
diff --git a/recipes-multimedia/gstreamer/gstreamer_0.10.35.bbappend b/recipes-multimedia/gstreamer/gstreamer_0.10.35.bbappend
new file mode 100644
index 0000000..c240979
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gstreamer_0.10.35.bbappend
@@ -0,0 +1,22 @@
+
+DEFAULT_PREFERENCE_omap4 = "10"
+
+# 2011-07-06: basetransform: don't do unnecessary pad_alloc()
+SRCREV = "41af019dc6333d1ab8372bd806e0f289899f1ea4"
+
+SRC_URI = "git://gitorious.org/gstreamer-omap/gstreamer.git;protocol=git;branch=v0.10.35+ti;name=gstreamer \
+           git://anongit.freedesktop.org/gstreamer/common;protocol=git;destsuffix=git/common;name=common \
+           file://check_fix.patch \
+           file://gst-inspect-check-error.patch"
+
+# 2011-07-06: basetransform: don't do unnecessary pad_alloc()
+SRCREV_gstreamer = "41af019dc6333d1ab8372bd806e0f289899f1ea4"
+
+SRCREV_common = "46dfcea233cf6df83e3771d8a8066e87d614f893"
+
+S = "${WORKDIR}/git"
+
+#do_configure_prepend() {
+#	git submodule init
+#	git submodule update
+#}
-- 
1.7.5.4



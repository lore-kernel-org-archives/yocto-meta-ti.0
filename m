Return-Path: <ebutera@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F41DDE0148E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 12:26:24 -0700 (PDT)
Received: by mail-we0-f176.google.com with SMTP id z53so2153983wey.35
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 12:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=TeQ59GCTT5q4SY0jHgbT0UM/ZhSmrrO3BHUv7NKeOaM=;
	b=g+Pw4WEXea4QP3zFr8ZdLaF8beSg14DkEzsbOZ6F3n07URKb9KyEwEHEWoECT9SGH9
	Ubyd4HD4sCimSAMH8/VaSsvp4+Ll8PnO/Hi/cFJVowqg6o4PjIxLinCE3WrEtjybJ+Ij
	XTYNjVY69i3sPDwIRxfaxaBaxASiVVHIIRy1WgURwP+WgTEC10Q3Ncrew80qtVAoFlsz
	6JVIDz7pvoyiXt2GGKrxh1ALs842FuayYGt1KN2UdRT3+mMhi8NC2mqBQUpQikJL6vPX
	jSrDdTM5VO0S4sLUjorbW1poxdYusdth8m+MvqQOP2xL8JyvtMSF++O+0HrP3ISHhPkH
	aOBw==
Received: by 10.216.141.14 with SMTP id f14mr3237156wej.208.1350069984689;
	Fri, 12 Oct 2012 12:26:24 -0700 (PDT)
Received: from localhost.localdomain ([188.11.142.65])
	by mx.google.com with ESMTPS id dm3sm5296065wib.3.2012.10.12.12.26.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Oct 2012 12:26:24 -0700 (PDT)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Oct 2012 21:26:09 +0200
Message-Id: <1350069972-21318-3-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
References: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
Subject: [PATCH v2 3/6] ti-firmware-ipu-dce: add binary version 1.6+120829+191835+git53cf578
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
X-List-Received-Date: Fri, 12 Oct 2012 19:26:25 -0000

It's required at runtime when loading omap_remoteproc kernel module
to use libdce/gst-plugin-ducati.

Be warned that this firmware, kernel version and libdce are tightly
coupled (at least now) so don't mix random versions.
Use [1] as reference for version upgrades.

[1]: https://launchpad.net/~tiomap-dev

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 recipes-ti/dce/ti-firmware-ipu-dce_1.6.bb |   27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 recipes-ti/dce/ti-firmware-ipu-dce_1.6.bb

diff --git a/recipes-ti/dce/ti-firmware-ipu-dce_1.6.bb b/recipes-ti/dce/ti-firmware-ipu-dce_1.6.bb
new file mode 100644
index 0000000..44f94ae
--- /dev/null
+++ b/recipes-ti/dce/ti-firmware-ipu-dce_1.6.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "TI Ducati Multimedia Firmware"
+HOMEPAGE = "https://launchpad.net/~tiomap-dev"
+SECTION = "firmware"
+LICENSE = "TI"
+
+COMPATIBLE_MACHINE = "omap4"
+
+PV = "1.6+120829+191835+git53cf578"
+
+SRC_URI = "https://github.com/downloads/ebutera/ti-firmwares/ti-firmware-ipu-dce_${PV}.tar.gz"
+
+SRC_URI[md5sum] = "1e9c4b5ffc14f2f9d82d3f53287495f0"
+SRC_URI[sha256sum] = "11b89f74a3e8d19b6a22f1f652c8334a9604c0b8f3980d9814430d43b4e58ed7"
+
+LIC_FILES_CHKSUM = "file://ti-firmware-ipu-dce.license.txt;md5=bd402733d2669054ce3d16d450b6121a"
+
+# TODO: add debug firmware
+FILES_${PN} = "/lib/firmware/*"
+
+do_compile() {
+        :
+}
+
+do_install() {
+        install -d  ${D}/lib/firmware/
+        cp ti-firmware-ipu-dce.xem3 ${D}/lib/firmware/ducati-m3-core0.xem3
+}
-- 
1.7.9.5



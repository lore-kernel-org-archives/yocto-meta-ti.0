Return-Path: <ebutera@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BC1DE01404
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 16:40:58 -0700 (PDT)
Received: by mail-wg0-f54.google.com with SMTP id dt10so698739wgb.11
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 16:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=WdyBi9LYwP5ME2bKYv49hJ7cA+LYXmy3zJr//4B52W4=;
	b=JFwhIw+ay0peiNOszAClYBfgoQ807jOQcpBFfuvdsX3BYvZ8CG9RVowNpZhUCN0R/4
	YAgVMdLKHt5JecfqdjPV+xylzCgEyyAt0LgWXvJmpTaZ+GzVZCFQi14pUz+Gjal+DP1L
	sJlqlN5M9qSu8jNdCSOURc08eZKXRCRFbG7dkpXKGquzUlQJ31aOL4ZDRknSqPFpy582
	EbmldldTaYS7IBxoHSBUd7A+fayztHQyCpbU/eN/E36BB/FlTnhk3q7CdgJgn4vvyFmr
	lkIEoraIYBKJzxHODArZlWtZLEsybrUVkoUac5vlRkSMAITF9YVLc1hHrcpioZ56JeOy
	rzVw==
Received: by 10.180.91.169 with SMTP id cf9mr16457036wib.1.1349912458327;
	Wed, 10 Oct 2012 16:40:58 -0700 (PDT)
Received: from localhost.localdomain ([188.11.142.65])
	by mx.google.com with ESMTPS id v3sm5459401wiy.5.2012.10.10.16.40.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 16:40:57 -0700 (PDT)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Thu, 11 Oct 2012 01:40:30 +0200
Message-Id: <1349912433-21880-3-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
Subject: [PATCH 3/6] ti-firmware-ipu-dce: add binary version 1.6+120829+191835+git53cf578
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
X-List-Received-Date: Wed, 10 Oct 2012 23:40:59 -0000

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
index 0000000..e1f2205
--- /dev/null
+++ b/recipes-ti/dce/ti-firmware-ipu-dce_1.6.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "TI Ducati Multimedia Firmware"
+HOMEPAGE = "https://launchpad.net/~tiomap-dev"
+SECTION = "firmware"
+LICENSE = "TI"
+
+COMPATIBLE_MACHINE = "pandaboard"
+
+PV = "1.6+120829+191835+git53cf578"
+
+SRC_URI = "https://launchpad.net/~tiomap-dev/+archive/omap-trunk/+files/ti-firmware-ipu-dce_${PV}.tar.gz"
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



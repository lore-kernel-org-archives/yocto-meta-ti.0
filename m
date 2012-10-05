Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42E38E00293
	for <meta-ti@yoctoproject.org>; Fri,  5 Oct 2012 11:56:33 -0700 (PDT)
Received: by mail-oa0-f48.google.com with SMTP id h2so2636696oag.35
	for <meta-ti@yoctoproject.org>; Fri, 05 Oct 2012 11:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=UZY7tXDBu5OY1yBtKIjL/JDWm06YTBKOLRSNQLJiv6c=;
	b=RX1xjmEZgFNbntji/GFh0A1McjDI6qE3s2p7qd1z2QQU4E99ujILJh/Qz69cpS+K3m
	vdjRYvUtyhVcA7yB6UQHj7Q/jwY/1ASsk1EuOTvq18qa8sWlOWIoGVoCHiACbHR2hb1D
	WzyvMR6nteH6m7G6srPpxa5qvz/k/e/aqkVOIFQyOzfIsNl3LcqiYkaGTyJRuVR2vRAN
	m5mawcYzPojfddoVOVWo7/249FPt3agLACzhdeDZaTvjZtUvDFIGBzAzF31E3IZhgg22
	LpNrFH5QgM4tM/jXwikdHcgffYD1va7zWPhlQZxBuHezeKdSXwqgu8a5Tg1Hx9EfjkPc
	bgdQ==
Received: by 10.182.75.33 with SMTP id z1mr7927483obv.9.1349463390332;
	Fri, 05 Oct 2012 11:56:30 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id n7sm2373562obd.16.2012.10.05.11.56.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 11:56:29 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri,  5 Oct 2012 14:24:41 -0500
Message-Id: <1349465081-10787-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] wl12xx-firmware: Port wl12xx-firmware recipe
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
X-List-Received-Date: Fri, 05 Oct 2012 18:56:33 -0000

* Port wl12xx-firmware recipe from arago. This recipe was originally
  named linux-firmware in arago.
* Wl12xx-firmware provides the firmware files for use with the TI
  Wi-Fi + Bluetooth module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb

diff --git a/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb b/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
new file mode 100644
index 0000000..3fa9dbb
--- /dev/null
+++ b/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Firmware files for use with TI wl12xx"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=ba590e1d103f891d0151609046aef9e8"
+
+PACKAGE_ARCH = "all"
+
+PR = "r0+gitr${SRCREV}"
+
+# This recipe provides the latest firmware files for wl12xx.
+# Therefore, use the contents of this recipe instead of the contents
+# of linux-firmware-wl12xx.
+RCONFLICTS_${PN} = "linux-firmware-wl12xx"
+RREPLACES_${PN}  = "linux-firmware-wl12xx"
+
+SRCREV = "38e0dd7999b9087e00d1a59306a7c22fd23246cf"
+SRC_URI = "git://github.com/TI-ECS/ti-utils.git;protocol=git"
+
+S = "${WORKDIR}/git/hw/firmware"
+
+do_compile() {
+	:
+}
+
+do_install() {
+	oe_runmake 'DEST_DIR=${D}' install
+}
+
+FILES_${PN} = "/lib/firmware/ti-connectivity/*"
-- 
1.7.0.4



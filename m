Return-Path: <hzhang@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 4A29BE00312
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 11:49:04 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1QJn3Hx010567
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 13:49:03 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1QJn3DF026128
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 13:49:03 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 26 Feb 2013 13:49:02 -0600
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r1QJn2dR000957;	Tue, 26 Feb 2013 13:49:02 -0600
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1UAQWM-0007D5-Dj; Tue, 26 Feb 2013
	14:49:02 -0500
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 26 Feb 2013 14:48:50 -0500
Message-ID: <1361908130-27683-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] keystone-evm config: add ubifs support
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
X-List-Received-Date: Tue, 26 Feb 2013 19:49:04 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

---
 conf/machine/keystone-evm.conf |   19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
index e73d84b..3e44ddc 100644
--- a/conf/machine/keystone-evm.conf
+++ b/conf/machine/keystone-evm.conf
@@ -14,7 +14,7 @@ require conf/machine/include/keystone.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
 
-IMAGE_FSTYPES += "tar.bz2 cpio"
+IMAGE_FSTYPES += "ubi tar.bz2 cpio"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
@@ -23,3 +23,20 @@ SYSVINIT_ENABLED_GETTYS = ""
 UBOOT_MACHINE = "tci6638_evm_config"
 
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
+# do ubiattach /dev/ubi_ctrl -m 4
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 857 LEBs
+# MKUBIFS_ARGS = "-m 2048 -e 129024 -c 857"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 857"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              2048
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 2048 -O 2048"
+
+
-- 
1.7.9.5



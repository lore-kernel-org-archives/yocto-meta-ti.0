Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 130BCE00726; Mon, 20 Mar 2017 11:38:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1A96E00349
	for <meta-ti@yoctoproject.org>; Mon, 20 Mar 2017 11:38:22 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F0C22208DA;
	Mon, 20 Mar 2017 18:38:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9SCxiIkqDaru; Mon, 20 Mar 2017 18:38:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A8A5520B64;
	Mon, 20 Mar 2017 18:38:19 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3AA53162415;
	Mon, 20 Mar 2017 14:38:19 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 20 Mar 2017 14:38:05 -0400
Message-Id: <1490035085-42076-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490035085-42076-1-git-send-email-denys@ti.com>
References: <1490035085-42076-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 4/4] beagle-x15: add separate config for BeagleBoard X15
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
X-List-Received-Date: Mon, 20 Mar 2017 18:38:26 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/beagle-x15.conf | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 conf/machine/beagle-x15.conf

diff --git a/conf/machine/beagle-x15.conf b/conf/machine/beagle-x15.conf
new file mode 100644
index 0000000..276de26
--- /dev/null
+++ b/conf/machine/beagle-x15.conf
@@ -0,0 +1,34 @@
+#@TYPE: Machine
+#@NAME: BeagleBoard X15
+#@DESCRIPTION: Machine configuration for the BeagleBoard X15
+
+require conf/machine/include/dra7xx.inc
+
+IMAGE_FSTYPES += "tar.xz"
+
+SERIAL_CONSOLE = "115200 ttyS2"
+
+KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb"
+
+UBOOT_MACHINE = "beagle_x15_config"
+
+# UBI information.  Note that this is board and kernel specific.  Changes
+# in your kernel port may require changes in these variables.  For more
+# details about this board please see
+# http://processors.wiki.ti.com/index.php/UBIFS_Support
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 1988 LEBs
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 8192"
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+# UBI: VID header offset:          2048 (aligned 2048)
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
-- 
2.7.4



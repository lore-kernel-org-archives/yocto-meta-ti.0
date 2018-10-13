Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3D6FE00B9F; Fri, 12 Oct 2018 19:59:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 550 seconds by postgrey-1.32 at yocto-www;
	Fri, 12 Oct 2018 19:59:49 PDT
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFD88E00B92
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 19:59:49 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2B11920C9F;
	Sat, 13 Oct 2018 02:50:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ixPxLajSYebN; Sat, 13 Oct 2018 02:50:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0ECF820C8F;
	Sat, 13 Oct 2018 02:50:38 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id BDB9E1646D7;
	Fri, 12 Oct 2018 22:50:37 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Oct 2018 22:50:36 -0400
Message-Id: <1539399036-6199-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] beaglebone.conf: temporarily use generic am335x_evm_config for U-boot
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
X-List-Received-Date: Sat, 13 Oct 2018 02:59:53 -0000

There have been reports recently that am335x_beaglebone_config generates bad SPL.
Until that is debugged and fixed, use generic am335x_evm_config that covers all
AM335x platforms, including BeagleBone variants.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/beaglebone.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 49edfd6..2514792 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -13,7 +13,8 @@ MACHINE_GUI_CLASS = "bigscreen"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
-UBOOT_MACHINE = "am335x_boneblack_config"
+# fall back on generic am335x_evm_config for now
+#UBOOT_MACHINE = "am335x_boneblack_config"
 
 WKS_FILE = "sdimage-bootpart.wks"
 IMAGE_BOOT_FILES = "MLO u-boot.img"
-- 
2.7.4



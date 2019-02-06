Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3DCDE00C45; Wed,  6 Feb 2019 08:42:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1156E00C1E
	for <meta-ti@yoctoproject.org>; Wed,  6 Feb 2019 08:42:11 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 77C3340B37;
	Wed,  6 Feb 2019 16:42:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1JbV-l0gG5Ko; Wed,  6 Feb 2019 16:42:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6346740B57;
	Wed,  6 Feb 2019 16:42:10 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 7E39816A8FF;
	Wed,  6 Feb 2019 11:42:08 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed,  6 Feb 2019 11:42:04 -0500
Message-Id: <1549471325-47513-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549471325-47513-1-git-send-email-denys@ti.com>
References: <1549471325-47513-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 3/4] dra7xx-evm.conf: not all DTBs are ready yet
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
X-List-Received-Date: Wed, 06 Feb 2019 16:42:13 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/dra7xx-evm.conf | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index f8df957..adfdcdf 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -10,11 +10,12 @@ IMAGE_FSTYPES += "tar.xz"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
-KERNEL_DEVICETREE = "dra7-evm.dtb dra7-evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb \
-                    dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
-                    dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb \
-                    dra71-evm.dtb dra71-evm-nand.dtb dra71-evm-lcd-auo-g101evn01.0.dtb dra71-lcard.dtb \
-                    dra76-evm.dtb dra76-evm-tfp410.dtb"
+KERNEL_DEVICETREE = " \
+    dra7-evm.dtb \
+    dra71-evm.dtb \
+    dra72-evm.dtb dra72-evm-revc.dtb \
+    dra76-evm.dtb \
+"
 
 UBOOT_MACHINE = "dra7xx_evm_config"
 
-- 
2.7.4



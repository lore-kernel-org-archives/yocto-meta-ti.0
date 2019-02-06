Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64966E00C45; Wed,  6 Feb 2019 08:42:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE74FE00BFB
	for <meta-ti@yoctoproject.org>; Wed,  6 Feb 2019 08:42:11 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 27A3F40BA8;
	Wed,  6 Feb 2019 16:42:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SKWboBNxNkFH; Wed,  6 Feb 2019 16:42:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 04D8740B53;
	Wed,  6 Feb 2019 16:42:09 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 71B3516A8FE;
	Wed,  6 Feb 2019 11:42:08 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed,  6 Feb 2019 11:42:03 -0500
Message-Id: <1549471325-47513-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549471325-47513-1-git-send-email-denys@ti.com>
References: <1549471325-47513-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/4] am65xx-evm.conf: some DTBs are not ready yet
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
X-List-Received-Date: Wed, 06 Feb 2019 16:42:12 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 87f42ae..a3fbbc0 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -12,9 +12,9 @@ SERIAL_CONSOLES = "115200;ttyS2"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb \
+    ti/k3-am654-gp.dtbo \
     ti/k3-am654-evm-csi2-ov490.dtbo ti/k3-am654-evm-oldi-lcd1evm.dtbo \
-    ti/k3-am654-evm-tc358876.dtbo ti/k3-am654-gp.dtbo ti/k3-am654-idk.dtbo \
-    ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo"
+"
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
 
-- 
2.7.4



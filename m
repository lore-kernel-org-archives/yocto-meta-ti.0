Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 053B7E00CE5; Mon,  4 Mar 2019 13:04:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE784E006D8
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2019 13:04:36 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1BB0E40B66;
	Mon,  4 Mar 2019 21:04:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LMTqikGEMTCd; Mon,  4 Mar 2019 21:04:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DFD0340A58;
	Mon,  4 Mar 2019 21:04:34 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 16E5616BC9A;
	Mon,  4 Mar 2019 16:04:34 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon,  4 Mar 2019 16:04:33 -0500
Message-Id: <1551733473-9969-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] dra65xx-evm.conf: fix typo introduced by previous commit
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
X-List-Received-Date: Mon, 04 Mar 2019 21:04:38 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 4689812..6dbb2fe 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -14,7 +14,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb ti/k3-am654-gp.dtbo ti/k3-am654-idk.dtbo \
     ti/k3-am654-evm-csi2-ov490.dtbo ti/k3-am654-evm-oldi-lcd1evm.dtbo \
     ti/k3-am654-evm-tc358876.dtbo \
-    ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo"
+    ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo \
 "
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
-- 
2.7.4



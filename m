Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB7FAE00BBF; Mon, 29 Oct 2018 09:30:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9141E00BBF
	for <meta-ti@yoctoproject.org>; Mon, 29 Oct 2018 09:30:03 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F220920B23;
	Mon, 29 Oct 2018 16:30:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id CAU_xmOXN2Pe; Mon, 29 Oct 2018 16:30:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C6EC920A3F;
	Mon, 29 Oct 2018 16:30:01 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3B9E51639B3;
	Mon, 29 Oct 2018 12:30:01 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 29 Oct 2018 12:30:00 -0400
Message-Id: <1540830600-26401-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] am65xx-evm: add k3-am654-evm-tc358876 DTBO
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
X-List-Received-Date: Mon, 29 Oct 2018 16:30:10 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 4bf8993..6b4443d 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -13,7 +13,7 @@ SERIAL_CONSOLE = "115200 ttyS2"
 KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb \
     ti/k3-am654-evm-csi2-ov490.dtbo ti/k3-am654-evm-oldi-lcd1evm.dtbo \
-    ti/k3-am654-gp.dtbo ti/k3-am654-idk.dtbo \
+    ti/k3-am654-evm-tc358876.dtbo ti/k3-am654-gp.dtbo ti/k3-am654-idk.dtbo \
     ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo"
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
-- 
2.7.4



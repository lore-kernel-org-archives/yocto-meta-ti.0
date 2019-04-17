Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37629E00D3F; Tue, 16 Apr 2019 18:40:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB9C6E00CBC
	for <meta-ti@yoctoproject.org>; Tue, 16 Apr 2019 18:40:55 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B8EA840A2D;
	Wed, 17 Apr 2019 01:40:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Dvxl28D96YR8; Wed, 17 Apr 2019 01:40:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9DB0540BC2;
	Wed, 17 Apr 2019 01:40:53 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1A26A16E38E;
	Tue, 16 Apr 2019 21:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Tue, 16 Apr 2019 21:40:51 -0400
Message-Id: <1555465251-49024-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555465251-49024-1-git-send-email-denys@ti.com>
References: <1555465251-49024-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 3/3] am65xx-evm: add additional DTBOs
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
X-List-Received-Date: Wed, 17 Apr 2019 01:40:57 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 6dbb2fe..87fced8 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -11,9 +11,10 @@ IMAGE_FSTYPES += "tar.xz wic.xz"
 SERIAL_CONSOLES = "115200;ttyS2"
 
 KERNEL_DEVICETREE = " \
-    ti/k3-am654-base-board.dtb ti/k3-am654-gp.dtbo ti/k3-am654-idk.dtbo \
-    ti/k3-am654-evm-csi2-ov490.dtbo ti/k3-am654-evm-oldi-lcd1evm.dtbo \
-    ti/k3-am654-evm-tc358876.dtbo \
+    ti/k3-am654-base-board.dtb ti/k3-am654-gp.dtbo \
+    ti/k3-am654-evm-hdmi.dtbo ti/k3-am654-idk.dtbo \
+    ti/k3-am654-evm-csi2-ov490.dtbo ti/k3-am654-evm-csi2-ov5640.dtbo \
+    ti/k3-am654-evm-oldi-lcd1evm.dtbo ti/k3-am654-evm-tc358876.dtbo \
     ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo \
 "
 
-- 
2.7.4



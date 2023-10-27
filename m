Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A887C25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 15:28:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.9770.1698420530630848096
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 08:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RsscCH48;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-luthra@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39RFSnIM108951;
	Fri, 27 Oct 2023 10:28:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698420529;
	bh=WQygb2cAP2ZYIdRWDSo9SUJxFTAwN+22FL3a86vDETY=;
	h=From:To:CC:Subject:Date;
	b=RsscCH48ppU5oROJ7wzHjYjRby91oz0CB9NbItd/wOkI5qXrF+tX2+Sj+NkZjxgWN
	 1/nC2joOR/xLpt4g6m0Q5rqlyK2MxGE/rcoyo5dmJXnFwH7V2zYL5QT2kTwY5GRvX3
	 RBRhk5or5V+DywvVL8uPc6lwz+dnybihelfSh1ek=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39RFSnBj129198
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Oct 2023 10:28:49 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Oct 2023 10:28:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Oct 2023 10:28:48 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39RFSmgZ037773;
	Fri, 27 Oct 2023 10:28:48 -0500
From: Jai Luthra <j-luthra@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        Devarsh Thakkar
	<devarsht@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
        Praneeth
	<praneeth@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: [master/kirkstone][PATCH] conf: machine: am62*: Pick common overlays by prefix
Date: Fri, 27 Oct 2023 20:58:36 +0530
Message-ID: <20231027152836.2985618-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3447; i=j-luthra@ti.com; h=from:subject; bh=vGX10fYBUJucFwN3UrDIaWzhv5lhOYiodORBWQjk0E4=; b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBlO9ai81h0MFElxV7f66NYdV/rvhnkcUaCEHM6f Pm3lHrRFwaJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZTvWogAKCRBD3pH5JJpx RTt6D/sEu4Lbkd9OwBz03nM8dxQK7mVftAJvchqPwV8PvZ/Q0jAs28gUEe7csEfvrhZp8NVr9mg XgtT6E0fe4Y48e5/c4IdfFVOkCUqE3VAkMEYpEIaC7o+JoOl49RniEqs7ayk5p8e3sE1rKOjPZw A7/FObGnBvPoDk8u9C2+al2mY7Kf4qqsKLgErJyiX63YImQG/isSnfoRSH/4BbMhvZBV4gQHpvT WayMQeswdqOB1z8V5rSZ1UwQqU1WAhJOJeBPqJZQ8nZ2+BacTc0EZ6czrm6ab5q8Yr5+VL8PpNf 3LdgeLeDqHtM3iChj5juclz0tEe4hqOjaVFc1Id8i8VzUkhEBzRtQE0FYNJRUQHQBnfNCwlnF34 EZ5Yj7B6yx4FIJZ5r9EQ/fZ9IqQiyPD72dVzdJV5r6HwPqYlf8EBc75+L3xaPHZy9U0PfCEuC8X MaVZTeFxNDm9M8bsVhD3RBJl0W73OEKjOOQjQI5v5hlJ2ATdHq0sAXiH6YEcCHekUhPq4ebR2j7 1uSY+KyPUYfCcCnzpgL3QxvjnvHR16TXDyr37AkXLqzy59FFUmzeFLF8Rl4pbaAOZhEHRPQmOxy uGouYWfF+2slpotReop/7fTV7brML/l18VdzXqnnKHe52qd32OO0OTxJI17bWrAeVP2wlns/+Eu DYcK4fiEfePuYwA!
 ==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp; fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Oct 2023 15:28:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17209

SK boards of AM62 SoC family share peripheral expansions for camera
and audio-over-HDMI.

The HDMI bridge is common across all SK-AM62* boards. The CSI2 FFC
camera connector is common across all except SK-AM62-LP which only has a
B2B Samtec connector.

As the kernel now uses the same prefix "k3-am62x-sk-" for the devicetree
overlays for these peripherals, make sure we pick them by prefix for
applicable boards.

Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=b50ccab9e07c
Link: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=0432df3d2ae7
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm.conf   | 2 ++
 meta-ti-bsp/conf/machine/am62pxx-evm.conf   | 6 +++++-
 meta-ti-bsp/conf/machine/am62xx-evm.conf    | 6 +++++-
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf | 6 +++++-
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
index d5d60718..ef60e9d1 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -6,6 +6,8 @@ require conf/machine/include/am62axx.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62a7 \
+    ti/k3-am62x-sk-csi2 \
+    ti/k3-am62x-sk-hdmi \
     ti/k3-fpdlink \
 "
 
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index c0c62592..931de953 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -4,7 +4,11 @@
 
 require conf/machine/include/am62pxx.inc
 
-KERNEL_DEVICETREE_PREFIX = "ti/k3-am62p5"
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-am62p5 \
+    ti/k3-am62x-sk-csi2 \
+    ti/k3-am62x-sk-hdmi \
+"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am62p5-sk.dtb \
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index 082a1ae7..b60ba156 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -5,7 +5,11 @@
 require conf/machine/include/am62xx.inc
 require conf/machine/include/ti-extras.inc
 
-KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-am625 \
+    ti/k3-am62x-sk-csi2 \
+    ti/k3-am62x-sk-hdmi \
+"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 5c235c29..0d2f89ca 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -7,6 +7,7 @@ require conf/machine/include/am62xx.inc
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62-lp \
     ti/k3-am625-sk \
+    ti/k3-am62x-sk-hdmi \
 "
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index dc4f3b77..b3bda44a 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -4,7 +4,11 @@
 
 require conf/machine/include/am62xx.inc
 
-KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-am625 \
+    ti/k3-am62x-sk-csi2 \
+    ti/k3-am62x-sk-hdmi \
+"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
-- 
2.42.0



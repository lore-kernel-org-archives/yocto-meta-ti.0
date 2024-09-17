Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1F4C3ABD8
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 05:57:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.14808.1726552618857895835
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Sep 2024 22:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Nipur81g;
 spf=pass (domain: list.ti.com, ip: 198.47.19.142, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48H5uupT092866;
	Tue, 17 Sep 2024 00:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726552616; i=@ti.com;
	bh=SxFvLbhcAjW70DivppMt2FQl21ui2hCZHCLN+2m5rLo=;
	h=From:To:Subject:Date;
	b=Nipur81g2dakwhUObwuJ9jfvYzYNPx0KQGu5BUj3aZ978ORIUP+JahkAYfp1VetRy
	 CTPNV3Xg4PNbD9tiwitFBObtXBdVtaoxZ45SADDWibF6Eu5J7fxxWIRrkAOKo5Hz/B
	 3l+F+E1ZVoDHa7peLDv5X5LKYpiGH3FRNLdK8Urk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48H5uuiH052590
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Sep 2024 00:56:56 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Sep 2024 00:56:56 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Sep 2024 00:56:56 -0500
Received: from fllvdckhpci035.itg.ti.com (fllvdckhpci035.itg.ti.com [10.248.132.247])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48H5uutI046556;
	Tue, 17 Sep 2024 00:56:56 -0500
Received: by fllvdckhpci035.itg.ti.com (Postfix, from userid 60899)
	id 986601112994; Tue, 17 Sep 2024 00:56:56 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] linux-ti-mainline: Update to version: v6.11
Date: Tue, 17 Sep 2024 00:56:56 -0500
Message-ID: <1726552616-19909-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Sep 2024 05:57:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17967

Updated the value(s) for:
  am57xx-evm: KERNEL_DEVICETREE
  am62axx-evm: KERNEL_DEVICETREE
  am62pxx-evm: KERNEL_DEVICETREE
  am62xx-evm: KERNEL_DEVICETREE
  am62xx-lp-evm: KERNEL_DEVICETREE
  am68-sk: KERNEL_DEVICETREE
  am69-sk: KERNEL_DEVICETREE
  beagleplay: KERNEL_DEVICETREE
  am64xx-evm: KERNEL_DEVICETREE
  am65xx-evm: KERNEL_DEVICETREE
  am335x-evm: KERNEL_DEVICETREE
  am437x-evm: KERNEL_DEVICETREE
  j7200-evm: KERNEL_DEVICETREE
  j721e-evm: KERNEL_DEVICETREE
  j721e-sk: KERNEL_DEVICETREE
  j721s2-evm: KERNEL_DEVICETREE
  j722s-evm: KERNEL_DEVICETREE
  j784s4-evm: KERNEL_DEVICETREE
  linux-ti-mainline: PV,SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm.conf                 | 1 +
 meta-ti-bsp/conf/machine/am62xx-evm.conf                  | 1 +
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf               | 1 +
 meta-ti-bsp/conf/machine/beagleplay.conf                  | 1 +
 meta-ti-bsp/conf/machine/include/am64xx.inc               | 3 +++
 meta-ti-bsp/conf/machine/j721e-evm.conf                   | 1 +
 meta-ti-bsp/conf/machine/j784s4-evm.conf                  | 3 +++
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 6 +++---
 8 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
index 4828c9d..a5d4185 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -12,6 +12,7 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
+    ti/k3-am62a7-phyboard-lyra-rdk.dtb \
     ti/k3-am62a7-sk.dtb \
     ti/k3-am62x-sk-csi2-imx219.dtbo \
     ti/k3-am62x-sk-csi2-ov5640.dtbo \
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index 31de4a1..bf2b4a6 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -14,6 +14,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
     ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
     ti/k3-am625-beagleplay.dtb \
+    ti/k3-am625-phyboard-lyra-1-4-ghz-opp.dtbo \
     ti/k3-am625-phyboard-lyra-rdk.dtb \
     ti/k3-am625-sk.dtb \
     ti/k3-am625-verdin-nonwifi-dahlia.dtb \
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index e9271f5..9ff95ad 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -14,6 +14,7 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
+    ti/k3-am62-lp-sk-nand.dtbo \
     ti/k3-am62-lp-sk.dtb \
     ti/k3-am625-sk.dtb \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
index c5ce390..578cb09 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -38,6 +38,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
     ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
     ti/k3-am625-beagleplay.dtb \
+    ti/k3-am625-phyboard-lyra-1-4-ghz-opp.dtbo \
     ti/k3-am625-phyboard-lyra-rdk.dtb \
     ti/k3-am625-sk.dtb \
     ti/k3-am625-verdin-nonwifi-dahlia.dtb \
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 7f38895..49e996c 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -6,12 +6,15 @@ SOC_FAMILY:append = ":am64xx"
 KERNEL_DEVICETREE_PREFIX = "ti/k3-am642"
 
 KERNEL_DEVICETREE = " \
+    ti/k3-am642-evm-icssg1-dualemac-mii.dtbo \
     ti/k3-am642-evm-icssg1-dualemac.dtbo \
+    ti/k3-am642-evm-nand.dtbo \
     ti/k3-am642-evm.dtb \
     ti/k3-am642-hummingboard-t-pcie.dtbo \
     ti/k3-am642-hummingboard-t-usb3.dtbo \
     ti/k3-am642-hummingboard-t.dtb \
     ti/k3-am642-phyboard-electra-gpio-fan.dtbo \
+    ti/k3-am642-phyboard-electra-pcie-usb2.dtbo \
     ti/k3-am642-phyboard-electra-rdk.dtb \
     ti/k3-am642-sk.dtb \
     ti/k3-am642-tqma64xxl-mbax4xxl.dtb \
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index 92144d3..b0b2a5b 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -12,6 +12,7 @@ KERNEL_DEVICETREE_PREFIX = " \
 
 KERNEL_DEVICETREE = " \
     ti/k3-j721e-beagleboneai64.dtb \
+    ti/k3-j721e-common-proc-board-infotainment.dtbo \
     ti/k3-j721e-common-proc-board.dtb \
     ti/k3-j721e-evm-gesi-exp-board.dtbo \
     ti/k3-j721e-evm-pcie0-ep.dtbo \
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 8858a91..e1443ef 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -19,6 +19,9 @@ KERNEL_DEVICETREE_PREFIX = " \
 
 KERNEL_DEVICETREE = " \
     ti/k3-am69-sk.dtb \
+    ti/k3-j784s4-evm-pcie0-pcie1-ep.dtbo \
+    ti/k3-j784s4-evm-quad-port-eth-exp1.dtbo \
+    ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtbo \
     ti/k3-j784s4-evm.dtb \
 "
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index ffeaa2e..a9048f1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -13,9 +13,9 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
 
 S = "${WORKDIR}/git"
 
-# 6.10 Mainline version
-SRCREV = "d04e483db22823c13c0313b7c43a52529a2e2672"
-PV = "6.10"
+# 6.11 Mainline version
+SRCREV = "fa7818b3a6dd56c7956f515d287ed9f80c7bf59a"
+PV = "6.11"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=https;branch=master"
 
-- 
1.8.3.1



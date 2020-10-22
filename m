Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1648.1603393703509815872
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Oct 2020 12:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C6A2740C35;
	Thu, 22 Oct 2020 19:08:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SViqxhyFILO2; Thu, 22 Oct 2020 19:08:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ABD3340B2D;
	Thu, 22 Oct 2020 19:08:21 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 66CA71744AF;
	Thu, 22 Oct 2020 15:08:21 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] conf/machine: extend SR2.0 support from AM65 GP to AM65 HS platform
Date: Thu, 22 Oct 2020 15:08:19 -0400
Message-Id: <1603393699-49549-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf                                        | 6 ------
 .../{am65xx-evm-k3r5-sr2.conf => am65xx-hs-evm-k3r5-sr2.conf}       | 6 +++---
 conf/machine/am65xx-hs-evm-k3r5.conf                                | 1 +
 conf/machine/include/am65xx.inc                                     | 6 ++++++
 4 files changed, 10 insertions(+), 9 deletions(-)
 copy conf/machine/{am65xx-evm-k3r5-sr2.conf => am65xx-hs-evm-k3r5-sr2.conf} (52%)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 2f3b92a..8b6ef54 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -4,10 +4,4 @@
 
 require conf/machine/include/am65xx.inc
 
-BBMULTICONFIG += "k3r5-sr2"
-
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
-
-IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
-do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
diff --git a/conf/machine/am65xx-evm-k3r5-sr2.conf b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
similarity index 52%
copy from conf/machine/am65xx-evm-k3r5-sr2.conf
copy to conf/machine/am65xx-hs-evm-k3r5-sr2.conf
index c0b3cd5..ef1b6fb 100644
--- a/conf/machine/am65xx-evm-k3r5-sr2.conf
+++ b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
@@ -1,10 +1,10 @@
 #@TYPE: Machine
-#@NAME: AM65xx SR2.0 EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM65xx SR2.0 EVM (R5F core)
+#@NAME: AM65xx SR2.0 HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM65xx SR2.0 HS EVM (R5F core)
 
 # Booting SR2 requires different SYSFW, the rest is handled at runtime
 
-require conf/machine/am65xx-evm-k3r5.conf
+require conf/machine/am65xx-hs-evm-k3r5.conf
 SOC_FAMILY_append = ":k3r5-sr2"
 
 SYSFW_SOC = "am65x_sr2"
diff --git a/conf/machine/am65xx-hs-evm-k3r5.conf b/conf/machine/am65xx-hs-evm-k3r5.conf
index 2b06f2c..d6d4b1e 100644
--- a/conf/machine/am65xx-hs-evm-k3r5.conf
+++ b/conf/machine/am65xx-hs-evm-k3r5.conf
@@ -7,6 +7,7 @@ require conf/machine/include/k3r5.inc
 SYSFW_SOC = "am65x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
+SYSFW_SYMLINK = ""
 
 UBOOT_MACHINE = "am65x_hs_evm_r5_defconfig"
 
diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index 67cfabe..684fea4 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -21,6 +21,12 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-evm-prupwm.dtbo \
 "
 
+BBMULTICONFIG += "k3r5-sr2"
+
+IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
+do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
+
 OPTEEMACHINE = "k3-am65x"
 OPTEEOUTPUTMACHINE = "k3"
 
-- 
2.7.4


Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1161.1602274315599966144
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Oct 2020 13:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BF05740C1C;
	Fri,  9 Oct 2020 20:11:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agP9Ac66dOSr; Fri,  9 Oct 2020 20:11:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A387F40951;
	Fri,  9 Oct 2020 20:11:52 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 64B53174480;
	Fri,  9 Oct 2020 16:11:52 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 1/3] conf/machine: pass OPTEEFLAVOR via OPTEEMACHINE as <mach>-<flavor>
Date: Fri,  9 Oct 2020 16:11:48 -0400
Message-Id: <1602274310-28284-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Recipe in meta-arm doesn't use OPTEEFLAVOR, but optee-os Makefile can extract
it from OPTEEMACHINE.
Keep OPTEEFLAVOR for legacy platforms - used for HS signing in the output name.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am437x-hs-evm.conf | 2 +-
 conf/machine/am57xx-hs-evm.conf | 2 +-
 conf/machine/dra7xx-hs-evm.conf | 2 +-
 conf/machine/include/am65xx.inc | 3 +--
 conf/machine/include/j7.inc     | 3 +--
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/conf/machine/am437x-hs-evm.conf b/conf/machine/am437x-hs-evm.conf
index 34c1016..0a8ca06 100644
--- a/conf/machine/am437x-hs-evm.conf
+++ b/conf/machine/am437x-hs-evm.conf
@@ -13,6 +13,6 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am4x"
 
-OPTEEMACHINE = "ti"
+OPTEEMACHINE = "ti-am43xx"
 OPTEEFLAVOR = "am43xx"
 OPTEEOUTPUTMACHINE = "ti"
diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
index 4d3eb00..d4f6e09 100644
--- a/conf/machine/am57xx-hs-evm.conf
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -13,7 +13,7 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
 
-OPTEEMACHINE = "ti"
+OPTEEMACHINE = "ti-am57xx"
 OPTEEFLAVOR = "am57xx"
 OPTEEOUTPUTMACHINE = "ti"
 OPTEEPAGER = "y"
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index 9b02985..da4000f 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -13,7 +13,7 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
 
-OPTEEMACHINE = "ti"
+OPTEEMACHINE = "ti-dra7xx"
 OPTEEFLAVOR = "dra7xx"
 OPTEEOUTPUTMACHINE = "ti"
 OPTEEPAGER = "y"
diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index 1acb205..67cfabe 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -21,8 +21,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-evm-prupwm.dtbo \
 "
 
-OPTEEMACHINE = "k3"
-OPTEEFLAVOR = "am65x"
+OPTEEMACHINE = "k3-am65x"
 OPTEEOUTPUTMACHINE = "k3"
 
 # Set the list of device targets for ti-pdk class recipes
diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
index f6d9161..7d326f4 100644
--- a/conf/machine/include/j7.inc
+++ b/conf/machine/include/j7.inc
@@ -1,8 +1,7 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY_append = ":j7"
 
-OPTEEMACHINE = "k3"
-OPTEEFLAVOR = "j7"
+OPTEEMACHINE = "k3-j7"
 OPTEEOUTPUTMACHINE = "k3"
 
 # Set the list of device targets for ti-pdk class recipes
-- 
2.7.4


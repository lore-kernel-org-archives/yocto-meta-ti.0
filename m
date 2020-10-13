Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.4961.1602620617941964263
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 13:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5DADE40BD0;
	Tue, 13 Oct 2020 20:23:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVfcSBhl04lr; Tue, 13 Oct 2020 20:23:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 454CE40B66;
	Tue, 13 Oct 2020 20:23:36 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6E73A17427C;
	Tue, 13 Oct 2020 16:23:35 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] ti-sci-fw: now Cortex-R5 SPL can also be provided by u-boot-ti-mainline
Date: Tue, 13 Oct 2020 16:23:34 -0400
Message-Id: <1602620614-54942-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/k3r5.inc          | 1 +
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/machine/include/k3r5.inc b/conf/machine/include/k3r5.inc
index 52fcf38..a32acca 100644
--- a/conf/machine/include/k3r5.inc
+++ b/conf/machine/include/k3r5.inc
@@ -21,3 +21,4 @@ UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
 
 PACKAGECONFIG_pn-u-boot-ti-staging = ""
+PACKAGECONFIG_pn-u-boot-ti-mainline = ""
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 458b892..1239b27 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,7 +1,7 @@
 require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
-DEPENDS_append_j7200-evm-k3r5 = " u-boot-ti-staging"
+DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
 
 CLEANBROKEN = "1"
 PR = "r1"
-- 
2.7.4


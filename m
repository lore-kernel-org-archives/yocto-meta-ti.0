Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.84.1617232095165600531
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 16:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8D3CE40C3A;
	Wed, 31 Mar 2021 23:08:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6pN3asFEJPo; Wed, 31 Mar 2021 23:08:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7381440A46;
	Wed, 31 Mar 2021 23:08:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DBF4B174566;
	Wed, 31 Mar 2021 19:08:12 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH] conf/machine: am64*,j7200: cleanup k3r5 configs
Date: Wed, 31 Mar 2021 19:08:12 -0400
Message-Id: <1617232092-43825-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

Remove duplicate machine-specific redefines of UBOOT_BINARY, UBOOT_IMAGE and
UBOOT_SYMLINK variables, as they are already defined with same values in the
common k3r5.inc file.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/am64xx-evm-k3r5.conf | 3 ---
 conf/machine/am64xx-sk-k3r5.conf  | 3 ---
 conf/machine/j7200-evm-k3r5.conf  | 3 ---
 3 files changed, 9 deletions(-)

diff --git a/conf/machine/am64xx-evm-k3r5.conf b/conf/machine/am64xx-evm-k3r5.conf
index dfeaeb5..afd36b7 100644
--- a/conf/machine/am64xx-evm-k3r5.conf
+++ b/conf/machine/am64xx-evm-k3r5.conf
@@ -9,6 +9,3 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
 UBOOT_MACHINE = "am64x_evm_r5_defconfig"
-UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
diff --git a/conf/machine/am64xx-sk-k3r5.conf b/conf/machine/am64xx-sk-k3r5.conf
index 1256db7..07ca590 100644
--- a/conf/machine/am64xx-sk-k3r5.conf
+++ b/conf/machine/am64xx-sk-k3r5.conf
@@ -9,6 +9,3 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
 UBOOT_MACHINE = "am64x_sk_r5_defconfig"
-UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
diff --git a/conf/machine/j7200-evm-k3r5.conf b/conf/machine/j7200-evm-k3r5.conf
index a889481..6806188 100644
--- a/conf/machine/j7200-evm-k3r5.conf
+++ b/conf/machine/j7200-evm-k3r5.conf
@@ -9,6 +9,3 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
 UBOOT_MACHINE = "j7200_evm_r5_defconfig"
-UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
-- 
2.7.4


Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2746.1586205429964032915
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 13:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3723040C35;
	Mon,  6 Apr 2020 20:37:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTgEKIq35ZU4; Mon,  6 Apr 2020 20:37:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0BF3640BA3;
	Mon,  6 Apr 2020 20:37:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A63181718F5;
	Mon,  6 Apr 2020 16:37:07 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 2/8] ipumm: require mmip machine feature, cleanup
Date: Mon,  6 Apr 2020 16:36:59 -0400
Message-Id: <1586205425-55562-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586205425-55562-1-git-send-email-denis@denix.org>
References: <1586205425-55562-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 2ef2101..4f6ae89 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -1,19 +1,15 @@
-python __anonymous() {
-    features = d.getVar("MACHINE_FEATURES")
-    if not features:
-        return
-    if "mmip" not in features:
-        raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
-}
-
-DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
+SUMMARY = "Firmware for IPU to suppor Accelerated MM decode and encode"
 LICENSE = "TI-TSPA"
 
 LIC_FILES_CHKSUM = "file://Texas_Instruments_ipumm_Manifest.pdf;md5=5cc572579f07af266ab57fc17d762c7f"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
-RDEPENDS_${PN} = " libdce"
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "mmip"
+
+RDEPENDS_${PN} = "libdce"
 
 SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
-- 
2.7.4


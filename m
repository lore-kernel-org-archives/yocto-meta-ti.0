Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3665.1580246334205770882
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jan 2020 13:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16B61E01602; Tue, 28 Jan 2020 13:18:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
X-Greylist: delayed 593 seconds by postgrey-1.32 at yocto-www; Tue, 28 Jan 2020 13:18:52 PST
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77C64E015FA
	for <meta-ti@yoctoproject.org>; Tue, 28 Jan 2020 13:18:52 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4AE0C40BCC;
	Tue, 28 Jan 2020 21:08:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVUVsjpP0-S3; Tue, 28 Jan 2020 21:08:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 34449409E7;
	Tue, 28 Jan 2020 21:08:58 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 87EFF1743C1;
	Tue, 28 Jan 2020 16:08:57 -0500 (EST)
From: "Denys Dmytriyenko" <denys@ti.com>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [thud/master][PATCH] cpsw9g-eth-fw: update to 6.2 to work with latest SYSFW 2019.12 APIs
Date: Tue, 28 Jan 2020 16:08:57 -0500
Message-Id: <1580245737-25191-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index ab34e66..cbd71f2 100644
--- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "R5 PSDK CPSW9G Ethernet Switch Firmware"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=04ad0a015d4bb63c2b9e7b112debf3db"
 
-PV = "1.0+git${SRCPV}"
+PV = "6.2+git${SRCPV}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit deploy
@@ -11,7 +11,7 @@ inherit update-alternatives
 
 PROTOCOL = "git"
 BRANCH = "master"
-SRCREV = "792c06d9a0f2b9d4b150bce4651bdaae2413b28d"
+SRCREV = "4da71504488450f34d65459c1de949da1f984471"
 
 SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
-- 
2.7.4


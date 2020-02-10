Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.1241.1581372785877565785
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 14:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5AB80E0171F; Mon, 10 Feb 2020 14:13:05 -0800 (PST)
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
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BFE8E0171C
	for <meta-ti@yoctoproject.org>; Mon, 10 Feb 2020 14:13:03 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0E5CB40C1F;
	Mon, 10 Feb 2020 22:13:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gf4JnpByx-Ne; Mon, 10 Feb 2020 22:13:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DBCAF40C1C;
	Mon, 10 Feb 2020 22:13:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 925181743F3;
	Mon, 10 Feb 2020 17:13:01 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus][PATCH] u-boot-ti: switch to Python3
Date: Mon, 10 Feb 2020 17:13:00 -0500
Message-Id: <1581372780-27175-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index f1187e6..68d76a0 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -15,6 +15,8 @@ SPL_BINARY ?= "MLO"
 
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
 
+inherit python3native
+
 FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot:"
 
 SUMMARY = "u-boot bootloader for TI devices"
@@ -31,6 +33,7 @@ PV_append = "+git${SRCPV}"
 
 # u-boot needs devtree compiler to parse dts files
 DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native"
+DEPENDS_remove = "python-native"
 
 PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/boot/bl31.bin,,arm-trusted-firmware"
 PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}/boot/bl32.bin,,optee-os"
-- 
2.7.4


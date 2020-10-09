Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1160.1602274315204573200
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Oct 2020 13:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF80240C06;
	Fri,  9 Oct 2020 20:11:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIhCT4Sej0Eo; Fri,  9 Oct 2020 20:11:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BB06A40C0D;
	Fri,  9 Oct 2020 20:11:52 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7F7B817448F;
	Fri,  9 Oct 2020 16:11:52 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 3/3] u-boot-ti: adjust location of optee binary to align with meta-arm
Date: Fri,  9 Oct 2020 16:11:50 -0400
Message-Id: <1602274310-28284-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602274310-28284-1-git-send-email-denis@denix.org>
References: <1602274310-28284-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index f07dcfd..2063bac 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -34,7 +34,7 @@ PV_append = "+git${SRCPV}"
 DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native"
 
 PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
-PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}/boot/bl32.bin,,optee-os"
+PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
 
 PACKAGECONFIG_append_aarch64 = " atf optee"
 
-- 
2.7.4


Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3343.1637378773410595075
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 19:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2D2AC40C52
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jEwDQAAUOkz for <meta-ti@lists.yoctoproject.org>;
	Sat, 20 Nov 2021 03:26:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0ECBA40C5F
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B96671746D6
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 22:26:11 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH v2 02/26] ti-linux-fw: Bump ti linux firmware for 08.01.00.002
Date: Fri, 19 Nov 2021 22:25:47 -0500
Message-Id: <1637378771-24987-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637378771-24987-1-git-send-email-denis@denix.org>
References: <1637378771-24987-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Bump ti-linux-fw version for 08.01.00.002 release

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 56a16e8..4719721 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -7,7 +7,7 @@ PV = "2021.09"
 INC_PR = "r1"
 
 # Firmware versions
-CORESDK_RTOS_VERSION = "08.01.00.01"
+CORESDK_RTOS_VERSION = "08.01.00.02"
 SERDES_FW_VERSION = "3.3.0.2c"
 NETCP_SA_FW_VERSION = "1.0.0"
 NETCP_PA_FW_VERSION = "3.0.2.3"
@@ -17,7 +17,7 @@ PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.06"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "1.2.17"
 
-TI_LINUX_FW_SRCREV ?= "10bcf8564c6e9277e7f402fb02cf941956d0d3eb"
+TI_LINUX_FW_SRCREV ?= "0e93d4df760e5f0948b07c09b68f0b1ecd150d40"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
-- 
2.7.4


Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.4763.1578323334082726862
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Jan 2020 07:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N2pR/x+/;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EAFCAE01250; Mon,  6 Jan 2020 07:08:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36F71E0078F
	for <meta-ti@yoctoproject.org>; Mon,  6 Jan 2020 07:08:52 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 006F8qVS083628
	for <meta-ti@yoctoproject.org>; Mon, 6 Jan 2020 09:08:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578323332;
	bh=tDpiH4+FzBQoudVB0FP7yNP6giR3xo3eAy6S27360A4=;
	h=From:To:Subject:Date;
	b=N2pR/x+/2H+wTDNJh3FVkxJvyXhWZENbfqIn3BxbrI/V4r7iQhPpJeO5aBDyE89Be
	 awGnUQkAcrHBpEZtju7UAJkoAlJsai+ZgSasb0NjAhHE1Cfpzx9A/g5KsShB9SUDl+
	 JA5dACWHObvl8iE9NhAaDqF0ZiZuiBmtJmNxm/JE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 006F8qZQ074135
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 6 Jan 2020 09:08:52 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 09:08:51 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 09:08:51 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006F8p8r066396
	for <meta-ti@yoctoproject.org>; Mon, 6 Jan 2020 09:08:51 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH] pcie-lld-rtos: Update license checksum
Date: Mon, 6 Jan 2020 10:08:46 -0500
Message-ID: <1578323326-34546-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

The license itself has not changed, but the copyright year got updated.
---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
index cbf15a3..ccd9a44 100644
--- a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
+++ b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
@@ -7,12 +7,12 @@ TI_PDK_COMP = "ti.drv.pcie"
 PE = "1"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://pcie.h;beginline=1;endline=34;md5=566a784d78790a716d641764d5d60b74"
+LIC_FILES_CHKSUM = "file://pcie.h;beginline=1;endline=34;md5=232c0b07bdf7ab934b23c09e6c5279b0"
 
 COMPATIBLE_MACHINE = "omap-a15|keystone|c66x|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS_append_k3 = " udma-lld-rtos \
 "
-- 
1.9.1


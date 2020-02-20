Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.549.1582225717966497123
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 11:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wK6VlxJ8;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1A8BE016B6; Thu, 20 Feb 2020 11:08:37 -0800 (PST)
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
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9270BE016B9
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2020 11:08:34 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJ8YgY054447
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2020 13:08:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582225714;
	bh=22lBILgWwFgNXYYTZcPQCcSrZ7uyE06WwrjH2+u36XY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wK6VlxJ8rmGTjwz59Y3dzMB9ylIJCCQ9T2Y3Gfto9muhxUyZSCAwxwtUuhWQi9mcw
	 nOQ2595wRuY8rpcsxHihtnS4ykkNULY6fhRfexFkn48QipR3WcTuqdiV272xTPxlH3
	 dI/bWmPSlnI6y2oRtplcvLBhs3fz1PNBhjZZdu5s=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJ8YSx108014
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2020 13:08:34 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 13:08:34 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 13:08:34 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJ8Xps074493;
	Thu, 20 Feb 2020 13:08:33 -0600
From: "Denys Dmytriyenko" <denys@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH 3/4] vis: mark as compatible with dra7xx family
Date: Thu, 20 Feb 2020 18:47:21 +0000
Message-ID: <20200220184722.25828-3-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220184722.25828-1-denys@ti.com>
References: <20200220184722.25828-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/vis-fw/vis_01.50.07.15.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index 5b9834c2..6eaf8de7 100644
--- a/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Radio Application Firmware"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-Manifest.html;md5=a59aa54b9470f555cf086b91dca0afa3"
 
-COMPATIBLE_MACHINE = "dra7xx-evm"
+COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PR = "r1"
 
-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vis/01_50_07_15/exports/vis-${MACHINE}-01.50.07.15.tar.gz;protocol=http"
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vis/01_50_07_15/exports/vis-dra7xx-evm-01.50.07.15.tar.gz;protocol=http"
 
 SRC_URI[md5sum] = "fe8b00e398fb3b7ada0c15b601867acb"
 SRC_URI[sha256sum] = "6e2aa47ae892910616ebdc96646af778af9a59ca0657716ab4fa4b24a9afae69"
-- 
2.17.1


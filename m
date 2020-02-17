Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.15796.1581974588928152239
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Feb 2020 13:23:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PbuG6X3i;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1DDCE01734; Mon, 17 Feb 2020 13:23:08 -0800 (PST)
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
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20E05E01733
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2020 13:23:07 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01HLN7xD086977
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2020 15:23:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581974587;
	bh=HU6sbwlUvyG8nGtsMF3GdZ3dZ/ApUyUI7YGmE7KDZMU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=PbuG6X3iphCpgVdluZhHcDe5lydOZncBY8i0JU3+HttsX/r5zH6ZAxi2xjjh4hteA
	 WyUQEJC9T8FKsBaz0qsE4mhg5mkSztmyFWAlTL/zgak1gC/zSUzRMCDy9XaPM/XEzW
	 Mm8Y5nMiteTxMyujzoNiyJ3Fpz5dwBa2rueOSFF8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01HLN7Pd020992
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2020 15:23:07 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 17
 Feb 2020 15:23:07 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 17 Feb 2020 15:23:07 -0600
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01HLN6Le115909
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2020 15:23:07 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH v2 2/2] sciclient-rtos: Updating License checksum, along with the file it is calculated
Date: Mon, 17 Feb 2020 16:23:03 -0500
Message-ID: <20200217212303.38290-3-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217212303.38290-1-m-radhakrishnan2@ti.com>
References: <20200217212303.38290-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Mahesh Radhakrishnan <a0875154@UDA0875154>

The license as such has not changed, but moved to a License file which
is not expected to change frequently
---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index 6a3d79c3..a5aacd9f 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -7,12 +7,12 @@ TI_PDK_COMP = "ti.drv.sciclient"
 PE = "1"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444815f1737bfcdfa892a"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=99d7639a81c1ba1f16fd070a928ffddb"
 
 COMPATIBLE_MACHINE = "k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS_append = " osal-rtos common-csl-ip-rtos"
 
@@ -71,3 +71,7 @@ FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
 INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
 
 INSANE_SKIP_${PN}-dbg = "arch"
+
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
-- 
2.17.1


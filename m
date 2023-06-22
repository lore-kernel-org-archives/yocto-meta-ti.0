Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209FFEB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 20:23:00 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.21927.1687465376769767792
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 13:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=r9xhcrvl;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MKMr93120983;
	Thu, 22 Jun 2023 15:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687465373;
	bh=URW2X3prtveEb6Hc5Y3qcrtQGPqJ49HDGF1TcukiDpQ=;
	h=From:To:CC:Subject:Date;
	b=r9xhcrvlbWczdjgoYSoIxgmAItgU+BiAggOZ9Mc9QXGsJXwiHrMFLzOhn9aYb/1O7
	 55ES1oyE7l2syYrolTipohT2Co+wY6MloNQT6a4y6Wvml2ugOIAYTGEA1o21JmWSIX
	 y2Xrz3k2BKKrTQy10YUplncvzVMvHr2L2bWMT5rI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MKMr3E030586
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 15:22:53 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 15:22:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 15:22:52 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MKMrnV081435;
	Thu, 22 Jun 2023 15:22:53 -0500
From: <rs@ti.com>
To: <d.schultz@phytec.de>, <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-umlibs: fix yocto package cache issue
Date: Thu, 22 Jun 2023 15:22:33 -0500
Message-ID: <20230622202233.2740043-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 20:23:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16777

From: Randolph Sapp <rs@ti.com>

There's a weird issue with Yocto's caching system (though it may be
intentional behavior). Changing the package config won't always update
the package contents when you are directly modifying the recipe's deploy
directory if there is a cached build.

Oddly enough, if you edit the source directory before do_install touches
the deploy directory, it seems to correctly reevaluate the cache.

Fixes:
1705f6d3 (ti-img-rogue-umlibs: make all components optional, 2023-06-21)

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-img-rogue-umlibs_23.1.6404501.bb        | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
index c012859f..dd5ef11c 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -47,28 +47,28 @@ def get_file_list(package_list_var, d):
                 file_list.append(package_files)
     return " ".join(file_list)
 
-do_install:append() {
+do_install:prepend() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)}; then
         for file in ${@get_file_list('GLES_PACKAGES', d)}; do
-            rm -rf ${D}/${file}
-            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
+            rm -rf ${S}/${file}
+            rmdir --ignore-fail-on-non-empty $(dirname ${S}/${file})
         done
     fi
     if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true', d)}; then
         for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
-            rm -rf ${D}/${file}
-            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
+            rm -rf ${S}/${file}
+            rmdir --ignore-fail-on-non-empty $(dirname ${S}/${file})
         done
     fi
     if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true', d)}; then
         for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
-            rm -rf ${D}/${file}
-            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
+            rm -rf ${S}/${file}
+            rmdir --ignore-fail-on-non-empty $(dirname ${S}/${file})
         done
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
-        mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
-        rmdir ${D}/lib
+        mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
+        rmdir ${S}/lib
     fi
 }
 
-- 
2.41.0



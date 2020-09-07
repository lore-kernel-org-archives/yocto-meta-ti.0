Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.35956.1599460813019311210
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 06 Sep 2020 23:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qYax/2fa;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: subhajit_paul@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9623338C0894
	for <meta-ti@yoctoproject.org>; Sun,  6 Sep 2020 23:40:12 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0876eB68061407
	for <meta-ti@yoctoproject.org>; Mon, 7 Sep 2020 01:40:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1599460811;
	bh=bChOVSLNlFdpM6K+j6cvFkM4mSM/mJ7Xyz9QG8nulMg=;
	h=From:To:CC:Subject:Date;
	b=qYax/2faSZlR1IGm+pKdKhE0l/YHEH9I/aCv4XUaj2e/ygIXYR42lGkJJTCne9ngf
	 x/bTIDsINBXmyFLMTv9/6mBHqr1r7dYJHNjv+xZDl7rFl8Op1tUfUSE6hGh7zSQYWV
	 mx1FkRvRv+JKCiFpVzwfYIktKo4i7uhzPmQkPJLQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0876eB2C045176
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 7 Sep 2020 01:40:11 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 01:40:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 01:40:11 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0876e8vw129900;
	Mon, 7 Sep 2020 01:40:09 -0500
From: "Subhajit Paul" <subhajit_paul@ti.com>
To: <meta-ti@yoctoproject.org>, <denys@ti.com>, <dmurphy@ti.com>,
        <m-radhakrishnan2@ti.com>
CC: Subhajit Paul <a0132170@ti.com>
Subject: [meta-ti][dunfell PATCH] ti-rtos: enable parallel make
Date: Mon, 7 Sep 2020 12:10:07 +0530
Message-ID: <20200907064007.23032-1-a0132170@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Subhajit Paul <a0132170@ti.com>
---
 classes/ti-pdk.bbclass                      | 1 -
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 2 +-
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb   | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 37305e89..a3685602 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -72,7 +72,6 @@ TI_PDK_DOXYGEN_SUPPORT ?= "1"
 TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
 
 PARALLEL_XDC = "${@oe.utils.parallel_make_argument(d, '--jobs=%d')}"
-PARALLEL_MAKE = ""
 
 def get_doxygen_support(d):
     if d.getVar('TI_PDK_DOXYGEN_SUPPORT') == '1':
diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index deaf0b12..26b09537 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -59,7 +59,7 @@ do_compile() {
     # make clean LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
 
     # Build am65xx libraries
-    make lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}"
+    oe_runmake lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}"
 
     #archive
     tar -cf sciclient.tar --exclude='*.tar' ./*
diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
index a82eb362..797572d3 100644
--- a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
+++ b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
@@ -48,7 +48,7 @@ do_compile() {
     cd ${UDMA_LLD_ROOTPATH}
 
     # Build am65xx libraries
-    make clean lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}"
+    oe_runmake clean lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}"
 
     #archive
     tar -cf udma_lld.tar --exclude='*.tar' ./*
-- 
2.17.1


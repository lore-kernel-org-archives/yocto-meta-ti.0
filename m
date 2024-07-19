Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA45C3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 20:36:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.27962.1721421365564415139
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Jul 2024 13:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dZGFTAa2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46JKa3QY108977;
	Fri, 19 Jul 2024 15:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721421363;
	bh=EuFPKVzf0yyKneompuR5TaiuzTlTy2qqtzHRnwHzyRk=;
	h=From:To:Subject:Date;
	b=dZGFTAa2kafR/dE2tT11/xh9DXgbkFrVW5h8MQH5x+WvBJxYqcgd0yf+qHrxmv/6l
	 a8dLVk8iuFbUxCWvjVKzo9P+l08PwTTCNP5zEcHqut3nRskYGb3fHDB3TxeGss+CkQ
	 AHbPI5V5FCvwK5qhxI8RkelrsowzZawPidbgGqvI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46JKa39M005976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Jul 2024 15:36:03 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 Jul 2024 15:36:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 Jul 2024 15:36:03 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46JKa3Ai085604;
	Fri, 19 Jul 2024 15:36:03 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sUuKh-0005iR-7v; Fri, 19 Jul 2024 15:36:03 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] libulm: Fix "buildpaths" QA error
Date: Fri, 19 Jul 2024 15:36:03 -0500
Message-ID: <20240719203603.21930-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Jul 2024 20:36:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17895

The TI cl6x compiler does not have a mechanism for replacing paths in
the obj files it creates.  So replace the string we want to remove with
an equally sized replacement string that does not contain the path.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...m-makefile-Fix-reproducibility-error.patch | 31 +++++++++++++++++++
 .../recipes-bsp/dsptop/libulm_git.bb          | 12 +++++--
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-extras/recipes-bsp/dsptop/files/0001-dstop-ulm-makefile-Fix-reproducibility-error.patch

diff --git a/meta-ti-extras/recipes-bsp/dsptop/files/0001-dstop-ulm-makefile-Fix-reproducibility-error.patch b/meta-ti-extras/recipes-bsp/dsptop/files/0001-dstop-ulm-makefile-Fix-reproducibility-error.patch
new file mode 100644
index 00000000..6ea59517
--- /dev/null
+++ b/meta-ti-extras/recipes-bsp/dsptop/files/0001-dstop-ulm-makefile-Fix-reproducibility-error.patch
@@ -0,0 +1,31 @@
+From 8619e4b2f983130bf1909cc9c9bc238cd43ded41 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Fri, 19 Jul 2024 14:37:55 -0500
+Subject: [master][PATCH] dstop/ulm/makefile: Fix reproducibility error
+
+The TI cl6x compiler does not have a mechanism for replacing paths in
+the obj files it creates.  So replace the string we want to remove with
+an equally sized replacement string that does not contain the path.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/makefile b/makefile
+index dffb211..586dcc2 100644
+--- a/makefile
++++ b/makefile
+@@ -82,6 +82,7 @@ $(OBJDIR)/%.obj: %.c $(INCLUDE_FILES)
+ 	@echo "Compiling" $<
+ 	@mkdir -p $(OBJDIR)
+ 	$(CC) $(CFLAGS) $(INCLUDE_PATH) -fe $@ $<
++	perl -pi -e 's#${SEARCH}#${REPLACE}#g' $@
+ 
+ libtiulm.a libtiulm.ae66: $(OBJECTS)
+ 	@echo "Building target" $@
+-- 
+2.17.1
+
diff --git a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
index 6a2cde30..aafae21f 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
@@ -6,7 +6,7 @@ inherit features_check
 
 REQUIRED_MACHINE_FEATURES = "dsp"
 
-DEPENDS = "ti-cgt6x-native"
+DEPENDS = "ti-cgt6x-native perl-native"
 PR = "${INC_PR}.0"
 
 S = "${WORKDIR}/git/dsptop/ulm"
@@ -14,7 +14,13 @@ S = "${WORKDIR}/git/dsptop/ulm"
 DEVICE=""
 DEVICE:dra7xx = "DRA7xx"
 
-EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX}"
+EXTRA_OEMAKE = " \
+    release \
+    DEVICE=${DEVICE} \
+    CROSS_COMPILE=${TARGET_PREFIX} \
+    SEARCH=${WORKDIR} \
+    REPLACE=${@'_'*(len(d.getVar('WORKDIR'))-7)+"workdir"} \
+"
 
 do_compile() {
     oe_runmake arm XPORT_ONLY CC="${CC}"
@@ -40,6 +46,8 @@ FILES:${PN}-dev += "\
 
 include dsptop.inc
 
+SRC_URI += "file://0001-dstop-ulm-makefile-Fix-reproducibility-error.patch"
+
 ALLOW_EMPTY:${PN} = "1"
 
 PARALLEL_MAKE= ""
-- 
2.17.1



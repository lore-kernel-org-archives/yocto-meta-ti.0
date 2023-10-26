Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020ADC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:29:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.200139.1698326964664064720
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 06:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gzep/xzI;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39QDTMKK066988;
	Thu, 26 Oct 2023 08:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698326962;
	bh=BP8pJVDfvzQZ29/gYx+WndQA+Lvxlo3mjqdUFLHL9og=;
	h=From:To:Subject:Date;
	b=gzep/xzIUbCnsOWav7Yddqw30wmA9WdOoXrf0yafYku/JsCofFQA4FqXcGdhwjwl+
	 xh7XYIGEQFaJ30vasXM7UYzFvnHf3SPZcALPPwEGWXrEVhCRoRbb6wu8YHzHsYWS9f
	 aM0+whsNj3JbHSVjJSrNJt3Co3ONG4e7DWUfztes=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39QDTMrY100174
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Oct 2023 08:29:22 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Oct 2023 08:29:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Oct 2023 08:29:22 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39QDTMhC046919;
	Thu, 26 Oct 2023 08:29:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qw0QM-0001Nw-Av; Thu, 26 Oct 2023 08:29:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] optee: Update to upstream 4.0.0
Date: Thu, 26 Oct 2023 08:29:22 -0500
Message-ID: <20231026132922.5043-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Oct 2023 13:29:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17196

Update all of the optee components to the upstream 4.0.0 version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-client-ti.inc     | 7 +++++++
 meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend | 4 ++++
 meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc   | 2 ++
 .../recipes-security/optee/optee-examples_%.bbappend       | 4 ++++
 .../recipes-security/optee/optee-os-tadevkit-ti.inc        | 3 +++
 meta-ti-bsp/recipes-security/optee/optee-os-ti.inc         | 3 +++
 meta-ti-bsp/recipes-security/optee/optee-test-ti.inc       | 2 ++
 meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend   | 4 ++++
 8 files changed, 29 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
new file mode 100644
index 00000000..f64a90c3
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
@@ -0,0 +1,7 @@
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "acb0885c117e73cb6c5c9b1dd9054cb3f93507ee"
+
+inherit pkgconfig
+DEPENDS += "util-linux"
+
+EXTRA_OEMAKE += "PKG_CONFIG=pkg-config"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
new file mode 100644
index 00000000..08c5256b
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
@@ -0,0 +1,4 @@
+OPTEE_TI = ""
+OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+
+require ${OPTEE_TI}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
new file mode 100644
index 00000000..d6ddc907
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
@@ -0,0 +1,2 @@
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
new file mode 100644
index 00000000..08c5256b
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
@@ -0,0 +1,4 @@
+OPTEE_TI = ""
+OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+
+require ${OPTEE_TI}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
index df46e243..4278d426 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
@@ -1 +1,4 @@
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
+
 EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
index e2a15428..13c75d8c 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
@@ -1,3 +1,6 @@
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
+
 # Use TI SECDEV for signing
 inherit ti-secdev
 
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
new file mode 100644
index 00000000..48231a66
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
@@ -0,0 +1,2 @@
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "1c3d6be5eaa6174e3dbabf60928d15628e39b994"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
new file mode 100644
index 00000000..08c5256b
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
@@ -0,0 +1,4 @@
+OPTEE_TI = ""
+OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+
+require ${OPTEE_TI}
-- 
2.17.1



Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A229FC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:27:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.13558.1699370837621299627
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 07:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RT9AWgnj;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7FRGcK059444;
	Tue, 7 Nov 2023 09:27:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699370836;
	bh=MjHQP+pA10P8WmR0zEQ2dmNtsK1g1kH1gx7XIc8klb0=;
	h=From:To:Subject:Date;
	b=RT9AWgnjMz1E06CrGnyrBm+Uh635gM7wCgiJLPBsbW4LnchmqR0LxCqdqIfDAU4gV
	 wUbcwWIwF9g7wNqQOxoua30ICekaRgFvNjxQaG2ysqCAaufIeA8GOj2bTM7QAygany
	 0OAfUHXpW6ToBaKsFl3ckHIFaAcED4NA+h2r+BR4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7FRGA9025675
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Nov 2023 09:27:16 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 09:27:16 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 09:27:16 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7FRGIY121041;
	Tue, 7 Nov 2023 09:27:16 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1r0Nz2-0007dL-10; Tue, 07 Nov 2023 09:27:16 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH] optee: Rework include files
Date: Tue, 7 Nov 2023 09:27:16 -0600
Message-ID: <20231107152716.29305-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 15:27:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17255

Minor rework of the TI include files used to override both SRCREV and
other settings in the optee recipes for TI SOC parts.  The intent is to
make it more clear when we are changing SRCREVs versus changing other
items, and allow for sharing the SRCREV changes for optee-os-tadevkit
which should track the optee-os SRCREV.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ee-client-ti.inc => optee-client-ti-overrides.inc} |  3 ---
 .../optee/optee-client-ti-version.inc                 |  2 ++
 .../optee/optee-client_3.16%.bbappend                 | 11 ++++++++---
 ...-examples-ti.inc => optee-examples-ti-version.inc} |  0
 .../recipes-security/optee/optee-examples_%.bbappend  |  6 +++---
 .../optee/optee-os-tadevkit_%.bbappend                |  6 +++---
 .../{optee-os-ti.inc => optee-os-ti-overrides.inc}    |  3 ---
 ...tee-os-tadevkit-ti.inc => optee-os-ti-version.inc} |  1 -
 .../recipes-security/optee/optee-os_3.16%.bbappend    | 11 ++++++++---
 ...{optee-test-ti.inc => optee-test-ti-overrides.inc} |  4 ----
 .../recipes-security/optee/optee-test-ti-version.inc  |  2 ++
 .../recipes-security/optee/optee-test_%.bbappend      | 11 ++++++++---
 12 files changed, 34 insertions(+), 26 deletions(-)
 rename meta-ti-bsp/recipes-security/optee/{optee-client-ti.inc => optee-client-ti-overrides.inc} (51%)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
 rename meta-ti-bsp/recipes-security/optee/{optee-examples-ti.inc => optee-examples-ti-version.inc} (100%)
 rename meta-ti-bsp/recipes-security/optee/{optee-os-ti.inc => optee-os-ti-overrides.inc} (96%)
 rename meta-ti-bsp/recipes-security/optee/{optee-os-tadevkit-ti.inc => optee-os-ti-version.inc} (98%)
 rename meta-ti-bsp/recipes-security/optee/{optee-test-ti.inc => optee-test-ti-overrides.inc} (53%)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
similarity index 51%
rename from meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
rename to meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
index f64a90c3..90fc70aa 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
@@ -1,6 +1,3 @@
-PV = "4.0.0+git${SRCPV}"
-SRCREV = "acb0885c117e73cb6c5c9b1dd9054cb3f93507ee"
-
 inherit pkgconfig
 DEPENDS += "util-linux"
 
diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
new file mode 100644
index 00000000..0da37acf
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -0,0 +1,2 @@
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "acb0885c117e73cb6c5c9b1dd9054cb3f93507ee"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
index 08c5256b..0cee127f 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
@@ -1,4 +1,9 @@
-OPTEE_TI = ""
-OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+OPTEE_TI_VERSION = ""
+OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
 
-require ${OPTEE_TI}
+require ${OPTEE_TI_VERSION}
+
+OPTEE_TI_OVERRIDES = ""
+OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
+
+require ${OPTEE_TI_OVERRIDES}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
similarity index 100%
rename from meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
rename to meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
index 08c5256b..f193e78b 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
@@ -1,4 +1,4 @@
-OPTEE_TI = ""
-OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+OPTEE_TI_VERSION = ""
+OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
 
-require ${OPTEE_TI}
+require ${OPTEE_TI_VERSION}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
index 08c5256b..17856dc3 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
@@ -1,4 +1,4 @@
-OPTEE_TI = ""
-OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+OPTEE_TI_VERSION = ""
+OPTEE_TI_VERSION:ti-soc = "optee-os-ti-version.inc"
 
-require ${OPTEE_TI}
+require ${OPTEE_TI_VERSION}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
similarity index 96%
rename from meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
rename to meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index 91b66a36..b1846cad 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -1,6 +1,3 @@
-PV = "4.0.0+git${SRCPV}"
-SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
-
 # Use TI SECDEV for signing
 inherit ti-secdev
 
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
similarity index 98%
rename from meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
rename to meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index c1354539..2e4e53b7 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,3 +1,2 @@
 PV = "4.0.0+git${SRCPV}"
 SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
-
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
index 08c5256b..0cee127f 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
@@ -1,4 +1,9 @@
-OPTEE_TI = ""
-OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+OPTEE_TI_VERSION = ""
+OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
 
-require ${OPTEE_TI}
+require ${OPTEE_TI_VERSION}
+
+OPTEE_TI_OVERRIDES = ""
+OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
+
+require ${OPTEE_TI_OVERRIDES}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-overrides.inc
similarity index 53%
rename from meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
rename to meta-ti-bsp/recipes-security/optee/optee-test-ti-overrides.inc
index b68caf0c..6bbb0bfa 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-overrides.inc
@@ -1,6 +1,2 @@
-PV = "4.0.0+git${SRCPV}"
-SRCREV = "1c3d6be5eaa6174e3dbabf60928d15628e39b994"
-
 EXTRA_OEMAKE:append = " OPTEE_OPENSSL_EXPORT=${STAGING_INCDIR}"
 DEPENDS:append = " openssl"
-
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
new file mode 100644
index 00000000..48231a66
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -0,0 +1,2 @@
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "1c3d6be5eaa6174e3dbabf60928d15628e39b994"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
index 08c5256b..0cee127f 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
@@ -1,4 +1,9 @@
-OPTEE_TI = ""
-OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+OPTEE_TI_VERSION = ""
+OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
 
-require ${OPTEE_TI}
+require ${OPTEE_TI_VERSION}
+
+OPTEE_TI_OVERRIDES = ""
+OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
+
+require ${OPTEE_TI_OVERRIDES}
-- 
2.17.1



Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DF3C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:27:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.13554.1699370831445512885
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 07:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Zkr9xcVg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7FRAXX059414;
	Tue, 7 Nov 2023 09:27:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699370830;
	bh=PmQ7i/PyF9NiM3pH0GM0wccDl6zqf90WWyGtWwOTGGU=;
	h=From:To:Subject:Date;
	b=Zkr9xcVgzfDrCsEdUBSoYtwLfvlvOsBixxAJBwvnyEcvm09Vkh1OoZBce6KMABxC5
	 NER1Hohv/BkTUl5NWxG/ew+HGbR4pBSb9GsEdNqBoPcFAWQxKcNpoaLUFwVcE8dmWo
	 VtySCikRrizSAdmvfmC/sdlwBs7TXujU3iUt9tqo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7FRAko057609
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Nov 2023 09:27:10 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 09:27:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 09:27:09 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7FR9TJ120996;
	Tue, 7 Nov 2023 09:27:09 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1r0Nyv-0007cS-KN; Tue, 07 Nov 2023 09:27:09 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] optee: Rework include files
Date: Tue, 7 Nov 2023 09:27:09 -0600
Message-ID: <20231107152709.29250-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 15:27:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17254

Minor rework of the TI include files used to override both SRCREV and
other settings in the optee recipes for TI SOC parts.  The intent is to
make it more clear when we are changing SRCREVs versus changing other
items, and allow for sharing the SRCREV changes for optee-os-tadevkit
which should track the optee-os SRCREV.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ptee-client-ti.inc => optee-client-ti-version.inc} |  0
 .../recipes-security/optee/optee-client_%.bbappend    |  6 +++---
 ...-examples-ti.inc => optee-examples-ti-version.inc} |  0
 .../recipes-security/optee/optee-examples_%.bbappend  |  6 +++---
 .../optee/optee-os-tadevkit-ti-overrides.inc          |  1 +
 .../optee/optee-os-tadevkit_%.bbappend                | 11 ++++++++---
 .../{optee-os-ti.inc => optee-os-ti-overrides.inc}    |  8 --------
 ...tee-os-tadevkit-ti.inc => optee-os-ti-version.inc} |  2 --
 .../recipes-security/optee/optee-os_%.bbappend        | 11 ++++++++---
 .../{optee-test-ti.inc => optee-test-ti-version.inc}  |  0
 .../recipes-security/optee/optee-test_%.bbappend      |  6 +++---
 11 files changed, 26 insertions(+), 25 deletions(-)
 rename meta-ti-bsp/recipes-security/optee/{optee-client-ti.inc => optee-client-ti-version.inc} (100%)
 rename meta-ti-bsp/recipes-security/optee/{optee-examples-ti.inc => optee-examples-ti-version.inc} (100%)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
 rename meta-ti-bsp/recipes-security/optee/{optee-os-ti.inc => optee-os-ti-overrides.inc} (86%)
 rename meta-ti-bsp/recipes-security/optee/{optee-os-tadevkit-ti.inc => optee-os-ti-version.inc} (87%)
 rename meta-ti-bsp/recipes-security/optee/{optee-test-ti.inc => optee-test-ti-version.inc} (100%)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
similarity index 100%
rename from meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
rename to meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
index 08c5256b..f193e78b 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
@@ -1,4 +1,4 @@
-OPTEE_TI = ""
-OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+OPTEE_TI_VERSION = ""
+OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
 
-require ${OPTEE_TI}
+require ${OPTEE_TI_VERSION}
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
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
new file mode 100644
index 00000000..df46e243
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
@@ -0,0 +1 @@
+EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
index 08c5256b..980f7a4b 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
@@ -1,4 +1,9 @@
-OPTEE_TI = ""
-OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+OPTEE_TI_VERSION = ""
+OPTEE_TI_VERSION:ti-soc = "optee-os-ti-version.inc"
 
-require ${OPTEE_TI}
+require ${OPTEE_TI_VERSION}
+
+OPTEE_TI_OVERRIDES = ""
+OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
+
+require ${OPTEE_TI_OVERRIDES}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
similarity index 86%
rename from meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
rename to meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index 6d192bbe..de13d282 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -1,11 +1,3 @@
-PV = "4.0.0+git${SRCPV}"
-SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
-
-# Fixes for pointing to 4.0.0 before upstream meta-arm
-FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-4.0.0:"
-SRC_URI:remove = "file://0002-core-Define-section-attributes-for-clang.patch"
-SRC_URI:append = " file://0002ti-core-Define-section-attributes-for-clang.patch"
-
 # Use TI SECDEV for signing
 inherit ti-secdev
 
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
similarity index 87%
rename from meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
rename to meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 55453366..06472e34 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -5,5 +5,3 @@ SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
 FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-4.0.0:"
 SRC_URI:remove = "file://0002-core-Define-section-attributes-for-clang.patch"
 SRC_URI:append = " file://0002ti-core-Define-section-attributes-for-clang.patch"
-
-EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index 08c5256b..0cee127f 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
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
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
similarity index 100%
rename from meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
rename to meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
index 08c5256b..f193e78b 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
@@ -1,4 +1,4 @@
-OPTEE_TI = ""
-OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+OPTEE_TI_VERSION = ""
+OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
 
-require ${OPTEE_TI}
+require ${OPTEE_TI_VERSION}
-- 
2.17.1



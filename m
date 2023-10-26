Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0212AC25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:29:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.70460.1698326957639584857
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 06:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TQrSkuus;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39QDTGWT088339;
	Thu, 26 Oct 2023 08:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698326956;
	bh=QwcAn+wawIaRJ8m8GGbyeMimhHoZiBu9qGWQU3wHWaI=;
	h=From:To:Subject:Date;
	b=TQrSkuus9EUrv4l5XNv3LPTPledrQnB5wrMCr6aPNrvVYTS6tUWpTQHIYubS9N7M2
	 6BAFkj7239hrCEkRC2hFGBORaKZEm8811x5TJMIjjJIemHzIl0TM7KFUDLsm1wT1sK
	 N5CsK5z//0JPXVlAQtQXwyThi+CdPofF+kbC6cb8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39QDTGDI100135
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Oct 2023 08:29:16 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Oct 2023 08:29:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Oct 2023 08:29:16 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39QDTFFa046870;
	Thu, 26 Oct 2023 08:29:16 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qw0QF-0000Uv-Q9; Thu, 26 Oct 2023 08:29:15 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH] optee: Update to upstream 4.0.0
Date: Thu, 26 Oct 2023 08:29:15 -0500
Message-ID: <20231026132915.1441-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Oct 2023 13:29:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17195

Update all of the optee components to the upstream 4.0.0 version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-client-ti.inc    | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc  | 4 ++--
 .../recipes-security/optee/optee-os-tadevkit-ti.inc       | 5 +++--
 meta-ti-bsp/recipes-security/optee/optee-os-ti.inc        | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-test-ti.inc      | 8 ++++++--
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
index fef87d30..f64a90c3 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
@@ -1,5 +1,5 @@
-PV = "3.20.0+git${SRCPV}"
-SRCREV = "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "acb0885c117e73cb6c5c9b1dd9054cb3f93507ee"
 
 inherit pkgconfig
 DEPENDS += "util-linux"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
index 7d119f0d..7a733f53 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
@@ -1,3 +1,3 @@
-PV = "3.20.0+git${SRCPV}"
-SRCREV = "a98d01e1b9168eaed96bcd0bac0df67c44a81081"
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
 SRC_URI:remove = "file://0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
index 18820af1..c1354539 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
@@ -1,2 +1,3 @@
-PV = "3.20.0+git${SRCPV}"
-SRCREV = "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
+
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
index 19386295..763dd1d5 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
@@ -1,5 +1,5 @@
-PV = "3.20.0+git${SRCPV}"
-SRCREV = "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
 
 # Use TI SECDEV for signing
 inherit ti-secdev
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
index 43e0172d..b68caf0c 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
@@ -1,2 +1,6 @@
-PV = "3.19.0+git${SRCPV}"
-SRCREV = "ab9863cc187724e54c032b738c28bd6e9460a4db"
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "1c3d6be5eaa6174e3dbabf60928d15628e39b994"
+
+EXTRA_OEMAKE:append = " OPTEE_OPENSSL_EXPORT=${STAGING_INCDIR}"
+DEPENDS:append = " openssl"
+
-- 
2.17.1



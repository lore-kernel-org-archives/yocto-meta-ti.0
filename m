Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E6DC64ED6
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:34:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2557.1676489638556405091
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aE0rrgMf;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXuU0097982;
	Wed, 15 Feb 2023 13:33:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676489636;
	bh=0ZZS38s9QdlrDWQs76CbmRrtgUsLvKwIGP3+HI11GEo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aE0rrgMfHszOw0zK2YFcPeyz9gVeFYVwFEi5vQqo3aEan4GkK9jPhVTDNeNpOjCEE
	 uKslCQ62uyavLRSzVCLhLSGlu/AIFAgieyoJ9CIA9qVkOBoJeXJMsgrRnyTT+r9q3d
	 GnV7FpKg/8mHwBHWOupxTtw8BjZ2RYVuNew7018U=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FJXupG016193
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 13:33:56 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 13:33:56 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 13:33:56 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXt6e014221;
	Wed, 15 Feb 2023 13:33:55 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 01/15] meta-ti-bsp: Add helper class for TI Security Development Tools
Date: Wed, 15 Feb 2023 13:33:41 -0600
Message-ID: <20230215193355.9676-2-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215193355.9676-1-afd@ti.com>
References: <20230215193355.9676-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 19:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15857

The setup here is common to all packages that require signing with
the TI Security Development Tools. Add a helper class to factor out
this commonality.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/classes/ti-secdev.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-ti-bsp/classes/ti-secdev.bbclass

diff --git a/meta-ti-bsp/classes/ti-secdev.bbclass b/meta-ti-bsp/classes/ti-secdev.bbclass
new file mode 100644
index 00000000..b3d70e5c
--- /dev/null
+++ b/meta-ti-bsp/classes/ti-secdev.bbclass
@@ -0,0 +1,21 @@
+# Helper class to prepare correct environment for signing with TI Security Development Tools
+
+# K3 SECDEV scripts use OpenSSL
+DEPENDS:append:k3 = " openssl-native"
+DEPENDS:append:k3r5 = " openssl-native"
+
+# Use package version of TI SECDEV for K3 if one is not provided through the environment
+DEPENDS:append:k3 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
+DEPENDS:append:k3r5 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
+TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
+TI_SECURE_DEV_PKG:k3 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
+TI_SECURE_DEV_PKG:k3r5 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
+
+# For non-K3 we require the SECDEV tools be provided through the environment with the following vars
+TI_SECURE_DEV_PKG:ti33x = "${TI_SECURE_DEV_PKG_CAT}/am3x"
+TI_SECURE_DEV_PKG:ti43x = "${TI_SECURE_DEV_PKG_CAT}/am4x"
+TI_SECURE_DEV_PKG:am57xx = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
+TI_SECURE_DEV_PKG:dra7xx = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
+
+# The SECDEV scripts may need their own location provided through the environment
+export TI_SECURE_DEV_PKG
-- 
2.39.1



Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49F9C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:10:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.515.1675897835127198698
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tc4Ck7Zs;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NAX8j048511;
	Wed, 8 Feb 2023 17:10:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675897833;
	bh=/OiBbf6he1KsS+K+LTyb0SfnzJCDuhX7PgDX5w35Bbw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tc4Ck7Zsxm3paw2kQBW2oLC61IqscC/Xe89/4P/nM7oTiD+LAqLEbL5Nwoho+xaUQ
	 6rf4AzjIATS28L56jp5tftDZThgKsvS6QSCE1ZNzIcvPIbWtsWixnnp1Vg09+tbOiU
	 EyHw1m0DYRdHETD+hh/7skT94pLz5QHnEw9g59o4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NAWHX074354
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:10:33 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:10:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:10:32 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NAVKf043668;
	Wed, 8 Feb 2023 17:10:32 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 3/4] u-boot-ti: Use ti-k3-secdev if TI_SECURE_DEV_PKG_K3 is not defined
Date: Wed, 8 Feb 2023 17:10:30 -0600
Message-ID: <20230208231031.16363-3-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208231031.16363-1-afd@ti.com>
References: <20230208231031.16363-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:10:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15764

Use the new ti-k3-secdev package to pull in the signing tools if they are
not provided by the environment. This allows us to use these tools
unconditionally. Remove the checks for the script and do the signing
for all K3 machines. The signature is automatically stripped from
the binaries on non-HS devices at boot time as needed so this change
is harmless for GP devices.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 6f5b6313..ae87ec6a 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -24,6 +24,7 @@ PV:append = "+git${SRCPV}"
 
 # u-boot needs devtree compiler to parse dts files
 DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-setuptools-native"
+DEPENDS:append:k3 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
@@ -49,8 +50,13 @@ PKG:${PN}-dbg = "u-boot-dbg"
 
 S = "${WORKDIR}/git"
 
+# set a default value for TI_K3_SECDEV_INSTALL_DIR
+export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
+include recipes-ti/includes/ti-paths.inc
+
 # Support for secure devices - detailed info is in doc/README.ti-secure
 TI_SECURE_DEV_PKG ?= ""
+TI_SECURE_DEV_PKG:k3 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
 export TI_SECURE_DEV_PKG
 
 SYSROOT_DIRS += "/boot"
-- 
2.39.1



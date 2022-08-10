Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1AEC00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 14:47:15 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.6714.1660142831148886758
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Aug 2022 07:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nxd5RPqg;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27AEl9dV029151;
	Wed, 10 Aug 2022 09:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660142829;
	bh=db0BiV5NmNuWkvmyxhpJwrSGKXWud088kLgGrytxlbM=;
	h=From:To:CC:Subject:Date;
	b=nxd5RPqgSZB1iQ7PGWaFJA0KVf0lT48t1JHFXc+ExOMaNEpWyR33VOxg+4SRqVObF
	 OV0DHf49ea0VD4BwcV1rivZicgGt0D2B7cPOZ8ZklIM3VvyODUXoL9YL0XJoAaS8RD
	 m6IJTUEGwfwojidxmRH4TZYSuQYXQdYLAqIf2sqM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27AEl8EY063261
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Aug 2022 09:47:08 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 10
 Aug 2022 09:47:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 10 Aug 2022 09:47:08 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27AEl8Zj024282;
	Wed, 10 Aug 2022 09:47:08 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 1/2] ti-sci-fw: Allow build to continue
 without TI_SECURE_DEV_PKG set
Date: Wed, 10 Aug 2022 09:47:07 -0500
Message-ID: <20220810144708.14171-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Aug 2022 14:47:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14941

If we do not have TI_SECURE_DEV_PKG set then SYSFW generation will fail
if we are building for the HS platform. When TI_SECURE_DEV_PKG is not
set we assume the builder is only interested in the GP boards, so fake
generating the HS SYSFW images. These will be non-functional on HS
boards, but they would have been just as non-functional if built
without TI_SECURE_DEV_PKG set.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 18652dd4..287e5a40 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -66,6 +66,11 @@ EXTRA_OEMAKE_remove_j7-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.
 EXTRA_OEMAKE_remove_j7-hs-evm-k3r5-sr1-1 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 
 do_compile() {
+	if [ ! "${SYSFW_SUFFIX}" = "gp" ] && [ ! -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then
+		echo "Warning: TI_SECURE_DEV_PKG not set, skipping HS SYSFW generation."
+		touch ${WORKDIR}/imggen/${SYSFW_TIBOOT3}
+		exit 0
+	fi
 	cd ${WORKDIR}/imggen/
 	oe_runmake
 }
-- 
2.36.1



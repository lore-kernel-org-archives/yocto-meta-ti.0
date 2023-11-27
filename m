Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89724C46CA0
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 21:58:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.113702.1701122318284083078
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 13:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ARLwbLm067431;
	Mon, 27 Nov 2023 15:58:37 -0600
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ARLwaPK016807
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Nov 2023 15:58:36 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Nov 2023 15:58:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Nov 2023 15:58:36 -0600
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.248.130.161])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ARLwa2W096883;
	Mon, 27 Nov 2023 15:58:36 -0600
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id 9AF4810D08DD; Mon, 27 Nov 2023 15:58:36 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 2/4] mesa-pvr: use different srcrev for Rogue and SGX GPU platforms
Date: Mon, 27 Nov 2023 15:58:34 -0600
Message-ID: <1701122316-142436-3-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1701122316-142436-1-git-send-email-lcpdbld@list.ti.com>
References: <1701122316-142436-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Nov 2023 21:58:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17331

From: Darren Etheridge <detheridge@ti.com>

A bug was introduced while trying to unify the Mesa version that is used
on SGX GPU's and Rogue GPU's.   It manifests itself as an immediate segfault
whenever you try and run something like glmark2-es2-wayland or
weston-simple-egl on certain Rogue based platforms (specifically am62x).

Use different srcrev for Rogue GPU and SGX GPU platforms. The SGX GPU platforms
will use the latest commit. Rogue GPU platforms will use the last good working
commit before SGX related changes were introduced.

This change will be reverted once the issue is rootcaused and a common solution
is found for both Rogue and SGX based GPU platforms.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index 98d30c5..55dad41 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -23,13 +23,17 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "7c9522a4147836064f582278e4f7115735c16868"
-
 PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
 "
 
+# Temporary work around to use a different SRCREV for SGX Mesa, vs Rogue Mesa
+# Idea is these two should be the same, but currently a segfault is happening
+# on certain platforms if the sgx commit is used.
+SRCREV = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', '7c9522a4147836064f582278e4f7115735c16868', '54fd9d7dea098b6f11c2a244b0c6763dc8c5690c', d)}"
+PR = "sgxrgx-${SRCREV}"
+
 PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
 PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
 PACKAGECONFIG[sgx] = "-Dgallium-sgx-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
-- 
1.8.3.1



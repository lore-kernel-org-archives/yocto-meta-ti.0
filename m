Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FBFC49EA1
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 20:45:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.4494.1722026731894159493
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 13:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AwuikRGh;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjVb4002037;
	Fri, 26 Jul 2024 15:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722026731;
	bh=uDY7WUGYanu9SndDzjVOr7x3G+oJXmSadwdu8hZNMj4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=AwuikRGhFbSFetN+2UVtA2BhsXhw44Z4SmK4mnSRs24ltRq6DVirGEte1RoGksHJV
	 e1EMZbrLQ4zr0AhcTQSea4/c88M05+3V74dtK3SpD9V1AqPkL5O+CUXIABX0fJMQcS
	 Q922FHIrxtLvsSGWuItBb7UZN/qgMf57ZPs7Q2/0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46QKjVNm015183
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Jul 2024 15:45:31 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Jul 2024 15:45:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Jul 2024 15:45:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjUeg095661;
	Fri, 26 Jul 2024 15:45:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sXRog-0002MV-Kt; Fri, 26 Jul 2024 15:45:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/4] ti-ipc-rtos: Disable buildpaths check
Date: Fri, 26 Jul 2024 15:45:27 -0500
Message-ID: <20240726204530.9033-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240726204530.9033-1-reatmon@ti.com>
References: <20240726204530.9033-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Jul 2024 20:45:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17909

The ti-cgt6x compiler is a custom TI compiler for the TI C6000
Digital Signal Processor(DSP) platform.  It does not currently
support reproducible builds and is provided via a binary blob
download that we cannot patch in the recipe to address the
issue.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 999993ea..b4d2e2fa 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -99,3 +99,14 @@ pkg_postinst:${PN}-fw:omapl138 () {
 pkg_postrm:${PN}-fw:omapl138 () {
   update-alternatives --remove rproc-dsp-fw ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674
 }
+
+# Disable the "buildpaths" check while we figure out how we are
+# going to address this issue.
+#
+# The ti-cgt6x compiler is a custom TI compiler for the TI C6000
+# Digital Signal Processor(DSP) platform.  It does not currently
+# support reproducible builds and is provided via a binary blob
+# download that we cannot patch in the recipe to address the
+# issue.
+INSANE_SKIP:${PN}-dev += "buildpaths"
+INSANE_SKIP:${PN}-fw += "buildpaths"
-- 
2.17.1



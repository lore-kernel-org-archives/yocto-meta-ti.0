Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F50C38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 23:11:09 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1030.1666739459376408403
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 16:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KGRPR5qY;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29PNAwc3028161;
	Tue, 25 Oct 2022 18:10:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666739458;
	bh=8uxpX+3MsjS9+wMAZJgnmBWGkvcT6pUGBBsCkGecsQU=;
	h=From:To:Subject:Date;
	b=KGRPR5qYrb6RPEzwrvJW6IASbWHf4tGMx39kbJjYqGYaRTY0Ax6dFRS0U1vwYSH0g
	 6qR87Lg7SeoZIWi4NffT+ytb5j+xz/AXBFA49OfJkqtpiZs92RTewFSnOMDhRgFV1k
	 nzt8WGzqEM14NO7zB5YslVNMiWqypGto7iDqLoSg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29PNAwBt006127
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Oct 2022 18:10:58 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 25
 Oct 2022 18:10:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 25 Oct 2022 18:10:57 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29PNAvbH097471;
	Tue, 25 Oct 2022 18:10:57 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1onT4T-0000Va-DK; Tue, 25 Oct 2022 18:10:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] cnm-wave-fw: update firmware name to wave521c_k3_codec_fw.bin
Date: Tue, 25 Oct 2022 18:10:57 -0500
Message-ID: <20221025231057.1913-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Oct 2022 23:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15200

update firmware name to wave521c_k3_codec_fw.bin to align with
linux-firmware main branch. the following patch is part of
ti-linux-firmware thru mainline sync.

commit 48407ffd ("cnm: update chips&media wave521c firmware.")

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index b5ad3e31..4c9c8d31 100644
--- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -20,10 +20,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 S = "${WORKDIR}/git"
 TARGET_WAVE521C = "wave521c_codec_fw.bin"
 
-SOURCE_WAVE521C = "wave521c_codec_fw.bin"
-SOURCE_WAVE521C_j721s2-evm = "wave521c_j721s2_codec_fw.bin"
-SOURCE_WAVE521C_j721s2-hs-evm = "wave521c_j721s2_codec_fw.bin"
-SOURCE_WAVE521C_j784s4-evm = "wave521c_j721s2_codec_fw.bin"
+SOURCE_WAVE521C = "wave521c_k3_codec_fw.bin"
 
 ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] = "${base_libdir}/firmware/${TARGET_WAVE521C}"
 ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGET_WAVE521C}"
-- 
2.17.1



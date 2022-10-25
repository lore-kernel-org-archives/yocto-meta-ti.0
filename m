Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9AAECDFA1
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 22:49:29 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.846.1666738163592942573
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 15:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qkRQfmhh;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29PMnKI1006318;
	Tue, 25 Oct 2022 17:49:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666738160;
	bh=YsFGPMyjyln01PVWrsg4LqK8FooVxi/t8X+mpqnbRN0=;
	h=From:To:CC:Subject:Date;
	b=qkRQfmhhd3zVvnAKR/Fl2I21cod/GONKp8jsSTGTg3hxHRl+kObrkEEycR3T0LIjR
	 o+rfnmwtZfkfWJNP5zGGuHJFKxmrscar6uGLdefF8YAbO6Pa+UeTzNv66O2AXIHd9T
	 BF4Y/FGCCGqjDM58zk0GKxhuV9aR5InNARrExbYM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29PMnKMm043863
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Oct 2022 17:49:20 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 25
 Oct 2022 17:49:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 25 Oct 2022 17:49:19 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29PMnJBG036456;
	Tue, 25 Oct 2022 17:49:19 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>
Subject: [dunfell PATCH] cnm-wave-fw: update firmware name to wave521c_k3_codec_fw.bin
Date: Tue, 25 Oct 2022 17:49:19 -0500
Message-ID: <20221025224919.17617-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Oct 2022 22:49:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15198

update firmware name to wave521c_k3_codec_fw.bin to align with
linux-firmware main branch. the following patch is part of
ti-linux-firmware thru mainline sync.

commit 48407ffd ("cnm: update chips&media wave521c firmware.")

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index b5ad3e31..75b8ce21 100644
--- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -21,9 +21,9 @@ S = "${WORKDIR}/git"
 TARGET_WAVE521C = "wave521c_codec_fw.bin"
 
 SOURCE_WAVE521C = "wave521c_codec_fw.bin"
-SOURCE_WAVE521C_j721s2-evm = "wave521c_j721s2_codec_fw.bin"
-SOURCE_WAVE521C_j721s2-hs-evm = "wave521c_j721s2_codec_fw.bin"
-SOURCE_WAVE521C_j784s4-evm = "wave521c_j721s2_codec_fw.bin"
+SOURCE_WAVE521C_j721s2-evm = "wave521c_k3_codec_fw.bin"
+SOURCE_WAVE521C_j721s2-hs-evm = "wave521c_k3_codec_fw.bin"
+SOURCE_WAVE521C_j784s4-evm = "wave521c_k3_codec_fw.bin"
 
 ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] = "${base_libdir}/firmware/${TARGET_WAVE521C}"
 ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGET_WAVE521C}"
-- 
2.17.1



Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8BEC83F04
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 15:41:06 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.27136.1751470859316806506
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Jul 2025 08:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=O9VqRPTp;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 562Fevxr3971925;
	Wed, 2 Jul 2025 10:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751470857;
	bh=lkiFpDPkioe+i98dyL++NTeU/+qUTgqt//l1JQHNe+o=;
	h=From:To:Subject:Date;
	b=O9VqRPTpyLsY5WRnrJ4SwUl8Ne3rKkFfjHT4K4Hkz47FtKASqMRNrDmOJ528x6jMJ
	 K07npeT555M2o3D2lJplisc8aQ/7hC99OdGlN7SYXjHtuOGLSdYIQzPdZ9UpZOwL0v
	 AMf+qwpvb8v1v6BeT/nM1joG1+TWejmf+qppR2Cg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 562Fevcs1408185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 2 Jul 2025 10:40:57 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 2
 Jul 2025 10:40:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 2 Jul 2025 10:40:56 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 562FevTi3409264;
	Wed, 2 Jul 2025 10:40:57 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uWzZw-0002rp-TY; Wed, 02 Jul 2025 10:40:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] trusted-firmware-a: Bump to latest SHA on upstream
Date: Wed, 2 Jul 2025 10:40:56 -0500
Message-ID: <20250702154056.10982-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 02 Jul 2025 15:41:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18761

We were waiting on a patch [1] to make it to master.  Now that it has, move
to point the SRCREV to the latest commit.

[1] https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a/+/b1bca91e93d421a9c142c93f38933e0aa5f4bf58

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index ec52d09c..07ace3c4 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -3,7 +3,7 @@
 PV = "2.13+git"
 
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa = "d90bb650fe4cb3784f62214ab5829f4051c38d0a"
+SRCREV_tfa = "e0c4d3903b382bf34f552af53e6d955fae5283ab"
 SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https"
 SRCBRANCH = "master"
 
-- 
2.17.1



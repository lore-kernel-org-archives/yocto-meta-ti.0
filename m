Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E315C77B6F
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 21:52:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.28861.1681249968231128722
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 14:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rxxFQH/w;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BLqk1g005780;
	Tue, 11 Apr 2023 16:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681249966;
	bh=Cd0/MPfHMZTvF2rxRtFc9k43luAYBJD+1fXdJqQ6EME=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rxxFQH/wYA7cT/QP6rkvGLDM1kpQjoVd9bOEqkzXRoTIIU5E2IlQPXBbB3RmN0OR6
	 3cFhXcFBXR1Kk6U+SubNW7Km76ikvowJjMmOrkum5ovRNk1coYHKVxyTCKsAbWgFoV
	 4SZzbLmdrreTqnvIy+IsdW8v+uQ6iepkbxqodhnE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BLqk9o017325
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 16:52:46 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 16:52:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 16:52:46 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BLqhUj006598;
	Tue, 11 Apr 2023 16:52:45 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v3 6/6] linux-ti-next: Update to v6.3-rc6 next version
Date: Tue, 11 Apr 2023 16:52:43 -0500
Message-ID: <20230411215243.18230-6-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411215243.18230-1-afd@ti.com>
References: <20230411215243.18230-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 21:52:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16365

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index 1e86ed97..9138c7c5 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -13,9 +13,9 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
 
 S = "${WORKDIR}/git"
 
-# 6.1.0-rc1+ version
-SRCREV = "4d48f589d294ddc5e01d3b0dc7cecc55324c05ca"
-PV = "6.1.0-rc1+git${SRCPV}"
+# 6.3.0-rc6+ version
+SRCREV = "009795d283d1f9f043e5a4ff97d4140cde17e2d3"
+PV = "6.3.0-rc6+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git;protocol=https;branch=master"
 
-- 
2.39.2



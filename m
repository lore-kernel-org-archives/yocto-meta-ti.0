Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A62C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:38:40 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.7295.1742420314953240654
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 14:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TdMcb5Iv;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLcSfH3031465
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Mar 2025 16:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742420308;
	bh=hjuCZdGlJ6BNQKTQGOVN7tk+cvuk2rpxGrkPygqRgIA=;
	h=From:To:CC:Subject:Date;
	b=TdMcb5IvcLtJC+jE9mF/pQclQxhG3nQkbgrS+MAMrYjJNcprBw4MPY/gLga/6FiYr
	 cQATuu5dZcORUb5y6HfEV/wKnGmCtqYNMrHkhs3s/lrtlit9jIs0VetUe8ZCF4cw9t
	 kofgbDRE12He8yrukHncJ8FzSUYd/unGAsDSWOIo=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLcT75099727
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Mar 2025 16:38:29 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 16:38:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 16:38:28 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JLcSDL039531;
	Wed, 19 Mar 2025 16:38:28 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <matthias.schiffer@ew.tq-group.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH] ti-sgx-ddk-km: rework preferred_target selection
Date: Wed, 19 Mar 2025 16:38:19 -0500
Message-ID: <20250319213819.955726-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Mar 2025 21:38:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18411

From: Randolph Sapp <rs@ti.com>

Bump SRCREV to include a patch that changes the way
compiler_preferred_target is selected for a given toolchain. This now
checks specified SYS_CFLAGS to see if hardfloat is set explicitly and
will override the default target selection if necessary.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 49376221..18b81d2f 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "f555b9e1ae4b2baf68ac778ca41dc0c17e96f89a"
+SRCREV = "9ae0fa4998b1c624408945e062bf8fb0ea7efb9d"
 
 TARGET_PRODUCT:omap-a15 = "ti572x_linux"
 TARGET_PRODUCT:ti33x = "ti335x_linux"
-- 
2.48.1



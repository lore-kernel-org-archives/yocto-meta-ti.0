Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A4CCCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 16:19:32 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.15563.1761322762251494677
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 09:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=waKxUpvL;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59OGJLO71922826;
	Fri, 24 Oct 2025 11:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761322761;
	bh=rxjmEcBQMn2lz6oRaBPLxFK72JszA6Xd3KwcbA2kwuk=;
	h=From:To:Subject:Date;
	b=waKxUpvLgLeLhUfaljS4VNLza0+Z+0hkNDZvK/LdckWKPg4a+Wpieu+NERi2JqSJN
	 77BnWwQ90h8R6ZxisLiLj6gvGRhktAXwlyiSdwCmiuVpBQp/Y8327+ZouPEYytSDbi
	 CAsd63gwK3HUtGHXjfNn9uzMJ48xF1HXfm6ihW1s=
Received: from DFLE210.ent.ti.com (dfle210.ent.ti.com [10.64.6.68])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59OGJKmc3692661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 11:19:21 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 11:19:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 11:19:20 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59OGJKw8593432;
	Fri, 24 Oct 2025 11:19:20 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vCKVc-0005qi-HE; Fri, 24 Oct 2025 11:19:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] am62axx: Add whitespace to append assignment
Date: Fri, 24 Oct 2025 11:19:20 -0500
Message-ID: <20251024161920.22445-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Oct 2025 16:19:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19176

Add missing whitespace on append assignment since the list is space
separated.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62axx.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
index bacee3a6..b66a2227 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -12,5 +12,5 @@ OPTEEMACHINE = "k3-am62x"
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
 
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  = "kernel-module-tps6594-i2c"
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  = "kernel-module-tps6594-i2c"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  = " kernel-module-tps6594-i2c"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  = " kernel-module-tps6594-i2c"
-- 
2.17.1



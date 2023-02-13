Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1931C636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 23:38:30 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.31478.1676331500635910492
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 15:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gdkWAzN/;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31DNcJ0E031657;
	Mon, 13 Feb 2023 17:38:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676331499;
	bh=+/PUYgAcojn1SiU9cHA+X98I1Gts+1dqw3EbbzXgOZ4=;
	h=From:To:Subject:Date;
	b=gdkWAzN/FgWdXsIrDiD+truyd81AHetknMsUVcxtIkpYU+yl2qBNIA4GdGsv6CYFT
	 VLUuqKT9nLJzg/Uc/m3YJMvkSxtKWiRC89FufU1TUpvjp7IeWmTmBgEbY+a63Ja1di
	 SUijqxYJwCWxRBXIeDLthiqSMT0aDwg4baqQEv3A=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31DNcJK7022857
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Feb 2023 17:38:19 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 13
 Feb 2023 17:38:18 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 13 Feb 2023 17:38:18 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31DNcIjg048495;
	Mon, 13 Feb 2023 17:38:18 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pRiOo-0003cX-Hp; Mon, 13 Feb 2023 17:38:18 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] ti-sci-fw: Add SYSFW_SUFFIX to sysfw.itb files
Date: Mon, 13 Feb 2023 17:38:18 -0600
Message-ID: <20230213233818.13878-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Feb 2023 23:38:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15828

With the advent of using multiconfigs to build all of the versions of
the machines (gp, hs-se, hs-fs, etc...) the sysfw.itb has become a point
of contention for do_deploy.  To resolve the duplicate file copy errors
from bitbake we need to uniquify the sysfw.itb file names.  So, let's do
the same thing we do with the tiboot3.bin file and add the SYSFW_SUFFIX
into the name.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 8278119c..274579a6 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -54,8 +54,8 @@ SYSFW_TIBOOT3 = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.bin"
 SYSFW_TIBOOT3_SYMLINK ?= "tiboot3.bin"
 
 SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 SYSFW_SYMLINK ?= "sysfw.itb"
 
 CFLAGS[unexport] = "1"
-- 
2.17.1



Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E231DC43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 17:20:16 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.113.1654708808560198874
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 10:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wfKPzXCN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 258HK33Y023809;
	Wed, 8 Jun 2022 12:20:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654708803;
	bh=hmsAulTGP80m4VxP2UFFSgWZFe9VMYeYFxYjX4I8Mpk=;
	h=From:To:CC:Subject:Date;
	b=wfKPzXCNXmmLnSIONXwIXm6qkxJE7YZ4cI0Cdaiyjmomydyo1SmsNDKL2LBmN4wjE
	 Xanwq8SgUyt6/IaQEzFF0ONZK+91NubbNkDfOIkSvOPkpp7fovRfsTvf9+X4f2kCBQ
	 J0Rc2prHMSSgWTkizOvGPpJ+4pUwvKUH/BcSk5jU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 258HK3xL015391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jun 2022 12:20:03 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Jun 2022 12:20:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 8 Jun 2022 12:20:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 258HK2B3008310;
	Wed, 8 Jun 2022 12:20:02 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH] linux-ti-mainline: Bump kernel version to
 v5.18
Date: Wed, 8 Jun 2022 12:19:58 -0500
Message-ID: <20220608171958.19272-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jun 2022 17:20:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14794

This adds up numerous fixes for various k3 platforms, adds platform such
as AM62x, J721S2.

While at it, bump the ti-upstream-tools repo as this sync up gives us:
- Switch over to 4k as default, configs needed for containers for k3 platforms
  among other config updates
- Enable fixes for various pinmuxes and overlays for system test images.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-mainline_git.bb  | 6 +++---
 recipes-kernel/linux/linux-ti-mainline_git.bb | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
index 4a5034fd048c..48c8bd4f440a 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -20,9 +20,9 @@ S = "${WORKDIR}/git"
 BRANCH = "master"
 TOOLS_BRANCH = "master"
 
-# 5.15 Mainline version
-SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
-PV = "5.15+git${SRCPV}"
+# 5.18 Mainline version
+SRCREV = "4b0986a3613c92f4ec1bdc7f60ec66fea135991f"
+PV = "5.18+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "b"
@@ -36,7 +36,7 @@ SRC_URI += " \
     file://defconfig \
 "
 
-SRCREV_ti-upstream-tools = "0f60697843bba6f8d721b14da92b1652563ccb95"
+SRCREV_ti-upstream-tools = "2536a656f0fb620bae9e3a0793a23caee0e11023"
 SRCREV_FORMAT = "linux"
 
 KERNEL_DEVICETREE = ""
-- 
2.31.1



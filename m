Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B612FC7EE2D
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 18:57:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1076.1685645868672643161
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Jun 2023 11:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GzJ2MiDt;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: bb@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 351Ivi9J019350;
	Thu, 1 Jun 2023 13:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685645864;
	bh=EYgo/X7UHAqFO37CGkTWOYk7ane7AtmHfh8W/c9PERg=;
	h=From:To:CC:Subject:Date;
	b=GzJ2MiDtpKTASnnUWrxBDzL7UXu3mtKcRZCUOmPL9/gxOSVC907z5dr+TfrK/mZbx
	 3TOa+9PnmLytv8OpkUl3y7BbjgQuawMXmh8v7I1SUMIWJx0R5wUS1jOAc2Qi86Bau+
	 edcAAX//l4R8KRsuBmyn7sIjE3vRs+hb+oDeb6cw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 351IviQE082769
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Jun 2023 13:57:44 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Jun 2023 13:57:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Jun 2023 13:57:43 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 351Ivhll117853;
	Thu, 1 Jun 2023 13:57:43 -0500
From: Bryan Brattlof <bb@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Andrew Davis <afd@ti.com>, Meta-TI <meta-ti@lists.yoctoproject.org>,
        Res
 Sapp <rs@ti.com>, Bryan Brattlof <bb@ti.com>
Subject: [meta-ti kirkstone/master PATCH] ti-kernel: Apply RT config fragments to RT kernel defconfig
Date: Thu, 1 Jun 2023 13:57:39 -0500
Message-ID: <20230601185739.2862707-1-bb@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=bb@ti.com; h=from:subject; bh=npkWJIM1M0fxAMfMZRM3aJ3JZLSOSb2WplkSocdA/o8=; b=owNCWmg5MUFZJlNZ9QuuqQAAY3///r9ZQm8t+/S3uz/PPZ0Pe3+/9V9erfv99f/8p/X9n22wA RrJSGjTQGgA0aGgGgMmgBoPSDTT1DRoBoAADRoNDRkAD0gHog9IbUHpqaaG0ag0eoYo0DQPUepo AAA0HqAGhkAGgA0DINA2k0Bo0PU0NDIBpiBpp6TRoAMho02psoZQ2U09Qwg0BoNBkGhk0GQ0aGg ZMEDTIZGmhoBhAyAaNGmjTQAGhiGJoZAACCODrgr7CBFxAya85ILEzBgayKFgObb97QGd5CZO47 AfyvgS1PybdPYIIOmjOwg8zOl3RGCyFTtAx0LFMAkeYdXEK+KPZ4RUzx7yaBn9EyjbkB+ga6uCv xlvmLgBXLFgfEHGLHx2C16AVsl6EV88NsNVaGpVmKjCaTiI6IItQpdA32kkKoNl3+mw1jQFlfqq 07TsbDsaU1yFrO7Uz7OyhMX5GDGXWqcp3WHgHWQQf2CFuputO356gUZiiPv/iKhP9wQg1I0XWbA AQuUWJ+Afz+MkSmvDOTgPNsWJu4vClihsNO+xEr0qGSk6pHJS/K8o0lPbI4Qka11Fvrn00EacOA NVqSYbIvfaQfRbE8Wt+DotkY1c3OoJ5IKC5Ce6h5b4TjIcEolwBClIoNkVa/G/eJMUlUBuQSSug 4wSOV6Ddnv8XckU4UJD1C66pA==
X-Developer-Key: i=bb@ti.com; a=openpgp; fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Jun 2023 18:57:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16646

For the v6.1 LTS kernel, we (TI) have moved to using defconfig fragments
to build the different kernel configurations. To properly build a kernel
with full preemption support, add the ti_arm64_rt.config to the
linux-ti-staging-rt-6.1/k3/defconfig

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 .../recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
index ef1d3efd50118..54dc86b407c7c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=defconfig
-config-fragment=kernel/configs/ti_arm64_prune.config
+config-fragment=kernel/configs/ti_arm64_prune.config kernel/configs/ti_arm64_rt.config

base-commit: 8fa9ec7dcd2e816cee18aaf7e8947b3eaee9923c
-- 
2.40.1



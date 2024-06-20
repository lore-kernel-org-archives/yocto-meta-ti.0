Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D473C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 08:31:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.42839.1718872309850145414
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 01:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZbvBAUd+;
 spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45K8VjnG076650;
	Thu, 20 Jun 2024 03:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718872305; i=@ti.com;
	bh=mCBLgFT2KiDDqyUkIyim7n9UGZbYdyEvKrUuawMUpbY=;
	h=From:To:Subject:Date;
	b=ZbvBAUd+GQ/5RLuAZXKGAbcOxNzJeeSD0MK8J0AwtymlBzXbJlbolrADTIscVa10G
	 s3/8aFbwUXwUPbwpaWN2SMx8crY3ekQkPyDmM3Zk5BMa8/c5fw5clE+QWsURtdA+fF
	 ec+uIjnVhRvdh+MIOZ2S4ICu4klt8n0T5WJsS3e0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45K8VjIh053708
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 03:31:45 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 03:31:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 03:31:45 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45K8Vjar093856;
	Thu, 20 Jun 2024 03:31:45 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 12F5010AC0C7; Thu, 20 Jun 2024 03:31:45 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202406200100
Date: Thu, 20 Jun 2024 03:31:45 -0500
Message-ID: <1718872305-56441-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 08:31:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17773

Updated the value(s) for:
  u-boot-ti-staging_2024.04: SRCREV
  linux-ti-staging-rt_6.6: SRCREV
  linux-ti-staging_6.6: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index 13f6179..9ed4a74 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2024.04"
 
-SRCREV = "7bdcacf9f50caac83f121e65fffeb7a0f9b452fd"
+SRCREV = "70e054f85f98a0f255ba308c54b16e0557bc8af1"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
index 6122cba..ed22fbb 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
@@ -8,7 +8,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
 
 BRANCH = "ti-rt-linux-6.6.y"
 
-SRCREV = "eeca5715c9a5b742423bd83ed587fac26268771c"
+SRCREV = "8410a9e2cda1f2da2b24de65d8651984c507ab01"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index e129eb1..585bdba 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.6.y"
 
-SRCREV ?= "8086474caf5dc2570a947669acf226d319cd0651"
+SRCREV ?= "28ca41014f923e6e0e314492899b7cda49439c39"
 PV = "6.6.32+git"
 
 KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
-- 
1.8.3.1



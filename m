Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C10AC3DA49
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 04:09:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.85553.1722571776230382774
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 21:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mtcwi5h4;
 spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47249ZMB078916;
	Thu, 1 Aug 2024 23:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722571775; i=@ti.com;
	bh=BCq3sXI4M325ecOF7r8VxGdDZGDd3ux0kGhlosukmaM=;
	h=From:To:Subject:Date;
	b=mtcwi5h4//cr6MJ8xJKgFLAinJ5gAArGVJN0k1zRIJSPRDNXoYgsKj3ln8ImgpPtE
	 AiuaZ+esSsTpHzeJwsoD0yXNKSyiuNp/JzDICr6ehIKgM0lLSXu7Tij8/+6vn3jto/
	 7K7F55MTQ9Mj+AFydzB7xmUUBDWRh9cHuaSx/Lc8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47249ZsW022084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Aug 2024 23:09:35 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Aug 2024 23:09:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Aug 2024 23:09:34 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47249Yfc011029;
	Thu, 1 Aug 2024 23:09:34 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id A892A11124C9; Thu,  1 Aug 2024 23:09:34 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202408011846
Date: Thu, 1 Aug 2024 23:09:34 -0500
Message-ID: <1722571774-59189-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Aug 2024 04:09:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17916

Updated the value(s) for:
  u-boot-ti-staging_2024.04: SRCREV
  linux-ti-staging-rt_6.6: SRCREV
  linux-ti-staging_6.6: SRCREV

Changelogs:
  u-boot-ti-staging_2024.04: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=1a74648ab378f8c14ae6fc3a4f11ed3ad1ad7126..818c76aed67f94059b9ebb94d237418802620b81
  linux-ti-staging-rt_6.6: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=e1ea7912c2045eaea586cb12cc63b6280e2a6c35..f9bceb7343387ac6fab003518f1cd31987d6eb05
  linux-ti-staging_6.6: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=a816c5abf3307f42e308a1fe13bd72244f37ec86..db88712931433e92a5f73cec57c82c5c7ebee593

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index 7949ddf..a873488 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2024.04"
 
-SRCREV = "1a74648ab378f8c14ae6fc3a4f11ed3ad1ad7126"
+SRCREV = "818c76aed67f94059b9ebb94d237418802620b81"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
index 500e28b..29607b2 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
@@ -8,7 +8,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
 
 BRANCH = "ti-rt-linux-6.6.y"
 
-SRCREV = "e1ea7912c2045eaea586cb12cc63b6280e2a6c35"
+SRCREV = "f9bceb7343387ac6fab003518f1cd31987d6eb05"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index ba70f9e..341a4cc 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.6.y"
 
-SRCREV ?= "a816c5abf3307f42e308a1fe13bd72244f37ec86"
+SRCREV ?= "db88712931433e92a5f73cec57c82c5c7ebee593"
 PV = "6.6.32+git"
 
 KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
-- 
1.8.3.1



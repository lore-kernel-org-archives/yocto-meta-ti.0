Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E457BC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 03:08:22 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.5641.1651115298116706858
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 20:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Gz67u/Rz;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23S389IB117420;
	Wed, 27 Apr 2022 22:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651115289;
	bh=WaWyMgBnlC1Et/KlnyCQAgc4BSAeQNUTreO7F21zt+A=;
	h=From:To:CC:Subject:Date;
	b=Gz67u/RzEFaZRIgz+jeEpF0KVeP74t6xQ5dLftD/udt9N9+JOYYuH8g4FyM/4YxJ0
	 h8LSDm7EL2Asfl2aOsZeqxVbweBGKLUdVp8EUgHY/VPw7AU/FHwTYwX1ri7ngEHMdD
	 9dawXmBcN1nvwD9ArONdXlh/dO+yDa9TNrvVNA04=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23S389gc010029
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Apr 2022 22:08:09 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 22:08:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 22:08:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23S388M8030892;
	Wed, 27 Apr 2022 22:08:08 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <devarsht@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <nikhil.nd@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>,
 <a-m1@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [PATCH] recipes-kernel: setup-defconfig: Use SRCPV to update
 KERNEL_LOCALVERSION
Date: Wed, 27 Apr 2022 22:08:05 -0500
Message-ID: <20220428030805.18623-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Apr 2022 03:08:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14627

Due to recent security update[1] in git, a subprocess will be unable
to not able to run git rev-parse to fetch revision.

So instead, use the SRCPV to parse the short commit ID and set the
KERNEL_LOCALVERSION variable.

[1] https://github.blog/2022-04-12-git-security-vulnerability-announced/

Inspired-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 recipes-kernel/linux/setup-defconfig.inc | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index 850a1dd8d613..1e97acc0ee63 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -1,14 +1,6 @@
 # KERNEL_LOCALVERSION can be set to add a tag to the end of the
 # kernel version string.  such as the commit id
-def get_git_revision(p):
-    import subprocess
-
-    try:
-        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE, universal_newlines=True).communicate()[0].rstrip()
-    except OSError:
-        return None
-
-KERNEL_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
+KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
 
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
-- 
2.31.1



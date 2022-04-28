Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FF7C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 03:14:52 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5685.1651115687874241483
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 20:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=itgmU+CL;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23S3Eja5079148;
	Wed, 27 Apr 2022 22:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651115685;
	bh=kKhWEk4yjY6Tdjjzzcx8Ws3Rpx4j5cwbq0IHdrFuS5o=;
	h=From:To:CC:Subject:Date;
	b=itgmU+CL/9Upw/XkaN6pyNWZR2HJKJZFbX8k1OU+8LRrX46HsH/kOhxKu8ghPAEUj
	 mK4rv0lDyuCegS/c3cI/YBy7+hlB3asdsr4xeAYrQLURjgtoWHq0j9DCAQ5Zj+630M
	 KU0wytcJFKXKJgDCgHnkjWO2RZHHWZzJRVLwp9e8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23S3Ejcw093505
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Apr 2022 22:14:45 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 22:14:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 22:14:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23S3Ei5l071546;
	Wed, 27 Apr 2022 22:14:44 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <devarsht@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <nikhil.nd@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>,
 <a-m1@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [dunfell PATCH V2] recipes-kernel: setup-defconfig: Use SRCPV to
 update KERNEL_LOCALVERSION
Date: Wed, 27 Apr 2022 22:14:43 -0500
Message-ID: <20220428031443.21064-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Apr 2022 03:14:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14631

Due to recent security update[1] in git, a subprocess will be unable
to run git rev-parse to fetch revision.

So instead, use the SRCPV to parse the short commit ID and set the
KERNEL_LOCALVERSION variable.

[1] https://github.blog/2022-04-12-git-security-vulnerability-announced/

Inspired-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
* Update to commit message and subjectline.

V1: https://lore.kernel.org/all/20220428030805.18623-1-nm@ti.com/

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



Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C2AC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 03:09:02 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5634.1651115316398042529
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 20:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LYUHctxN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23S38UD2087587;
	Wed, 27 Apr 2022 22:08:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651115310;
	bh=L3YqbKiFb63phLkjfHCCTj03biIXmhaNelsI7SxQ6dI=;
	h=From:To:CC:Subject:Date;
	b=LYUHctxNbWCO5icaSIt14+0qC6xrV2Ii1AM9ey9njiDSRqRJkLGvdnfzXScVmgqvQ
	 OQbShhVNOG1EZh8ePOSBVBBUwyH04hJUgfs7hqbYsSAarrRjgqMeMkNOKhIHaIzOIP
	 GELmizVKKLra6GTElRvfAUTg7u1kpWus9IdrkWdc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23S38UkN035317
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Apr 2022 22:08:30 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 22:08:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 22:08:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23S38UOS031208;
	Wed, 27 Apr 2022 22:08:30 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <devarsht@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <nikhil.nd@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>,
 <a-m1@ti.com>,
        Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] u-boot-ti: Use SRCPV instead of SRCREV for
 U_BOOT_LOCAL_VERSION
Date: Wed, 27 Apr 2022 22:08:28 -0500
Message-ID: <20220428030828.18705-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Apr 2022 03:09:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14628

SRCREV works with fixed commits, but when we use AUTOREV for a
downstream distro bbappend, we will end up getting a bad local
revision.

Lets use SRCPV instead, which bitbake already deals with sensibly.

[1] https://www.yoctoproject.org/docs/2.5.1/dev-manual/dev-manual.html#automatically-incrementing-a-binary-package-revision-number

Fixes: 39fa0c1d3d02 ("u-boot-ti: Use SRCREV to get short commit ID")
Suggested-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
I think we had a case of dunfell updated with a partial fix.

as discussed in review of the original patch:
https://lore.kernel.org/all/20220427144355.GK9834@denix.org/
a) we should have used SRCPV that deals with AUTOREV better
b) we should have fixed the kernel rev as well.. which is broke as well
(follow on patch)

 recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index cc775e2e271c..903c61f09004 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -1,6 +1,6 @@
 # UBOOT_LOCALVERSION can be set to add a tag to the end of the
 # U-boot version string.  such as the commit id
-UBOOT_LOCALVERSION = "-g${@d.getVar("SRCREV", False).__str__()[:10]}"
+UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
 
 UBOOT_SUFFIX ?= "img"
 SPL_BINARY ?= "MLO"
-- 
2.31.1



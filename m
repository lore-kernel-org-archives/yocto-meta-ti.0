Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F4EE77191
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:54:06 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.139696.1734645245040392129
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KYL8bv7W;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs3rI368401
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 15:54:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645243;
	bh=58kHLiVmPtVTMcLmOoLNIeUt++yhJkBDCc1mjUsvFNc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KYL8bv7WH/71cB9IMirwQ/EtGAlenjSp2HNHXWl/S4lICngiQWQwdOTLejsf/rHND
	 UlQGsncmlkUspIgfc2F6Qu33pwKQCo21heEcJSCz7Zky3ERhtWLmGS95kYgYJNtQ6p
	 sdspgy6SIhHE/gqEC95MhWpkfp8hTKI7nZRF3g+w=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs3ar071262
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:54:03 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:54:03 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs3uJ066804;
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOT5-0007Zn-Cw; Thu, 19 Dec 2024 15:54:03 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 08/13] linux-bb.org: update Beagle BSP to 6.1.83
Date: Thu, 19 Dec 2024 15:53:57 -0600
Message-ID: <20241219215402.28324-9-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219215402.28324-1-reatmon@ti.com>
References: <20241219215402.28324-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 21:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18153

From: Denys Dmytriyenko <denys@konsulko.com>

Update Beagle BSP to the latest 6.1.83 kernel version.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/linux/linux-bb.org_git.bb     | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_git.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_git.bb
index ef79bfb7..986eda68 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_git.bb
@@ -52,14 +52,14 @@ PB-MIKROBUS-1.dtbo \
 
 S = "${WORKDIR}/git"
 
-# 6.1.80 version for 32-bit
-SRCREV:armv7a = "4ca9ea30768d58c8d4d56d03dd1eaf8c8feb7ef9"
-PV:armv7a = "6.1.80+git"
-BRANCH:armv7a = "v6.1.80-ti-r34"
+# 6.1.83 version for 32-bit
+SRCREV:armv7a = "be9b910b08dfd674e47a2643f35080b005ac3792"
+PV:armv7a = "6.1.83+git"
+BRANCH:armv7a = "v6.1.83-ti-r35"
 
-# 6.1.80 version for 64-bit
-SRCREV:aarch64 = "977c75e082620f15c06c72bcced30f787c14b390"
-PV:aarch64 = "6.1.80+git"
-BRANCH:aarch64 = "v6.1.80-ti-arm64-r49"
+# 6.1.83 version for 64-bit
+SRCREV:aarch64 = "135558243d5a98ed39812b797d2ba6295ef3b86a"
+PV:aarch64 = "6.1.83+git"
+BRANCH:aarch64 = "v6.1.83-ti-arm64-r64"
 
 KERNEL_GIT_URI = "git://github.com/beagleboard/linux.git"
-- 
2.17.1



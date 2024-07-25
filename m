Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE45C3DA49
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 11:37:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.34155.1721907435796831066
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jul 2024 04:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gFBXrkoy;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46PBb9nV004750;
	Thu, 25 Jul 2024 06:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721907429;
	bh=cztMELpIWCcFYXEbpKCEx3O6kfC3R+U2C7FIXhqETOQ=;
	h=From:To:CC:Subject:Date;
	b=gFBXrkoy3GHkKiEpimjFoNBXlrQBeJZh/YHN2IedpsFo94PNBS6fF0/IIWaPcrbV6
	 CMY3qc9YcS6y8zq+PWhV3AWWuXR1LUfoloDQjHug8kBKr/Y1N6RVGT66UcZt9RScoN
	 9f4XLbYczfW8YBltC8uRp6qyO+PCSaZRdQwBAwcU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46PBb9u7106368
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Jul 2024 06:37:09 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Jul 2024 06:37:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Jul 2024 06:37:09 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46PBb9kq111229;
	Thu, 25 Jul 2024 06:37:09 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Daniel Schultz <d.schultz@phytec.de>, Praneeth Bajjuri <praneeth@ti.com>,
        meta-ti <meta-ti@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [meta-ti][master/scarthgap/kirkstone] [PATCH] meta-ti-extras: recipes-multimedia: libdce: Fix libdce SRC_URI
Date: Thu, 25 Jul 2024 06:37:03 -0500
Message-ID: <20240725113703.877552-1-nm@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Texas Instruments, Inc.
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jul 2024 11:37:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17907

omapzoom has been down since a long time. Point the repository to the
mirror in git.ti.com

Reported-by: Daniel Schultz <d.schultz@phytec.de>
Signed-off-by: Nishanth Menon <nm@ti.com>
---

Daniel: please test and report if this resolves the downstream distro
build errors seen.

 meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
index 54f6ff8a6630..f46d9c77fc6a 100644
--- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
+++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
@@ -6,7 +6,8 @@ inherit autotools pkgconfig
 
 DEPENDS = "libdrm ti-ipc"
 
-SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git;branch=master"
+SRC_URI = "git://git.ti.com/git/omapzoom/libdce.git;protocol=https;branch=master"
+
 SRCREV = "ec14e1d5cea1ed3c3ea0e2b9cf1fd581acff93e3"
 
 S = "${WORKDIR}/git"

base-commit: c57b63147d2ac0dde16e43f7407d0ff50e62efdb
-- 
2.43.0



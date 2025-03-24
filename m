Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F8DC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 18:46:25 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.47434.1742841976088505611
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Mar 2025 11:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EOlLGsf9;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52OIkEZm1023897
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Mar 2025 13:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742841974;
	bh=VZhZ6mikrnS/0aFzkxDbIyl53HAfXP1l+g5OgIjc5cc=;
	h=From:To:Subject:Date;
	b=EOlLGsf9QboNRZbfN5VVMdQIOGq6KRUa2lYT8MmMDrDMkAmSungmlbPKhpRO6y9/Q
	 H1GS09roRG4ZaO+47mP0Q9Bm0vmTOkORBQAKoJDBVE9Sa7WoOPRbknv0PhyR/1WwAg
	 EOGOFI/GV0PTeUoQXB4f0DeDcU+lE9JhuJtLIZP8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52OIkEaf023430
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Mar 2025 13:46:14 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Mar 2025 13:46:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Mar 2025 13:46:14 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52OIkDZk034813;
	Mon, 24 Mar 2025 13:46:13 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1twmoP-0007VR-OU; Mon, 24 Mar 2025 13:46:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] ti-linux-fw: Split out SRC_URI into variables
Date: Mon, 24 Mar 2025 13:46:13 -0500
Message-ID: <20250324184613.28811-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Mar 2025 18:46:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18420

To facilitate better testing we need to control all aspects of the
SRC_URI.  Create TI_LINUX_FW_GIT_URI, TI_LINUX_FW_GIT_PROTOCOL, and
TI_LINUX_FW_GIT_BRANCH and build SRC_URI using them.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 2aad1c03..1a2c540f 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -22,7 +22,11 @@ SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-SRC_URI = "git://git.ti.com/git/processor-firmware/ti-linux-firmware.git;protocol=https;branch=${BRANCH}"
+TI_LINUX_FW_GIT_URI ?= "git://git.ti.com/git/processor-firmware/ti-linux-firmware.git"
+TI_LINUX_FW_GIT_PROTOCOL ?= "https"
+TI_LINUX_FW_GIT_BRANCH ?= "branch=${BRANCH}"
+
+SRC_URI = "${TI_LINUX_FW_GIT_URI};protocol=${TI_LINUX_FW_GIT_PROTOCOL};${TI_LINUX_FW_GIT_BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1



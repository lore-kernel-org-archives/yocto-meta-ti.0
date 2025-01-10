Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DD6E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 21:13:42 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.2172.1736543618643335816
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 13:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tA9x2fXo;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50ALDSSE3084870
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 Jan 2025 15:13:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736543608;
	bh=6DY6UzLIX7fDAt0ByOv6yzEICPl0TsAHIayk2+RYkeg=;
	h=From:To:Subject:Date;
	b=tA9x2fXoKhh9IME5WueEgo/UtevZpwLird2GxRfFMO3oq0Msr4j+p42noD26tx0eC
	 HNgix641ajOtm8PAteakJsuG2aclUNfMg8dbCWt9iz+/8xbANm0I+gy9nUBxJ9tYe7
	 MCfQtHOwafYwP5EZHZBD5Ub3GiNqml/LLzkwyrmw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50ALDSCS082731;
	Fri, 10 Jan 2025 15:13:28 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 15:13:28 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 15:13:28 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50ALDSBj038653;
	Fri, 10 Jan 2025 15:13:28 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tWMJs-0002jz-DY; Fri, 10 Jan 2025 15:13:28 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] ipumm-fw: Disable buildpaths check
Date: Fri, 10 Jan 2025 15:13:28 -0600
Message-ID: <20250110211328.9224-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Jan 2025 21:13:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18186

The ti-cgt-arm compiler is a custom TI compiler.  It does not
currently support reproducible builds and is provided via a
binary blob download that we cannot patch in the recipe to
address the issue.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 8d066eb0..87f63750 100644
--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -65,3 +65,12 @@ ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/${TARGE
 ALTERNATIVE_PRIORITY = "20"
 
 FILES:${PN} += "${nonarch_base_libdir}/firmware/*"
+
+# Disable the "buildpaths" check while we figure out how we are
+# going to address this issue.
+#
+# The ti-cgt-arm compiler is a custom TI compiler.  It does not
+# currently support reproducible builds and is provided via a
+# binary blob download that we cannot patch in the recipe to address
+# the issue.
+INSANE_SKIP:${PN} += "buildpaths"
-- 
2.17.1



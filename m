Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1FFC00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 16:33:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.8973.1659717194365446835
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Aug 2022 09:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=COprQily;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 275GXBI0078065;
	Fri, 5 Aug 2022 11:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659717191;
	bh=/57nRzkUM4SP8ZwL4Y4GfG40qYqyXUu+N5Yt+pPdiQI=;
	h=From:To:CC:Subject:Date;
	b=COprQily3kl9xsS5YEr03YsGXNw+JYRdZKfL6dfwY5ZRzTvsRFBzKiMxJF/zI23g3
	 fiQfd1yAt2bMmpMjuc/HehMeiD/o6emdi74KWLjtowlHwfHSjG97kUeIJ9EnoAPAbP
	 FlTL+vAr6ak6TlKjP1Xa2GK9gQJJRCljd2DOYGs0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 275GXBeO062269
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Aug 2022 11:33:11 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 5
 Aug 2022 11:33:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 5 Aug 2022 11:33:11 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 275GXAas014135;
	Fri, 5 Aug 2022 11:33:10 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH] ti-sci-fw: Only deploy the raw SYSFW images
 for one machine target
Date: Fri, 5 Aug 2022 11:33:10 -0500
Message-ID: <20220805163310.8354-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Aug 2022 16:33:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14935

This recipe deploys the raw SYSFW unconditionally which causes issues
when doing multiconfig builds. What should happen is only one deploys
these, select that the same way we select which one deploys the default
SYSFW symlink. Move the deploy step there.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 72a3120e..841fe16a 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -99,6 +99,7 @@ do_deploy () {
 		ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
 		if [ ! -z "${SYSFW_SYMLINK}" ]; then
 			ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_SYMLINK}
+			install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 		fi
 	fi
 
@@ -106,10 +107,9 @@ do_deploy () {
 		install -m 644 ${WORKDIR}/imggen/${SYSFW_TIBOOT3} ${DEPLOYDIR}/${SYSFW_TIBOOT3}
 		if [ ! -z "${SYSFW_TIBOOT3_SYMLINK}" ]; then
 			ln -sf ${SYSFW_TIBOOT3} ${DEPLOYDIR}/${SYSFW_TIBOOT3_SYMLINK}
+			install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 		fi
 	fi
-
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
 addtask deploy before do_build after do_compile
-- 
2.36.1



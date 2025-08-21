Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F137BCA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:52:14 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1548.1755795126930797322
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 09:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PWu5Esqy;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LGq5jY528349;
	Thu, 21 Aug 2025 11:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755795125;
	bh=O05PJPpGY+EVRHpbGWU+2n7nzasNFKkUtifWu2kCdBM=;
	h=From:To:Subject:Date;
	b=PWu5Esqy+K+haB3WUpdnlfZljnYCv0YQKikD6PPCEDY/bD2F8MuwHdS+8rD+rEadz
	 PpFL7mnjcESHSwdmc3x5X0WVWh/IL3zIh+bTQCDWtoaHl6oRA9ibJVkm0plDnjlFlb
	 my1Q316HiJjyFFfUV1BaUOjd0Kk96o8ZePg6SBps=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LGq5UR2958680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 11:52:05 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 11:52:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 11:52:05 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LGq54o2465631;
	Thu, 21 Aug 2025 11:52:05 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1up8WC-0007B4-S8; Thu, 21 Aug 2025 11:52:04 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] ti-ipc-examples-linux: Add missing SUMMARY
Date: Thu, 21 Aug 2025 11:52:04 -0500
Message-ID: <20250821165204.27550-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 16:52:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18956

The PRC script missed this.  All recipes need a SUMMARY.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
index 0b6c01fe..4a9481fe 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "TI Inter Processor Communication (IPC) MessageQ Application for Linux Host"
+SUMMARY = "TI IPC MessageQ Application for Linux Host"
 
 require recipes-ti/ipc/ti-ipc-common.inc
 require ti-ipc-rtos.inc
-- 
2.17.1



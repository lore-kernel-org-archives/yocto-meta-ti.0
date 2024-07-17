Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031D3C3DA59
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 00:49:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5085.1721177334929053252
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 17:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IeVc+7J4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46H0ms8C055732;
	Tue, 16 Jul 2024 19:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721177334;
	bh=UUwr7DxTHqyr1CtIGvenFbsH0H58WeF4q0DoctWd5SM=;
	h=From:To:Subject:Date;
	b=IeVc+7J49U9MxWlbwDbVveJ7smigeYPnzmc7HeceOaAWh+lWWH9t39lWsk0N6EeMM
	 FhdoRshZ6+nLGNRDLM+uB0/NFrhBd+dNq8txTpspQX00N2YPXd+HyZkZ+F3of7PVY1
	 BIX01W6kTlgb5I1+QGl7Id4Gq42BgL3dmgDEU1uQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46H0ms36019336
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 19:48:54 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 19:48:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 19:48:53 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46H0mrVq034914;
	Tue, 16 Jul 2024 19:48:53 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sTsqj-0004nz-G2; Tue, 16 Jul 2024 19:48:53 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] ti-ipc: Fix "buildpaths" QA error
Date: Tue, 16 Jul 2024 19:48:53 -0500
Message-ID: <20240717004853.18430-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Jul 2024 00:49:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17872

Referring to the TI specific kernel header file via -I${UNPACKDIR}
causes a "buildpaths" QA error.  Solution is to tell gcc to map the host
directory to a target directory using -fdebug-prefix-map

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Switch to using -fdebug-prefix-map instead of the copy hack I was
trying before.

 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
index 11be09ea..431f245f 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
@@ -18,7 +18,7 @@ SRC_URI += "file://tiipclad-daemon.sh \
             file://0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch \
            "
 
-CFLAGS += "-I${UNPACKDIR}"
+CFLAGS += "-I${UNPACKDIR} -fdebug-prefix-map=${UNPACKDIR}=${TARGET_DBGSRC_DIR}"
 
 DAEMON = "UNKNOWN"
 DAEMON:dra7xx = "lad_dra7xx"
-- 
2.17.1



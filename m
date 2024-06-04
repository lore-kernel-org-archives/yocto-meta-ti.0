Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDCBC27C52
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 15:41:11 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.25042.1717515667001138955
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 08:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=t6EBLqPH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454Ff6bT076079;
	Tue, 4 Jun 2024 10:41:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717515666;
	bh=5F9s2vt/DX0TtuRoJ183FGnw81+FSlv4gzLtLyR8H3k=;
	h=From:To:Subject:Date;
	b=t6EBLqPHrd3MPs5Bg2fvqOlu8KFONjPX/aBpKJgGZ0ZGw0IGk7EJomDRK2L5ad2Rv
	 TZIN1/K21BwRL1YghCWFEutElz7u29zY40f6mV5gPMsPWiZzufXVgqUlc/E74Ggxfb
	 Z8Mv4MN26tNBQWd55l+VJvGa6evZBCCmBHiZimOU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454Ff6l6115117
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 10:41:06 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 10:41:05 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 10:41:05 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454Ff5ix064230;
	Tue, 4 Jun 2024 10:41:05 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sEWHZ-0003Gu-KJ; Tue, 04 Jun 2024 10:41:05 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] gdbc6x: Update to UNPACKDIR for files going into WORKDIR
Date: Tue, 4 Jun 2024 10:41:05 -0500
Message-ID: <20240604154105.12537-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Jun 2024 15:41:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17693

For recipes that have file:// in SRC_URI, the files are placed into
WORKDIR.  Moving forward [1], that directory will be UNPACKDIR and
eventually move to somewhere other than WORKDIR.  So update all
references to WORKDIR that are looking for these file to use UNPACKDIR
instead.

[1] https://git.openembedded.org/openembedded-core/commit/?id=e022d62ba917790af2121da57646271ef17c03fa

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
index 012136ac..1f296dc5 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -36,7 +36,7 @@ do_install () {
     cp -rf ${S}/install_gdb/include/* ${D}${includedir}
 
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/gdbserverproxy
+    install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/gdbserverproxy
 }
 
 RDEPENDS:${PN} = "gdbserverproxy-module-drv bash"
-- 
2.17.1



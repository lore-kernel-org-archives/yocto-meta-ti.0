Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B77BC77B6E
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 19:28:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.168215.1680809330908143087
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 12:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sv9+16sq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 336JSnbL075660;
	Thu, 6 Apr 2023 14:28:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680809329;
	bh=NHBoqzGppXQ580Yss3A4IBk5EV/wbaHxcHz8ww2ukn4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sv9+16sqbEVWfV+V53f7DXJMSP/qMZXe/pF0Da5PS1dWIdnGGdJ+TZumtOhMMI9zk
	 aaH5iQ/fJEoSqbmGadQcJqmV5engbOOxvJzlejuKXFbjqx6M7cgdfvVPe33YA5zddg
	 5Q65q+AfhCTJ8CWx0VCM63uvG/k7uwJ+ZRjcMAYM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 336JSnnF067405
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Apr 2023 14:28:49 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 6
 Apr 2023 14:28:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 6 Apr 2023 14:28:48 -0500
Received: from lelv0854.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 336JSm3K012041;
	Thu, 6 Apr 2023 14:28:48 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/5] ti-sgx-ddk-um: Remove no longer needed CLEANBROKEN and INSANE_SKIPs
Date: Thu, 6 Apr 2023 14:28:44 -0500
Message-ID: <20230406192847.7934-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406192847.7934-1-afd@ti.com>
References: <20230406192847.7934-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Apr 2023 19:28:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16306

The "clean" target has been fixed along with some other issues that
caused us to need these set. Remove them now.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb  | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 9ea3add7..755cc4f5 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -67,7 +67,5 @@ FILES:${PN} +=  "${sysconfdir}/*"
 FILES:${PN} +=  "${datadir}/*"
 FILES:${PN} += "${nonarch_base_libdir}/udev/rules.d"
 
-INSANE_SKIP:${PN} += "dev-so ldflags useless-rpaths"
-INSANE_SKIP:${PN} += "already-stripped dev-deps"
-
-CLEANBROKEN = "1"
+INSANE_SKIP:${PN} += "ldflags"
+INSANE_SKIP:${PN} += "already-stripped"
-- 
2.39.2



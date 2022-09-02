Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB404C6FA82
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 20:13:17 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.3257.1662149593725219334
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Sep 2022 13:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QqeiSyLq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 282KDCuj025408
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Sep 2022 15:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662149592;
	bh=eySp/RaixjkZeFhJnZgtJc3/klDDTbA2rqzaICzhFno=;
	h=From:To:CC:Subject:Date;
	b=QqeiSyLq+6d+OEw0DRjH/7jSBkJEA0IYhZGGpOwtSCFVj4lfsBsFGmBjrRUa2dtcc
	 o0PUZYC8Z8AyNwMmyULVM0vIn0ZvMK0GZop9izMgv6utu5u0as5Lt0G3qhE5lerH9U
	 2C8VNNL3pnu3p34DCDFh30OhdXysZAcd+ELqeSbM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 282KDClK007961
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Sep 2022 15:13:12 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 2 Sep
 2022 15:13:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 2 Sep 2022 15:13:12 -0500
Received: from res.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 282KDCgQ003256;
	Fri, 2 Sep 2022 15:13:12 -0500
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [dunfell][PATCH] ti-sci-fw: Use d.getVar() in DEPENDS expression
Date: Fri, 2 Sep 2022 15:12:47 -0500
Message-ID: <20220902201247.605908-1-rs@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Sep 2022 20:13:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14991

Switch the DEPENDS_append expression to use d.getVar() instead of the
usual variable expansion to prevent the inline Python command from
becoming mangled.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 3986af47..2a59e896 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -9,7 +9,7 @@ DEPENDS_remove_am65xx-hs-evm-k3r5-sr2 = " virtual/bootloader"
 DEPENDS_remove_j7-evm-k3r5 = " virtual/bootloader"
 DEPENDS_remove_j7-hs-evm-k3r5 = " virtual/bootloader"
 DEPENDS_remove_j7-hs-evm-k3r5-sr1-1 = " virtual/bootloader"
-DEPENDS_append = " ${@ '' if '${TI_SECURE_DEV_PKG_K3}' else 'ti-k3-secdev-native' }"
+DEPENDS_append = " ${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else 'ti-k3-secdev-native' }"
 
 CLEANBROKEN = "1"
 PR = "${INC_PR}.2"
-- 
2.25.1



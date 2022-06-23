Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353D8C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 18:10:56 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.347.1656007849175906446
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 11:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HSfvCsts;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25NIAmvK063207;
	Thu, 23 Jun 2022 13:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656007848;
	bh=4kP0Fh255wATJlEqY7wahC0Cb7fJ1qJy4iJ7CH9WEs8=;
	h=From:To:Subject:Date;
	b=HSfvCstszXCuRVgM49bzYddjYULJErLbAne+gyYNB19XduIGsHzLj1EbdfpOhciG8
	 6wcAbcjglICPpIW7/pvTFmF/EMSI40qXDDrxvf4CABicpC8zNYUqzp5xltyYyplozP
	 XdjMg33HBltjoZQ6ARtLmhLYnzNFoa/2fj6nAUTg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25NIAlNc122280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jun 2022 13:10:47 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Jun 2022 13:10:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 23 Jun 2022 13:10:47 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25NIAl7q008539;
	Thu, 23 Jun 2022 13:10:47 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o4RHz-0007VX-8P; Thu, 23 Jun 2022 13:10:47 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] conf: machine: wic: Fix j721s2-hs-evm image
 boot partition
Date: Thu, 23 Jun 2022 13:10:47 -0500
Message-ID: <20220623181047.28818-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jun 2022 18:10:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14842

This patch is to align with a recent change to how the HS platforms
are setup in the /boot partition.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/machine/j721s2-hs-evm.conf | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/conf/machine/j721s2-hs-evm.conf b/conf/machine/j721s2-hs-evm.conf
index 43fb2ebc..7ffad45a 100644
--- a/conf/machine/j721s2-hs-evm.conf
+++ b/conf/machine/j721s2-hs-evm.conf
@@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
 UBOOT_DTBO_OFFSET =      "0x00010000"
 
 SPL_BINARY = "tispl.bin_HS"
-SPL_BINARYNAME = "tispl.bin"
 UBOOT_BINARY = "u-boot.img_HS"
-IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+UBOOT_SYMLINK = "u-boot.img"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
-- 
2.17.1



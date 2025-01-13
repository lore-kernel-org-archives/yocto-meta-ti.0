Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B2AC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 22:52:29 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.31793.1736808744239256673
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 14:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FmC38vSE;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50DMqNFI3585908
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:52:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736808743;
	bh=kOjdzmcnwbQ6d+tpFFVgQUjWyQ0I/TV3oLVcYVK5MA8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FmC38vSEGK4Ifv8WyylxX37twI3F4FuC5pappWIHsLd2sz4rmhJtCfYcTxPfuNiAp
	 sNpk+1+04ij6b4zGu4OzSOLsyGTZCjVgXE8TRFlu08nLGF57JvlZ4LaZihGQV/QPBZ
	 dUK8EXfI8+iyTnlzQprIuZYUsvm8TuyTm9pJBKhA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50DMqNB1001371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 16:52:23 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 16:52:22 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 16:52:22 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50DMqM2q048474;
	Mon, 13 Jan 2025 16:52:22 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tXTIE-0003YT-NB; Mon, 13 Jan 2025 16:52:22 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH 2/2] conf: machine: beaglebone-ai64: Update SPLY_BINARY
Date: Mon, 13 Jan 2025 16:52:22 -0600
Message-ID: <20250113225222.13622-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250113225222.13622-1-reatmon@ti.com>
References: <20250113225222.13622-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Jan 2025 22:52:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18190

Rather than override the value for SPL_BINARY for all bsps, simply just
set the value to the correct value.  This should be ok since all
beaglebone-ai64 variations should use tispl.bin_unsigned.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-beagle/conf/machine/beaglebone-ai64.conf | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/conf/machine/beaglebone-ai64.conf
index a521c8cf..ecd3a6e7 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
@@ -18,11 +18,7 @@ UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_a72.config"
 UBOOT_MACHINE:bsp-bb_org-6_1 = "j721e_evm_a72_config"
 UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "j721e_beagleboneai64_a72.config"
 
-SPL_BINARY:bsp-ti-6_6 = "tispl.bin_unsigned"
-SPL_BINARYNAME:bsp-ti-6_6 = "tispl.bin"
-
-SPL_BINARY:bsp-bb_org-6_6 = "tispl.bin_unsigned"
-SPL_BINARYNAME:bsp-bb_org-6_6 = "tispl.bin"
+SPL_BINARY = "tispl.bin_unsigned"
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j721e \
-- 
2.17.1



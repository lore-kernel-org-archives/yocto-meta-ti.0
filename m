Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FDFCCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 18:22:38 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.7714.1760034152856391022
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 11:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CNM+dScJ;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 599IMVT6141817;
	Thu, 9 Oct 2025 13:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760034151;
	bh=p31qDi9IYCTayjWv1PmXSK0e3ToWtTS/d4seqz/ehck=;
	h=From:To:Subject:Date;
	b=CNM+dScJsV0w6X9yMeVJMF5htUepooGsQ36OD/zofUswpLEf/MyhH2Iimh8DW2W3F
	 Dya++6/+ruSbXUxIL4+b04t9zsGsJDydZurSaXa8+TKManeWBdti5RqI425Fz3QPdW
	 n1EfbilAKImb29T09t79Z7n2CQcWBa7m40osMn+0=
Received: from DFLE209.ent.ti.com (dfle209.ent.ti.com [10.64.6.67])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 599IMVHJ486003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Oct 2025 13:22:31 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Oct
 2025 13:22:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Oct 2025 13:22:31 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 599IMV6o656391;
	Thu, 9 Oct 2025 13:22:31 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v6vHb-0001n2-6B; Thu, 09 Oct 2025 13:22:31 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] machine: Add FIT_CONF_DEFAULT_DTB for legacy platforms
Date: Thu, 9 Oct 2025 13:22:30 -0500
Message-ID: <20251009182231.4242-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Oct 2025 18:22:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19112

As of u-boot 2025.10, the fit image requires a value for the default
configuration.  The change [1] introduced the FIT_CONF_DEFAULT_DTB code
to the legacy fitimage class, but failed to set values for the legacy
platforms.  This led to us putting default = "" in the .its file, which
is now an error.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am335x-hs-evm.conf | 1 +
 meta-ti-bsp/conf/machine/am437x-hs-evm.conf | 1 +
 meta-ti-bsp/conf/machine/am57xx-hs-evm.conf | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am335x-hs-evm.conf b/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
index 562befe9..dade6585 100644
--- a/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
@@ -20,3 +20,4 @@ FITIMAGE_HASH_ALGO = ""
 FITIMAGE_DTB_BY_NAME = "1"
 FITIMAGE_TEE_BY_NAME = "1"
 FITIMAGE_CONF_BY_NAME = "1"
+FIT_CONF_DEFAULT_DTB = "am335x-evm.dtb"
diff --git a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf b/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
index 35b8d0a4..b6ee41be 100644
--- a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
@@ -22,3 +22,4 @@ FITIMAGE_PACK_TEE = "1"
 FITIMAGE_DTB_BY_NAME = "1"
 FITIMAGE_TEE_BY_NAME = "1"
 FITIMAGE_CONF_BY_NAME = "1"
+FIT_CONF_DEFAULT_DTB = "am437x-gp-evm.dtb"
diff --git a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf b/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
index e06c9728..7b8a294a 100644
--- a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
@@ -23,3 +23,4 @@ FITIMAGE_PACK_TEE = "1"
 FITIMAGE_DTB_BY_NAME = "1"
 FITIMAGE_TEE_BY_NAME = "1"
 FITIMAGE_CONF_BY_NAME = "1"
+FIT_CONF_DEFAULT_DTB = "am57xx-evm.dtb"
-- 
2.17.1



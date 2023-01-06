Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CBBC3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 00:07:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1469.1672963663590825815
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 16:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=x5HXx1bL;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30607ebN078054;
	Thu, 5 Jan 2023 18:07:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672963660;
	bh=6O4ULezmw0Eru07mQftHGZV/XC7JvN40MLrIanymB3c=;
	h=From:To:Subject:Date;
	b=x5HXx1bLKq+xrFfJmhUFDRMsRC4tL4PQPcW90QBgX5WxoIn7M9GnWaUQZxCxxnppg
	 NwL1dI1lNNKNvJj+aEWqSgEpl0/i1g2zT/jHey0RHmKj7b6h5cet+4KWglp7IBiJx3
	 VWt+fw0W6wwi7o4kvzwuHPjEsqkZvjLS4+bmsQsc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30607e27097761
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Jan 2023 18:07:40 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 5
 Jan 2023 18:07:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 5 Jan 2023 18:07:40 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30607eEh013939;
	Thu, 5 Jan 2023 18:07:40 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <praneeth@ti.com>)
	id 1pDaGq-0000ai-6E; Thu, 05 Jan 2023 18:07:40 -0600
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [dunfell PATCH] optee-os: Lower log level for am62axx
Date: Thu, 5 Jan 2023 18:07:40 -0600
Message-ID: <20230106000740.2229-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Jan 2023 00:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15532

Lower the log level for am62axx platform

commit 27641e1f2d7f ("optee-os: Lower log level for AM62x")
changes the log level for am62xx platforms.
This patch is to extend the same for am62axx

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Reported-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 6ea0773f..dab30c02 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -8,6 +8,7 @@ EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if
 
 EXTRA_OEMAKE_append_am62xx-evm = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE_append_am62axx-evm = " CFG_TEE_CORE_LOG_LEVEL=1"
 
 do_compile_prepend_ti-soc() {
     export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-- 
2.17.1



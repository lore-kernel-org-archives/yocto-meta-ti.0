Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB28C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 01:14:56 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.13066.1669252488777024365
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 17:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FnQJhWf4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AO1EjbH092781;
	Wed, 23 Nov 2022 19:14:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669252485;
	bh=tZdyzA2FtEb06H0pzx/cK/SZnNor8Jqtr8h3Kx9iTOA=;
	h=From:To:Subject:Date;
	b=FnQJhWf4dUb37UmntuaWN6gtoX9yof9wKbiPxdxPJbtuKGjHOzzHGeC10zOGyzVWx
	 IH0k5QiHxyualpsAavkcptp+TsdMzwid8MkpSK/HQQ8Z1lbGqMAiLMj6mJtnINqzQw
	 h6XFnXbM8ETC/oCBTEkgIloa7DQGCMQj2F1+G+nw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AO1EjKV018323
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Nov 2022 19:14:45 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 23
 Nov 2022 19:14:45 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 23 Nov 2022 19:14:45 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AO1EjKr098422;
	Wed, 23 Nov 2022 19:14:45 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oy0pB-0003fz-5o; Wed, 23 Nov 2022 19:14:45 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] optee-os: Remove 3.18 patches from our 3.19 recipe
Date: Wed, 23 Nov 2022 19:14:45 -0600
Message-ID: <20221124011445.14092-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Nov 2022 01:14:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15361

These patches are from upstream against v3.18, but we moved to v3.19 and the
patches are now invalid.  These can be removed once upstream moves up to or
beyond v3.19.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index 6913851b..8640d7b0 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -1,6 +1,12 @@
 PV:ti-soc = "3.19.0+git${SRCPV}"
 SRCREV:ti-soc = "afacf356f9593a7f83cae9f96026824ec242ff52"
 
+# These patches are from upstream against v3.18, but we moved to v3.19 and the
+# patches are now invalid.  These can be removed once upstream moves up to or
+# beyond v3.19.
+SRC_URI:remove:ti-soc = "file://0008-no-warn-rwx-segments.patch"
+SRC_URI:remove:ti-soc = "file://0009-add-z-execstack.patch"
+
 EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
 EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
-- 
2.17.1



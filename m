Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49991C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 18:20:50 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.39383.1698949245593097367
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 11:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fPGnfGJq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A2IKfvG014773;
	Thu, 2 Nov 2023 13:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698949241;
	bh=XhcQr660waWa6HY507digDtzASce5djIJG6mi9JatDc=;
	h=From:To:Subject:Date;
	b=fPGnfGJqOXsY0gAeIZTixYBMNhU7y2mqpVXqmgYEmx/zAm3VBo1TqeW0I+VIy90J7
	 Vvv9WNPf1hJjddjmQrPHVDgCJCrxW5eof5lMRdz/qlORwRTW3tv6nKs44Q6ve546rT
	 Qzc7hiJXtOaeWJJS23K/MjYrhLbJqccR716fqLN4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A2IKfoC034492
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Nov 2023 13:20:41 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Nov 2023 13:20:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Nov 2023 13:20:41 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A2IKfIl082191;
	Thu, 2 Nov 2023 13:20:41 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qycJ7-0006a1-0n; Thu, 02 Nov 2023 13:20:41 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] optee-client: Remove upstreamed options
Date: Thu, 2 Nov 2023 13:20:40 -0500
Message-ID: <20231102182040.25252-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Nov 2023 18:20:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17224

Remove the pkgconfig settings since they are upstreamed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-client-ti.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
index f64a90c3..0da37acf 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
@@ -1,7 +1,2 @@
 PV = "4.0.0+git${SRCPV}"
 SRCREV = "acb0885c117e73cb6c5c9b1dd9054cb3f93507ee"
-
-inherit pkgconfig
-DEPENDS += "util-linux"
-
-EXTRA_OEMAKE += "PKG_CONFIG=pkg-config"
-- 
2.17.1



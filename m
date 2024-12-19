Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CDEE77195
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:54:07 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.139694.1734645244668879959
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tU/h1ipO;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs3FL064255
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 19 Dec 2024 15:54:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645243;
	bh=tX6eo7lhAsDprRggzyCUCKUITgPsqidJ80MyHYR8N5g=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tU/h1ipOsWs0X1Jg7E77sYuGkBSgZZ0BbQyH+fVLtWZ+lahQYaVzoYYcqLeOBA5PS
	 p9LEaYwot1kXuGLJJJmwRj0j8TSqeQlXamUt2yEqgL1fQwPHgIY3va52BeUW8dg8u1
	 RYsLkmn66O04zJ1zgxwjA6+lYroI1/N+t7jItmzw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs3L5050800;
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:54:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:54:03 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs285066783;
	Thu, 19 Dec 2024 15:54:02 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOT4-0007V6-Qe; Thu, 19 Dec 2024 15:54:02 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 03/13] meta-beagle: layer.conf: add lz4c to host tools list
Date: Thu, 19 Dec 2024 15:53:52 -0600
Message-ID: <20241219215402.28324-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219215402.28324-1-reatmon@ti.com>
References: <20241219215402.28324-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 21:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18151

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core master has switched from lz4c to lz4 host tool, but a corresponding
change only appears in kernel 6.13. Since bb.org kernels 6.1 and 6.6 enable
LZ4 compression by default, also add a legacy lz4c tool in the list.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
index 0dac4946..d980df8e 100644
--- a/meta-beagle/conf/layer.conf
+++ b/meta-beagle/conf/layer.conf
@@ -13,3 +13,5 @@ LAYERSERIES_COMPAT_meta-beagle = "scarthgap"
 LAYERDEPENDS_meta-beagle = " \
     meta-ti-bsp \
 "
+
+HOSTTOOLS_NONFATAL += "lz4c"
-- 
2.17.1



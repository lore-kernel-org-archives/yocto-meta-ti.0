Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82FCECAAD7
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 19:16:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.41304.1661541407263435865
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Aug 2022 12:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N6y2j/oC;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27QJGgwC010847;
	Fri, 26 Aug 2022 14:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661541402;
	bh=WgQRpbS2hXPlCaZEiwZO5lPEJabr0ASHS1d+lxIPa8Q=;
	h=From:To:CC:Subject:Date;
	b=N6y2j/oC//kvUfKj/bKIm0+S2TmqNfem9MJoXg36x3qpCbUQseBihvlvj5joIzXR1
	 zTrc8ZqlkVk8lAi5Yl1sd0q801/vwwH2mEQ/S+iozmEmXHx1za1hYl1DXvc2gj87Mh
	 4xtfhSch+YOmEjSU/dNst7kFXtaida3CwHUpYHNA=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27QJGgBi001468
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Aug 2022 14:16:42 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 26
 Aug 2022 14:16:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 26 Aug 2022 14:16:42 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27QJGf78096992;
	Fri, 26 Aug 2022 14:16:41 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Anand Gadiyar <gadiyar@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 1/2] optee-os: Upgrade to upstream 3.18.0
Date: Fri, 26 Aug 2022 14:16:40 -0500
Message-ID: <20220826191641.31116-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Aug 2022 19:16:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14970

Update to the latest upstream master which is 3.18.0.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 5a25bd99..4081b324 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,5 +1,5 @@
-PV_ti-soc = "3.17.0+git${SRCPV}"
-SRCREV_ti-soc = "15a746d28d10df3d79d72bc9fe4a5a654b88bcca"
+PV_ti-soc = "3.18.0+git${SRCPV}"
+SRCREV_ti-soc = "8e155bae3a5eb9d1a3ed9260bd7281a7a35f5086"
 SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
 
 DEPENDS_append_ti-soc = " python3-cryptography-native"
-- 
2.36.1



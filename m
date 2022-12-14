Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FE7C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 12:07:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.101488.1671019629659367341
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Dec 2022 04:07:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tvYJDStG;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: m-chawdhry@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BEC78Mg092335
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 06:07:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1671019628;
	bh=qPpuTUO+P2PJcKXwg59aYfunHDUdJ2BRxVTlLmv40qI=;
	h=From:To:CC:Subject:Date;
	b=tvYJDStG6MdL7l2NA3H8NsH2tIjuidMk9hFMd2WkXBeXQTM0vPsMYx3Vm/gULD0bW
	 IT5hTdPvqvf56CysdCyc54zocqWz3lPwiwMWaS5zckkEgd76vxzOdk1sw/16OdiSVe
	 XILDGne5JVBAuIbl2y4UmgFJUfSoYy+S2iShYaO8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BEC78gX004072
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 06:07:08 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 14
 Dec 2022 06:07:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 14 Dec 2022 06:07:08 -0600
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BEC75sF082939;
	Wed, 14 Dec 2022 06:07:06 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Jayesh Choudhary
	<j-choudhary@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][dunfell][PATCH v3] optee: update optee-client, optee-test, optee-examples to 3.19 tag
Date: Wed, 14 Dec 2022 17:37:05 +0530
Message-ID: <20221214120705.361705-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 12:07:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15476

optee-os was updated to 3.19 tag but the others were still outdated.

Updates other optee components to 3.19 tag

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
v1->v2:
- Fix build by adding depends

v2->v3:
- Add layer specific override in depends
- Add util-linux also as a dependency that provides libuuid

 recipes-security/optee/optee-client_%.bbappend   | 6 ++++--
 recipes-security/optee/optee-examples_%.bbappend | 4 ++--
 recipes-security/optee/optee-test_%.bbappend     | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
index 5675570a..a8adef47 100644
--- a/recipes-security/optee/optee-client_%.bbappend
+++ b/recipes-security/optee/optee-client_%.bbappend
@@ -1,2 +1,4 @@
-PV_ti-soc = "3.17.0+git${SRCPV}"
-SRCREV_ti-soc = "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
+PV_ti-soc = "3.19.0+git${SRCPV}"
+SRCREV_ti-soc = "140bf463046071d3ca5ebbde3fb21ee0854e1951"
+
+DEPENDS_append_ti-soc = "pkgconfig util-linux"
diff --git a/recipes-security/optee/optee-examples_%.bbappend b/recipes-security/optee/optee-examples_%.bbappend
index 9941b345..dda7cbbf 100644
--- a/recipes-security/optee/optee-examples_%.bbappend
+++ b/recipes-security/optee/optee-examples_%.bbappend
@@ -1,5 +1,5 @@
-PV_ti-soc = "3.17.0+git${SRCPV}"
-SRCREV_ti-soc = "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
+PV_ti-soc = "3.19.0+git${SRCPV}"
+SRCREV_ti-soc = "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
 SRC_URI_ti-soc = "git://github.com/linaro-swg/optee_examples.git;protocol=https"
 
 DEPENDS_append_ti-soc = " python3-cryptography-native"
diff --git a/recipes-security/optee/optee-test_%.bbappend b/recipes-security/optee/optee-test_%.bbappend
index d81ae521..79b4b4d6 100644
--- a/recipes-security/optee/optee-test_%.bbappend
+++ b/recipes-security/optee/optee-test_%.bbappend
@@ -1,5 +1,5 @@
-PV_ti-soc = "3.17.0+git${SRCPV}"
-SRCREV_ti-soc = "8a698baf9e8e010e4d8d52e6aded42dfc31e5b25"
+PV_ti-soc = "3.19.0+git${SRCPV}"
+SRCREV_ti-soc = "ab9863cc187724e54c032b738c28bd6e9460a4db"
 SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_test.git;protocol=https"
 
 DEPENDS_append_ti-soc = " python3-cryptography-native"
-- 
2.34.1



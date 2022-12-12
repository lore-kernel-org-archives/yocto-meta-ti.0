Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2E0C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 05:47:18 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.36442.1670824029868822088
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 21:47:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JzSUUmQ6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BC5l9rh081569
	for <meta-ti@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:47:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670824029;
	bh=b/uaxrhgPpdf91/Ci7UAaYWOR3ehcRWwLxxHu9IgJxY=;
	h=From:To:CC:Subject:Date;
	b=JzSUUmQ6Bl9G2qJVu4mZAd/qBTckOzOLQ6ogJZxSqBx6E8AE0jk4bjFrhG7hQgEVR
	 2knGzh5E0/uaJ+oDwn+xz/dmM1k/6LxArF1Nkehgzc87fVPELD7kSoE1p2Ad/dYhDI
	 RnyexGNRH9f+JO+gUD2/BgSya2PuDew55oQ7AHDY=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BC5l9gL043995
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:47:09 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sun, 11
 Dec 2022 23:47:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sun, 11 Dec 2022 23:47:08 -0600
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BC5l6fJ000612;
	Sun, 11 Dec 2022 23:47:06 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Jayesh Choudhary
	<j-choudhary@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][dunfell][PATCH v2] optee: update optee-client, optee-test, optee-examples to 3.19 tag
Date: Mon, 12 Dec 2022 11:17:05 +0530
Message-ID: <20221212054705.94060-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Dec 2022 05:47:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15447

optee-os was updated to 3.19 tag but the others were still outdated.

Updates other optee components to 3.19 tag

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
v1->v2:
- Fix build by adding depends

 recipes-security/optee/optee-client_%.bbappend   | 6 ++++--
 recipes-security/optee/optee-examples_%.bbappend | 4 ++--
 recipes-security/optee/optee-test_%.bbappend     | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
index 5675570a..19feaf6d 100644
--- a/recipes-security/optee/optee-client_%.bbappend
+++ b/recipes-security/optee/optee-client_%.bbappend
@@ -1,2 +1,4 @@
-PV_ti-soc = "3.17.0+git${SRCPV}"
-SRCREV_ti-soc = "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
+PV_ti-soc = "3.19.0+git${SRCPV}"
+SRCREV_ti-soc = "140bf463046071d3ca5ebbde3fb21ee0854e1951"
+
+DEPENDS += "pkgconfig"
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



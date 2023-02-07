Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1891BC636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 05:18:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.76730.1675747125005970831
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Feb 2023 21:18:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ro6A3quH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3175Ih5W021671
	for <meta-ti@lists.yoctoproject.org>; Mon, 6 Feb 2023 23:18:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675747123;
	bh=yCKCZCmNYf4oeshvcZv7UnLcUT4UA8VwSmnCaSzXIgk=;
	h=From:To:CC:Subject:Date;
	b=ro6A3quH06+ArScxW4e4nQRVEuRbODZYblLTUz6Hi8O1WNqo33ZpVYku2YKhWEeOt
	 +MCCT+vcEvfCypYf4eCqq3RAyBUL55jCl1QZFZesfYtFKrC4wMDh9gsGCfzSnAqgM9
	 depuy5oAESDOyftWpO63SSYPCg5Ou3hLfDNXX69c=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3175Ihsl096500
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 6 Feb 2023 23:18:43 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 6
 Feb 2023 23:18:43 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 6 Feb 2023 23:18:43 -0600
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3175IeTt118733;
	Mon, 6 Feb 2023 23:18:41 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Jayesh Choudhary
	<j-choudhary@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][dunfell][PATCH v2] optee: update optee components to 3.20 tag
Date: Tue, 7 Feb 2023 10:48:40 +0530
Message-ID: <20230207051840.518373-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 05:18:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15729

OPTEE tests is not being upgraded due to a newer python dependency for
the build

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v1->v2:
Change k3 to ti-soc for fixing legacy builds

 recipes-security/optee/optee-client_%.bbappend   | 9 ++++++---
 recipes-security/optee/optee-examples_%.bbappend | 4 ++--
 recipes-security/optee/optee-os_%.bbappend       | 4 ++--
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
index a8adef47..89983f2b 100644
--- a/recipes-security/optee/optee-client_%.bbappend
+++ b/recipes-security/optee/optee-client_%.bbappend
@@ -1,4 +1,7 @@
-PV_ti-soc = "3.19.0+git${SRCPV}"
-SRCREV_ti-soc = "140bf463046071d3ca5ebbde3fb21ee0854e1951"
+PV_ti-soc = "3.20.0+git${SRCPV}"
+SRCREV_ti-soc = "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
 
-DEPENDS_append_ti-soc = "pkgconfig util-linux"
+inherit pkgconfig
+DEPENDS_append_ti-soc = "util-linux"
+
+EXTRA_OEMAKE_append_ti-soc = " PKG_CONFIG=pkg-config"
diff --git a/recipes-security/optee/optee-examples_%.bbappend b/recipes-security/optee/optee-examples_%.bbappend
index dda7cbbf..ef6da34e 100644
--- a/recipes-security/optee/optee-examples_%.bbappend
+++ b/recipes-security/optee/optee-examples_%.bbappend
@@ -1,5 +1,5 @@
-PV_ti-soc = "3.19.0+git${SRCPV}"
-SRCREV_ti-soc = "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
+PV_ti-soc = "3.20.0+git${SRCPV}"
+SRCREV_ti-soc = "a98d01e1b9168eaed96bcd0bac0df67c44a81081"
 SRC_URI_ti-soc = "git://github.com/linaro-swg/optee_examples.git;protocol=https"
 
 DEPENDS_append_ti-soc = " python3-cryptography-native"
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 91abbcee..5c6c9d4a 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,5 +1,5 @@
-PV_ti-soc = "3.19.0+git${SRCPV}"
-SRCREV_ti-soc = "d6c5d0037b46f46caf71d67d7825d4b722cbcddf"
+PV_ti-soc = "3.20.0+git${SRCPV}"
+SRCREV_ti-soc = "3bc3809afe372ca7e8216fc5d7a64e965bb4ad70"
 SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
 
 DEPENDS_append_ti-soc = " python3-cryptography-native"
-- 
2.34.1



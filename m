Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9397C636CD
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 05:21:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.5841.1675142458340634829
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 21:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tWdq9Mxu;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: m-chawdhry@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30V5KvZ3117620
	for <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 23:20:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675142457;
	bh=CnhJOultl2IMkXg2E4klR3NiD9XkIHULsP3O6j6BIac=;
	h=From:To:CC:Subject:Date;
	b=tWdq9MxuIs1Yh3fMlfkdYnkecCR8rAGBjwwFWBz3cKKpBYGo4A4kpvPy7OENpu2fH
	 T9vtqQ59eMbKSNLM+2ChgKItn42xtEs1HtpWFsVZSAvPXIgAGr1r2uO5o5zEojZdL2
	 YUZ8mwzIuM/gbxCQjK56DMwr2bGoUG+HiRNg6SMs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30V5KvaP125344
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 23:20:57 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 30
 Jan 2023 23:20:56 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 30 Jan 2023 23:20:56 -0600
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30V5Krpm010335;
	Mon, 30 Jan 2023 23:20:54 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Jayesh Choudhary
	<j-choudhary@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][dunfell][PATCH v1] optee: update optee components to 3.20 tag
Date: Tue, 31 Jan 2023 10:50:53 +0530
Message-ID: <20230131052053.3759470-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 31 Jan 2023 05:21:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15712

OPTEE tests is not being upgraded due to a newer python dependency for
the build

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 recipes-security/optee/optee-client_%.bbappend   | 9 ++++++---
 recipes-security/optee/optee-examples_%.bbappend | 4 ++--
 recipes-security/optee/optee-os_%.bbappend       | 4 ++--
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
index a8adef47..0ede4898 100644
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
+EXTRA_OEMAKE_append_k3 = " PKG_CONFIG=pkg-config"
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
index db9064de..a77fbc5a 100644
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



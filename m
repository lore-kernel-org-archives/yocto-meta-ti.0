Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820C1C05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 21:47:52 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.24048.1675460865544204820
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Feb 2023 13:47:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RwtyrO4X;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 313LlgTQ099375;
	Fri, 3 Feb 2023 15:47:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675460862;
	bh=qP/UhJUcdUl1FxWgukKE+qm9Z4thLE1CDg+8tleRbdE=;
	h=From:To:Subject:Date;
	b=RwtyrO4X0h0QW+c7dYQKsA+5leJYqimq56gqx5JH+/GXnlUv75HM/JPnRDqXo8l9W
	 NzTR5fLpIJIZX9SxP88dS07nNkdWayxQqwTn5NdfSiD6rsCo+D3aoxBuHCdSAkisov
	 mayLm4tLgJ0iDNeIVD2OX7jMelE49YML8dtxyHd8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 313Llg6t035340
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Feb 2023 15:47:42 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 3
 Feb 2023 15:47:42 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 3 Feb 2023 15:47:42 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 313LlgmI112862;
	Fri, 3 Feb 2023 15:47:42 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pO3uI-0007Qa-By; Fri, 03 Feb 2023 15:47:42 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2] optee: Revert "optee: update optee components to 3.20 tag"
Date: Fri, 3 Feb 2023 15:47:42 -0600
Message-ID: <20230203214742.28513-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Feb 2023 21:47:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15726

This reverts commit 9a007a3feab823eb4b72276103a08306b1abb066.

We ran into some build failures on the older legacy platforms due
to this change and so are reverting this while we investigate.
---
v2: Fix typo in subject.

 recipes-security/optee/optee-client_%.bbappend   | 9 +++------
 recipes-security/optee/optee-examples_%.bbappend | 4 ++--
 recipes-security/optee/optee-os_%.bbappend       | 4 ++--
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
index 0ede4898..a8adef47 100644
--- a/recipes-security/optee/optee-client_%.bbappend
+++ b/recipes-security/optee/optee-client_%.bbappend
@@ -1,7 +1,4 @@
-PV_ti-soc = "3.20.0+git${SRCPV}"
-SRCREV_ti-soc = "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
+PV_ti-soc = "3.19.0+git${SRCPV}"
+SRCREV_ti-soc = "140bf463046071d3ca5ebbde3fb21ee0854e1951"
 
-inherit pkgconfig
-DEPENDS_append_ti-soc = "util-linux"
-
-EXTRA_OEMAKE_append_k3 = " PKG_CONFIG=pkg-config"
+DEPENDS_append_ti-soc = "pkgconfig util-linux"
diff --git a/recipes-security/optee/optee-examples_%.bbappend b/recipes-security/optee/optee-examples_%.bbappend
index ef6da34e..dda7cbbf 100644
--- a/recipes-security/optee/optee-examples_%.bbappend
+++ b/recipes-security/optee/optee-examples_%.bbappend
@@ -1,5 +1,5 @@
-PV_ti-soc = "3.20.0+git${SRCPV}"
-SRCREV_ti-soc = "a98d01e1b9168eaed96bcd0bac0df67c44a81081"
+PV_ti-soc = "3.19.0+git${SRCPV}"
+SRCREV_ti-soc = "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
 SRC_URI_ti-soc = "git://github.com/linaro-swg/optee_examples.git;protocol=https"
 
 DEPENDS_append_ti-soc = " python3-cryptography-native"
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 5c6c9d4a..91abbcee 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,5 +1,5 @@
-PV_ti-soc = "3.20.0+git${SRCPV}"
-SRCREV_ti-soc = "3bc3809afe372ca7e8216fc5d7a64e965bb4ad70"
+PV_ti-soc = "3.19.0+git${SRCPV}"
+SRCREV_ti-soc = "d6c5d0037b46f46caf71d67d7825d4b722cbcddf"
 SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
 
 DEPENDS_append_ti-soc = " python3-cryptography-native"
-- 
2.17.1



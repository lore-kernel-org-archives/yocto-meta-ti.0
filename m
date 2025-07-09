Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC30C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 16:14:45 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1096.1752077679562167807
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 09:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NmrumCss;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569GEbF71508978;
	Wed, 9 Jul 2025 11:14:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752077677;
	bh=XDjInATLZvyrzbrinBy/1J+vy4EA+iLA2pTrWzP2Rh0=;
	h=From:To:Subject:Date;
	b=NmrumCssRrV6OHrsBk/8ei9JaUdX4uPQL7jhU4xLDHnZdR5m8DaNnP0hvd1oi+5HF
	 MWm5GBfJatW65olMp7sOAeNclpWN8/4e9jwL5CYtbz0jHUUtyghhcPaKj0ybSiQw3C
	 Pki6oRcBewyum5Epu7VnB5TgW2skuu5f+Pja5yP8=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569GEbRY2611945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 11:14:37 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 11:14:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 11:14:37 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569GEb4j3954816;
	Wed, 9 Jul 2025 11:14:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uZXRN-0001Ed-4N; Wed, 09 Jul 2025 11:14:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] u-boot-ti: Move UBOOT_VERSION into dynamic layer
Date: Wed, 9 Jul 2025 11:14:37 -0500
Message-ID: <20250709161437.4707-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 09 Jul 2025 16:14:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18767

The gitpkgv class we are using to set UBOOT_VERSION is located in
meta-openembedded.  We do not want to depend on meta-openembedded to
keep meta-ti-bsp as light as possible, and the naming of UBOOT_VERSION
is not a requirement, just a nice to have.  Dynamic layers allow us to
use the class if it is available in the build, but not require it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/layer.conf                               | 8 ++++++++
 .../recipes-bsp/u-boot/u-boot-ti-%.bbappend               | 5 +++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc              | 4 ----
 3 files changed, 13 insertions(+), 4 deletions(-)
 create mode 100644 meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-bsp/u-boot/u-boot-ti-%.bbappend

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 481daf2c..cbf7f509 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -18,6 +18,14 @@ LAYERDEPENDS_meta-ti-bsp = " \
     meta-arm \
 "
 
+LAYERRECOMMENDS_meta-ti-bsp = " \
+    openembedded-layer \
+"
+
+BBFILES_DYNAMIC += " \
+    openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
+"
+
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     mesa-pvr \
 "
diff --git a/meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-bsp/u-boot/u-boot-ti-%.bbappend b/meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-bsp/u-boot/u-boot-ti-%.bbappend
new file mode 100644
index 00000000..0f91e37e
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-bsp/u-boot/u-boot-ti-%.bbappend
@@ -0,0 +1,5 @@
+
+inherit gitpkgv
+PKGV = "${PV}${GITPKGV}"
+UBOOT_VERSION = "${PKGV}-${PKGR}"
+
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 8a000331..642bb6cd 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -5,10 +5,6 @@ do_compile:prepend () {
     echo ${scm_version} > ${S}/.scmversion
 }
 
-inherit gitpkgv
-PKGV = "${PV}${GITPKGV}"
-UBOOT_VERSION = "${PKGV}-${PKGR}"
-
 UBOOT_SUFFIX ?= "img"
 SPL_BINARY ?= "MLO"
 
-- 
2.17.1



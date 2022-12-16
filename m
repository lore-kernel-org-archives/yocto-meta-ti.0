Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEEDC001B2
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 13:02:04 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.12458.1671195719960518389
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 05:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=lspQvXK3;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671195720; x=1702731720;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5oaHTy0cd07aeDdUIBSxkbYaoIguO4+B+akM3kcVFeo=;
  b=lspQvXK3aMWjTu8QSWnZCeU57jImrRyFlWu/COM94BjEOF8DBFEsHsDA
   E7gr5Qz5VyHXDzmgKaGiW6gp9ZdFiUOQiphzs4KPCOXjAAog3tToKl0et
   23bIn0jTBMzZQoqxVGIjzet7SPXJf0v07BSVL/5DntwGKEp4pyL6ownQL
   WMrLma6IyMICL/+uuXMSF7tbbjQ2Acp5tJshaS5DQWyA/bdz0T/iAnvG9
   xyShfK4l6Fs37vOjYrTDh5zvT17JGgOdsyv239AiZoeQqzMEw17NHF2R2
   4ULB0azsYgZnyf8AF17N+BoNNW6pAFCLR4UYz/4xSnTysLYUjRZSiHgTF
   g==;
X-IronPort-AV: E=Sophos;i="5.96,249,1665439200"; 
   d="scan'208";a="28000878"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Dec 2022 14:01:57 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 16 Dec 2022 14:01:57 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 16 Dec 2022 14:01:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671195717; x=1702731717;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5oaHTy0cd07aeDdUIBSxkbYaoIguO4+B+akM3kcVFeo=;
  b=m+V95rahyl5HWPyvQWK2jzRIWvvq2Mia+ri7aXD9igaYahhzog4LBzTJ
   n4zxZDbD2ltpxwnhEvEEoO48mjmj/V1i9PzAobwIP1Pw+D6WQ8Ar0C2X3
   /xVLg5+LjWVo/5gcvzLom8eR3D3h3vEthVy3nPMA/lSHe7vjC9gEHNPj6
   PdWT9bjsEn8qRleQdWsTGOgkI7UHfPQm01RnIS0y3+FkPDrm2j6NMrSnx
   y4dt4q6RIV3u2jkvrADn+3YEiKwom4GB50TWAQV1fpN8hj7m/Vnp0vOY+
   Hji3xRDpx5uf+YK1IAdMIXa80c2dFamcjMglYA4uno36G+rg5wOg533AH
   A==;
X-IronPort-AV: E=Sophos;i="5.96,249,1665439200"; 
   d="scan'208";a="28000876"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Dec 2022 14:01:57 +0100
Received: from localhost.localdomain (SCHIFFERM-M2.tq-net.de [10.121.49.14])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 995C3280071;
	Fri, 16 Dec 2022 14:01:57 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: meta-ti@lists.yoctoproject.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [master/kirkstone][PATCH 1/2] treewide: replace leftover git://git.ti.com
Date: Fri, 16 Dec 2022 14:01:38 +0100
Message-Id: <20221216130139.20841-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 16 Dec 2022 13:02:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15486

These URIs have been updated in dunfell, but two instances were
forgotten in kirkstone/master.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 .../recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb      | 2 +-
 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index d0edf1fe..bd88d14d 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -14,7 +14,7 @@ PR = "r37"
 
 BRANCH = "ti-img-sgx/dunfell/${PV}"
 
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH}"
 SRCREV = "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
 
 TARGET_PRODUCT:omap-a15 = "jacinto6evm"
diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
index cb2f8cc2..8a2cfdc6 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PRU-Package-v6.1-Manifest.html;md5=1e37797ebe9254922f
 inherit update-alternatives
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=https;branch=${BRANCH}"
 SRCREV = "ae1decf0b494b2904e6157e1379691ffc468f0cf"
 
 PV = "6.1.0"
-- 
2.34.1



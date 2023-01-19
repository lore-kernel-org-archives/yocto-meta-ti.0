Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C34C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 10:30:10 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.42492.1674124208987276062
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 02:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=mgbc98AB;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674124209; x=1705660209;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2m+LSw9sm2pxVARQx5ZkHcKo2elf5f2ynsjFG4/oyOM=;
  b=mgbc98ABfPw0B0PRqncgssh+cqJB2eTq0h6JYxUWabWtbSyXooe9SXCM
   Q2vkE3VWudJ5YNGLCQzsG0suNtL6MASJgeUK6TtXLhBdbisXysBZijaKK
   CKtFjNLWsX/gTd8kwtmvn03sxNBqiiXcAdoc4B1d8sZibBzmF2P/79K1U
   MKUKQKuO9YHTrNbJDyA+CEd7+Iwi1XBDGweBuu7bk019vW8LkSqpPfAXp
   RB0ci9pJ3MJLmo1NJIA98huppYhvp267/IVD8Loyv1r3WSjjfqHo1lN0B
   ikWXM1WaNOdSWkhC7GUyh9iXqU3TGpjfjhW5beI/3dd1IUqdonLbliV8e
   g==;
X-IronPort-AV: E=Sophos;i="5.97,228,1669071600"; 
   d="scan'208";a="28529005"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Jan 2023 11:30:05 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 19 Jan 2023 11:30:05 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 19 Jan 2023 11:30:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674124205; x=1705660205;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2m+LSw9sm2pxVARQx5ZkHcKo2elf5f2ynsjFG4/oyOM=;
  b=Ys/94V2Vy689JyzYSlUxLvXL1KqkeIz6NHOWid8bNaSWwAaO2Z5XCIAH
   CURLFxXCc9TCMPdYahzFBMrym0RH5HaFR3QGVvu3NzKUPkpCpT0Wx73LS
   lGCXyZZ/3R8yP/7hlzC3Mfpr4KkWGa1VSQilJ7KAxHq2fHsURdc3+7Xr6
   AFOq5B08b8QbAQZNMUwy2wKW1BzKY610fEl4iPKMvd2OqHPgq8D4ghhSu
   TPksi9jnON2MxFu1tNdXPQacfg9x9ousEgQA5cI6q4byt05oAwZQjHkt6
   Yaovo4JOKsulh4n6jOjRGlT70zSthDNdUiEYbbV8NauqxB4NBwssPDVYY
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,228,1669071600"; 
   d="scan'208";a="28529003"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Jan 2023 11:30:05 +0100
Received: from localhost.localdomain (SCHIFFERM-M2.tq-net.de [10.121.49.14])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 8C366280056;
	Thu, 19 Jan 2023 11:30:05 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: meta-ti@lists.yoctoproject.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [master/kirkstone][PATCH v2 1/2] treewide: replace leftover git://git.ti.com
Date: Thu, 19 Jan 2023 11:29:51 +0100
Message-Id: <20230119102952.8161-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 10:30:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15591

These URIs have been updated in dunfell, but two instances were
forgotten in kirkstone/master.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: no changes

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



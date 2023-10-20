Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5644ACDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:15:48 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.52717.1697804144063220705
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 05:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=G1xdS0wH;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1697804144; x=1729340144;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XRFW3bU48E26ceeVFRUjnIxJ0OuXJamx5iUcGvSIHQ8=;
  b=G1xdS0wHSPJCGv/ppzkEjnrIgGfK0diljyGd6Qc5Ixyo5itWaG/jDPs+
   /XS8kaGC15u6OOPzoNaJKF7ZGeAsYO2xecLbBXeEef1309DyzKa46+1+s
   HagbQwKauSKl3lM/nEGIzYavNfH+V99vOo/5AP8zyKB9uvEZ80vL1TXZn
   Yja6C/RS0XzY69/8WsPG0aLDgVCVIs72BmvbDDqOdRbdEUX1Ncg1nBzh2
   wSntgpiUEJPlUQHK54FhGFWztmqg/2pFcRWC2C+SbeY1Qx/sXoEQliQaM
   8lu3+eDu3YeKXzTOEb3hkpweV+7TO7WOXZ9L1JtRZPXwck7OgjLeE+qSG
   w==;
X-IronPort-AV: E=Sophos;i="6.03,238,1694728800"; 
   d="scan'208";a="33574620"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Oct 2023 14:15:42 +0200
Received: from localhost.localdomain (SCHIFFERM-M2.tq-net.de [10.121.49.20])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 1CCDA28007F;
	Fri, 20 Oct 2023 14:15:42 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: meta-ti@lists.yoctoproject.org
Cc: oss@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [master][kirkstone][PATCH] conf: include TI_COMMON_DEPLOY in PSEUDO_IGNORE_PATHS
Date: Fri, 20 Oct 2023 14:15:30 +0200
Message-Id: <20231020121530.351358-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Oct 2023 12:15:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17155

Since the introduction of TI_COMMON_DEPLOY, we've been seeing frequent
Pseudo errors [1] breaking image build during development, in particular
with partial rebuilds due to the externalsrc bbclass.

The relevant part of the error log seems to be the following:

    ERROR: Task (/home/schifferm/Devel/src/ci-meta-tq-kirkstone/sources/meta
        -tq/meta-dumpling/recipes-images/images/tq-image-generic-debug.bb:do
	_rootfs) failed with exit code '1'
    Pseudo log:
    path mismatch [1 link]: ino 12215614 db '/home/schifferm/Devel/src/ci-me
        ta-tq-kirkstone/build-mba64xx/deploy-ti/images/tqma64xxl-mbax4xxl/tq
	-image-generic-debug-tqma64xxl-mbax4xxl-20231020091917.testdata.json
	' req '/home/schifferm/Devel/src/ci-meta-tq-kirkstone/build-mba64xx/
	tmp/work/tqma64xxl_mbax4xxl-tq-linux/tq-image-generic-debug/1.0-r0/r
	ootfs/usr/share/stress-ng/example-jobs/device.job;65324e26'.

My understanding is that all deploy dirs should be ignored by Pseudo, as
openembedded-core/meta/bitbake.conf includes the whole of DEPLOY_DIR in
PSEUDO_IGNORE_PATHS. With the introduction of TI_COMMON_DEPLOY,
DEPLOY_DIR_IMAGE is not covered by that setting anymore, so we add it in
meta-ti to avoid the issue.

[1] https://wiki.yoctoproject.org/wiki/Pseudo_Abort

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 meta-ti-bsp/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 460be02a..ffa47ae6 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -31,3 +31,4 @@ HOSTTOOLS_NONFATAL += "truncate xxd comm"
 TI_COMMON_DEPLOY ?= "${TOPDIR}/deploy-ti"
 DEPLOY_DIR_IMAGE:ti-soc = "${TI_COMMON_DEPLOY}/images/${MACHINE}"
 SDK_DEPLOY:ti-soc = "${TI_COMMON_DEPLOY}/sdk"
+PSEUDO_IGNORE_PATHS:append:ti-soc = ",${TI_COMMON_DEPLOY}"
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/



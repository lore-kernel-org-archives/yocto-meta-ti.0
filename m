Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299FAC87FDA
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 17:05:04 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.30548.1754499896010362020
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 10:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ja2X2vgu;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: b-padhi@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576H4tK1169180;
	Wed, 6 Aug 2025 12:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754499895;
	bh=0NSIOvanBA6AqD566yQQf30RZML/t3mpqm6aNbK7yzw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ja2X2vgubJVLPxTr2yFvfTM3SpR5dcZWAv5p/AKilvXYb7SvSJjk1ciODZzqJlz0p
	 Y0G3hhcwTRABkfbQthdxnZ1smLk8y3+WN+qgeovSCooPibuK6H53OMKR0ZmIKej5OG
	 gbftPeZegJgN9SJo6DLTjgEb/gO5oEoQI77hA5bo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576H4t4q3237938
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 12:04:55 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 12:04:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 12:04:54 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576H4gP83869168;
	Wed, 6 Aug 2025 12:04:52 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH v2 4/5] meta-ti-extras: ti-ipc-rtos: Remove deploy task
Date: Wed, 6 Aug 2025 22:34:41 +0530
Message-ID: <20250806170442.243461-5-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806170442.243461-1-b-padhi@ti.com>
References: <20250806170442.243461-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Aug 2025 17:05:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18900

The pre-built messageq IPC firmware is packaged into rootfs and boot
partition as part of ti-rtos-messageq-test-fw recipe in the meta-ti-bsp
layers. There is no need to deploy the vayu IPC firmware anymore. Remove
the deploy task.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 853fa117..d2ac6276 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -2,7 +2,6 @@ require recipes-ti/ipc/ti-ipc.inc
 require recipes-ti/ipc/ti-ipc-common.inc
 require ti-ipc-rtos.inc
 
-inherit deploy
 inherit update-alternatives
 
 DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native"
@@ -100,17 +99,6 @@ ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = "${nonarch_base_libdir}/firmware/ipc/ti_
 ALTERNATIVE_TARGET[dra7-ipu1-fw.xem4] = "${nonarch_base_libdir}/firmware/ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4"
 ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4"
 
-do_deploy() {
-  install -d ${DEPLOYDIR}
-}
-
-do_deploy:append:omap-a15() {
-  install -d ${DEPLOYDIR}/ipc
-  install -m 0644 ${S}/packages/ti/ipc/tests/bin/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4 ${DEPLOYDIR}/ipc/dra7-ipu1-fw.xem4
-}
-
-addtask deploy after do_install
-
 # Disable the "buildpaths" check while we figure out how we are
 # going to address this issue.
 #
-- 
2.34.1



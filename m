Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD012EB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 07:58:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.37392.1687507131264510444
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 Jun 2023 00:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Afa2XkAP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: u-kumar1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35N7woag012993
	for <meta-ti@lists.yoctoproject.org>; Fri, 23 Jun 2023 02:58:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687507130;
	bh=zFP7kVyHDD5pASEJ9qsZr/v8XTld3X370FXULMqooQg=;
	h=From:To:CC:Subject:Date;
	b=Afa2XkAPdNLk6V4t7HRyThv1AgMMtavbn3O3yrkhhuWb8BSlGcq3Wo59xhcHSiSKl
	 dT06Pa6BA0V7zLUKu6W1smUDMMVs4x4ahBz6izkh/aq0ofsYKqhgn78rJxBj2T/WE0
	 1BUeOOdJIGjAGWZF+HeMeuLQ2hQv4kGR7K0fKpqQ=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35N7woPd076370
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 23 Jun 2023 02:58:50 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 Jun 2023 02:58:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 Jun 2023 02:58:50 -0500
Received: from udit-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35N7wlqB011169;
	Fri, 23 Jun 2023 02:58:48 -0500
From: Udit Kumar <u-kumar1@ti.com>
To: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Udit Kumar <u-kumar1@ti.com>, Denys Dmytriyenko <denys@ti.com>,
        Praneeth
 Bajjuri <praneeth@ti.com>, Apurva Nandan <a-nandan@ti.com>,
        Hari Nagalla
	<hnagalla@ti.com>
Subject: [meta-ti] [kirkstone][PATCH] linux-ti-staging: add configuration for remoteproc/rpmsg IPC modules
Date: Fri, 23 Jun 2023 13:27:33 +0530
Message-ID: <20230623075732.4119753-1-u-kumar1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 Jun 2023 07:58:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16786

* rpmsg_client_sample is a test module and should not be autoloaded
* Both k3_r5 and k3_dsp remoteproc modules depend on virtio_rpmsg_bus

Cc: Denys Dmytriyenko <denys@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>
Cc: Apurva Nandan <a-nandan@ti.com>
Cc: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Udit Kumar <u-kumar1@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 69f82e8c..37296ffc 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -36,3 +36,9 @@ KERNEL_GIT_PROTOCOL = "https"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig"
 
+# Special configuration for remoteproc/rpmsg IPC modules
+module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
+module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
+module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
+KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
+
-- 
2.34.1



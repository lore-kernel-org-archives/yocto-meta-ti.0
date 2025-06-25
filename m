Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC152C7EE31
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:07:01 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.22881.1750874812047407927
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 11:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bA/03/G0;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PI6pC72182739;
	Wed, 25 Jun 2025 13:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750874811;
	bh=rI13TgBbjETrg/QMzt7xBbCv6lXDiosEw9puGFy51hM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=bA/03/G0xy78xpVq4vLfWkkOqYi9ilprIkk71zSEWMsTEM4IuazXyaQx11ABcLyxm
	 Wrrgjij6hCfPSQ7F65ilnhedBSGa3EgS/srwnQALBgqcHNkbZ9leKMJUaA1ypq7UcG
	 QcuTFLN6KmAPABd4V1brDqlI49yt8W3/y8D5Q2Ws=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PI6pdj1487441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 13:06:51 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 13:06:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 13:06:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PI6ogc4075696;
	Wed, 25 Jun 2025 13:06:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uUUWI-0004el-PN; Wed, 25 Jun 2025 13:06:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 7/7] ti-ipc-rtos: Update to handle nested git repos
Date: Wed, 25 Jun 2025 13:06:50 -0500
Message-ID: <20250625180650.17820-7-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250625180650.17820-1-reatmon@ti.com>
References: <20250625180650.17820-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 18:07:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18680

When specifying multiple git repos in the SRC_URI and you want the
"secondary" repositories to appear within the directory structure of the
primary repository, then we need to make sure that the destsuffix is
correct.  With the change to calculating the value of S to use
BB_GIT_DEFAULT_DESTSUFFIX, we need to make sure that the destsuffix is
based on that variable as well.

Also, update the paths for S to be within new source location.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
index 14ac7c77..2f93db72 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -1,7 +1,7 @@
 require recipes-ti/includes/ti-paths.inc
 
 TI_IPC_EXAMPLES_GIT_URI = "git://git.ti.com/git/ipc/ipc-examples.git"
-TI_IPC_EXAMPLES_DEST_SUFFIX = "git/ipc-examples"
+TI_IPC_EXAMPLES_DEST_SUFFIX = "${BB_GIT_DEFAULT_DESTSUFFIX}/ipc-examples"
 TI_IPC_EXAMPLES_GIT_PROTOCOL = "https"
 TI_IPC_EXAMPLES_GIT_BRANCH = "master"
 TI_IPC_EXAMPLES_NAME = "ipc-examples"
@@ -13,7 +13,7 @@ branch=${TI_IPC_EXAMPLES_GIT_BRANCH};\
 name=${TI_IPC_EXAMPLES_NAME}"
 
 TI_IPC_METADATA_GIT_URI = "git://git.ti.com/git/ipc/ipc-metadata.git"
-TI_IPC_METADATA_DEST_SUFFIX = "git/ipc-metadata"
+TI_IPC_METADATA_DEST_SUFFIX = "${BB_GIT_DEFAULT_DESTSUFFIX}/ipc-metadata"
 TI_IPC_METADATA_GIT_PROTOCOL = "https"
 TI_IPC_METADATA_GIT_BRANCH = "master"
 TI_IPC_METADATA_NAME = "ipc-metadata"
@@ -33,8 +33,8 @@ SRCREV_FORMAT = "default"
 SRCREV_ipc-metadata = "${TI_IPC_METADATA_SRCREV}"
 SRCREV_ipc-examples = "${TI_IPC_EXAMPLES_SRCREV}"
 
-S_ipc-examples = "${WORKDIR}/git/ipc-examples"
-S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
+S_ipc-examples = "${S}/ipc-examples"
+S_ipc-metadata = "${S}/ipc-metadata"
 
 RELEASE_TYPE = "GA"
 RELEASE_SUFFIX = ""
-- 
2.17.1



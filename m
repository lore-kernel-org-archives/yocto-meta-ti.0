Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4B0E8FDD1
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 06:34:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.12666.1696401292781513008
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 23:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ERXvEf5q;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3946Yp00083524
	for <meta-ti@lists.yoctoproject.org>; Wed, 4 Oct 2023 01:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696401291;
	bh=rl+mAXPy5XQGVYCVCUv6KoNDzHdibsS/JCdB79dyNNk=;
	h=From:To:CC:Subject:Date;
	b=ERXvEf5q2J/pqBAjeamuNmRD29Y2CYw/bKqaF/VYfqf4dtWa03qdhbWg40+vW6+y7
	 J5+k0ZujNVYPY8wQUyJuRDQTJcNEV8x4oMO9biFSdZu5EJK6NASMM3EURGZgYtITPU
	 q2Q6OWJJUXh+h5QMWiuByON9gyBdEfnAM6mESDfY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3946Ypok008564
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 4 Oct 2023 01:34:51 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Oct 2023 01:34:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Oct 2023 01:34:51 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3946Yn18024388;
	Wed, 4 Oct 2023 01:34:50 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 0/2] Deploy sysfw and dm binaries
Date: Wed, 4 Oct 2023 12:04:28 +0530
Message-ID: <20231004063430.703304-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Oct 2023 06:34:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17047

Deploy the ti-sysfw and ti-dm binaries to the deploy_dir, while
preserving the directory structure. This will allow directly using the
deploy_dir as input to u-boot binman build if required, and also easier
to copy these to tisdk-core-bundle's prebuilt-binaries dir

Aniket Limaye (2):
  ti-sci-fw: Deploy the fw binaries to the deploy directory
  ti-dm-dw: Preserve structure of the deployed ti-dm-fw binaries

 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb       |  6 +++---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 11 +++++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.34.1



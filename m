Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B57E95A95
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 07:09:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.55936.1696835370293157632
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 00:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CQxRdME9;
 spf=none, err=SPF record not found (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39979Tvp093872
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Oct 2023 02:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696835369;
	bh=OCX3muXd/fmNErc4PtpzTmHkVIoRPp/VLbNGhAH6yGU=;
	h=From:To:CC:Subject:Date;
	b=CQxRdME9iHm5ytoEdUaLYpsxH3ZdOmrpPyLxVaFDQsCRJL56UzeItHjH1lLwiKHBE
	 kwsnBg5sXbJpf91tXOT5J4/UXt1+fo4FuRM9E4Wr7awziF5ULdsMHZrHWQzBTn8uwA
	 nF5e7eJeNevMJFDX7djgvqiJ5Os9WNF46iwJmmxw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39979Tll009128
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Oct 2023 02:09:29 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Oct 2023 02:09:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Oct 2023 02:09:29 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39979Q0d125024;
	Mon, 9 Oct 2023 02:09:27 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <srk@ti.com>, <r-gunasekaran@ti.com>
Subject: [kirkstone][PATCH v3 0/2] Remove PRU Ethernet firmwares for legacy devices
Date: Mon, 9 Oct 2023 12:39:24 +0530
Message-ID: <20231009070926.21629-1-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Oct 2023 07:09:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17072

Linux kernel 6.1 does not have support for PRU-ICSSM driver.
So remove packaging of all the PRU-ICSSM firmwares for kernel 6.1
based SDKs.

In the v2 version, it was suggested to have the changes in the SDK layer.
But after discussion with meta-ti(Ryan) and meta-processor-sdk(Gyan)
maintainers, it was decided to introduce a new .inc file that removes the
packaging of the firmware and include it in the kernel recipes that don't
have support for PRU-ICSSM in meta-ti. This series attempts to take that
approach.

The support for PRU-ICSSM driver will be available in mainline and TI kernel
towards the end of 2024. So until such time, this approach will be followed.

v2:https://serenity.dal.design.ti.com/patchwork/project/meta-ti/patch/20230908113836.12413-1-r-gunasekaran@ti.com/
v1:https://serenity.dal.design.ti.com/patchwork/project/meta-ti/patch/20230908114439.13213-1-r-gunasekaran@ti.com/

Ravi Gunasekaran (2):
  preuth-fw: Remove packaging of PRU-ICSSM firmwares
  linux-ti-staging_6.1: Remove packaging of PRU-ICSSM firmwares

 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 1 +
 meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc           | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc


base-commit: 041271c30496bd1457cd2bd38e7d9b2f7b14372f
-- 
2.17.1



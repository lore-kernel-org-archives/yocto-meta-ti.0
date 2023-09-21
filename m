Return-Path: <anandb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D39CE71060
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 12:48:56 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.15929.1695300534165899413
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Sep 2023 05:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kRpAw/j5;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: anandb@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38LCmp2i052577;
	Thu, 21 Sep 2023 07:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695300531;
	bh=lDU/wHpf92gDv31t2Ur3CNjjU1/1keqhnjFdlM8rN2o=;
	h=From:To:CC:Subject:Date;
	b=kRpAw/j54DXDyCz6MkJl5GUgZF+AHF4NjY+ZvOgiv95rFuHgi76Y/4z8oGi+8+xyp
	 AKJYhEz8pqj8hB4THlyunEvPfPCxmvqKoDgSjUHH5StBu+9nOI+Kk9S/DxskVW/k81
	 h+9bvoa5LX+n/xwH592BJ6Xkd77ROi/2/OZv8PCU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38LCmppw004139
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Sep 2023 07:48:51 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Sep 2023 07:48:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Sep 2023 07:48:50 -0500
Received: from udta0871049.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38LCmoCc024143;
	Thu, 21 Sep 2023 07:48:50 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <s-adivi@ti.com>, <praneeth@ti.com>, <rs@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>, <denis@denix.org>,
        Anand Balagopalakrishnan
	<anandb@ti.com>
Subject: [master|kirkstone][PATCH 0/2] SGX driver enablement
Date: Thu, 21 Sep 2023 07:48:46 -0500
Message-ID: <20230921124848.3663826-1-anandb@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Sep 2023 12:48:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17001

This series enables the SGX driver for TI SoCs that contain Imagination
PowerVR SGX GPU. On Kirkstone, there are a series of assumptions between Mesa
layers and SGX user modules.

This series enables GPU driver. The recipe for SGX user mode libraries will be
posted separately.

This patch series depends on two other patches:
1. Enable gpudrive in conf -
https://lists.yoctoproject.org/g/meta-ti/message/16893
2. Enable CONFIG_PREEMPT in kernel configuration. This patch is needed on all
ARMv7 platforms - AM3/AM4/AM5. The kernel patch has been merged onto
ti-linux-6.1.y-cicd. The kernel recipe should pull in the source commit that
has CONFIG_PREEMPT. Otherwise, GPU driver build for ARMv7 platforms will fail.

Anand Balagopalakrishnan (2):
  ti-sgx-ddk-km: move to 6.1 kernel
  mesa-pvr: remove auto configurations for sgx driver

 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb           | 6 +++---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb        | 3 ---
 2 files changed, 3 insertions(+), 6 deletions(-)

-- 
2.34.1



Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC073ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 05:51:00 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.3358.1662702659666145513
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 22:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=h5VW5IT8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: m-chawdhry@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2895owAc077707
	for <meta-ti@lists.yoctoproject.org>; Fri, 9 Sep 2022 00:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662702658;
	bh=CWt1ddhQTM9rwiUiVIHyWBxHzk+iTr72DFn3DGlHi0g=;
	h=From:To:CC:Subject:Date;
	b=h5VW5IT8MfcTXI40WFIiyLaK2TNOznB+kU3j3Oq6OOTFjzEBt1w8irYBuJI1I1itv
	 920j6RBPriqnzx2zstvqsvVNiA861efEkOvi4mGb3ktXuC4up0CzUcEdUO26Qt6t/L
	 zcZRVjrJOJivd7xpT/XzQ1BAwpOE8vkwAun8+2N0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2895owQE127653
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 9 Sep 2022 00:50:58 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 9 Sep
 2022 00:50:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 9 Sep 2022 00:50:57 -0500
Received: from uda0497581.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2895otIb120128;
	Fri, 9 Sep 2022 00:50:56 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>
Subject: [meta-ti][dunfell][PATCH 0/3] Authentication of firmware images
Date: Fri, 9 Sep 2022 11:20:52 +0530
Message-ID: <20220909055055.38394-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Sep 2022 05:51:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15011

This patch series adds support for authentication of remoteproc firmware
images in uboot secure boot flow for K3 HS devices. Loading secure
firmwares require them to be present in rootfs. Adds secure firmware
binaries in rootfs.

The original binaries are NOT being replaced to keep compatibility with
Kernel remoteproc subsystem.

Uboot patch has been posted:
https://serenity.dal.design.ti.com/patchwork/project/linux-patch-review/list/?series=2830

Implements: LCPD-28882: Integrate secure firmware binaries in yocto

Manorit Chawdhry (3):
  ti-rtos-firmware: j721e-hs-evm: add secure firmware images
  ti-rtos-firmware: j7200-hs-evm: add secure firmware images
  ti-rtos-firmware: j721s2-hs-evm: add secure firmware images

 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 157 ++++++++++++++++++++-
 1 file changed, 156 insertions(+), 1 deletion(-)

-- 
2.34.1



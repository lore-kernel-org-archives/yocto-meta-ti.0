Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7E9C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 19:19:00 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.3330.1714677535936543808
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 May 2024 12:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HTO92+Gt;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442JIp8b047567;
	Thu, 2 May 2024 14:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714677531;
	bh=268Gs5XTRRDzeCegqKyoi52LZoRz2ODmrAoX7cR0nqs=;
	h=From:To:CC:Subject:Date;
	b=HTO92+GtadvRzJMdtmPEoUzf3LKx6DmDDmh39o/4EH6QxOaibt1SMExVjmGHRvqVJ
	 fl/RDQgy7lYsidQCi5a6FUzZbGwUY2JMrH6vNgvsasOOucXiMKfJ9/yTvoCvKTyWcR
	 PS7M9jEy34xH7jltaeHuviVTZjiqKcd7mD3ci/8A=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442JIpwa003638
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 May 2024 14:18:51 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 14:18:51 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 14:18:51 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442JIpgS120631;
	Thu, 2 May 2024 14:18:51 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][master/scarthgap][PATCHv2 0/3] GFX driver and mesa update
Date: Thu, 2 May 2024 14:18:40 -0500
Message-ID: <20240502191843.2380555-1-rs@ti.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 19:19:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17636

From: Randolph Sapp <rs@ti.com>

Jump the drivers to DDK 24.1.6554834 and update pvr-mesa to match the version
presented in that release.

This adds the update as a new recipe for the newer version as it requires a
change in device tree that is currently only present in the ltsprep branding.

The new mesa version is a little messy. It tends to break sstate when switching
back to default after using the ltsprep tag. The newer version isn't strictly
necessary right now, but it is recommended.

I can exclude the mesa changes, *if necessary*, until the default kernel is 6.6.

v2: Change mesa patch directory, fix ti-img-rogue-umlibs-tools RDEPENDS. Remove
reference to unverified SIGGEN_EXCLUDERECIPES_ABISAFE claim.

Randolph Sapp (3):
  ti-img-rogue-*: add ddk 24.1 recipes for ltsprep
  mesa-pvr_23.2.1: import mesa patches from oe-core/master
  mesa-pvr_23.2.1: add recipe for 23.2.1

 .../ti-img-rogue-driver_24.1.6554834.bb       |  44 ++++++
 .../0001-gallium-Fix-build-with-llvm-17.patch |  41 +++++
 ...e-cmake-dependency-detector-for-llvm.patch |  42 +++++
 ...sdetects-64bit-atomics-on-mips-clang.patch |  25 +++
 ...k-for-all-linux-host_os-combinations.patch |  43 +++++
 .../recipes-graphics/mesa/mesa-pvr_23.2.1.bb  |  58 +++++++
 .../ti-img-rogue-umlibs_24.1.6554834.bb       | 148 ++++++++++++++++++
 7 files changed, 401 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-17.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb

-- 
2.44.0



Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265F4C19F4F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:38:39 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.546.1714513111498792934
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 14:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tNwdhCqc;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43ULcUJP050219;
	Tue, 30 Apr 2024 16:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714513110;
	bh=3DEn0sFqB7ePxISIP7ORxCPS/m2IMHOt/O/1Zb9Dpb0=;
	h=From:To:CC:Subject:Date;
	b=tNwdhCqcMxXkejeJDvGBllLKgoKFHYdAjhB4E0NlPtiJ431jrMFGdPKOUEWEL4SuL
	 krRonqjBKMR1hR9HWINzWV5jB5BqyGjXgG9N6gziNslcWKCNfK6uRwmM/73dnM8o7o
	 freB4lK67hMg+Sg/lS1DU7bV5O4GCzYg0uhYhbks=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43ULcUbX027395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Apr 2024 16:38:30 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 Apr 2024 16:38:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 Apr 2024 16:38:29 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43ULcT61017153;
	Tue, 30 Apr 2024 16:38:29 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH 0/3] GFX driver and mesa update
Date: Tue, 30 Apr 2024 16:38:18 -0500
Message-ID: <20240430213821.3697267-1-rs@ti.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Apr 2024 21:38:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17620

From: Randolph Sapp <rs@ti.com>

Jump the drivers to DDK 24.1.6554834 and update pvr-mesa to match the version
presented in that release.

This adds the update as a new recipe for the newer version as it requires a
change in device tree that is currently only present in the ltsprep branding.

The new mesa version is a little messy. It tends to break sstate when switching
back to default after using the ltsprep tag. The newer version isn't strictly
necessary right now, but it is recommended.

I can exclude the mesa changes, *if necessary*, until the default kernel is 6.6.

Randolph Sapp (3):
  ti-img-rogue-*: add ddk 24.1 recipes for ltsprep
  mesa-pvr_23.2.1: import mesa patches from oe-core/master
  mesa-pvr_23.2.1: add recipe for 23.2.1

 .../ti-img-rogue-driver_24.1.6554834.bb       |  44 ++++++
 .../recipes-graphics/mesa/mesa-pvr_23.2.1.bb  |  59 +++++++
 .../0001-gallium-Fix-build-with-llvm-17.patch |  41 +++++
 ...e-cmake-dependency-detector-for-llvm.patch |  42 +++++
 ...sdetects-64bit-atomics-on-mips-clang.patch |  25 +++
 ...k-for-all-linux-host_os-combinations.patch |  43 +++++
 .../ti-img-rogue-umlibs_24.1.6554834.bb       | 149 ++++++++++++++++++
 7 files changed, 403 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/0001-gallium-Fix-build-with-llvm-17.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb

-- 
2.44.0



Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC97C021A6
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 23:48:35 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.8736.1739490505319112519
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 15:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HgrT0gfJ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51DNmOk3019865
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 13 Feb 2025 17:48:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739490504;
	bh=xhiv2BmhmiYoProZTIjUWQxyjTT5cps/izshSKbCkJc=;
	h=From:To:CC:Subject:Date;
	b=HgrT0gfJ6jhyWEFhQjJ1nK2REyvMxYl8riu28KR18gpsKbQIF3pmy/HGeS8lKIKa2
	 mOsVeMllXchbvS5wk/PLxZIkC0Q5MHzGX5VFhcMWYMFmuok1uxrE7OyUAJ8xA35UkP
	 7FJ01vLC3UtIfp5Bg2ub2XAK4lK8FC0usTXUjiUA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DNmOUK050153;
	Thu, 13 Feb 2025 17:48:24 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 17:48:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 17:48:23 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DNmNcL056749;
	Thu, 13 Feb 2025 17:48:23 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][scarthgap][PATCH 0/7] Backport GFX driver upgrades
Date: Thu, 13 Feb 2025 17:48:06 -0600
Message-ID: <20250213234813.3618729-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2025 23:48:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18312

From: Randolph Sapp <rs@ti.com>

Backport all the Graphics driver upgrades already published and tested on
master. Slight changes in patch content to deal with changed patch names and
other small conflicts.

Randolph Sapp (7):
  ti-img-rogue-*: version 24.1.6554834 -> 24.2.6643903
  mesa-pvr: version 23.2.1 -> 24.0.1
  ti-bsp: select the graphics 24.2 packages
  ti-img-rogue-umlibs: filter binaries post install
  mesa-pvr: relocate 22.3.5 patches
  ti-sgx-ddk-km: bump revision for kernel 6.12
  beagle-bsp: 6.6 select newer mesa version

 .../conf/machine/include/beagle-bsp.inc       |  2 +-
 meta-ti-bsp/conf/machine/include/ti-bsp.inc   | 12 ++--
 ...bb => ti-img-rogue-driver_24.2.6643903.bb} |  4 +-
 .../ti-sgx-ddk-km_1.17.4948957.bb             |  2 +-
 ...t-usage-of-LLVMContextSetOpaquePoint.patch |  0
 ...e-unsigned-instead-of-uint-to-fix-mu.patch |  0
 .../0001-gallium-Fix-build-with-llvm-17.patch |  0
 ...-backend-fix-gbm-compile-without-dri.patch |  0
 ...sdetects-64bit-atomics-on-mips-clang.patch |  0
 ...k-for-all-linux-host_os-combinations.patch |  0
 ...ormat-Check-for-NEON-before-using-it.patch |  0
 ...allium-Fix-build-with-llvm-18-and-19.patch | 52 -----------------
 ...e-cmake-dependency-detector-for-llvm.patch | 42 --------------
 ...e-lp_bld_misc.cpp-to-support-llvm-19.patch | 38 +++++++++++++
 .../0001-drisw-fix-build-without-dri3.patch   | 57 +++++++++++++++++++
 .../0001-gallium-Fix-build-with-llvm-17.patch |  0
 ...ll-StringMapIterator-from-llvm-scope.patch | 31 ++++++++++
 ...sdetects-64bit-atomics-on-mips-clang.patch |  0
 ...k-for-all-linux-host_os-combinations.patch | 16 +++---
 ...on-t-try-zink-if-not-enabled-in-mesa.patch | 41 +++++++++++++
 ...{mesa-pvr_23.2.1.bb => mesa-pvr_24.0.1.bb} | 16 ++----
 .../ti-img-rogue-umlibs_23.3.6512818.bb       | 10 ++--
 ...bb => ti-img-rogue-umlibs_24.2.6643903.bb} | 14 ++---
 23 files changed, 205 insertions(+), 132 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_24.1.6554834.bb => ti-img-rogue-driver_24.2.6643903.bb} (93%)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-gallium-Fix-build-with-llvm-17.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-gbm-backend-fix-gbm-compile-without-dri.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-meson.build-check-for-all-linux-host_os-combinations.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-util-format-Check-for-NEON-before-using-it.patch (100%)
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-drisw-fix-build-without-dri3.patch
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr-23.2.1 => mesa-pvr-24.0.1}/0001-gallium-Fix-build-with-llvm-17.patch (100%)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Call-StringMapIterator-from-llvm-scope.patch
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr-23.2.1 => mesa-pvr-24.0.1}/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr-23.2.1 => mesa-pvr-24.0.1}/0001-meson.build-check-for-all-linux-host_os-combinations.patch (70%)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr_23.2.1.bb => mesa-pvr_24.0.1.bb} (81%)
 rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_24.1.6554834.bb => ti-img-rogue-umlibs_24.2.6643903.bb} (94%)

-- 
2.48.1



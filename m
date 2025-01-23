Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5E9C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 01:08:36 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1252.1737594509235172516
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 17:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fP9gnd88;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50N18R5O289155
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 22 Jan 2025 19:08:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737594508;
	bh=gq2OKR/4G24YlA2SNP5Ksv5D5CNNUDZU3m1jKQ8e5Ww=;
	h=From:To:CC:Subject:Date;
	b=fP9gnd88muyE/tU/nI05PcJbjfwIIulcFUAvML6lgaeDqIGDombuSv1wI0VPpuqp6
	 A8woeSvdKQi0a2+97xSjF5q3A3Hy486Bv+wL7t2EVPlbAaAj1PJrzX+rj4RxRK7gDS
	 S/oHCO4SV7ooyRZpiGw89LlIrwjaEuYrYAI8kJn0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50N18ReY092631;
	Wed, 22 Jan 2025 19:08:27 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 19:08:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 19:08:27 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50N18RU8079409;
	Wed, 22 Jan 2025 19:08:27 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][master][PATCHv3 0/4] Rogue graphics 24.2 release
Date: Wed, 22 Jan 2025 19:08:15 -0600
Message-ID: <20250123010819.2798518-1-rs@ti.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jan 2025 01:08:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18227

From: Randolph Sapp <rs@ti.com>

Bump the rogue graphics packages for kernel 6.6 and 6.12. This has been tested
against SGX as well and has not shown any regressions.

This does not enable SGX for kernel 6.12 just yet. Still waiting on some work
from Darren before that occurs.

This also fixes a potential sstate issues when switching distro features.

Porting this for the meta-ti master branch first because the mesa version
upgrade has a merge conflict between master and scarthgap. Will wait for this to
be merged before backporting to scarthgap.

v2:
 - Fix a build issue with the kernel module when enabling CONFIG_TRACING
 - Extend the "filter binaries post install" patch to cover the 23.3 recipe
v3:
 - Fix a compilaton issue with mesa-pvr when using llvm 19

Randolph Sapp (4):
  ti-img-rogue-*: version 24.1.6554834 -> 24.2.6643903
  mesa-pvr: version 23.2.1 -> 24.0.1
  ti-bsp: select the graphics 24.2 packages
  ti-img-rogue-umlibs: filter binaries post install

 meta-ti-bsp/conf/machine/include/ti-bsp.inc   |  7 ++-
 ...bb => ti-img-rogue-driver_24.2.6643903.bb} |  4 +-
 ...allium-Fix-build-with-llvm-18-and-19.patch | 53 -----------------
 ...e-cmake-dependency-detector-for-llvm.patch | 42 --------------
 .../0001-drisw-fix-build-without-dri3.patch   | 58 +++++++++++++++++++
 .../0001-gallium-Fix-build-with-llvm-17.patch |  3 +-
 ...sdetects-64bit-atomics-on-mips-clang.patch |  4 +-
 ...k-for-all-linux-host_os-combinations.patch | 22 +++----
 ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 ++++++++++++++
 ...{mesa-pvr_23.2.1.bb => mesa-pvr_24.0.1.bb} | 14 ++---
 .../ti-img-rogue-umlibs_23.3.6512818.bb       | 10 ++--
 ...bb => ti-img-rogue-umlibs_24.2.6643903.bb} | 14 ++---
 12 files changed, 139 insertions(+), 134 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_24.1.6554834.bb => ti-img-rogue-driver_24.2.6643903.bb} (93%)
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-drisw-fix-build-without-dri3.patch
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr-23.2.1 => mesa-pvr-24.0.1}/0001-gallium-Fix-build-with-llvm-17.patch (99%)
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr-23.2.1 => mesa-pvr-24.0.1}/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch (99%)
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr-23.2.1 => mesa-pvr-24.0.1}/0001-meson.build-check-for-all-linux-host_os-combinations.patch (70%)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr_23.2.1.bb => mesa-pvr_24.0.1.bb} (81%)
 rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_24.1.6554834.bb => ti-img-rogue-umlibs_24.2.6643903.bb} (94%)

-- 
2.47.1



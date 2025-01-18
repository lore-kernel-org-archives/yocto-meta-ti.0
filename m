Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4339C02183
	for <webhook@archiver.kernel.org>; Sat, 18 Jan 2025 01:00:49 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2930.1737162048188470364
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 17:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Lo4WyDZ9;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50I10gbx422191
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 19:00:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737162042;
	bh=ECwxmywAVV/ibMzUrqgWEQo7FKS1/c/dHPyrFHk8NzQ=;
	h=From:To:CC:Subject:Date;
	b=Lo4WyDZ9jp4lAtwitdeVcof+0B38mhqPHSq3AiKvkTgBgOgVsQwKxJQ5ydwp4/oC5
	 D9mj8UorYM93easgm/zefDePd1QIukzDTpTO6fz9Z+smDTDPkrHD08S2+lXIbjuS8M
	 k45jIY6zmKltDuSSBPtMBhwgcV8yM19C+3BQD9Qk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50I10gU6004860
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jan 2025 19:00:42 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 19:00:42 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 19:00:42 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50I10gET117516;
	Fri, 17 Jan 2025 19:00:42 -0600
From: <rs@ti.com>
To: <matthias.schiffer@ew.tq-group.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCHv2 0/4] Rogue graphics 24.2 release
Date: Fri, 17 Jan 2025 19:00:28 -0600
Message-ID: <20250118010032.4092491-1-rs@ti.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 18 Jan 2025 01:00:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18203

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



Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A665AC02186
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 02:00:10 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.35783.1736820008868319881
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 18:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cYWRXExa;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50E207gk3607571
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 20:00:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736820007;
	bh=ebuOkoVqjxlZcC0aTaOjeB3PTtsU1AhIUPdpL5sjsdA=;
	h=From:To:CC:Subject:Date;
	b=cYWRXExa4bjQpzQQVsctgFdKJwgnIveRWMo8S9NlyqMMRARgwwVUJRch0AeAXAtb+
	 vLXjxSIzbdQZuUy+hkO5Eu+sdfev6aiSp2o6w5h9fpVXc+/NwSqIo2d68RlOWA7GVp
	 kfIt8s1vRGSZQwZpjk3BdjxBAuDxBK9spmzJLgyQ=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50E207Qg017630
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 20:00:07 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 20:00:05 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 20:00:05 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50E2059F124892;
	Mon, 13 Jan 2025 20:00:05 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <a-christidis@ti.com>,
        <detheridge@ti.com>
Subject: [meta-ti][master][PATCH 0/4] Rogue graphics 24.2 release
Date: Mon, 13 Jan 2025 19:59:41 -0600
Message-ID: <20250114015945.3554905-1-rs@ti.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Jan 2025 02:00:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18193

From: Randolph Sapp <rs@ti.com>

Bump the rogue graphics packages for kernel 6.6 and 6.12. This has been tested
against SGX as well and has not shown any regressions.

This does not enable SGX for kernel 6.12 just yet. Still waiting on some work
from Darren before that occurs.

This also fixes a potential sstate issues when switching distro features.

Porting this for the meta-ti master branch first because the mesa version
upgrade has a merge conflict between master and scarthgap. Will wait for this to
be merged before backporting to scarthgap.

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
 ...bb => ti-img-rogue-umlibs_24.2.6643903.bb} | 14 ++---
 11 files changed, 134 insertions(+), 129 deletions(-)
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



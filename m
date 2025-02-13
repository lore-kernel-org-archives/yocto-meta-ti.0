Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD0BC021A9
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 23:48:35 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.8738.1739490506518534345
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 15:48:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C+xo2guR;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51DNmO8B4102450
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 13 Feb 2025 17:48:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739490504;
	bh=QkJFb4l96XBFh1pfKGZdLlMi08NxSfUitKf+ztmDYyY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=C+xo2guRAtoPTTByWQoIkFxXIMdt9C5lvZ94Wqmoc1S4I9QFZb/OsynZal0n4Nbo6
	 +Uk9itN5HNOA+4axfjBkc2se+Rtps1fmYW8gxu5bJZt3XgQ9B/gR+KdxUfokzeKiTs
	 ENw+F6DCgOh67khIPjfxc9NcyVbi5ojyy2dGMQYg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DNmOSF050156;
	Thu, 13 Feb 2025 17:48:24 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 17:48:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 17:48:23 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DNmNcQ056749;
	Thu, 13 Feb 2025 17:48:23 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][scarthgap][PATCH 5/7] mesa-pvr: relocate 22.3.5 patches
Date: Thu, 13 Feb 2025 17:48:11 -0600
Message-ID: <20250213234813.3618729-6-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213234813.3618729-1-rs@ti.com>
References: <20250213234813.3618729-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2025 23:48:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18313

From: Randolph Sapp <rs@ti.com>

Relocate the patches for 22.3.5 to the mesa-pvr-22.3.5 subdirectory so
it's more clear what version of mesa they apply to.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch | 0
 ...001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch | 0
 .../0001-gallium-Fix-build-with-llvm-17.patch                     | 0
 .../0001-gbm-backend-fix-gbm-compile-without-dri.patch            | 0
 .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch       | 0
 ...001-meson.build-check-for-all-linux-host_os-combinations.patch | 0
 .../0001-util-format-Check-for-NEON-before-using-it.patch         | 0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-gallium-Fix-build-with-llvm-17.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-gbm-backend-fix-gbm-compile-without-dri.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-meson.build-check-for-all-linux-host_os-combinations.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{files => mesa-pvr-22.3.5}/0001-util-format-Check-for-NEON-before-using-it.patch (100%)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/files/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-17.patch
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-17.patch
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gbm-backend-fix-gbm-compile-without-dri.patch
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gbm-backend-fix-gbm-compile-without-dri.patch
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson.build-check-for-all-linux-host_os-combinations.patch
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson.build-check-for-all-linux-host_os-combinations.patch
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-util-format-Check-for-NEON-before-using-it.patch
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-util-format-Check-for-NEON-before-using-it.patch
-- 
2.48.1



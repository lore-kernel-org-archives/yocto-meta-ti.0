Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2642C61D9D
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 03:08:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.65878.1674702519835514462
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 19:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hchCxIhy;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30Q38cbq067580
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 21:08:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674702518;
	bh=Ym1iOU6h7s4SgbScyJHejHzsi1gp897U+YHctsYxVh8=;
	h=From:To:CC:Subject:Date;
	b=hchCxIhyS50IhroNrYmNDIgbFVsgtX7RSc9K3DyIscYVgrk5uxWH5SSD4CRXfBIXu
	 7nMsDLFsOX6PW00K5R8lViJFqobWdGnJFw5/TCuKYjeya2oaYC0Vf8Jj24XyauRFzB
	 ahPOwfy3ztco13dj/zRRUmrDxqkoUPvgqy487UhY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30Q38cSo025867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 21:08:38 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 21:08:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 21:08:38 -0600
Received: from res.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30Q38clW120484;
	Wed, 25 Jan 2023 21:08:38 -0600
From: Randolph Sapp <rs@ti.com>
To: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [kirkstone PATCH 0/4] Graphics, graphics, and more graphics
Date: Wed, 25 Jan 2023 21:08:30 -0600
Message-ID: <20230126030834.3889448-1-rs@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 03:08:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15663

Alright, this is the 6th revision of this patch. This uses a revised
dependency chain (hopefully it's a little more logical) and some, well,
interesting switching logic using the PACKAGECONFIG and
virtual/gpudriver PREFERRED_PROVIDER override variable. I'm not sure how
I feel about it, but it solves the issue of silently configuring things
as needed without other layers manually enabling features.

We basically dynamically adjust mesa's PACKAGECONFIG based on what our
selected gpudriver (and display controller, thanks sgx) is. We also add
a runtime recommendation on the gpudriver after this configuration.

The gpudriver providers didn't change too much, they just have a runtime
recommendation for the associated um components. As it stands, the um
components can live alongside the software rendering components thanks
to the mesa-megadriver being able to automatically switch as necessary
at runtime, so we will not clobber mesa's usual packages.

Then we drop all mentions of the gpu machine feature for good measure.

"Why didn't you just add preferred providers for libgles2, etc, etc."
Well, software rendering. If we do that we'll have to edit the
PACKAGECONFIG to drop gles components from mesa, disabling software
rendering. We could add a dynamic switch to do that, but honestly
keeping in line with KISS, this solution has fewer lines and less logic
while keeping swrast as a nice fallback for whenever anything really
goes south... not that I'm expecting that or anything.

Randolph Sapp (4):
  meta-ti-bsp: mesa: Add current patches
  meta-ti-bsp: graphics: Resolve dependency chain
  meta-ti-bsp: machine: Remove all gpu features
  meta-ti-bsp: machine: Attempt to update DC alias

 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |   2 -
 meta-ti-bsp/conf/machine/include/am62xx.inc   |   6 +-
 meta-ti-bsp/conf/machine/include/am65xx.inc   |   6 +-
 meta-ti-bsp/conf/machine/include/j721e.inc    |   6 -
 meta-ti-bsp/conf/machine/include/j721s2.inc   |   6 -
 meta-ti-bsp/conf/machine/include/j784s4.inc   |   6 -
 meta-ti-bsp/conf/machine/include/omap-a15.inc |   9 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    |   9 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    |   9 +-
 meta-ti-bsp/conf/machine/j784s4-evm.conf      |   2 +
 ...-OpenEmbedded-nodistro-internal-aarc.patch |  29 ----
 ...bb => ti-img-rogue-driver_1.18.6276027.bb} |  20 +--
 .../ti-sgx-ddk-km_1.17.4948957.bb             |   8 +-
 .../ti-img-rogue-umlibs_1.15.6133109.bb       |  71 --------
 .../ti-img-rogue-umlibs_1.18.6276027.bb       |  39 +++++
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |  31 +---
 ...nd-deprecate-drm_handle_format-and-d.patch | 158 ++++++++++++++++++
 ...fine-__NR_futex-if-it-does-not-exist.patch |  34 ++++
 ...sdetects-64bit-atomics-on-mips-clang.patch |  25 +++
 ...k-for-all-linux-host_os-combinations.patch |  43 +++++
 ...ormat-Check-for-NEON-before-using-it.patch |  47 ++++++
 ...02-meson.build-make-TLS-ELF-optional.patch |  61 +++++++
 .../mesa/mesa-gl_22.0.%.bbappend              |   1 +
 .../mesa/mesa_22.0.%.bbappend                 |   2 +
 .../recipes-graphics/mesa/pvr-mesa.inc        |  39 +++++
 25 files changed, 484 insertions(+), 185 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.15.6133109.bb => ti-img-rogue-driver_1.18.6276027.bb} (72%)
 delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc

-- 
2.34.1



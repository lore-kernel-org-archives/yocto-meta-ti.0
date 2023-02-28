Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126A4C7EE30
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 00:37:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.12132.1677544671514143405
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Feb 2023 16:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hzjXMeBR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31S0bovS074791
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 18:37:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677544670;
	bh=i/ODO2uvXLIESX1YwuCxvDitXPrXYaC+5EsGDnXX/jo=;
	h=From:To:CC:Subject:Date;
	b=hzjXMeBRYOxyYZnv9po7tSsM1Shj5KVjt7bs35xrjEYcNjHRmKeHHBSIMe6b14kWp
	 l0PQ72HhT2JErqYI9INLy+o03mfRAkH276xLwsyUwBMu0uJ7ErsPVo4KZzcCRiG383
	 Rquosk3k0ZAy7NJE/QN+NX/OS9gF4BNPYUOIr4Dk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31S0bo10049226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 18:37:50 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 27
 Feb 2023 18:37:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 27 Feb 2023 18:37:49 -0600
Received: from res-desktop.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31S0bnpF029039;
	Mon, 27 Feb 2023 18:37:49 -0600
From: Randolph Sapp <rs@ti.com>
To: denys <denys@ti.com>, reatmon <reatmon@ti.com>, afd <afd@ti.com>
CC: detheridge <detheridge@ti.com>, meta-ti <meta-ti@lists.yoctoproject.org>,
        Randolph Sapp <rs@ti.com>
Subject: [kirkstone][PATCH v8 0/4] Graphics, graphics, and more graphics
Date: Mon, 27 Feb 2023 18:37:41 -0600
Message-ID: <20230228003745.2884357-1-rs@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Feb 2023 00:37:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15961

Alright, this is the 8th revision of this patch. This uses a revised
dependency chain (hopefully it's a little more logical) and some, well,
interesting switching logic using the PACKAGECONFIG and
virtual/gpudriver PREFERRED_PROVIDER override variable. I'm not sure how
I feel about it, but it solves the issue of silently configuring things
as needed without other layers manually enabling features.

This dynamically adjusts mesa's PACKAGECONFIG based on what our selected
gpudriver (and display controller, thanks sgx) is. We also add a runtime
recommendation on the gpudriver after this configuration.

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

Edits:
 - Add a path to fall back to a fully unedited mesa. (opengl with no
   preferred provider for gpudriver)
 - Drop the commit adding patches from oe-core. Use the SRC_URI appends
   / remove combo (thanks Jose Quaresma)
 - Clean up the j784s4 machine config.

SGX is currently unable to build with this. We'll unset the related
preferred provider variables for those platforms so they fall back to
software rendering while we work on that.

Randolph Sapp (4):
  meta-ti-bsp: graphics: Resolve dependency chain
  meta-ti-bsp: machine: Remove all gpu features
  meta-ti-bsp: machine: Attempt to update DC alias
  conf: sgx: Unset graphics preferred providers

 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  2 -
 meta-ti-bsp/conf/machine/include/am62xx.inc   |  6 +-
 meta-ti-bsp/conf/machine/include/am65xx.inc   |  8 +--
 meta-ti-bsp/conf/machine/include/j721e.inc    |  6 --
 meta-ti-bsp/conf/machine/include/j721s2.inc   |  6 --
 meta-ti-bsp/conf/machine/include/j784s4.inc   |  6 --
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 11 ++-
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 11 ++-
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 11 ++-
 ...-OpenEmbedded-nodistro-internal-aarc.patch | 28 --------
 ...bb => ti-img-rogue-driver_1.18.6276027.bb} | 20 +++---
 .../ti-sgx-ddk-km_1.17.4948957.bb             |  8 +--
 .../ti-img-rogue-umlibs_1.15.6133109.bb       | 71 -------------------
 .../ti-img-rogue-umlibs_1.18.6276027.bb       | 39 ++++++++++
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 31 +-------
 .../mesa/mesa-gl_22.0.%.bbappend              |  1 +
 .../mesa/mesa_22.0.%.bbappend                 |  1 +
 .../recipes-graphics/mesa/pvr-mesa.inc        | 33 +++++++++
 18 files changed, 107 insertions(+), 192 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.15.6133109.bb => ti-img-rogue-driver_1.18.6276027.bb} (72%)
 delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc

-- 
2.39.2



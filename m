Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420FDC77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 16:19:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.14982.1681489157102841641
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Apr 2023 09:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XgsYFoMt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33EGJG7H095622
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 11:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681489156;
	bh=2ekWbZv69XsXf/bOK5XVRmsnUljsbw+/vivcj0oRPSc=;
	h=From:To:CC:Subject:Date;
	b=XgsYFoMtRX1xXKfdU43FppPfxbdZ5Nca4ylLNrzQbNR3/v9+GrYWhs3GMZ2/jCBt7
	 OpS9e3KyXLNXrZQxv9L6woMq+CXk/hKNcWoMyfMxLC1Mfaa2gE6jxOu1iUsdP2zvr9
	 fKemtGBOxjB/iDQOd962EPUyLceTwHP3cmSLCFGU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33EGJGNm033938
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 11:19:16 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 14
 Apr 2023 11:19:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 14 Apr 2023 11:19:16 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33EGJFYK048253;
	Fri, 14 Apr 2023 11:19:15 -0500
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [PATCH v2][kirkstone 0/3] Rogue graphics DDK 23.1 upgrade
Date: Fri, 14 Apr 2023 11:19:10 -0500
Message-ID: <20230414161913.1674131-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 16:19:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16396

Graphics DDK 23.1 upgrade! Rolling forward mesa and the um and km
components accordingly. Now we'll be using Mesa 22.3.5 so we'll have to
pull in those patches and rework a bit of the PACKAGECONFIG to get it to
work with the base Mesa recipe.

This adds support for kernel 6.1 (it is still fully compatible with
kernel 5.10.y though, please don't try to sort this out with some extra
logic).

Randolph Sapp (3):
  mesa: locally overlay 22.3.5-specific patches from oe-core/master
  mesa: update pvr-mesa for the 22.3.5 version of mesa
  graphics: upgrade rogue graphics to 23.1.6404501

 ...bb => ti-img-rogue-driver_23.1.6404501.bb} |   4 +-
 ...bb => ti-img-rogue-umlibs_23.1.6404501.bb} |   6 +-
 ...nd-deprecate-drm_handle_format-and-d.patch | 157 ------------------
 ...e-unsigned-instead-of-uint-to-fix-mu.patch |  44 +++++
 ...fine-__NR_futex-if-it-does-not-exist.patch |  34 ----
 ...-backend-fix-gbm-compile-without-dri.patch |  65 ++++++++
 ...sdetects-64bit-atomics-on-mips-clang.patch |   6 +-
 ...k-for-all-linux-host_os-combinations.patch |  24 +--
 ...ormat-Check-for-NEON-before-using-it.patch |  12 +-
 ...02-meson.build-make-TLS-ELF-optional.patch |  61 -------
 .../recipes-graphics/mesa/pvr-mesa.inc        |  15 +-
 11 files changed, 144 insertions(+), 284 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.18.6276027.bb => ti-img-rogue-driver_23.1.6404501.bb} (92%)
 rename meta-ti-bsp/recipes-graphics/libgles/{ti-img-rogue-umlibs_1.18.6276027.bb => ti-img-rogue-umlibs_23.1.6404501.bb} (86%)
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch

-- 
2.40.0

I accidentally committed the SRC_URI of the test repo in the last
revision. This just drops that change.


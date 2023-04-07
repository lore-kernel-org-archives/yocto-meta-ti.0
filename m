Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AF9C761A6
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 00:59:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.174712.1680829181290171072
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 17:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nZH0r5px;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3370xagR068454;
	Thu, 6 Apr 2023 19:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680829176;
	bh=SHw+fFB7a8FoikNWYGa6LUHv0uuwAqPVyrNEK0X50ls=;
	h=From:To:CC:Subject:Date;
	b=nZH0r5pxnPFV85+84EwbGMPiUKzImhVwbBGQKJWiKkZZ4hH5wi5eIv20vRplXtPGp
	 pE/2iGGoMS+RNdDlezHIy8a4Q746YlNsa2AW0SyUQ6sz9FoPhHRLoYJabB+2fL6Rov
	 g6//bspKy+XueG/3tmroby+XQJlg/jcf4SIcXIIQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3370xaVX119239
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Apr 2023 19:59:36 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 6
 Apr 2023 19:59:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 6 Apr 2023 19:59:36 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3370xax3019574;
	Thu, 6 Apr 2023 19:59:36 -0500
From: Randolph Sapp <rs@ti.com>
To: <afd@ti.com>, <denis@denix.org>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [PATCH][kirkstone 0/3] Rogue graphics DDK 23.1 upgrade
Date: Thu, 6 Apr 2023 19:59:29 -0500
Message-ID: <20230407005932.322037-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 00:59:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16319

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



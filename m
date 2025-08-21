Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F59CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 14:25:22 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.11022.1755786316137008050
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 07:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ynqoSWeP;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LEPFpY503496
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 09:25:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755786315; i=@ti.com;
	bh=e56vnMmaLj7OQSb8zV3YeucPXoyRUIi5clELxKXyg7o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ynqoSWePHnGDq7g9fSMk9HRIrqWVl7kYtydOqLVufeuXh1ZucVgsqwYB3NRjhW58t
	 I69y3tFscu/iH3xzOrpgTKn1UmeHU0ionqYT0npi8XfhiELhBhYm3qN8vfcRKsfGzK
	 esdVi6LnG+ALpg7qgaoLxQ0nxwQvpQUhphyXJ3GM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LEPFiT2012003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 09:25:15 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 09:25:15 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 09:25:15 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LEPFKN2482440;
	Thu, 21 Aug 2025 09:25:15 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id F176713F531; Thu, 21 Aug 2025 09:25:14 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <afd@ti.com>, <detheridge@ti.com>,
        <rs@ti.com>, <b-brnich@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
Date: Thu, 21 Aug 2025 09:25:14 -0500
Message-ID: <20250821142514.384847-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250821032055.388954-1-t-lannynd@ti.com>
References: <20250821032055.388954-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 14:25:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18949

meta-ti / na / 20250821032055.388954-1-t-lannynd

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/scarthgap][PATCH] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
- Submitter: From: "Thorsten Lannynd" <t-lannynd@ti.com>
- Date: Date: Wed, 20 Aug 2025 22:20:55 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3e0bb1caa6ceac39d7a010cf216f72ca24e9a4dd

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508210100
- Commit SHA: cd2a61edf64076dd8f2e6887e3dd4f6ad66f9fa9

Patches
----------------------------------------
FAIL - [meta-ti][master/scarthgap][PATCH] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
    error: patch failed: meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb:21
    error: meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb: patch does not apply
    Applying: ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
    Patch failed at 0001 ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks

scarthgap
=====================
Summary:
- Patch Series: [meta-ti][master/scarthgap][PATCH] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
- Submitter: From: "Thorsten Lannynd" <t-lannynd@ti.com>
- Date: Date: Wed, 20 Aug 2025 22:20:55 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3e0bb1caa6ceac39d7a010cf216f72ca24e9a4dd

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202508201111
- Commit SHA: 76f78bab9b6cd7d28bf28411783acfce0d746aca

Patches
----------------------------------------
All patches applied





Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CADFCCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 12:00:19 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.41636.1760356816471865440
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 05:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ngWDGNgl;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DC0GtY1253053
	for <meta-ti@lists.yoctoproject.org>; Mon, 13 Oct 2025 07:00:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760356816; i=@ti.com;
	bh=eF6Qwbqc0oqtsjTydiIgAakPPjnCHZSZoUUBlAidsT8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ngWDGNglkPaMG5aHYZ5SQAiIeBwI8v2p1y3fOxNo9yKRwj5tmDNnTgIVF7h9tXdOz
	 fgZw2ylBW6lOI4miVhHKmAZSpvM6+83plk+bJ7ocztR+lb1xUDFdUMMTJaVVFZqwPk
	 MGwP0RViIeI+WnUHdaXqvtJWhCKYZXfJnfpoQr9M=
Received: from DLEE209.ent.ti.com (dlee209.ent.ti.com [157.170.170.98])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DC0FRs3788221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 13 Oct 2025 07:00:16 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 07:00:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 07:00:15 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DC0F3Q1772768;
	Mon, 13 Oct 2025 07:00:15 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6015F13F52D; Mon, 13 Oct 2025 07:00:15 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>,
        <v-singh1@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>,
        <khasim@ti.com>
Subject: Re: [master/scarthgap][PATCH] ti-dm-fw: Update DM for am62dxx
Date: Mon, 13 Oct 2025 07:00:15 -0500
Message-ID: <20251013120015.4074485-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251013115734.1403394-1-p-bhagat@ti.com>
References: <20251013115734.1403394-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Oct 2025 12:00:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19117

meta-ti / na / 20251013115734.1403394-1-p-bhagat

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/scarthgap][PATCH] ti-dm-fw: Update DM for am62dxx
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Mon, 13 Oct 2025 17:27:34 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d31f5b70eac994536830b1725f1682f886ba0e19

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: u-boot-ti-mainline: Update to version: v2025.10
- Commit SHA: 75029083053a1f5b0fa816699621220f89ebf93f

Patches
----------------------------------------
All patches applied

scarthgap
=====================
Summary:
- Patch Series: [master/scarthgap][PATCH] ti-dm-fw: Update DM for am62dxx
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Mon, 13 Oct 2025 17:27:34 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d31f5b70eac994536830b1725f1682f886ba0e19

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: meta-ti-extras: dsptop: Explicitly allow build for AM57x
- Commit SHA: c8c3142da3517745c28232b4c910988235c721b0

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-ti-bsp/conf/machine/include/am62axx.inc:15
            TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  = "kernel-module-tps6594-i2c"
    
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-ti-bsp/conf/machine/include/am62axx.inc:16
            TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  = "kernel-module-tps6594-i2c"
    
    
    Code Summary
    ============
    
    APPEND-2
    -------------------------------------------
      :append simply takes the specified string and concatenates it
      directly to the variable.  Most of the time we want there to spaces
      between entries.  This check flags us to check if the missing space
      is actually needed.

scarthgap
=====================
PASS





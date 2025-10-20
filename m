Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496B5CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 13:05:37 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.18157.1760965532132264885
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 06:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dnnC9x5S;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59KD5VUp2998073;
	Mon, 20 Oct 2025 08:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760965531; i=@ti.com;
	bh=kZF0M+0VtDmE6IFWiBvVK5QhA/LGtIn463/u7DdC008=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dnnC9x5ScHGQoRHpoyB9p3NwYJgfnzDg6C6CKYG1uULVSXfVZQfzTtzDHQ5VFl3JF
	 nWUgYhQFfk/QAif4yip1syJI1GNmrYiSZNHbp87QE+KBS3CiEsTV6T0ELaTXXCuYgq
	 Lonl30U9im2tFA2DdoIjW2dPBLR/3IVxLAV1Z81Q=
Received: from DLEE208.ent.ti.com (dlee208.ent.ti.com [157.170.170.97])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59KD5Usk026420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Oct 2025 08:05:30 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Oct
 2025 08:05:30 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 20 Oct 2025 08:05:30 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59KD5U6J1650985;
	Mon, 20 Oct 2025 08:05:30 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 87C9413F538; Mon, 20 Oct 2025 08:05:30 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510200100
Date: Mon, 20 Oct 2025 08:05:30 -0500
Message-ID: <20251020130530.575460-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251020130348.270516-1-lcpdbld@list.ti.com>
References: <20251020130348.270516-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Oct 2025 13:05:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19147

meta-ti / na / 20251020130348.270516-1-lcpdbld

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510200100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.master.202510200100. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510200100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 20 Oct 2025 08:03:48 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 50b832b0110b2374453e32204c0b32ab74cb6ddb

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202510200100
- Commit SHA: 79836f10b9b3a08905a13a8f09cd045191f03c8b

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510200100
    error: patch failed: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc:15
    error: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc:8
    error: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb:6
    error: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb:10
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb:22
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb: patch does not apply
    Applying: CI/CD Auto-Merger: cicd.master.202510200100
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master.202510200100





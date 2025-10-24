Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1277ACCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 13:35:21 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.11094.1761312919451881584
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 06:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LwJFWsvh;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59ODZI7w1911800;
	Fri, 24 Oct 2025 08:35:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761312918; i=@ti.com;
	bh=Cta0baZ5rJJoaLuUMXKp6D95NIXAUH2L5nA+Y+8fsyg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LwJFWsvh7fR3ZMU7qrcL2Xtq8rhPgVFDzDhP2JpOq/hzfhTt5Ql4IZxk5+FcDGHaZ
	 K4bAzCa1d7eD/3iYUcvjFKEJ71aXg7rjp6S/qN/93UDR2RigcvQ7lIzXTB6d8Ay8j8
	 aIFBIsfv4m4HZf3d51jePqtDU6oikdjrzSDTYj+k=
Received: from DLEE209.ent.ti.com (dlee209.ent.ti.com [157.170.170.98])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59ODZIaI3910993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 08:35:18 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 08:35:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 08:35:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59ODZIjJ399581;
	Fri, 24 Oct 2025 08:35:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3866518122B; Fri, 24 Oct 2025 08:35:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510240100
Date: Fri, 24 Oct 2025 08:35:18 -0500
Message-ID: <20251024133518.2608012-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251024133307.804966-1-lcpdbld@list.ti.com>
References: <20251024133307.804966-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Oct 2025 13:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19168

meta-ti / na / 20251024133307.804966-1-lcpdbld

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510240100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.master.202510240100. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510240100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 24 Oct 2025 08:33:07 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a4822c4b030deed1bdc19f0216082714ef1a450c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202510240100
- Commit SHA: 6b9a2b322512ab94e67ef36249b6df2633b29b2d

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510240100
    error: patch failed: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc:21
    error: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb:6
    error: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb:10
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb:22
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb: patch does not apply
    Applying: CI/CD Auto-Merger: cicd.master.202510240100
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master.202510240100





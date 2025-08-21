Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAA5CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 08:50:20 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.4618.1755766214334071001
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 01:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RyxOmOQG;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57L8oC2O3332172;
	Thu, 21 Aug 2025 03:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755766212; i=@ti.com;
	bh=qRkA5oMT5um4azQW84kytzJYYY8ZZvPGcLyy8As251c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RyxOmOQGOcZXP7mBKEuU2BbyESgnZyPGj4iMoRmJhfrMVm81xbC1EOg/64XxUz3TM
	 9bWqvt5+9x6XvrMr4uNjYMYjaI7PsKQF1qq3QsY2qv1MC9qtNfXFIabG6hsoIS1WRw
	 NUJe3mWKbe0+Se9uS1W3O8h8uNAJhFVvbdAmqhRE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57L8oCB51834339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 03:50:12 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 03:50:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 03:50:12 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57L8oCuJ1899079;
	Thu, 21 Aug 2025 03:50:12 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 2BF1E142E38; Thu, 21 Aug 2025 03:50:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508210100
Date: Thu, 21 Aug 2025 03:50:12 -0500
Message-ID: <20250821085012.2017234-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250821084854.1293608-1-lcpdbld@list.ti.com>
References: <20250821084854.1293608-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 08:50:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18946

meta-ti / na / 20250821084854.1293608-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508210100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 21 Aug 2025 03:48:54 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 03c64cad50aa4be93f0a57d5de2684fb943037af

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508210100
- Commit SHA: cd2a61edf64076dd8f2e6887e3dd4f6ad66f9fa9

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508210100
    error: patch failed: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc:20
    error: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc:8
    error: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb:6
    error: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb:10
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb:22
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb: patch does not apply
    Applying: CI/CD Auto-Merger: cicd.master.202508210100
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master.202508210100





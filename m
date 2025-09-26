Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E348FCAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:15:19 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.12515.1758874514539348132
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 01:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uPfiMWwY;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58Q8FDGV2107987;
	Fri, 26 Sep 2025 03:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758874513; i=@ti.com;
	bh=9sge7+d8GsBVBYyCRm/Cfd6rtMPMfXenZahbszTLAjw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uPfiMWwY/1b2CGC0etnDP+zk7MzIwxNNbsx/KbJYVR/oPxiglTim3x/4MUVRdNUw3
	 MVFW+NGSuYKFZPrgUvnvd3B4VAegAJe4Y9SOHPa8S2WH2osHXju688KVqHczm5HXDu
	 KP0yiBHVQrMMSQ0yUORK25ZukYjPJawe27Q4wezs=
Received: from DFLE214.ent.ti.com (dfle214.ent.ti.com [10.64.6.72])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58Q8FDIK3843904
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Sep 2025 03:15:13 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 26 Sep
 2025 03:15:12 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 26 Sep 2025 03:15:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58Q8FC0F2740612;
	Fri, 26 Sep 2025 03:15:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CA45C181222; Fri, 26 Sep 2025 03:15:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202509260100
Date: Fri, 26 Sep 2025 03:15:12 -0500
Message-ID: <20250926081512.2622359-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250926081209.2079048-1-lcpdbld@list.ti.com>
References: <20250926081209.2079048-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Sep 2025 08:15:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19065

meta-ti / na / 20250926081209.2079048-1-lcpdbld

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202509260100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.master.202509260100. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202509260100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 26 Sep 2025 03:12:09 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fb4dcbfd36d7c79a712b9d16081c441206a551ea

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202509260100
- Commit SHA: 0027b3c13fe9fdad226825536db81647a8493ce1

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202509260100
    error: patch failed: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc:21
    error: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc:8
    error: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb:6
    error: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb:10
    error: meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb:10
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb:22
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb: patch does not apply
    Applying: CI/CD Auto-Merger: cicd.master.202509260100
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master.202509260100





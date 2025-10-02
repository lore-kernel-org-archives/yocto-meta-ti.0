Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E409CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 14:00:18 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.9751.1759413615977621954
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 07:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Bj++tyA1;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592E0Det2844115;
	Thu, 2 Oct 2025 09:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759413613; i=@ti.com;
	bh=TJLK0bZVIERFomQxZl/7i4S03Lt0LnfDpTJHm2uc6s0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Bj++tyA1PREu15HTV/kW+Gz8ac7kP+6Wr3Dxi5ibc+9+8YpbM6LqMi5LyGgM7uIrW
	 R+7gwgp/fW9TkUm/xzoo9lXwytH1Af9wPIrV6mZUvDNa6vAT1HS4ODqzRn2r3+bg0o
	 3O7y6l9XAdzmBYNywR8LjvsO00uzLkG2E0WaDwjg=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592E0D6U066251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Oct 2025 09:00:13 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 09:00:12 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 09:00:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592E0CAu084939;
	Thu, 2 Oct 2025 09:00:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B16DD168FED; Thu,  2 Oct 2025 09:00:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap/master][PATCH 1/4] meta-ti-extras: gdbc6x: Simplify for DRA7xx only build
Date: Thu, 2 Oct 2025 09:00:12 -0500
Message-ID: <20251002140012.124048-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251002135453.1820662-1-afd@ti.com>
References: <20251002135453.1820662-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Oct 2025 14:00:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19100

meta-ti / na / 20251002135453.1820662-1-afd

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap/master][PATCH 1/4] meta-ti-extras: gdbc6x: Simplify for DRA7xx only build
    WARN: Commit message does not include file/recipe name: meta-ti-extras: gdbc6x: Simplify for DRA7xx only build. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-extras: gdbc6x: Simplify for DRA7xx only build.
              meta-ti-extras:
              gdbc6x: (COMMIT-MESSAGE-3)
        patch
WARN - [meta-ti][scarthgap/master][PATCH 2/4] meta-ti-extras: dsptop: Simplify for DRA7xx only build
    WARN: Commit message should not include directory path to recipe: meta-ti-extras: dsptop: Simplify for DRA7xx only build.
              meta-ti-extras:
              dsptop: (COMMIT-MESSAGE-3)
        patch
WARN - [meta-ti][scarthgap/master][PATCH 3/4] meta-ti-extras: gdbc6x: Explicitly allow build for AM57x
    WARN: Commit message should not include directory path to recipe: meta-ti-extras: gdbc6x: Explicitly allow build for AM57x.
              meta-ti-extras:
              gdbc6x: (COMMIT-MESSAGE-3)
        patch
WARN - [meta-ti][scarthgap/master][PATCH 4/4] meta-ti-extras: dsptop: Explicitly allow build for AM57x
    WARN: Commit message should not include directory path to recipe: meta-ti-extras: dsptop: Explicitly allow build for AM57x.
              meta-ti-extras:
              dsptop: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: FAIL
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH 1/4] meta-ti-extras: gdbc6x: Simplify for DRA7xx only build
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 2 Oct 2025 08:54:50 -0500
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 3038a2795636df482f21bb9d51f2f5cc19c0dac1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509260858
- Commit SHA: 9a30c7b97a979fa66cb22b2c2ce1d3b7d466ee24

Patches
----------------------------------------
FAIL - [meta-ti][scarthgap/master][PATCH 1/4] meta-ti-extras: gdbc6x: Simplify for DRA7xx only build
    error: patch failed: meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb:8
    error: meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb: patch does not apply
    Applying: meta-ti-extras: gdbc6x: Simplify for DRA7xx only build
    Patch failed at 0001 meta-ti-extras: gdbc6x: Simplify for DRA7xx only build

master
=====================
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH 1/4] meta-ti-extras: gdbc6x: Simplify for DRA7xx only build
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 2 Oct 2025 08:54:50 -0500
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 3038a2795636df482f21bb9d51f2f5cc19c0dac1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: MD Danish Anwar <danishanwar@ti.com>
- Commit Subject: meta-ti-bsp: Add pruprp-fw for AM64xx
- Commit SHA: b22a780fead09cdb8ce7d827560831bed2cceb27

Patches
----------------------------------------
All patches applied





Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4704FCCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 21:30:20 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.77.1761255016224512296
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 14:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=E5vHNaUJ;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59NLUFQj1771204;
	Thu, 23 Oct 2025 16:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761255015; i=@ti.com;
	bh=gFtnE07I2ddMy4NSfY72U1SHm0t+Rq6uqXr9rFKsCwc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=E5vHNaUJjOngiMM6EFMIz66vQZbaeo9/bqGyhaH4tdMWG/9bkWL9DXULzunDaOEie
	 XQpXGTaqaoJ1e4239EDVVaLRPeWq6OKr76eQJbsdc4rh13txGyN7Sz2THEh/wsF+/b
	 xAWR02jcUl2MmoCJ5chIX+DVXzVvfsjs7U68epUw=
Received: from DLEE211.ent.ti.com (dlee211.ent.ti.com [157.170.170.113])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59NLUFXg2992711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Oct 2025 16:30:15 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 16:30:14 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 16:30:14 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59NLUEDK628360;
	Thu, 23 Oct 2025 16:30:14 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D1D0E18122A; Thu, 23 Oct 2025 16:30:14 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510231214
Date: Thu, 23 Oct 2025 16:30:14 -0500
Message-ID: <20251023213014.3559996-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251023212622.4160109-1-lcpdbld@list.ti.com>
References: <20251023212622.4160109-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Oct 2025 21:30:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19166

meta-ti / na / 20251023212622.4160109-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510231214
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.scarthgap.202510231214. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510231214
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 23 Oct 2025 16:26:22 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3f4b594a303e27c0f2299ef74b9044c126b451f1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Commit Subject: conf: am335x-evm and am437x-evm: Bump up max_leb_cnt
- Commit SHA: e56e34653dac9181449669db60a616912e0f6fb5

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





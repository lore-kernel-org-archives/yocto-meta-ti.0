Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4E0CCD184
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 04:25:21 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.5214.1760156714284186708
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Oct 2025 21:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ecgR3TW2;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59B4PCuO386397;
	Fri, 10 Oct 2025 23:25:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760156712; i=@ti.com;
	bh=jEiRVPrFC9+ek+Mz8koqmj+udCi0NYjkC2/fHnlfIQY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ecgR3TW2UDyWTQVegPssaMiBXkdqtZC+Hre5Gj4VoHlprqAN8EcDOsrshzmcgDzH4
	 5mq07meIqBFxfPgzJRebM0dT8KpTukxJWxNqlMUTizddpyvASKkQNhwnULedMWrenK
	 tRGWpcT3cCqBNavYRy8A54Q2jorSSrnM339P8OnU=
Received: from DLEE215.ent.ti.com (dlee215.ent.ti.com [157.170.170.118])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59B4PCTY1282508
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Oct 2025 23:25:12 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 23:25:12 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 23:25:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59B4PCI63819502;
	Fri, 10 Oct 2025 23:25:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6577013F536; Fri, 10 Oct 2025 23:25:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2025.10
Date: Fri, 10 Oct 2025 23:25:12 -0500
Message-ID: <20251011042512.2300426-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251011042335.2017985-1-lcpdbld@list.ti.com>
References: <20251011042335.2017985-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 11 Oct 2025 04:25:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19115

meta-ti / na / 20251011042335.2017985-1-lcpdbld

PRC Results: PASS

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
- Patch Series: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2025.10
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 10 Oct 2025 23:23:35 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f099af5fe66ec6bd0ce5a303bd0f8191adcf717a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Make sure the build dir is unique for each UBOOT_CONFIG
- Commit SHA: 1267cbbc1916556d0b51ce42a7c92ef8322fdea3

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS





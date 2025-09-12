Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74817CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 09:10:14 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.12111.1757668213311186860
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 02:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ivilUiHB;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9ACIB573853
	for <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 04:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757668212; i=@ti.com;
	bh=f/4pf56tk+ezoq/cgCRxiPVvzvqYq4N6KmYyTVcTQ+M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ivilUiHBvFWg5AOvhw2EQWFGtDiC/Mw69xKnP7xM5RWR5l0MAfZrQeHIhR4zG/fr2
	 Uc8x6Q1Jaii6Pjph2hXw0VMRH7vB8zPfFCtswCQJYIjSc6IASUFbjz3ssEYXJcI8qM
	 E1sVxBHBqRAQkUmGYVBkQ3XNqsllgyKqMYI7Lkqc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9ACT41756659
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 04:10:12 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:10:12 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:10:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9ACRC2004167;
	Fri, 12 Sep 2025 04:10:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7653A13F531; Fri, 12 Sep 2025 04:10:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>
Subject: Re: [meta-ti][master][PATCH v2] optee: Update to 4.7.0 tag
Date: Fri, 12 Sep 2025 04:10:12 -0500
Message-ID: <20250912091012.1204573-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250912090340.506817-1-s-joshi@ti.com>
References: <20250912090340.506817-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 09:10:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18998

meta-ti / na / 20250912090340.506817-1-s-joshi

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH v2] optee: Update to 4.7.0 tag
    WARN: Commit message does not include file/recipe name: optee: Update to 4.7.0 tag. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH v2] optee: Update to 4.7.0 tag
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Fri, 12 Sep 2025 14:33:40 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5006ca9a0a2ccc218278c46970640fe28da2bb27

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: optee-ftpm: Add TI version override for ftpm
- Commit SHA: 106d575e5879911420c5ad4d486bda3e8164f4c9

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS





Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11000CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 04:40:49 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.962.1760589645500606685
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 21:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pVV6gVxE;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59G4eiu41490841
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 23:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760589644; i=@ti.com;
	bh=Bscd0RRHnJkIGvIc9oXLjSjiyt1lZlYOp3DANjKOj0A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pVV6gVxEupk7F3nhTCrvJep1Yw09GXMFAvvr2F80UlHoQc7eBEvClRe8fi4Vzh3n/
	 NGakyqGN1oWrXPzUUTmY4nWGpEzgWkpsKSuOWLsJjMRC3Vhzd6KGIwi5aTspzYnGz0
	 kcDbXKlF8QojOJImXVMh+20wmGIkNYUco2hIaZYs=
Received: from DLEE205.ent.ti.com (dlee205.ent.ti.com [157.170.170.85])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59G4eijQ1344405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 23:40:44 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 23:40:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 23:40:14 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59G4eEvT3151851;
	Wed, 15 Oct 2025 23:40:14 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 78476180198; Wed, 15 Oct 2025 23:40:14 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>,
        <v-singh1@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>,
        <khasim@ti.com>, <jm@ti.com>
Subject: Re: [master/scarthgap][PATCH v2] conf: machine: am62dxx-evm: Package overlays
Date: Wed, 15 Oct 2025 23:40:14 -0500
Message-ID: <20251016044014.3364212-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251016043836.1679278-1-p-bhagat@ti.com>
References: <20251016043836.1679278-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Oct 2025 04:40:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19138

meta-ti / na / 20251016043836.1679278-1-p-bhagat

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/scarthgap][PATCH v2] conf: machine: am62dxx-evm: Package overlays
    WARN: Commit message should not include directory path to recipe: conf: machine: am62dxx-evm: Package overlays.
              conf:
              machine: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/scarthgap][PATCH v2] conf: machine: am62dxx-evm: Package overlays
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Thu, 16 Oct 2025 10:08:36 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8aa4ceb709c089ef474b52708b832b032fb7bab2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: j784s4: Add k3_bist tie-test-builds config
- Commit SHA: 9db6ea9cef9fec931ac1bbb18b0d078302159dbc

Patches
----------------------------------------
All patches applied

scarthgap
=====================
Summary:
- Patch Series: [master/scarthgap][PATCH v2] conf: machine: am62dxx-evm: Package overlays
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Thu, 16 Oct 2025 10:08:36 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8aa4ceb709c089ef474b52708b832b032fb7bab2

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
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

scarthgap
=====================
PASS





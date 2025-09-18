Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A59CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 23:30:22 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.3122.1758238214099548467
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 16:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Zm8Re5uR;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58INUDMV586757;
	Thu, 18 Sep 2025 18:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758238213; i=@ti.com;
	bh=SKo8w8Oqhm9Cmfa5p9/zv70qH3CSNLXNIVMqFIwAGKs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Zm8Re5uRF3uHYJMszGsrJWrt7jRVWOyV0oPDYpJApxMUOOwMltjd3jHiaantXQFlT
	 Hb+cn2pXPxPXTfGDiGbSeNQ124WSeQSbIwX8LjguRGQXiiws1WZnqX4UskDHQ9dLLa
	 v0WsLTSs39kCCIJUAx8OXDhJPzvegyDyLX77pE5o=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58INUDsk2457451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 18:30:13 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 18:30:12 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 18:30:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58INUCCF4136810;
	Thu, 18 Sep 2025 18:30:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id BF0A613F52E; Thu, 18 Sep 2025 18:30:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509181257
Date: Thu, 18 Sep 2025 18:30:12 -0500
Message-ID: <20250918233012.1556966-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250918232748.1813441-1-lcpdbld@list.ti.com>
References: <20250918232748.1813441-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Sep 2025 23:30:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19042

meta-ti / na / 20250918232748.1813441-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509181257
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.scarthgap.202509181257. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509181257
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 18 Sep 2025 18:27:48 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fa02d227e1421049579fd8f00b5864a110e706b0

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: mesa-pvr: Use PREFERRED_PROVIDER directly for GPU selection
- Commit SHA: d89a382c3abce5f84d0a2b5edb0f7534b5b50171

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





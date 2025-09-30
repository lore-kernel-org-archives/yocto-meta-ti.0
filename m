Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8006CCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 12:25:20 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.24187.1759235114666901404
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 05:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IbYgsKf/;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58UCPEEI2913338
	for <meta-ti@lists.yoctoproject.org>; Tue, 30 Sep 2025 07:25:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759235114; i=@ti.com;
	bh=X3MysikH541OpmZbWiYsyA7+5LXHP3sqaLe43kJCcV8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IbYgsKf/r7nffOixntHqNotJYY2FFZwfK9Erhr3nKtMkZ+80VUe/kjizfvrn6SzWf
	 2Bm+CbUbOaOjYQK+xBcfX4Ll2dx1faOpZg3R3kokCSsix5EBai+87JvdnhIIPpEuF/
	 lGlER1IGQLPADm5UXic4QxsEqD0QXjhMCct5Hujc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58UCPEoc2117950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 30 Sep 2025 07:25:14 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 30
 Sep 2025 07:25:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 07:25:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58UCPDfN3158343;
	Tue, 30 Sep 2025 07:25:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9375F1801A3; Tue, 30 Sep 2025 07:25:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <m-malladi@ti.com>, <c-shilwant@ti.com>,
        <reatmon@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add pruprp-fw for AM64xx
Date: Tue, 30 Sep 2025 07:25:13 -0500
Message-ID: <20250930122513.3369878-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250930094517.2004652-1-danishanwar@ti.com>
References: <20250930094517.2004652-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Sep 2025 12:25:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19080

meta-ti / na / 20250930094517.2004652-1-danishanwar

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add pruprp-fw for AM64xx
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: Add pruprp-fw for AM64xx. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: Add pruprp-fw for AM64xx.
              meta-ti-bsp: (COMMIT-MESSAGE-3)
        patch
    
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add pruprp-fw for AM64xx
- Submitter: From: "MD Danish Anwar" <danishanwar@ti.com>
- Date: Date: Tue, 30 Sep 2025 15:15:17 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1ddb982c6dd180ac2cd21d93e74a8d36e1e85ff4

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509260858
- Commit SHA: 9a30c7b97a979fa66cb22b2c2ce1d3b7d466ee24

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





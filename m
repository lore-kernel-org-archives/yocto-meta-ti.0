Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EFECAC5AA
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:45:20 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.53895.1758552315761797718
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 07:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DozcYjNw;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MEjE4s1255916;
	Mon, 22 Sep 2025 09:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758552314; i=@ti.com;
	bh=NT19fiawwBJvzdjhgu2HWxSBfQtIROy7bMLxPL7tCtU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DozcYjNw5NdmB5ZJ+FAH0JgVeOq9AVQ5g0GTjCFTWpOJkZF+WQ0guHkN2TGPCPbk2
	 IV/+OQVCLTtvH0mcJZ9FlBd7vIz9juKKRhOGpI5GUqiq4JV999HmeVFJNllY2OULkN
	 iYlWyhA3E/+nbonkhVLIkmUvPaxhVELwX9Ih0APg=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MEjEIO375017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 09:45:14 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 09:45:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 09:45:14 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MEjEN72946696;
	Mon, 22 Sep 2025 09:45:14 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 2E47E18565F; Mon, 22 Sep 2025 09:45:14 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] u-boot: Moved to named git repo
Date: Mon, 22 Sep 2025 09:45:14 -0500
Message-ID: <20250922144514.727176-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250922144022.4203-1-reatmon@ti.com>
References: <20250922144022.4203-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Sep 2025 14:45:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19052

meta-ti / na / 20250922144022.4203-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH] u-boot: Moved to named git repo
    WARN: Commit message does not include file/recipe name: u-boot: Moved to named git repo. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: u-boot: Moved to named git repo.
              u-boot: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: FAIL
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] u-boot: Moved to named git repo
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 22 Sep 2025 09:40:22 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a70e6b17b7cffaf7001404f3ed115df2a864f437

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509181257
- Commit SHA: d99cff5534fa2def3e9ccdbc6d9ca568e4587f24

Patches
----------------------------------------
FAIL - [meta-ti][scarthgap][PATCH] u-boot: Moved to named git repo
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc:5
    error: meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc: patch does not apply
    Applying: u-boot: Moved to named git repo
    Patch failed at 0001 u-boot: Moved to named git repo





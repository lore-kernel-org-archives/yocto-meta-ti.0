Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C764CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 21:30:37 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.4555.1761341432522374866
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 14:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Hyq9YOr6;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59OLUVah1983039;
	Fri, 24 Oct 2025 16:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761341431; i=@ti.com;
	bh=6cnDCHoXXG3CxX+7myXGJ6Iu7izSVeNK/7s4xrkOlys=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Hyq9YOr62QPytgp/dlU5EuB7h47Ks58H2ywVgcW66nLNQwmZlJsrSu9sdTqOy2uc8
	 3W7cg7G+u2hibkQj/4pSv1bAUXgZoSYFTBk/yvYs6XfJ9TXfJOt5O09XY1NjrbXm0p
	 88E8vTe7ZHu6yBzCDSLHC42jiqhxqk/yeZlScGm0=
Received: from DFLE212.ent.ti.com (dfle212.ent.ti.com [10.64.6.70])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59OLUVWA3738856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 16:30:31 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 16:30:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 16:30:31 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59OLUV55937692;
	Fri, 24 Oct 2025 16:30:31 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id B015ED6F28; Fri, 24 Oct 2025 16:30:30 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/scarthgap][PATCH] check_yocto_rules: Add new rule exception
Date: Fri, 24 Oct 2025 16:30:30 -0500
Message-ID: <20251024213030.2762425-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251024212500.6621-1-reatmon@ti.com>
References: <20251024212500.6621-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Oct 2025 21:30:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19180

meta-ti / na / 20251024212500.6621-1-reatmon

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
- Patch Series: [meta-ti][master/scarthgap][PATCH] check_yocto_rules: Add new rule exception
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 24 Oct 2025 16:25:00 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: dd97ac2c35334f2f65aab49cc8589474cfb8c95f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: conf: machine: Include MCSPI overlay for am62p and am62 LP
- Commit SHA: fda2943289a924d389f0eacef087d4060ccedb04

Patches
----------------------------------------
All patches applied

scarthgap
=====================
Summary:
- Patch Series: [meta-ti][master/scarthgap][PATCH] check_yocto_rules: Add new rule exception
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 24 Oct 2025 16:25:00 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: dd97ac2c35334f2f65aab49cc8589474cfb8c95f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: conf: machine: Include MCSPI overlay for am62p and am62 LP
- Commit SHA: b5523559e61116526f4594ea44a7eef1a16a7b45

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





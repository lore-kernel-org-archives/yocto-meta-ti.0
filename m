Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E35CA1014
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 19:40:24 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.22043.1756928415547795079
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 12:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nxkd7b1G;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583JeEKR2845276;
	Wed, 3 Sep 2025 14:40:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756928414; i=@ti.com;
	bh=IZoqjCTY5kPxcPcWjW5nPtgopNx0eUhtek3Rf0ExZa4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nxkd7b1GHNJufboyTARe5Dfx2x/C39512Q03g/5s3oi4TWlk4gl064ZMob0f6JD43
	 N1f9OKC7VjOgPlBI+9x3Fk2urrKIO4M79fNCwpsoA32xyzQnLHacfvHJSilSPhaaIb
	 bfawQTjfRs3URGg3Gmu7YIvTfiYWKxIoXae9S/ec=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583JeE8A3828477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 14:40:14 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 14:40:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 14:40:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583JeDUD2089328;
	Wed, 3 Sep 2025 14:40:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id BF7ED13F529; Wed,  3 Sep 2025 14:40:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] optee-ftpm: Add TI version override for ftpm
Date: Wed, 3 Sep 2025 14:40:13 -0500
Message-ID: <20250903194013.2280354-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250903193624.15577-1-reatmon@ti.com>
References: <20250903193624.15577-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Sep 2025 19:40:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18978

meta-ti / na / 20250903193624.15577-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] optee-ftpm: Add TI version override for ftpm
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 3 Sep 2025 14:36:24 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 23f016b4e64a7cf139983cc4c9399b05c8092760

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202509030100
- Commit SHA: 643562a21cd30815d38443b40ac2c8a9dc08dc8d

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS





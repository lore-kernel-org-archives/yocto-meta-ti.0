Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909D7CA0EE4
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 07:50:26 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.69601.1755503422447021145
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Aug 2025 00:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mYpmK3tT;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57I7oLLt3118186;
	Mon, 18 Aug 2025 02:50:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755503421; i=@ti.com;
	bh=GZdD8pW3OoQlJX3bqszedGySuOUimcy2+wA/hAUYfz8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mYpmK3tTUVjJAJXxnpD/tAFTf/HhlC4D7Vw7w2Fl5RhVvPilBM8zKspk0BAE4pUdQ
	 WAD5GcDplbF6F0K+BC/HKiafLXCuBc4d8k0D9Qu8U6/FFY5AWnuwozE1lZlRyQOIcC
	 pPx4yyY1eGVrLuwsIkwyfmNTLsSZcGA+kGSAFCQo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57I7oLwl3640889
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 02:50:21 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 02:50:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 02:50:20 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57I7oKKR949129;
	Mon, 18 Aug 2025 02:50:20 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D819E181221; Mon, 18 Aug 2025 02:50:20 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508180100
Date: Mon, 18 Aug 2025 02:50:20 -0500
Message-ID: <20250818075020.3062968-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250818074435.2623793-1-lcpdbld@list.ti.com>
References: <20250818074435.2623793-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 18 Aug 2025 07:50:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18931

meta-ti / na / 20250818074435.2623793-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508180100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 18 Aug 2025 02:44:35 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 098a6e860a3ae524b7d469103780d5f0bf544643

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Brandon Brnich <b-brnich@ti.com>
- Commit Subject: ti-bsp: ti-img-encode-decode: Update SRCREV
- Commit SHA: cb58ec96524b79eb1763b764c08c4edf9bdafe2e

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS





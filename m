Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A0ACA0EF8
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 22:10:25 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.2294.1755727816057843108
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Aug 2025 15:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KQfH4X1M;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57KMAEPK344836;
	Wed, 20 Aug 2025 17:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755727814; i=@ti.com;
	bh=/08v6zli4EBVzuY4J0aBXLQhlx3fCw26YvY9stA73Og=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KQfH4X1M5TCso7qooSmL54A6LE884XcAMwJ0xO7Vh808aNBXHQSUsQoRqjRX8SAIV
	 M3yfo5f9MNGKjYD1jr9Gl6Jf1YGCwn4Y6QcsFCuboODGVqG6ZoAcoRdO1Quv7nIFf/
	 sAMtMoXFjwlGlhCkc9Uq3PayIs7wLdDW8zKQKObw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57KMAET21500962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 20 Aug 2025 17:10:14 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 20
 Aug 2025 17:10:13 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 20 Aug 2025 17:10:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57KMADnL1833572;
	Wed, 20 Aug 2025 17:10:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CFB201801A0; Wed, 20 Aug 2025 17:10:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508201111
Date: Wed, 20 Aug 2025 17:10:13 -0500
Message-ID: <20250820221013.1727658-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250820220648.2448794-1-lcpdbld@list.ti.com>
References: <20250820220648.2448794-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Aug 2025 22:10:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18944

meta-ti / na / 20250820220648.2448794-1-lcpdbld

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508201111
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 20 Aug 2025 17:06:48 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0df7a590b11a96345a10bb2842a452c466049143

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Bryan Brattlof <bb@ti.com>
- Commit Subject: conf: machine: add optee-os into am62lxx-evm builds
- Commit SHA: 0a02cd559a07af33a8111a1f5777b14862a52227

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
scarthgap
=====================
FAIL
    ERROR: You must have a SUMMARY = "...". (SUMMARY-1)
        meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
    
    
    Code Summary
    ============
    
    SUMMARY-1
    -------------------------------------------
      All recipes require a SUMMARY.





Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AACCA0ED1
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 10:05:41 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.19171.1755165939665111188
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Aug 2025 03:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kaz3uKo7;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EA5c7q1910338;
	Thu, 14 Aug 2025 05:05:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755165938; i=@ti.com;
	bh=4NO01aFt96ioMOpZWq5374zqL9iWLw47u8eznZaM0LU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kaz3uKo7ufmZwZSNM7Kl+pUpI0n4zZvPd7GrunXpY+3OliRa6WFoX2MKbr/6SFqtV
	 kUYr2FcVgd+zkiLjJNwDupa79lVrfeSnC6jh2803ZBa5pbMHxuHJeDpM+z6BI6zaof
	 OcuwT6Ngp2x3+/gj3uY1lK9ZPrvQW233laHZwUEw=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EA5c0q1640739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 05:05:38 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 05:05:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 05:05:38 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EA5cgm3443057;
	Thu, 14 Aug 2025 05:05:38 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1CFDB13F539; Thu, 14 Aug 2025 05:05:38 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508131800
Date: Thu, 14 Aug 2025 05:05:37 -0500
Message-ID: <20250814100537.725409-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250814095945.518495-1-lcpdbld@list.ti.com>
References: <20250814095945.518495-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Aug 2025 10:05:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18927

meta-ti / na / 20250814095945.518495-1-lcpdbld

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508131800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 14 Aug 2025 04:59:45 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bf6d4bf8e04f811fec55980af02af54141f6f01e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Denys Dmytriyenko <denys@konsulko.com>
- Commit Subject: meta-beagle: conf/machine rework all DTB lists
- Commit SHA: 72b2e09640eafd2fbd474663d4a743c6af2c69d4

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86066CAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:45:20 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.53855.1758552316211442567
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 07:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tKY/tmI9;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MEjFYa789436;
	Mon, 22 Sep 2025 09:45:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758552315; i=@ti.com;
	bh=ST54l7ZCBJPjdFCsuOtvcq50umjQhnOaSzkGwPcUXuE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tKY/tmI9AK8JuYMA3Yc2djRcTP9iCg1FE2LCeYn55R1ZuZ5KDvZnzwLqN7FeE/O6v
	 ZvMR00JCN/ooafCyBVgQJY/qtO50lGC/xM2cR3UrSGQUR09OED9Unw+EB2LjbloSbW
	 d+8MDxoxoNQTRUC8tkdQEnl6OgF8CdbJbwnsCazI=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MEjFDD1250265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 09:45:15 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 09:45:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 09:45:14 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MEjExR2946701;
	Mon, 22 Sep 2025 09:45:14 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C150B181222; Mon, 22 Sep 2025 09:45:14 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/scarthgap][PATCH] ti-extras: Clean up
Date: Mon, 22 Sep 2025 09:45:14 -0500
Message-ID: <20250922144514.868168-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250922144009.4059-1-reatmon@ti.com>
References: <20250922144009.4059-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Sep 2025 14:45:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19054

meta-ti / na / 20250922144009.4059-1-reatmon

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
- Patch Series: [meta-ti][master/scarthgap][PATCH] ti-extras: Clean up
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 22 Sep 2025 09:40:09 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2d7c0b1069f03488a7d71c05fdf0cd57cc6cf93d

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202509220100
- Commit SHA: bdab20ed4724c9fd84bdac937710b6159ddab26f

Patches
----------------------------------------
All patches applied

scarthgap
=====================
Summary:
- Patch Series: [meta-ti][master/scarthgap][PATCH] ti-extras: Clean up
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 22 Sep 2025 09:40:09 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2d7c0b1069f03488a7d71c05fdf0cd57cc6cf93d

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509220638
- Commit SHA: d8877fc481e9c7335cb63d62257fb0164b1af851

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





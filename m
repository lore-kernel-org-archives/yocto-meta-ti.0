Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F47CAC5BB
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 19:05:26 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.3146.1758913522526259338
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 12:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HcPnO3Ei;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58QJ5LMI2209312;
	Fri, 26 Sep 2025 14:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758913521; i=@ti.com;
	bh=OGYoyV2s8S0pC8HvR1ykkhX12nChcUU1hXx4J0JlS+o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HcPnO3EipfVl2ClD06KJcd/RiyATU7oojzq6m/CiSLhlWRcysxwSsEM9nx1H4W7QF
	 qgmPMxApC0Xi9D791If2Ly4LzupHeOyx10fNsScIqd1muUOsttT8RBaB0qBS6mlMLg
	 q40HjoH3KiGphQQSk+vI95rwuT4RhfY4lBrNOSkQ=
Received: from DFLE212.ent.ti.com (dfle212.ent.ti.com [10.64.6.70])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58QJ5LCr1175512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Sep 2025 14:05:21 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 26 Sep
 2025 14:05:20 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 26 Sep 2025 14:05:20 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58QJ5KjY3201857;
	Fri, 26 Sep 2025 14:05:20 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 6BF77D6F3A; Fri, 26 Sep 2025 14:05:20 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509260858
Date: Fri, 26 Sep 2025 14:05:20 -0500
Message-ID: <20250926190520.2835204-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250926190251.1349034-1-lcpdbld@list.ti.com>
References: <20250926190251.1349034-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Sep 2025 19:05:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19067

meta-ti / na / 20250926190251.1349034-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509260858
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.scarthgap.202509260858. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509260858
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 26 Sep 2025 14:02:51 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6a2403f239bc824384eef14099ac4ef21572482f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509250412
- Commit SHA: bd71e17c75fce1237c40167c8358ecfa6c3b6b48

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





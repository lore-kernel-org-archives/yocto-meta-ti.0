Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCDBCA0FF6
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 23:10:17 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1377.1756422615831519489
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 28 Aug 2025 16:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oXYS3MLN;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57SNAEcq2108837;
	Thu, 28 Aug 2025 18:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756422614; i=@ti.com;
	bh=j8F6fJXQCbcjA2jlQF1bhfWtoZgqX7meK2JhWZtw5h4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oXYS3MLNbMRIgsU2NAep4XuGL0mqNMpV+O2BwXGqB+cc2PR9k34uP200mZFP8SekV
	 pI2pclENe5QT1e37IWIgW1cOM6am4dIpWYBMuWpqAEQpSPsSzAaPgvvaaH25YclaBB
	 Acv6/faLC6LyCdo8SN/+uyaV8VAZnuvgi5Jr0hcI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57SNAE0J095459
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 28 Aug 2025 18:10:14 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 28
 Aug 2025 18:10:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 28 Aug 2025 18:10:14 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57SNAESS1116198;
	Thu, 28 Aug 2025 18:10:14 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3B2E113F52D; Thu, 28 Aug 2025 18:10:14 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508281316
Date: Thu, 28 Aug 2025 18:10:14 -0500
Message-ID: <20250828231014.4077613-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250828230613.3423453-1-lcpdbld@list.ti.com>
References: <20250828230613.3423453-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Aug 2025 23:10:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18976

meta-ti / na / 20250828230613.3423453-1-lcpdbld

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
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508281316
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 28 Aug 2025 18:06:13 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 824de6ef06f33dedb2367f690dc26f4b848b7650

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Commit Subject: conf: machine: Include merged device trees in the list of generated dtbs
- Commit SHA: a0a480a189a1e2d7818abeeb2bfcec2fd442d878

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F03CCD194
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 16:35:24 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.22586.1760546114602469447
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 09:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bJD7HzlS;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FGZE1p1368729
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760546114; i=@ti.com;
	bh=w0azPT1hXhT9+FMSVok71DkuKsvUZ6hg4GouC+LBx2U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bJD7HzlSvhyyM2ZVx+PQKX++62Z8ROTN3dcg5K/Z66p70xAdtg+uoyNFhFRWGC4sD
	 xBrV2HnitXl0bkhT8IC+fQD4cQZpATllZmeTHHy3s6lnWfLEBzh8Brvmau7MVjVoje
	 +BYQcU4RVBmdvkWkHUGOxE2veamHMJBxr3B5frPo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FGZDsO957866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:35:14 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 15
 Oct 2025 11:35:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 11:35:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FGZDYt2264524;
	Wed, 15 Oct 2025 11:35:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 65CAA168FED; Wed, 15 Oct 2025 11:35:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH] conf: am335x-evm and am437x-evm: Bump up max_leb_cnt
Date: Wed, 15 Oct 2025 11:35:13 -0500
Message-ID: <20251015163513.4119083-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251015163336.3955455-1-j-sahu@ti.com>
References: <20251015163336.3955455-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 16:35:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19135

meta-ti / na / 20251015163336.3955455-1-j-sahu

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap/master][PATCH] conf: am335x-evm and am437x-evm: Bump up max_leb_cnt
    WARN: Commit message should not include directory path to recipe: conf: am335x-evm and am437x-evm: Bump up max_leb_cnt.
              conf: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH] conf: am335x-evm and am437x-evm: Bump up max_leb_cnt
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Wed, 15 Oct 2025 22:03:36 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 915f3302e3749978189450d66e3659030a4f0fa2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: meta-ti-extras: dsptop: Explicitly allow build for AM57x
- Commit SHA: c8c3142da3517745c28232b4c910988235c721b0

Patches
----------------------------------------
All patches applied

master
=====================
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH] conf: am335x-evm and am437x-evm: Bump up max_leb_cnt
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Wed, 15 Oct 2025 22:03:36 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 915f3302e3749978189450d66e3659030a4f0fa2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: j784s4: Add k3_bist tie-test-builds config
- Commit SHA: 0d80e80cfff5870b3f39e0a8e167b6cf7b6858b4

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS

master
=====================
PASS





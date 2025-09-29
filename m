Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA11CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 15:15:42 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.539.1759158937389830837
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Sep 2025 08:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xiuceHUI;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58TFFZvc2209613;
	Mon, 29 Sep 2025 10:15:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759158935; i=@ti.com;
	bh=ndgWrwuSStPeWz44BtS9zWuPA2ZIncEeP73URAsmEFw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xiuceHUIHoWKJqd+4tY8XQCulKMZkGFAp8qhv3Ezw/vWBN13QxdB/msxi5wkUFwzA
	 D/7eN+4bSvB47nAvuBlj1DHVJZDox5Vl96KOSXinkgzIs4JhaimLJB5TmJO2t7+nuh
	 6SeddtQE+mW8iGODcdXzn+Gr1B4d1eR/Oc/8DWAk=
Received: from DLEE211.ent.ti.com (dlee211.ent.ti.com [157.170.170.113])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58TFFZow1998042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Sep 2025 10:15:35 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Sep
 2025 10:15:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Sep 2025 10:15:35 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58TFFZop1427819;
	Mon, 29 Sep 2025 10:15:35 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 30C0713F52E; Mon, 29 Sep 2025 10:15:35 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap/master][PATCH] meta-beagle: beagley-ai: Set forward looking UBOOT_MACHINE default
Date: Mon, 29 Sep 2025 10:15:35 -0500
Message-ID: <20250929151535.2240498-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250929151154.3552026-1-afd@ti.com>
References: <20250929151154.3552026-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Sep 2025 15:15:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19075

meta-ti / na / 20250929151154.3552026-1-afd

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap/master][PATCH] meta-beagle: beagley-ai: Set forward looking UBOOT_MACHINE default
    WARN: Commit message should not include directory path to recipe: meta-beagle: beagley-ai: Set forward looking UBOOT_MACHINE default.
              meta-beagle: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH] meta-beagle: beagley-ai: Set forward looking UBOOT_MACHINE default
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Mon, 29 Sep 2025 10:11:54 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 33e048e8167ac2858c1fb1fb160595950968def0

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509260858
- Commit SHA: 9a30c7b97a979fa66cb22b2c2ce1d3b7d466ee24

Patches
----------------------------------------
All patches applied

master
=====================
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH] meta-beagle: beagley-ai: Set forward looking UBOOT_MACHINE default
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Mon, 29 Sep 2025 10:11:54 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 33e048e8167ac2858c1fb1fb160595950968def0

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Moved to named git repo
- Commit SHA: a05114e75fa4a6d74684a4a4b09cd900a7f865ae

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





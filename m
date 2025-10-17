Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D8BCCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 21:05:34 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.3732.1760735132628680508
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Oct 2025 14:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=X9BcXn0s;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59HL5VOt2455048;
	Fri, 17 Oct 2025 16:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760735131; i=@ti.com;
	bh=ynIeyfBmTvZ/Z7In6AnqpkeXOVkVyNHWPeQaPstl8kk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=X9BcXn0sFubeiXj6kqPC5fiIc9KVH3a9OxEO33wFq1RCb6Bg2hV2POr4GXvrvzMSQ
	 K2hANDXMhqZ/oc8/BLXGERGDLtGLFU7/ozJ2eZjkFNJTZ+2jlf0YE9bjCaJ5VDFyBU
	 7WO2Nqbf1olHkYgOSiqTidzQLASUcRi4yS3PoiUc=
Received: from DFLE211.ent.ti.com (dfle211.ent.ti.com [10.64.6.69])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59HL5VnE2277175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Oct 2025 16:05:31 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Oct
 2025 16:05:31 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Oct 2025 16:05:31 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59HL5Vga3382831;
	Fri, 17 Oct 2025 16:05:31 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1694713F538; Fri, 17 Oct 2025 16:05:31 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510170857
Date: Fri, 17 Oct 2025 16:05:31 -0500
Message-ID: <20251017210531.261856-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251017210337.1556682-1-lcpdbld@list.ti.com>
References: <20251017210337.1556682-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Oct 2025 21:05:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19145

meta-ti / na / 20251017210337.1556682-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510170857
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.scarthgap.202510170857. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510170857
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 17 Oct 2025 16:03:37 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4336fc5fb77cb42d6091b87c28780eb265ba304a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: meta-ti-extras: dsptop: Explicitly allow build for AM57x
- Commit SHA: c8c3142da3517745c28232b4c910988235c721b0

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





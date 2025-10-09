Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C39CCD18A
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 18:25:18 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.7808.1760034314926550463
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 11:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tSS0gxwY;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 599IPEMH142084;
	Thu, 9 Oct 2025 13:25:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760034314; i=@ti.com;
	bh=VR4oYzxHGP2ywDw7NEnHojLc4iwfJbJPB2oYops4k/I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tSS0gxwYo3uubfcpBWoD8EHrI1o7s9l1E4KdiM48enx9qfbi8RO+6A7JfNLbYfcg2
	 W7gix1ozJnboko82MMk/wsQSJIkf928DfaeUKtGD2NhYFZFTPOlDwyPguDNSty4gts
	 OgwnPG/usN0ri1RA62bntxdQTDWGQicS6tvjdCUw=
Received: from DFLE210.ent.ti.com (dfle210.ent.ti.com [10.64.6.68])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 599IPEPT1103660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Oct 2025 13:25:14 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Oct
 2025 13:25:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Oct 2025 13:25:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 599IPDvS658623;
	Thu, 9 Oct 2025 13:25:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A654B13F52E; Thu,  9 Oct 2025 13:25:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] machine: Add FIT_CONF_DEFAULT_DTB for legacy platforms
Date: Thu, 9 Oct 2025 13:25:13 -0500
Message-ID: <20251009182513.2356417-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251009182231.4242-1-reatmon@ti.com>
References: <20251009182231.4242-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Oct 2025 18:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19113

meta-ti / na / 20251009182231.4242-1-reatmon

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH] machine: Add FIT_CONF_DEFAULT_DTB for legacy platforms
    WARN: Commit message does not include file/recipe name: machine: Add FIT_CONF_DEFAULT_DTB for legacy platforms. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: machine: Add FIT_CONF_DEFAULT_DTB for legacy platforms.
              machine: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] machine: Add FIT_CONF_DEFAULT_DTB for legacy platforms
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 9 Oct 2025 13:22:30 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: be55de3a94d2b6a5062da29689a36c2f7ec49345

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202510090100
- Commit SHA: 45e9805876bc8abe70cd33ef535ad2af6c92ddb9

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS





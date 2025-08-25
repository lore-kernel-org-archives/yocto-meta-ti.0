Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410D8CA0FE1
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 08:05:27 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.34462.1756109117381578268
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Aug 2025 01:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=r1g0gFHg;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57P85G54769694;
	Mon, 25 Aug 2025 03:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756109116; i=@ti.com;
	bh=Jlhf4SCx45h9oLHKsvlAifZy8w7RjWTqdNUjYvJdd0o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=r1g0gFHg5iCwKxnYorsYLIx+0bf7XVWiOyHd2u7AwNCk15Nv3RJXLwFafBmsR1MfA
	 gEUUj8fjJ1MzrrJFTYs0zhKfY1KH1aO3uQM3iZLYNTZud1l7LOmLa9isE4oR/4rOK5
	 IxFNvVmj0UmLQjIiRFYj0jSTEatoculhRywwIQt0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57P85GE41030246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 25 Aug 2025 03:05:16 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 03:05:15 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 03:05:15 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57P85FBZ1787584;
	Mon, 25 Aug 2025 03:05:15 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C22BF181224; Mon, 25 Aug 2025 03:05:15 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508250100
Date: Mon, 25 Aug 2025 03:05:15 -0500
Message-ID: <20250825080515.2151273-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250825075955.342678-1-lcpdbld@list.ti.com>
References: <20250825075955.342678-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 25 Aug 2025 08:05:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18967

meta-ti / na / 20250825075955.342678-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508250100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 25 Aug 2025 02:59:55 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1c253c5b407ec395cba6adecad64f3cbac7be75d

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
- Commit SHA: 6059a084f6c8ae0aa1d76abb922949c8bb6dbb09

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS





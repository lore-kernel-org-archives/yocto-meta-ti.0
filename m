Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9709CCAC5A8
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:45:20 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.53896.1758552315762153286
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 07:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tzx8xT+1;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MEjECe789432;
	Mon, 22 Sep 2025 09:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758552314; i=@ti.com;
	bh=rIPJcnQp5rnKrxUcDLbWcpDXlvDNFYiumrLhcenABaw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tzx8xT+1kMiu3ilEhmozyQt9tLThBBr8wCfulPkH/UEeMBaNDlvgScf5+bv10tC1k
	 CEpFZlJjKhVLiHnVxOKVcaQ0AwKOtabQLl83M68gPlpud8xqDoT/IDa3lBjsFIz9wh
	 GaaGC/jkZn7/XpMTFszk98MWeN21Up8fu6+lVyXM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MEjE7o2061553
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 09:45:14 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 09:45:14 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 09:45:14 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MEjEPW3302189;
	Mon, 22 Sep 2025 09:45:14 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 2C71718565D; Mon, 22 Sep 2025 09:45:14 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] u-boot: Moved to named git repo
Date: Mon, 22 Sep 2025 09:45:14 -0500
Message-ID: <20250922144514.727160-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250922144016.4131-1-reatmon@ti.com>
References: <20250922144016.4131-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Sep 2025 14:45:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19053

meta-ti / na / 20250922144016.4131-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH] u-boot: Moved to named git repo
    WARN: Commit message does not include file/recipe name: u-boot: Moved to named git repo. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: u-boot: Moved to named git repo.
              u-boot: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] u-boot: Moved to named git repo
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 22 Sep 2025 09:40:16 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5b9d50c689045d1561478d31b261927aa8e36132

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: mesa-pvr: add PROVIDES for Vulkan and OpenCL ICDs
- Commit SHA: 1d5ec7bb9e0da9c5715839192d73fedcbd706bf4

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] u-boot: Moved to named git repo
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc:5
    error: meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc: patch does not apply
    Applying: u-boot: Moved to named git repo
    Patch failed at 0001 u-boot: Moved to named git repo





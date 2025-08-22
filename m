Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7E9CA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 14:35:15 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.11664.1755873313615837407
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 07:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Nvhp/OGh;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MEZCbA270360;
	Fri, 22 Aug 2025 09:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755873312; i=@ti.com;
	bh=c5hCBck1M5AtGKqrBDHZ3jvmWaDzK+NDTxW6O/WT3Ms=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Nvhp/OGh95LDhr44syz3FTmPUQxahnqqPE4wFx9/yG2/y7ETmohCInMkmUc5fXDQZ
	 bdtFp28Wyp972Wzlks3E3H4CU8595O33TctUihrp/AVmuJCdU6N/m0v2zT2tOgTKcp
	 popnZVPKcJt03Qpfy2yGptcAvBCkkK2OzvOtsotg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MEZCXU3669224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 09:35:12 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 09:35:12 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 09:35:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MEZCf83469173;
	Fri, 22 Aug 2025 09:35:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1FDB1180193; Fri, 22 Aug 2025 09:35:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Bryan Brattlof <bb@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Meta-TI <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH scarthgap/master] meta-ti-bsp: conf: drop BL32_BASE
Date: Fri, 22 Aug 2025 09:35:12 -0500
Message-ID: <20250822143512.2993495-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250822-62l-tfa-cleanup-v1-1-1cb19995f083@ti.com>
References: <20250822-62l-tfa-cleanup-v1-1-1cb19995f083@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Aug 2025 14:35:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18963

meta-ti / na / 20250822-62l-tfa-cleanup-v1-1-1cb19995f083

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
- Patch Series: [PATCH scarthgap/master] meta-ti-bsp: conf: drop BL32_BASE override for am62lxx-evm
- Submitter: From: Bryan Brattlof <bb@ti.com>
- Date: Date: Fri, 22 Aug 2025 09:32:42 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e5fed04f02572cffeeded452b991b453618cc97b

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





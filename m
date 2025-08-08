Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA78C87FD2
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:10:27 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.17045.1754640623599460992
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Aug 2025 01:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Vkl71EBe;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5788ALC5938809;
	Fri, 8 Aug 2025 03:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754640622; i=@ti.com;
	bh=06LQSTLe2sy0Am8/Hk+fLRPrmG54rSok6B9A9u4Yr74=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Vkl71EBe5OrwC2jRfyyCNhhRt9SHMk+YyrStVxb71YIiUryXpc/NXe2HSxyhviEaB
	 OG2tGOuaYFP32ZLv+Hkl+YrnXCGCeD5JlmfwRtm14/O4/YiveJY0PF6OL3vkrRGnl5
	 AO4IdFpIIr7moE5PvC2a6D3H77y4LC5RbAMzfdU4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5788AL8L337319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 8 Aug 2025 03:10:21 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 03:10:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 03:10:21 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5788ALLM2738539;
	Fri, 8 Aug 2025 03:10:21 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2682513F532; Fri,  8 Aug 2025 03:10:21 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508080100
Date: Fri, 8 Aug 2025 03:10:21 -0500
Message-ID: <20250808081021.745460-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250808080630.1774007-1-lcpdbld@list.ti.com>
References: <20250808080630.1774007-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Aug 2025 08:10:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18912

meta-ti / na / 20250808080630.1774007-1-lcpdbld

PRC Results: PASS

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  check-yocto-patches: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Patches
----------------------------------------
All patches passed



-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  apply-yocto-patch: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508080100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 8 Aug 2025 03:06:30 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d0ea7074f51a05062cf4413dd601d989fdc48604

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Beleswar Padhi <b-padhi@ti.com>
- Commit Subject: licenses: Add INSIDE-Secure LICENSE
- Commit SHA: 1544ef5ecb65080c008a833109f217bb9b4c6eb4

Patches
----------------------------------------
All patches applied



-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  check-yocto-repo: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
master
=====================
PASS





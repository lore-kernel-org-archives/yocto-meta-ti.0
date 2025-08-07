Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B621C87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 08:10:58 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.46430.1754554256993084521
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Aug 2025 01:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=r7S8LsMN;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5778AuYp764839;
	Thu, 7 Aug 2025 03:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754554256; i=@ti.com;
	bh=noUytRhdVwqGSWz6lH/4+0lgZAftdpnyvG2K+N9z740=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=r7S8LsMNwF/kEAPIk9zwZRAn+OaM2Zsrm2ODmheojUtgGzK+2m2PMS+KEKBZG7fXx
	 cyFclbD9+NftIO1a0kCGxS20DMlHkzKFdFikoBc6ayuc0nZlmxAjrtOcHcql/ozX2Q
	 IeUbopGjV8S6LjXVi/gwgPHrBNHcYeo71RpBdcSo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5778AuhR663430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 7 Aug 2025 03:10:56 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 7
 Aug 2025 03:10:55 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 7 Aug 2025 03:10:55 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5778Attw1443403;
	Thu, 7 Aug 2025 03:10:55 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9148413F531; Thu,  7 Aug 2025 03:10:55 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508070100
Date: Thu, 7 Aug 2025 03:10:55 -0500
Message-ID: <20250807081055.2212682-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250807080506.2249872-1-lcpdbld@list.ti.com>
References: <20250807080506.2249872-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 07 Aug 2025 08:10:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18907

meta-ti / na / 20250807080506.2249872-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508070100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 7 Aug 2025 03:05:06 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: af9a182c35d94187ddd1803bb4dc0e36af610d0f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Beleswar Padhi <b-padhi@ti.com>
- Commit Subject: licenses: Add INSIDE-Secure LICENSE
- Commit SHA: e4e3ae9c64a1400ab23baddb09c93319c2251ca3

Patches
----------------------------------------
All patches applied



-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  check-yocto-repo: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
master
=====================
PASS





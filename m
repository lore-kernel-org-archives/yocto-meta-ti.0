Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A376CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 16:20:22 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.15584.1761322814660443286
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 09:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gJEZ92ac;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59OGKDk0783289;
	Fri, 24 Oct 2025 11:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761322813; i=@ti.com;
	bh=ExzLE5KlgrS3Etsd6c3SJDa+JyODqpsyUrVl1Y2N/cY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gJEZ92acT071cR3mlwbbxYIOZy9ORZ2jWlt84gmKuUhcwn9wQNeq5H9pPJxKICZbP
	 y736lYsjSK/SiutV/qH6YPllFEHlOaIyOIDSVpyCfSWZcOAmQoYGZr6Aq5AvK2eQL3
	 sEdcpzUMiXGUW42lO9q56m96d4U6x8jyTFqUhG5c=
Received: from DLEE214.ent.ti.com (dlee214.ent.ti.com [157.170.170.117])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59OGKDDW3577452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 11:20:13 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 11:20:13 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 11:20:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59OGKDmf1366722;
	Fri, 24 Oct 2025 11:20:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 03611181222; Fri, 24 Oct 2025 11:20:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] am62axx: Add whitespace to append assignment
Date: Fri, 24 Oct 2025 11:20:12 -0500
Message-ID: <20251024162012.3528143-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251024161920.22445-1-reatmon@ti.com>
References: <20251024161920.22445-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Oct 2025 16:20:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19177

meta-ti / na / 20251024161920.22445-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] am62axx: Add whitespace to append assignment
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 24 Oct 2025 11:19:20 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 30e4b4586fa9001874efb92815031459c1b59e5a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: packagegroup-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set
- Commit SHA: a58677ffedd5733ce7eba266bc1ed981d90af2a0

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS





Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06FDCA0FE7
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 19:35:40 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.47996.1756150533439302856
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Aug 2025 12:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XU10t0ql;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57PJZWH41363238
	for <meta-ti@lists.yoctoproject.org>; Mon, 25 Aug 2025 14:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756150533; i=@ti.com;
	bh=7fVqPStlocPoCkn8twXKTBAJEYB9BE8RwWCjsiLDpjc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XU10t0qlDI6VCwRXpXne3udu/A+K3pPJwGMYsO7dLq++p65UgogbB4RGWR/diVQPU
	 b9jO9sGVbiEDsrQ3vTEGOhg4QU4lq5AT3zbIrplttWSiTVr1u9I9VKDiUI06NhSiLH
	 Ez6SxUs0gPUFkeWItUIJnyt0BfvZU19JBy26wMs4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57PJZWeK1105363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 25 Aug 2025 14:35:32 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 14:35:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 14:35:32 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57PJZWZu218126;
	Mon, 25 Aug 2025 14:35:32 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6963513F539; Mon, 25 Aug 2025 14:35:32 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <afd@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
Subject: Re: [meta-ti][master][PATCH v3] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
Date: Mon, 25 Aug 2025 14:35:32 -0500
Message-ID: <20250825193532.1636186-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250825192839.596031-1-t-lannynd@ti.com>
References: <20250825192839.596031-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 25 Aug 2025 19:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18971

meta-ti / na / 20250825192839.596031-1-t-lannynd

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
- Patch Series: [meta-ti][master][PATCH v3] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Mon, 25 Aug 2025 14:28:39 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 61d56ae4c93320af67ae33a4997a4c6b5579a8d6

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508250100
- Commit SHA: 7e27eb1dd3a2a3e81b1d951c53619c46a1704176

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS





Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3CCCA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 18:55:25 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.23331.1758221719781750723
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 11:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BQNzl/x7;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58IItHex072250;
	Thu, 18 Sep 2025 13:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758221717; i=@ti.com;
	bh=ueZPMTTedbgwLBpAk3ETjj72YXLJF38vfsZJeyPJuTM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BQNzl/x7kZNNoci+2muOnXcXKGCbjftyIeL7mb4omWIXjJa6KymGOixcOpQIbGp4k
	 a7W19NW3Zkmtx22LmDC0E+T+mh3F3FFKe3HXLL6mEt678FiZVtvWdnSH6RDX1NpDHc
	 bGNpFmBlsTElwrQVIt2/ahO4dNrXiwCHfemDSNA0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58IItHHe2562689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 13:55:17 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 13:55:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 13:55:17 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58IItHIO1335008;
	Thu, 18 Sep 2025 13:55:17 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2834B1801A1; Thu, 18 Sep 2025 13:55:17 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] mesa-pvr: add PROVIDES for Vulkan and OpenCL ICDs
Date: Thu, 18 Sep 2025 13:55:17 -0500
Message-ID: <20250918185517.1301493-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250918185221.5553-1-reatmon@ti.com>
References: <20250918185221.5553-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Sep 2025 18:55:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19040

meta-ti / na / 20250918185221.5553-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] mesa-pvr: add PROVIDES for Vulkan and OpenCL ICDs
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 18 Sep 2025 13:52:21 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6b0b002727979fab7cb4dc5663a7196a5e8c3ea1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202509180100
- Commit SHA: 8996d2354e57ef2b7a6bedb126e8f25d1d6a6dde

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS





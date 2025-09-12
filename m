Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8300FCAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 09:15:14 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.12192.1757668512669469051
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 02:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aEW39yrX;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9FCdq1002819
	for <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 04:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757668512; i=@ti.com;
	bh=VhASaEsVq0nJESsRfv9hn/Bw1kKbLsEdz5rgz/D/6wc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aEW39yrXQgtpK1MFjr5/nyqrmxKp0izD2RDL+nE3zM5zsd+SsUTw6RtMzy3fPBrDi
	 PejkItk6V15/sGyWnfEGDS9ztZlYQkdcV9eLOQIY+/61mELRjiFGh707OsAZXV0rLW
	 bOHjpvFkb2HBmCvNYE0GTU/kkc6rPaSyCO5VrIB0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9FC6O1877114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 04:15:12 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:15:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:15:11 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9FBqP3676892;
	Fri, 12 Sep 2025 04:15:11 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id BBAB413F531; Fri, 12 Sep 2025 04:15:11 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v2] optee: Update to 4.7.0 tag
Date: Fri, 12 Sep 2025 04:15:11 -0500
Message-ID: <20250912091511.1205435-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250912090943.507102-1-s-joshi@ti.com>
References: <20250912090943.507102-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 09:15:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19000

meta-ti / na / 20250912090943.507102-1-s-joshi

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH v2] optee: Update to 4.7.0 tag
    WARN: Commit message does not include file/recipe name: optee: Update to 4.7.0 tag. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH v2] optee: Update to 4.7.0 tag
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Fri, 12 Sep 2025 14:39:43 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4220e465ebbac4e3f40375f250a6adb0d06f2c13

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Moteen Shah <m-shah@ti.com>
- Commit Subject: meta-ti-bsp: wic: Add a new GRUB config for ti platforms
- Commit SHA: 72dd3f4788ad8d3bff53c939eb0c2f7f258a6fcc

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





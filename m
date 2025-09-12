Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF2DCA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 12:30:15 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.15536.1757680211956902288
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 05:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EFOHN3M2;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CCUBvB1030992
	for <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 07:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757680211; i=@ti.com;
	bh=CxfII6wyQvRucVRuTMlX4y89H5eo5MS7GYHOr5GIat8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EFOHN3M2ak5G3HnGyjyMOPeBnmtBa9oANd3Brs01gD08Fo6u4bsh2c18OtGIj4B+T
	 PK5uNUNlD4I3mt0yEJX5/wzZ4K1OyJ2SyVtLrg14SHPLso2uUSE+mKw8FOKev7l2fN
	 fb/0/dJpoToOcKybhfvZm+DmfbNZyUkfmEFvw1Uk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CCUBXS1294546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 07:30:11 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 07:30:11 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 07:30:11 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CCUBsD2135923;
	Fri, 12 Sep 2025 07:30:11 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 165BC13F530; Fri, 12 Sep 2025 07:30:11 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v3] optee: Update to 4.7.0 tag
Date: Fri, 12 Sep 2025 07:30:11 -0500
Message-ID: <20250912123011.1250812-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250912122406.523659-1-s-joshi@ti.com>
References: <20250912122406.523659-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 12:30:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19003

meta-ti / na / 20250912122406.523659-1-s-joshi

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH v3] optee: Update to 4.7.0 tag
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
- Patch Series: [meta-ti][scarthgap][PATCH v3] optee: Update to 4.7.0 tag
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Fri, 12 Sep 2025 17:54:06 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a4f0ef1f1a00b855554b157da84e610b4a24eafc

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





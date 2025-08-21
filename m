Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A453CA0FE1
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 23:45:56 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.3608.1755819949503147772
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 16:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IVcOsds3;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LNjmeo591222;
	Thu, 21 Aug 2025 18:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755819948; i=@ti.com;
	bh=B3Z9kte5Z3Ghz+NwHJjwioTByAN5Yh3OIafMMWGzDhM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IVcOsds3p/Hip5mOcsZ7geg5XOuVDa760q6aPqhR/flMu7VLuabe+I9s3pUPo6dCy
	 asEa3nf9pSQ5mBmMf1gKXc3RCaanDMQfpXSGLDJLKEEYNM051AslibsjXy+cOeaT2x
	 kYxDnhk5XHj3/T33P2e9qThdXz2tNpI0qKU75imo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LNjmhd2293481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 18:45:48 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 18:45:47 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 18:45:47 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LNjlhB2866167;
	Thu, 21 Aug 2025 18:45:47 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 411AC13F531; Thu, 21 Aug 2025 18:45:47 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508211416
Date: Thu, 21 Aug 2025 18:45:47 -0500
Message-ID: <20250821234547.240763-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250821234138.3563689-1-lcpdbld@list.ti.com>
References: <20250821234138.3563689-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 23:45:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18959

meta-ti / na / 20250821234138.3563689-1-lcpdbld

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508211416
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 21 Aug 2025 18:41:38 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 547cc9978f999e1c45fa001551242b7ff2fa0807

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
- Commit SHA: 40d5af00170e406e1ee24cefb632090218d70e8f

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





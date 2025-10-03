Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBD9CCA470
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 03:25:27 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.5883.1759461917066140790
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 20:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PDYU3AOb;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5933PFID3466447;
	Thu, 2 Oct 2025 22:25:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759461915; i=@ti.com;
	bh=0X+JZSHoBS4cFKQTCxTEHB0B53y6vyrzWbekToUGK50=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PDYU3AObapGARz2WsnQUGPwlHDZ7YFTkugfPea7xdo+JsbLADImBJR+dsaYq7FAh2
	 T65EP+ClvI44Ysp4Z+i8CNEEA7vdIy9tkRmSH2HtaZu+L+v0upVUN6ZaM8pt0vw6Pr
	 pp7dj+D1/El/e9IU+3u/Obb0SAj6iMHraiVViu5w=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5933PF3L4054075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Oct 2025 22:25:15 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 22:25:15 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 22:25:15 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5933PFEU588892;
	Thu, 2 Oct 2025 22:25:15 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7E0431801A3; Thu,  2 Oct 2025 22:25:15 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510021800
Date: Thu, 2 Oct 2025 22:25:15 -0500
Message-ID: <20251003032515.1043142-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251003032309.860778-1-lcpdbld@list.ti.com>
References: <20251003032309.860778-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Oct 2025 03:25:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19103

meta-ti / na / 20251003032309.860778-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510021800
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.scarthgap.202510021800. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510021800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 2 Oct 2025 22:23:09 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: eeabc89097447053d593ac36bfa6ba171627c281

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: MD Danish Anwar <danishanwar@ti.com>
- Commit Subject: meta-ti-bsp: Add pruprp-fw for AM64xx
- Commit SHA: 69aaa6f1f8f608e22353d38ec6629ded743c4dec

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





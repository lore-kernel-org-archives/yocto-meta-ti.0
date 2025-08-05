Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FD5C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 15:31:45 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.2321.1754407898166195643
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Aug 2025 08:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xD1hbWzF;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 575FVaRF368090;
	Tue, 5 Aug 2025 10:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754407896; i=@ti.com;
	bh=OoK09ZZYhVdaEDO50uCQ/9Im1+zUasyHnY4V2ROW0pA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xD1hbWzF181/fS6CFILo23feyjq8QYrFmMRpwOXBZ6+YfW53uvV43aeuZQ0+MQ9qu
	 X3EeZtEXdF+se7htMdI+AdoX1dnPNhgi22SgQzqOmsGI8IEkTCa143Jg966BNwgeiE
	 Libxpeh+MAXuMgp+Z6/pPMY4qcPTPlD0RBZ/WHfA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 575FVa2x3544499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 5 Aug 2025 10:31:36 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 5
 Aug 2025 10:31:06 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 5 Aug 2025 10:31:06 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 575FV6Ic4060573;
	Tue, 5 Aug 2025 10:31:06 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0431316A91C; Tue,  5 Aug 2025 10:31:06 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Daniel Schultz <D.Schultz@phytec.de>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap/master][PATCH] recipes-graphics: weston: Remove hyphen from package revision
Date: Tue, 5 Aug 2025 10:31:05 -0500
Message-ID: <20250805153105.4089830-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250805152633.200342-1-afd@ti.com>
References: <20250805152633.200342-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Aug 2025 15:31:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18891

meta-ti / na / 20250805152633.200342-1-afd

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH] recipes-graphics: weston: Remove hyphen from package revision
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Tue, 5 Aug 2025 10:26:33 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 21171506c0535a32d96ffb5c2f2d5472d469fd49

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202507311300
- Commit SHA: 0353868b3f625ee43a671a211245cc14cddbda7d

Patches
----------------------------------------
All patches applied

master
=====================
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH] recipes-graphics: weston: Remove hyphen from package revision
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Tue, 5 Aug 2025 10:26:33 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 21171506c0535a32d96ffb5c2f2d5472d469fd49

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Beleswar Padhi <b-padhi@ti.com>
- Commit Subject: ti-pka-fw: Add a recipe to package prebuilt PKA firmware
- Commit SHA: 974567583b8516ae68b924b60d6cc4ec91129d12

Patches
----------------------------------------
All patches applied



-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  check-yocto-repo: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
scarthgap
=====================
PASS

master
=====================
PASS





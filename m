Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A3BCA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 15:00:36 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.13953.1755270026246395538
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 08:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=goVoi8Ap;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FF0PiZ2177100
	for <meta-ti@lists.yoctoproject.org>; Fri, 15 Aug 2025 10:00:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755270025; i=@ti.com;
	bh=Uh3rEmRvQhzZ/uf82inkk57CZ9ENly8lToti2tUk02Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=goVoi8ApMU9dzKTWA5CY+ZTifhsib+0f7GNFEjvO8oulxUSLT8G84PXPsXm/LzoPH
	 VliKtPm9q14vvyXsxikP/NVgx+erbWJNvBq0zMA3BvPg9nWVuEMcQz6QEknqJrGNmq
	 i2NuL7LgFwn3r3zRv23Rw/m+5QQo7A65omDRVKrs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FF0PQU1976582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 15 Aug 2025 10:00:25 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 10:00:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 10:00:25 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FF0PvJ1146876;
	Fri, 15 Aug 2025 10:00:25 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 53B9A13F532; Fri, 15 Aug 2025 10:00:25 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Brandon Brnich <b-brnich@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH] ti-bsp: ti-img-encode-decode: Update SRCREV
Date: Fri, 15 Aug 2025 10:00:25 -0500
Message-ID: <20250815150025.2747301-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250815145757.3244444-1-b-brnich@ti.com>
References: <20250815145757.3244444-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 Aug 2025 15:00:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18929

meta-ti / na / 20250815145757.3244444-1-b-brnich

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
- Patch Series: [meta-ti][scarthgap/master][PATCH] ti-bsp: ti-img-encode-decode: Update SRCREV
- Submitter: From: Brandon Brnich <b-brnich@ti.com>
- Date: Date: Fri, 15 Aug 2025 09:57:57 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: efd61554592928a7930d53a01cbe5273033f79a1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202508131800
- Commit SHA: d9556f3fd76c47dc0d0eef8bf23148614b10ea48

Patches
----------------------------------------
All patches applied

master
=====================
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH] ti-bsp: ti-img-encode-decode: Update SRCREV
- Submitter: From: Brandon Brnich <b-brnich@ti.com>
- Date: Date: Fri, 15 Aug 2025 09:57:57 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: efd61554592928a7930d53a01cbe5273033f79a1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko <denys@konsulko.com>
- Commit Subject: meta-beagle: conf/machine rework all DTB lists
- Commit SHA: 6294d9e9ca14dff4a2054b7ef0fa3da08aadd528

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS

master
=====================
PASS





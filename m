Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BB0CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 13:50:23 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.14902.1758203415871803228
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 06:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CwjdRTiJ;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58IDoDvF022747;
	Thu, 18 Sep 2025 08:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758203413; i=@ti.com;
	bh=hBjaCKO1DpqUXahT8jWOMihhwvriZ5RZXof25/I7mdI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CwjdRTiJpzFyBOuIsgwODetRbe2Pt3CHadM5pHGCZtKfGHSdJsHrafLh6Mp+Z/ldb
	 3/n+qeFHlyDgIUivAQel/XWt8CAnTIjpP++gZ1lIOmrScK8qbuggkKDOfRLTqFrble
	 eadR+OcJQVNSAGGetXuOdA4ifVjzAr9Oups4TxcI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58IDoD2d1589421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 08:50:13 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 08:50:13 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 08:50:13 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58IDoD5P3711876;
	Thu, 18 Sep 2025 08:50:13 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 0EE42D6F28; Thu, 18 Sep 2025 08:50:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/5] ti-sgx-ddk-um: UM side driver depends on KM side driver
Date: Thu, 18 Sep 2025 08:50:13 -0500
Message-ID: <20250918135013.287464-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250918132842.1183883-1-afd@ti.com>
References: <20250918132842.1183883-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Sep 2025 13:50:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19037

meta-ti / na / 20250918132842.1183883-1-afd

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
- Patch Series: [meta-ti][master][PATCH 1/5] ti-sgx-ddk-um: UM side driver depends on KM side driver
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 18 Sep 2025 08:28:38 -0500
- Num Patches: 5
- Mailing List (public inbox) Commit SHA: 68fdaa12f475007c066ce9fb66479e50759672b7

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: optee-test: Remove unneeded patch
- Commit SHA: 1f4cf82dfdd566dcf2b438d3a46f57015168f313

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS





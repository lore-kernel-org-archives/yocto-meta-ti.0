Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF832CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 13:15:25 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.19659.1758028516856161986
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Sep 2025 06:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=S51a3jor;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58GDFEn8017790;
	Tue, 16 Sep 2025 08:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758028514; i=@ti.com;
	bh=4t1gHZAr68qK7OjMSbsTdCs4QJCIN9raDC6H5YgGah0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=S51a3jork0ZCTKaeOVSeo7TxNbrzAG4onRQTMBRivNS4s2R5FD4abXUSlxRxgacXu
	 Rf18d6UGtsnndKADzp7aJO8Qh0KbgFOb9G8N+sNlnHIJf0WP2+oGi5Hqo6z9WsnjhY
	 8dkFpc1XqO7ayxxtsX/bR3EK69WBwZDu22P1ZcQA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58GDFE2K1553765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 16 Sep 2025 08:15:14 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 16
 Sep 2025 08:15:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Sep 2025 08:15:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58GDFDWV1357426;
	Tue, 16 Sep 2025 08:15:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D6C4E13F529; Tue, 16 Sep 2025 08:15:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] optee-test: Remove unneeded patch
Date: Tue, 16 Sep 2025 08:15:13 -0500
Message-ID: <20250916131513.2921747-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250916131027.7909-1-reatmon@ti.com>
References: <20250916131027.7909-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Sep 2025 13:15:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19014

meta-ti / na / 20250916131027.7909-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] optee-test: Remove unneeded patch
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Denys Dmytriyenko <denys@konsulko.com>
- Date: Date: Tue, 16 Sep 2025 08:10:27 -0500
-Date: Tue, 6 May 2025 21:35:55 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9f6549df405dae4c43963028bda85d2884a43a8e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508271122
- Commit SHA: 3dad773982636ade2ba685089e351ce69a28f9dc

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] optee-test: Remove unneeded patch
    error: patch failed: meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc:3
    error: meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc: patch does not apply
    Applying: optee-test: Remove unneeded patch
    Patch failed at 0001 optee-test: Remove unneeded patch





Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9109CA0ED1
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 19:05:53 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.1138.1755543950769806059
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Aug 2025 12:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xUgLzbNa;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57IJ5nN32781210;
	Mon, 18 Aug 2025 14:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755543949; i=@ti.com;
	bh=tP4gHK4aDhGIn9XMPpej5TZngwixguaCBMc6O3S+sSs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xUgLzbNauSTfcYy9OIR1Jmwj7B2R1sGxamk+IHj7zke47+sf3nLuifTbfF+sVOr4E
	 K7tKAwNpy1sqX6cFrF7mVxWkJKNXh0EyJV7kslcuCzRW44wVGrVO28V9oX+qbsaDLk
	 41AbAdkFEAuUh0huf5PHujGdmqQjGZtmVMznyWCg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57IJ5n4w499183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 14:05:49 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 14:05:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 14:05:49 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57IJ5nYM1791955;
	Mon, 18 Aug 2025 14:05:49 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2E88813F532; Mon, 18 Aug 2025 14:05:49 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap/master][PATCH] meta-ti-bsp: Add all tiboot3.bin and sysfw.itb variants by wildcard
Date: Mon, 18 Aug 2025 14:05:49 -0500
Message-ID: <20250818190549.2256388-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250818190146.1371051-1-afd@ti.com>
References: <20250818190146.1371051-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 18 Aug 2025 19:05:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18934

meta-ti / na / 20250818190146.1371051-1-afd

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
- Patch Series: [meta-ti][scarthgap/master][PATCH] meta-ti-bsp: Add all tiboot3.bin and sysfw.itb variants by wildcard
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Mon, 18 Aug 2025 14:01:46 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fc5d325167589a5380314e604121cc85a8635235

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Brandon Brnich <b-brnich@ti.com>
- Commit Subject: ti-bsp: ti-img-encode-decode: Update SRCREV
- Commit SHA: 49354b88a8a4976fd3da02cb9864ade3c6a9e817

Patches
----------------------------------------
All patches applied

master
=====================
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH] meta-ti-bsp: Add all tiboot3.bin and sysfw.itb variants by wildcard
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Mon, 18 Aug 2025 14:01:46 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fc5d325167589a5380314e604121cc85a8635235

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508180100
- Commit SHA: bf71f80f3e8d7dc77f9e32389f922e762f87eec2

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





Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3832BCA0FE1
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 10:50:33 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.7018.1755859831523131019
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 03:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wSG0JovU;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MAoUMw232983;
	Fri, 22 Aug 2025 05:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755859830; i=@ti.com;
	bh=rJSJO0/mpCnUoPuprUBsrBrCWVJkcthhoOYj1Z1rUmE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wSG0JovUSdjorE3hQ8LYb9GpPZGhrIowqFwtRRKkkeujZ7cnVHnctc+uflWezkKR6
	 xWhrcK2UPfgIEvWyVCK6nXPC3cZvlqAC+qYJ9aJ5DC70oAvW2sQVB2Tk9Gk4bGujUH
	 roIgV7gyv2sNGnTHtztuqgwB946VctC3jRxW556k=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MAoUjg3227269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 05:50:30 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 05:50:29 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 05:50:29 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MAoTiB3389979;
	Fri, 22 Aug 2025 05:50:29 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B89B0181226; Fri, 22 Aug 2025 05:50:29 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508220021
Date: Fri, 22 Aug 2025 05:50:29 -0500
Message-ID: <20250822105029.1996646-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250822104436.712507-1-lcpdbld@list.ti.com>
References: <20250822104436.712507-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Aug 2025 10:50:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18961

meta-ti / na / 20250822104436.712507-1-lcpdbld

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
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508220021
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 22 Aug 2025 05:44:36 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 436dbeb6401092c7fc73584067dc4a03e70c5a2c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
- Commit SHA: c2b58f991f2175f7b0bfa14a2bce042bfe4610c5

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS





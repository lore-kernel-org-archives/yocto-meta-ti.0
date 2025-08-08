Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA52C87FCF
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 02:31:05 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.12915.1754620255390528299
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Aug 2025 19:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZXAqCkUx;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5782UsgF446827;
	Thu, 7 Aug 2025 21:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754620254; i=@ti.com;
	bh=2IT6QjuwlqE5u68BDGeXx5Yc8eJ5sXv/ucVYyf4Kvpw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZXAqCkUxYtstSIdBnghgKe3WQbiDLgguZmQajBkThM/50QnLAkgERfHpBZnzRzA5/
	 9mpfUdFcIY1Clw0pYugqfR7dntc5KT64ykAg7ML6BL9XQI6qtH8LEdGIE5lWkuyvVk
	 Hjz6vrOoinIB4+ewQKviKN32GITt+yx3uwhoiDnw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5782Urrw1314462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 7 Aug 2025 21:30:54 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 7
 Aug 2025 21:30:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 7 Aug 2025 21:30:53 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5782Ur7v2039423;
	Thu, 7 Aug 2025 21:30:53 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6CEF813F52F; Thu,  7 Aug 2025 21:30:53 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508071800
Date: Thu, 7 Aug 2025 21:30:53 -0500
Message-ID: <20250808023053.1504851-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250808022458.4193569-1-lcpdbld@list.ti.com>
References: <20250808022458.4193569-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Aug 2025 02:31:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18910

meta-ti / na / 20250808022458.4193569-1-lcpdbld

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
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508071800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 7 Aug 2025 21:24:58 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d61a580251ca20ef424747d4e67626e423cc84ae

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Beleswar Padhi <b-padhi@ti.com>
- Commit Subject: licenses: Add INSIDE-Secure LICENSE
- Commit SHA: 6687bca69caaf3b6d0ab98148c817afa209defad

Patches
----------------------------------------
All patches applied



-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  check-yocto-repo: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
scarthgap
=====================
PASS





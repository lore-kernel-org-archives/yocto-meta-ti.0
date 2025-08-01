Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57898C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 16:02:06 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.91850.1754064124117355233
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=X8NlJIqL;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: automated_prc_response@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571G234Q3308875;
	Fri, 1 Aug 2025 11:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754064123;
	bh=pEeDTLKF+nvGBYlnXX6QINnc1+dM0aakgYjppDB+Jz8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=X8NlJIqL3Yj4WyhPhhUWOYRbplnND1o28CIEGPPuWhWdLfwL8BjmW2EZJqz05uS6E
	 IwGytMPzFzY0LY32J7xxXaEl7C8VMUfy547VRThw0+4J8jSxwePFZjFJRE4KmT2P4a
	 Nm+6DE5TJKAXsCIV3BXi5LXTrU5E2GW372vsiN3I=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571G22wp655528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 11:02:03 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 11:02:02 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 11:02:02 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571G22rf322461;
	Fri, 1 Aug 2025 11:02:02 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 49261D6F2D; Fri,  1 Aug 2025 11:02:02 -0500 (CDT)
From: PRC Automation <automated_prc_response@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] linux-ti-*: Move KERNEL_BASE_CLASS default
Date: Fri, 1 Aug 2025 11:02:02 -0500
Message-ID: <20250801160202.878307-1-automated_prc_response@ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250801133958.22623-1-reatmon@ti.com>
References: <20250801133958.22623-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 16:02:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18886

meta-ti / na / 20250801133958.22623-1-reatmon

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
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] linux-ti-*: Move KERNEL_BASE_CLASS default
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 1 Aug 2025 08:39:58 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4a6419bb5add15bfab8802eb7999858d9ebd2772

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 414080e9729f0e76bb66808fb048f5eba8fe6c8a

Patches
----------------------------------------
All patches applied



-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  check-yocto-repo: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
master
=====================
PASS





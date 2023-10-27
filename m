Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F196C27C46
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 22:22:19 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.27991.1698445334170857951
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 15:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hN0RNmCR;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39RMMCMl071991;
	Fri, 27 Oct 2023 17:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698445332;
	bh=JXurdu5Is2BfPlG3azKijrLv6QC0UoNptKEJo2DSd5E=;
	h=From:To:CC:Subject:Date;
	b=hN0RNmCRXWefhBJwZsqBK3YxtI8NOUwYsQgmsRZu280rcKTK3O1qt6ko32wBA+REH
	 Ph4FpmqXQI6T8gtm8T4w/Tv6KRhrFGiiF7malY/uJoIa3o6nggMd7YuemgYKFT7GvB
	 OqTGcKcCPcdU+NtRuTKlcbH2o0VKbf8lJPl1AkMU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39RMMCs0113990
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Oct 2023 17:22:12 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Oct 2023 17:22:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Oct 2023 17:22:11 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39RMMBQN014476;
	Fri, 27 Oct 2023 17:22:11 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [meta-ti][kirkstone][PATCH 0/4] AM62P and other assorted Graphics version bumps
Date: Fri, 27 Oct 2023 17:21:56 -0500
Message-ID: <20231027222200.3659634-1-rs@ti.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Oct 2023 22:22:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17214

From: Randolph Sapp <rs@ti.com>

Another graphics series to pull things forwards and enable AM62P support. This
addresses a potential regression with rogue post SGX integration and tests out
some new dt configuration options for AM62P.

Give it a spin.

Randolph Sapp (4):
  mesa-pvr: isolate sgx and rogue components
  ti-img-rogue-*: move to 23.2 release
  ti-img-rogue-*: add am62p support
  am62pxx: set default gpudriver to ti-img-rogue-driver

 meta-ti-bsp/conf/machine/include/am62pxx.inc                 | 2 +-
 ...r_23.1.6404501.bb => ti-img-rogue-driver_23.2.6460340.bb} | 5 +++--
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb         | 2 +-
 ...s_23.1.6404501.bb => ti-img-rogue-umlibs_23.2.6460340.bb} | 5 +++--
 4 files changed, 8 insertions(+), 6 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_23.1.6404501.bb => ti-img-rogue-driver_23.2.6460340.bb} (88%)
 rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_23.1.6404501.bb => ti-img-rogue-umlibs_23.2.6460340.bb} (97%)

-- 
2.42.0



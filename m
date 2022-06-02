Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37A5C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 17:22:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.367.1654190543380716971
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Jun 2022 10:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xHhxA00h;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-choudhary@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 252HMMlB129738
	for <meta-ti@lists.yoctoproject.org>; Thu, 2 Jun 2022 12:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654190542;
	bh=Z2faFao9UncOXT9QR+1H+oeKsTYYxiHzmsQ1BWCu5OE=;
	h=From:To:CC:Subject:Date;
	b=xHhxA00hSC43fpevhTCg8sLD+kV5EVtgjiOjhYt2gaTSXoaYWmBm1K5L3Q3fkONM7
	 6U2rHZMtRSyk07hYteSGGSL2BE5VwBzNEtusBmYItZ0VHAIZ1uYehA5Y9iI87/2BH1
	 kikNx39uQvYgiu/YwVUinINwt0MorhCQcThKbD2I=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 252HMMFD004633
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 2 Jun 2022 12:22:22 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 2
 Jun 2022 12:22:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 2 Jun 2022 12:22:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 252HMLXF032259;
	Thu, 2 Jun 2022 12:22:21 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>
Subject: [meta-ti] [dunfell PATCH 0/3] Add J721S2 HS platform support
Date: Thu, 2 Jun 2022 22:52:17 +0530
Message-ID: <20220602172220.24096-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Jun 2022 17:22:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14773

This series add the yocto configuration for J721S2 HS platform.

There is a dependancy of this series on u-boot j721s2-hs support on
ti-linux tree which is pending internal review.	

Jayesh Choudhary (3):
  conf: machine: Add j721s2 hs platform
  ti-rtos-firmware: Add j721s2 hs support
  j721s2-hs: changes to support new hs platform

 conf/machine/j721s2-hs-evm-k3r5.conf          | 13 ++++++
 conf/machine/j721s2-hs-evm.conf               | 22 +++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 18 ++++++++
 .../trusted-firmware-a_%.bbappend             |  8 ++++
 recipes-bsp/u-boot/u-boot-ti.inc              |  6 +++
 recipes-security/optee/optee-os_%.bbappend    |  4 ++
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 46 +++++++++++++++++++
 7 files changed, 117 insertions(+)
 create mode 100644 conf/machine/j721s2-hs-evm-k3r5.conf
 create mode 100644 conf/machine/j721s2-hs-evm.conf

-- 
2.17.1



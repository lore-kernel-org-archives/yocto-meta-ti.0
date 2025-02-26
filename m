Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C3BC18E7C
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 14:26:41 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.5206.1740575242296721748
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Feb 2025 05:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MuvOj/WB;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: y-abhilashchandra@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QD7LaS2074972
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Wed, 26 Feb 2025 07:07:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740575241;
	bh=Kl/Le8MJrMywcAWUdqaXSQ6+vR5B5ZUizTfBqqg5WhY=;
	h=From:To:CC:Subject:Date;
	b=MuvOj/WBvzObpEe7/A74qHxouW0dCfuxaP/e9xMtTNIfe8g444FpPYfnHvHZeeWw9
	 8x2APQAzySNb2kMLfEr/v1JvyH9ILjt0uCYNeYFX3jmiZIwalXjUTNB+j0PWD3XsT3
	 xwAg4bq4I9B3WUYyojW24SrbWukUag1F5uJkDiao=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QD7L9T032974
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 26 Feb 2025 07:07:21 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 07:07:21 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 07:07:21 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QD7IqI121230;
	Wed, 26 Feb 2025 07:07:19 -0600
From: "Yemike Abhilash Chandra" <y-abhilashchandra@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <vaishnav.a@ti.com>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v3 0/2] Pick overlays for
Date: Wed, 26 Feb 2025 18:37:14 +0530
Message-ID: <20250226130716.453754-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Feb 2025 14:26:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18337

DS90UB954-Q1EVM can be used to connect FPDLink-III based sensors to
TI EVMs. So pick overlays for the same.

Link: https://www.ti.com/tool/DS90UB954-Q1EVM

Changelog:
changes in v2:
1. Add an coverletter since this series has multiple patches
2. Correct a minor commit title mistake 

changes in v3:
1. Send it to the correct mailing list.

v2: https://lore.kernel.org/all/20250225120014.102886-1-y-abhilashchandra@ti.com/

Yemike Abhilash Chandra (2):
  conf: machine: j721e-evm: Pick overlays for DS90UB954
  conf: machine: j721s2/j784s4: Pick overlays for DS90UB954

 meta-ti-bsp/conf/machine/j721e-evm.conf  | 1 +
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 1 +
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 1 +
 3 files changed, 3 insertions(+)

-- 
2.34.1



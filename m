Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95A9C46CA1
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 14:42:30 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.127651.1697467343745366218
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 07:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pd/Ug3D3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39GEgM61056103
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 09:42:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697467342;
	bh=L7icRqALYh1NsEJ2g3NKUBMGYbrFdqmpcpKwIxzOu4A=;
	h=Date:From:Subject:To:CC;
	b=pd/Ug3D3LzNVNv4ZcDL5YS+1QPB7Wqcvsi7WUdIfzNH7z1iK4Y8tdgYwEKcaX05ze
	 5h7Fzf7YUuzoDotkUuKK8eae422fdZwOPDzwFLYTquPP1ZQQey6PVcypoI6dqQmdI1
	 XJxJurjLygQldnjgyBYS1/QjGUuAzb2Y7EKXmt2M=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39GEgMq9073136
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 09:42:22 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 09:42:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 09:42:22 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39GEgMiq002617;
	Mon, 16 Oct 2023 09:42:22 -0500
Message-ID: <4027359f-f009-4b48-a70a-625a7d35156f@ti.com>
Date: Mon, 16 Oct 2023 09:42:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 0/2] ti-eth-fw: Fix softlinks
 and lower the priority
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <minas@ti.com>, <s-vadapalli@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 14:42:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17117

I am resending these because patchwork seems to have gotten confused 
with the series and the first patch is missing.




Fix the softlinks for j784s4... Use main-r5f0_0 instead of mcu-r5f0_0
Reduce priority of ti-eth-fw to update the softlinks to point to ti-ipc
firmware binaries instead.

Aniket Limaye (2):
   ti-eth-fw: Fix firmware alternative names for j784s4
   ti-eth-fw: Reduce priority for softlinks to 5.

---
v1:
    https://lists.yoctoproject.org/g/meta-ti/message/17093
    https://lists.yoctoproject.org/g/meta-ti/message/17094

Changes since v1:
    Do not remove eth-fw entirely. Just update defaults for softlinks

  meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.34.1



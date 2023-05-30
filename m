Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785FAC7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 10:31:11 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6534.1685442667350725572
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 03:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jHT6w9fq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UAV6VR102980
	for <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 05:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685442666;
	bh=tWKcI9vmCzM8M4oSbXsQ0/eJDWxFzG0qDJYtVqRIaOE=;
	h=Date:To:From:Subject;
	b=jHT6w9fqUjSXAW4/vHjLpUdN3UC04eHwHvfD2yODT6wi5pToP1EHL+gHN8xYLAPGM
	 LreRGSc+scAEppd1qkHu/v0NWmFSXOiqHm16JbEQrEIb4NFvK2ih0xp//v1u8rw5hY
	 jkw7GvhqvGNzU3YYVvd53bSLt0snbxHpnMcAtGNk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UAV6Ec112199
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 05:31:06 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 05:31:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 05:31:06 -0500
Received: from [172.24.145.216] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UAV4n2024731;
	Tue, 30 May 2023 05:31:04 -0500
Message-ID: <5dd77f89-8c9c-e135-5db9-a526d4b3b8de@ti.com>
Date: Tue, 30 May 2023 16:01:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@ti.com>,
        <meta-ti@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
From: Manorit Chawdhry <m-chawdhry@ti.com>
Subject: Fit image signature
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 10:31:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16619

Hi Ryan,

I was recently trying to enable the fit signature locally on yocto and faced a
warning..

WARNING: u-boot-ti-staging-1_2023.04+gitAUTOINC+010afc1fe7-r0 do_deploy: Failure
while adding public key to u-boot binary. Verified boot won't be available.

I was talking to Aniket about it and he let me know that there is some vendor
specific override
in the kernel class now and am worried that this vendor specific override might
not be compatible
with the fit signature that is there in the upstream. Can you let me know if
this vendor specific class
has the things related to enabling the fit signature booting with uboot?

Regards,
Manorit



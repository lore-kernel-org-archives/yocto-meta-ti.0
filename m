Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FD3C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 20:55:25 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.16626.1647377724948006359
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Mar 2022 13:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MawOztUI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22FKtNk3048366
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Mar 2022 15:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647377723;
	bh=ynHc2uiSCz71xZfWTnpDj4cPw5/MT/MjW7jRN0EOdRc=;
	h=Date:To:From:Subject;
	b=MawOztUIiFDjgmJFqA8CdHcHx2jFpTXUQrcg67jWmlWcy/6CLePbPbg32xcUXdsWk
	 +RbbiwI7y2hlCxgFsCrBWcQHPPUHeC0DJWBHd29TlQBZA8+iLhFiPRBplz25PDeDy7
	 lWFkCre6kMCBryC9BTTAlYllXH0mvdmLQY9BWm4k=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22FKtN0I040176
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Mar 2022 15:55:23 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Mar 2022 15:55:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Mar 2022 15:55:23 -0500
Received: from [10.250.35.106] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22FKtN3v023602
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Mar 2022 15:55:23 -0500
Message-ID: <23cbe0c3-130e-c00a-a069-f39d8cef1f45@ti.com>
Date: Tue, 15 Mar 2022 15:55:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: <meta-ti@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
Subject: Patchwork
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Mar 2022 20:55:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14511


All,

We are using the new Yocto Project Patchwork server to track the state 
of patches sent to this mailing list.  If you would like to know the 
status of a given patch, you may query the project at:

https://patchwork.yoctoproject.org/project/ti/list/


-- 
Ryan Eatmon
reatmon@ti.com


Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750FCE7C4E3
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 16:22:35 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.23001.1696436549865504665
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 09:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XO5oE3ZW;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: kamlesh@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 394GMS0L102232;
	Wed, 4 Oct 2023 11:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696436548;
	bh=byyp08y5rArr9d+gvpeq2zgEnhm5AsNQ8CSo2wD86UA=;
	h=From:To:CC:Subject:In-Reply-To:References:Date;
	b=XO5oE3ZW1fxlBINRgZwZHNnSrcWxEGo8mT8E2pn8QLiT7s0kwLyJFhnAOuZNQDQt1
	 hK2u36u42srChdl9F97BtYovm4zrhYPR9v4GT/HxiyRow48xw6X8Jf2S30BZpV4k2n
	 RFn+SjBmpYILwrRXfXzlfvWjQFjzJGBgYJVACKKk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 394GMSdi091564
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Oct 2023 11:22:28 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Oct 2023 11:22:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Oct 2023 11:22:28 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 394GMRi3017823;
	Wed, 4 Oct 2023 11:22:27 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>, <vigneshr@ti.com>,
        <u-kumar1@ti.com>, <afd@ti.com>, <m-chawdhry@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>
Subject: Re: [PATCH] trusted-firmware-a: Update to sha fixing deep sleep on
 AM62x
In-Reply-To: <60330cdb-8bfe-6c80-1afb-7a0fcbe9d8a1@ti.com>
References: <20231004-atf-bump-lpm-v1-1-66ebc652e365@ti.com>
 <8a935839-1f62-db96-2ee6-c1e01bf0c53b@ti.com>
 <87r0mafke6.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
 <60330cdb-8bfe-6c80-1afb-7a0fcbe9d8a1@ti.com>
Date: Wed, 4 Oct 2023 21:52:26 +0530
Message-ID: <87o7hefjct.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Oct 2023 16:22:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17056

"Bajjuri, Praneeth" <praneeth@ti.com> writes:

> On 10/4/2023 11:00 AM, Kamlesh Gurudasani wrote:
>> "Bajjuri, Praneeth" <praneeth@ti.com> writes:
>> 
>>> On 10/4/2023 10:49 AM, Kamlesh Gurudasani wrote:
>>>> Update to commit d7a7135d32a8c7da004c0c19b75bd4e2813f9759,
>>>> which fixes deep sleep bug on AM62x
>>>
>>> Thanks for the patch, But is this commit sanity tested across all K3
>>> platforms?
>> Yes, Manorit has sanity tested this on all K3 devices
>> 
>> http://lcpdresults.itg.ti.com/launcher/results/16114
>
> For future reference, no internal links for mainline lists please:)
>
> Looking at the log, doesnt look like some platforms are booting . (AM62 
> LP, AM65,AM62 GP)
>
> Can you clarify if the failures seen are regression related to ATF update.
AM62X LP-SE is passing, FS is failing because of some infrastructure
reasons

TF-A is same for SE/FS/GP, so should not be an issue.

Same for AM62x.

AM65 is not tested at all.

So nothing related to ATF update. 

>
>
>> 
>> Regards,
>> Kamlesh


Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E905DE7AD44
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 16:53:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.20899.1696524816841786008
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 09:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kWtgR9i5;
 spf=none, err=SPF record not found (domain: ti.com, ip: 198.47.19.142, mailfrom: kamlesh@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 395GrZcB057533;
	Thu, 5 Oct 2023 11:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696524815;
	bh=TM4zJFmkkXkE8h8EXku8bZsDL0zxs+N5aC4vmjDQeHQ=;
	h=From:To:CC:Subject:In-Reply-To:References:Date;
	b=kWtgR9i5n1c7zNMor/ikcAb9Ssv30utdURne4WW5EEBtNQsxaRREXycD1uDk54vNJ
	 gtPC/ImudO37AKNB9LA9sRHq8U1kHFUM++hNk/XykDYwD9fSuOdJe644rrMB/BpFr0
	 QbVlgcwzOJCbg+l4pA3USLADJUUzvdoOs7aMpUBE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 395GrZCa033491
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Oct 2023 11:53:35 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Oct 2023 11:53:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Oct 2023 11:53:35 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 395GrYJI009985;
	Thu, 5 Oct 2023 11:53:34 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>, <vigneshr@ti.com>,
        <u-kumar1@ti.com>, <afd@ti.com>, <m-chawdhry@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [PATCH] trusted-firmware-a: Update to
 sha fixing deep sleep on AM62x
In-Reply-To: <178AF40DE1DB41A9.4010@lists.yoctoproject.org>
References: <20231004-atf-bump-lpm-v1-1-66ebc652e365@ti.com>
 <8a935839-1f62-db96-2ee6-c1e01bf0c53b@ti.com>
 <87r0mafke6.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
 <60330cdb-8bfe-6c80-1afb-7a0fcbe9d8a1@ti.com>
 <178AF40DE1DB41A9.4010@lists.yoctoproject.org>
Date: Thu, 5 Oct 2023 22:23:33 +0530
Message-ID: <87lechf1te.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Oct 2023 16:53:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17059

"Gurudasani, Kamlesh via lists.yoctoproject.org"
<kamlesh=ti.com@lists.yoctoproject.org> writes:

...
>>> Yes, Manorit has sanity tested this on all K3 devices
>>> 
>>> http://lcpdresults.itg.ti.com/launcher/results/16114
>>
>> For future reference, no internal links for mainline lists please:)
>>
>> Looking at the log, doesnt look like some platforms are booting . (AM62 
>> LP, AM65,AM62 GP)
>>
>> Can you clarify if the failures seen are regression related to ATF update.
> AM62X LP-SE is passing, FS is failing because of some infrastructure
> reasons
>
> TF-A is same for SE/FS/GP, so should not be an issue.
>
> Same for AM62x.
>
> AM65 is not tested at all.
Sanity tested on GP AM65x succesfully.

https://gist.github.com/ti-kamlesh/b28a001aa3d868df83b0f6180eddf168

Regards,
Kamlesh


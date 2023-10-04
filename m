Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256A7E7C4DD
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 16:09:35 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.22933.1696435774640511987
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 09:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Wy+rj4Mt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 394G9XmR098904;
	Wed, 4 Oct 2023 11:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696435773;
	bh=FGaLRTy7WbxETSQDSjEb4Oc+EsoZGxPen9qtR7LtS98=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Wy+rj4MtY5I4huLnJaT4bJ1v+13L0nwbrvUO3crDOqxyYYzvX5Bt4pldhzJGz/+ht
	 3TYVVYtknL96Ee7FWnNWbj70/sX9SRgvFf9ckaAdT+NXyrtugLdyQh/kIK0z1M25mW
	 i0rsSIgYyzuYKvzCcXxQOFXehNB2+eHYc8zoQKuY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 394G9XSI084267
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Oct 2023 11:09:33 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Oct 2023 11:09:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Oct 2023 11:09:33 -0500
Received: from [10.247.18.57] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 394G9Xfo116780;
	Wed, 4 Oct 2023 11:09:33 -0500
Message-ID: <60330cdb-8bfe-6c80-1afb-7a0fcbe9d8a1@ti.com>
Date: Wed, 4 Oct 2023 11:09:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] trusted-firmware-a: Update to sha fixing deep sleep on
 AM62x
Content-Language: en-US
To: Kamlesh Gurudasani <kamlesh@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <afd@ti.com>, <m-chawdhry@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>
References: <20231004-atf-bump-lpm-v1-1-66ebc652e365@ti.com>
 <8a935839-1f62-db96-2ee6-c1e01bf0c53b@ti.com>
 <87r0mafke6.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <87r0mafke6.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Oct 2023 16:09:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17055



On 10/4/2023 11:00 AM, Kamlesh Gurudasani wrote:
> "Bajjuri, Praneeth" <praneeth@ti.com> writes:
> 
>> On 10/4/2023 10:49 AM, Kamlesh Gurudasani wrote:
>>> Update to commit d7a7135d32a8c7da004c0c19b75bd4e2813f9759,
>>> which fixes deep sleep bug on AM62x
>>
>> Thanks for the patch, But is this commit sanity tested across all K3
>> platforms?
> Yes, Manorit has sanity tested this on all K3 devices
> 
> http://lcpdresults.itg.ti.com/launcher/results/16114

For future reference, no internal links for mainline lists please:)

Looking at the log, doesnt look like some platforms are booting . (AM62 
LP, AM65,AM62 GP)

Can you clarify if the failures seen are regression related to ATF update.


> 
> Regards,
> Kamlesh


Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5719CC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 08:15:22 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.6079.1699344916767498766
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 00:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ci9OVlUu;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: kamlesh@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A78FFGP036362;
	Tue, 7 Nov 2023 02:15:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699344915;
	bh=JlBVy62sGrLMjJHYzUwEzI/9BkrE7+Jznekx1ER8VQo=;
	h=From:To:CC:Subject:In-Reply-To:References:Date;
	b=Ci9OVlUuo/zj0LF1ONnCD92ZpCkdXLC9sQhiXi8S1cIjaTZwlqiOoopfhewCaulGi
	 Vow5Dm/jJDqWusR1z8sVCBb+holpUxm661+zUOsWnICI7yDR5iPPGj2oQWb61sl1sg
	 3OPS3e4Bl96+DZUjCYgPpTTCRYzTFFK5Oj8osepU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A78FFT4063325
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Nov 2023 02:15:15 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 02:15:15 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 02:15:15 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A78FEnY109703;
	Tue, 7 Nov 2023 02:15:14 -0600
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>, <vigneshr@ti.com>,
        <u-kumar1@ti.com>, <afd@ti.com>, <m-chawdhry@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>, <vibhore@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vishalm@ti.com>
Subject: Re: [PATCH] optee-os: Enable OP-TEE TRNG in AM62X
In-Reply-To: <b4ec0bc6-7f32-4ae2-bac2-e3339557ecaf@ti.com>
References: <20231106-enable-trng-v1-1-59cb0b4f9bcb@ti.com>
 <b4ec0bc6-7f32-4ae2-bac2-e3339557ecaf@ti.com>
Date: Tue, 7 Nov 2023 13:45:13 +0530
Message-ID: <871qd2t1wu.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 08:15:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17250

"Bajjuri, Praneeth" <praneeth@ti.com> writes:

...
>> ---
>>   meta-ti-bsp/recipes-security/optee/optee-os-ti.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>> index 91b66a36..d1c15cb2 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>> @@ -6,7 +6,7 @@ inherit ti-secdev
>>   
>>   EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>>   
>> -EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
>> +EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
>>   EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
>
> How about doing the same for am62p ?
@vibhore, Considering instabilities with AM62a, let me know if I should
enable it for AM62p. Will send v2 accordingly.

-Kamlesh


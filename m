Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28356C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 21:45:07 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.210752.1673991906544299580
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 13:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=vDIBxUSP;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30HLj5EQ092412
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 15:45:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673991905;
	bh=yLrFNWe3qzqUKJjIi85MPSzaFQUg34m8m6JTYnP3cBo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vDIBxUSPSb4XRXDJJV9b5LAPtkFGglBZuU397mzOaGqmHsxtrS7WsDNAO24AdutYh
	 mrtZtXFcU0kq+VKclhJLZjhjokGliPkd/0oqJMPELrr9hXmu+uRI2NmYU9fR8aTZQ+
	 Udq9I5SL+XHO8+jJP26XqY1ogrQ9mONniTCU0+Gs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30HLj5Mk030085
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 15:45:05 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 17
 Jan 2023 15:45:05 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 17 Jan 2023 15:45:05 -0600
Received: from [10.250.34.87] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30HLj46P031433;
	Tue, 17 Jan 2023 15:45:05 -0600
Message-ID: <6709635a-2238-6ef3-480b-825956159df7@ti.com>
Date: Tue, 17 Jan 2023 15:45:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti] [dunfell PATCH] optee-os: Enable SW PRNG for OP-TEE in
 AM62X
To: "Bajjuri, Praneeth" <praneeth@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>
References: <20230117061257.341041-1-d-gole@ti.com>
 <4fb6933c-bc96-6440-c266-c95f59abeb98@ti.com>
 <488fbd07-2a74-65cd-fac4-1b18c7d922dc@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <488fbd07-2a74-65cd-fac4-1b18c7d922dc@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 30HLj5EQ092412
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 21:45:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15581

On 1/17/23 2:46 PM, Bajjuri, Praneeth wrote:
> +Kamlesh
>=20
> On 1/17/2023 9:44 AM, Andrew Davis via lists.yoctoproject.org wrote:
>> On 1/17/23 12:12 AM, Dhruva Gole wrote:
>>> commit 98506a4a07363 ("optee-os: Update SRCREV for OP-TEE TRNG in AM6=
2X")
>>>
>>> Disables SW PRNG =3D> Enabling Hardware RNG. This is breaking Suspend=
 Resume
>>> on AM62xx EVM variants. To fix this keep using SOFTWARE_PRNG enabled =
as
>>> it was.
>>>
>>> Cc: vibhore@ti.com
>>> Cc: Andrew Davis <afd@ti.com>
>>> Signed-off-by: Dhruva Gole <d-gole@ti.com>
>>> ---
>>
>> Your subject tag is a bit off, I usually use:
>>
>> --subject-prefix=3D"meta-ti][dunfell][PATCH"
>>
>> As for the patch, do we have any insight into why RNG use is causing
>> issues with suspend/resume? I'm not seeing any suspend/resume hooks
>> in the OPTEE RNG Linux driver, what all have you tried so far to
>> fix the issue (outside of just disabling support like here, which
>> should be a last resort).
>=20
> Andrew, Agreed on the investigation part. Kamlesh will be investigating=
 this once back from vacation.
>=20
> For now, this patch going to SW PRNG is unblocking LPM S/R driver valid=
ation and would prefer to go to this , and continue to investigate the HW=
 RNG impact with S/R scenario.
>=20

My only issue is that this unconditionally turns off this feature for
AM62x users, would it work to instead disable the "optee" node in the
lpmdemo.dts file until the driver can be fixed to support LPM?

Andrew

>=20
>>
>> Andrew
>>
>>>
>>> I haven't tested thoroughly using bitbake and built from scratch yet,
>>> however locally in my OPTEE Repo the command I run is
>>> ...
>>> make -j14 CROSS_COMPILE64=3Daarch64-none-linux-gnu- PLATFORM=3Dk3-am6=
2x
>>> CFG_ARM64_core=3Dy CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_TEE_CORE_DEBUG=3Dy
>>> CFG_WITH_SOFTWARE_PRNG=3Dy
>>> ...
>>> and this seems to get low power mode (suspend resume) functional for
>>> AM625 SK EVM that I am testing on.
>>>
>>> =C2=A0 recipes-security/optee/optee-os_%.bbappend | 4 ++--
>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-sec=
urity/optee/optee-os_%.bbappend
>>> index db9064deba27..83eb9c6a20c6 100644
>>> --- a/recipes-security/optee/optee-os_%.bbappend
>>> +++ b/recipes-security/optee/optee-os_%.bbappend
>>> @@ -6,8 +6,8 @@ DEPENDS_append_ti-soc =3D " python3-cryptography-nati=
ve"
>>> =C2=A0 EXTRA_OEMAKE_append_k3 =3D "${@ 'CFG_CONSOLE_UART=3D'+ d.getVa=
r('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>>> -EXTRA_OEMAKE_append_am62xx-evm =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>>> -EXTRA_OEMAKE_append_am62xx-lp-evm =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>>> +EXTRA_OEMAKE_append_am62xx-evm =3D " CFG_WITH_SOFTWARE_PRNG=3Dy CFG_=
TEE_CORE_LOG_LEVEL=3D1"
>>> +EXTRA_OEMAKE_append_am62xx-lp-evm =3D " CFG_WITH_SOFTWARE_PRNG=3Dy C=
FG_TEE_CORE_LOG_LEVEL=3D1"
>>> =C2=A0 EXTRA_OEMAKE_append_am62axx-evm =3D " CFG_TEE_CORE_LOG_LEVEL=3D=
1"
>>> =C2=A0 do_compile_prepend_ti-soc() {
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#15577): https://lists.yoctoproject.org/g/meta-ti/m=
essage/15577
>> Mute This Topic: https://lists.yoctoproject.org/mt/96325420/2167429
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@=
ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


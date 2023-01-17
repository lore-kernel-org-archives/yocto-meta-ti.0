Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C227CC3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 20:46:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.209257.1673988413006628019
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 12:46:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=c9O+KKjB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30HKkq6t005929
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 14:46:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673988412;
	bh=dSxqsH8IfsrjL7LscgioqqDgyPvJjhMAKsaYU7OP0Q8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c9O+KKjB7hcaNY5mw/t0ROpuOzwjC5/1yFpUORqQMebk5brFwSFQV92wiYAIVc896
	 7X0bgj8oPKK79faZTKcFZC5KtnWD/K9dBdC/CghCF6trU4z2EGsJWlvlhHm2BtZWtN
	 kAofpPsi3IR9uErl4JkVS6vGvBu/uM0lyD7NjFow=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30HKkqbm003892
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 14:46:52 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 17
 Jan 2023 14:46:51 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 17 Jan 2023 14:46:51 -0600
Received: from [10.247.21.147] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30HKkpCY083094;
	Tue, 17 Jan 2023 14:46:51 -0600
Message-ID: <488fbd07-2a74-65cd-fac4-1b18c7d922dc@ti.com>
Date: Tue, 17 Jan 2023 14:46:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti] [dunfell PATCH] optee-os: Enable SW PRNG for OP-TEE in
 AM62X
To: <afd@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Kamlesh Gurudasani
	<kamlesh@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>
References: <20230117061257.341041-1-d-gole@ti.com>
 <4fb6933c-bc96-6440-c266-c95f59abeb98@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <4fb6933c-bc96-6440-c266-c95f59abeb98@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 30HKkq6t005929
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 20:46:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15580

+Kamlesh

On 1/17/2023 9:44 AM, Andrew Davis via lists.yoctoproject.org wrote:
> On 1/17/23 12:12 AM, Dhruva Gole wrote:
>> commit 98506a4a07363 ("optee-os: Update SRCREV for OP-TEE TRNG in AM62=
X")
>>
>> Disables SW PRNG =3D> Enabling Hardware RNG. This is breaking Suspend=20
>> Resume
>> on AM62xx EVM variants. To fix this keep using SOFTWARE_PRNG enabled a=
s
>> it was.
>>
>> Cc: vibhore@ti.com
>> Cc: Andrew Davis <afd@ti.com>
>> Signed-off-by: Dhruva Gole <d-gole@ti.com>
>> ---
>=20
> Your subject tag is a bit off, I usually use:
>=20
> --subject-prefix=3D"meta-ti][dunfell][PATCH"
>=20
> As for the patch, do we have any insight into why RNG use is causing
> issues with suspend/resume? I'm not seeing any suspend/resume hooks
> in the OPTEE RNG Linux driver, what all have you tried so far to
> fix the issue (outside of just disabling support like here, which
> should be a last resort).

Andrew, Agreed on the investigation part. Kamlesh will be investigating=20
this once back from vacation.

For now, this patch going to SW PRNG is unblocking LPM S/R driver=20
validation and would prefer to go to this , and continue to investigate=20
the HW RNG impact with S/R scenario.


>=20
> Andrew
>=20
>>
>> I haven't tested thoroughly using bitbake and built from scratch yet,
>> however locally in my OPTEE Repo the command I run is
>> ...
>> make -j14 CROSS_COMPILE64=3Daarch64-none-linux-gnu- PLATFORM=3Dk3-am62=
x
>> CFG_ARM64_core=3Dy CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_TEE_CORE_DEBUG=3Dy
>> CFG_WITH_SOFTWARE_PRNG=3Dy
>> ...
>> and this seems to get low power mode (suspend resume) functional for
>> AM625 SK EVM that I am testing on.
>>
>> =C2=A0 recipes-security/optee/optee-os_%.bbappend | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-security/optee/optee-os_%.bbappend=20
>> b/recipes-security/optee/optee-os_%.bbappend
>> index db9064deba27..83eb9c6a20c6 100644
>> --- a/recipes-security/optee/optee-os_%.bbappend
>> +++ b/recipes-security/optee/optee-os_%.bbappend
>> @@ -6,8 +6,8 @@ DEPENDS_append_ti-soc =3D " python3-cryptography-nativ=
e"
>> =C2=A0 EXTRA_OEMAKE_append_k3 =3D "${@ 'CFG_CONSOLE_UART=3D'+=20
>> d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>> -EXTRA_OEMAKE_append_am62xx-evm =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> -EXTRA_OEMAKE_append_am62xx-lp-evm =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>> +EXTRA_OEMAKE_append_am62xx-evm =3D " CFG_WITH_SOFTWARE_PRNG=3Dy=20
>> CFG_TEE_CORE_LOG_LEVEL=3D1"
>> +EXTRA_OEMAKE_append_am62xx-lp-evm =3D " CFG_WITH_SOFTWARE_PRNG=3Dy=20
>> CFG_TEE_CORE_LOG_LEVEL=3D1"
>> =C2=A0 EXTRA_OEMAKE_append_am62axx-evm =3D " CFG_TEE_CORE_LOG_LEVEL=3D=
1"
>> =C2=A0 do_compile_prepend_ti-soc() {
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15577): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/15577
> Mute This Topic: https://lists.yoctoproject.org/mt/96325420/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@t=
i.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


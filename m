Return-Path: <vigneshr@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B488AC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 04:43:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.6567.1699937008420514172
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Nov 2023 20:43:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Vmr3hLe1;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: vigneshr@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AE4hQbY106387;
	Mon, 13 Nov 2023 22:43:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699937006;
	bh=JbTfwQ4hyOd+ybg9jPwJ/cwj0iREmfarA3my2ltr7+o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Vmr3hLe1C65QUunB82S4P7ybN4KHNOymRT1t2bG+3xlEhVeb88kancI0UcGUH2tUa
	 PjfAga+jY/jbpi8T3hlKhK3x1ANynzSFzW02f4adJb/hwtIJOP654pUwrwGRjONLIY
	 4LP+WoqZRGyDd19ei3uysPsGD9S6T3kc3oldYffY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AE4hQpr110771
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Nov 2023 22:43:26 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Nov 2023 22:43:26 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Nov 2023 22:43:26 -0600
Received: from [10.249.142.56] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AE4hMQG047987;
	Mon, 13 Nov 2023 22:43:23 -0600
Message-ID: <05eb155b-3af8-4d91-9de4-5aaabcee8b02@ti.com>
Date: Tue, 14 Nov 2023 10:13:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] optee-os: Enable OP-TEE TRNG in AM62X and AM62PX
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        Kamlesh Gurudasani
	<kamlesh@ti.com>, <afd@ti.com>,
        <m-chawdhry@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>
References: <20231108-wip-enable-trng-v4-1-69499e0cd53a@ti.com>
 <7695386c-11e6-463d-8f99-26b660e0cf50@ti.com>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
In-Reply-To: <7695386c-11e6-463d-8f99-26b660e0cf50@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 3AE4hQbY106387
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Nov 2023 04:43:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17296



On 11/14/2023 5:29 AM, Bajjuri, Praneeth wrote:
>=20
>=20
> On 11/8/2023 9:17 AM, Kamlesh Gurudasani wrote:
>> Enable TRNG in AM62X and AM62PX, as bugs related to TRNG has been
>> fixed now.
>>
>> TF-A fix:
>> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=
=3Dd7a7135d32a8c7da004c0c19b75bd4e2813f9759
>>
>> OP-TEE fix:
>> https://github.com/OP-TEE/optee_os/commit/e313f4765fd0478bb66985827441=
411793433773
>=20
> Kamlesh,
>=20
> AM62Px boot failed (data abort) with this change.
>=20
> Can you verify and submit along with what else is missing.
>=20
> Error snip:
> E/TC:0 0 Core data-abort at address 0x9b510010
> E/TC:0 0=C2=A0 esr 0x96000210=C2=A0 ttbr0 0x9e8a0000=C2=A0=C2=A0 ttbr1 =
0x00000000=C2=A0=C2=A0 cidr 0x0
> E/TC:0 0=C2=A0 cpu #0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cpsr 0x800003c4
> E/TC:0 0=C2=A0 x0=C2=A0 000000009b510010 x1=C2=A0 0000000000000001
> E/TC:0 0=C2=A0 x2=C2=A0 000000009b510000 x3=C2=A0 0000000000000000
> E/TC:0 0=C2=A0 x4=C2=A0 000000009e874000 x5=C2=A0 0000000000ffffff
> E/TC:0 0=C2=A0 x6=C2=A0 0000000000000002 x7=C2=A0 000000000000fd20
> E/TC:0 0=C2=A0 x8=C2=A0 000000009e890f80 x9=C2=A0 000000009e881000
> E/TC:0 0=C2=A0 x10 000000000000000a x11 0000000000000002
> E/TC:0 0=C2=A0 x12 0000000000000042 x13 0000000000000000
> E/TC:0 0=C2=A0 x14 0000000000000000 x15 0000000000000000
> E/TC:0 0=C2=A0 x16 000000009e83b8cc x17 0000000000000000
> E/TC:0 0=C2=A0 x18 0000000000000000 x19 000000009e8a83d0
> E/TC:0 0=C2=A0 x20 000000009e8a83d8 x21 0000000000000007
> E/TC:0 0=C2=A0 x22 000000009e880000 x23 000000009e880fa8
> E/TC:0 0=C2=A0 x24 0000000100000000 x25 0000000000000000
> E/TC:0 0=C2=A0 x26 0000000000000000 x27 0000000000000000
> E/TC:0 0=C2=A0 x28 0000000000000000 x29 000000009e8a8350
> E/TC:0 0=C2=A0 x30 000000009e816fbc elr 000000009e816fdc
> E/TC:0 0=C2=A0 sp_el0 000000009e8a8350
> E/TC:0 0

I suggest lets keep CFG_WITH_SOFTWARE_PRNG=3Dy for am62px and debug this
post 9.2

Regards
Vignesh


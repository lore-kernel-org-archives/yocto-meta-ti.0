Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D266EC3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 13:29:35 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.18627.1721395768710834535
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Jul 2024 06:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ezBLhNw9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46JDTQum128241;
	Fri, 19 Jul 2024 08:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721395766;
	bh=Xw2rU0B1mRxyFFSOK5PkIuLzauT+kNWGIIOrfJ+CREE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ezBLhNw9HAlL2SATDGU8qjCpageMWe3ef4u0hnrM9qYB+2eCvtnYPQS4BGXwRkE3m
	 e0HyjcN8VUxBggBL91C6PDGJaM0Mv7mObHijWC/jJYKGYJpeBSL/clq/hiykKMv9kG
	 506+UPSppdtq2zNGbXWpw97x5btaPGh0mpo18VO8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46JDTQO1061762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Jul 2024 08:29:26 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 Jul 2024 08:29:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 Jul 2024 08:29:26 -0500
Received: from [10.249.34.79] ([10.249.34.79])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46JDTQvC016207;
	Fri, 19 Jul 2024 08:29:26 -0500
Message-ID: <7d845a05-f3f9-4671-90cb-c25588309f12@ti.com>
Date: Fri, 19 Jul 2024 08:29:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][master/scarthgap][PATCH] linux: Manage the
 kernel patches using the BSP system
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>
References: <20240718182421.13591-1-reatmon@ti.com>
 <bd14cae5-e473-4542-adea-0b0cd15d9a8c@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <bd14cae5-e473-4542-adea-0b0cd15d9a8c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 46JDTQum128241
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Jul 2024 13:29:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17890



On 7/18/2024 11:27 PM, Chirag Shilwant wrote:
> Hi Ryan,
> On 18/07/24 23:54, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Applying the patches to all kernels is not going to work. Each kernel=20
>> might need different patches to address reproducibility issues.=20
>> Signed-off-by: Ryan Eatmon <reatmon@=E2=80=8Ati.=E2=80=8Acom> ---=20
>> meta-ti-bsp/recipes-kernel/linux/ti-kernel.=E2=80=8Ainc | 12
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the source=
=20
>> of this email and know the content is safe. If you wish to report this=
=20
>> message to IT Security, please forward the message as an attachment to=
=20
>> phishing@list.ti.com
>> ZjQcmQRYFpfptBannerEnd
>> Applying the patches to all kernels is not going to work.=C2=A0 Each k=
ernel
>> might need different patches to address reproducibility issues.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 12 ++++++++---=
-
>> =C2=A0 1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc=20
>> b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>> index f24fbe51..8bb30d40 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>> @@ -13,8 +13,12 @@ EXTRA_DTC_ARGS +=3D "${@get_extra_dtc_args(d)}"
>> =C2=A0 KERNEL_DTBDEST =3D "${KERNEL_IMAGEDEST}/dtb"
>> =C2=A0 KERNEL_DTBVENDORED =3D "1"
>> -SRC_URI:append =3D " \
>> -file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
>> -file://0001-vt-conmakehash-improve-reproducibility.patch \
>> -file://0001-pnmtologo-use-relocatable-file-name.patch \
>> +KERNEL_PATCHES =3D ""
>> +
>> +KERNEL_PATCHES:bsp-ti-6.6 =3D " \
>> +   =20
>> file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
>> +=C2=A0=C2=A0=C2=A0 file://0001-vt-conmakehash-improve-reproducibility=
.patch \
>> +=C2=A0=C2=A0=C2=A0 file://0001-pnmtologo-use-relocatable-file-name.pa=
tch \
>> =C2=A0 "
>=20
>=20
>=20
> The patch title says [master/scarthgap] but I don't see these patches i=
n=20
> scarthgap getting applied

I'll look into it.  I've been a little preoccupied with master this=20
week, but I'll take a look today.


  [1]
> Additionally the patches itself are missing in scarthgap branch [2]
> Are they applicable to scarthgap?

Yes, they are.


> [1]:=20
> https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/recipes-=
kernel/linux/ti-kernel.inc?h=3Dscarthgap
>=20
> [2]:=20
> https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/recipes-=
kernel/linux/files?h=3Dscarthgap
>=20
>=20
>=20
>> +
>> +SRC_URI:append =3D " ${KERNEL_PATCHES} "
>> --=20
>> 2.17.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#17888):=20
>> https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/m=
essage/17888__;!!G3vK!T7Z2BA-Nk4Deu1oupZmJqJKhIHqoFGbruxASymNM3q5ISnIEShm=
zH_rXiNv1sd9t5IPUFAeq1MVZGvxkGY-um1_ZJzYlEx9Q0w$
>> Mute This Topic:=20
>> https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/10742199=
2/7030289__;!!G3vK!T7Z2BA-Nk4Deu1oupZmJqJKhIHqoFGbruxASymNM3q5ISnIEShmzH_=
rXiNv1sd9t5IPUFAeq1MVZGvxkGY-um1_ZJzYHEViZow$
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe:=20
>> https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/u=
nsub__;!!G3vK!T7Z2BA-Nk4Deu1oupZmJqJKhIHqoFGbruxASymNM3q5ISnIEShmzH_rXiNv=
1sd9t5IPUFAeq1MVZGvxkGY-um1_ZJzb2hPAKdA$=C2=A0 [c-shilwant@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


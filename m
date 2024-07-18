Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88342C3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 08:13:09 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.10334.1721290379795494983
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 01:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=p8426XED;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46I8Cw8c051592
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 03:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721290378;
	bh=hOoGispJJsoWvFn7aEFL+C6CPR0R1wB2xoJ/h00BiEM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=p8426XEDzRbauFOAx7oyaVFSeQgufKqRMrhi44Zp/LlK83DCBv7F1WRj2E09uXzsf
	 Gc0dmFby4Magd5UiHv2ctTuHwRDsQHjxqgy/LpaNh0r2bOAkKE26HPAup1poRxc/KU
	 26dffg3Kmugd9bnSq6drZcHRtkYngt01DF+YPW9o=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46I8CwmO122483
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 03:12:58 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Jul 2024 03:12:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Jul 2024 03:12:58 -0500
Received: from [172.24.19.89] (lt5cd112gt3k.dhcp.ti.com [172.24.19.89])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46I8CtQT121490;
	Thu, 18 Jul 2024 03:12:56 -0500
Content-Type: multipart/alternative;
	boundary="------------bBtXeYW1uMZwD6zX0QG67rGq"
Message-ID: <0c76a7e1-840a-4564-ae42-38225dd351e8@ti.com>
Date: Thu, 18 Jul 2024 13:42:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 3/3] meta-ti-bsp: j742s2: add
 Rogue GPU driver to machine definition
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <m-chawdhry@ti.com>, <n-francis@ti.com>, <u-kumar1@ti.com>,
        <detheridge@ti.com>
References: <20240717133614.787998-1-a-limaye@ti.com>
 <20240717133614.787998-4-a-limaye@ti.com>
 <def67aa5-9757-486c-b474-4d7372f8efd3@ti.com>
Content-Language: en-US
From: "Limaye, Aniket" <a-limaye@ti.com>
In-Reply-To: <def67aa5-9757-486c-b474-4d7372f8efd3@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 08:13:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17886

--------------bBtXeYW1uMZwD6zX0QG67rGq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 46I8Cw8c051592


On 7/17/2024 7:11 PM, Ryan Eatmon wrote:
>
>
> On 7/17/2024 8:36 AM, Aniket Limaye wrote:
>> Add ti-img-rogue-driver as the preferred provider and enable the gpu
>> driver in the image.
>>
>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/include/j742s2.inc | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc=20
>> b/meta-ti-bsp/conf/machine/include/j742s2.inc
>> index 41f3a73d..60d91f16 100644
>> --- a/meta-ti-bsp/conf/machine/include/j742s2.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
>> @@ -4,7 +4,7 @@ SOC_FAMILY:append =3D ":j742s2"
>> =C2=A0 MACHINE_FEATURES +=3D "screen gpu"
>> =C2=A0 =C2=A0 require conf/machine/include/mesa-pvr.inc
>> -PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
>> +PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
>
> NAK.=C2=A0 With the new BSP support this should be:
>
> PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}=
"
>
Right.. sent a v2 with the fix!
https://lists.yoctoproject.org/g/meta-ti/message/17882

Thanks,
Aniket

>
>> =C2=A0 # Default tiboot3.bin on J742S2 is for HS-FS
>> =C2=A0 IMAGE_BOOT_FILES +=3D "tiboot3-j742s2-hs-fs-evm.bin"
>
--------------bBtXeYW1uMZwD6zX0QG67rGq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 46I8Cw8c051592

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 7/17/2024 7:11 PM, Ryan Eatmon
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:def67aa5-9757-486c-b474-4d7372f8efd3@ti.com">
      <br>
      <br>
      On 7/17/2024 8:36 AM, Aniket Limaye wrote:
      <br>
      <blockquote type=3D"cite">Add ti-img-rogue-driver as the preferred
        provider and enable the gpu
        <br>
        driver in the image.
        <br>
        <br>
        Signed-off-by: Aniket Limaye <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:a-limaye@ti.com">&lt;a-limaye@ti.com&gt;</a>
        <br>
        ---
        <br>
        =C2=A0 meta-ti-bsp/conf/machine/include/j742s2.inc | 2 +-
        <br>
        =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc
        b/meta-ti-bsp/conf/machine/include/j742s2.inc
        <br>
        index 41f3a73d..60d91f16 100644
        <br>
        --- a/meta-ti-bsp/conf/machine/include/j742s2.inc
        <br>
        +++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
        <br>
        @@ -4,7 +4,7 @@ SOC_FAMILY:append =3D ":j742s2"
        <br>
        =C2=A0 MACHINE_FEATURES +=3D "screen gpu"
        <br>
        =C2=A0 =C2=A0 require conf/machine/include/mesa-pvr.inc
        <br>
        -PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
        <br>
        +PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
        <br>
      </blockquote>
      <br>
      NAK.=C2=A0 With the new BSP support this should be:
      <br>
      <br>
      PREFERRED_PROVIDER_virtual/gpudriver ?=3D
      "${BSP_ROGUE_DRIVER_PROVIDER}"
      <br>
      <br>
    </blockquote>
    Right.. sent a v2 with the fix!<br>
    <a class=3D"moz-txt-link-freetext" href=3D"https://lists.yoctoproject=
.org/g/meta-ti/message/17882">https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17882</a>
    <p>Thanks,<br>
      Aniket<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:def67aa5-9757-486c-b474-4d7372f8efd3@ti.com">
      <br>
      <blockquote type=3D"cite">=C2=A0 # Default tiboot3.bin on J742S2 is=
 for
        HS-FS
        <br>
        =C2=A0 IMAGE_BOOT_FILES +=3D "tiboot3-j742s2-hs-fs-evm.bin"
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------bBtXeYW1uMZwD6zX0QG67rGq--


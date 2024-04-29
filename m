Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EC2C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 13:51:28 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.21731.1714398682802126133
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 06:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=WUmA2xsn;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43TDpMn5048619
	for <meta-ti@lists.yoctoproject.org>; Mon, 29 Apr 2024 08:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714398682;
	bh=1QeLQ2QZacrmrX78MI/ArVW5x0+lPj8pvaTTvkRCo4g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WUmA2xsn8M7kZ4hCd2EADbCsL7rDclbr5XRWz78gyCzlRwnFTuH9FpZKPlTB+l2y3
	 QWeKsmlsfXFvHRyNoF4VOHIA3+AWwrRH27kjH42F87CcmaLx+6nLNCJGQ/fcFHKmMs
	 RAEpwD5WrzTpkr74dxmHGCTWbZzeBTWzdMll007k=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43TDpLVm090511
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 29 Apr 2024 08:51:22 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 29
 Apr 2024 08:51:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 29 Apr 2024 08:51:21 -0500
Received: from [172.24.30.181] (lt5cd112gt3k.dhcp.ti.com [172.24.30.181])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43TDpJJa057676;
	Mon, 29 Apr 2024 08:51:20 -0500
Content-Type: multipart/alternative;
	boundary="------------0naCG5yQtfM4D8tI6FU3V8pb"
Message-ID: <41531592-4d1d-41b8-8855-949cb1bb44b1@ti.com>
Date: Mon, 29 Apr 2024 19:21:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: add AM69-SK
 machine configuration
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <b-padhi@ti.com>
References: <20240424083546.2190336-1-a-limaye@ti.com>
 <33f34e2b-ab8b-469e-b2f3-6261a5067428@ti.com>
 <8309620e-3aed-4bae-b0f2-b6b0a98b33ca@ti.com>
 <7e4668e3-d834-4d55-bd17-9a6a98f96251@ti.com>
Content-Language: en-US
From: "Limaye, Aniket" <a-limaye@ti.com>
In-Reply-To: <7e4668e3-d834-4d55-bd17-9a6a98f96251@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Apr 2024 13:51:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17608

--------------0naCG5yQtfM4D8tI6FU3V8pb
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 43TDpMn5048619


On 4/26/2024 1:06 AM, Ryan Eatmon wrote:
>
>
> On 4/24/2024 10:59 PM, Limaye, Aniket wrote:
>> On 4/24/2024 6:53 PM, Ryan Eatmon wrote:
>>>
>>> We have consistently named the machines with -evm and not -sk.=C2=A0 =
Is=20
>>> there a good reason to not name this am69-evm?
>>>
>> Well this is just following the naming convention that got accepted=20
>> in u-boot:
>>
>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/configs?h=3Dti-u-boot=
-2024.04=20
>>
>>
>> Yeah other parts have been like "am62x_evm_*_defconfig" and such, but=20
>> for am69 we have gone with "am69_sk_*_defconfig"
>>
>> Even the dts files for these, everywhere, have -sk suffixes.
>>
>> Hence the change here as well.
>
> Just because the configs in uboot have sk does not imply that the=20
> machine name in meta-ti needs to have sk.=C2=A0 From my understanding,=20
> generally the sk comes first and latest a full up evm.=C2=A0 But the Yo=
cto=20
> machine usually supports all of the variations and so they were named=20
> with -evm to be the broadest possible name.
>
The yocto machine did used to support all of the variations up until=20
now, but starting the next LTS stream, the j784s4-evm build will not=20
work for the am69-sk. U-boot will only be packing one dtb in the u-boot=20
img, which means we require a source code / build config change between=20
j784s4-evm and am68-sk (and all future boards with different dtbs), to=20
be able to boot the board.

The above only explains the need for a new yocto machine for the SKs...=20
As for the naming, everywhere on ti.com we have always used am69-*sk* as=20
the product, including documentation. For example, [1] vs [2].
[1]: https://www.ti.com/tool/J784S4XEVM
[2]: https://www.ti.com/tool/SK-AM69

I don't think we should deviate from ti.com naming, u-boot board names,=20
and the current public documentation, just to have consistency in meta-ti=
?

For future devices, we can keep using -evm as the default since those=20
boards come first (not the corresponding SKs, not sure if it was a typo=20
in your msg). And then add the -sk boards for the SOCs as applicable.

> My personal preference would be to eliminate the -evm for all of the=20
> machines and just go with the soc name.=C2=A0 But if we are going to ha=
ve=20
> it then I think they should be consistent.

am69-sk and j784s4-evm will be including the same soc include=20
(j784s4.inc), but they do need different dtbs, u-boot configs, GP/HS-FS=20
defaults... That is to say we are configuring board specific settings in=20
our builds for our boards. So I don't think we should move to just using=20
the soc name.

>
>> Regards,
>> Aniket
>>
>>>
>>>
>>> On 4/24/2024 3:35 AM, Aniket Limaye wrote:
>>>> From: Beleswar Padhi <b-padhi@ti.com>
>>>>
>>>> As of commits [1] and [2] in ti-u-boot-2024.04 and upstream=20
>>>> respectively
>>>> there is a separate defconfig to build u-boot for j784s4-evm and=20
>>>> am69-sk
>>>>
>>>> Hence, introduce new yocto machine configs for am69-sk. Also remove=20
>>>> am69
>>>> devicetree builds from the j784s4-evm conf
>>>>
>>>> [1]:=20
>>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=3Dti-u-boot-20=
24.04&id=3D8a46af7a39e6218e4de5c6195697af36201c778c
>>>> [2]:=20
>>>> https://source.denx.de/u-boot/u-boot/-/commit/740759d558e632e1540d62=
0baadbcc46fdf24db2
>>>>
>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>>>> ---
>>>> =C2=A0 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 11 +++++++++++
>>>> =C2=A0 meta-ti-bsp/conf/machine/am69-sk.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 20 ++++++++++++++++++++
>>>> =C2=A0 meta-ti-bsp/conf/machine/j784s4-evm.conf=C2=A0=C2=A0 |=C2=A0 =
1 -
>>>> =C2=A0 3 files changed, 31 insertions(+), 1 deletion(-)
>>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am69-sk.conf
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf=20
>>>> b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>> new file mode 100644
>>>> index 00000000..9d2b4cd6
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>>>> @@ -0,0 +1,11 @@
>>>> +#@TYPE: Machine
>>>> +#@NAME: AM69 SK (R5F)
>>>> +#@DESCRIPTION: Machine configuration for the TI AM69 SK (R5F core)
>>>> +
>>>> +require conf/machine/include/k3r5.inc
>>>> +
>>>> +SYSFW_SOC =3D "j784s4"
>>>> +SYSFW_CONFIG =3D "evm"
>>>> +SYSFW_SUFFIX =3D "hs-fs"
>>>> +
>>>> +UBOOT_MACHINE =3D "am69_sk_r5_defconfig"
>>>> diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf=20
>>>> b/meta-ti-bsp/conf/machine/am69-sk.conf
>>>> new file mode 100644
>>>> index 00000000..233a4618
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/conf/machine/am69-sk.conf
>>>> @@ -0,0 +1,20 @@
>>>> +#@TYPE: Machine
>>>> +#@NAME: AM69 SK
>>>> +#@DESCRIPTION: Machine configuration for the TI AM69 SK
>>>> +
>>>> +require conf/machine/include/j784s4.inc
>>>> +
>>>> +TFA_K3_USART =3D "0x8"
>>>> +OPTEE_K3_USART =3D "0x8"
>>>> +
>>>> +KERNEL_DEVICETREE_PREFIX =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
>>>> +"
>>>> +
>>>> +KERNEL_DEVICETREE =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk.dtb \
>>>> +"
>>>> +
>>>> +UBOOT_MACHINE =3D "am69_sk_a72_defconfig"
>>>> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf=20
>>>> b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>>> index e451bf47..6573e5c5 100644
>>>> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>>>> @@ -11,7 +11,6 @@ KERNEL_DEVICETREE_PREFIX =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j784s4 \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j7200-evm-mcspi-loopback \
>>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
>>>> =C2=A0 "
>>>
>
--------------0naCG5yQtfM4D8tI6FU3V8pb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 43TDpMn5048619

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 4/26/2024 1:06 AM, Ryan Eatmon
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:7e4668e3-d834-4d55-bd17-9a6a98f96251@ti.com">
      <br>
      <br>
      On 4/24/2024 10:59 PM, Limaye, Aniket wrote:
      <br>
      <blockquote type=3D"cite">On 4/24/2024 6:53 PM, Ryan Eatmon wrote:
        <br>
        <blockquote type=3D"cite">
          <br>
          We have consistently named the machines with -evm and not
          -sk.=C2=A0 Is there a good reason to not name this am69-evm?
          <br>
          <br>
        </blockquote>
        Well this is just following the naming convention that got
        accepted in u-boot:
        <br>
        <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.ti.com/cgit/ti-u-b=
oot/ti-u-boot/tree/configs?h=3Dti-u-boot-2024.04">https://git.ti.com/cgit=
/ti-u-boot/ti-u-boot/tree/configs?h=3Dti-u-boot-2024.04</a>
        <br>
        <br>
        Yeah other parts have been like "am62x_evm_*_defconfig" and
        such, but for am69 we have gone with "am69_sk_*_defconfig"
        <br>
        <br>
        Even the dts files for these, everywhere, have -sk suffixes.
        <br>
        <br>
        Hence the change here as well.
        <br>
      </blockquote>
      <br>
      Just because the configs in uboot have sk does not imply that the
      machine name in meta-ti needs to have sk.=C2=A0 From my understandi=
ng,
      generally the sk comes first and latest a full up evm.=C2=A0 But th=
e
      Yocto machine usually supports all of the variations and so they
      were named with -evm to be the broadest possible name.
      <br>
      <br>
    </blockquote>
    <p>The yocto machine did used to support all of the variations up
      until now, but starting the next LTS stream, the j784s4-evm build
      will not work for the am69-sk. U-boot will only be packing one dtb
      in the u-boot img, which means we require a source code / build
      config change between j784s4-evm and am68-sk (and all future
      boards with different dtbs), to be able to boot the board.<br>
    </p>
    <p>The above only explains the need for a new yocto machine for the
      SKs... As for the naming, everywhere on ti.com we have always used
      am69-<b>sk</b> as the product, including documentation. For
      example, [1] vs [2]. <br>
      [1]: <a class=3D"moz-txt-link-freetext" href=3D"https://www.ti.com/=
tool/J784S4XEVM">https://www.ti.com/tool/J784S4XEVM</a><br>
      [2]: <a class=3D"moz-txt-link-freetext" href=3D"https://www.ti.com/=
tool/SK-AM69">https://www.ti.com/tool/SK-AM69</a></p>
    <p>I don't think we should deviate from ti.com naming, u-boot board
      names, and the current public documentation, just to have
      consistency in meta-ti?<br>
    </p>
    <p>For future devices, we can keep using -evm as the default since
      those boards come first (not the corresponding SKs, not sure if it
      was a typo in your msg). And then add the -sk boards for the SOCs
      as applicable. <br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:7e4668e3-d834-4d55-bd17-9a6a98f96251@ti.com">My persona=
l
      preference would be to eliminate the -evm for all of the machines
      and just go with the soc name.=C2=A0 But if we are going to have it
      then I think they should be consistent.
      <br>
    </blockquote>
    <p>am69-sk and j784s4-evm will be including the same soc include
      (j784s4.inc), but they do need different dtbs, u-boot configs,
      GP/HS-FS defaults... That is to say we are configuring board
      specific settings in our builds for our boards. So I don't think
      we should move to just using the soc name. <br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:7e4668e3-d834-4d55-bd17-9a6a98f96251@ti.com">
      <br>
      <blockquote type=3D"cite">Regards,
        <br>
        Aniket
        <br>
        <br>
        <blockquote type=3D"cite">
          <br>
          <br>
          On 4/24/2024 3:35 AM, Aniket Limaye wrote:
          <br>
          <blockquote type=3D"cite">From: Beleswar Padhi
            <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:b-padhi@ti.=
com">&lt;b-padhi@ti.com&gt;</a>
            <br>
            <br>
            As of commits [1] and [2] in ti-u-boot-2024.04 and upstream
            respectively
            <br>
            there is a separate defconfig to build u-boot for j784s4-evm
            and am69-sk
            <br>
            <br>
            Hence, introduce new yocto machine configs for am69-sk. Also
            remove am69
            <br>
            devicetree builds from the j784s4-evm conf
            <br>
            <br>
            [1]:
<a class=3D"moz-txt-link-freetext" href=3D"https://git.ti.com/cgit/ti-u-b=
oot/ti-u-boot/commit/?h=3Dti-u-boot-2024.04&amp;id=3D8a46af7a39e6218e4de5=
c6195697af36201c778c">https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/=
?h=3Dti-u-boot-2024.04&amp;id=3D8a46af7a39e6218e4de5c6195697af36201c778c<=
/a><br>
            [2]:
<a class=3D"moz-txt-link-freetext" href=3D"https://source.denx.de/u-boot/=
u-boot/-/commit/740759d558e632e1540d620baadbcc46fdf24db2">https://source.=
denx.de/u-boot/u-boot/-/commit/740759d558e632e1540d620baadbcc46fdf24db2</=
a><br>
            <br>
            Signed-off-by: Beleswar Padhi <a class=3D"moz-txt-link-rfc239=
6E" href=3D"mailto:b-padhi@ti.com">&lt;b-padhi@ti.com&gt;</a>
            <br>
            Signed-off-by: Aniket Limaye <a class=3D"moz-txt-link-rfc2396=
E" href=3D"mailto:a-limaye@ti.com">&lt;a-limaye@ti.com&gt;</a>
            <br>
            ---
            <br>
            =C2=A0 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 11
            +++++++++++
            <br>
            =C2=A0 meta-ti-bsp/conf/machine/am69-sk.conf=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 20
            ++++++++++++++++++++
            <br>
            =C2=A0 meta-ti-bsp/conf/machine/j784s4-evm.conf=C2=A0=C2=A0 |=
=C2=A0 1 -
            <br>
            =C2=A0 3 files changed, 31 insertions(+), 1 deletion(-)
            <br>
            =C2=A0 create mode 100644
            meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
            <br>
            =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am69-sk.co=
nf
            <br>
            <br>
            diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
            b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
            <br>
            new file mode 100644
            <br>
            index 00000000..9d2b4cd6
            <br>
            --- /dev/null
            <br>
            +++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
            <br>
            @@ -0,0 +1,11 @@
            <br>
            +#@TYPE: Machine
            <br>
            +#@NAME: AM69 SK (R5F)
            <br>
            +#@DESCRIPTION: Machine configuration for the TI AM69 SK
            (R5F core)
            <br>
            +
            <br>
            +require conf/machine/include/k3r5.inc
            <br>
            +
            <br>
            +SYSFW_SOC =3D "j784s4"
            <br>
            +SYSFW_CONFIG =3D "evm"
            <br>
            +SYSFW_SUFFIX =3D "hs-fs"
            <br>
            +
            <br>
            +UBOOT_MACHINE =3D "am69_sk_r5_defconfig"
            <br>
            diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf
            b/meta-ti-bsp/conf/machine/am69-sk.conf
            <br>
            new file mode 100644
            <br>
            index 00000000..233a4618
            <br>
            --- /dev/null
            <br>
            +++ b/meta-ti-bsp/conf/machine/am69-sk.conf
            <br>
            @@ -0,0 +1,20 @@
            <br>
            +#@TYPE: Machine
            <br>
            +#@NAME: AM69 SK
            <br>
            +#@DESCRIPTION: Machine configuration for the TI AM69 SK
            <br>
            +
            <br>
            +require conf/machine/include/j784s4.inc
            <br>
            +
            <br>
            +TFA_K3_USART =3D "0x8"
            <br>
            +OPTEE_K3_USART =3D "0x8"
            <br>
            +
            <br>
            +KERNEL_DEVICETREE_PREFIX =3D " \
            <br>
            +=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk \
            <br>
            +=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
            <br>
            +=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
            <br>
            +"
            <br>
            +
            <br>
            +KERNEL_DEVICETREE =3D " \
            <br>
            +=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk.dtb \
            <br>
            +"
            <br>
            +
            <br>
            +UBOOT_MACHINE =3D "am69_sk_a72_defconfig"
            <br>
            diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf
            b/meta-ti-bsp/conf/machine/j784s4-evm.conf
            <br>
            index e451bf47..6573e5c5 100644
            <br>
            --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
            <br>
            +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
            <br>
            @@ -11,7 +11,6 @@ KERNEL_DEVICETREE_PREFIX =3D " \
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j784s4 \
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j7200-evm-mcspi-loopback=
 \
            <br>
            -=C2=A0=C2=A0=C2=A0 ti/k3-am69-sk \
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
            <br>
            =C2=A0 "
            <br>
          </blockquote>
          <br>
        </blockquote>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------0naCG5yQtfM4D8tI6FU3V8pb--


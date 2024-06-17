Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FF8C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 14:02:16 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.57558.1718632927176776309
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 07:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=VG8rs8GK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45HE222G022530;
	Mon, 17 Jun 2024 09:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718632922;
	bh=NquMvGkNQ3MfNYDr0E16FlxKJfyXeayZo633iOD7blI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VG8rs8GKNKThSeyOw6poY8Vw2BVhJcsOBRZG6/e+eJb8Ty4u32zJYn272FUxHsE+d
	 0td6j732DpnpS6DUiRJX6ilBaCsoJeMCIkQu0stTYl7qLzicn3E8Oc06lodziIqhsI
	 jEyYGgmv1OSdkouoctypCko67+h73gwC0fmW1UMI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45HE22bF024254
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Jun 2024 09:02:02 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jun 2024 09:02:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jun 2024 09:02:02 -0500
Received: from [172.24.27.209] (lt5cd112gt3k.dhcp.ti.com [172.24.27.209])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45HE20sK017657;
	Mon, 17 Jun 2024 09:02:01 -0500
Content-Type: multipart/alternative;
	boundary="------------Tqgj0UjyHyQ207Qqng6j3Diy"
Message-ID: <45006745-7575-407f-997d-5f95d3f0154c@ti.com>
Date: Mon, 17 Jun 2024 19:31:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH 2/4] conf/machine/j721e: some
 BSPs don't support all SR and HS variants
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, "Francis, Neha" <n-francis@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>
References: <20240613172254.770920-1-denis@denix.org>
 <20240613172254.770920-2-denis@denix.org>
 <f67f2fee-fa34-47b7-bad3-e7b9fa2a0a43@ti.com>
 <20240614163833.GY21287@denix.org>
Content-Language: en-US
From: "Limaye, Aniket" <a-limaye@ti.com>
In-Reply-To: <20240614163833.GY21287@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 14:02:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17754

--------------Tqgj0UjyHyQ207Qqng6j3Diy
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 45HE222G022530


On 6/14/2024 10:08 PM, Denys Dmytriyenko wrote:
> On Fri, Jun 14, 2024 at 03:50:14PM +0530, Aniket Limaye via lists.yocto=
project.org wrote:
>> Hi Denys,
>>
>> On 6/13/2024 10:52 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko<denys@=E2=80=8Akonsulko.=E2=80=8Acom>  Adjust
>>> IMAGE_BOOT_FILES list as some BSPs do not support all combinations
>>> of SR1.=E2=80=8A1, SR2.=E2=80=8A0, HS-FS and HS-SE variants. Signed-o=
ff-by: Denys
>>> Dmytriyenko<denys@=E2=80=8Akonsulko.=E2=80=8Acom>  ---
>>> meta-ti-bsp/conf/machine/include/j721e.=E2=80=8Ainc
>>> ZjQcmQRYFpfptBannerStart
>>> From: Denys Dmytriyenko<denys@konsulko.com>
>>> Adjust IMAGE_BOOT_FILES list as some BSPs do not support all combinat=
ions
>>> of SR1.1, SR2.0, HS-FS and HS-SE variants.
>>>
>>> Signed-off-by: Denys Dmytriyenko<denys@konsulko.com>
>>> ---
>> Same change is needed for J7200 as well. At the current commit
>> pointed by u-boot-ti-mainline=C2=A0[1], j7200 only has support for bel=
ow:
>> GP , SR2.0 HS-FS , SR2.0 HS-SE
>>
>> Hence also suggest below for j7200.inc:
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc
>> b/meta-ti-bsp/conf/machine/include/j7200.inc
>> index caa79876..2a11e3dd 100644
>> --- a/meta-ti-bsp/conf/machine/include/j7200.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j7200.inc
>> @@ -5,10 +5,14 @@ SOC_FAMILY:append =3D ":j7200"
>>  =C2=A0IMAGE_BOOT_FILES +=3D "tiboot3-j7200-gp-evm.bin"
>>
>>  =C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version f=
or
>> SR1.0 HS-FS
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-fs-evm.bin"
>> +IMAGE_SR1_HS_FS_FILES =3D "tiboot3-j7200-hs-fs-evm.bin"
>> +IMAGE_SR1_HS_FS_FILES:bsp-mainline =3D ""
>> +IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_FS_FILES}"
>>
>>  =C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version f=
or
>> SR1.0 HS-SE
>> -IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-evm.bin"
>> +IMAGE_SR1_HS_SE_FILES =3D "tiboot3-j7200-hs-evm.bin"
>> +IMAGE_SR1_HS_SE_FILES:bsp-mainline =3D ""
>> +IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_SE_FILES}"
>>
>>  =C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version f=
or
>> SR2.0 HS-FS
>>  =C2=A0IMAGE_BOOT_FILES +=3D "tiboot3-j7200_sr2-hs-fs-evm.bin"
>>
>>
>> [1]:https://source.denx.de/u-boot/u-boot/-/blob/866ca972d6c3cabeaf6dba=
c431e8e08bb30b3c8e/arch/arm/dts/k3-j7200-binman.dtsi
> Thanks! Patches are welcome.
>
> It wasn't possible for me to test all platforms for all 4 supported "BS=
Ps" - I
> only focused on all Beagles and few EVMs, so some could have been misse=
d,
> especially for the "mainline" BSP.

Denys,

Yeah that makes sense... was only wondering if you'd want to send the=20
patch in the same series...
I see your v2 though... will send patches for other platforms for=20
Jacinto based on that.

Btw, I forgot to mention earlier but I like the rework being done in the=20
patch!

Thanks,
Aniket

>
>
>>>   meta-ti-bsp/conf/machine/include/j721e.inc | 18 ++++++++++--------
>>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp=
/conf/machine/include/j721e.inc
>>> index a54c3f2f..62487aa9 100644
>>> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
>>> @@ -13,20 +13,22 @@ IMAGE_BOOT_FILES +=3D "tiboot3-j721e-gp-evm.bin"
>>>   IMAGE_BOOT_FILES +=3D "sysfw-j721e-gp-evm.itb"
>>>   # Since default on J721e is for GP, add a version for SR1.1 HS-FS
>>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin"
>>> -IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-fs-evm.itb"
>>> +IMAGE_SR1_1_HS_FS_FILES =3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin sysfw=
-j721e_sr1_1-hs-fs-evm.itb"
>>> +IMAGE_SR1_1_HS_FS_FILES:bsp-mainline =3D ""
>>> +IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_FS_FILES}"
>>>   # Since default on J721e is for GP, add a version for SR1.1 HS-SE
>>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-evm.bin"
>>> -IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-evm.itb"
>>> +IMAGE_SR1_1_HS_SE_FILES =3D "tiboot3-j721e_sr1_1-hs-evm.bin sysfw-j7=
21e_sr1_1-hs-evm.itb"
>>> +IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_SE_FILES}"
>>>   # Since default on J721e is for GP, add a version for SR2.0 HS-FS
>>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-fs-evm.bin"
>>> -IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-fs-evm.itb"
>>> +IMAGE_SR2_HS_FS_FILES =3D "tiboot3-j721e_sr2-hs-fs-evm.bin sysfw-j72=
1e_sr2-hs-fs-evm.itb"
>>> +IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_FS_FILES}"
>>>   # Since default on J721e is for GP, add a version for SR2.0 HS-SE
>>> -IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-evm.bin"
>>> -IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-evm.itb"
>>> +IMAGE_SR2_HS_SE_FILES =3D "tiboot3-j721e_sr2-hs-evm.bin sysfw-j721e_=
sr2-hs-evm.itb"
>>> +IMAGE_SR2_HS_SE_FILES:bsp-mainline =3D ""
>>> +IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_SE_FILES}"
>>>   TFA_BOARD =3D "generic"
>>> --=20
>>> 2.25.1
--------------Tqgj0UjyHyQ207Qqng6j3Diy
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 45HE222G022530

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 6/14/2024 10:08 PM, Denys
      Dmytriyenko wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240614163833.GY21287@denix.or=
g">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Jun 14, 2024 at 03:5=
0:14PM +0530, Aniket Limaye via lists.yoctoproject.org wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Hi Denys,

On 6/13/2024 10:52 PM, Denys Dmytriyenko wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">From: Denys Dmytriyenko =
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:denys@=E2=80=8Akonsulko=
.=E2=80=8Acom">&lt;denys@=E2=80=8Akonsulko.=E2=80=8Acom&gt;</a> Adjust
IMAGE_BOOT_FILES list as some BSPs do not support all combinations
of SR1.=E2=80=8A1, SR2.=E2=80=8A0, HS-FS and HS-SE variants. Signed-off-b=
y: Denys
Dmytriyenko <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:denys@=E2=80=
=8Akonsulko.=E2=80=8Acom">&lt;denys@=E2=80=8Akonsulko.=E2=80=8Acom&gt;</a=
> ---
meta-ti-bsp/conf/machine/include/j721e.=E2=80=8Ainc
ZjQcmQRYFpfptBannerStart
From: Denys Dmytriyenko <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:denys@konsulko.com">&lt;denys@konsulko.com&gt;</a>
Adjust IMAGE_BOOT_FILES list as some BSPs do not support all combinations
of SR1.1, SR2.0, HS-FS and HS-SE variants.

Signed-off-by: Denys Dmytriyenko<a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:denys@konsulko.com">&lt;denys@konsulko.com&gt;</a>
---
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Same change is needed for J7200 as well. At the current commit
pointed by u-boot-ti-mainline=C2=A0[1], j7200 only has support for below:
GP , SR2.0 HS-FS , SR2.0 HS-SE

Hence also suggest below for j7200.inc:

diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc
b/meta-ti-bsp/conf/machine/include/j7200.inc
index caa79876..2a11e3dd 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -5,10 +5,14 @@ SOC_FAMILY:append =3D ":j7200"
=C2=A0IMAGE_BOOT_FILES +=3D "tiboot3-j7200-gp-evm.bin"

=C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version for
SR1.0 HS-FS
-IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-fs-evm.bin"
+IMAGE_SR1_HS_FS_FILES =3D "tiboot3-j7200-hs-fs-evm.bin"
+IMAGE_SR1_HS_FS_FILES:bsp-mainline =3D ""
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_FS_FILES}"

=C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version for
SR1.0 HS-SE
-IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-evm.bin"
+IMAGE_SR1_HS_SE_FILES =3D "tiboot3-j7200-hs-evm.bin"
+IMAGE_SR1_HS_SE_FILES:bsp-mainline =3D ""
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_SE_FILES}"

=C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version for
SR2.0 HS-FS
=C2=A0IMAGE_BOOT_FILES +=3D "tiboot3-j7200_sr2-hs-fs-evm.bin"


[1]: <a class=3D"moz-txt-link-freetext" href=3D"https://source.denx.de/u-=
boot/u-boot/-/blob/866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e/arch/arm/dts/=
k3-j7200-binman.dtsi">https://source.denx.de/u-boot/u-boot/-/blob/866ca97=
2d6c3cabeaf6dbac431e8e08bb30b3c8e/arch/arm/dts/k3-j7200-binman.dtsi</a>
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Thanks! Patches are welcome.

It wasn't possible for me to test all platforms for all 4 supported "BSPs=
" - I=20
only focused on all Beagles and few EVMs, so some could have been missed,=
=20
especially for the "mainline" BSP.</pre>
    </blockquote>
    <p>Denys,</p>
    <p>Yeah that makes sense... was only wondering if you'd want to send
      the patch in the same series...<br>
      I see your v2 though... will send patches for other platforms for
      Jacinto based on that.</p>
    <p>Btw, I forgot to mention earlier but I like the rework being done
      in the patch!</p>
    <p>Thanks,<br>
      Aniket<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20240614163833.GY21287@denix.or=
g">
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D""> meta-ti-bsp/conf/machin=
e/include/j721e.inc | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index a54c3f2f..62487aa9 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -13,20 +13,22 @@ IMAGE_BOOT_FILES +=3D "tiboot3-j721e-gp-evm.bin"
 IMAGE_BOOT_FILES +=3D "sysfw-j721e-gp-evm.itb"
 # Since default on J721e is for GP, add a version for SR1.1 HS-FS
-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin"
-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-fs-evm.itb"
+IMAGE_SR1_1_HS_FS_FILES =3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin sysfw-j72=
1e_sr1_1-hs-fs-evm.itb"
+IMAGE_SR1_1_HS_FS_FILES:bsp-mainline =3D ""
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_FS_FILES}"
 # Since default on J721e is for GP, add a version for SR1.1 HS-SE
-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-evm.bin"
-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-evm.itb"
+IMAGE_SR1_1_HS_SE_FILES =3D "tiboot3-j721e_sr1_1-hs-evm.bin sysfw-j721e_=
sr1_1-hs-evm.itb"
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_SE_FILES}"
 # Since default on J721e is for GP, add a version for SR2.0 HS-FS
-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-fs-evm.bin"
-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-fs-evm.itb"
+IMAGE_SR2_HS_FS_FILES =3D "tiboot3-j721e_sr2-hs-fs-evm.bin sysfw-j721e_s=
r2-hs-fs-evm.itb"
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_FS_FILES}"
 # Since default on J721e is for GP, add a version for SR2.0 HS-SE
-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-evm.bin"
-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-evm.itb"
+IMAGE_SR2_HS_SE_FILES =3D "tiboot3-j721e_sr2-hs-evm.bin sysfw-j721e_sr2-=
hs-evm.itb"
+IMAGE_SR2_HS_SE_FILES:bsp-mainline =3D ""
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_SE_FILES}"
 TFA_BOARD =3D "generic"
--=20
2.25.1
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Tqgj0UjyHyQ207Qqng6j3Diy--


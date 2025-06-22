Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDE1C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 22:39:24 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.6931.1750631956361578463
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 15:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=mBAH9E7L;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55MMdFct1326184;
	Sun, 22 Jun 2025 17:39:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750631955;
	bh=49z369ATewp3uOduTj7F9MTHKtXkm330db2uh2iiVao=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mBAH9E7LbRhoag24yvVtkIrBXXGlWup31CNkWrJPgjOU6N67Q+SY7V9m1VdSs3wAq
	 YCWCbBNlbwJB+7VMOh1wuaBgmwFs4gnf8asKj9n0UE5uR2L9PCLin3ehfs055F4Cln
	 B3OJtl9td1fwEInSR0iQ906s5sFzTiV40/iZx+6I=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55MMdFUP197606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 22 Jun 2025 17:39:15 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 22
 Jun 2025 17:39:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 22 Jun 2025 17:39:15 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55MMdFjY2675083;
	Sun, 22 Jun 2025 17:39:15 -0500
Message-ID: <e6628237-3854-470a-b500-044cb1f32e10@ti.com>
Date: Sun, 22 Jun 2025 17:39:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH] meta-ti: layer.conf: add compatibility
 with the new whinlatter release
To: Hiago De Franco <hiagofranco@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>,
        Hiago De Franco
	<hiago.franco@toradex.com>
References: <20250622170731.11233-1-hiagofranco@gmail.com>
 <184B7922D7011456.5850@lists.yoctoproject.org>
 <8e688370-e889-4a49-9a15-1c24b6aa1335@ti.com>
 <20250622223737.vfasir2kwychfdis@hiagonb>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250622223737.vfasir2kwychfdis@hiagonb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 55MMdFct1326184
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 22 Jun 2025 22:39:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18668



On 6/22/2025 5:37 PM, Hiago De Franco wrote:
> On Sun, Jun 22, 2025 at 04:03:01PM -0500, Ryan Eatmon wrote:
>>
>> My bad.  I didn't see that you updated all three layers!  I need to re=
ad
>> closer.  I'll take a look at this patch right away and get it on maste=
r to
>> free up those builds.
>=20
> Thanks Ryan!
>=20
> Best Regards,
> Hiago


Unfortunately, it looks like the builds are now gated behind the S=20
variable change as well...  I don't think this is something that will=20
get resolved today.  I'll keep working on this tomorrow.


>>
>>
>> On 6/22/2025 4:01 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>
>>> Thank you for the patch.=C2=A0 There is a third layer in meta-ti that=
 is
>>> missing from this patch.=C2=A0 I'll send a more comprehensive version.
>>>
>>>
>>> On 6/22/2025 12:07 PM, Hiago De Franco via lists.yoctoproject.org wro=
te:
>>>> From: Hiago De Franco <hiago.franco@toradex.com>
>>>>
>>>> Update all layers with the new Yocto release, fixing the current bui=
ld
>>>> error:
>>>>
>>>> ERROR: Layer meta-ti-bsp is not compatible with the core layer which
>>>> only supports these series: whinlatter (layer is compatible with sty=
head
>>>> walnascar)
>>>>
>>>> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
>>>> ---
>>>>  =C2=A0 meta-beagle/conf/layer.conf=C2=A0=C2=A0=C2=A0 | 2 +-
>>>>  =C2=A0 meta-ti-bsp/conf/layer.conf=C2=A0=C2=A0=C2=A0 | 2 +-
>>>>  =C2=A0 meta-ti-extras/conf/layer.conf | 2 +-
>>>>  =C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.co=
nf
>>>> index b5d3eaaa770c..d036bb08b36a 100644
>>>> --- a/meta-beagle/conf/layer.conf
>>>> +++ b/meta-beagle/conf/layer.conf
>>>> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-beagle"
>>>>  =C2=A0 BBFILE_PATTERN_meta-beagle :=3D "^${LAYERDIR}/"
>>>>  =C2=A0 BBFILE_PRIORITY_meta-beagle =3D "6"
>>>> -LAYERSERIES_COMPAT_meta-beagle =3D "styhead walnascar"
>>>> +LAYERSERIES_COMPAT_meta-beagle =3D "walnascar whinlatter"
>>>>  =C2=A0 LAYERDEPENDS_meta-beagle =3D " \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-ti-bsp \
>>>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.co=
nf
>>>> index 6d2b0a9a14b0..481daf2cc997 100644
>>>> --- a/meta-ti-bsp/conf/layer.conf
>>>> +++ b/meta-ti-bsp/conf/layer.conf
>>>> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-bsp"
>>>>  =C2=A0 BBFILE_PATTERN_meta-ti-bsp :=3D "^${LAYERDIR}/"
>>>>  =C2=A0 BBFILE_PRIORITY_meta-ti-bsp =3D "6"
>>>> -LAYERSERIES_COMPAT_meta-ti-bsp =3D "styhead walnascar"
>>>> +LAYERSERIES_COMPAT_meta-ti-bsp =3D "walnascar whinlatter"
>>>>  =C2=A0 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>>>> diff --git a/meta-ti-extras/conf/layer.conf
>>>> b/meta-ti-extras/conf/layer.conf
>>>> index bd13967322fc..d340c414fc60 100644
>>>> --- a/meta-ti-extras/conf/layer.conf
>>>> +++ b/meta-ti-extras/conf/layer.conf
>>>> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-extras"
>>>>  =C2=A0 BBFILE_PATTERN_meta-ti-extras :=3D "^${LAYERDIR}/"
>>>>  =C2=A0 BBFILE_PRIORITY_meta-ti-extras =3D "6"
>>>> -LAYERSERIES_COMPAT_meta-ti-extras =3D "styhead walnascar"
>>>> +LAYERSERIES_COMPAT_meta-ti-extras =3D "walnascar whinlatter"
>>>>  =C2=A0 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>>>>
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#18665): https://lists.yoctoproject.org/g/meta-ti/=
message/18665
>>> Mute This Topic: https://lists.yoctoproject.org/mt/113774522/6551054
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@=
ti.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>
>> --=20
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


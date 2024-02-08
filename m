Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB48C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 10:09:36 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.14663.1707386970922366815
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 02:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=odFd7Q7o;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418A9TtE126869;
	Thu, 8 Feb 2024 04:09:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707386969;
	bh=oylBHMNKDdgVDbtnJbfoKM+LjzdBSrPuphkx9UCETjo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=odFd7Q7ox7wSgTaG0gmzLERbyMUKXZ1Ov56cmZA+q6/B01qSbjByg2wLpxNnzRpsO
	 t5X8uNd1zThuZYRgOT3u/c2ZiaHsAI95oihHUC3c7Pjw5xIjZxx0RQlEx5NNRVgEss
	 VB4ZiMdbY0+KNZe1yK6g21Z45Uzr0j2B2QtUUhWI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418A9TGD124918
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 04:09:29 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 04:09:29 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 04:09:29 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418A9PE5096068;
	Thu, 8 Feb 2024 04:09:26 -0600
Message-ID: <a2778449-6c21-4bd2-b667-9dc22ad15b21@ti.com>
Date: Thu, 8 Feb 2024 15:39:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone] [PATCH v2] meta-ti-bsp: Add
 bootsplash image file for AM62P
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denys@konsulko.com>
CC: <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        Gyan Gupta
	<g-gupta@ti.com>, Khasim <khasim@ti.com>
References: <20240203070525.1728676-1-devarsht@ti.com>
 <6c7d7efe-7816-48f1-808c-7f3e686de8a2@ti.com>
 <a7da287c-c38e-8171-bbcd-42158d42e68e@ti.com>
 <13511ef8-4953-409c-aa30-522a934f54d3@ti.com>
 <3ece8988-7e18-4e0a-adbb-9de0897578cf@ti.com>
 <17B183A9980B38E6.2925@lists.yoctoproject.org>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <17B183A9980B38E6.2925@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 418A9TtE126869
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Feb 2024 10:09:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17453


On 07/02/24 12:51, Chirag Shilwant via lists.yoctoproject.org wrote:
> On 06/02/24 03:=E2=80=8A20, Bajjuri, Praneeth wrote: > > > On 2/5/2024 =
10:=E2=80=8A06=20
> AM, Chirag Shilwant wrote: >> >> On 05/02/24 21:=E2=80=8A13, Devarsh Th=
akkar=20
> wrote: >>> >>> >>> On 05/02/24 20:=E2=80=8A44, Ryan Eatmon wrote:=E2=80=
=8A
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> On 06/02/24 03:20, Bajjuri, Praneeth wrote:
> >
> >
> > On 2/5/2024 10:06 AM, Chirag Shilwant wrote:
> >>
> >> On 05/02/24 21:13, Devarsh Thakkar wrote:
> >>>
> >>>
> >>> On 05/02/24 20:44, Ryan Eatmon wrote:
> >>>>
> >>>>
> >>>> On 2/3/2024 1:05 AM, Devarsh Thakkar wrote:
> >>>>> Add TI logo image as bootsplash image file for AM62P and install=20
> >>>>> it in
> >>>>> boot directory from where u-boot can read from and display during
> >>>>> boot-up time.
> >>>>
> >>>>
> >>>> Thank you for the rebase.=C2=A0 Was the config fragment that Chira=
g=20
> >>>> asked about ever sent to uboot to avoid an issue with the recipe i=
n=20
> >>>> the processor-sdk?
> >>>>
> >>>
> >>> Yes, I had submitted a patch to ti-u-boot.=20
> >
> > pulled the patch in -next branch.
> > https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=3Dti-u-boot-202=
3.04-next&id=3De7d2df2ecfb3591938087335d81ebf0498dc8ece=20
> >
> >
> >
>
> Thanks Praneeth.
>
>
> Hi Ryan,
>
> As the ti-u-boot config dependencies are pulled in next branches, we ca=
n
> go ahead and integrate this patch.
> I will send out a patch soon to update the am62pxx-evm.conf to include
> the config fragment which is needed
> for the tisdk-display-cluster wic image.


Well, we can handle this in processor sdk builds. So, no follow up patch=20
is needed on meta-ti to handle tisdk-display-cluster image.
We can go ahead & integrate this patch.

Thanks Chirag.


>
>
> > I have sent you the link
> >>> offline.
> >>>
> >>> Regards
> >>> Devarsh
> >>
> >>
> >> Thanks Devarsh for sending a v2. What's the status on the config=20
> >> fragment patch in ti-u-boot as well as upstream?
> >>
> >
> > Devarsh, can you comment on this one .
> >
> >
> >>
> >>>
> >>>>
> >>>>
> >>>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>
>
> Acked-by: Chirag Shilwant <c-shilwant@ti.com>
>
>
> >>>>>
> >>>>> ---
> >>>>> V2: Rebase to updated uboot recipes
> >>>>> ---
> >>>>> =C2=A0 meta-ti-bsp/conf/machine/include/am62pxx.inc |=C2=A0 3 +++
> >>>>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 10 ++++++++=
++
> >>>>> =C2=A0 2 files changed, 13 insertions(+)
> >>>>>
> >>>>> diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc=20
> >>>>> b/meta-ti-bsp/conf/machine/include/am62pxx.inc
> >>>>> index bac68253..38e35851 100644
> >>>>> --- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
> >>>>> +++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
> >>>>> @@ -17,3 +17,6 @@ OPTEEMACHINE =3D "k3-am62x"
> >>>>> =C2=A0 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
> >>>>> =C2=A0 SERIAL_CONSOLES =3D "115200;ttyS2"
> >>>>> +
> >>>>> +# Bitmap image tarball for early splashscreen
> >>>>> +IMAGE_BOOT_FILES +=3D "ti_logo_414x97_32bpp.bmp.gz"
> >>>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
> >>>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>>>> index 493c1c31..42ddf40f 100644
> >>>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>>>> @@ -341,4 +341,14 @@ do_deploy:append:am62xx() {
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/t=
i_logo_414x97_32bpp.bmp.gz=20
> >>>>> ${DEPLOYDIR}
> >>>>> =C2=A0 }
> >>>>> +do_install:append:am62pxx() {
> >>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/boot
> >>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x=
97_32bpp.bmp.gz=20
> >>>>> ${D}/boot
> >>>>> +}
> >>>>> +
> >>>>> +do_deploy:append:am62pxx() {
> >>>>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
> >>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x=
97_32bpp.bmp.gz=20
> >>>>> ${DEPLOYDIR}
> >>>>> +}
> >>>>> +
> >>>>> =C2=A0 TOOLCHAIN =3D "gcc"
> >>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17451): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17451__;!!G3vK!V6suywddREI9UgEzo-aB2xsT=
y8h2XljYIjm8Stf_B_vxWFGidif6toctt3P3Rde3zleaK0iPXf8TEEj4LPC6S_21q8-DC5ocj=
jqV$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/104135441/7030289__;!!G3vK!V6suywddREI9UgEzo-aB2xsTy8h2XljYIjm8St=
f_B_vxWFGidif6toctt3P3Rde3zleaK0iPXf8TEEj4LPC6S_21q8-DCwmdOIc_$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!V6suywddREI9UgEzo-aB2xsTy8h2XljYIjm8Stf_B_vxWFG=
idif6toctt3P3Rde3zleaK0iPXf8TEEj4LPC6S_21q8-DC_OPa7UF$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


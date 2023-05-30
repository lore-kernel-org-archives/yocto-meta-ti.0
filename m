Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC44C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 20:35:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.5017.1685478945636636644
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 13:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=KRfRxkpC;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UKZdiM041374;
	Tue, 30 May 2023 15:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685478940;
	bh=O6jhzTVszJF7bD8nWnW6Cq5Ba0o3UEH0eaPHcdF8z9E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KRfRxkpCOTIai9N13YZFaZvUBtNmn5McQFReTLGyW+7p36hIUnNLk14mX4MYUCbVc
	 iZQ+6qdKqhWOi60Q2xQkFgsvepnasFYUl0PWTHiX9SU3Cv/fhcPmwLjyUfRo3nmQBB
	 TajJD+FCAezzlWQOpjozTgys9vE0sHjHJcic9yes=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UKZdbI125997
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 15:35:39 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 15:35:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 15:35:39 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UKZdgP016714;
	Tue, 30 May 2023 15:35:39 -0500
Message-ID: <8096b5dc-d802-3850-f52c-5989cefdbb6c@ti.com>
Date: Tue, 30 May 2023 15:35:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-ti] [master/kirkstone][PATCH 1/2] u-boot-ti: do_compile
 depends on the value of UBOOT_LOCALVERSION
To: Ming Liu <liu.ming50@gmail.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
References: <17635F3EC543510A.6918@lists.yoctoproject.org>
 <20230530191708.GI9226@denix.org>
 <CALatG=7VEXBBBq2_B8zQU5WG35tYfB4kDeykspC7CBE3NWc1=Q@mail.gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CALatG=7VEXBBBq2_B8zQU5WG35tYfB4kDeykspC7CBE3NWc1=Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 34UKZdiM041374
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 20:35:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16638


Denys has been pursuing a better upstream fix in the same vein as the=20
commit that caused this breakage.  He has verified that the change that=20
Richard wants also fixes the breakage, I think he just has to put=20
together the new patch and send it in.


On 5/30/2023 3:20 PM, Ming Liu wrote:
> Hi, Denys/Ryan:
>=20
> If we go with this fix, a similar fix for kernel recipe is also needed.=
=20
> Has somebody done that?
>=20
> the best,
> thank you
>=20
> Denys Dmytriyenko <denis@denix.org <mailto:denis@denix.org>> =E6=96=BC =
2023=E5=B9=B45=20
> =E6=9C=8830=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:17=E5=AF=AB=
=E9=81=93=EF=BC=9A
>=20
>     Scratch these - Richard suggested a different fix.
>=20
>=20
>     On Sun, May 28, 2023 at 05:36:41PM +0000, Denys Dmytriyenko wrote:
>      > From: Denys Dmytriyenko <denys@konsulko.com
>     <mailto:denys@konsulko.com>>
>      >
>      > Explicitly mark do_compile as depending on the value of
>     UBOOT_LOCALVERSION
>      > variable. Similar patch was submitted to OE-Core for upstream
>     version of
>      > u-boot recipe:
>      >
>     https://patchwork.yoctoproject.org/project/oe-core/patch/2023052817=
1515.832179-1-denis@denix.org/ <https://patchwork.yoctoproject.org/projec=
t/oe-core/patch/20230528171515.832179-1-denis@denix.org/>
>      >
>      > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com
>     <mailto:denys@konsulko.com>>
>      > ---
>      >=C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 1 +
>      >=C2=A0 1 file changed, 1 insertion(+)
>      >
>      > diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>     b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>      > index 135f443b..4e645e4f 100644
>      > --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>      > +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>      > @@ -1,6 +1,7 @@
>      >=C2=A0 # UBOOT_LOCALVERSION can be set to add a tag to the end of=
 the
>      >=C2=A0 # U-boot version string.=C2=A0 such as the commit id
>      >=C2=A0 UBOOT_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
>     True).replace('AUTOINC+','')[:10]}"
>      > +do_compile[vardepvalue] =3D "${UBOOT_LOCALVERSION}"
>      >
>      >=C2=A0 UBOOT_SUFFIX ?=3D "img"
>      >=C2=A0 SPL_BINARY ?=3D "MLO"
>      > --
>      > 2.25.1
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16637): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/16637
> Mute This Topic: https://lists.yoctoproject.org/mt/99185909/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


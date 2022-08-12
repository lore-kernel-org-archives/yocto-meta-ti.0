Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14535C25B06
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 01:47:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6015.1660268859630417561
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 18:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=WKB5NF06;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27C1lbwD055772;
	Thu, 11 Aug 2022 20:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660268857;
	bh=LxDAdFRw8+cARtmz80hSoYqGFs6vVJIh9WgKoE0WP5w=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=WKB5NF06aJH9UkA45V5SMFXM8n+CtZkLq7wXsj6ucHAoulT1YPOefmNN0qYgo1fA3
	 zPBYdzHMVczFicTJWlf9xPbukzdf18zK9wb3ac3b798C8rpEYHtRc3e3soKB4SgNGh
	 wqBwYJfCfr6vdP6P8Mi3Fya8BiXwBjgFFbX+But4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27C1lbNA032084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Aug 2022 20:47:37 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 11
 Aug 2022 20:47:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 11 Aug 2022 20:47:37 -0500
Received: from [10.250.34.173] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27C1laIR029118;
	Thu, 11 Aug 2022 20:47:37 -0500
Message-ID: <cbc98695-ff23-3445-dae4-f9c2cd736fc5@ti.com>
Date: Thu, 11 Aug 2022 20:47:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti][dunfell][PATCH 1/2] ti-sci-fw: Allow build to continue
 without TI_SECURE_DEV_PKG set
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220810144708.14171-1-afd@ti.com>
 <5db16498-fbc2-8056-50f5-f3cf44150f84@ti.com>
In-Reply-To: <5db16498-fbc2-8056-50f5-f3cf44150f84@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id
 27C1lbwD055772
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Aug 2022 01:47:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14957

On 8/10/22 11:25 AM, Andrew Davis wrote:
> Denys, Ryan,
>=20
> I'm not really happy with this patch to be honest. Nor with how we hand=
le
> TI_SECURE_DEV_PKG in general.
>=20
> So a little history (Denys correct me if my memory has faded any here).=
 We
> use TI_SECURE_DEV_PKG for legacy platforms as the SECDEV tools are NDA-=
only,
> so they *had* to be feed into the SDK from an external location. This
> carried over to the K3 machines.
>=20
> But with K3 we don't have this NDA-only restriction. The K3 TI_SECURE_D=
EV_PKG
> tools are fully open source and publicly available on git.ti.com. Now t=
hat
> we are bringing HS to the board market with AM64x, it is time we fix th=
ings.
>=20
> My idea is to treat TI_SECURE_DEV_PKG like the other toolchains. If we =
define
> it in our environment then we use that version. If it is not defined th=
en we
> fetch it for the user. I've got a simple recipe to build a tik3secdev-n=
ative
> package, and am working to use that everywhere we use TI_SECURE_DEV_PKG=
 in
> recipes today. Then we can use preferred providers to pick which SECDEV
> to use, the legacy ones, or the K3 one.
>=20
> The legacy tisecdev-native will require TI_SECURE_DEV_PKG_CAT/AUTO set
> as required today, but the tik3secdev-native will download it for you
> if not set.
>=20
> So my questions are, does this sound like a reasonable approach, and if=
 so
> do you have any guidance on this? This will require me to dig down into
> the deeper parts of the build system and I've not done that before. Any
> pointers welcome.
>=20
> I'm also thinking on making a dummy secdev package, that just copies
> the images instead of signing them. That should be the default preferre=
d
> provider for the non-HS machines, then we can drop the various checks w=
e
> have based -hs-evm vs -evm. All machines take the same path, then based
> on the secdev package provider they do the right thing.
>=20
> Thanks,
> Andrew
>=20

Okay, gave this a quick attempt, see

https://lore.kernel.org/yocto-meta-ti/20220812014128.1185-1-afd@ti.com/

and for its use

https://lore.kernel.org/yocto-meta-ti/20220812014128.1185-2-afd@ti.com/

If we like it, we can start to add for the non-K3 machines and drop
a bunch of machine specific checks. Move them all to a single preferred
provider set in the top level machine configs, instead of out in the
recipes.

Andrew

> On 8/10/22 9:47 AM, Andrew Davis wrote:
>> If we do not have TI_SECURE_DEV_PKG set then SYSFW generation will fai=
l
>> if we are building for the HS platform. When TI_SECURE_DEV_PKG is not
>> set we assume the builder is only interested in the GP boards, so fake
>> generating the HS SYSFW images. These will be non-functional on HS
>> boards, but they would have been just as non-functional if built
>> without TI_SECURE_DEV_PKG set.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 5 +++++
>> =C2=A0 1 file changed, 5 insertions(+)
>>
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-s=
ci-fw/ti-sci-fw_git.bb
>> index 18652dd4..287e5a40 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -66,6 +66,11 @@ EXTRA_OEMAKE_remove_j7-hs-evm-k3r5 =3D " SBL=3D"${S=
TAGING_DIR_HOST}/boot/u-boot-spl.
>> =C2=A0 EXTRA_OEMAKE_remove_j7-hs-evm-k3r5-sr1-1 =3D " SBL=3D"${STAGING=
_DIR_HOST}/boot/u-boot-spl.bin""
>> =C2=A0 do_compile() {
>> +=C2=A0=C2=A0=C2=A0 if [ ! "${SYSFW_SUFFIX}" =3D "gp" ] && [ ! -f ${TI=
_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "Warning: TI_SECURE_D=
EV_PKG not set, skipping HS SYSFW generation."
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 touch ${WORKDIR}/imggen/${=
SYSFW_TIBOOT3}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit 0
>> +=C2=A0=C2=A0=C2=A0 fi
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd ${WORKDIR}/imggen/
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake
>> =C2=A0 }


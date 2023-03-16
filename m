Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3EAC6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 16:28:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.16998.1678984129553611116
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Mar 2023 09:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=O3UyweYr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32GGSm8x076174;
	Thu, 16 Mar 2023 11:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678984128;
	bh=ErMOWerK/+ir8pV/bU9l9qMaHnDbgjFQWFMys3+YDe4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=O3UyweYrLZCTbkEjayC9Auv9lUYGhtt870QHlvvQxKXz2DlGXGJsi+dQytSjQO74q
	 dTDhHPIlOnXvI/bAOQSyHqT5A/mNxjfpzYe0GoAfS4nfB/hC/hFBpzywS1mzRyuHo+
	 nHXucBkD6u502uuT8ul5x0629SZWQSSUmcpq6rUE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32GGSmjn012220
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Mar 2023 11:28:48 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 16
 Mar 2023 11:28:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 16 Mar 2023 11:28:48 -0500
Received: from [10.249.35.0] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32GGSmPE120906;
	Thu, 16 Mar 2023 11:28:48 -0500
Message-ID: <c77d1089-21ee-7054-7a5f-ee9934828d39@ti.com>
Date: Thu, 16 Mar 2023 11:28:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-ti] [kirkstone] mesa compilation failures when setting
 PREFERRED_PROVIDER for virtual/gpudriver = "ti-sgx-ddk-km"
Content-Language: en-US
To: <danny@sizethreestudios.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>,
        Randolph Sapp <rs@ti.com>
References: <mail.64133faf.3771.17352b0439bf0805@storage.wm.amazon.com>
 <01000186eb30c93b-a7c4db25-4de8-4324-a052-ad225c14fdc9-000000@email.amazonses.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <01000186eb30c93b-a7c4db25-4de8-4324-a052-ad225c14fdc9-000000@email.amazonses.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 32GGSm8x076174
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Mar 2023 16:28:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15989


The idea behind that patch series is to rework how we incorporate the=20
GPU drivers with the various software pacakges.  So, yes, that will be=20
how you will include the SGX stuff.

But...  There was another patch that rolled back the SGX support to just=20
software rendering because we have not had the time to complete the work=20
on fxiing the SGX drivers to work with the new integration methodology.

So what you are trying to do, will not currently work in=20
kirkstone/master until we finish the work to update the SGX code.

The only real option if you require the SGX GPU to work is to fallback=20
to dunfell.


On 3/16/2023 11:11, Danny Hadley via lists.yoctoproject.org wrote:
> Hi all! I am trying to make sure my opengl-backed GUI application is=20
> leveraging the most optimal graphics drivers on the beaglebone black=20
> device and am running into yocto build failures.
>=20
> Based on what I can tell from the changes in=20
> 56be461=C2=A0(https://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp/r=
ecipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb?h=3Dkirkstone&id=3D=
56be4618abdde45649f0f92d383d5f44e5ec6efb), <https://git.yoctoproject.org/=
meta-ti/commit/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.49=
48957.bb?h=3Dkirkstone&id=3D56be4618abdde45649f0f92d383d5f44e5ec6efb),>=C2=
=A0I should be able to have mesa compiled using the drivers provided from=
 the `ti-sgx-ddk-km` recipe by setting my preferred provider for the `vir=
tual/gpudriver` as such:
>=20
> ```
>=20
> PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-sgx-ddk-km"
>=20
> ```
>=20
> I'm not sure if this is the correct way to go about what I am trying to=
=20
> do, or if it is even necessary to ensure my application is using=20
> the=C2=A0best hardware it can (which is ultimately the goal). Either wa=
y,=20
> with the variable mentioned above set to `ti-sgx-ddk-km`, the=20
> mesa.do_compile step fails with what I believe are linker errors. This=20
> is an example of what I am seeing in my logs:
>=20
> ```
>=20
> /<my-path-to-yocto>/tmp/work/beaglebone-poky-linux-gnueabi/mesa/2_22.0.=
3+pvr-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libex=
ec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/11.3.0/ld: src/galli=
um/frontends/sgx/libsgx.a.p/pvrdri.c.o: in function `PVRDRIReleaseBuffer'=
:
> 2023-03-15T19:19:43.7831698Z |=20
> /usr/src/debug/mesa/2_22.0.3+pvr-r0/build/../git/src/gallium/frontends/=
sgx/pvrdri.c:1055: undefined reference to `PVRDRIBufferDestroy'
> 2023-03-15T19:19:43.7832402Z |=20
> /<my-path-to-yocto>/tmp/work/beaglebone-poky-linux-gnueabi/mesa/2_22.0.=
3+pvr-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libex=
ec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/11.3.0/ld: src/galli=
um/frontends/sgx/libsgx.a.p/pvrdri.c.o: in function `PVRDRIAllocateBuffer=
':
> 2023-03-15T19:19:43.7833062Z |=20
> /usr/src/debug/mesa/2_22.0.3+pvr-r0/build/../git/src/gallium/frontends/=
sgx/pvrdri.c:1027: undefined reference to `PVRDRIBufferCreate'
> 2023-03-15T19:19:43.7833813Z |=20
> /<my-path-to-yocto>/tmp/work/beaglebone-poky-linux-gnueabi/mesa/2_22.0.=
3+pvr-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libex=
ec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/11.3.0/ld: /usr/src/=
debug/mesa/2_22.0.3+pvr-r0/build/../git/src/gallium/frontends/sgx/pvrdri.=
c:1037: undefined reference to `PVRDRIBufferGetName'
>=20
> ```
>=20
> The full(-ish, I might be missing some) list of these missing functions=
 is:
>=20
> -=C2=A0PVREGLDrawableDestroy
> -=C2=A0PVREGLDrawableCreate
>=20
> -=C2=A0PVRDRIPixFmtGetBlockSize
>=20
> -=C2=A0PVRDRIEGLMarkRendersurfaceInvalid
>=20
> -=C2=A0PVREGLDrawableRecreate
>=20
> -=C2=A0PVRDRIBufferDestroy
>=20
> -=C2=A0PVRDRIGetAPIFunc
>=20
> -=C2=A0PVRDRIEGLGetLibHandle
>=20
> -=C2=A0PVRDRIDepthStencilBitArraySize
>=20
> -=C2=A0PVRDRIMSAABitArraySize
>=20
> -=C2=A0PVRDRIDepthBitsArray
>=20
> -=C2=A0PVRDRIEGLImageCreate
>=20
> -=C2=A0PVRDRIMesaFormatSupported
>=20
> -=C2=A0PVRDRIMaxPBufferWidth
>=20
> -=C2=A0PVRDRIMaxPBufferHeight
>=20
> -=C2=A0PVRDRIBufferCreateFromNames
>=20
> -=C2=A0PVRDRIEGLImageCreateFromBuffer
>=20
> -=C2=A0PVRDRIEGLFlushBuffers
>=20
> -=C2=A0PVRDRIBufferCreate
>=20
> -=C2=A0PVRDRICreateDrawableImpl
>=20
> -=C2=A0PVRDRIMakeCurrentGC
>=20
> -=C2=A0PVRDRIGetDeviceTypeFromFd
>=20
> -=C2=A0PVRDRIEGLImageGetAttribs
>=20
> -=C2=A0PVRDRI2ReleaseTexImage
>=20
> I'm a bit out of my element here, but it looks like I might be missing=20
> some dynamically linked library=C2=A0that provides functions like=20
> PVRDRIBufferGetName=C2=A0which gallium depends on? It seems likely I am=
=20
> missing a recipe or configuration value, but I'm not sure where to look.
>=20
> Any help here would be appreciated. I'd be happy to provide more logs=20
> and/or configuration information as necessary.
>=20
> Thanks!
>=20
> - Danny
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15988): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/15988
> Mute This Topic: https://lists.yoctoproject.org/mt/97653905/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


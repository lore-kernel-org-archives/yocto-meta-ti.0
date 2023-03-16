Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50301C7618B
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 16:35:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.17151.1678984521758867983
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Mar 2023 09:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B974640C21;
	Thu, 16 Mar 2023 16:35:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXlRhMUSGLcS; Thu, 16 Mar 2023 16:35:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8314D400CF;
	Thu, 16 Mar 2023 16:35:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E53541637C4; Thu, 16 Mar 2023 12:34:45 -0400 (EDT)
Date: Thu, 16 Mar 2023 12:34:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: danny@sizethreestudios.com,
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
	Randolph Sapp <rs@ti.com>
Subject: Re: [meta-ti] [kirkstone] mesa compilation failures when setting
 PREFERRED_PROVIDER for virtual/gpudriver = "ti-sgx-ddk-km"
Message-ID: <20230316163445.GC18050@denix.org>
References: <mail.64133faf.3771.17352b0439bf0805@storage.wm.amazon.com>
 <01000186eb30c93b-a7c4db25-4de8-4324-a052-ad225c14fdc9-000000@email.amazonses.com>
 <c77d1089-21ee-7054-7a5f-ee9934828d39@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c77d1089-21ee-7054-7a5f-ee9934828d39@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Mar 2023 16:35:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15990

On Thu, Mar 16, 2023 at 11:28:47AM -0500, Ryan Eatmon via lists.yoctoproj=
ect.org wrote:
>=20
> The idea behind that patch series is to rework how we incorporate
> the GPU drivers with the various software pacakges.  So, yes, that
> will be how you will include the SGX stuff.
>=20
> But...  There was another patch that rolled back the SGX support to
> just software rendering because we have not had the time to complete
> the work on fxiing the SGX drivers to work with the new integration
> methodology.

https://git.yoctoproject.org/meta-ti/commit/?id=3Dd859c8c0916c8eb4b88ca8e=
0db7f9e5a846ba869


> So what you are trying to do, will not currently work in
> kirkstone/master until we finish the work to update the SGX code.
>=20
> The only real option if you require the SGX GPU to work is to
> fallback to dunfell.
>=20
>=20
> On 3/16/2023 11:11, Danny Hadley via lists.yoctoproject.org wrote:
> >Hi all! I am trying to make sure my opengl-backed GUI application
> >is leveraging the most optimal graphics drivers on the beaglebone
> >black device and am running into yocto build failures.
> >
> >Based on what I can tell from the changes in 56be461=A0(https://git.yo=
ctoproject.org/meta-ti/commit/meta-ti-bsp/recipes-graphics/libgles/ti-sgx=
-ddk-um_1.17.4948957.bb?h=3Dkirkstone&id=3D56be4618abdde45649f0f92d383d5f=
44e5ec6efb), <https://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp/rec=
ipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb?h=3Dkirkstone&id=3D56=
be4618abdde45649f0f92d383d5f44e5ec6efb),>=A0I
> >should be able to have mesa compiled using the drivers provided
> >from the `ti-sgx-ddk-km` recipe by setting my preferred provider
> >for the `virtual/gpudriver` as such:
> >
> >```
> >
> >PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-sgx-ddk-km"
> >
> >```
> >
> >I'm not sure if this is the correct way to go about what I am
> >trying to do, or if it is even necessary to ensure my application
> >is using the=A0best hardware it can (which is ultimately the goal).
> >Either way, with the variable mentioned above set to
> >`ti-sgx-ddk-km`, the mesa.do_compile step fails with what I
> >believe are linker errors. This is an example of what I am seeing
> >in my logs:
> >
> >```
> >
> >/<my-path-to-yocto>/tmp/work/beaglebone-poky-linux-gnueabi/mesa/2_22.0=
.3+pvr-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libe=
xec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/11.3.0/ld: src/gall=
ium/frontends/sgx/libsgx.a.p/pvrdri.c.o: in function `PVRDRIReleaseBuffer=
':
> >2023-03-15T19:19:43.7831698Z | /usr/src/debug/mesa/2_22.0.3+pvr-r0/bui=
ld/../git/src/gallium/frontends/sgx/pvrdri.c:1055:
> >undefined reference to `PVRDRIBufferDestroy'
> >2023-03-15T19:19:43.7832402Z | /<my-path-to-yocto>/tmp/work/beaglebone=
-poky-linux-gnueabi/mesa/2_22.0.3+pvr-r0/recipe-sysroot-native/usr/bin/ar=
m-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-li=
nux-gnueabi/11.3.0/ld:
> >src/gallium/frontends/sgx/libsgx.a.p/pvrdri.c.o: in function
> >`PVRDRIAllocateBuffer':
> >2023-03-15T19:19:43.7833062Z | /usr/src/debug/mesa/2_22.0.3+pvr-r0/bui=
ld/../git/src/gallium/frontends/sgx/pvrdri.c:1027:
> >undefined reference to `PVRDRIBufferCreate'
> >2023-03-15T19:19:43.7833813Z | /<my-path-to-yocto>/tmp/work/beaglebone=
-poky-linux-gnueabi/mesa/2_22.0.3+pvr-r0/recipe-sysroot-native/usr/bin/ar=
m-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-li=
nux-gnueabi/11.3.0/ld: /usr/src/debug/mesa/2_22.0.3+pvr-r0/build/../git/s=
rc/gallium/frontends/sgx/pvrdri.c:1037:
> >undefined reference to `PVRDRIBufferGetName'


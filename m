Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.678.1589825029848212176
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 May 2020 11:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=ApvBuM00;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04II3m23032895;
	Mon, 18 May 2020 13:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589825028;
	bh=cJAmjcYaBwkXvDSKY8sLnO4gcR9NT40tPrfbuM49ElM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ApvBuM00eI9QJmEuC2P7t+UMeFiYSV0DvQL/LmNZjoEcgD1vFau6sgnCAucU0J/6B
	 crniJgTY8Xoy8duafayuuT9uEOTgDmqJujvKIiOyoq4knyDUFFk7q8M9VG+c23w1pa
	 +rV2ydGv797rdwLN0CS9ixQ4Gg03IpEYc7URJyfg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04II3m9T063161
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 May 2020 13:03:48 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 18
 May 2020 13:03:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 18 May 2020 13:03:48 -0500
Received: from [10.250.38.163] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04II3lre118868;
	Mon, 18 May 2020 13:03:48 -0500
Subject: Re: [meta-ti] Build core-image-weston for beaglebone/am335x with GPU SGX530 enabled
To: Luca <magnabosco.luca@gmail.com>, <meta-ti@lists.yoctoproject.org>
References: <zrPI.1589209669954801158.UpYg@lists.yoctoproject.org>
 <23459.1589750559600576112@lists.yoctoproject.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <f734db2d-fd0b-cab1-9d37-54c3c3b49b70@ti.com>
Date: Mon, 18 May 2020 14:03:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <23459.1589750559600576112@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 04II3m23032895
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 5/17/20 5:22 PM, Luca wrote:
> Probably the topic was too broad,
>=20
> I think I got a partial solution and here you have a partial reply:
>=20
> To my understanding, when using OpenGL and EGL there are two common
> scenarios:
>=20
>  1. The provider for both GL and EGL is mesa: that works fine in our cas=
e
>  2. The provider for GL is mesa (specifically mesa-gl) and the provider
>     for EGL is a GPU user space module (in our case=C2=A0/ti-sgx-ddk-um)=
:
>     /that at the moment is giving some bitbake errors due to a conflict.
>     Indeed both mesa-gl and ti-sgx-ddk-um provide the header
>     khrplatform.h and the library libglapi
>=20
> Since my goal is to use the GPU provided by the am335x SOC I have to
> focus on the second one.
>=20
> To setup the second scenario in a .conf file we have to set://
> //
>=20
> IMAGE_INSTALL_append =3D " ti-sgx-ddk-km ti-sgx-ddk-um libdrm"
> PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
> PREFERRED_PROVIDER_virtual/libgles1=3D "ti-sgx-ddk-um"
> PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"
> PREFERRED_PROVIDER_virtual/libgl =3D "mesa-gl"
> PREFERRED_PROVIDER_virtual/mesa =3D "mesa-gl"
> PREFERRED_PROVIDER_libgbm =3D "libgbm"
> PREFERRED_PROVIDER_libgbm-dev =3D "libgbm-dev"


libgbm is a virtual as it has multiple optional providers, one of which
is ti-sgx-ddk-um, our standalone libgbm has been deprecated, use the one
provided by ti-sgx-ddk-um:

PREFERRED_PROVIDER_virtual/libgbm =3D "ti-sgx-ddk-um"

Also it can be argued virtual/mesa should *not* be a virtual as there is
only one provider: Mesa. No one should depend on 'mesa' either, what
programs really want is one of the API/libraries provided by the mesa
software package (GL, GLES1, GLES2, GLX, etc.) and they should DEPENDS
on those specifically by name, so they can be provided by the
appropriate providing software package for the given system as defined
by PREFERRED_PROVIDER.

I have been working slowly to remove all references to virtual/mesa
upstream in OE, and replace them with the exact needed API/lib.


> =C2=A0
> Moreover,=C2=A0since TI provides its own version of libgbm, in a
> mesa-gl_%.bbappend we set
>=20
> PACKAGES_remove =3D "libgbm"
> PACKAGES_remove =3D "libgbm-dev"
> EXTRA_OECONF_remove =3D "--enable-gbm"
> /
> (Reference=C2=A0Automotive Grade Linux
> <https://gerrit.automotivelinux.org/gerrit/gitweb?p=3DAGL/meta-agl.git;a=
=
=3Dblob;f=3Dmeta-agl-bsp/meta-ti/recipes-graphics/mesa/mesa-gl_%25.bbappen=
d;h=3Da5a69513ab927aa054d358aa699845fc435012a6;hb=3DHEAD)>)
> /
> This way the "providers should be set up properly" but unfortunately
> (depending on the=C2=A0openembedded-core we are using) we could get the =
error:
> "file /usr/include/KHR/khrplatform.h is installed by
> both=C2=A0ti-sgx-ddk-um=C2=A0and mesa-gl, aborting"
>=20
> This seems to be caused by mesa commit=C2=A087c156183
> <https://lists.yoctoproject.org/g/meta-ti/topic/build_core_image_weston_=
for/87c1561>=C2=A0that
> installs the header=C2=A0khrplatform.h even when mesa should provide onl=
y opengl.
> In other BSP layers the issue has been fixed preventing the GPU module
> to install the header (See=C2=A0meta-xilinx
> <https://www.yoctoproject.org/pipermail/meta-xilinx/2019-November/004555=
.html>).
> I don't know if it is the proper solution, but I tried to implement it
> and I patched the Makefile in omap5-sgx-ddk-um-linux, results:
> - The error related to=C2=A0khrplatform.h is gone
> - I get another similar error about libglapi.so being installed by
> both=C2=A0ti-sgx-ddk-um=C2=A0and mesa-gl. Should I disable its installat=
ion too?
> Not sure...
>=20
> Any suggestion?
>=20


This is actually a bit complicated right now, you cannot use both
ti-sgx-ddk-um and mesa-gl together, as you have found out they provide
many of the same things and overlap in function.

EGL provides window system (x11, wayland, gbm, surfaceless) integration
for both GL and GLES (and OpenVG), but our EGL implementation only
supports GLES, as that is all our GPUs support (at least on AM335x).
Full desktop GL would have to be done using SW rendering, which is
probably not what you want.

The idea behind 'mesa-gl' was to allow this SW rendering for OpenGL
without interfering with the real HW GLES-only stack. I'm not convinced
this ever really worked with EGL.. (maybe GLX+libgl.so but not sure)

The EGL implementation, plus things like libglapi.so, and all the API
headers are common to both GL and GLES, so they just don't mix well when
provided by two different stacks. It is hard to make a well defined
separation point that would still allow runtime selection.

So my question back is then, why are you trying to pull in 'mesa' and/or
'mesa-gl'? Weston works fine with the stack we provide in ti-sgx-ddk-um.

Andrew


> Regards
> Luca
>=20
>=20
>=20

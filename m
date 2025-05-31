Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CEDC5AE59
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 17:18:57 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.11017.1748711934544718339
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 31 May 2025 10:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ncjesK0+;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: v-singh1@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54VHIpMc2907630;
	Sat, 31 May 2025 12:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748711931;
	bh=Zv7aloCzQ9IP1PxTAiuDGKBy1bSjUFH//tUfHA3B+cc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ncjesK0+NysDO3HuCAMmXa8Kbs/sMq9a4d+Z9XnWX+caX2BSTSrse2cSsAZ+mz8jb
	 4I/mC3Hb7UFRlUp8+UG3oPMdwxtAb68u/zzXHy4zcWSRqabbBwSm6tkyVU1II89mPU
	 bYjncws9bo+P4z4Ih5rQeds1vcRfoNCAMUM3x5+I=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54VHIocm1612807
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 31 May 2025 12:18:51 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 31
 May 2025 12:18:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 31 May 2025 12:18:50 -0500
Received: from [172.24.227.153] (uda0513920.dhcp.ti.com [172.24.227.153])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54VHIlrn474771;
	Sat, 31 May 2025 12:18:48 -0500
Message-ID: <bff4539b-fd09-408c-b78e-0373f09e705b@ti.com>
Date: Sat, 31 May 2025 22:48:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [PATCH V3] Add rpmsg DMA library and simple DSP offload
 example
To: Andrew Davis <afd@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <reatmon@ti.com>, <denis@denix.org>
CC: <praneeth@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
References: <20250530070151.537124-1-v-singh1@ti.com>
 <48a818e0-300f-4050-bd13-a5e9f38d2f7e@ti.com>
Content-Language: en-US
From: Vishnu Singh <v-singh1@ti.com>
In-Reply-To: <48a818e0-300f-4050-bd13-a5e9f38d2f7e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 54VHIpMc2907630
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 31 May 2025 17:18:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18619


On 31/05/25 01:42, Andrew Davis wrote:
> On 5/30/25 2:01 AM, Vishnu Singh via lists.yoctoproject.org wrote:
>> From: Vishnu Singh <v-singh1@ti.com>
>>
>> 1. rpmsg DMA library (meta-ti-bsp/recipes-ti/ipc):
>> =C2=A0=C2=A0=C2=A0=C2=A0based on rpmsg & DMA Heap buffers. this includ=
es librpmsg_dma.so=20
>> shared library
>> =C2=A0=C2=A0=C2=A0=C2=A0which provides apis for
>
> API should be capitalized. Same for DMA, Linux, and the first letter=20
> of sentences..
>
All will be=C2=A0 corrected=C2=A0 in next vesrion
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1. rpmsg interface initiali=
zation
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2. rpmsg based recv/send ap=
i for communication
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3. dma heap buffer manageme=
nt
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4. DSP firmware synamin loa=
d/unload
>
> synamin?
dynamic,=C2=A0 wil correct in next version
>
>>
>> 2. rpmsg DMA offload example (meta-ti-extras/recipes-ti/ipc):
>> =C2=A0=C2=A0=C2=A0=C2=A0provides example foraudio offloading to DSP fr=
om linux using
>> =C2=A0=C2=A0=C2=A0=C2=A0ti-rpmsg-dma library. Alsove provide Ethernet =
based control
>
> Alsove? Please run spell check.
>
ok
>> =C2=A0=C2=A0=C2=A0=C2=A0utility (host).
>>
>> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
>> ---
>> =C2=A0 .../recipes-ti/ipc/ti-librpmsg-dma_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=
 | 25 +++++++++++++++++
>> =C2=A0 .../ipc/ti-librpmsg-dma-example_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 27 +++++++++++++++++++
>> =C2=A0 2 files changed, 52 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1=
.0.bb
>> =C2=A0 create mode 100644=20
>> meta-ti-extras/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
>>
>> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb=20
>> b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>> new file mode 100644
>> index 00000000..0461ac46
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY =3D "RPMsg DMA shared library"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D744e63d2bb8c6151dcdd97f49aa02c53"
>> +
>> +SRC_URI =3D=20
>> "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dhttps;bran=
ch=3Dmain"
>> +SRCREV =3D "cd18ced927aa2b916708d611758caab25a795feb"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +DEPENDS =3D "ti-rpmsg-char"
>> +
>> +EXTRA_OEMAKE =3D "lib"
>> +do_compile() {
>> +=C2=A0=C2=A0=C2=A0 oe_runmake ${EXTRA_OEMAKE}
>> +}
>> +
>> +do_install() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}
>> +=C2=A0=C2=A0=C2=A0 install -m 0755 lib/librpmsg_dma.so.1.0 ${D}${libd=
ir}/
>> +=C2=A0=C2=A0=C2=A0 ln -sf librpmsg_dma.so.1.0 ${D}${libdir}/librpmsg_=
dma.so.1
>> +=C2=A0=C2=A0=C2=A0 ln -sf librpmsg_dma.so.1 ${D}${libdir}/librpmsg_dm=
a.so
>
> This is messy, why should we handle basic installation tasks here
> in the Yocto recipe? This should be done by the project's build system.
> Since this is your project you should go fix that. Otherwise someone wi=
ll
> have to deal with adding these steps manually like this to every distro
> system that wants to use this project.
>
> I'd recommend just having CMake do this for you.

Changed to cmake=C2=A0 based, will push in next version

>
>> +
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}/rpmsg_dma
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 include/*.h ${D}${includedir}/rpms=
g_dma/
>> +}
>> diff --git=20
>> a/meta-ti-extras/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb=20
>> b/meta-ti-extras/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
>> new file mode 100644
>> index 00000000..0806cccd
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
>
> The example can/should just build as part of the library build, these
> come from the same source / project. One recipe can make more than
> one package. The -example package can be made as part of the above=20
> recipe.
>
> PACKAGES =3D+ "${PN}-examples"
> FILES:${PN}-examples +=3D "${bindir}/rpmsg_audio_offload_example"
>
> Andrew
>
2 recipes are created=C2=A0 for below reasons:

1st recipe will provide rpmsg-dma library which can be used for any=20
project which has rpmsg bases IPC, this recipe only depends on rpmsg_char

2nd recipe will be product specific examples, may not be common, also=20
issues here is that example depends upon fftw3 packages which comes part=20
of oe-core. Currently we are discussing where

we should keep this recipe so that meta-ti layer will not have any=20
dependency on oe-core. what you suggest where to keep this recipe.

Once we decided where to keep then i will post next version with all=20
your comments addressed.

>> @@ -0,0 +1,27 @@
>> +SUMMARY =3D "Audio Offload Example using RPMsg DMA"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D744e63d2bb8c6151dcdd97f49aa02c53"
>> +
>> +SRC_URI =3D=20
>> "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dhttps;bran=
ch=3Dmain"
>> +SRCREV =3D "cd18ced927aa2b916708d611758caab25a795feb"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +DEPENDS =3D "ti-librpmsg-dma fftw libsndfile1 alsa-lib"
>> +
>> +do_compile() {
>> +=C2=A0=C2=A0=C2=A0 oe_runmake -C example/audio_offload
>> +}
>> +
>> +do_install() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}
>> +=C2=A0=C2=A0=C2=A0 install -m 0755=20
>> example/audio_offload/bin/rpmsg_audio_offload_example ${D}${bindir}/
>> +
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir}
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/opt
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 example/audio_offload/config/dsp_o=
ffload.cfg=20
>> ${D}${sysconfdir}/dsp_offload.cfg
>> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
>> example/audio_offload/audio_sample/sample_audio.wav=20
>> ${D}/opt/sample_audio.wav
>> +}
>> +
>> +FILES:${PN} +=3D "${sysconfdir}/dsp_offload.cfg"
>> +FILES:${PN} +=3D "/opt/sample_audio.wav"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#18614):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/18614
>> Mute This Topic: https://lists.yoctoproject.org/mt/113375625/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468D9C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 12:02:06 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.19386.1748520116362596861
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 May 2025 05:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=wwiHS17T;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: v-singh1@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TC1qGJ3513492;
	Thu, 29 May 2025 07:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748520112;
	bh=CzDBy9D66t7qFnxgdcuwoD/5lBguRm3r5I9XQ/SAGB8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wwiHS17TdrgzyIItqhie6jRAw4ADfHZfnJ7qJGMKE3BHDiuCedGYOUnZ6DczT9tJV
	 nEEzz65wjJtROo/H2vBFabTVx5QS4/H6uyH+CFLtdMjuV4JpXiMwLgu50tuqKj8NrB
	 ver4BLNy6WYQi7Ha0AF5MFsVaSQ6LSwTR/1usQuk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TC1qfk079346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 07:01:52 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 07:01:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 07:01:51 -0500
Received: from [172.24.227.153] (uda0513920.dhcp.ti.com [172.24.227.153])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TC1mL91553583;
	Thu, 29 May 2025 07:01:49 -0500
Message-ID: <bf2059dc-0a31-4e83-9a85-a66e2622dd7d@ti.com>
Date: Thu, 29 May 2025 17:31:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH 2/2] Add rpmsg DMA library and simple DSP
 offload example
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Paresh
 Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <c-shilwant@ti.com>,
        <khasim@ti.com>
References: <20250528102653.323423-1-p-bhagat@ti.com>
 <20250528102653.323423-2-p-bhagat@ti.com> <20250528151659.GP18383@denix.org>
 <0f762d41-579f-4eec-bf5f-87a97d91e821@ti.com>
Content-Language: en-US
From: Vishnu Singh <v-singh1@ti.com>
In-Reply-To: <0f762d41-579f-4eec-bf5f-87a97d91e821@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 54TC1qGJ3513492
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 May 2025 12:02:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18605


On 28/05/25 20:57, Ryan Eatmon wrote:
>
>
> On 5/28/2025 10:16 AM, Denys Dmytriyenko wrote:
>> On Wed, May 28, 2025 at 03:56:53PM +0530, Paresh Bhagat wrote:
>>> From: Vishnu Singh <v-singh1@ti.com>
>>>
>>> Add rpmsg DMA library and simple DSP offload example, based on rpmsg=20
>>> & DMA Heap
>>> buffers. This includes librpmsg_dma.so shared library used for=20
>>> real-time audio
>>> offloading to DSP from Linux, Ethernet based control utility etc.
>>>
>>> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
>>> ---
>>> =C2=A0 .../ipc/ti-librpmsg-dma-example_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 28=20
>>> +++++++++++++++++++
>>> =C2=A0 .../recipes-ti/ipc/ti-librpmsg-dma_1.0.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 | 26 +++++++++++++++++
>>> =C2=A0 2 files changed, 54 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_=
1.0.bb
>>>
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb=20
>>> b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
>>> new file mode 100644
>>> index 00000000..8b01fa46
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
>>> @@ -0,0 +1,28 @@
>>> +SUMMARY =3D "Audio Offload Example using RPMsg DMA"
>>> +LICENSE =3D "MIT"
>>> +LIC_FILES_CHKSUM =3D=20
>>> "file://LICENSE;md5=3D744e63d2bb8c6151dcdd97f49aa02c53"
>>> +
>>> +SRC_URI =3D=20
>>> "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dhttps;bra=
nch=3Dmain"
>>> +SRCREV =3D "b71b6a2690eaac4ec1619a18733f73e505023ff7"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +DEPENDS =3D "ti-librpmsg-dma fftw libsndfile1 alsa-lib ti-rpmsg-char=
"
>>
>> See fftw comment below
>
> My counter response... if this recipe depends on ti-librpmsg-dma, then=20
> does this recipe need to depend on fftw?=C2=A0 Same question for all of=
 the=20
> other DEPENDS entries.=C2=A0 Does this recipe actually depend on all th=
is=20
> other packages or just ti-librpmsg-dma?
>
>
> Follow on question.. why do we have two recipes that are both pointing=20
> at the same repository?
>
@Denys Dmytriyenko, @Eatmon, Ryan
ti-librpmsg-dma only depends on ti-librpmsg-dma, update the recipe (will=20
send new patch)
ti-librpmsg-dma-example depends upon "ti-librpmsg-dma fftw libsndfile1=20
alsa-lib", I have moved this recipe to ti-extras

Below is the summary of both recipes

 =C2=A0=C2=A0=C2=A0 1. rpmsg DMA library (meta-ti-bsp/recipes-ti/ipc): Th=
is is generic=20
rpmsg based library .
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is bas=
ed on rpmsg & DMA Heap buffers. this includes=20
librpmsg_dma.so shared library
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 which=
 provides apis for
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1. rpmsg interface initializat=
ion
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2. rpmsg based recv/send api f=
or communication
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3. dma heap buffer management
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4. DSP firmware synamin load/u=
nload

 =C2=A0=C2=A0=C2=A0 2. rpmsg DMA offload example (meta-ti-extras/recipes-=
ti/ipc):
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 provi=
des example foraudio offloading to DSP from linux using
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti-rp=
msg-dma library. Alsove provide Ethernet based control
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utili=
ty (host).
>>> +
>>> +do_compile() {
>>> +=C2=A0=C2=A0=C2=A0 oe_runmake -C example/audio_offload
>>> +}
>>> +
>>> +do_install() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0755 example/audio_offload/bin/audio_o=
ffload=20
>>> ${D}${bindir}/
>>> +
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir}
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/opt
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 example/audio_offload/config/dsp_=
offload.cfg=20
>>> ${D}${sysconfdir}/dsp_offload.cfg
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
>>> example/audio_offload/audio_sample/sample_audio.wav=20
>>> ${D}/opt/sample_audio.wav
>>> +}
>>> +
>>> +FILES:${PN} +=3D "${sysconfdir}/dsp_offload.cfg"
>>> +FILES:${PN} +=3D "/opt"
>>> +FILES:${PN} +=3D "/opt/sample_audio.wav"
>>
>> Last 2 lines can be combined
>>
Addressed in next patch
>>> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb=20
>>> b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>>> new file mode 100644
>>> index 00000000..666439dd
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>>> @@ -0,0 +1,26 @@
>>> +SUMMARY =3D "RPMsg DMA shared library"
>>> +LICENSE =3D "MIT"
>>> +LIC_FILES_CHKSUM =3D=20
>>> "file://LICENSE;md5=3D744e63d2bb8c6151dcdd97f49aa02c53"
>>> +
>>> +SRC_URI =3D=20
>>> "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dhttps;bra=
nch=3Dmain"
>>> +SRCREV =3D "b71b6a2690eaac4ec1619a18733f73e505023ff7"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +DEPENDS =3D "fftw libsndfile1 alsa-lib ti-rpmsg-char"
>>
>> fftw is not in oe-core, but in meta-openembedded, and meta-ti does=20
>> not depend
>> on meta-openembedded
>
> That's a problem then...=C2=A0 We don't want to blow up the requirement=
s=20
> for building with just meta-ti-bsp (which a number of customers do).
>
> Does this belong more in meta-ti-extras then?
>
Example recipe is moved to meta-ti-extras
>>
>>> +
>>> +do_compile() {
>>> +=C2=A0=C2=A0=C2=A0 oe_runmake
>>> +}
>>> +
>>> +do_install() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0755 lib/librpmsg_dma.so.1.0 ${D}${lib=
dir}/
>>> +=C2=A0=C2=A0=C2=A0 ln -sf librpmsg_dma.so.1.0 ${D}${libdir}/librpmsg=
_dma.so.1
>>> +=C2=A0=C2=A0=C2=A0 ln -sf librpmsg_dma.so.1 ${D}${libdir}/librpmsg_d=
ma.so
>>> +
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}/rpmsg_dma
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 include/*.h ${D}${includedir}/rpm=
sg_dma/
>>> +}
>>> +
>>> +INSANE_SKIP:${PN} +=3D "dev-so"
>>
>> Is it needed here? I see the versioned links are setup above, so this=20
>> should
>> not be needed...
Fixed in next patch


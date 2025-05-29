Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D499C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 12:14:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.19625.1748520890169415242
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 May 2025 05:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=cx808SOj;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: v-singh1@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TCEmeR3515009;
	Thu, 29 May 2025 07:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748520888;
	bh=a+mfgr67IhDDVoucc6Fc6AQGUgnDJ5Xzo17AInSBuWg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cx808SOj3NUBq+gfXEMe2d7roN78i6HIIkh4OGfaKp/sMY9gFSGyPMFX5M2YYDUYS
	 e8kGLdEmqFSJJgPKcvT9Jlh6zQJyzfVO4wKVqCE97iW248O6DzjJ49ouuQwvMNvINn
	 Fl8Vo+VsLCq7Yf6pFiIZoGW21gPeq/4XdTbg/z3w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TCEmmn018844
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 07:14:48 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 07:14:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 07:14:48 -0500
Received: from [172.24.227.153] (uda0513920.dhcp.ti.com [172.24.227.153])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TCEj9g1520315;
	Thu, 29 May 2025 07:14:46 -0500
Message-ID: <90e87373-f750-43f1-a866-6f37c2d30d54@ti.com>
Date: Thu, 29 May 2025 17:44:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-ti] [scarthgap][PATCH 2/2] Add rpmsg DMA
 library and simple DSP offload example
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Paresh
 Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <c-shilwant@ti.com>,
        <khasim@ti.com>
References: <20250528102653.323423-1-p-bhagat@ti.com>
 <20250528102653.323423-2-p-bhagat@ti.com> <20250528151659.GP18383@denix.org>
 <0f762d41-579f-4eec-bf5f-87a97d91e821@ti.com>
 <1843FDC838536B5D.27909@lists.yoctoproject.org>
Content-Language: en-US
From: Vishnu Singh <v-singh1@ti.com>
In-Reply-To: <1843FDC838536B5D.27909@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 54TCEmeR3515009
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 May 2025 12:14:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18609

Please Ignore this

On 29/05/25 17:31, Vishnu Singh via lists.yoctoproject.org wrote:
> On 28/05/25 20:=E2=80=8A57, Ryan Eatmon wrote: > > > On 5/28/2025 10:=E2=
=80=8A16 AM, Denys
> Dmytriyenko wrote: >> On Wed, May 28, 2025 at 03:=E2=80=8A56:=E2=80=8A5=
3PM +0530, Paresh Bhagat
> wrote: >>> From: Vishnu Singh <v-singh1@=E2=80=8Ati.=E2=80=8Acom> >>>
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source =
of this
> email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uVdqPBcPGKOVSwYFP=
HPjEn1VP1DNy3c_pMmSGYURFTRCmE4iuZqsEa1FniwWTuWgs72SecwCpCxYwusVAnFNpgsNLg=
pYhw$>
> ZjQcmQRYFpfptBannerEnd
>
> On 28/05/25 20:57, Ryan Eatmon wrote:
> >
> >
> > On 5/28/2025 10:16 AM, Denys Dmytriyenko wrote:
> >> On Wed, May 28, 2025 at 03:56:53PM +0530, Paresh Bhagat wrote:
> >>> From: Vishnu Singh <v-singh1@ti.com>
> >>>
> >>> Add rpmsg DMA library and simple DSP offload example, based on rpms=
g=20
> >>> & DMA Heap
> >>> buffers. This includes librpmsg_dma.so shared library used for=20
> >>> real-time audio
> >>> offloading to DSP from Linux, Ethernet based control utility etc.
> >>>
> >>> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> >>> ---
> >>>   .../ipc/ti-librpmsg-dma-example_1.0.bb        | 28=20
> >>> +++++++++++++++++++
> >>>   .../recipes-ti/ipc/ti-librpmsg-dma_1.0.bb     | 26 ++++++++++++++=
+++
> >>>   2 files changed, 54 insertions(+)
> >>>   create mode 100644=20
> >>> meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
> >>>   create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0=
.bb
> >>>
> >>> diff --git=20
> >>> a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb=20
> >>> b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
> >>> new file mode 100644
> >>> index 00000000..8b01fa46
> >>> --- /dev/null
> >>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
> >>> @@ -0,0 +1,28 @@
> >>> +SUMMARY =3D "Audio Offload Example using RPMsg DMA"
> >>> +LICENSE =3D "MIT"
> >>> +LIC_FILES_CHKSUM =3D=20
> >>> "file://LICENSE;md5=3D744e63d2bb8c6151dcdd97f49aa02c53"
> >>> +
> >>> +SRC_URI =3D=20
> >>> "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dhttps;b=
ranch=3Dmain"
> >>> +SRCREV =3D "b71b6a2690eaac4ec1619a18733f73e505023ff7"
> >>> +
> >>> +S =3D "${WORKDIR}/git"
> >>> +
> >>> +DEPENDS =3D "ti-librpmsg-dma fftw libsndfile1 alsa-lib ti-rpmsg-ch=
ar"
> >>
> >> See fftw comment below
> >
> > My counter response... if this recipe depends on ti-librpmsg-dma, the=
n=20
> > does this recipe need to depend on fftw?  Same question for all of th=
e=20
> > other DEPENDS entries.  Does this recipe actually depend on all this=20
> > other packages or just ti-librpmsg-dma?
> >
> >
> > Follow on question.. why do we have two recipes that are both pointin=
g=20
> > at the same repository?
> >
> @Denys Dmytriyenko, @Eatmon, Ryan
> ti-librpmsg-dma only depends on ti-librpmsg-dma, update the recipe (wil=
l
> send new patch)
> ti-librpmsg-dma-example depends upon "ti-librpmsg-dma fftw libsndfile1
> alsa-lib", I have moved this recipe to ti-extras
>
> Below is the summary of both recipes
>
>        1. rpmsg DMA library (meta-ti-bsp/recipes-ti/ipc): This is gener=
ic
> rpmsg based library .
>               This is based on rpmsg & DMA Heap buffers. this includes
> librpmsg_dma.so shared library
>                which provides apis for
>                        1. rpmsg interface initialization
>                        2. rpmsg based recv/send api for communication
>                        3. dma heap buffer management
>                        4. DSP firmware synamin load/unload
>
>        2. rpmsg DMA offload example (meta-ti-extras/recipes-ti/ipc):
>                provides example foraudio offloading to DSP from linux u=
sing
>                ti-rpmsg-dma library. Alsove provide Ethernet based cont=
rol
>                utility (host).
> >>> +
> >>> +do_compile() {
> >>> +    oe_runmake -C example/audio_offload
> >>> +}
> >>> +
> >>> +do_install() {
> >>> +    install -d ${D}${bindir}
> >>> +    install -m 0755 example/audio_offload/bin/audio_offload=20
> >>> ${D}${bindir}/
> >>> +
> >>> +    install -d ${D}${sysconfdir}
> >>> +    install -d ${D}/opt
> >>> +    install -m 0644 example/audio_offload/config/dsp_offload.cfg=20
> >>> ${D}${sysconfdir}/dsp_offload.cfg
> >>> +    install -m 0644=20
> >>> example/audio_offload/audio_sample/sample_audio.wav=20
> >>> ${D}/opt/sample_audio.wav
> >>> +}
> >>> +
> >>> +FILES:${PN} +=3D "${sysconfdir}/dsp_offload.cfg"
> >>> +FILES:${PN} +=3D "/opt"
> >>> +FILES:${PN} +=3D "/opt/sample_audio.wav"
> >>
> >> Last 2 lines can be combined
> >>
> Addressed in next patch
> >>> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb=20
> >>> b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> >>> new file mode 100644
> >>> index 00000000..666439dd
> >>> --- /dev/null
> >>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> >>> @@ -0,0 +1,26 @@
> >>> +SUMMARY =3D "RPMsg DMA shared library"
> >>> +LICENSE =3D "MIT"
> >>> +LIC_FILES_CHKSUM =3D=20
> >>> "file://LICENSE;md5=3D744e63d2bb8c6151dcdd97f49aa02c53"
> >>> +
> >>> +SRC_URI =3D=20
> >>> "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dhttps;b=
ranch=3Dmain"
> >>> +SRCREV =3D "b71b6a2690eaac4ec1619a18733f73e505023ff7"
> >>> +
> >>> +S =3D "${WORKDIR}/git"
> >>> +
> >>> +DEPENDS =3D "fftw libsndfile1 alsa-lib ti-rpmsg-char"
> >>
> >> fftw is not in oe-core, but in meta-openembedded, and meta-ti does=20
> >> not depend
> >> on meta-openembedded
> >
> > That's a problem then...  We don't want to blow up the requirements=20
> > for building with just meta-ti-bsp (which a number of customers do).
> >
> > Does this belong more in meta-ti-extras then?
> >
> Example recipe is moved to meta-ti-extras
> >>
> >>> +
> >>> +do_compile() {
> >>> +    oe_runmake
> >>> +}
> >>> +
> >>> +do_install() {
> >>> +    install -d ${D}${libdir}
> >>> +    install -m 0755 lib/librpmsg_dma.so.1.0 ${D}${libdir}/
> >>> +    ln -sf librpmsg_dma.so.1.0 ${D}${libdir}/librpmsg_dma.so.1
> >>> +    ln -sf librpmsg_dma.so.1 ${D}${libdir}/librpmsg_dma.so
> >>> +
> >>> +    install -d ${D}${includedir}/rpmsg_dma
> >>> +    install -m 0644 include/*.h ${D}${includedir}/rpmsg_dma/
> >>> +}
> >>> +
> >>> +INSANE_SKIP:${PN} +=3D "dev-so"
> >>
> >> Is it needed here? I see the versioned links are setup above, so thi=
s=20
> >> should
> >> not be needed...
> Fixed in next patch
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18605): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/18605__;!!G3vK!QIQh4LqnWLO8ALUaJ0n9o-1T=
TcwiIILHP5WbekmadaM13vLEfrpYHiUsVvDq6msvsageGKEL2TufNelRhboLRt7NfyFGJyzd4=
54$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/113341387/9299023__;!!G3vK!QIQh4LqnWLO8ALUaJ0n9o-1TTcwiIILHP5Wbek=
madaM13vLEfrpYHiUsVvDq6msvsageGKEL2TufNelRhboLRt7NfyFGtL4aJAA$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!QIQh4LqnWLO8ALUaJ0n9o-1TTcwiIILHP5WbekmadaM13vL=
EfrpYHiUsVvDq6msvsageGKEL2TufNelRhboLRt7NfyFG9mY6tAM$  [v-singh1@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <r-monk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C48CE013B7
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 07:36:59 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4IEasxH011746;
	Fri, 18 May 2012 09:36:54 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4IEaril002972;
	Fri, 18 May 2012 09:36:53 -0500
Received: from DNCE05.ent.ti.com ([fe80::2868:e891:b6c7:394]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Fri, 18 May 2012 16:36:53 +0200
From: "Monk, Roger" <r-monk@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, Thilo Fromm <fromm@dresearch-fe.de>
Thread-Topic: [meta-ti] [oe] ti81xx-psp-linux-2.6.37: broken kernel with gcc
	> 4.5
Thread-Index: AQHNNPVHjEiAG9HzJkacM3V/R2sPzpbPX68AgAAMOYCAAAOcAIAALFiA
Date: Fri, 18 May 2012 14:36:52 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B76E4EE@DNCE05.ent.ti.com>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
	<331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
In-Reply-To: <331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] ti81xx-psp-linux-2.6.37: broken kernel with gcc	> 4.5
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2012 14:36:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Fri, May 18, 2012 at 14:52:36, Koen Kooi wrote:
> Cc: meta-ti@yoctoproject.org;
> openembedded-devel@lists.openembedded.org
> Subject: Re: [meta-ti] [oe] ti81xx-psp-linux-2.6.37: broken kernel
> with gcc > 4.5
>
>
> Op 18 mei 2012, om 15:39 heeft Thilo Fromm het volgende geschreven:
>
> > Hello Koen,
> >
> >>>>> sorry for the cross-post (openembedded-devel, meta-ti), I think
> >>>>> this affects both projects one way or the other.
> >>>>>
> >>>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5.
> >>>>> This means with oe-core + meta-oe you now can choose between
> >>>>> gcc-4.6
> and gcc-4.7.
> >>>>> However, both compilers break the kernel we're using
> >>>>> (ti81xx-psp-linux-2.6.37).
> >>>>
> >>>> What happens when you disable the mailbox? AIUI you shouldn't
> >>>> need that on Ne/Ce.
> >>>
> >>> How do I disable the mailbox?
> >>
> >> In the .config
> >
> > Wait wait wait, according to drivers/staging/tidspbridge/Kconfig we
> > need OMAP_MBOX_FWK (i.e. "the mailbox") in order to use the DSP
> > bridge. Disabling it would mean cutting off our DSP. No way.
>
> Are you actually using dspbridge? Or are you using dsplink or syslink?
>
> >
> >>> What do you mean by Ne/Ce?
> >>
> >> Netra/Centaurus, dm81xx, c6a81xx, am38xx, am39xx or whatever TI is
> calling it nowadays.
> >
> > We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with
> > a C674x DSP.
>
> So a centaurus family SoC.

Can you put some printk's in omap_mbox_register (plat-omap/mailbox.c) to pr=
int the list objects, in particular the mbox->name?

Would also be useful to see the same in omap_mbox_get() before the call to =
strcmp().

>
> > I think the only ones left without DSPs are AM-...
> > processors. So no, the DSP bridge (and therefore mailboxing) must
> > stay.
>
> See what I said above, I doubt you're using dspbridge.
>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti





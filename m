Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E808C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 07:04:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.18096.1703228641117347938
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 23:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 213E540CB6;
	Fri, 22 Dec 2023 07:04:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPbUrf0w6e5I; Fri, 22 Dec 2023 07:04:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AABCC40A20;
	Fri, 22 Dec 2023 07:03:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 461DA163DD1; Fri, 22 Dec 2023 02:03:56 -0500 (EST)
Date: Fri, 22 Dec 2023 02:03:56 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Lukasz Przenioslo <bremenpl@gmail.com>
Cc: Jon Cormier <jcormier@criticallink.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Custom device tree overlay for BBB
Message-ID: <20231222070356.GN11745@denix.org>
References: <YQk4.1703158494387381940.GjTV@lists.yoctoproject.org>
 <CADL8D3bhvg4CjJrGdniJmX4QPf2-Y08_fKTaZVkN1_P0ebecfA@mail.gmail.com>
 <18c8ce702d8.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
 <CADL8D3YqbznfEqs2O9Bcf3iqHYZMHGxDHOqHZjcL6EE7cMBUzQ@mail.gmail.com>
 <emfb88b8f2-4501-4fef-8010-1618c71d24e1@ffb2c130.com>
 <20231222014935.GM11745@denix.org>
 <18c8ff29cf8.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <18c8ff29cf8.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Dec 2023 07:04:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17370

Sorry, this got a bit out of context - one of the solutions from Jon was=20
talking about adding a bbappend to a kernel recipe, which would then=20
automatically handle KERNEL_DEVICETREE list via kernel-devicetree,bbclass

Alternatively, if you add a standalne recipe, all you need is to add your=
=20
overlay to SRC_URI and inherit devicetree.bbclass


On Fri, Dec 22, 2023 at 06:14:51AM +0100, Lukasz Przenioslo wrote:
> Hi Denys,
> Should be easy enough to test it quickly as a proof of concept,
> thank you. Will bitbake know to compile this overlay, tell the
> u-boot to load it and so on?
>=20
> On December 22, 2023 02:49:39 Denys Dmytriyenko <denis@denix.org> wrote=
:
>=20
> >You could simply add your overlay in one of the conf files, such as
> >local.conf:
> >
> >KERNEL_DEVICETREE +=3D "your-overlay.dtbo"
> >
> >Check the existing machine conf files for examples.
> >
> >
> >On Thu, Dec 21, 2023 at 08:51:49PM +0000, Lukasz Przenioslo wrote:
> >>Hi Jon,
> >>I guess the first option is more feasible, as I would not like to
> >>modify any files provided by the Poky repo, but rather create my own
> >>recipe that would somehow cover the default settings during the
> >>build. There is still a lot ahead for me to understand though...
> >>
> >>Thank you for the useful links.
> >>
> >>--
> >>=C5=81ukasz Przenios=C5=82o
> >>
> >>
> >>------ Original Message ------
> >>From "Jon Cormier" <jcormier@criticallink.com>
> >>To "Bremenpl" <bremenpl@gmail.com>
> >>Cc meta-ti@lists.yoctoproject.org
> >>Date 2023-12-21 16:17:38
> >>Subject Re: [meta-ti] Custom device tree overlay for BBB
> >>
> >>>This solution seems like a good place to start. I haven't tried it
> >>>myself but it looks clean and easy to implement.
> >>>https://stackoverflow.com/a/68650774
> >>>
> >>>The alternative would be to bbappend the kernel and patch your
> >>>overlay into the correct folder.
> >>>https://stackoverflow.com/a/39343720
> >>>
> >>>On Thu, Dec 21, 2023 at 10:03=E2=80=AFAM Bremenpl <bremenpl@gmail.co=
m> wrote:
> >>>>Hi and thank you for the answer Jonathan!
> >>>>
> >>>>Do you happen to also know a good reference on how to
> >>>>incorporate an overlay into the yocto build?
> >>>>
> >>>>On December 21, 2023 15:58:56 Jon Cormier
> >>>><jcormier@criticallink.com> wrote:
> >>>>
> >>>>>Here is a possible example overlay that configures pinmuxes
> >>>>>with the expectation that the pru's will use them.  There is
> >>>>>likely a similar example in that long list of overlays that
> >>>>>disables hdmi.
> >>>>>
> >>>>>https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm=
/AM335X-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts
> >>>>>
> >>>>>Note its entirely possible these examples won't build or apply
> >>>>>correctly on a different kernel version, but they should still
> >>>>>be a decent starting point.
> >>>>>
> >>>>>On Thu, Dec 21, 2023 at 6:34=E2=80=AFAM Lukasz Przenioslo
> >>>>><bremenpl@gmail.com> wrote:
> >>>>>>Hello there,
> >>>>>>
> >>>>>>I was able to compile the Poky image (Dunfell) with meta-ti
> >>>>>>included for the BBB. I am working on an open source project
> >>>>>>intended for home automation based on the BBB:
> >>>>>>https://github.com/Beaglenode/BeagleNodeHW
> >>>>>>
> >>>>>>The next step I am trying to make is to prepare a proper
> >>>>>>device tree overlay that would align with the HW
> >>>>>>requirements of this project (or "cape"). I need to:
> >>>>>>- Disable the HDMI pins,
> >>>>>>- configure multiple pins as either PRU0 or PRU1 controlled.
> >>>>>>
> >>>>>>For that I thought the best approach would be to prepare a
> >>>>>>DTO, instead of modifying the default one for BBB. I don't
> >>>>>>know how to prepare that DTO yet and I don't know how to
> >>>>>>include it in my build. I would like to ask for some help in
> >>>>>>this manner, especially the prior part (how to load the
> >>>>>>custom DTO). Right now I am still modifying everything in
> >>>>>>the local.conf, as I do not have the knowledge yet to build
> >>>>>>my own distro for this device (that's the end plan).
> >>>>>>
> >>>>>>I would appreciate all help!
> >>>>>>
> >>>>>>


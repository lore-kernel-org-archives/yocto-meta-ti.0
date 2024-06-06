Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE02C27C54
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 22:10:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.27838.1717711842583947039
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 15:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 976D940C85;
	Thu,  6 Jun 2024 22:10:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xI-3_DJtrKyQ; Thu,  6 Jun 2024 22:10:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2061C40C21;
	Thu,  6 Jun 2024 22:10:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 44939163F93; Thu,  6 Jun 2024 18:10:37 -0400 (EDT)
Date: Thu, 6 Jun 2024 18:10:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: Amol Practise <amolpractise@gmail.com>, yocto@lists.yoctoproject.org,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [yocto] am437x do_rootfs error
Message-ID: <20240606221037.GS21287@denix.org>
References: <17D51E6437DB5314.21428@lists.yoctoproject.org>
 <CAAkkBwNBtJGY_c8dgjCn2n4ccKu7uHMk8AbHQAV3WbfWea2N3w@mail.gmail.com>
 <D1T6RZ3TP11T.81OCAF3BR5TN@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D1T6RZ3TP11T.81OCAF3BR5TN@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Jun 2024 22:10:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17710

On Thu, Jun 06, 2024 at 02:37:46PM -0500, Randolph Sapp via lists.yoctopr=
oject.org wrote:
> On Thu Jun 6, 2024 at 11:02 AM CDT, Amol Practise wrote:
> > Hi Team,
> >
> > Any help would be appreciated on below issue.
> >
> > On Sun, Jun 2, 2024 at 12:40=E2=80=AFPM Amol Practise via lists.yocto=
project.org
> > <amolpractise=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > > Hi all,
> > >
> > > I am getting below error while i am trying to build westom image fo=
r
> > > am436xgp board, can anyone help me in this regard?
> > >
> > >
> > > bitbake core-image-weston
> > > Loading cache: 100% |############################################| =
Time:
> > > 0:00:00
> > > Loaded 2004 entries from dependency cache.
> > > NOTE: Resolving any missing task queue dependencies
> > >
> > > Build Configuration:
> > > BB_VERSION           =3D "2.8.0"
> > > BUILD_SYS            =3D "x86_64-linux"
> > > NATIVELSBSTRING      =3D "universal"
> > > TARGET_SYS           =3D "arm-poky-linux-gnueabi"
> > > MACHINE              =3D "am437x-evm"
> > > DISTRO               =3D "poky"
> > > DISTRO_VERSION       =3D "5.0.1"
> > > TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-=
hard"
> > > TARGET_FPU           =3D "hard"
> > > meta
> > > meta-poky
> > > meta-yocto-bsp       =3D
> > > "my-scarthgap:68f9a4b73d17839e0ec1f12a31fc1d42331cc42f"
> > > meta-arm-toolchain
> > > meta-arm             =3D "master:6877a1c2bdd3cd275af2be3fa26c2e0be1=
da5b32"
> > > meta-ti-bsp          =3D "master:0584bef40f3806613d0d2c3ff0c990705c=
ba3a5b"
> > >
> > > Sstate summary: Wanted 389 Local 386 Mirrors 0 Missed 3 Current 372=
8 (99%
> > > match, 99% complete)
> > > Initialising tasks: 100% |#######################################| =
Time:
> > > 0:00:09
> > > NOTE: Executing Tasks
> > > ERROR: core-image-weston-1.0-r0 do_rootfs: Postinstall scriptlets o=
f
> > > ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to=
 first
> > > boot,
> > > then please place them into pkg_postinst_ontarget:${PN} ().
> > > Deferring to first boot via 'exit 1' is no longer supported.
> > > Details of the failure are in
> > > /home/amol/git_repos/poky/build_am437xgp/tmp/work/am437x_evm-poky-l=
inux-gnueabi/core-image-weston/1.0/temp/log.do_rootfs.
> > > ERROR: Logfile of failure stored in:
> > > /home/amol/git_repos/poky/build_am437xgp/tmp/work/am437x_evm-poky-l=
inux-gnueabi/core-image-weston/1.0/temp/log.do_rootfs.4596
> > > ERROR: Task
> > > (/home/amol/git_repos/poky/meta/recipes-graphics/images/core-image-=
weston.bb:do_rootfs)
> > > failed with exit code '1'
> > > NOTE: Tasks Summary: Attempted 8487 tasks of which 8486 didn't need=
 to be
> > > rerun and 1 failed.
> > >
> > > Summary: 1 task failed:
> > >
> > > /home/amol/git_repos/poky/meta/recipes-graphics/images/core-image-w=
eston.bb:
> > > do_rootfs
> > > Summary: There was 1 ERROR message, returning a non-zero exit code.
> > >
> > >
> > > Thank you.
> > > Amol Palshetkar
> > >
>=20
> Master builds of SGX are not supported right now. That's a legacy drive=
r that
> has been reserved to yearly LTS migrations. Please use kirkstone until =
the
> legacy migration for this year occurs (10.1).

Yeah, I already checked that - meta-ti SHA points to some March-based 6.1=
=20
snapshot, which was supposed to have SGX working...

--=20
Denys


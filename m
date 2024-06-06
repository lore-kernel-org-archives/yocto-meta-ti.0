Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CB4C27C54
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 19:37:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.24209.1717702667687576565
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 12:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cDnmYUk8;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 456JbkMO085862;
	Thu, 6 Jun 2024 14:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717702666;
	bh=qcfxNZGbazSMBb5TnzXZcF6qkN0iCJYePd+hkqAoa5k=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=cDnmYUk89JIGQZkC9vvQnEGmvJVhYIVwbc+FBEEYBL/Wm4BPepy4sbA1udHeyH5v2
	 bbx82Y5YRF0cMKWQJ8UDXjDWWZliLxdDeuOWP2K9C3PKroYQ/2H0NwRlmetuKf8mXJ
	 vVuQhPHsyJJqwsU7R/auiGjqQbmeS5dICBzBy/To=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 456JbkfR032734
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Jun 2024 14:37:46 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jun 2024 14:37:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jun 2024 14:37:46 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 456JbkU3117151;
	Thu, 6 Jun 2024 14:37:46 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 6 Jun 2024 14:37:46 -0500
Message-ID: <D1T6RZ3TP11T.81OCAF3BR5TN@ti.com>
Subject: Re: [meta-ti] [yocto] am437x do_rootfs error
From: Randolph Sapp <rs@ti.com>
To: Amol Practise <amolpractise@gmail.com>, <yocto@lists.yoctoproject.org>,
        <meta-ti@lists.yoctoproject.org>
X-Mailer: aerc 0.17.0
References: <17D51E6437DB5314.21428@lists.yoctoproject.org>
 <CAAkkBwNBtJGY_c8dgjCn2n4ccKu7uHMk8AbHQAV3WbfWea2N3w@mail.gmail.com>
In-Reply-To: <CAAkkBwNBtJGY_c8dgjCn2n4ccKu7uHMk8AbHQAV3WbfWea2N3w@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Jun 2024 19:37:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17705

On Thu Jun 6, 2024 at 11:02 AM CDT, Amol Practise wrote:
> Hi Team,
>
> Any help would be appreciated on below issue.
>
> On Sun, Jun 2, 2024 at 12:40=E2=80=AFPM Amol Practise via lists.yoctoproj=
ect.org
> <amolpractise=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> > Hi all,
> >
> > I am getting below error while i am trying to build westom image for
> > am436xgp board, can anyone help me in this regard?
> >
> >
> > bitbake core-image-weston
> > Loading cache: 100% |############################################| Time=
:
> > 0:00:00
> > Loaded 2004 entries from dependency cache.
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION           =3D "2.8.0"
> > BUILD_SYS            =3D "x86_64-linux"
> > NATIVELSBSTRING      =3D "universal"
> > TARGET_SYS           =3D "arm-poky-linux-gnueabi"
> > MACHINE              =3D "am437x-evm"
> > DISTRO               =3D "poky"
> > DISTRO_VERSION       =3D "5.0.1"
> > TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-hard=
"
> > TARGET_FPU           =3D "hard"
> > meta
> > meta-poky
> > meta-yocto-bsp       =3D
> > "my-scarthgap:68f9a4b73d17839e0ec1f12a31fc1d42331cc42f"
> > meta-arm-toolchain
> > meta-arm             =3D "master:6877a1c2bdd3cd275af2be3fa26c2e0be1da5b=
32"
> > meta-ti-bsp          =3D "master:0584bef40f3806613d0d2c3ff0c990705cba3a=
5b"
> >
> > Sstate summary: Wanted 389 Local 386 Mirrors 0 Missed 3 Current 3728 (9=
9%
> > match, 99% complete)
> > Initialising tasks: 100% |#######################################| Time=
:
> > 0:00:09
> > NOTE: Executing Tasks
> > ERROR: core-image-weston-1.0-r0 do_rootfs: Postinstall scriptlets of
> > ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to fir=
st
> > boot,
> > then please place them into pkg_postinst_ontarget:${PN} ().
> > Deferring to first boot via 'exit 1' is no longer supported.
> > Details of the failure are in
> > /home/amol/git_repos/poky/build_am437xgp/tmp/work/am437x_evm-poky-linux=
-gnueabi/core-image-weston/1.0/temp/log.do_rootfs.
> > ERROR: Logfile of failure stored in:
> > /home/amol/git_repos/poky/build_am437xgp/tmp/work/am437x_evm-poky-linux=
-gnueabi/core-image-weston/1.0/temp/log.do_rootfs.4596
> > ERROR: Task
> > (/home/amol/git_repos/poky/meta/recipes-graphics/images/core-image-west=
on.bb:do_rootfs)
> > failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 8487 tasks of which 8486 didn't need to =
be
> > rerun and 1 failed.
> >
> > Summary: 1 task failed:
> >
> > /home/amol/git_repos/poky/meta/recipes-graphics/images/core-image-westo=
n.bb:
> > do_rootfs
> > Summary: There was 1 ERROR message, returning a non-zero exit code.
> >
> >
> > Thank you.
> > Amol Palshetkar
> >

Master builds of SGX are not supported right now. That's a legacy driver th=
at
has been reserved to yearly LTS migrations. Please use kirkstone until the
legacy migration for this year occurs (10.1).

- Randolph


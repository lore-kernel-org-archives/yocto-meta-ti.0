Return-Path: <anandb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C877EDE989
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 01:47:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.11820.1694742440674788592
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 18:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WwHKJilR;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: anandb@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38F1lGDF021980;
	Thu, 14 Sep 2023 20:47:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694742436;
	bh=TCxqwoQHKbfnpUPv1U3m07zeQ+9XWkdgU7EDK7b2ECA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=WwHKJilR+xBL1c4Ybt7Yr52UUCf2KCY+l0Ug/SrSBfS4iK6N6I/HS2lQZnYjZeAUP
	 AguLMHJLX3KOp9FWmruRYEqT9LZtuGdjYNkdchGqj3Kkt19ixmGcukQMezC464T9pK
	 9KucOEooKHa+5NPMn9sPxoJauNFbAsKmkBhTtIH0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38F1lG6C006940
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 14 Sep 2023 20:47:16 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Sep 2023 20:47:16 -0500
Received: from DLEE106.ent.ti.com ([fe80::8d93:1ed8:6156:7891]) by
 DLEE106.ent.ti.com ([fe80::8d93:1ed8:6156:7891%17]) with mapi id
 15.01.2507.023; Thu, 14 Sep 2023 20:47:16 -0500
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Eatmon, Ryan" <reatmon@ti.com>,
        "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>,
        "Gupta, Gyan" <g-gupta@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>,
        "Pothukuchi, Vijay" <vijayp@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>
Subject: RE: [EXTERNAL] Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add
 config preempt for am335x and am437x
Thread-Topic: [EXTERNAL] Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add
 config preempt for am335x and am437x
Thread-Index: AQHZ5y5neqGv50s820uRzkLhur8+NbAavHOJgABhWEA=
Date: Fri, 15 Sep 2023 01:47:16 +0000
Message-ID: <2cf51220b2cd4976bb8531d3cceced5a@ti.com>
References: <20230914171026.3014887-1-anandb@ti.com>
 <1784DB091C7C28F5.22721@lists.yoctoproject.org>
 <20230914195514.GO3359@denix.org>
In-Reply-To: <20230914195514.GO3359@denix.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.142.86]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 Sep 2023 01:47:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16982

Hi Denys,

This is only needed for v7 platforms like AM3 / AM4 and possibly AM57x also=
. CONFIG_PREEMPT is enabled by default on arm64 platforms like AM65x.

Praneeth will send a kernel patch for TI kernel. This meta-ti patch is mean=
t to unblock anyone who wants to enable SGX drive in the meanwhile.=20

Regards,
Anand

-----Original Message-----
From: Denys Dmytriyenko <denis@denix.org>=20
Sent: Friday, September 15, 2023 1:25 AM
To: Balagopalakrishnan, Anand <anandb@ti.com>
Cc: meta-ti@lists.yoctoproject.org; Eatmon, Ryan <reatmon@ti.com>; Adivi, S=
ai Sree Kartheek <s-adivi@ti.com>; Gupta, Gyan <g-gupta@ti.com>; Khasim, Sy=
ed Mohammed <khasim@ti.com>; Pothukuchi, Vijay <vijayp@ti.com>; Bajjuri, Pr=
aneeth <praneeth@ti.com>
Subject: [EXTERNAL] Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add con=
fig preempt for am335x and am437x

On Thu, Sep 14, 2023 at 03:36:18PM -0400, Denys Dmytriyenko wrote:
> On Thu, Sep 14, 2023 at 10:40:26PM +0530, Anand Balagopalakrishnan via li=
sts.yoctoproject.org wrote:
> > SGX needs a preemptible kernel. CONFIG_PREEMPT has always been=20
> > enabled on TI Linux kernels upto K5.1.
> >=20
> > This is enabled on AM65x by default but missed out AM335x and AM437x.
> > Add a kernel config fragment to enable config preempt.
>=20
> Hi, Anand,
>=20
> Is this only needed for am335x and am437x, as the subject suggests? If=20
> so, why the code adds the config fragment to all platforms?
>=20
> Second question - historically this has been enabled in the TI kernel its=
elf.=20
> Why not do it like that again, why add the fragment to the OE metadata=20
> instead of keeping it in-tree? How the distro-agnostic approach would be =
handled?
>=20
>=20
> > Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> > ---
> >  .../linux/files/configs/config-preempt.cfg           | 12 ++++++++++++
> >  .../recipes-kernel/linux/linux-ti-staging_6.1.bb     |  1 +
> >  2 files changed, 13 insertions(+)
> >  create mode 100644=20
> > meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
> >=20
> > diff --git=20
> > a/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg=20
> > b/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
> > new file mode 100644
> > index 00000000..c1e5ad7d
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.
> > +++ cfg
>=20
> This is not the right location for the file. You want to add to the=20
> linux-ti-staging-rt-6.1/ directory, since you are only using it from=20
> the corresponding linux-ti-staging_6.1.bb recipe.

Sorry, typo here - linux-ti-staging-6.1/ directory, if it's not RT-specific=
.

>=20
> > @@ -0,0 +1,12 @@
> > +CONFIG_PREEMPT_BUILD=3Dy
> > +# CONFIG_PREEMPT_NONE is not set
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_PREEMPT_COUNT=3Dy
> > +CONFIG_PREEMPTION=3Dy
> > +CONFIG_PREEMPT_RCU=3Dy
> > +CONFIG_TASKS_RCU_GENERIC=3Dy
> > +CONFIG_TASKS_RCU=3Dy
> > +CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> > +# CONFIG_CEC_GPIO is not set
> > +CONFIG_DEBUG_PREEMPT=3Dy
> > +# CONFIG_PREEMPT_TRACER is not set
> > diff --git=20
> > a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb=20
> > b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> > index 8a883878..0ee63358 100644
> > --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> > +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> > @@ -33,6 +33,7 @@ PR =3D "${MACHINE_KERNEL_PR}"
> > =20
> >  KERNEL_GIT_URI ?=3D "git://git.ti.com/git/ti-linux-kernel/ti-linux-ker=
nel.git"
> >  KERNEL_GIT_PROTOCOL =3D "https"
> > +KERNEL_CONFIG_FRAGMENTS +=3D "${WORKDIR}/config-preempt.cfg"
>=20
> Since this file is out-of-tree and in the OE metadata, it would also=20
> require listing it in SRC_URI.
>=20
>=20
> >  SRC_URI +=3D "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};bran=
ch=3D${BRANCH} \
> >              file://defconfig"
> > =20
> > --
> > 2.34.1


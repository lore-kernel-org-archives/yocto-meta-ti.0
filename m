Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B85EC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 02:57:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.6057.1699412256295667913
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 18:57:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KbVJ/e01;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A82vVOO022502;
	Tue, 7 Nov 2023 20:57:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699412251;
	bh=2Tx4Dvj7ZN8W8NOob9NEhVtxSM4RcsMmbzSxVd5B8hI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=KbVJ/e01x7vCYmaCsmG6qVUV6WHVmbXuCUIehgs3Iojgn83BLPRgjfp2CpMkVtyqt
	 sB7O+uiWOMGccrfQ/ih7oBXGNRo9LRN3vjAkFYoO7f7eYyrhGcqXPyrf1uCJodrBkj
	 mq6X0Ol2gW0WNsxpPhaI5IKFHg+gUIi6AbH4NE4s=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A82vVDK076258
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Nov 2023 20:57:31 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 20:57:30 -0600
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
 DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
 15.01.2507.023; Tue, 7 Nov 2023 20:57:30 -0600
From: "Bhagat, Paresh" <p-bhagat@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "Eatmon, Ryan" <reatmon@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Shilwant, Chirag"
	<c-shilwant@ti.com>,
        "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>,
        "Khasim,
 Syed Mohammed" <khasim@ti.com>,
        "Gupta, Gyan" <g-gupta@ti.com>
Subject: RE: [EXTERNAL] Re: [meta-ti] [kirkstone][RFC] ti-extras: Add support
 for extra kernel features for RT
Thread-Topic: [EXTERNAL] Re: [meta-ti] [kirkstone][RFC] ti-extras: Add support
 for extra kernel features for RT
Thread-Index: AQHaEZdmGkFFiSvMeUO9wNJckz8tBrBvs+8AgAAD9WA=
Date: Wed, 8 Nov 2023 02:57:30 +0000
Message-ID: <ddf3deb975d94fddb3e7c577ac12e7e3@ti.com>
References: <20231107160558.2661070-1-p-bhagat@ti.com>
 <b52f8875-e6f7-4686-b279-1009cdd5a66d@ti.com>
 <20231107203038.GS2408@denix.org>
In-Reply-To: <20231107203038.GS2408@denix.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.136.226]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 02:57:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17265

Hi Denys and Ryan,

Thanks for the review. I will address the comments and send an updated patc=
h.

-----Original Message-----
From: Denys Dmytriyenko <denis@denix.org>=20
Sent: Wednesday, November 8, 2023 2:01 AM
To: Eatmon, Ryan <reatmon@ti.com>
Cc: Bhagat, Paresh <p-bhagat@ti.com>; meta-ti@lists.yoctoproject.org; Bajju=
ri, Praneeth <praneeth@ti.com>; denys@konsulko.com; Shilwant, Chirag <c-shi=
lwant@ti.com>; Adivi, Sai Sree Kartheek <s-adivi@ti.com>; Khasim, Syed Moha=
mmed <khasim@ti.com>; Gupta, Gyan <g-gupta@ti.com>
Subject: [EXTERNAL] Re: [meta-ti] [kirkstone][RFC] ti-extras: Add support f=
or extra kernel features for RT

On Tue, Nov 07, 2023 at 10:28:11AM -0600, Ryan Eatmon via lists.yoctoprojec=
t.org wrote:
>=20
>=20
> On 11/7/2023 10:05 AM, Paresh Bhagat wrote:
> >Add support for ti-extras features for rt as it was added for non rt=20
> >kernel and u-boot earlier. It will also be accessible via the=20
> >TI_EXTRAS variable in the local.conf file.
> >
> >Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> >---
> >  .../recipes-kernel/linux/linux-ti-staging-rt_6.1.bb   |  5 +++--
> >  meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc     | 11 +++++++++++
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> >  create mode 100644=20
> >meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
> >
> >diff --git=20
> >a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb=20
> >b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> >index a600630e..93e1be39 100644
> >--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> >+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> >@@ -1,10 +1,11 @@
> >  require linux-ti-staging_6.1.bb
> >+include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if=20
> >+d.getVar('TI_EXTRAS') else ''}
> >  # Look in the generic major.minor directory for files
> >  # This will have priority over generic non-rt path
> >  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.1:"
> >-BRANCH =3D "ti-rt-linux-6.1.y"
> >+BRANCH ?=3D "ti-rt-linux-6.1.y"
> >-SRCREV =3D "eda9974e8513cdd2c5cc20c3c6b851f9977acd4d"
> >+SRCREV ?=3D "eda9974e8513cdd2c5cc20c3c6b851f9977acd4d"
>=20
> I may need Denys to weigh on these comments:
>=20
> You cannot use the ?=3D here.  This recipe includes the=20
> linux-ti-staging_6.1.bb recipe which has the default lines already in=20
> there.  And the ?=3D is a soft default which will only set the value IF=20
> it is not already set.  So this will break RT builds.
>=20
> Bitbake also processes the =3D at the moment you see it.  So the "last"=20
> time a variable is set with =3D it will be the value that wins.
>=20
> So for the RT recipe, you will likely need to move the include to=20
> AFTER the above BRANCH/SRCREV settings.
>=20
> Basically, I think you need:
>=20
>   BRANCH =3D "ti-rt-linux-6.1.y"
>=20
>   SRCREV =3D "eda9974e8513cdd2c5cc20c3c6b851f9977acd4d"
>=20
>   include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if
> d.getVar('TI_EXTRAS') else ''}
>=20
>=20
> So this inclusion of the extra will need to be different in the RT=20
> recipe versus the non-RT recipe.  All because the RT recipe includes=20
> the non-RT recipe.

Yes, this explanation is correct. Some re-ordering is required. Simply maki=
ng those assignments as weak at the end of -rt recipe is incorrect - that w=
ill break -rt recipe regardless of whether ti-extras is enabled or not.


> >  PV =3D "6.1.46+git${SRCPV}"
> >diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc=20
> >b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
> >new file mode 100644
> >index 00000000..1fc40934
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
> >@@ -0,0 +1,11 @@
> >+
> >+# Use different commit, repo and branch for TI extras build # This=20
> >+will have priority over generic rt path
> >+
> >+COMPATIBLE_MACHINE =3D "am62xx"
> >+
> >+BRANCH =3D "ti-rt-linux-6.1.y"
> >+BRANCH:tie-jailhouse =3D "ti-rt-linux-6.1.y-jailhouse"
> >+
> >+SRCREV =3D "685e77152461bd6b791500f717bec62d17c1b36d"
> >+SRCREV:tie-jailhouse =3D "a74088b40b4d27478a2af5c20cdc0b4ec8ed9470"
>=20
> This file should be fine.


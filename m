Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E51FBE00BC6; Thu, 29 May 2014 08:00:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from comal.ext.ti.com (unknown [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D003E00A44
	for <meta-ti@yoctoproject.org>; Thu, 29 May 2014 08:00:09 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4TF08jI007648;
	Thu, 29 May 2014 10:00:08 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4TF07jI020903;
	Thu, 29 May 2014 10:00:08 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 29 May 2014 10:00:04 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: lower the preference for
	3.15	recipe for now
Thread-Index: AQHPet85FmINeWWQXkiSpqDF4h0vwptXp4Uw
Date: Thu, 29 May 2014 15:00:03 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D0776A8@DLEE11.ent.ti.com>
References: <1401327668-3680-1-git-send-email-denis@denix.org>
In-Reply-To: <1401327668-3680-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] linux-ti-staging: lower the preference for 3.15	recipe for now
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 29 May 2014 15:00:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, May 28, 2014 8:41 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] linux-ti-staging: lower the preference
>for 3.15 recipe for now
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>* It breaks libgles/SGX due to missing omafb/omafb.h header
>* Will be switching to 3.14 instead for LTS
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Acked-by: Chase Maupin <chase.maupin@ti.com>

>---
> recipes-kernel/linux/linux-ti-staging_3.15.bb | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/recipes-kernel/linux/linux-ti-staging_3.15.bb
>b/recipes-kernel/linux/linux-ti-staging_3.15.bb
>index a55b581..64db8da 100644
>--- a/recipes-kernel/linux/linux-ti-staging_3.15.bb
>+++ b/recipes-kernel/linux/linux-ti-staging_3.15.bb
>@@ -3,6 +3,8 @@ DESCRIPTION =3D "Linux kernel for TI devices"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>
>+DEFAULT_PREFERENCE =3D "-1"
>+
> inherit kernel
>
> require recipes-kernel/linux/linux-dtb.inc
>--
>1.9.3
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti


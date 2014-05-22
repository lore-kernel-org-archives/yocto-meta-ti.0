Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFE4BE00BE4; Thu, 22 May 2014 10:17:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 564F2E00B94
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 10:17:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4MHH24W022255;
	Thu, 22 May 2014 12:17:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4MHH1ck000857;
	Thu, 22 May 2014 12:17:02 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Thu, 22 May 2014 12:17:01 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/2] linux-ti-staging: bump to 3.12.20 stable
	release
Thread-Index: AQHPddqHK6TasbWqDUu9HZgHWrvcdJtM141A
Date: Thu, 22 May 2014 17:17:01 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D04CCCB@DLEE11.ent.ti.com>
References: <1400775888-23432-1-git-send-email-denis@denix.org>
	<1400775888-23432-2-git-send-email-denis@denix.org>
In-Reply-To: <1400775888-23432-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] linux-ti-staging: bump to 3.12.20 stable	release
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
X-List-Received-Date: Thu, 22 May 2014 17:17:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Thursday, May 22, 2014 11:25 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 2/2] linux-ti-staging: bump to 3.12.20
>stable release
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-kernel/linux/linux-ti-staging_3.12.bb | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb
>b/recipes-kernel/linux/linux-ti-staging_3.12.bb
>index 154d2fc..ac30ab5 100644
>--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
>+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
>@@ -36,11 +36,11 @@ S =3D "${WORKDIR}/git"
>
> BRANCH =3D "ti-linux-3.12.y"
>
>-SRCREV =3D "f0d4672333685697320f4907d5b4d3919121c299"
>-PV =3D "3.12.17"
>+SRCREV =3D "ffe21d87399ec09620878613a9ebfbc6c1d7c548"
>+PV =3D "3.12.20"
>
> # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
>a rebuild
>-MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
>+MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> PR =3D "${MACHINE_KERNEL_PR}"
>
> KERNEL_CONFIG_FRAGMENTS =3D "baseport.cfg connectivity.cfg ipc.cfg"
>--
>1.9.3
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti


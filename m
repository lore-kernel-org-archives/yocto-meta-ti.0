Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29F96E017D3
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 10:29:06 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9VHT5dh029284;
	Thu, 31 Oct 2013 12:29:05 -0500
Received: from DLEE71.ent.ti.com ([157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9VHT5CZ028604;
	Thu, 31 Oct 2013 12:29:05 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 31 Oct 2013 12:29:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] am33x-cm3: update to specify correct tag and
	branch
Thread-Index: AQHO1lwP/vbplR78f0a/NXErptLJ+ZoPEJsA
Date: Thu, 31 Oct 2013 17:29:05 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597F06AA@DLEE11.ent.ti.com>
References: <1383239337-31186-1-git-send-email-denis@denix.org>
In-Reply-To: <1383239337-31186-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] am33x-cm3: update to specify correct tag and	branch
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
X-List-Received-Date: Thu, 31 Oct 2013 17:29:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Thursday, October 31, 2013 12:09 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] am33x-cm3: update to specify correct
>tag and branch
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-bsp/ti/am33x-cm3_git.bb | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-
>bsp/ti/am33x-cm3_git.bb
>index 3be46b6..cfde2cf 100644
>--- a/recipes-bsp/ti/am33x-cm3_git.bb
>+++ b/recipes-bsp/ti/am33x-cm3_git.bb
>@@ -4,11 +4,11 @@ LICENSE =3D "TI-BSD"
> LIC_FILES_CHKSUM =3D
>"file://License.txt;md5=3D858099c817e47ea63559fc6b67ae8d91"
>
> PV =3D "05.00.00.00"
>-PR =3D "r0"
>+PR =3D "r1"
>
>-# SRCREV corresponds to the tip of next3 branch
>+# SRCREV corresponds to tag v05.00.00.00
> SRCREV =3D "1628306779c05ee45f09d1d3131e722ddd3a5e2e"
>-BRANCH ?=3D "next3"
>+BRANCH ?=3D "master"
>
> INITSCRIPT_NAME =3D "am335x-pm-firmware-load"
> INITSCRIPT_PARAMS =3D "defaults 96"
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti


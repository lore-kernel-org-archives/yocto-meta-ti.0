Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27015E017F9
	for <meta-ti@yoctoproject.org>; Wed,  6 Nov 2013 20:29:20 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA74TJnT005781;
	Wed, 6 Nov 2013 22:29:19 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA74TJPh015678;
	Wed, 6 Nov 2013 22:29:19 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 6 Nov 2013 22:29:19 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Khem Raj <raj.khem@gmail.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] adjust BBPATH to be a good citizen of layer
	world
Thread-Index: AQHO22DqV9rrhPGlTECPE2PZ6Hzoj5oZLNtw
Date: Thu, 7 Nov 2013 04:29:18 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597FE834@DLEE11.ent.ti.com>
References: <1383791126-22557-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1383791126-22557-1-git-send-email-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] adjust BBPATH to be a good citizen of layer world
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
X-List-Received-Date: Thu, 07 Nov 2013 04:29:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

This seems like a reversal of http://arago-project.org/git/meta-ti.git?a=3D=
commit;h=3Ddabd83e96fe99d0c3d1a88be4d1637831526d217

Looks like there may be a need to cover the different use cases and underst=
and what each person is trying to do :)

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Khem Raj
>Sent: Thursday, November 07, 2013 7:55 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] adjust BBPATH to be a good citizen of
>layer world
>
>Currently, meta-ti appears as first path in BBPATH
>rest of layers append so lets do the same
>
>helps distros with multiple BSP layers to include meta-ti
>
>Signed-off-by: Khem Raj <raj.khem@gmail.com>
>---
> conf/layer.conf | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/conf/layer.conf b/conf/layer.conf
>index e39bd85..faa4ac0 100644
>--- a/conf/layer.conf
>+++ b/conf/layer.conf
>@@ -1,5 +1,5 @@
> # We have a conf and classes directory, append to BBPATH
>-BBPATH =3D. "${LAYERDIR}:"
>+BBPATH .=3D ":${LAYERDIR}"
>
> # We have a recipes directory, add to BBFILES
> BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
>${LAYERDIR}/recipes*/*/*.bbappend"
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti


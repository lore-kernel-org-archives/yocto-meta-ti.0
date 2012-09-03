Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D637E013A6
	for <meta-ti@yoctoproject.org>; Mon,  3 Sep 2012 01:44:26 -0700 (PDT)
Received: by wibhq12 with SMTP id hq12so2867409wib.11
	for <meta-ti@yoctoproject.org>; Mon, 03 Sep 2012 01:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=3lRVI6h0RAUERPmyFui0FQoY8ifxMK7VmDEISFUsr3w=;
	b=K4a3mzWkoA+V4LXrTLMh5GDXR/+1KrivAYkgJTMFT0PJWbgRVdHl0B66lNYb6BATH7
	LWiGlA14O43KZqZHsMYJVx4Q1RRxNAP2jpDoo0XJ4rNSGMVhFBGONMqPUKCGhoCR5JwF
	iYyBqDPCx47nHS6VihE2ELY9tv9uyh19pk37Nd8x8nJ42BE1IGu/qw66MRXn12gvRRHj
	qAEZY7GdJ+/aghruO0h9kIUUXh6FUThBltXNEsoPw2U5WjBELqmCAdRF62UmlN1zq6HF
	OsGvYVk/mKrJDJAf9z9hBZQsPhhVz7/6fT6aMK5+qj8Md5d/E/vVSsK7abhjeVjzLi9J
	V/mQ==
Received: by 10.216.236.24 with SMTP id v24mr8802786weq.18.1346661862900;
	Mon, 03 Sep 2012 01:44:22 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id k2sm26472199wiz.7.2012.09.03.01.44.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 01:44:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346662382-9673-1-git-send-email-fcooper27jr@gmail.com>
Date: Mon, 3 Sep 2012 10:44:18 +0200
Message-Id: <5100579D-2BFE-4867-94CC-A7EB81D8942C@dominion.thruhere.net>
References: <1346662382-9673-1-git-send-email-fcooper27jr@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQm3XHDYSTNofos6g9Bm3jplHgCzeNA3T2XEGbDNjPgDgjDZGgJDkFWAD8zIP3/2u8Bez8wR
Subject: Re: [PATCH] libgles-omap3: Pull in changes from arago to meta-ti
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
X-List-Received-Date: Mon, 03 Sep 2012 08:44:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 sep. 2012, om 10:53 heeft "Franklin S. Cooper Jr" =
<fcooperjr27@gmail.com> het volgende geschreven:

> * Package additional include files from pvr2d and OGLES/GLES. This is =
required
>  when trying to build qt4-embedded-gles (currently being developed)
> * Other minor tweaks.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> ---
> recipes-graphics/libgles/libgles-omap3.inc    |   32 =
+++++++++++++-----------
> recipes-graphics/libgles/libgles-omap3/rc.pvr |    7 +++++
> 2 files changed, 24 insertions(+), 15 deletions(-)
>=20
> diff --git a/recipes-graphics/libgles/libgles-omap3.inc =
b/recipes-graphics/libgles/libgles-omap3.inc
> do_install () {
> @@ -133,8 +134,7 @@ do_install () {
>=20
> 	install -m 0755 ${BINLOCATION}/*_test ${D}${bindir}/
> 	install -m 0755 ${BINLOCATION}/gl* ${D}${bindir}/
> -	install -m 0755 ${BINLOCATION}/pvrsrvinit ${D}${bindir}/
> -
> +	install -m 0755 ${BINLOCATION}/p[dv]* ${D}${bindir}/
> 	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/

You're reverting an older commit here without explaining why.=


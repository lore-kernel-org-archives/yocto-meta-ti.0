Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33269E0132F
	for <meta-ti@yoctoproject.org>; Tue,  1 May 2012 06:06:23 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so369472wgb.11
	for <meta-ti@yoctoproject.org>; Tue, 01 May 2012 06:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=gFb5aZkUF4qIlxN8x94bYjWqTQivG+B1hzD/8F5M8yM=;
	b=gMrqIHU4ro9XpcuEn+tjgZbzDaueSYEEZniBOIKApAc0ZJHLVybUwg7NaWEaKDXedS
	Yg8SVwd1RYDMe4yzhoqvCR98Adsd/0/W/jpcuYLtLO2xqeWFg407k70moKrdHIO76GpW
	KGGD1FurFY6vzrn43oPVLHHElRzJGkDOpis3ztWdArU93m/Iu2o/rhMUGhj5l0eiI2PY
	Mh6qcrCG6JSB1HYtUI3oRYxiJI7E74ZG3Mk6O+D9yc0P/cvZkGyZik/nvA3/jzV3JvN5
	BH3RE1qj/SAY1yTs4z1KlMSxNGoxJgv3y/HzJ06/1htlzHNxvcvP1YE2F4JYUXxCd2qX
	kFEA==
Received: by 10.180.104.231 with SMTP id gh7mr5128413wib.10.1335877582257;
	Tue, 01 May 2012 06:06:22 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n20sm57500319wiw.5.2012.05.01.06.06.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 06:06:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1335877438-23916-2-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 1 May 2012 15:06:17 +0200
Message-Id: <FA6CCB1E-CAB6-47BE-9336-E67CCFB7B6F5@dominion.thruhere.net>
References: <1335877438-23916-1-git-send-email-koen@dominion.thruhere.net>
	<1335877438-23916-2-git-send-email-koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmjhPL2Iyh5PBLrNrVjXkSpzyWwnhLG8S6Pbz9zZYqXf5XPk5r16YSWka9qaKpxmwAHgtTS
Cc: denys@ti.com
Subject: Re: [PATCH 2/2] libgles-omap3: move X related binaries into X11WSEGL subpackages to avoid dragging in libx11 and friends
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2012 13:06:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 mei 2012, om 15:03 heeft Koen Kooi het volgende geschreven:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> recipes-graphics/libgles/libgles-omap3.inc |   18 +++++++++---------
> 1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/recipes-graphics/libgles/libgles-omap3.inc =
b/recipes-graphics/libgles/libgles-omap3.inc
> index c363361..3a6ffd0 100644
> --- a/recipes-graphics/libgles/libgles-omap3.inc
> +++ b/recipes-graphics/libgles/libgles-omap3.inc
> @@ -3,7 +3,7 @@ LICENSE =3D "proprietary-binary"
> # 'TSPA.txt' might not be the best file to md5sum
> LIC_FILES_CHKSUM =3D =
"file://TSPA.txt;md5=3Dc0d5d9c1e38b41677144c4e24d6ddee1"
>=20
> -PR =3D "r28"
> +PR =3D "r29"
>=20
> COMPATIBLE_MACHINE =3D "(omap3|ti816x|ti33x)"
>=20
> @@ -238,7 +238,7 @@ FILES_${PN}-blitwsegl =3D =
"${libdir}/libpvrPVR2D_BLITWSEGL.so.*"
> FILES_${PN}-flipwsegl =3D "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"
> FILES_${PN}-frontwsegl =3D "${libdir}/libpvrPVR2D_FRONTWSEGL.so.*"
> FILES_${PN}-linuxfbwsegl =3D "${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"
> -FILES_${PN}-x11wsegl =3D "${libdir}/libpvrPVR2D_X11WSEGL.so*"
> +FILES_${PN}-x11wsegl =3D "${libdir}/libpvrPVR2D_X11WSEGL.so* =
${bindir}/x* ${bindir}/*x"
> FILES_${PN}-driwsegl =3D "${libdir}/libpvrPVR2D_DRIWSEGL.so*"
>=20
> PACKAGES =3D+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 =
${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 =
${PN}-flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 =
${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 =
${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 =
${PN}-frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3 =
${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8 =
${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 =
${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-driwsegl-es2 =
${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 =
${PN}-driwsegl-es8"
> @@ -270,11 +270,11 @@ FILES_${PN}-linuxfbwsegl-es6 =3D =
"${libdir}/ES6*/libpvrPVR2D_LINUXFBWSEGL.so.*"
> FILES_${PN}-linuxfbwsegl-es8 =3D =
"${libdir}/ES8*/libpvrPVR2D_LINUXFBWSEGL.so.*"
> RRECOMMENDS_${PN}-linuxfbwsegl =3D " ${PN}-linuxfbwsegl-es2 =
${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 =
${PN}-linuxfbwsegl-es8"
>=20
> -FILES_${PN}-x11wsegl-es2 =3D =
"${libdir}/ES2*/libpvrPVR2D_X11WSEGL.so.*"
> -FILES_${PN}-x11wsegl-es3 =3D =
"${libdir}/ES3*/libpvrPVR2D_X11WSEGL.so.*"
> -FILES_${PN}-x11wsegl-es5 =3D =
"${libdir}/ES5*/libpvrPVR2D_X11WSEGL.so.*"
> -FILES_${PN}-x11wsegl-es6 =3D =
"${libdir}/ES6*/libpvrPVR2D_X11WSEGL.so.*"
> -FILES_${PN}-x11wsegl-es8 =3D =
"${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.*"
> +FILES_${PN}-x11wsegl-es2 =3D =
"${libdir}/ES2*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES2*/x* =
${bindir}/ES2*/*x"
> +FILES_${PN}-x11wsegl-es3 =3D =
"${libdir}/ES3*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES3*/x* =
${bindir}/ES3*/*x"
> +FILES_${PN}-x11wsegl-es5 =3D =
"${libdir}/ES5*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES5*/x* =
${bindir}/ES5*/*x"
> +FILES_${PN}-x11wsegl-es6 =3D =
"${libdir}/ES6*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES6*/x* =
${bindir}/ES6*/*x"
> +FILES_${PN}-x11wsegl-es8 =3D =
"${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES8*/x* =
${bindir}/ES8*/*x"
> RRECOMMENDS_${PN}-x11wsegl =3D " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 =
${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8"
>=20
> FILES_${PN}-driwsegl-es2 =3D =
"${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.*"
> @@ -286,10 +286,10 @@ RRECOMMENDS_${PN}-driwsegl =3D " =
${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driws
>=20
> CONFFILES_${PN} =3D "${sysconfdir}/powervr.ini"
>=20
> -FILES_${PN} =3D "${sysconfdir} ${libdir}/lib*.so.* ${libdir}/ES*/* =
${bindir}/pvrsrvinit ${bindir}/cputype ${bindir}/*/*"
> +FILES_${PN} =3D "${sysconfdir} ${libdir}/*.so* ${bindir}/pvrsrvinit =
${bindir}/cputype ${bindir}/*"
>=20
> FILES_xserver-kdrive-powervrsgx =3D "${bindir}/Xsgx"
> -FILES_${PN}-tests =3D "${bindir}/*"
> +FILES_${PN}-tests =3D "${bindir}/*test*"
> FILES_${PN}-dbg =3D "${libdir}/.debug/* ${bindir}/.debug/* \
>                    ${libdir}/ES*/.debug ${bindir}/*/.debug\
>                    ${bindir}/SGX/demos/*/.debug/* \

I'm not opposed to squashing these 2 together, I kept them apart for =
bisectability but I don't have a strong opinion on it. Let me know what =
you prefer :)

regards,

Koen=


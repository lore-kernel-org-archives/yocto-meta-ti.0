Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0F05E013A6
	for <meta-ti@yoctoproject.org>; Mon,  3 Sep 2012 02:54:11 -0700 (PDT)
Received: by eekd41 with SMTP id d41so2081262eek.35
	for <meta-ti@yoctoproject.org>; Mon, 03 Sep 2012 02:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=rDfi1edHVgJ43v20WzKlKVhbkKYpPzGbO6DFEffS6Cs=;
	b=kMOJBEIT/ZRfUkMVFIgSmVt2zFAPbEDKGvN09ln60653/p7NDh6x+3NSHCovK2GXQ4
	NwfoSjyjsRO41Sa2tzPZAR91nrxrQmrPXorhz2kX9RDCo1siOSsv7GL9xuTzMtElFRQr
	JftbPzgbmvUHJKyXInKO5RfHOllXZuw5Lbcr1M1nmHYED4iSwc1rQ9DjLNIEqys6dIg2
	sUxEjivMi8zd+RVdoWTT0Ug/XL8d93He4n+5NHfdCRTIFAXwbf75YmtsJvNDUDGYPmbe
	RO5qIq8/8rNkyeW4uDgRcEJm45+IV4T7jm0w2y+hACA99rEgj1l0Sc0DspV8aerUHSuj
	JHdA==
Received: by 10.14.212.72 with SMTP id x48mr20593966eeo.40.1346666050251;
	Mon, 03 Sep 2012 02:54:10 -0700 (PDT)
Received: from ?IPv6:2001:610:612::ad9f:f49a:8618:63e8?
	([2001:610:612:0:ad9f:f49a:8618:63e8])
	by mx.google.com with ESMTPS id i8sm34924668eeo.16.2012.09.03.02.54.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 02:54:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346665189-10535-1-git-send-email-fcooper27jr@gmail.com>
Date: Mon, 3 Sep 2012 11:54:05 +0200
Message-Id: <F45EF99D-D3F7-4CB3-91A7-DDA8C014A727@dominion.thruhere.net>
References: <1346665189-10535-1-git-send-email-fcooper27jr@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQlrz1FD0HM1PpGBYXZ0/pNR7m10Rn4kcyldpYxhRFhFKkILSPHFPFXC+7tcEcWYTMLegYNI
Subject: Re: [PATCH v2] libgles-omap3: Pull in changes from arago to meta-ti
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
X-List-Received-Date: Mon, 03 Sep 2012 09:54:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 sep. 2012, om 11:39 heeft Franklin S. Cooper Jr =
<fcooperjr27@gmail.com> het volgende geschreven:
>=20
> -=09
> +    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir} || true
> +    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/ || true

IIRC this is going to generate some file conflicts and in OE-classic we =
pointed qt to the proper place for the includes. Has something changed =
since then?=


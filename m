Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29B20E0146D
	for <meta-ti@yoctoproject.org>; Tue,  4 Sep 2012 01:28:02 -0700 (PDT)
Received: by wgbfm10 with SMTP id fm10so2529412wgb.5
	for <meta-ti@yoctoproject.org>; Tue, 04 Sep 2012 01:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Zhz3B0ExG+2E/IeDugru17kBotEDN8yUDIiAA57ATJw=;
	b=RjAVkX7lHulMiDD0dXzHp3th7vOP7Oyn4YDkG8x5P1Zvq4LgCdhXDNC51NGU7fIm0w
	5kx6n0m2ib5bS+F1w7FznJRpylzqHkrnFBgTe/BReP/HdyWp7rhiRROPnwcLaVClSLa+
	IJmoQW7VssBU+0vbXV9+Xw0PYuefUI1CulDeTv59A7tGMX17dqGewXx5+3IWWZxeYDKI
	1X2OReOpQtctqyUI8T9v08t08uXUpwSiGgCGQP/qR5lX0Qffeoq8XIZp51I7RV21WkqX
	F1eWl7Iz9YMCv8hf4F28DbPeRA9cLQcWMdCe4G05Pz8XlTRtz3bYzgXsu9pT6ACn7gL7
	hTpQ==
Received: by 10.217.0.144 with SMTP id l16mr10549176wes.120.1346747281775;
	Tue, 04 Sep 2012 01:28:01 -0700 (PDT)
Received: from [172.20.0.49] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id el6sm23353451wib.8.2012.09.04.01.27.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 01:28:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2B3E93@DFLE09.ent.ti.com>
Date: Tue, 4 Sep 2012 10:28:19 +0200
Message-Id: <81DF8557-307C-43CF-9E46-4CA3F7C41A30@dominion.thruhere.net>
References: <1346665309-10837-1-git-send-email-fcooper27jr@gmail.com>
	<C65364BD-A83A-4A63-AEC3-3DAC96A979B3@dominion.thruhere.net>
	<8F29D6B095ED194EA1980491A5E029710C2B3E93@DFLE09.ent.ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQnY2sSpe5WY9JzelByrT5nXupLz4Sp/ekzpjt4VbqYb9RsObCkgG5aArQNLQKp3nwAOi7un
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] libgles-omap3: Add new 4.06.00.02 version.
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
X-List-Received-Date: Tue, 04 Sep 2012 08:28:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 sep. 2012, om 12:13 heeft "Cooper Jr., Franklin" <fcooper@ti.com> =
het volgende geschreven:

>=20
>=20
> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org =
[mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Koen Kooi
> Sent: Monday, September 03, 2012 4:56 AM
> To: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] libgles-omap3: Add new 4.06.00.02 =
version.
>=20
>=20
> Op 3 sep. 2012, om 11:41 heeft Franklin S. Cooper Jr =
<fcooperjr27@gmail.com> het volgende geschreven:
>=20
>> * Add a new version of the Graphics SDK. There are a few changes in=20=

>> the  Graphics SDK that need to be investigated to determine if it=20
>> impacts  someone who is trying to use X11. This recipe should work=20
>> fine  for non X11 users. Therefore, the DEFAULT_PREFERENCE will be -1=20=

>> until  it is clear that X11 users arent negatively impacted and any=20=

>> needed  changes in libgles-omap3.inc are made.
>=20
> What's the timeframe for such tests?
>=20
> I plan on leaving the DEFAULT_PREFERENCE at -1 until we can ensure =
that X11 issues are sorted out. I am not even sure if there really is an =
issue.. All I know is libpvrPVR2D_X11WSEGL OpenGLES2 was being used in =
the 4.05 version but no longer exists in this newer version. The only =
version of libpvrPVR2D_X11WSEGL that exist is for OpenVG. I was told by =
the graphics team that libpvrPVR2D_X11WSEGL is deprecated and =
libpvrPVR2D_DRIWSEGL should be used instead. Is this a non issue?

Here's my limited understanding of the wsegl stuff:

X11wsegl is a 'dumb' way to make it work with x11. It will tell X11 the =
rect coordinates to draw a window border and nothing more. The rendering =
still happens to the framebuffer. No context locking, nothing.
Driwsegl uses DRI for rendering and need a proper Xorg module to work, =
it features locking and stuff so you can have multiple clients.=20

Roger Monk had it working a few months ago on omap4, but I don't know =
what he had to do to make it work. I hope it is as simple as rebuilding =
the sgxkernel modules with SUPPORT_XORG=3D1 (actually dri) and =
installing the binary Xorg module.

regards,

Koen=


Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23509E01370
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 04:53:44 -0800 (PST)
Received: by werf1 with SMTP id f1so1503251wer.35
	for <meta-ti@yoctoproject.org>; Thu, 09 Feb 2012 04:53:43 -0800 (PST)
Received: by 10.180.90.194 with SMTP id by2mr2664676wib.5.1328792023873;
	Thu, 09 Feb 2012 04:53:43 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dw7sm6569731wib.4.2012.02.09.04.53.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 04:53:42 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F33BE16.2080802@gmail.com>
Date: Thu, 9 Feb 2012 13:53:41 +0100
Message-Id: <C07F39F8-891A-4122-A6A6-844C5EA55C09@dominion.thruhere.net>
References: <4F33BE16.2080802@gmail.com>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQl5JIG/XHqX5vIKijmszZQe1brtnKmjIuKwY1P5nKlaGxATCL/PImx+td5Yd1GNAkW0YPNt
Subject: Re: build error on machine omap4330-panda
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
X-List-Received-Date: Thu, 09 Feb 2012 12:53:45 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 9 feb. 2012, om 13:37 heeft jfabernathy het volgende geschreven:

> While trying to build core-image-sato for machine=3D omap4430-panda, =
I'm getting a build error a good ways into the build.  My bblayers.conf =
file just adds meta-ti and my local.conf is standard with the following =
key lines:
>=20
> MACHINE ??=3D "omap4430-panda"
> BBMASK =3D ".*/meta-ti/recipes-misc/"
>=20
> The error I'm getting with bitbake -D -v core-image-sato is below and =
I've attached the log.do_compile_perf file.
>=20
> Anyone know the fix?  Not sure the all warings being treated as errors =
message.

Like I said, follow the instructions in the README. That sets up the =
right toolchain for everything *and* it sets up things to support 3d and =
multimedia.=


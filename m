Return-Path: <prabu@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64E6AE013EC
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 22:03:10 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5K538qZ017359;
	Thu, 20 Jun 2013 00:03:09 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5K53557005539;
	Thu, 20 Jun 2013 00:03:06 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Thu, 20 Jun 2013 13:03:05 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Nicolas Dechesne
	<nicolas.dechesne@linaro.org>
Thread-Topic: [meta-ti] meta-ti + meta-qt5
Thread-Index: AQHObVqT/YaZ9CP6NE+JbReVJZTnfJk92rPA//+C4ACAAIgUgP//kvWAgACKc+D//35XgAAAUI6AABDdoUA=
Date: Thu, 20 Jun 2013 05:03:04 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB53340@DBDE04.ent.ti.com>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
	<CAP71WjztrzWx6K-MNG4RQfeu0V6F45M0_0j5WP0zZjt9s9i17A@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53158@DBDE04.ent.ti.com>
	<CAP71WjzqEVcxwpwvMc9V-106b2Qyq5uc-x2erf_B7AZXeBQ2Zw@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53242@DBDE04.ent.ti.com>
	<CAP71WjwHYuFPa2ieAh+WbPMnYNt2AC5rx8GP-+7U2Q-RwoOBYQ@mail.gmail.com>
	<20130620045521.GR13356@edge>
In-Reply-To: <20130620045521.GR13356@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: meta-ti + meta-qt5
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
X-List-Received-Date: Thu, 20 Jun 2013 05:03:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have validated libgles-omap3 on the AMSDK 5.07 build configuration (that =
does not have X11 enabled), so what you faced may be a different issue on t=
he libgles front.

I would wait for the verbose log from Nicolas for the qt5 issue he faced,

regards,
Prabu


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, June 20, 2013 10:25 AM
To: Nicolas Dechesne
Cc: Sundareson, Prabindh; meta-ti@yoctoproject.org
Subject: Re: [meta-ti] meta-ti + meta-qt5

On Thu, Jun 20, 2013 at 12:46:21AM -0400, Nicolas Dechesne wrote:
> On Thu, Jun 20, 2013 at 12:34 AM, Sundareson, Prabindh <prabu@ti.com> wro=
te:
>=20
> > The instructions build eglfs as well (without xcb), as in the below pat=
ch.
> > Just that I cannot test it on platform due to the absence of GLES2 driv=
er.
> >  verbose flag in the qt configuration (qt5.inc) would help debug=20
> > what is going wrong.****
> >
> > ** **
> >
> >
> > https://github.com/prabindh/meta-qt5/commit/c8129fb5057f9254c773f82d
> > 2fdbd85d9c56410a
> > ****
> >
> >
> yeah, i am using something similar *but* i do not have x11 in=20
> DISTRO_FEATURES, and i suspect you might have it, right? without X11=20
> feature, the x11 -dev packages are pulled/installed, and then the=20
> qtbase configure script will fail to 'check' for EGL.

Heh, I was having similar issues with Prabu's recent libgles-omap3 patches.=
=20
It would try to pull x11 packages due to -dev dependencies and complain tha=
t DISTRO_FEATURES lacks X11 setting... It's not exactly the same issue, but=
 seems related.

--
Denys


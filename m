Return-Path: <prabu@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4DEBE01400
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 19:45:14 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5K2jB3O021611;
	Wed, 19 Jun 2013 21:45:12 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5K2j8US020449;
	Wed, 19 Jun 2013 21:45:09 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Thu, 20 Jun 2013 10:45:08 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] meta-ti + meta-qt5
Thread-Index: AQHObVqT/YaZ9CP6NE+JbReVJZTnfJk92rPA//98+ICAAIZ0oA==
Date: Thu, 20 Jun 2013 02:45:07 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB5312E@DBDE04.ent.ti.com>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
	<20130620021658.GO13356@edge>
In-Reply-To: <20130620021658.GO13356@edge>
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
X-List-Received-Date: Thu, 20 Jun 2013 02:45:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Yes, Getting Qt5 (specifically, qtbase) with eglfs (and next kms) with meta=
-qt5 + meta-ti is the goal.

regards,
Prabu

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, June 20, 2013 7:47 AM
To: Sundareson, Prabindh
Cc: Nicolas Dechesne; meta-ti@yoctoproject.org
Subject: Re: [meta-ti] meta-ti + meta-qt5

Prabu,

Do you have any plans extending it in meta-ti?

--=20
Denys


On Thu, Jun 20, 2013 at 02:09:42AM +0000, Sundareson, Prabindh wrote:
> Are you asking about the status in general (ie, outside of the yocto=20
> infrastructure) ? In general, eglfs,kms has been proven working for more=
=20
> than a year now.
>=20
> Within meta-ti, eglfs should work if the display driver is available (fb =
or=20
> drm). The only reason I stopped at "minimal" on Beaglebone was because th=
e=20
> "display" driver part was not integrated at that time on Beaglebone (in=20
> meta-ti) and hence OpenGL ES driver couldn't be installed.
>=20
> regards,
> Prabindh
>=20
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproje=
ct.org] On Behalf Of Nicolas Dechesne
> Sent: Thursday, June 20, 2013 7:34 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] meta-ti + meta-qt5
>=20
> hi there,
>=20
> not sure if this is the right place to ask... but since i am about to ask=
 about QT5, OE and TI platforms, i am starting here!
>=20
> so, i read a couple of blog posts about getting Qt5 on beaglebone, howeve=
r it's not clear to me what's the latest status is. has anybody been able t=
o use/enable OpenGLes either with KMS, or directfb or eglfs platform driver=
? The only thing i have seen are references to using the 'minimal' platform=
 driver.
>=20
> if so, can i get some pointers?
>=20
> thanks!
>=20
> nicolas

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti



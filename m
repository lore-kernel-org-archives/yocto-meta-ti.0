Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 11510E003FA; Fri, 18 Jul 2014 08:31:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBF2CE00342
	for <meta-ti@yoctoproject.org>; Fri, 18 Jul 2014 08:31:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6IFUwl0001768;
	Fri, 18 Jul 2014 10:30:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IFUwSw003530;
	Fri, 18 Jul 2014 10:30:58 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Fri, 18 Jul 2014 10:30:58 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, meta-ti mailing list
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] curious about libdrm-2.4.41 recipe from meta-ti layer
Thread-Index: AQHPon6INdUG9Xypa0CAJwNGyFpdiZul80FA
Date: Fri, 18 Jul 2014 15:30:57 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D15411B@DLEE11.ent.ti.com>
References: <alpine.LFD.2.11.1407180737270.9890@localhost>
In-Reply-To: <alpine.LFD.2.11.1407180737270.9890@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: curious about libdrm-2.4.41 recipe from meta-ti layer
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
X-List-Received-Date: Fri, 18 Jul 2014 15:31:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Robert P. J. Day
>Sent: Friday, July 18, 2014 6:47 AM
>To: meta-ti mailing list
>Subject: [meta-ti] curious about libdrm-2.4.41 recipe from meta-ti
>layer
>
>
>  i was perusing a number of yocto layers looking for cool
>examples to
>use in an upcoming class and ran across this oddity in the meta-ti
>layer:
>
>recipes-graphics/drm/libdrm_2.4.41.bb:
>  FILESEXTRAPATHS_append :=3D ":${COREBASE}/meta/recipes-
>graphics/drm/libdrm"
>
>  in all of the layers i've looked at, that is the only example of
>*appending* to FILESEXTRAPATHS i've ever seen, so i thought i'd
>look
>closer to see what was going on.
>
>  even though oe-core defines a libdrm recipe file, the meta-ti
>layer
>doesn't use a bbappend for its version. rather, it explicitly adds
>the
>libdrm/ directory from oe-core using a reference to ${COREBASE},
>then
>adds its own files. that's valid, i guess, it just looks weird and
>is
>the only time i've ever seen that.

The recipe also defines using a TI version of libdrm (I don't like that but=
 it is what we have been given from the component team doing this).  So the=
 intent here is to:

1. Define a libdrm that uses the TI modified sources.
2. Use the recipe only for the omap-a15 devices and make that an explicit s=
etting by setting default preference to -1.

This wasn't done as an append because we wanted this only for omap-a15 devi=
ces when explicitely set as the preferred version to use and not impact oth=
er devices using the later version from oe-core.

As for the reference to COREBASE it is to pick up the GNU_SOURCE_definition=
.patch file rather than overlaying that as well.

>
>  i'm also puzzled that the meta-ti recipe sets:
>
>DEFAULT_PREFERENCE =3D "-1"
>
>what's that for?  given that the oe-core layer already defines a
>recipe for libdrm that has a higher version number, why would the
>above line be necessary?
>
>  just trying to understand the rationale behind this unusual
>construction.
>
>rday
>
>--
>
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=3D=3D=3D=3D=3D=3D
>Robert P. J. Day                                 Ottawa, Ontario,
>CANADA
>                        http://crashcourse.ca
>
>Twitter:
>http://twitter.com/rpjday
>LinkedIn:
>http://ca.linkedin.com/in/rpjday
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=3D=3D=3D=3D=3D=3D
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti


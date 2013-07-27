Return-Path: <prabu@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3AEF5E01405
	for <meta-ti@yoctoproject.org>; Fri, 26 Jul 2013 19:20:34 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6R2KSeR008418;
	Fri, 26 Jul 2013 21:20:29 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6R2KObL015121;
	Fri, 26 Jul 2013 21:20:26 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Sat, 27 Jul 2013 10:20:24 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Christian Gagneraud <chgans@gna.org>
Thread-Topic: [meta-ti] [Qt5] mkspecs/devices: beagleboard == am335x ?
Thread-Index: AQHOiYiu91wrpcNEl0iZ6vuxRof9JZl27t+AgADcges=
Date: Sat, 27 Jul 2013 02:20:24 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB80C27@DBDE04.ent.ti.com>
References: <51F1AA6E.4050607@gna.org>,<20130726210641.GF3558@edge>
In-Reply-To: <20130726210641.GF3558@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.92]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [Qt5] mkspecs/devices: beagleboard == am335x ?
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
X-List-Received-Date: Sat, 27 Jul 2013 02:20:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The device approach is useful for adding platform specific hooks for eglfs =
via EGLFS_PLATFORM_HOOKS_SOURCES, so it is a good thing. So it is more of a=
 convenience/cleaner way, than anything related to performance.


regards
Prabindh
________________________________________
From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] o=
n behalf of Dmytriyenko, Denys
Sent: Saturday, July 27, 2013 2:36 AM
To: Christian Gagneraud
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [Qt5] mkspecs/devices: beagleboard =3D=3D am335x ?

On Fri, Jul 26, 2013 at 10:45:02AM +1200, Christian Gagneraud wrote:
> Hi there,
>
> In qtbase sources, there are a couple of "device" definitions files,
> according to [1], this greatly help cross-compiling qt5.
> This device file specify things for CPU and GPU optimisations. So
> basically these files are tightly coupled with BSP providers.
>
> One of them is linux-beagleboard-g++ [2], is it appropriate to use
> this one for AM335x based platform as well?
>
> The meta-qt5 layer doesn't seem to use this feature, but if it did,
> would this device config files help to get an optimised Qt5 build
> for TI SoCs? Especially, would that help to get OpenGL stuff sorted
> out?
>
> Regards,
> Chris
>
> [1] http://blog.qt.digia.com/blog/2012/04/13/cross-compiling-qt-for-the-m=
asses/
> [2] https://qt.gitorious.org/qt/qtbase/trees/stable/mkspecs/devices/linux=
-beagleboard-g++

Chris,

Looking at those files shows very basic compiler optimization flags being s=
et,
-march, -mtune, -mfpu etc. I don't see any GL or GPU specifics in there. It
also hardcodes things like soft-fp, which is not good. All this stuff is
alredy taken care of by the build framework and I'm sure meta-qt5, like the
old qt4, sets all the right COMPILER_FLAGS to get the most performance from
the target CPU.

--
Denys
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


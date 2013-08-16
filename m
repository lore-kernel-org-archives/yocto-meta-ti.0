Return-Path: <prabu@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4CE0E01412
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 19:37:31 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7G2bQk7021674;
	Thu, 15 Aug 2013 21:37:27 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7G2bMCp019515;
	Thu, 15 Aug 2013 21:37:24 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Fri, 16 Aug 2013 10:37:22 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: Christian Gagneraud <chgans@gna.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Qt/TI question
Thread-Index: AQHOmiRGzcD6IayT1kGhTVCtwEdWM5mXHSDw
Date: Fri, 16 Aug 2013 02:37:21 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB96F06@DBDE04.ent.ti.com>
References: <520D8773.1050307@gna.org>
In-Reply-To: <520D8773.1050307@gna.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: Qt/TI question
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
X-List-Received-Date: Fri, 16 Aug 2013 02:37:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes - that would be the goal, and we can review the patches as well.

The meta-qt5 recipes will also be changed, so ensure they are copied in the=
 discussions,

regards,
Prabu


-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Christian Gagneraud
Sent: Friday, August 16, 2013 7:29 AM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] Qt/TI question

Hi there,

This is a bot off-topic, so if you know a better mailing list for this kind=
 of things, please let me know.

I'm thinking about making a request on the qt-devel mailing list, and of co=
urse I am willing to provide work to get this feature working.

Qt comes with a list of supported devices [1], of which are the beagleboard=
 and the pandaboard. It would be nice to have as well the beaglebone. A sim=
ple first step would be to add a mkspecs to the qt-platform-mkspec project =
[2].

Up to know, this is all off-topic, but:
The mkspecs simply specify compiler flags (C, CPP and LD) and point to a cr=
oss-toolchain. [3] is the example for omap3430.
I don't know who wrote that one, but it refers to a "beagle-narc-rootfs"=20
and a Code Sourcery "arm-2010q1" (I assume it is CS because of the "q1"=20
part).

And that's where meta-ti/arago could step in, because it is a toolchain/roo=
tfs provider for TI SoCs.

Right now, I'm trying to build arago/dylan SDK with gles support. If it wor=
ks, then the generated SDK could be used to allow building Qt4/5 out of yoc=
to via the qt-platform-mkspecs.

Once this is showed to be working, a pull request could be made to qt-platf=
orm-mkspecs, and start a discussion on having the beaglebone added to the l=
ist of supported device and add a page on qt-project wiki a bit like the on=
e for the beagleboard[4].

Any thoughts or suggestions?

Chris

[1] http://qt-project.org/wiki/Category:Devices
[2] http://gitorious.org/qt-platform-mkspecs
[3]
http://gitorious.org/qt-platform-mkspecs/qt-platform-mkspecs/blobs/master/5=
.0/linux-omap3430-g++/qmake.conf
[4] http://qt-project.org/wiki/TIBeagleBoard
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


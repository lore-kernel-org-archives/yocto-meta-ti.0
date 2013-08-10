Return-Path: <prabu@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 260E8E00406
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 03:08:19 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7AA8CWI011034;
	Sat, 10 Aug 2013 05:08:13 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7AA89S6021840;
	Sat, 10 Aug 2013 05:08:10 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Sat, 10 Aug 2013 18:08:09 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: Kovesdi Gyorgy <kgy@teledigit.eu>, meta-ti mailing list
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] How to compile omap3-sgx-modules_4.09.00.01
Thread-Index: AQHOlbBccpF5VfqMmEy26ID+B8qtM5mON4Ww
Date: Sat, 10 Aug 2013 10:08:08 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB8E6DA@DBDE04.ent.ti.com>
References: <1687303.zqgYtDvr2z@kgy-pc>
In-Reply-To: <1687303.zqgYtDvr2z@kgy-pc>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.49]
MIME-Version: 1.0
Subject: Re: How to compile omap3-sgx-modules_4.09.00.01
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
X-List-Received-Date: Sat, 10 Aug 2013 10:08:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It appears you are trying to build a drm driver - correct ?
________________________________________
From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] o=
n behalf of Kovesdi Gyorgy [kgy@teledigit.eu]
Sent: Saturday, August 10, 2013 4:28 PM
To: meta-ti mailing list
Subject: [meta-ti] How to compile omap3-sgx-modules_4.09.00.01

Hi,

I tried to compile recent versions (4.08 or 4.09) of SGX modules for my
Beagleboard-C4 using the current Yoctoproject environment (tried Poky,
beagleboard-dylan-9.0.0, and Angstrom Linux with the same result).

In every case i got this error message:

| make[3]: *** No rule to make target
`/home/kgy/work/Yocto/poky/build/out/work/beagleboard-poky-linux-
gnueabi/omap3-sgx-modules/4.09.00.01-
r124a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm=
_auth.o',
needed by `/home/kgy/work/Yocto/poky/build/out/work/beagleboard-poky-linux-
gnueabi/omap3-sgx-modules/4.09.00.01-
r124a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm=
.o'.
Stop.

Please help me to compile it!

Thanx in advance
Gy=F6rgy K=F6vesdi

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


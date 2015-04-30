Return-Path: <craig.mcqueen@innerrange.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE775E0098D; Wed, 29 Apr 2015 17:50:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from remote.innerrange.com (122-143-146.dsl.connexus.net.au
	[203.122.143.146])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F8A0E007CC
	for <meta-ti@yoctoproject.org>; Wed, 29 Apr 2015 17:50:16 -0700 (PDT)
Received: from IR-CENTRAL.corp.innerrange.com ([fe80::758b:a6c:a61b:18f4]) by
	IR-CENTRAL.corp.innerrange.com ([fe80::758b:a6c:a61b:18f4%14]) with
	mapi; Thu, 30 Apr 2015 10:50:14 +1000
From: Craig McQueen <craig.mcqueen@innerrange.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Date: Thu, 30 Apr 2015 10:50:12 +1000
Thread-Topic: Error when recompiling linux-ti-staging kernel
Thread-Index: AdCC3sMO+KII47iZRUiV2+QhpHRI4Q==
Message-ID: <5500469A22567C4BAF673A6E86AFA3A402227F4FAA84@IR-CENTRAL.corp.innerrange.com>
Accept-Language: en-US, en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, en-AU
x-tm-as-product-ver: SMEX-11.1.0.1239-7.500.1018-21510.006
x-tm-as-result: No--39.361800-5.000000-31
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Subject: Error when recompiling linux-ti-staging kernel
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
X-List-Received-Date: Thu, 30 Apr 2015 00:50:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm using meta-ti with Poky dizzy to build linux-ti-staging 3.14.x for a Be=
agleBone Black based system.

When I do a rebuild of linux-ti-staging, it does most of the compile but th=
en fails with an error:

| touch: cannot touch '/home/craigm/yocto/poky/<boardname>/tmp/work/<boardn=
ame>-poky-linux-gnueabi/linux-ti-staging/3.14.39-r22b+gitrAUTOINC+ba552b4bc=
7/image/lib/modules/3.14.39/build': Permission denied
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compileconfigs (log file is located at /home/c=
raigm/yocto/poky/<boardname>/tmp/work/<boardname>-poky-linux-gnueabi/linux-=
ti-staging/3.14.39-r22b+gitrAUTOINC+ba552b4bc7/temp/log.do_compileconfigs.4=
657)

Checking that file, I find that it's a symlink that points to /usr/src/kern=
el, which doesn't exist.

My current work-around is to do "bitbake linux-ti-staging -c clean" then re=
build my image. It works fine as long as it's a fresh build. But that slows=
 down the development cycle.

Why might this be happening?

--=20
Craig McQueen



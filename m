Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA15CE00D26; Tue, 11 Oct 2016 03:01:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 484 seconds by postgrey-1.32 at yocto-www;
	Tue, 11 Oct 2016 03:01:00 PDT
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF43CE00CEA
	for <meta-ti@yoctoproject.org>; Tue, 11 Oct 2016 03:01:00 -0700 (PDT)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 06C6D68A019; Tue, 11 Oct 2016 10:52:55 +0100 (BST)
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 96CB568A019;
	Tue, 11 Oct 2016 10:52:55 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 499DE674006F;
	Tue, 11 Oct 2016 11:52:55 +0200 (CEST)
To: meta-ti@yoctoproject.org
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <895883cb-edbd-a729-769b-46483e4cd6e1@mlbassoc.com>
Date: Tue, 11 Oct 2016 11:52:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
Subject: Can't build for BeagleBone
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
X-List-Received-Date: Tue, 11 Oct 2016 10:01:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Using (Poky/Yocto):

Build Configuration:
BB_VERSION        = "1.31.2"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "universal"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "poky"
DISTRO_VERSION    = "2.1+snapshot-20161011"
TUNE_FEATURES     = "arm armv7a vfp thumb neon       callconvention-hard"
TARGET_FPU        = "hard"
meta              = "master:b9d6a7cc234f44e44e5421191924b7463e9c0a9d"
meta-ti           = "master:48ffe2b2da9b44cdb0ce055c008ab21843ec98b3"
meta-poky         = "master:b9d6a7cc234f44e44e5421191924b7463e9c0a9d"

I get this error:

| 
/local/bbb_2016-10-11/tmp/work/beaglebone-poky-linux-gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+bbfdf926a1-r21/git/tools/mkenvimage.c: 
In function 'main':
| 
/local/bbb_2016-10-11/tmp/work/beaglebone-poky-linux-gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+bbfdf926a1-r21/git/tools/mkenvimage.c:120:35: 
error: 'PLAIN_VERSION' undeclared (first use in this function)
|     printf("%s version %s\n", prg, PLAIN_VERSION);
|                                    ^
| 
/local/bbb_2016-10-11/tmp/work/beaglebone-poky-linux-gnueabi/u-boot-ti-staging/2016.05+gitAUTOINC+bbfdf926a1-r21/git/tools/mkenvimage.c:120:35: 
note: each undeclared identifier is reported only once for each function it appears in
| scripts/Makefile.host:111: recipe for target 'tools/mkenvimage.o' failed

I was able to build with this configuration in late September, so the changes
in early October to .../meta-ti/recipes-bsp/u-boot must be involved.

I'll look into the details, but in the meantime does anyone have suggestions?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.22])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id F067FE0030F
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 17:39:58 -0800 (PST)
Received: (qmail invoked by alias); 21 Jan 2012 01:39:55 -0000
Received: from p4FDF004E.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.0.78]
	by mail.gmx.net (mp008) with SMTP; 21 Jan 2012 02:39:55 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/ocA0QhkrorOjdxUWWEQNPEzkIWg4TBcoN404ANQ
	28Z9D3tOII3xJJ
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Sat, 21 Jan 2012 02:41:23 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201201210241.24183.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: omap3-sgx-modules build is broken
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
X-List-Received-Date: Sat, 21 Jan 2012 01:39:59 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

when building omap3-sgx-modules, build breaks on do_patch because source-dir is 
almost empty. I checked a bit: seems ti-eula-unpack does not start the installer 
properly. In log.do_unpack I see only log created by base_do_unpack:

NOTE: Unpacking 
/home/Superandy/data/Downloads/packets/dl/Graphics_SDK_setuplinux_4_03_00_02.bin 
to /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/omap3-
sgx-modules-1.6.16.3977-r115a/
NOTE: Unpacking /home/Superandy/data/oe-core/sources/meta-ti/recipes-
bsp/powervr-drivers/omap3-sgx-modules/Compile-fixes-for-38-kernel.patch to 
/home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/omap3-sgx-
modules-1.6.16.3977-r115a/
NOTE: Unpacking /home/Superandy/data/oe-core/sources/meta-ti/recipes-
bsp/powervr-drivers/omap3-sgx-modules/kernel-30.patch to /home/Superandy/tmp/oe-
core-eglibc/work/overo-angstrom-linux-gnueabi/omap3-sgx-modules-1.6.16.3977-
r115a/

I added some print here and there but I am afraid my python is too limited to 
jump into this further.

Regards

Andreas


Return-Path: <miroslav.kes@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E48BE00543; Mon,  7 Jul 2014 06:36:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (miroslav.kes[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.181 listed in list.dnswl.org]
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D956BE0030B
	for <meta-ti@yoctoproject.org>; Mon,  7 Jul 2014 06:36:02 -0700 (PDT)
Received: by mail-ig0-f181.google.com with SMTP id h15so4342035igd.8
	for <meta-ti@yoctoproject.org>; Mon, 07 Jul 2014 06:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=Bf1w24FBNokc/eG18+/BZUw/isqTw5LsU8kJvdXbzs8=;
	b=nf/Ixpea5ynfTGDXFzh43K0DH+7vaHEB8WHHMM98d4Zmknhu6IIBXIpNIYSl1P7d1V
	/9dC+O7BVkf9arQHQsm6Nr+vGIADLOJZLiLaMurVuGBC1U1aWWF1rAS0+VKcLTTXtEN0
	1Nvq+kD5ohoP/W/oIpyukIqzZq9kTCnjj3VkA76hKM95hDEycJWT73r7MmbytNjS/mfI
	QbXXWu+Ak6z/ORxpw/Gfrl5AtzbKrS+lD37hGtGx8FRcUhCc1SvaOGw3N5jjJ6k6TFAA
	KZjU3UwhswhWi9u2f+jcL1Nq9cNqLXFJbflF2+V5hT/2RHHXTHYHXx0jQ1Nui9Bg2kAq
	QlHA==
X-Received: by 10.50.57.7 with SMTP id e7mr38529546igq.47.1404740161418;
	Mon, 07 Jul 2014 06:36:01 -0700 (PDT)
Received: from [10.70.139.6] ([205.175.202.246])
	by mx.google.com with ESMTPSA id
	d10sm79784008igz.11.2014.07.07.06.36.00
	for <meta-ti@yoctoproject.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Jul 2014 06:36:00 -0700 (PDT)
Message-ID: <53BAA233.4030803@gmail.com>
Date: Mon, 07 Jul 2014 15:35:47 +0200
From: =?windows-1252?Q?Miroslav_Ke=9A?= <miroslav.kes@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: BeagleBoard / Beagleboard-xM build
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
X-List-Received-Date: Mon, 07 Jul 2014 13:36:14 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hi!

I tried to build the kernel plus core-image-minimal for BeagleBoard using just 

BBLAYERS ?= " \
  ${OEBASE}/meta-ti \
  ${OEBASE}/openembedded-core/meta \
  "
The build completed OK but the boot process hangs on both BeagleBoard and Beagleboard-xM after
the "booting the kernel" message (see the output bellow).

I have spent 3 days googling on potential reasons. I found some people having similar problems but it looks like the kernel debugging options are turned on in the kernel configuration and the ttyO2 should be OK for kernel 3.2.28

I would appreciate if someone could answer these questions:

1) Is it good idea trying to build the BeagleBoard distro using just meta-ti and openembedded-core (i.e. without Angstrom)?
2) Is there particular combination of meta-ti and openembedded-core versions that should be used?
3) What is the relationship between meta-ti and meta-beagleboard (it looks like meta-ti supports beagleboards while meta-beagleboard supports beaglebone)

Any hints would be really welcome

Mira

---------------------------------------------------------------------

Welcome to minicom 2.6

OPTIONS: I18n 
Compiled on Nov 18 2013, 11:01:02.
Port /dev/ttyS0

Press CTRL-A Z for help on special keys

...40V...þ
U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 02 2014 - 14:36:18)
Texas Instruments Revision detection unimplemented
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 02 2014 - 14:36:18)

OMAP3530-GP ES3.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mHz
OMAP3 Beagle board + LPDDR/NAND
I2C:   ready
DRAM:  256 MiB
WARNING: Caches not enabled
NAND:  256 MiB
MMC:   OMAP SD/MMC: 0
In:    serial
Out:   serial
Err:   serial
Beagle Rev C1/C2/C3
timed out in wait_for_pin: I2C_STAT=0
I2C read: I/O error
Unrecognized expansion board: 0
timed out in wait_for_pin: I2C_STAT=0
I2C read: I/O error
Unrecognized expansion board: 0
Die ID #5ac400030000000004013f8901001001
Net:   Net Initialization Skipped
No ethernet found.
Hit any key to stop autoboot:  0 
OMAP3 beagleboard.org # mmc rescan
OMAP3 beagleboard.org # setenv bootargs console=ttyO2,115200n8 root=/dev/mmcblk0p2 rw rootdelay=1
OMAP3 beagleboard.org # fatload mmc 0:1 0x80000000  uImage
reading uImage

4337768 bytes read
OMAP3 beagleboard.org # bootm 0x80000000
## Booting kernel from Legacy Image at 80000000 ...
   Image Name:   Linux-3.2.28
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    4337704 Bytes = 4.1 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.


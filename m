Return-Path: <wmills@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58319E0056D; Thu, 23 Aug 2018 18:42:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBCC1E003D7
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 18:42:42 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7O1gfmB001258;
	Thu, 23 Aug 2018 20:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535074962;
	bh=BMptGPvq9i1gLVWfboS6gAscuWdGIkjrGj8Rg5HUnKQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=JovFQXxOzVpN86zDMPFw0LwCoRSjHQwawPSBT0Xa+ZscciKqCV+H0BDSfl8LsVeyi
	/lSaAfbI88OeLj9rh5kBo3fFCpBlFEaBH46iRfM8+/uplmjmH5U+oEBcP0vluxq7pw
	Iay0UM4exfSrFGSZJf/+Hs/L2a+ZZZPYIhdqzbrY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7O1gY55007042;
	Thu, 23 Aug 2018 20:42:41 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 23 Aug 2018 20:42:35 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 23 Aug 2018 20:42:35 -0500
Received: from [10.0.2.15] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7O1gZvO003627;
	Thu, 23 Aug 2018 20:42:35 -0500
To: Leo Meza <leo.e.meza@gmail.com>, <meta-ti@yoctoproject.org>
References: <CADrbpyyMX+hnshPQN7yVbB1UBdopKiHFD-Nqh=MVqyVohgqYAA@mail.gmail.com>
From: William Mills <wmills@ti.com>
Message-ID: <2cf7ae74-ad2e-38b4-bb34-a2cf7c6a97d4@ti.com>
Date: Thu, 23 Aug 2018 21:42:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CADrbpyyMX+hnshPQN7yVbB1UBdopKiHFD-Nqh=MVqyVohgqYAA@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: Getting Started with meta-ti "rocko" and beaglebone black (BBB)
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
X-List-Received-Date: Fri, 24 Aug 2018 01:42:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Leo,

On 08/22/2018 02:18 PM, Leo Meza wrote:
> I'm learning yocto and was able to easily boot my BBB with a
> core-image-minimal system using the meta-yocto-bsp layer. However, when
> I removed that layer and tried with meta-ti, I just see this on the
> Putty serial console, it repeats over an over:
> 
> U-Boot SPL 2018.01-g6d540394a4 (Aug 22 2018 - 16:33:01)
> Trying to boot from MMC1
> *** Warning - bad CRC, using default environment
> 

I was able to duplicate this result when using meta-ti to build the
"beaglebone" machine.

TI builds and test the am335x-evm machine for all am335x based boards
inlcuding beaglebone.  If you switch to this machine you should have
better luck.

Note that as Denys said elsewhere TI images and default u-boot variable
settings assume that the kernel is in the root partition not the boot
partition.  The _path_ in the root partition should be /boot/zImage

The only thing you need in the boot partition is MLO and the u-boot.img.
If you want to override the u-boot settings you can have a uEnv.txt file
there.  Also if you save the environment from within u-boot it will end
up as a file in the boot partition named uboot.env

I notice that the am335x-evm machine does not create a .wic image so you
will have to assemble the parts from the deploy dir.
Put MLO and u-boot.img in the boot partition
untar the rootfs tar ball to the root partition
Put zImage and the short form *.dtbs in root partitions' /boot dir
untar the modules tar ball in the root partition.


> I'm copying MLO, zImage, u-boot.img, and am335x-boneblack.dtb to the
> BOOT (1st) partition of my uSD card. Then extracting
> core-image-minimal-beaglebone.tar.xz -C to the ROOT (2nd) partition of
> my uSD card. This works fine when using meta-yocto-bsp, but not with
> meta-ti. So, if anyone can help me understand what the different steps
> are between using the two different layers, I'd greatly appreciate it.
> Spent several days trying to figure this out so far.
> 
> Thanks in advance,
> Leo
> 
> 

Denys,

The beaglebone machine creates a much smaller MLO (~75K vs 109K) and
u-boot.img.
When you boot the image the SPL just spits out the message above over
and over.  It never gets to u-boot.

To reproduce I started with a clean clone of poky
added a clean clone of meta-ti
checked out rocko for both
. oe-*
edit conf/bblayers to take out yocto-bsp (for safty sake)
added meta-ti
built core-image-minimal for beaglebone machine.

Bill


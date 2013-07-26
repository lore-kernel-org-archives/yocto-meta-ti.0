Return-Path: <a.renault@kaptalia.com>
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E93DE014E4
	for <meta-ti@yoctoproject.org>; Fri, 26 Jul 2013 06:17:31 -0700 (PDT)
Received: from linux-krvt.localnet ([46.18.96.158])
	by mrelayeu.kundenserver.de (node=mreu4) with ESMTP (Nemesis)
	id 0LeFM9-1UJyY63qfN-00q919; Fri, 26 Jul 2013 15:17:28 +0200
From: "a.renault@kaptalia.com" <a.renault@kaptalia.com>
To: meta-ti@yoctoproject.org
Date: Fri, 26 Jul 2013 15:17:25 +0200
Message-ID: <4967548.gSMLmRAeV9@linux-krvt>
User-Agent: KMail/4.8.5 (Linux/3.4.47-2.38-desktop; KDE/4.8.5; i686; ; )
MIME-Version: 1.0
X-Provags-ID: V02:K0:PawM2gMcEs11uPZswNpbgEfFd2cLS6XxbVAAWAf9bIU
	Rkd1DpM2HBIpyr+z2HSOs0E3owAeahZIstcSAhWLSfpvbY2vMK
	PKD5zkisLVsPiQFGV9BGC37lGnXxjh+J+2pkBLhtFU1XaBsYxG
	cn5VlBvZs4k3g+6HbiIzugZz0CRAqG6oCrNXQYRmAHSKt2rsJS
	aCdl+QTBf1Pv+hUpMn8IYi5LK3zLvE+6NETxfZO14rJo0kdCP0
	9DayaAf9PdZyjcET/wpucfb/bFS9dlFSawpHOveWwb1GJ9Y3sH
	SVL0+MLO10A2w5c7KeOhGd16xdJsy4jbcjo1dnsLSWQbD4HZ9B
	3GTmHQ6Sayj1yoC0b18PuJSTa/BGk0ByZ1V+vXRAX
Subject: Build core-image-minimal on tdm3730
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
X-List-Received-Date: Fri, 26 Jul 2013 13:17:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi there, 
I already post this message this morning on #linux-omap but I have got no 
answer, so if you please I will test here.

I am trying to build core-image-minimal (OpenEmbedded/yocto) for my TechNexion 
TDM-3730 (http://www.technexion.com/index.php/products/arm-cpu-modules/ti-
dm3730/tdm-3730) CPU : TI Sitara DM3730@1Ghz, DSP Core TMS320C64x@800Mhz and 
POWERVG SGX 530

I read the CPU was omap3 compatible so I downloaded the meta-ti on 
http://layers.openembedded.org/layerindex/layer/meta-ti/ and tried to put 
"omap3evm" on the field MACHINE of local.conf.

The folder build/tmp-eglibc/deploy/images is now containing core-image-
minimal.rootfs.tar.gz, uImage, u-boot.bin and MLO  but when I tried to install 
them on my board, I have got the next issue : 

Error: unrecognized/unsupported machine ID (r1 = 0x00000c78). Available 
machine support:ID (hex)	NAME 000005ff	OMAP3 EVM Please check your kernel 
config and/or bootloader.

I understand what happen but I don't know how to fix it. 

I also tried to build with MACHINE=am37x-evm, got the same issues.
am37x seams to be close to dm37x didn't it?

Did not tried TI Sitara AM3517 EVM.

Do you have any idea of what I should try to do. Did you know someone who 
succeed to build yocto on that card? 
I saw angstrom narcissus (http://narcissus.angstrom-distribution.org/) 
proposing to build a rootfs for dm3730-am3715-evm but all the selected package 
selected failed.




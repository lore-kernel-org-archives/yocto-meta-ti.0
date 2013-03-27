Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53A9DE014A2
	for <meta-ti@yoctoproject.org>; Wed, 27 Mar 2013 13:20:46 -0700 (PDT)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:37046 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UKwpx-00079F-9Q; Wed, 27 Mar 2013 16:20:45 -0400
Date: Wed, 27 Mar 2013 16:20:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Steven Grunza <grunzasr@comcast.net>
In-Reply-To: <51534E4B.60502@comcast.net>
Message-ID: <alpine.DEB.2.02.1303271617180.4283@oneiric>
References: <20130319172138.GQ32759@edge> <5148A9B4.5060702@comcast.net>
	<20130319182747.GH14761@denix.org> <5149C666.7040306@comcast.net>
	<20130320151759.GP14761@denix.org>
	<5149F665.9090204@comcast.net> <20130320175415.GW32759@edge>
	<5149FD74.3030906@comcast.net> <20130320182722.GX32759@edge>
	<alpine.DEB.2.02.1303201441410.28378@oneiric>
	<20130320185747.GY32759@edge>
	<alpine.DEB.2.02.1303201558250.18081@oneiric>
	<5151F315.3040900@comcast.net>
	<alpine.DEB.2.02.1303261715150.3036@oneiric>
	<5152628F.2020107@comcast.net>
	<alpine.DEB.2.02.1303271539250.3576@oneiric>
	<51534E4B.60502@comcast.net>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Is this the correct list for AM3517 EVM questions?
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
X-List-Received-Date: Wed, 27 Mar 2013 20:20:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 27 Mar 2013, Steven Grunza wrote:

> Wow!  You got the SD card?  The kit was supposed to come with a
> Windows CE and a Linux SD card but I didn't get either.  I was never
> able to get LogicPD support to send me the image, either.  They just
> kept pointing the the procedures spread all over the web on how to
> build the code.

  just to establish a foundation here, this is the result of booting
from the SD card that came with the board from logicpd:

=====start=====
...
218976 Bytes Read from MMC
Starting OS Bootloader from MMC...
Starting OS Bootloader...


U-Boot 2009.11 (Jan 22 2011 - 01:45:10)

OMAP34xx/35xx-GP ES1.0, CPU-OPP2 L3-165MHz
AM3517EVM Board + LPDDR/NAND
I2C:   ready
DRAM:  256 MB
NAND:  512 MiB
*** Warning - bad CRC or NAND, using default environment

In:    serial
Out:   serial
Err:   serial
Die ID #40be00010000000001685a2001015021
Net:   davinci_emac_initialize
Ethernet PHY: GENERIC @ 0x00
DaVinci EMAC
Hit any key to stop autoboot:  0
mmc1 is available
reading boot.scr

** Unable to read "boot.scr" from mmc 0:1 **
reading uImage

2308136 bytes read
Booting from mmc ...
## Booting kernel from Legacy Image at 82000000 ...
   Image Name:   Arago/2.6.32-psp03.00.01.06.sdk/
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2308072 Bytes =  2.2 MB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing
Linux.................................................................................................
Linux version 2.6.32 (schuyler_2@neo) (gcc version 4.3.3 (Sourcery G++
Lite 2009q1-203) ) #1 Tue Jan 25 16:18:32 CS1
CPU: ARMv7 Processor [411fc087] revision 7 (ARMv7), cr=10c53c7f
CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
Machine: OMAP3517/AM3517 EVM
Memory policy: ECC disabled, Data cache writeback
AM3517 ES3.1 (l2cache iva sgx neon isp )
SRAM: Mapped pa 0x40200000 to va 0xfe400000 size: 0x100000
Reserving 4194304 bytes SDRAM for VRAM
... snip ...

  and it does boot successfully (well, after i added the touchscreen
from one of my other kits). but clearly there's a build that works.
now all i have to do is figure out how to get the same result with
yocto and the meta-ti layer.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


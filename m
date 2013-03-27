Return-Path: <grunzasr@comcast.net>
Received: from qmta02.emeryville.ca.mail.comcast.net
	(qmta02.emeryville.ca.mail.comcast.net [76.96.30.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2299BE014A2
	for <meta-ti@yoctoproject.org>; Wed, 27 Mar 2013 13:34:23 -0700 (PDT)
Received: from omta10.emeryville.ca.mail.comcast.net ([76.96.30.28])
	by qmta02.emeryville.ca.mail.comcast.net with comcast
	id Gg7r1l0090cQ2SLA2kaN8W; Wed, 27 Mar 2013 20:34:22 +0000
Received: from [127.0.0.1] ([71.225.124.244])
	by omta10.emeryville.ca.mail.comcast.net with comcast
	id GkaL1l00h5GVvnK8WkaMrm; Wed, 27 Mar 2013 20:34:22 +0000
Message-ID: <51535802.8050804@comcast.net>
Date: Wed, 27 Mar 2013 16:35:14 -0400
From: Steven Grunza <grunzasr@comcast.net>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
CC: meta-ti mailing list <meta-ti@yoctoproject.org>
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
	<alpine.DEB.2.02.1303271617180.4283@oneiric>
In-Reply-To: <alpine.DEB.2.02.1303271617180.4283@oneiric>
X-Antivirus: avast! (VPS 130327-0, 03/27/2013), Outbound message
X-Antivirus-Status: Clean
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1364416462;
	bh=66DrKvOQvgsY9QJ1DyF5mGl0wWhwwJe+D6jGF6+UOwU=;
	h=Received:Received:Message-ID:Date:From:Reply-To:MIME-Version:
	Subject:Content-Type;
	b=XR/OblVTWcwXuKfcWWx9WpFVj06N6b+8KS5fDF6stuOWWMsCSyRmk/jgsm+Dn6Lq1
	/yMUk/51hnbQNb8tBHAz8k6HtsJ+diHuugZtGjFWX4LFWdUysv5LGhx09uXO4rgS8O
	v1i/Uz6fsdZ32H/2kw3OV9xG5PhvNAnckzWwSBVqZdERRNKbwZfRCDr0mfQqa5I0Ry
	goJV89LdgtaD130zKdf/+Hgn7zKfkCuiSeB71TImg3X0wqG4b0RMufXVXbdZ9Z6hPh
	lubUGMqK/59Unm101yuTGevvBQoG4uIJ8Ha6x4h09HwS8+dF2N21K87WJOiTA69XH2
	4/K/j/Z+r4/Zw==
Subject: Re: Is this the correct list for AM3517 EVM questions?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: grunzasr@comcast.net
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2013 20:34:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/2013 4:20 PM, Robert P. J. Day wrote:
> On Wed, 27 Mar 2013, Steven Grunza wrote:
>
>> Wow!  You got the SD card?  The kit was supposed to come with a
>> Windows CE and a Linux SD card but I didn't get either.  I was never
>> able to get LogicPD support to send me the image, either.  They just
>> kept pointing the the procedures spread all over the web on how to
>> build the code.
>    just to establish a foundation here, this is the result of booting
> from the SD card that came with the board from logicpd:
>
> =====start=====
> ...
> 218976 Bytes Read from MMC
> Starting OS Bootloader from MMC...
> Starting OS Bootloader...
>
>
> U-Boot 2009.11 (Jan 22 2011 - 01:45:10)
>
> OMAP34xx/35xx-GP ES1.0, CPU-OPP2 L3-165MHz
> AM3517EVM Board + LPDDR/NAND
> I2C:   ready
> DRAM:  256 MB
> NAND:  512 MiB
> *** Warning - bad CRC or NAND, using default environment
>
> In:    serial
> Out:   serial
> Err:   serial
> Die ID #40be00010000000001685a2001015021
> Net:   davinci_emac_initialize
> Ethernet PHY: GENERIC @ 0x00
> DaVinci EMAC
> Hit any key to stop autoboot:  0
> mmc1 is available
> reading boot.scr
>
> ** Unable to read "boot.scr" from mmc 0:1 **
> reading uImage
>
> 2308136 bytes read
> Booting from mmc ...
> ## Booting kernel from Legacy Image at 82000000 ...
>     Image Name:   Arago/2.6.32-psp03.00.01.06.sdk/
>     Image Type:   ARM Linux Kernel Image (uncompressed)
>     Data Size:    2308072 Bytes =  2.2 MB
>     Load Address: 80008000
>     Entry Point:  80008000
>     Verifying Checksum ... OK
>     Loading Kernel Image ... OK
> OK
>
> Starting kernel ...
>
> Uncompressing
> Linux.................................................................................................
> Linux version 2.6.32 (schuyler_2@neo) (gcc version 4.3.3 (Sourcery G++
> Lite 2009q1-203) ) #1 Tue Jan 25 16:18:32 CS1
> CPU: ARMv7 Processor [411fc087] revision 7 (ARMv7), cr=10c53c7f
> CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
> Machine: OMAP3517/AM3517 EVM
> Memory policy: ECC disabled, Data cache writeback
> AM3517 ES3.1 (l2cache iva sgx neon isp )
> SRAM: Mapped pa 0x40200000 to va 0xfe400000 size: 0x100000
> Reserving 4194304 bytes SDRAM for VRAM
> ... snip ...
>
>    and it does boot successfully (well, after i added the touchscreen
> from one of my other kits). but clearly there's a build that works.
> now all i have to do is figure out how to get the same result with
> yocto and the meta-ti layer.
>
> rday
>
Robert,
   Could you dd the SD card into a compressed image and send it to me?  
I might need to setup some sort of scp drop location if it's too big to 
email.  While I want to be able to build the code, I really need to get 
this robot done in time for the April competition...

Steven G.


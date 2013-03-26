Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3E79E0136C
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 14:19:00 -0700 (PDT)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:38554 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UKbGl-0000GD-9C; Tue, 26 Mar 2013 17:18:59 -0400
Date: Tue, 26 Mar 2013 17:18:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Steven Grunza <grunzasr@comcast.net>
In-Reply-To: <5151F315.3040900@comcast.net>
Message-ID: <alpine.DEB.2.02.1303261715150.3036@oneiric>
References: <20130319172138.GQ32759@edge> <5148A9B4.5060702@comcast.net>
	<20130319182747.GH14761@denix.org> <5149C666.7040306@comcast.net>
	<20130320151759.GP14761@denix.org>
	<5149F665.9090204@comcast.net> <20130320175415.GW32759@edge>
	<5149FD74.3030906@comcast.net> <20130320182722.GX32759@edge>
	<alpine.DEB.2.02.1303201441410.28378@oneiric>
	<20130320185747.GY32759@edge>
	<alpine.DEB.2.02.1303201558250.18081@oneiric>
	<5151F315.3040900@comcast.net>
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
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Tue, 26 Mar 2013 21:19:01 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-225790798-1364332739=:3036"

--8323329-225790798-1364332739=:3036
Content-Type: TEXT/PLAIN; charset=KOI8-R
Content-Transfer-Encoding: 8BIT

On Tue, 26 Mar 2013, Steven Grunza wrote:

... snip ...

> So the build finished and I loaded the files onto my SD card.š MLO,
> u-boot.img, and uImage onto the first partition.š I untarred the
> root file system onto the second partition.š This is the result on
> the serial console:
>
> 40X???H????????????ÓSPL 2011.12-dirty (Mar 21 2013 - 19:36:59)
> Texas Instruments Revision detection unimplemented
> OMAP SD/MMC: 0
> reading u-boot.img
> reading u-boot.img
>
>
> U-Boot 2011.12-dirty (Mar 21 2013 - 19:36:59)
>
> AM35XX-GP ES1.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 Mhz
> AM3517EVM Board + LPDDR/NAND
> I2C:šš ready
> DRAM:š 256 MiB
> NAND:š 512 MiB
> MMC:šš OMAP SD/MMC: 0
> *** Warning - bad CRC, using default environment
>
> In:ššš serial
> Out:šš serial
> Err:šš serial
> Die ID #1b7e0000000000000155daa60200c00f
> Hit any key to stop autoboot:š 0
> reading boot.scr
>
> ** Unable to read "boot.scr" from mmc 0:1 **
> reading uImage
>
> 3160284 bytes read
> Booting from mmc ...
> ## Booting kernel from Legacy Image at 82000000 ...
> šš Image Name:šš Linux-2.6.37
> šš Image Type:šš ARM Linux Kernel Image (uncompressed)
> šš Data Size:ššš 3160220 Bytes = 3 MiB
> šš Load Address: 80008000
> šš Entry Point:š 80008000
> šš Verifying Checksum ... OK
> šš Loading Kernel Image ... OK
> OK
>
> Starting kernel ...
>
> Did I miss a step?

  that was going to be my long weekend project ... are you saying it
just hung at that point?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323329-225790798-1364332739=:3036--

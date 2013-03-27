Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4A56E014A2
	for <meta-ti@yoctoproject.org>; Wed, 27 Mar 2013 12:40:31 -0700 (PDT)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:36094 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UKwD0-0004WR-Lc
	for meta-ti@yoctoproject.org; Wed, 27 Mar 2013 15:40:30 -0400
Date: Wed, 27 Mar 2013 15:40:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
In-Reply-To: <5152628F.2020107@comcast.net>
Message-ID: <alpine.DEB.2.02.1303271539250.3576@oneiric>
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
X-List-Received-Date: Wed, 27 Mar 2013 19:40:32 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-249125443-1364413230=:3576"

--8323329-249125443-1364413230=:3576
Content-Type: TEXT/PLAIN; charset=KOI8-R
Content-Transfer-Encoding: 8BIT

On Tue, 26 Mar 2013, Steven Grunza wrote:

... snip ...

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
>
>   that was going to be my long weekend project ... are you saying it
> just hung at that point?
>
> rday
>
> Yes.š Just hung. Here's a little more info on my system.š I changed
> the loadaddr environment variable to match the reported load address
> from u-boot reading the uImage file.š Saving the new value fixed the
> "*** Warning - bad CRC, using default environment" message.

  finally had time to test and had exactly the same result: "Starting
kernel ..." and ... hang.

  thoughts, anyone? i have the bootable SD card that came with the kit
from logicpd so i'll try to identify some critical difference.

rday

p.s.  this is building a core-image-minimal for an am3517-evm.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323329-249125443-1364413230=:3576--

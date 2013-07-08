Return-Path: <trini@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AAC2EE01445
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 14:38:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r68LcN0L028686;
	Mon, 8 Jul 2013 16:38:23 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r68LcNO4027819;
	Mon, 8 Jul 2013 16:38:23 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 8 Jul 2013 16:38:23 -0500
Received: from [172.24.52.177] (h52-177.vpn.ti.com [172.24.52.177])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r68LcLnc032323;
	Mon, 8 Jul 2013 16:38:22 -0500
Message-ID: <51DB3180.5030706@ti.com>
Date: Mon, 8 Jul 2013 17:39:12 -0400
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.DEB.2.02.1307070755370.23001@oneiric>
	<20130708181457.GQ16630@bill-the-cat>
	<alpine.DEB.2.02.1307081427240.10955@oneiric>
	<20130708190716.GR16630@bill-the-cat>
	<alpine.DEB.2.02.1307081535070.12053@oneiric>
	<51DB242D.9070900@ti.com>
	<alpine.DEB.2.02.1307081648420.12420@oneiric>
In-Reply-To: <alpine.DEB.2.02.1307081648420.12420@oneiric>
X-Enigmail-Version: 1.5.1
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: proper recipe to build for BBB using the meta-ti layer?
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
X-List-Received-Date: Mon, 08 Jul 2013 21:38:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/08/2013 04:50 PM, Robert P. J. Day wrote:
> On Mon, 8 Jul 2013, Tom Rini wrote:
> 
>> On 07/08/2013 03:38 PM, Robert P. J. Day wrote:
> ... snip ...
>>>   i had time to do the following quick test. i took my working uSD
>>> card (with artifacts from the meta-beagleboard build), and simply
>>> flat-out replaced both the MLO and u-boot.img files in the FAT
>>> partition with the corresponding files from the meta-ti build, and got
>>> the error above.
>>>
>>>   i then copied back the original MLO and u-boot.img files and the
>>> boot worked just fine, so that validates that the card partitioning
>>> itself seems fine.
>>>
>>>   i'll just email you the two files in question, and you can see if
>>> you can boot to u-boot.
>>
>> The files both boot for me, on Beaglebone Black and White.
> 
>   then i'm baffled ... what recipe do you use to format the uSD card?
> and did you try booting with nothing but those two files on the card?
> no uImage, no uEnv.txt, etc?

I'm just using a by-hand partitioned card.  Can you please dd off a copy
of your card (so we can reproduce later) and then just zero, and then
create an MBR partition table, with the first partition table type c and
with the bootable flag set, mkfs.vfat it and copy the files in?

-- 
Tom


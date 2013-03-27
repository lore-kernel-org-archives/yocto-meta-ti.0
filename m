Return-Path: <grunzasr@comcast.net>
Received: from qmta02.westchester.pa.mail.comcast.net
	(qmta02.westchester.pa.mail.comcast.net [76.96.62.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4A92E014A2
	for <meta-ti@yoctoproject.org>; Wed, 27 Mar 2013 12:53:06 -0700 (PDT)
Received: from omta14.westchester.pa.mail.comcast.net ([76.96.62.60])
	by qmta02.westchester.pa.mail.comcast.net with comcast
	id Gb9Y1l00J1HzFnQ51jt5Nz; Wed, 27 Mar 2013 19:53:05 +0000
Received: from [127.0.0.1] ([71.225.124.244])
	by omta14.westchester.pa.mail.comcast.net with comcast
	id Gjt41l01W5GVvnK3ajt5uE; Wed, 27 Mar 2013 19:53:05 +0000
Message-ID: <51534E4B.60502@comcast.net>
Date: Wed, 27 Mar 2013 15:53:47 -0400
From: Steven Grunza <grunzasr@comcast.net>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
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
In-Reply-To: <alpine.DEB.2.02.1303271539250.3576@oneiric>
X-Antivirus: avast! (VPS 130326-1, 03/26/2013), Outbound message
X-Antivirus-Status: Clean
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1364413985;
	bh=T3j9++TWMRz8tv58dA8oN5D/DrR+mbM/WYawLGAGMqs=;
	h=Received:Received:Message-ID:Date:From:Reply-To:MIME-Version:To:
	Subject:Content-Type;
	b=ZWONc+A/IFLNqIninyD6yG7xuABJYdnmpBdCeFdh/jbyaqkAoXyzaXlGCOOPt5Cs+
	H3L8qQvbCc7ZhQ/B1cymB2SlqOWnQ9kf2WJ/eaEB5xfWn1rzYmfTq7QHRjV5IN5PPD
	gHlPZwhNTlJHTgBhrxOfKKWrr+aq+nCpNbgMoFpoCJIc6RGNSGSWKvIYlPcfVmDKcA
	YBFHbSPV6JX1/ukyJvP4ULvUSW9RMLC10elIxORnCnJKDhpdaCwuHs1eZaBRyu1jpB
	3iQUKgnlR60t/0CX7ZDOq1/D3O8Z7ajwCqCmBHzZ81uqY1fdIvMqbyD3fCeUi8IU5h
	PbV8YWxHPdsDg==
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
X-List-Received-Date: Wed, 27 Mar 2013 19:53:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/2013 3:40 PM, Robert P. J. Day wrote:
> On Tue, 26 Mar 2013, Steven Grunza wrote:
>
> ... snip ...
>
>>     Image Name:   Linux-2.6.37
>>     Image Type:   ARM Linux Kernel Image (uncompressed)
>>     Data Size:    3160220 Bytes = 3 MiB
>>     Load Address: 80008000
>>     Entry Point:  80008000
>>     Verifying Checksum ... OK
>>     Loading Kernel Image ... OK
>> OK
>>
>> Starting kernel ...
>>
>> Did I miss a step?
>>
>>    that was going to be my long weekend project ... are you saying it
>> just hung at that point?
>>
>> rday
>>
>> Yes.  Just hung. Here's a little more info on my system.  I changed
>> the loadaddr environment variable to match the reported load address
>> from u-boot reading the uImage file.  Saving the new value fixed the
>> "*** Warning - bad CRC, using default environment" message.
>    finally had time to test and had exactly the same result: "Starting
> kernel ..." and ... hang.
>
>    thoughts, anyone? i have the bootable SD card that came with the kit
> from logicpd so i'll try to identify some critical difference.
>
> rday
>
> p.s.  this is building a core-image-minimal for an am3517-evm.
>
Wow!  You got the SD card?  The kit was supposed to come with a Windows 
CE and a Linux SD card but I didn't get either.  I was never able to get 
LogicPD support to send me the image, either.  They just kept pointing 
the the procedures spread all over the web on how to build the code.

I built core-image-base for the am3517-evm.


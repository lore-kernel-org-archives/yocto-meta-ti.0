Return-Path: <grunzasr@comcast.net>
Received: from qmta03.westchester.pa.mail.comcast.net
	(qmta03.westchester.pa.mail.comcast.net [76.96.62.32])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4A8BE006AD
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 11:08:53 -0700 (PDT)
Received: from omta12.westchester.pa.mail.comcast.net ([76.96.62.44])
	by qmta03.westchester.pa.mail.comcast.net with comcast
	id DMwQ1l0040xGWP853W8txo; Tue, 19 Mar 2013 18:08:53 +0000
Received: from [127.0.0.1] ([71.225.124.244])
	by omta12.westchester.pa.mail.comcast.net with comcast
	id DW8s1l0145GVvnK3YW8spt; Tue, 19 Mar 2013 18:08:53 +0000
Message-ID: <5148A9B4.5060702@comcast.net>
Date: Tue, 19 Mar 2013 14:08:52 -0400
From: Steven Grunza <grunzasr@comcast.net>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <514873B9.3020500@comcast.net> <20130319172138.GQ32759@edge>
In-Reply-To: <20130319172138.GQ32759@edge>
X-Antivirus: avast! (VPS 130319-0, 03/19/2013), Outbound message
X-Antivirus-Status: Clean
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1363716533;
	bh=/0U+1sCaYjg/DxZqn5K/0882tY6mu1R6fCYmWu7QFCs=;
	h=Received:Received:Message-ID:Date:From:Reply-To:MIME-Version:
	Subject:Content-Type;
	b=PROc+lMyZSA4+sSABez9KKI8MX7+SBcGPHVfrYgzdck0fxGpNexKyB/fAilV0Z8QK
	tiwUk4GcleqXhL85GdrFH63wX36QWkhlOnS4oUXWYsYk6pFnAiPHJECXJLAIUZ5/of
	TBvSvijl+xt8npxhcSQCwmD/yx7hAhIiG1Z8O5qGfp9XJiEj3d8/Jo6PWBa2ECfXvz
	Sbds/ZWxPX6oaepW7ow7P2FmFfg30h/GQaLfClQbxbKSOo+h+FC91uIHemCzsKr2vk
	wbFr6lBVd6x2RHByAP6McCE+B6OimMVaTWfOPFOZjkYzX0BMfFIwkadbiqpu3YyI3A
	2/M+dikUnmEdQ==
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
X-List-Received-Date: Tue, 19 Mar 2013 18:08:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/2013 1:21 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 19, 2013 at 10:18:33AM -0400, Steven Grunza wrote:
>> Hello,
>>    I have a LogicPD Zoom AM3517 experimenters board.  Is this the
>> correct list to ask questions about getting Yocto-based software
>> running on this board?
> Yes, this is one of the correct lists for asking questions about AM3517 board
> when used with the Yocto Project. :) As this is the mailing list for meta-ti,
> which is the official Texas Instruments BSP layer for OpenEmbedded-Core and
> the Yocto Project, and AM3517 is currently one of the supported platforms in
> meta-ti.
>
Wonderful.  Can someone point me to information so that I can build a 
system using the Yocto project and program an SD card with the necessary 
files to boot my board into Linux?

   With all of the S7 DIP switches in the off position (which the AM3517 
Development Kits User Manual indicates is the default boot from NAND) I 
don't get any output from the serial UART so my guess is that I've hosed 
the NAND.

   For debugging support I have a TI Stellaris LM3S8962 board which has 
the ability to act as a JTAG debugger to external hardware.  For 
software I have OpenOCD 0.6.1




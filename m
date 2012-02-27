Return-Path: <wmills@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AABBE0059B
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 09:06:10 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1RH69Qe011686;
	Mon, 27 Feb 2012 11:06:10 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1RH69Zp023206;
	Mon, 27 Feb 2012 11:06:09 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 27 Feb 2012 11:06:09 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q1RH698A001127;	Mon, 27 Feb 2012 11:06:09 -0600
Message-ID: <4F4BB801.3090108@ti.com>
Date: Mon, 27 Feb 2012 12:06:09 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>	<3BC330F9-CE58-4C4F-A473-B0F40D0A2777@dominion.thruhere.net>	<4F4BA9EE.8030908@balister.org>
	<3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
In-Reply-To: <3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: Building Yocto for Pandaboard
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2012 17:06:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/27/2012 11:19 AM, Koen Kooi wrote:
> Op 27 feb. 2012, om 17:06 heeft Philip Balister het volgende geschreven:
>
>> On 02/27/2012 03:50 AM, Koen Kooi wrote:
>>> Op 27 feb. 2012, om 09:26 heeft<Christian.Schulenberg@bmw.de>  <Christian.Schulenberg@bmw.de>  het volgende geschreven:
>>>
>>>> I already added to following line to my local.conf:
>>>>
>>>> BBMASK = ".*/meta-ti/recipes-misc/"
>>>>
>>>> which helps to bypass the first build problem. The next show stopper is building the boot loader (denx version of u-boot):
>>>>
>>>> clocks.c:415:13: internal compiler error: in decode_addr_const, at varasm.c:2632
>>>>
>>>> This seems to be a problem with the used version of gcc. I guess there are two ways to work around this: Use older version of gcc (4.5) or change compiler optimization from -Os to -O0. Unfortunately, neither can I find the right place to switch from gcc 4.6 to 4.5, nor the place to change compiler flags.
>>> Have you read the README in the meta-ti layer yet? That explains how to setup a working environment.
>> The README contains instructions for building Angstrom, which is not the
>> right answer for everyone trying to use meta-ti.
> Since the recipe in question break with gcc 4.6 and/or binutils 2.22 *and* you need SOC_FAMILY in overrides angstrom is the only "out of the box" option. Other routes will involve heavy patching. I agree that needs to be addressed, but it doesn't change the solution *right now*.
>
> And the instructions in the README set things for 'yocto', which is what people are asking for. If they asked for 'poky', that would be a totally different thing.

Denis or Koen:  Before today is over please modify the README.txt to 
describe where we are going and what is possible right now.  If Angstrom 
is the only thing possible right now it should say that until we can 
build with other layer stacks.  However it should also say that we are 
working toward a solution that will build with multiple layer stacks 
including poky.




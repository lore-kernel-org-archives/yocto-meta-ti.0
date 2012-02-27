Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34146E0059B
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 08:06:09 -0800 (PST)
Received: (qmail 16621 invoked by uid 1003); 27 Feb 2012 16:06:07 -0000
Received: from unknown (HELO ?192.168.1.104?)
	(philip@opensdr.com@71.171.23.138)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	27 Feb 2012 16:06:07 -0000
Message-ID: <4F4BA9EE.8030908@balister.org>
Date: Mon, 27 Feb 2012 11:06:06 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>
	<3BC330F9-CE58-4C4F-A473-B0F40D0A2777@dominion.thruhere.net>
In-Reply-To: <3BC330F9-CE58-4C4F-A473-B0F40D0A2777@dominion.thruhere.net>
X-Enigmail-Version: 1.1.2
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
X-List-Received-Date: Mon, 27 Feb 2012 16:06:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/27/2012 03:50 AM, Koen Kooi wrote:
> 
> Op 27 feb. 2012, om 09:26 heeft <Christian.Schulenberg@bmw.de> <Christian.Schulenberg@bmw.de> het volgende geschreven:
> 
>> I already added to following line to my local.conf:
>>  
>> BBMASK = ".*/meta-ti/recipes-misc/"
>>  
>> which helps to bypass the first build problem. The next show stopper is building the boot loader (denx version of u-boot):
>>  
>> clocks.c:415:13: internal compiler error: in decode_addr_const, at varasm.c:2632
>>  
>> This seems to be a problem with the used version of gcc. I guess there are two ways to work around this: Use older version of gcc (4.5) or change compiler optimization from -Os to -O0. Unfortunately, neither can I find the right place to switch from gcc 4.6 to 4.5, nor the place to change compiler flags.
> 
> Have you read the README in the meta-ti layer yet? That explains how to setup a working environment.

The README contains instructions for building Angstrom, which is not the
right answer for everyone trying to use meta-ti.

Philip


Return-Path: <koen@beagleboard.org>
Received: from mail-bw0-f48.google.com (mail-bw0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA09BE005BB
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 08:39:06 -0700 (PDT)
Received: by bkar19 with SMTP id r19so873477bka.35
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 08:39:05 -0700 (PDT)
Received: by 10.204.135.197 with SMTP id o5mr21108203bkt.37.1319557145059;
	Tue, 25 Oct 2011 08:39:05 -0700 (PDT)
Received: from [10.192.5.224] ([85.13.70.251])
	by mx.google.com with ESMTPS id k6sm28182804bkv.8.2011.10.25.08.38.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Oct 2011 08:39:03 -0700 (PDT)
Message-Id: <BF75755F-ECA9-4625-9568-1C3A5862BAE4@dominion.thruhere.net>
From: Koen Kooi <koen@beagleboard.org>
To: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
In-Reply-To: <4EA6AC7B.90809@ts.fujitsu.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Tue, 25 Oct 2011 17:39:00 +0200
References: <4EA1364A.8000605@ts.fujitsu.com>	<2599D0DD-7A48-409A-95A5-CDA103E7E974@dominion.thruhere.net>	<4EA5266C.4080002@ts.fujitsu.com>	<F51F67A3-60BD-4D93-9D45-25A1ADA36C54@dominion.thruhere.net>	<4EA52A6E.2090904@ts.fujitsu.com>	<A9FC6A94-E05C-4396-807B-A71CC08B9B40@dominion.thruhere.net>
	<20111024183727.GF9156@denix.org> <4EA6AC7B.90809@ts.fujitsu.com>
X-Mailer: Apple Mail (2.936)
X-Mailman-Approved-At: Tue, 25 Oct 2011 12:19:59 -0700
Cc: meta-ti@yoctoproject.org
Subject: Re: Building for TI 8148 EVM
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
X-List-Received-Date: Tue, 25 Oct 2011 15:39:07 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 25 okt 2011, om 14:32 heeft Rainer Koenig het volgende geschreven:

> Am 24.10.2011 20:37, schrieb Denys Dmytriyenko:
>
>>> In the mean time you should be able to get around it by doing  
>>> 'bitbake
>>> mesa-dri' manually.
>>
>> Yep, I can confirm this issue. I had it fixed locally by adding  
>> mesa-dri to
>> DEPENDS in xorg-xserver... Didn't have time to submit either a  
>> patch or a
>> bugreport though.
>
> Ok, with all the hints from this thread I was able to build an image.
> Testing on my DM8148 EVM wasn't that much of a success, image boots to
> console, but is lacking of the required (question: what do I need for
> this EVM, anyone from TI can tell me?) xorg-modules. /etc/X11/ 
> xorg.conf
> tries to load an intel driver which is definitely out of range for  
> this
> board. :-)
>
> How can I see from the logs what xserver/xorg-components were built  
> and
> how can I add the missing ones?

You need to ask your TI rep for a m3 firmware file. When you have that  
you need to build some syslink things to get your display working. I  
integrated it all a few months ago for a demo you probably have seen :)

I'm at a conference now, so I can't look up my notes for the exact  
sequence, but it starts with getting the magic firmware file.

regards,

Koen


Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64D49E004D2
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 08:53:44 -0800 (PST)
Received: (qmail 10227 invoked by uid 1003); 9 Feb 2012 16:53:43 -0000
Received: from unknown (HELO ?192.168.0.140?) (philip@opensdr.com@12.207.17.2)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	9 Feb 2012 16:53:43 -0000
Message-ID: <4F33FA16.4060402@balister.org>
Date: Thu, 09 Feb 2012 08:53:42 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: jfabernathy <jfabernathy@gmail.com>
References: <4F32F016.4020008@gmail.com>
	<4F32F1B3.8090000@mlbassoc.com>	<4F32F31B.2000303@gmail.com>	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>	<4F32F59B.7010804@mlbassoc.com>	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>	<4F32F87E.2070907@mlbassoc.com>	<38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>	<7D46E86EC0A8354091174257B2FED10127667EB8@DLEE12.ent.ti.com>	<4F33C61E.5080505@gmail.com>	<4C3F7029-4844-4BA7-B378-BC30E27660F0@dominion.thruhere.net>	<1328801627.9968.32.camel@ted>
	<4F33F4A0.6010303@gmail.com>
In-Reply-To: <4F33F4A0.6010303@gmail.com>
X-Enigmail-Version: 1.1.2
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: building Yocto for Pandaboard
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
X-List-Received-Date: Thu, 09 Feb 2012 16:53:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/09/2012 08:30 AM, jfabernathy wrote:

...

>> Richard
>>
> When you look at Yocto project from a marketing point of view, which is
> not something the open source community usually concentrates on for
> obvious reasons, it would be a very positive message to be able to talk
> about, and demonstrate with examples of taking the same project and
> moving it from one architecture to another with minimal effort, as long
> as both architectures supported the key features like media playback
> acceleration, 3D, sound, HDMI, etc.
> 

Actually, at least some of us in the open source community pay close
attention to marketing.

> While hardware companies tend to cringe when you make it too easy to
> move back and forth, the reality is, if you have a high volume product
> you can't justify or afford to throw excess performance, thermals,
> power, and cost where it is not needed.  For example a cheap digital
> signage application that just throws advertisement, or menu data on the
> screen could be done with an ARM processor like OMP3/4, but if you had a
> higher end product that needed to do extensive video analytics for
> customer profiling and advertising effectiveness, you're going to want a
> Core i5/i7.  It would be of great benefit to take the Yocto project that
> did the digital sign on the ARM and quickly get it up and running on the
> Core i5 and then concentrate on the analytics application.
> 
> I think this portability is a better sell, if it's all Yocto.  We all
> know that really smart people can move around from different Linux
> versions and development methods, but it's an easier sale to a customer
> management when you say it can all be done on Yocto and that it's easily
> demonstrated.

Yocto is becoming a very overloaded word at the moment. But the key idea
is that we can focus on building out from oe-core to support our
products using the same tools, no matter what the product scale. From
very simple devices to products that resemble their desktop brothers.

Philip

> 
> JIm A
> 
>>
>>
>>
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 


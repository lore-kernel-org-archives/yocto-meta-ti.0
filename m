Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6215E00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 06:54:06 -0800 (PST)
Received: (qmail 31253 invoked by uid 1003); 27 Jan 2012 14:54:05 -0000
Received: from unknown (HELO ?192.168.1.104?)
	(philip@opensdr.com@96.240.160.175)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	27 Jan 2012 14:54:05 -0000
Message-ID: <4F22BA8C.2050300@balister.org>
Date: Fri, 27 Jan 2012 09:54:04 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>	<4F21D735.5000303@ti.com>	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
X-Enigmail-Version: 1.1.2
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from	arago	overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 14:54:07 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 01/27/2012 08:50 AM, Maupin, Chase wrote:
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> bounces@yoctoproject.org] On Behalf Of Koen Kooi
>> Sent: Friday, January 27, 2012 5:51 AM
>> To: meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from
>> arago overlay
>>
>>
>> Op 26 jan. 2012, om 23:44 heeft William Mills het volgende
>> geschreven:
>>
>>> On 01/26/2012 01:46 PM, Chase Maupin wrote:
>>>> * This package adds a simple web browser GUI application with
>>>>   no decorations used to display matrix on the local display.
>>>> * Ported from arago overlay
>>>>
>>>
>>> Sorry for hijacking your patch Chase but I have serious big
>> picture questions about all this stuff going into meta-ti and
>> especially all into one layer.
>>>
>>> meta-ti is suppose to be the TI specific stuff people need to
>> support their platforms regardless of what layer stack they are
>> using.  I understand we are not layer stack independent yet but
>> that needs to be the goal.  Certainly adding a whole bunch of non-
>> HW related stuff into the same layer is not going to move us any
>> closer.
>>>
>>> When we talked about where matrix belonged before there was
>> debate about meta-oe or meta-arago.  When did I miss the memo that
>> put it into meta-ti??
>>
>> Since meta-arago is supposed to be as empty as possible and matrix
>> doesn't play well with others it's a bad fit for both meta-arago
>> and meta-oe. Maybe we should split the meta-ti repo into 2 layers:
>> one for BSP things (including sgx, dsp, etc) and one for 'sdk'
>> things (matrix).
>> The idea is to keep reusable TI deliverables together without
>> forcing people to use arago. Putting matrix in meta-arago would
>> mean you can only use it with DISTRO=arago, which is a huge step
>> backwards from the current situation.
> 
> I think Koen got it right here.  We can split meta-ti, but I definitely don’t think matrix belongs in meta-arago.  As for meta-oe my thoughts are:
> 
> 1. As of now matrix is only maintained by TI and used by TI (and Koen to some extent) on our products.  So I would put this in a layer that we maintain because it would seem strange to me to have to go through another set of maintainers to update the SRCREV of the package we are developing.  Particularly if no one is using it.
> 2. If people wanted matrix they could still include our layer to get it.  If we see that happening a lot a there is a request from a group of people to have this then we could push it lower, but if we are the only ones using it and who care about it then I don't see the reason to move this lower in the layer stack.

What do the programs in question do?

Philip


> 
>>
>> regards,
>>
>> Koen
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 


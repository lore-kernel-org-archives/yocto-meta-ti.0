Return-Path: <ml@communistcode.co.uk>
Received: from eumx.net (eumx.net [91.82.101.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4995E00292
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2012 06:14:24 -0700 (PDT)
Received: from localhost ([127.0.0.1]:49972 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TO6yV-0004VX-2x; Tue, 16 Oct 2012 13:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=qtrZQhYYJksUJYWKzzH000FcuRs=; b=HnDrFzaAtkB/ygTb/5qZBllGCWW6
	ytooXvGkW59TRntfy4eBymZwmGrOhywe9l+siFZ9G43lDrQRlRmy7pA84XCN+nhH
	FaBLdnEpaipnMHL5icHOG3krQlmESlRl5YFqdkaf68Kxxe2+OGdZ/Vwu75zycUBE
	6p2EUAEoKji565A=
Received: from [195.171.99.130] (port=61556 helo=[192.168.0.75])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TO6yV-0004VU-0J; Tue, 16 Oct 2012 13:14:23 +0000
Message-ID: <507D5E1E.8070207@communistcode.co.uk>
Date: Tue, 16 Oct 2012 14:16:14 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <507C1073.3060703@communistcode.co.uk>
	<CA+M6bXmNfA8D0tpXb25C5jOKDgs6LsTeph=cdhNBo215S0xVsQ@mail.gmail.com>
	<507D1961.7080907@communistcode.co.uk>
	<20121016130010.GA5662@denix.org>
In-Reply-To: <20121016130010.GA5662@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: u-boot compile failure
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Oct 2012 13:14:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/12 14:00, Denys Dmytriyenko wrote:
> On Tue, Oct 16, 2012 at 09:22:57AM +0100, Jack Mitchell wrote:
>> On 16/10/12 02:20, Tom Rini wrote:
>>> On Mon, Oct 15, 2012 at 6:32 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>>>> It seems that u-boot is attempting to use GCC includes from my host system
>>>> here. This surely isn't right is it?
>>> There are host tools to build.  That said, from the log it looks like
>>> you have been trying to build this a few times.  If you bitbake -c
>>> clean u-boot do you still see the problem?
>>>
>> I get the error[1] after the -c clean.
>>
>> I think I know what it is, that I upgraded my host distro yesterday
>> which pulled in a new GCC and the old GCC libraries are still in the
>> path. However, bitbake shouldn't be going into the host system for
>> includes should it? Shouldn't it use it's own compiled GCC and
>> associated libraries to generate the u-boot tools rather than rely
>> on whatever is present on my host system, or am I missing something?
>> I'm pretty sure a reboot would sort it out but I didn't want to kill
>> a failure case.
> Jack,
>
> It's not u-boot that fails for you, it's u-boot-mkimage-native - it's a host
> tool to generate u-boot images, so it runs on your host and hence is built
> with your host compiler. OE/Yocto usually builds bunch of host tools and they
> have the "-native" suffix in their names. Upgradig your host system w/o
> switching profiles or changing paths is a common issue in such cases.
>

Ok, so when a package is labelled -native it is not only native in 
architecture but linked to the specific host?

This is just out of interest since I was unaware of the level of host 
intrusion on a build.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



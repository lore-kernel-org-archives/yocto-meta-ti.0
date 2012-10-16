Return-Path: <ml@communistcode.co.uk>
Received: from eumx.net (eumx.net [91.82.101.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BB92E0045D
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2012 06:52:50 -0700 (PDT)
Received: from localhost ([127.0.0.1]:36516 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TO7Zg-0005m6-Uo; Tue, 16 Oct 2012 13:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=8hrkXg8pxLxxr8h9YdwG17RANxg=; b=DJknfyOgNdDaWpBfIk+aFjH6EN7w
	ww4grLJvliYGAR0pWpNceFL6faQBOQZ0ZECIUOeUgPMDHQ2KSe8TpcBVauwa/Tr0
	TmWiHSpMJ9KOfASWA1Gndd1n5aK4MAGp3UHri1lT9TJzNrXXhirZ5oZA7AtPeWlk
	yl+hI1Rx39ocF2o=
Received: from [195.171.99.130] (port=36415 helo=[192.168.0.75])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TO7Zg-0005m3-SY; Tue, 16 Oct 2012 13:52:48 +0000
Message-ID: <507D6720.2010205@communistcode.co.uk>
Date: Tue, 16 Oct 2012 14:54:40 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <507C1073.3060703@communistcode.co.uk>
	<CA+M6bXmNfA8D0tpXb25C5jOKDgs6LsTeph=cdhNBo215S0xVsQ@mail.gmail.com>
	<507D1961.7080907@communistcode.co.uk>
	<20121016130010.GA5662@denix.org>
	<507D5E1E.8070207@communistcode.co.uk>
	<20121016133721.GB5662@denix.org>
In-Reply-To: <20121016133721.GB5662@denix.org>
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
X-List-Received-Date: Tue, 16 Oct 2012 13:52:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/12 14:37, Denys Dmytriyenko wrote:
> On Tue, Oct 16, 2012 at 02:16:14PM +0100, Jack Mitchell wrote:
>> On 16/10/12 14:00, Denys Dmytriyenko wrote:
>>> On Tue, Oct 16, 2012 at 09:22:57AM +0100, Jack Mitchell wrote:
>>>> On 16/10/12 02:20, Tom Rini wrote:
>>>>> On Mon, Oct 15, 2012 at 6:32 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>>>>>> It seems that u-boot is attempting to use GCC includes from my host system
>>>>>> here. This surely isn't right is it?
>>>>> There are host tools to build.  That said, from the log it looks like
>>>>> you have been trying to build this a few times.  If you bitbake -c
>>>>> clean u-boot do you still see the problem?
>>>>>
>>>> I get the error[1] after the -c clean.
>>>>
>>>> I think I know what it is, that I upgraded my host distro yesterday
>>>> which pulled in a new GCC and the old GCC libraries are still in the
>>>> path. However, bitbake shouldn't be going into the host system for
>>>> includes should it? Shouldn't it use it's own compiled GCC and
>>>> associated libraries to generate the u-boot tools rather than rely
>>>> on whatever is present on my host system, or am I missing something?
>>>> I'm pretty sure a reboot would sort it out but I didn't want to kill
>>>> a failure case.
>>> Jack,
>>>
>>> It's not u-boot that fails for you, it's u-boot-mkimage-native - it's a host
>>> tool to generate u-boot images, so it runs on your host and hence is built
>>> with your host compiler. OE/Yocto usually builds bunch of host tools and they
>>> have the "-native" suffix in their names. Upgradig your host system w/o
>>> switching profiles or changing paths is a common issue in such cases.
>>>
>> Ok, so when a package is labelled -native it is not only native in
>> architecture but linked to the specific host?
> Yes, because that code is used locally on the same host and only for the
> build. You don't ship that code, as it doesn't even get packaged anywhere -
> it gets populated in the sysroots and used for the builds.
>
> For something that you need to distribute/ship, that needs to run on a host,
> there's SDK with Canadian cross, where you get a complete separation and host
> binaries that are not linked to a specific host. Moreover, you can target
> 32bit x86 SDK host, while building it on a 64bit-only x86 build host. Those
> are marked with "-nativesdk" suffix instead.

Bingo, that answered every question I had lingering - even including the 
one about building different native for different architectures that I 
resisted asking! ;)

Thanks Denys - I'll get there eventually!

>
>> This is just out of interest since I was unaware of the level of
>> host intrusion on a build.


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2269E0032E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 09:30:52 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 3B1B1F8122E; Fri, 12 Oct 2012 10:30:52 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id B3956F81199;
	Fri, 12 Oct 2012 10:30:51 -0600 (MDT)
Message-ID: <507845D9.8040105@mlbassoc.com>
Date: Fri, 12 Oct 2012 10:31:21 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <507836EF.8050506@ti.com> <20121012153140.GG26956@edge>
	<50783E2F.4060204@ti.com> <20121012161944.GH26956@edge>
In-Reply-To: <20121012161944.GH26956@edge>
Subject: Re: No /sbin/init when deriving m7y own image
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
X-List-Received-Date: Fri, 12 Oct 2012 16:30:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-10-12 10:19, Denys Dmytriyenko wrote:
> On Fri, Oct 12, 2012 at 05:58:39PM +0200, Herv? Fache wrote:
>> On 10/12/2012 05:31 PM, Denys Dmytriyenko wrote:
>>> On Fri, Oct 12, 2012 at 05:27:43PM +0200, Herv? Fache wrote:
>>>> Hi guys,
>>>>
>>>> I am new to Poky and have created the following recipe:
>>>>      require recipes-graphics/images/core-image-x11.bb
>>>>      IMAGE_INSTALL += "omapdrmtest"
>>> Can you try adding to CORE_IMAGE_EXTRA_INSTALL instead of IMAGE_INSTALL?
>>>
>> Thanks a lot, that did it!
>
> I'm glad it worked for you.
>
> But I'm still baffled why IMAGE_INSTALL didn't work. The only 2 reasons I can
> see for that are:

Most likely case is a missing separator.  Since += adds no space, omapdrmtest
is being glued to whatever is already in that list, making the last two
packages go missing.  I'll bet that this also works:
   IMAGE_INSTALL += " omapdrmtest "

I always add those spaces since they are free :-)

>
> 1. If you made a typo and used '=' instead of '+=', which would re-assign
> IMAGE_INSTALL, instead of appending to it, losing its current value.
>
> 2. Or if you tried to append to IMAGE_INSTALL before loading the base image
> recipe with 'require' (effectively, swapping the 2 lines of your recipe) - in
> that case you'd append to an empty IMAGE_INSTALL first and inside the
> core-image class it uses conditional assignment to pre-set that variable with
> system defaults. But since you already assigned to it early on, it won't be
> populated with system defaults...
>
> Other than that, the example you showed above seems to work for me here...
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


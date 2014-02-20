Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76269E00575
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2014 02:29:40 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 6486AF811DC; Thu, 20 Feb 2014 03:29:39 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 6E64AF811D9;
	Thu, 20 Feb 2014 03:29:38 -0700 (MST)
Message-ID: <5305D913.9000108@mlbassoc.com>
Date: Thu, 20 Feb 2014 03:29:39 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <CA+ujt=q+j7sBLqCFaAwomZepAah2R-y7=bp_H38otNvBUNznyg@mail.gmail.com>	<CAMKF1spN2gOjTav18Qi+FObE+QxVohQ89KObNoQe-MgwX8=Trg@mail.gmail.com>	<530516AD.1050901@mlbassoc.com>
	<CAMKF1srGu+GU3kQtE6zmddpoak6+sk7nDLKKdRexTsec9nXfCg@mail.gmail.com>
In-Reply-To: <CAMKF1srGu+GU3kQtE6zmddpoak6+sk7nDLKKdRexTsec9nXfCg@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Subject: Re: Support for capemgr
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
X-List-Received-Date: Thu, 20 Feb 2014 10:29:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2014-02-19 13:45, Khem Raj wrote:
> On Wed, Feb 19, 2014 at 12:40 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> On 2014-02-19 13:31, Khem Raj wrote:
>>> On Wed, Feb 19, 2014 at 1:30 AM, Eric Seuret <eric.seuret@gmail.com> wrote:
>>>> I have been toying around with yocto and the meta-ti layer for my beaglebone
>>>> black and I am able to build and boot an image (I made core-image-basic).
>>>> However i don't seem to see the capemgr in my /sys/devices.
>>>
>>> may be you will have better luck trying kernel from meta-beagleboard
>>
>> Really?  That layer hasn't been updated since 2013-09-05... seems pretty dead to me.
>>
> 
> the upstream is here
> 
> https://github.com/koenkooi/meta-beagleboard/commits/master

That looks good, thanks.  When/why did it move from https://github.com/beagleboard/meta-beagleboard.git ?

Also, how does one deploy an image built with just Poky/Yocto + meta-beagleboard?
The images in the meta-beagleboard-extras all require Angstrom to build.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9226E0071E
	for <meta-ti@yoctoproject.org>; Wed, 19 Feb 2014 12:45:46 -0800 (PST)
Received: by mail-ie0-f169.google.com with SMTP id at1so644749iec.28
	for <meta-ti@yoctoproject.org>; Wed, 19 Feb 2014 12:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QXzjXX3qPFOrh5X+Oe5qo5bIqoq6nlc+wozNH7Ykxn8=;
	b=EHfZWscnptqBoKqOoCazQBIS4Kje+LVt5QWKPoA8Ik2Kw8OmjHvgfP4E8VpE4jrddO
	V9zqQjnH7VdISXVPwvO6RYz82pjiYwNxclCYdRCEWkSo0E9fblY1NlzKJ7xvv1HAXKpe
	4xapzJifJ1lAMGzAz2hjILXSkQBB7+MMLS6PkS1ft6PefuL3XxmFnCMwF9XJYl8XCT5e
	p3xvKTlbrf0be2Sw4OU5spzirUOuhJIuAbvwLCrIxa3T+J/6WN/Ly18Vs5kFPy8BIQyB
	7SZQtruzMUcZ+AYWloc+0BXe5WwYaIqjtjf5iA8GQsojx73c2BUoz0Fy+GCej/Kj9xsx
	/6tA==
X-Received: by 10.42.85.140 with SMTP id q12mr3296384icl.51.1392842746149;
	Wed, 19 Feb 2014 12:45:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Wed, 19 Feb 2014 12:45:16 -0800 (PST)
In-Reply-To: <530516AD.1050901@mlbassoc.com>
References: <CA+ujt=q+j7sBLqCFaAwomZepAah2R-y7=bp_H38otNvBUNznyg@mail.gmail.com>
	<CAMKF1spN2gOjTav18Qi+FObE+QxVohQ89KObNoQe-MgwX8=Trg@mail.gmail.com>
	<530516AD.1050901@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Feb 2014 12:45:16 -0800
Message-ID: <CAMKF1srGu+GU3kQtE6zmddpoak6+sk7nDLKKdRexTsec9nXfCg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Wed, 19 Feb 2014 20:45:47 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 19, 2014 at 12:40 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2014-02-19 13:31, Khem Raj wrote:
>> On Wed, Feb 19, 2014 at 1:30 AM, Eric Seuret <eric.seuret@gmail.com> wrote:
>>> I have been toying around with yocto and the meta-ti layer for my beaglebone
>>> black and I am able to build and boot an image (I made core-image-basic).
>>> However i don't seem to see the capemgr in my /sys/devices.
>>
>> may be you will have better luck trying kernel from meta-beagleboard
>
> Really?  That layer hasn't been updated since 2013-09-05... seems pretty dead to me.
>

the upstream is here

https://github.com/koenkooi/meta-beagleboard/commits/master



> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


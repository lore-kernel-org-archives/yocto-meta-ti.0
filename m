Return-Path: <b.hutchman@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF2C1E00998; Tue, 12 May 2015 07:20:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.hutchman[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 460E1E00982;
	Tue, 12 May 2015 07:20:24 -0700 (PDT)
Received: by oign205 with SMTP id n205so7006140oig.2;
	Tue, 12 May 2015 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8ZSO53eyeuHzw6t/CGwNMuXt+BUKH3DqMr9MKipYsgc=;
	b=QtztZBgyCvQqS0BRkx+h1A4ZxtLTlBlnHwgku8HMUTH4LMTY5ICb5d9Ej+rOeIb17t
	0pj2A4QvtzNYxfXUoY1t9zu1NI6vNPXaYjnXvjvCErkpRU3A0PdudsI4yGIKXNbFEeRK
	EZFP/TEPMSwKcz43St1lG6bXChLPKnR3HLsdOKJrHqaaY/DaJm8/4TW23AEkkw6Efy3a
	86ap1joSCExVXGq9YFOuIo14LjOWgVhpcDzd1Xjn9glwGfoUjWWd0k1XuybkPcvpyy2D
	K/K3hx0NEh46Mq3A5Lsxzjc1yI4fgGkPcJnBOx/67OsQKMvVWwMAQBmNcvEyQ9bVA9Q/
	zWuQ==
MIME-Version: 1.0
X-Received: by 10.182.28.106 with SMTP id a10mr12292756obh.55.1431440424151;
	Tue, 12 May 2015 07:20:24 -0700 (PDT)
Received: by 10.60.6.33 with HTTP; Tue, 12 May 2015 07:20:24 -0700 (PDT)
In-Reply-To: <5550FD98.1050507@windriver.com>
References: <ce604c0c1a1d4131a72119dbecb97ab2@ASTRO-EX1.Bensberg.de>
	<553F90A3.9070501@windriver.com>
	<82ac67a7e46e416dbabdda01c42fc89a@ASTRO-EX1.Bensberg.de>
	<553FD83A.6040407@windriver.com>
	<4f2d75bf33ac423ab064f754e0b67655@ASTRO-EX1.Bensberg.de>
	<5540DB34.6010102@windriver.com>
	<a01714e680f8470cb21bb0b52e66c91e@ASTRO-EX1.Bensberg.de>
	<55421DA2.9060909@windriver.com>
	<e134e69a27bd460a9da71929a7f78d9a@ASTRO-EX1.Bensberg.de>
	<554236CB.6000604@windriver.com>
	<CAFZh4h9oL7K-=Nxhy=GV0k31ZgnPQuhFLQ-r_fReSRk1ZRhk1g@mail.gmail.com>
	<5550FD98.1050507@windriver.com>
Date: Tue, 12 May 2015 10:20:24 -0400
Message-ID: <CAFZh4h-SqSVsG_HXrx3H=QfDs3DH5GoKmFCgwBgGq90+B4WB5A@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	=?UTF-8?B?U2NoYXVtbMO2ZmZlbCwgSmFu?= <J.Schaumloeffel@astro-kom.de>
Subject: Re: [yocto] Migration from 1.7.1 to 1.8 - kernel-abiversion missing
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
X-List-Received-Date: Tue, 12 May 2015 14:20:27 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 11, 2015 at 3:06 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 2015-05-11 02:10 PM, Brian Hutchinson wrote:
>>
>> On Thu, Apr 30, 2015 at 10:06 AM, Bruce Ashfield
>> <bruce.ashfield@windriver.com> wrote:
>>>
>>> It is plausible. But in theory, linux-dummy should still provide
>>> what you need (but since it doesn't build anything, there is
>>> no abi .. and no modules can be built against it) .. so the
>>> error isn't graceful.
>>>
>>> Bruce
>>
>>
>> I can confirm this same problem is happening to me.  I just updated
>> one of my builds from 1.7 to 1.8 and am also getting my rootfs to fail
>> due to no abi kernel version:
>
>
> We still have a race condition in the 1.8 branch for the population
> of the build-artifacts directory.
>
> If modules start building, they'll race against the population of the
> abiversion, and you may see that message.
>
> There's a proposed patch for master, but I don't think it is in
> fido yet.
>
> Bruce

Hi Bruce,

I did some searches and looks like there are a number of 'race'
condition fixes but it wasn't obvious which one I may need.  Is it
this one:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=02d0a003d603266114512160b209876199241e98

Regards,

Brian


Return-Path: <ebutera@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 271BBE00790; Thu, 25 Sep 2014 09:05:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.43 listed in list.dnswl.org]
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D51D7E0074B
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 09:05:14 -0700 (PDT)
Received: by mail-pa0-f43.google.com with SMTP id kx10so11306698pab.30
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=POohy84Nq9vg45PJI7kg2kDTflDt6nVSfUOF5jJReUU=;
	b=mLvqo2V3WqM7e9aFNTBI+RP+f24sZdzPLfOf745mNVBCkWlOYc39e73+Umv0GxpZMx
	KxTKxfgBK/PUgPWzQVSXIAxRK2zB2qeOVa83jQuW5Wi6PfRdmiACNlPCgLkMicsvp8xP
	4zvNopby+ANr/50FXGnhtVhYJcr+oexaBcyFJJF5cV7PWbL0SAX77gI/Fern7KmnoTpn
	pIna2+JJTOvlK0B3qqvJDSlE+rZQK1S4ImvJ072rCgQYA9W+A6jlSM2f/VtpD4fDrc4O
	d+gVWDJnCUiBdNG/AUpYLz95T0yRNnmrv43mF5jlktAH9wbhDoUY5RaC80+OLuQHZtXa
	wDgw==
MIME-Version: 1.0
X-Received: by 10.70.87.169 with SMTP id az9mr28437369pdb.63.1411661114157;
	Thu, 25 Sep 2014 09:05:14 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.70.54.70 with HTTP; Thu, 25 Sep 2014 09:05:14 -0700 (PDT)
In-Reply-To: <CAF+2n7SGhcgMgD0AXoQb1=WV+P=ZiP9UEYe8RfOr+VxmhUAZuQ@mail.gmail.com>
References: <CAF+2n7Tr+tqEq_R2cr0SuUQ8+PDB5tQKeCW2GLr=RW+-W35o_Q@mail.gmail.com>
	<CA+2YH7t7PVNKA6xT1QcCgGoPY_foe020_sxWk5dJYhmLqi8QYA@mail.gmail.com>
	<CAF+2n7QzdBhtZxJ6oi11KaUovc2PiWpN=Q4gBBm28tMjm3efXw@mail.gmail.com>
	<CA+2YH7uaRmXepsmmYXQQ8_UXzsOBnwo1QPxnCSf=xqU1s04Cew@mail.gmail.com>
	<CAF+2n7SGhcgMgD0AXoQb1=WV+P=ZiP9UEYe8RfOr+VxmhUAZuQ@mail.gmail.com>
Date: Thu, 25 Sep 2014 18:05:14 +0200
X-Google-Sender-Auth: LdyYLk5aRjDS4s90wEqN9apsYdc
Message-ID: <CA+2YH7t1ET1YK3-0LqmL65S954CJAb4ACeKKpw=PPnzvCBtOBw@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: Manuel Torres <manuel.torres.fernandez@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Video encoding on OMAP4430
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
X-List-Received-Date: Thu, 25 Sep 2014 16:05:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 25, 2014 at 5:57 PM, Manuel Torres
<manuel.torres.fernandez@gmail.com> wrote:
> Which console image should I build? The Arago or the Gumstix one?

The arago one, just to be sure you have a working setup.

(and btw you shouldn't have the gumstix one, because it's in gumstix-extras).

Enrico


> On Thu, Sep 25, 2014 at 5:33 PM, Enrico <ebutera@users.sourceforge.net>
> wrote:
>>
>> On Thu, Sep 25, 2014 at 4:31 PM, Manuel Torres
>> <manuel.torres.fernandez@gmail.com> wrote:
>> > First of all, thank you for taking the time to help me.
>> >
>> > Now, back on topic: should I download the "meta-arago-extras" layer?
>> > That is
>> > what I found on Google when I searched for "gst-plugins-ducati".
>>
>> You should just follow the steps to build latest arago, build a simple
>> console-image and if everything is ok you can go on building gstreamer
>> and the ducati plugin.
>> You will need meta-gumstix of course.


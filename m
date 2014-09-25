Return-Path: <ebutera@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66288E0087E; Thu, 25 Sep 2014 08:33:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 085F4E0087C
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 08:33:56 -0700 (PDT)
Received: by mail-pd0-f178.google.com with SMTP id ft15so10769601pdb.23
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 08:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=YnaVjhU7od570yiDE4U7EGEBKq4hFvIhle9fBa9wH8I=;
	b=RusB5hduzUq9X8cHKEGUSPmIpOUNEaR85OYzixna4gblJZvS2k2DF/z9UH5Z7iiX1+
	jLob9O0phHNQ6P9NxyOqTSHQOB9fE6kTKqoMq4VdFd5ezYH8InPU6iWX2AozGgQKGgOl
	5Yg9x08yLsJ7SvV1Jj7gn3E0cA5epLhYKtrLGkuHIAw6hgJ491acZPkUfrt1klVp4aDG
	a4dCEG0pe3gN4iHxL5B1bT4PvyscWl8dXsgBEfEDvtgycWD4wcBA3AlT2aje4nRKSXkm
	rhy/b1JHbMsRhDxGYleUuNv31sWnGAG8NQw4Um8b2nrmOeQz673grkZSmQbt8HgKJ0Qt
	CeDg==
MIME-Version: 1.0
X-Received: by 10.68.133.170 with SMTP id pd10mr20389174pbb.83.1411659235714; 
	Thu, 25 Sep 2014 08:33:55 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.70.54.70 with HTTP; Thu, 25 Sep 2014 08:33:55 -0700 (PDT)
In-Reply-To: <CAF+2n7QzdBhtZxJ6oi11KaUovc2PiWpN=Q4gBBm28tMjm3efXw@mail.gmail.com>
References: <CAF+2n7Tr+tqEq_R2cr0SuUQ8+PDB5tQKeCW2GLr=RW+-W35o_Q@mail.gmail.com>
	<CA+2YH7t7PVNKA6xT1QcCgGoPY_foe020_sxWk5dJYhmLqi8QYA@mail.gmail.com>
	<CAF+2n7QzdBhtZxJ6oi11KaUovc2PiWpN=Q4gBBm28tMjm3efXw@mail.gmail.com>
Date: Thu, 25 Sep 2014 17:33:55 +0200
X-Google-Sender-Auth: dNvpI7EebLHGkyPmZfwPOlL-jyM
Message-ID: <CA+2YH7uaRmXepsmmYXQQ8_UXzsOBnwo1QPxnCSf=xqU1s04Cew@mail.gmail.com>
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
X-List-Received-Date: Thu, 25 Sep 2014 15:33:58 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 25, 2014 at 4:31 PM, Manuel Torres
<manuel.torres.fernandez@gmail.com> wrote:
> First of all, thank you for taking the time to help me.
>
> Now, back on topic: should I download the "meta-arago-extras" layer? That is
> what I found on Google when I searched for "gst-plugins-ducati".

You should just follow the steps to build latest arago, build a simple
console-image and if everything is ok you can go on building gstreamer
and the ducati plugin.
You will need meta-gumstix of course.

Enrico


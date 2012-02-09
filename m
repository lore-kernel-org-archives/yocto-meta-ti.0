Return-Path: <b.hutchman@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DB9FE00307
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 08:30:19 -0800 (PST)
Received: by bkcjm1 with SMTP id jm1so2157031bkc.35
	for <meta-ti@yoctoproject.org>; Thu, 09 Feb 2012 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aIrgpcrA4NR10h0hGOtJQ2gYmvyqRI594z1B6f81veg=;
	b=XHGhN+GSkv6EvlJTKF39NBQwoMrjszjONpcqtw4d56cBbrL9EI96pfRmD9GdypVdUV
	Bw/GUnKwOTuyhronFytWQZeltVbmi+DI7Rf9ZiUil9h4ODFKLZSnoTrhAoQ5/B15CY9n
	NB7WpuroybulwU36pPo6JLm1lBh/BvBdBOOq8=
MIME-Version: 1.0
Received: by 10.205.133.133 with SMTP id hy5mr1054182bkc.94.1328805018247;
	Thu, 09 Feb 2012 08:30:18 -0800 (PST)
Received: by 10.205.141.203 with HTTP; Thu, 9 Feb 2012 08:30:18 -0800 (PST)
In-Reply-To: <4F33F01E.2000601@communistcode.co.uk>
References: <4F33F01E.2000601@communistcode.co.uk>
Date: Thu, 9 Feb 2012 11:30:18 -0500
Message-ID: <CAFZh4h-2sWHUGcBW-y--tw+QFaLeNAiFmnm43bh7NFNvqMwdzg@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: meta-ti@yoctoproject.org
Subject: Re: Beaglebone kernel/u-boot/userspace
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
X-List-Received-Date: Thu, 09 Feb 2012 16:30:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've not seen anything like you describe but I can say that I recently
checked out master and didn't do anything different to it and was able
to build a core-image-base for BeagleBoard just fine without having to
mess with any other layers.

It is my understanding that you only have to mess with meta-ti if you
are working with TI processors other than what is on the BeagleBoard.

Regards,

Brian


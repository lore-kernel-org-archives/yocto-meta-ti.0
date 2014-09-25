Return-Path: <ebutera@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 990F0E0086E; Thu, 25 Sep 2014 05:57:33 -0700 (PDT)
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
	*      [209.85.192.171 listed in list.dnswl.org]
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2C4FE0086A
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 05:57:30 -0700 (PDT)
Received: by mail-pd0-f171.google.com with SMTP id y13so10715572pdi.2
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 05:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=gxi1RowPeg7daQUbIJFbdrNJ0XLEvFNbMF9Xds5O+iA=;
	b=L4zILALkoKWbs23onsu4enQB8Jh5FhBT3y3mC5njtr9kOERx/FqADyLFnWfT5/0S7L
	bAGtTTa4eVGxVOYNpdVZV3hFHptNJjDqDc672eiP5rW6MXQEm1LoUFJGitZ/cKTQxLNA
	V8losM07ZzwQnqwpfDDwwrjZFI0C+MUcE5n2uuYatJ01SBjDIdBhczHPeKINxKuzA+Yk
	cVZttZBgybriXww8nYA/aF8DdqVShIRfhiH7GbIXzrgS+K0U19OqMaYwxJxQhKa1zA+d
	JuQQYknsEEaO23gy3udjAUa1bIncI8m0rF7fdMfSG1CO8sKDZ+OUx/agAL5IfWy3JVBb
	MDmg==
MIME-Version: 1.0
X-Received: by 10.68.133.170 with SMTP id pd10mr18856945pbb.83.1411649849806; 
	Thu, 25 Sep 2014 05:57:29 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.70.54.70 with HTTP; Thu, 25 Sep 2014 05:57:29 -0700 (PDT)
In-Reply-To: <CAF+2n7Tr+tqEq_R2cr0SuUQ8+PDB5tQKeCW2GLr=RW+-W35o_Q@mail.gmail.com>
References: <CAF+2n7Tr+tqEq_R2cr0SuUQ8+PDB5tQKeCW2GLr=RW+-W35o_Q@mail.gmail.com>
Date: Thu, 25 Sep 2014 14:57:29 +0200
X-Google-Sender-Auth: EnjmJk8zWknSA3Y7r18_eHQx8_Y
Message-ID: <CA+2YH7t7PVNKA6xT1QcCgGoPY_foe020_sxWk5dJYhmLqi8QYA@mail.gmail.com>
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
X-List-Received-Date: Thu, 25 Sep 2014 12:57:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 24, 2014 at 10:53 AM, Manuel Torres
<manuel.torres.fernandez@gmail.com> wrote:
> Hello everyone,
>
> I am using a Gumstix Duovero Zephyr, which is based on OMAP4430, and I would
> like to use the OMAP video encoding capabilities.
>
> I got this working with a Gumstix Overo IronStorm by adding "gstreamer-ti"
> to the image recipe but, if I run this target with "duovero" as machine, I
> get the following error:

gstreamer-ti is the recipe for omap3/dm3xx platforms, with omap4 you
should use gst-plugins-ducati but i don't know if it has been tested
on omap4 and/or omap5.

Enrico

